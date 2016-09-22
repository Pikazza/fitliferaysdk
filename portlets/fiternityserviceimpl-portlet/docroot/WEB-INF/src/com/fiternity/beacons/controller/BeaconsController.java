package com.fiternity.beacons.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Serializable;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.fiternity.UnknownException;
import com.fiternity.service.FiternityService;
import com.liferay.portal.kernel.cache.PortalCache;
import com.liferay.portal.kernel.cache.SingleVMPoolUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.User;
import com.liferay.portal.service.RoleLocalServiceUtil;

/**
 * BeaconsController is controller class for beacons portlet. This class allows us to add, edit, list or get their details.
 * 
 * BeaconsController can be accessed by user who are all have roles like administrator or Site Admin.
 * 
 * All methods functionality is determined. So while executing, it has some restrictions on parameters.
 *  
 * Attempting to add or edit an ineligible object throws an unchecked exception, typically SQLGrammerException or NumberFormatException.
 * 
 * Attempting to query the presence of an ineligible data may throw an exception, or it may simply return false, or an empty value.
 */

@Controller(value = "BeaconsController")
@RequestMapping("VIEW")
public class BeaconsController {
	private static final Log _log = LogFactoryUtil.getLog(BeaconsController.class.getName());
	//FiternityServiceImpl  fiternityServiceImpl=new FiternityServiceImpl();
	PortalCache<String, Serializable> cache = SingleVMPoolUtil.getCache("Fiternity");
	@Autowired      
	private FiternityService fiternityService;
	
	/**
	   * Returns beacons listing page with list of available beacons
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping
	public String showBeacons(Model model, RenderRequest request, RenderResponse response) throws PortletException, SystemException
	{		
		_log.info("this is show beacons method");
		User user1 = (User) request.getAttribute(WebKeys.USER);
	    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
		PortletSession portletSession = request.getPortletSession();
		String jsonout=null, jsonstd=null;
		int pages=0, pageNo=1,listLength=0;
		JSONArray ja=new JSONArray();
		JSONArray ja1=new JSONArray();
		JSONArray jaOwner=new JSONArray();
		
		try {
			
			if(cache.get("BeaconsPage") == null){
			jsonout = fiternityService.getBeaconsListing("ALL");
			cache.put("BeaconsPage", (Serializable)jsonout);
	        _log.info("cache is "+(String)SingleVMPoolUtil.getCache("Fiternity").get("BeaconsPage"));
	       
			}
			if(cache.get("BeaconsPage") != null){
				pageNo  = ParamUtil.getInteger(request, "pageNo")==0?1:ParamUtil.getInteger(request, "pageNo");
				jsonout =cache.get("BeaconsPage").toString();
				jsonstd = fiternityService.getStudiosListing();
				
				 if (roles.contains("Studio Owner")){
		                String stdId=portletSession.getAttribute("stdId", PortletSession.APPLICATION_SCOPE).toString();
		                JSONArray	 jaInter= new JSONArray(jsonout);
		                for(int n = 0; n < jaInter.length(); n++){
		            	    JSONObject stdlist = jaInter.getJSONObject(n);
		            	    	if(stdId.equals( stdlist.get("STD_ID").toString())){
		            	    		jaOwner.put(stdlist);
		            	  }  
		                }   
		                jsonout=jaOwner.toString();
		                }
				
				ja1=new JSONArray(jsonout);
				int index=(int) (((pageNo*50)-50));
				listLength=ja1.length();
				pages= (int) Math.ceil(listLength/50.0);
				
				
				for(int i=index;i<(index+50>listLength?listLength:index+50);i++){
				ja.put(ja1.getJSONObject(i));
				}
						
				_log.info("your cache is activated total page "+pages+" your pageno is " +pageNo +" content is  " +ja.toString() );
			}
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws in beacons listing "+e.getMessage());
		}		
		request.setAttribute("return", ja);
		request.setAttribute("jsonstd", jsonstd);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pages", pages);
		 _log.info("pages no "+pageNo);
		
		return "beacons-listing";
		
	}
	
	/**
	   * It will be called when we search beacons and list the result in beacons listing page.
	   * 
	   * @param resourceRequest An object sent to the portlet to handle a resource.
	   * @param resourceResponse An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException throws runtime exception.
	   * @exception IOException It throws when IO operation has failed for some reason.
	   */
	@ResourceMapping(value = "beaconListingResource")
	public void beaconListingResource(ResourceRequest resourceRequest,ResourceResponse resourceResponse,Model model) throws UnknownException, IOException {
		
		String searchString =ParamUtil.getString(resourceRequest, "searchString","");
		if(searchString.equals("")){searchString="ALL";}		
		_log.info( "entered into beacon searching with name of "+searchString);
		
		String jsonout=null;
		try {
			jsonout = fiternityService.getBeaconsListing(searchString);
			_log.info(" serve resource is "+jsonout);
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws in beacons searching "+e.getMessage());
		}
		resourceResponse.getWriter().print(jsonout);

		
			
	}
	
