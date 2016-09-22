package com.fiternity.events.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import com.fiternity.servicecontroller.FileUploderUtil;
import com.fiternity.servicecontroller.MailSenderUtil;
import com.fiternity.serviceimpl.FiternityServiceImpl;
import com.liferay.portal.kernel.cache.PortalCache;
import com.liferay.portal.kernel.cache.SingleVMPoolUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.User;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;
import com.liferay.util.portlet.PortletProps;



/**
 * EventsController is controller class for events portlet. This class allows us to list, add, edit or get their details.
 * 
 * EventsController can be accessed by user who are all have roles like administrator, Site Admin, Studio Owner or Events Manager.
 * 
 * All methods functionality is determined. So while executing, it has some restrictions on parameters.
 *  
 * Attempting to add or edit an ineligible object throws an unchecked exception, typically SQLGrammerException or NumberFormatException.
 * 
 * Attempting to query the presence of an ineligible data may throw an exception, or it may simply return false, or an empty value.
 */
@Controller(value = "EventsController")
@RequestMapping("VIEW")
public class EventsController {
	private static final Log _log = LogFactoryUtil.getLog(EventsController.class.getName());
	public static final String STUDIO_OWNER_ROLE=PortletProps.get("role.studioowner");
	public static final String ADMIN_ROLE=PortletProps.get("role.admin");
	public static final String SITE_ADMIN_ROLE=PortletProps.get("role.siteadmin");
	public static final String EVENTS_MANAGER_ROLE=PortletProps.get("role.eventsmanager");
	public static final String IMAGE_FOLDER_NAME=PortletProps.get("fiternity.image.foldername");
	//FiternityServiceImpl  fiternityServiceImpl=new FiternityServiceImpl();
	PortalCache<String, Serializable> cache = SingleVMPoolUtil.getCache("Fiternity");
	@Autowired      
	private FiternityService fiternityService;
	
	/**
	   * Returns events listing page with list of available events
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping
	public String showEvents(Model model, RenderRequest request, RenderResponse response) throws PortletException, SystemException
	{
		
		
		_log.info("this is show events method");
		User user1 = (User) request.getAttribute(WebKeys.USER);
	    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
		String jsonout=null,jsonstd=null;
		int pages=0, pageNo=1, listLength=0;
		PortletSession portletSession = request.getPortletSession();
		JSONArray ja=new JSONArray();
		JSONArray ja1=new JSONArray();
		JSONArray jaOwner=new JSONArray();
		
		try {
			
			if(cache.get("EventsPage") == null){
			jsonout = fiternityService.getActivityListing("0", "1", "ALL", "ALL");
			cache.put("EventsPage", (Serializable)jsonout);
	        _log.info("cache is "+(String)SingleVMPoolUtil.getCache("Fiternity").get("EventsPage"));
	       
			}
			if(cache.get("EventsPage") != null){
				pageNo  = ParamUtil.getInteger(request, "pageNo")==0?1:ParamUtil.getInteger(request, "pageNo");
				jsonout =cache.get("EventsPage").toString();
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
			_log.debug("Exception throws in events "+e.getMessage());
		}
		
		request.setAttribute("return", ja);
		request.setAttribute("jsonstd", jsonstd);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pages", pages);
		 _log.info(" current pages no. listing "+pageNo);
		return "events-listing";
		
	}
	
	/**
	   * It will be called when we search events and list the result in events listing page.
	   * 
	   * @param resourceRequest An object sent to the portlet to handle a resource.
	   * @param resourceResponse An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException throws runtime exception.
	   * @exception IOException It throws when IO operation has failed for some reason.
	   */
	@ResourceMapping(value = "eventListingResource")
	public void eventListingResource(ResourceRequest resourceRequest,ResourceResponse resourceResponse,Model model) throws UnknownException, IOException {
		_log.info("entered into event Search");
		String stdId =ParamUtil.getString(resourceRequest, "stdId");
		String eventType =ParamUtil.getString(resourceRequest, "eventType");
		String searchString =ParamUtil.getString(resourceRequest, "searchString","");
		if(searchString.equals("")){searchString="ALL";}
		
		_log.info( "stdId "+stdId);
		_log.info("eventType "+eventType);
		_log.info( "searchString "+searchString);
		
		String jsonout=null;
		try {
			jsonout = fiternityService.getActivityListing(stdId, "1", eventType, searchString);
			_log.info(" search resource is "+jsonout);
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws in events searching "+e.getMessage());
		}
		resourceResponse.getWriter().print(jsonout);

	}
	/**
	   * Renders add event page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException throws runtime exception.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=addEvent")
	public String renderAddEvent(Model model, RenderRequest request, RenderResponse response){
		String jsonout=null;
		try {
			jsonout = fiternityService.getStudiosListing();
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws in showing add event page "+e.getMessage());
		}
		request.setAttribute("return", jsonout);
		return "add-event";
		
	}
/*	@RenderMapping(params = "render=editEvent")
	public String editchallenge(Model model, RenderRequest request, RenderResponse response) throws PortletException
	{
	return "edit-event";
	}
	@ActionMapping(params = "action=showEditEvent")
	public void editchallenge(Model model, ActionRequest request, ActionResponse response) throws PortletException
	{
	String staId=	ParamUtil.getString(request, "staId" );
	_log.info("this is action method of edit record  "+staId);
	
	try {
		String output=fiternityService.getActivityDetails(staId);
		_log.info("the out put is "+output);
		request.setAttribute("return", output);
	} catch (Exception e) {	
		request.setAttribute("return","null" );
	}
   // response.setWindowState(WindowState.MAXIMIZED);
	 response.setRenderParameter("render", "editEvent");
	}*/
	
