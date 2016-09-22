package com.fiternity.customers.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Serializable;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
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
import com.fiternity.serviceimpl.FiternityServiceImpl;
import com.liferay.portal.kernel.cache.PortalCache;
import com.liferay.portal.kernel.cache.SingleVMPoolUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;


/**
 * CustomersController is controller class for customers portlet. This class allows us to  list , edit their status or get their details.
 * 
 * CustomersController can be accessed by user who are all have roles like administrator, Site Admin or Customers Manager.
 * 
 * All methods functionality is determined. So while executing, it has some restrictions on parameters.
 *  
 * Attempting to add or edit an ineligible object throws an unchecked exception, typically SQLGrammerException or NumberFormatException.
 * 
 * Attempting to query the presence of an ineligible data may throw an exception, or it may simply return false, or an empty value.
 */
@Controller(value = "CustomersController")
@RequestMapping("VIEW")
public class CustomersController  {
	private static final Log _log = LogFactoryUtil.getLog(CustomersController.class.getName());
	//FiternityServiceImpl  fiternityServiceImpl=new FiternityServiceImpl();
	PortalCache<String, Serializable> cache = SingleVMPoolUtil.getCache("Fiternity");
	@Autowired      
	private FiternityService fiternityService;
	
	
	 /**
	   * Returns customers listing page with list of available customers.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping
	public String showCustomers(Model model, RenderRequest request, RenderResponse response) throws PortletException
	{
		_log.info("this is show customers method");

		String jsonout=null;
		int pages=0,pageNo=1,listLength=0;
		JSONArray ja=new JSONArray();
		JSONArray ja1=new JSONArray();
		
		try {
			
			if(cache.get("CustomersPage") == null){
			jsonout = fiternityService.getCustomersListing("ALL");
			cache.put("CustomersPage", (Serializable)jsonout);
	        _log.info("cache is "+(String)SingleVMPoolUtil.getCache("Fiternity").get("CustomersPage"));
	        
	       
			}
			if(cache.get("CustomersPage") != null){
				pageNo  = ParamUtil.getInteger(request, "pageNo")==0?1:ParamUtil.getInteger(request, "pageNo");
				jsonout =cache.get("CustomersPage").toString();
				
				ja1=new JSONArray(jsonout);
				int index=(int) (((pageNo*50)-50));
				listLength=ja1.length();
				pages= (int) Math.ceil(listLength/50.0);
								
				for(int i=index;i<(index+50>listLength?listLength:index+50);i++){
				ja.put(ja1.getJSONObject(i));
				}
						
				_log.info("your cache is activated your page is " +pageNo +" content is  " +ja.toString() );
			}
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws in customers listing "+e.getMessage());
		}
		
		request.setAttribute("return", ja);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pages", pages);
		_log.info("pages no "+pageNo);
		 
		return "customers-listing";
		
		
	}
	
	/**
	   * It will be called when we search customers and list the result in customers listing page.
	   * 
	   * @param resourceRequest An object sent to the portlet to handle a resource.
	   * @param resourceResponse An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException throws runtime exception.
	   * @exception IOException It throws when IO operation has failed for some reason.
	   */
	@ResourceMapping(value = "customerListingResource")
	public void customerListingResource(ResourceRequest resourceRequest,ResourceResponse resourceResponse,Model model) throws UnknownException, IOException {
		
		
		
		_log.info("entered into customer searching");
		String searchString =ParamUtil.getString(resourceRequest, "searchString","");
		if(searchString.equals("")){searchString="ALL";}
		
		_log.info( "searchString "+searchString);
		
		String jsonout=null;
		try {
			jsonout = fiternityService.getCustomersListing(searchString);
			_log.info(" serve resource is "+jsonout);
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws in customer searching "+e.getMessage());
		}
		resourceResponse.getWriter().print(jsonout);

		
			
	}
	
/*	@RenderMapping(params = "render=editCustomer")
	public String editadvert(Model model, RenderRequest request, RenderResponse response) throws PortletException
	{
	return "edit-customer";
	}
	@ActionMapping(params = "action=showEditCustomer")
	public void editCustomer(Model model, ActionRequest request, ActionResponse response) throws PortletException
	{
	String ptyId=	ParamUtil.getString(request, "ptyId" );
	_log.info("this is action method of edit record  "+ptyId);
	
	try {
		
		String output=fiternityService.getCustomerDetails(ptyId);
		_log.info("the out put is "+output);
		request.setAttribute("return", output);
	} catch (Exception e) {	
		request.setAttribute("return","null" );
		_log.debug("Exception throws while editing customer "+e.getMessage());
	}
   // response.setWindowState(WindowState.MAXIMIZED);
	 response.setRenderParameter("render", "editCustomer");
	}*/
	
	/**
	   * Renders edit customer page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=showEditCustomer")
	public String renderEditCustomer(Model model, RenderRequest request, RenderResponse response) throws PortletException
	{
	String ptyId=	ParamUtil.getString(request, "ptyId" );
	_log.info("this is action method of edit record  "+ptyId);
	
	try {
		
		String output=fiternityService.getCustomerDetails(ptyId);
		_log.info("the out put is "+output);
		request.setAttribute("return", output);
	} catch (Exception e) {	
		request.setAttribute("return","null" );
		_log.debug("Exception throws while editing customer "+e.getMessage());
	}
   // response.setWindowState(WindowState.MAXIMIZED);
	return "edit-customer";
	}
	
	 /**
	   * this method get all the details of customer and update existing record in database based on given id.
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
	
	@ActionMapping(params = "action=editCustomer")
	public void doEditCustomer(Model model, ActionRequest request,ActionResponse response) throws PortalException,SystemException,UnknownException,FileNotFoundException, java.text.ParseException
	{
		_log.info("we going to edit advert");
		JSONObject party  = new JSONObject();
		String ptyId  = ParamUtil.getString(request, "ptyId","null" );
		String ptyStatus  = ParamUtil.getString(request, "ptyStatus","inactive");
		
		if(!(ptyId.equals("null") || ptyId.isEmpty()  )){	
			try{
				_log.info("try part");
				party.put("PTY_ID", ptyId);
				party.put("PTY_STATUS", ptyStatus);
			
			_log.info("input String is "+ party.toString());
			String output=fiternityService.editCustomerStatus(party.toString());
			_log.info("the response is "+output);;
			cache.remove("CustomersPage");
				
			}
			catch(Exception e){
				request.setAttribute("formerror", e.getMessage());
				response.setRenderParameter("ptyId", ptyId);
				response.setRenderParameter("render", "showEditCustomer");
			}
			
			}
		else{
			request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
			response.setRenderParameter("ptyId", ptyId);
			response.setRenderParameter("render", "showEditCustomer");
		}
		
 
	}

}