	 /**
	   * Renders edit beacon page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=showEditBeacon")
	public String renderEditBeacon(Model model, RenderRequest request, RenderResponse response) throws PortletException
	{
		String beaId=	ParamUtil.getString(request, "beaId" );
		String stdId=	ParamUtil.getString(request, "stdId" );
		_log.info("this is details page of beacon with beacon id "+beaId +" and studio id"+stdId);
		
		try {
			String output=fiternityService.getBeaconDetails(beaId, stdId);
			String stdlist=fiternityService.getStudiosListing();
			_log.info("the out put is "+output);
			request.setAttribute("return", output);
			request.setAttribute("stdlist", stdlist);
		} catch (Exception e) {	
			request.setAttribute("return","null" );
			request.setAttribute("stdlist","stdlist" );
			_log.debug("Exception throws while loading edit page "+e.getMessage());
		}
		return "edit-beacon";
	}
	
	 /**
	   * Renders add beacon page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=addBeacon")
	public String renderAddBeacon(Model model, RenderRequest request, RenderResponse response){
		String jsonout=null;
		try {
			jsonout = fiternityService.getStudiosListing();
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws while loading add page "+e.getMessage());
		}
		request.setAttribute("return", jsonout);
		return "add-beacon";
		
	}
	
	 /**
	   * It method will add new beacon by calling web services.
	   * 
	   * @param request An object sent to the portlet to handle a action.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @exception UnknownException A runtime exception.
	   * @exception FileNotFoundException It will throw when required file is not found.
	   * @exception ParseException A exception an it can occur when you fail to parse a Object.
	   */
	@ActionMapping(params = "action=addBeacon")
	public void doAddBeacon(Model model, ActionRequest request,ActionResponse response) throws PortalException,SystemException,UnknownException,FileNotFoundException, java.text.ParseException
	{
		JSONObject obj = new JSONObject();
		System.out.println(" beacon add page ");
		String beaId  = ParamUtil.getString(request, "beaId","" );
		String beaSite  = ParamUtil.getString(request, "beaSite","" );
		String stdName  = ParamUtil.getString(request, "stdName","" );
		String actype  = ParamUtil.getString(request, "actype","" );
		actype=actype.equals("EVENT")?"1":"2";
		String detype  = ParamUtil.getString(request, "detype","" ); 
		String beaStatus  = ParamUtil.getString(request, "beaStatus","" );
		if(!(beaSite.isEmpty() || beaId.isEmpty()  || stdName.isEmpty() || actype.isEmpty()  || detype.isEmpty() )){
			try{
		
				obj.put("BCON_ID", beaId);
				obj.put("BCON_SITE", beaSite);
				obj.put("BCON_STD_ID", stdName);
				obj.put("BCON_STA_TYPE_ID", actype);
				obj.put("BCON_DETECT_TYPE",detype );
				obj.put("BCON_STATUS", beaStatus);
				
				_log.info("the inputs field of beacon before add is "+obj.toString());
				String output=fiternityService.saveBeacon(obj.toString());
				_log.info("the response is "+output);
				cache.remove("BeaconsPage");
			}
			catch (Exception e) {
				request.setAttribute("formerror",e.getMessage() );
				response.setRenderParameter("render", "addBeacon");
			}
		
		_log.info("the entered beacon record is "+obj.toString());
		
	}
		else{
			request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
			response.setRenderParameter("render", "addBeacon");
			
		}	
	}
	
	/**
	   * this method get all the details of beacon and update existing record in database based on given id.
	   * 
	   * @param request An object sent to the portlet to handle a action.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @exception UnknownException A runtime exception.
	   * @exception FileNotFoundException It will throw when required file is not found.
	   * @exception ParseException A exception an it can occur when you fail to parse a Object.
	   */
	@ActionMapping(params = "action=editBeacon")
	public void doEditBeacon(Model model, ActionRequest request,ActionResponse response) throws PortalException,SystemException,UnknownException,FileNotFoundException, java.text.ParseException
	{
		JSONObject obj = new JSONObject();
		System.out.println(" beacon edit page ");
		String beaId  = ParamUtil.getString(request, "beaId","" );
		String beaSite  = ParamUtil.getString(request, "beaSite","" );
		String stdName  = ParamUtil.getString(request, "stdName","" );
		String actype  = ParamUtil.getString(request, "actype","" );
		actype=actype.equals("EVENT")?"1":"2";
		String detype  = ParamUtil.getString(request, "detype","" ); 
		String beaStatus  = ParamUtil.getString(request, "beaStatus","" );
		if(!(beaSite.isEmpty() || beaId.isEmpty() || stdName.isEmpty() ||  actype.isEmpty()  || detype.isEmpty() )){
			try{
		
				obj.put("BCON_ID", beaId);
				obj.put("BCON_SITE", beaSite);
				obj.put("BCON_STD_ID", stdName);
				obj.put("BCON_STA_TYPE_ID", actype);
				obj.put("BCON_DETECT_TYPE",detype );
				obj.put("BCON_STATUS", beaStatus);
				_log.info("the inputs field of beacon before edit is "+obj.toString());
				String output=fiternityService.saveBeacon(obj.toString());
				_log.info("the response is "+output);
				cache.remove("BeaconsPage");
			}
			catch (Exception e) {
				request.setAttribute("formerror",e.getMessage() );
				response.setRenderParameter("render", "showEditBeacon");
			}
		
		_log.info("the entered beacon record is "+obj.toString());
		
	}
		else{
			request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
			response.setRenderParameter("render", "showEditBeacon");
			
		}
	
	}
	
	
	
}