	/**
	   * Renders edit event page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException throws runtime exception.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=showEditEvent")
	public String renderEditEvent(Model model, RenderRequest request, RenderResponse response) throws PortletException
	{
	String staId=	ParamUtil.getString(request, "staId" );
	_log.info("we are going to show details of event with id  "+staId);
	
	try {
		String output=fiternityService.getActivityDetails(staId);
		_log.info("the out put is "+output);
		request.setAttribute("return", output);
	} catch (Exception e) {	
		request.setAttribute("return","null" );
		_log.debug("Exception throws in showing edit page "+e.getMessage());
	}
	return "edit-event";
	}
	
	/**
	   * It method will add new event by calling web services.
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
	@ActionMapping(params = "action=addEvent")
	public void doAddEvent(Model model, ActionRequest request,ActionResponse response) throws PortalException,SystemException,UnknownException,FileNotFoundException, java.text.ParseException
	{
		_log.info("we going to add new event");   //iconBadge,imageCover,fileButton0,fileArea0
		
		DateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(request);
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		Long groupId = themeDisplay.getLayout().getGroupId();
		JSONObject evntjson = new JSONObject();	
		String stdId  = ParamUtil.getString(request, "stdId","" );
		_log.info("the studio id of event to be added is  "+stdId);
		String stdName  = ParamUtil.getString(request, "stdNameHidden","" );
		String eveName  = ParamUtil.getString(request, "eveName","" );
		String eveDesc  = ParamUtil.getString(request, "eveDesc","" );
		String orgName  = ParamUtil.getString(request, "orgName","" );
		String eveAddr  = ParamUtil.getString(request, "eveAddr","" );
		String cheStatus  = ParamUtil.getString(request, "eveStatus","" );
		String createddate  =  dateformat.format(new Date());
		String modifieddate  =  dateformat.format(new Date());
		String eveLat  = ParamUtil.getString(request, "eveLat","0" );
		String eveLog  = ParamUtil.getString(request, "eveLog","0" );
		String eveLoc  = ParamUtil.getString(request, "eveLoc","" );
		String eveLink  = ParamUtil.getString(request, "eveLink","" );
		String eveFee  = ParamUtil.getString(request, "eveFee","0" );
		String evePoints  = ParamUtil.getString(request, "evePoints","0" );  //evePost
		evePoints=(String) (evePoints.equals("")?"0":evePoints);
		String evePost  = ParamUtil.getString(request, "evePost","0" );
		
		int staDay  = ParamUtil.getInteger(request, "staDay" ); 
		int staMonth  = ParamUtil.getInteger(request, "staMonth"); 
		int staYear  = ParamUtil.getInteger(request, "staYear" );
		
		int endDay  = ParamUtil.getInteger(request, "endDay" ); 
		int endMonth  = ParamUtil.getInteger(request, "endMonth"); 
		int endYear  = ParamUtil.getInteger(request, "endYear" );		

		int exDay  = ParamUtil.getInteger(request, "exDay" ); 
		int exMonth  = ParamUtil.getInteger(request, "exMonth"); 
		int exYear  = ParamUtil.getInteger(request, "exYear" );
		
		int staHour  = ParamUtil.getInteger(request, "staHour" ); 
		int staMin  = ParamUtil.getInteger(request, "staMin"); 
		int endHour  = ParamUtil.getInteger(request, "endHour" ); 
		int endMin  = ParamUtil.getInteger(request, "endMin"); 
		
		String imageCover1=uploadPortletRequest.getFileName("eveCover");
		File file4 = uploadPortletRequest.getFile("eveCover");
		String imageCover="null";
		if(!(imageCover1.isEmpty() || imageCover1.equals("null") )){
			imageCover  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file4,stdId+"_"+eveName+"_cover");
			}
		_log.info("the cover image is uploaded "+imageCover);
		
		String fileName1=uploadPortletRequest.getFileName("fileButton0");
		File file1 = uploadPortletRequest.getFile("fileButton0");
		String infIcon0="";
		try{
		if(!(fileName1.isEmpty() || fileName1.equals("null") )){
			infIcon0  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file1,stdId+"_"+eveName+"_inf1");
			}
		}
		catch(NullPointerException ne){ne.getStackTrace();}
		String infDesc0  = ParamUtil.getString(request, "fileArea0","null" );
		_log.info("the inf image is uploaded "+infIcon0);
		

		String fileName2=null;
		 fileName2=uploadPortletRequest.getFileName("fileButton1");
		File file2 = uploadPortletRequest.getFile("fileButton1");
		String infIcon1="";
		try{
		if(!( fileName2.isEmpty() || fileName2.trim().equals("null") )){  //||   fileName2.trim().equals("null")   "".trim().equals(fileName2)   fileName2.isEmpty()
			infIcon1  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file2,stdId+"_"+eveName+"_inf2");			
			}
		}
		catch(NullPointerException ne){ne.getStackTrace();}
		String infDesc1  = ParamUtil.getString(request, "fileArea1","null" );
		
		String fileName3 = ParamUtil.getString(uploadPortletRequest, "fileButton2","null");
		File file3 = uploadPortletRequest.getFile("fileButton2");
		String infIcon2="";
		try{
		if(!(fileName3.isEmpty() || fileName3.equals("null") )){
			infIcon2  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file3,stdId+"_"+eveName+"_inf3");
			}
		}
		catch(NullPointerException ne){ne.getStackTrace();}
		String infDesc2  = ParamUtil.getString(request, "fileArea2","null" );
		
		
		//String organizerCover = ParamUtil.getString(uploadPortletRequest, "orgIcon","null");
		String organizerCover=uploadPortletRequest.getFileName("orgIcon");
		
		File orgIcon = uploadPortletRequest.getFile("orgIcon");
		String orgIcon2="";
		
		System.out.println("gbsNFLHWFGOLDJF----------- SDFADFASDF  "+organizerCover);	
		try{
		if(!(organizerCover.isEmpty() || organizerCover.equals("null") )){
			orgIcon2  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,orgIcon,stdId+"_"+eveName+"_orgicon");
			System.out.println("gbsNFLHWFGOLDJF-----------"+orgIcon2);	
		}
		
		
		}
		catch(NullPointerException ne){ne.getStackTrace();}
		
		String infString="";
		if(!(infIcon0.equals("")))
		 infString=infIcon0+"~"+infDesc0;
		if(!(infIcon1.equals("")))
			infString=infString+"%"+infIcon1+"~"+infDesc1;
		if(!(infIcon2.equals(""))){
			infString=infString+"%"+infIcon2+"~"+infDesc2;
		}
		if(!(eveLog.equals("null") || eveLog.isEmpty() || eveLat.equals("null") || eveLat.isEmpty() || eveDesc.equals("null") || eveDesc.isEmpty() || eveName.equals("null") || eveName.isEmpty() || staDay==0 || endDay==0 || exDay==0 )){
			
			try{
			evntjson.put("STA_ID", "0");
			evntjson.put("STA_NAME", eveName);
			evntjson.put("STD_ID",stdId);
			evntjson.put("STA_DESCRIPTION",eveDesc );		
			evntjson.put("STA_START_DATE",staDay  + "/" +staMonth + "/" + staYear );
			evntjson.put("STA_EXPIRY_DATE", exDay  + "/" +exMonth + "/" + exYear );
			evntjson.put("STA_END_DATE",endDay   + "/" + endMonth+ "/" + endYear );
			evntjson.put("STA_CREATED_DATE",createddate );
			evntjson.put("STA_MODIFIED_DATE", modifieddate);
			evntjson.put("STA_UPDATED_BY","1");
			evntjson.put("STA_START_TIME", staHour+":"+staMin+":00" );
			evntjson.put("STA_END_TIME", endHour+":"+endMin+":00");
			
			evntjson.put("STA_GOAL_POINTS", evePoints);
			evntjson.put("STA_TYPE_ID", "1");
			evntjson.put("STA_IMAGE_URL",imageCover );		
			evntjson.put("STA_ADDRESS_LINE1", eveAddr);
			evntjson.put("STA_ADDRESS_LINE2", "");
			evntjson.put("STA_ADDRESS_LINE3", "");		
			evntjson.put("STA_TOWN", "");
			evntjson.put("STA_COUNTY", "");
			evntjson.put("STA_COUNTRY", "");
			
			evntjson.put("STA_POST_CODE",evePost);
			evntjson.put("STA_LATITUDE", eveLat);
			evntjson.put("STA_LONGITUDE", eveLog);
			evntjson.put("STA_LIKE_CNT", "0");
			evntjson.put("STA_PRICE", eveFee);
			evntjson.put("STA_EXTERNAL_LINK", eveLink);	
			evntjson.put("STA_LOCATION", eveLoc);
			evntjson.put("STA_INFLUENCER",infString);
			evntjson.put("STA_STATUS", cheStatus );
			evntjson.put("STA_SHORT_DESCRIPTION","");	
			evntjson.put("STA_BADGE_ID","");
			evntjson.put("STA_NO_OF_DAYS","0");
			evntjson.put("STA_COMPANY_NAME",orgName);
			evntjson.put("STA_COMPANY_LOGO",orgIcon2);
			
			_log.info("the inputs field of challenge before add is "+evntjson.toString());
			String output=fiternityService.addChallenge(evntjson.toString());
			_log.info("the response is "+output);
			JSONObject jo=new JSONObject(output);
			String cheId=jo.get("STA_ID").toString();
			cache.remove("EventsPage");
			if(Integer.valueOf(cheId)>0){
				
				/*User user1 = (User) request.getAttribute(WebKeys.USER);
				String toEmail=user1.getEmailAddress();
				MailSenderUtil.mailForEvent(groupId,toEmail,eveName,stdName);*/
				
				String toEmail="";
				long companyId = themeDisplay.getCompanyId();
				
				Role role = RoleLocalServiceUtil.getRole(companyId, ADMIN_ROLE);
				long roleid=role.getRoleId();
				 _log.info("the mail triggered to studio owner "+toEmail);
				List<User> users = UserLocalServiceUtil.getRoleUsers(roleid);
				for(User u:users){
					 toEmail=u.getEmailAddress();
					 _log.info("the mail triggered to admin "+toEmail);
					MailSenderUtil.mailForEvent(groupId,toEmail,eveName,stdName);					
				}
				 role = RoleLocalServiceUtil.getRole(companyId, SITE_ADMIN_ROLE);
				 roleid=role.getRoleId();
				 users = UserLocalServiceUtil.getRoleUsers(roleid);
				for(User u:users){
					 toEmail=u.getEmailAddress();
					 _log.info("the mail triggered to events manager "+toEmail);
					MailSenderUtil.mailForEvent(groupId,toEmail,eveName,stdName);
					
				}
				
				 role = RoleLocalServiceUtil.getRole(companyId, EVENTS_MANAGER_ROLE);
				 roleid=role.getRoleId();
				 users = UserLocalServiceUtil.getRoleUsers(roleid);
				for(User u:users){
					 toEmail=u.getEmailAddress();
					 _log.info("the mail triggered to events manager "+toEmail);
					MailSenderUtil.mailForEvent(groupId,toEmail,eveName,stdName);
					
				}
				
				 role = RoleLocalServiceUtil.getRole(companyId, STUDIO_OWNER_ROLE);
				 roleid=role.getRoleId();
				 users = UserLocalServiceUtil.getRoleUsers(roleid);
				 for(User u:users){
					 String studioOwnerId=	u.getExpandoBridge().getAttribute("stdId").toString();
					 if(stdId.equals(studioOwnerId)){
					 toEmail=u.getEmailAddress();
					 _log.info("the mail triggered to studio owner "+u.getFullName()+" mail id is "+toEmail);
					 MailSenderUtil.mailForEvent(groupId,toEmail,eveName,stdName);
					 	}
				}
				}

			
			}catch(Exception e){
				
				request.setAttribute("formerror",e.getMessage());
				request.setAttribute("stdId", stdId);
				request.setAttribute("eveName", eveName);
				request.setAttribute("eveDesc", eveDesc);
				request.setAttribute("eveLat", eveLat);
				request.setAttribute("eveLog", eveLog);
				request.setAttribute("eveLoc", eveLoc);
				request.setAttribute("eveAddr", eveAddr);
				request.setAttribute("eveLink", eveLink);
				request.setAttribute("eveFee", eveFee);
				request.setAttribute("evePost", evePost);
				request.setAttribute("evePoints", evePoints);
				request.setAttribute("staDay", staDay);
				request.setAttribute("staMonth", staMonth);
				request.setAttribute("staYear", staYear);
				request.setAttribute("exDay", exDay);
				request.setAttribute("exMonth", exDay);
				request.setAttribute("exYear", exYear);
				request.setAttribute("endDay", endDay);
				request.setAttribute("endMonth", endMonth);
				request.setAttribute("endYear", endYear);
				request.setAttribute("infIcon0", infIcon0);
				request.setAttribute("infDesc0", infDesc0);
				response.setRenderParameter("render", "addEvent");
				
			}
		}else{
			request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
			request.setAttribute("stdId", stdId);
			request.setAttribute("eveName", eveName);
			request.setAttribute("eveDesc", eveDesc);
			request.setAttribute("eveLat", eveLat);
			request.setAttribute("eveLog", eveLog);
			request.setAttribute("eveLoc", eveLoc);
			request.setAttribute("eveAddr", eveAddr);
			request.setAttribute("eveLink", eveLink);
			request.setAttribute("evePost", evePost);
			request.setAttribute("evePoints", evePoints);
			request.setAttribute("eveFee", eveFee);
			request.setAttribute("staDay", staDay);
			request.setAttribute("staMonth", staMonth);
			request.setAttribute("staYear", staYear);
			request.setAttribute("exDay", exDay);
			request.setAttribute("exMonth", exMonth);
			request.setAttribute("exYear", exYear);
			request.setAttribute("endDay", endDay);
			request.setAttribute("endMonth", endMonth);
			request.setAttribute("endDay", endDay);
			request.setAttribute("endMonth", endMonth);
			request.setAttribute("endDay", endDay);
			request.setAttribute("endMonth", endMonth);
			request.setAttribute("endYear", endYear);
			request.setAttribute("infIcon0", infIcon0);
			request.setAttribute("infDesc0", infDesc0);
			response.setRenderParameter("render", "addEvent");
			
		}
		
	}
	
	/**
	   * This method get all the details of existing event and update existing record in database based on given id.
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
	@ActionMapping(params = "action=editEvent")
	public void doEditEvent(Model model, ActionRequest request,ActionResponse response) throws PortalException,SystemException,UnknownException,FileNotFoundException, java.text.ParseException
	{
		_log.info("we going to update the event");   //iconBadge,imageCover,fileButton0,fileArea0
		
		DateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(request);
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		JSONObject evntjson = new JSONObject();	
		String stdId  = ParamUtil.getString(request, "stdId","" );
		String staId  = ParamUtil.getString(request, "staId","" );  
		String stdName  = ParamUtil.getString(request, "stdName","" );
		String eveName  = ParamUtil.getString(request, "eveName","" );
		String eveDesc  = ParamUtil.getString(request, "eveDesc","" );
		String eveAddr  = ParamUtil.getString(request, "eveAddr","" );
		String cheStatus  = ParamUtil.getString(request, "eveStatus","" );
		String createddate  =  dateformat.format(new Date());
		String modifieddate  =  dateformat.format(new Date());
		String eveLat  = ParamUtil.getString(request, "eveLat","0" );
		String eveLog  = ParamUtil.getString(request, "eveLog","0" );
		String eveLoc  = ParamUtil.getString(request, "eveLoc","" );
		String eveLink  = ParamUtil.getString(request, "eveLink","" );
		String eveFee  = ParamUtil.getString(request, "eveFee","0" );
		String evePoints  = ParamUtil.getString(request, "evePoints","0" );
		String evePost  = ParamUtil.getString(request, "evePost","0" );
		String infImg0  = ParamUtil.getString(request, "infImg0","" );
		String infImg1  = ParamUtil.getString(request, "infImg1","" );
		String infImg2  = ParamUtil.getString(request, "infImg2","" );
		String fileBox0  = ParamUtil.getString(request, "fileBox0","" );
		String fileBox1  = ParamUtil.getString(request, "fileBox1","" );
		String fileBox2  = ParamUtil.getString(request, "fileBox2","" );
		String imageCoverOld  = ParamUtil.getString(request, "imageCoverOld","" );
		String orgIconHidden  = ParamUtil.getString(request, "orgIconHidden","" ); 
		String eventType  = ParamUtil.getString(request, "eventType","" );
		

		int staDay  = ParamUtil.getInteger(request, "staDay" ); 
		int staMonth  = ParamUtil.getInteger(request, "staMonth"); 
		int staYear  = ParamUtil.getInteger(request, "staYear" );		

		int endDay  = ParamUtil.getInteger(request, "endDay" ); 
		int endMonth  = ParamUtil.getInteger(request, "endMonth"); 
		int endYear  = ParamUtil.getInteger(request, "endYear" );		

		int exDay  = ParamUtil.getInteger(request, "exDay" ); 
		int exMonth  = ParamUtil.getInteger(request, "exMonth"); 
		int exYear  = ParamUtil.getInteger(request, "exYear" );
		
		int staHour  = ParamUtil.getInteger(request, "staHour" ); 
		int staMin  = ParamUtil.getInteger(request, "staMin"); 
		int endHour  = ParamUtil.getInteger(request, "endHour" ); 
		int endMin  = ParamUtil.getInteger(request, "endMin"); 		
		
		String imageCover1=uploadPortletRequest.getFileName("eveCover");
		File file4 = uploadPortletRequest.getFile("eveCover");
		String imageCover=imageCoverOld;
		if(!(imageCover1.isEmpty() || imageCover1.equals("null") )){
			imageCover  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file4,stdId+"_"+eveName+"_cover");
		}
		
		String fileName1=uploadPortletRequest.getFileName("fileButton0");
		File file1 = uploadPortletRequest.getFile("fileButton0");
		String infIcon0=infImg0;
		try{
		if(!(fileName1.isEmpty() || fileName1.equals("null") )){
			infIcon0  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file1,stdId+"_"+eveName+"_inf1");
		}
		}
		catch(NullPointerException ne){ne.getStackTrace();}
		String infDesc0  = ParamUtil.getString(request, "fileArea0","" );
		
		String fileName2=null;
		 fileName2=uploadPortletRequest.getFileName("fileButton1");
		File file2 = uploadPortletRequest.getFile("fileButton1");
		String infIcon1=infImg1;
		try{
		if(!( fileName2.isEmpty() || fileName2.trim().equals("null") )){  //||   fileName2.trim().equals("null")   "".trim().equals(fileName2)   fileName2.isEmpty()
			infIcon1  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file2,stdId+"_"+eveName+"_inf2");
			
		}
		}
		catch(NullPointerException ne){ne.getStackTrace();}
		String infDesc1  = ParamUtil.getString(request, "fileArea1","" );
		
		

		String fileName3 = uploadPortletRequest.getFileName("fileButton2");
		File file3 = uploadPortletRequest.getFile("fileButton2");
		String infIcon2=infImg2;
		try{
		if(!(fileName3.isEmpty() || fileName3.equals("null") )){
			infIcon2  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file3,stdId+"_"+eveName+"_inf3");
		}}
		catch(NullPointerException ne){ne.getStackTrace();}
		String infDesc2  = ParamUtil.getString(request, "fileArea2","" );
		
		
		//String organizerCover = ParamUtil.getString(uploadPortletRequest, "orgIcon","null");
		String organizerCover=uploadPortletRequest.getFileName("orgIcon");		
		File orgIcon = uploadPortletRequest.getFile("orgIcon");
		String orgIcon2=orgIconHidden;	
		try{
		if(!(organizerCover.isEmpty() || organizerCover.equals("null") )){
			orgIcon2  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,orgIcon,stdId+"_"+eveName+"_orgicon");	
		}
		
		
		}
		catch(NullPointerException ne){ne.getStackTrace();}
		
		String infString="";
		if(!(infIcon0.equals("") || fileBox0.equals("")))
			infString=infIcon0+"~"+infDesc0;
		if(!(infIcon1.equals("") || fileBox1.equals("")))
			infString=infString+"%"+infIcon1+"~"+infDesc1;
		if(!(infIcon2.equals("")|| fileBox2.equals("") )){
			infString=infString+"%"+infIcon2+"~"+infDesc2;
		}

		if(!(eveLog.equals("null") || eveLog.isEmpty() || eveLat.equals("null") || eveLat.isEmpty() || eveDesc.equals("null") || eveDesc.isEmpty() || eveName.equals("null") || eveName.isEmpty() || staDay==0 || endDay==0 || exDay==0 )){
				
			try{
			evntjson.put("STA_ID", staId);
			evntjson.put("STA_NAME", eveName);
			evntjson.put("STD_ID",stdId);
			evntjson.put("STA_DESCRIPTION",eveDesc );		
			evntjson.put("STA_START_DATE",staDay  + "/" +staMonth + "/" + staYear );
			evntjson.put("STA_EXPIRY_DATE", exDay  + "/" +exMonth + "/" + exYear );
			evntjson.put("STA_END_DATE",endDay   + "/" + endMonth+ "/" + endYear );
			evntjson.put("STA_CREATED_DATE",createddate );
			evntjson.put("STA_MODIFIED_DATE", modifieddate);
			evntjson.put("STA_UPDATED_BY","1");
			evntjson.put("STA_START_TIME", staHour+":"+staMin+":00" );
			evntjson.put("STA_END_TIME", endHour+":"+endMin+":00");
			
			evntjson.put("STA_GOAL_POINTS", evePoints);
			evntjson.put("STA_TYPE_ID", "1");
			evntjson.put("STA_IMAGE_URL",imageCover );		
			evntjson.put("STA_ADDRESS_LINE1", eveAddr);
			evntjson.put("STA_ADDRESS_LINE2", "");
			evntjson.put("STA_ADDRESS_LINE3", "");		
			evntjson.put("STA_TOWN", "null");
			evntjson.put("STA_COUNTY", "");
			evntjson.put("STA_COUNTRY", "");
			evntjson.put("STA_POST_CODE", evePost);
			evntjson.put("STA_LATITUDE", eveLat);
			evntjson.put("STA_LONGITUDE", eveLog);
			evntjson.put("STA_LIKE_CNT", "0");
			evntjson.put("STA_PRICE", eveFee);
			evntjson.put("STA_EXTERNAL_LINK", eveLink);	
			evntjson.put("STA_LOCATION", eveLoc);
			evntjson.put("STA_INFLUENCER",infString);
			evntjson.put("STA_STATUS", cheStatus );
			evntjson.put("STA_SHORT_DESCRIPTION","");	
			evntjson.put("STA_BADGE_ID","");
			evntjson.put("STA_NO_OF_DAYS","0");
			
			if(eventType.equalsIgnoreCase("fiternity")){
			evntjson.put("STA_COMPANY_NAME",stdName);
			evntjson.put("STA_COMPANY_LOGO",orgIcon2);
			}
			else{
				evntjson.put("STA_COMPANY_NAME","");
				evntjson.put("STA_COMPANY_LOGO","");
				}
			
			
			_log.info("the events details before update is "+evntjson.toString());
			String output=fiternityService.editChallenge(evntjson.toString());
			cache.remove("EventsPage");
			_log.info("the response is "+output);
			
			}catch(Exception e){
				
				request.setAttribute("formerror",e.getMessage());
				response.setRenderParameter("staId", staId);
				response.setRenderParameter("render", "showEditEvent");
				
			}
		}else{
			request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
			response.setRenderParameter("staId", staId);
			response.setRenderParameter("render", "showEditEvent");			
		}
		
	}

}
