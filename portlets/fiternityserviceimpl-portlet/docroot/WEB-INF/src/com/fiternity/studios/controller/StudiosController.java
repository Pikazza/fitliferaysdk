package com.fiternity.studios.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletMode;
import javax.portlet.PortletRequest;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;
import javax.portlet.WindowState;

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
import com.liferay.portal.kernel.cache.PortalCache;
import com.liferay.portal.kernel.cache.SingleVMPoolUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.LiferayPortletURL;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.User;
import com.liferay.portal.service.OrganizationLocalServiceUtil;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.PortletURLFactoryUtil;
import com.liferay.portlet.documentlibrary.DuplicateFileException;
import com.liferay.util.portlet.PortletProps;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;

/**
 * StudiosController is controller class for studios portlet. This class allows us to list, add, edit or get their details.
 * 
 * StudiosController can be accessed by user who are all have roles like administrator, Site Admin, Studio Owner or Studios Manager.
 * 
 * All methods functionality is determined.So while executing, it has some restrictions on parameters.
 *  
 * Attempting to add or edit an ineligible object throws an unchecked exception, typically SQLGrammerException or NumberFormatException.
 * 
 * Attempting to query the presence of an ineligible data may throw an exception, or it may simply return false, or an empty value.
 */

@Controller(value = "StudiosController")
@RequestMapping("VIEW")
public class StudiosController {
	
	private static final Log _log = LogFactoryUtil.getLog(StudiosController.class.getName());
	public static final String STUDIO_OWNER_ROLE=PortletProps.get("role.studioowner");
	public static final String ADMIN_ROLE=PortletProps.get("role.admin");
	public static final String SITE_ADMIN_ROLE=PortletProps.get("role.siteadmin");
	public static final String STUDIOS_MANAGER_ROLE=PortletProps.get("role.studiosmanager");
	public static final String IMAGE_FOLDER_NAME=PortletProps.get("fiternity.image.foldername");
	PortalCache<String, Serializable> cache = SingleVMPoolUtil.getCache("Fiternity");
	
	@Autowired      
	private FiternityService fiternityServiceImpl;
	
	
	/**
	   * Returns studios listing page with list of available studios.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping
	public String showStudios(Model model, RenderRequest request, RenderResponse response) throws PortletException, SystemException
	{
		_log.info("this is show studios method"); 
		User user1 = (User) request.getAttribute(WebKeys.USER);
	    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
	    PortletSession portletSession = request.getPortletSession();
		String jsonout=null;
		int pages=0, pageNo=1, listLength=0;
		JSONArray ja=new JSONArray();
		JSONArray ja1=new JSONArray();
		
		try {
			
			if(cache.get("StudiosPage") == null){
			jsonout = fiternityServiceImpl.getStudiosListing();
			cache.put("StudiosPage", (Serializable)jsonout);
	        _log.info("cache is "+(String)SingleVMPoolUtil.getCache("Fiternity").get("StudiosPage"));
			}
			if(cache.get("StudiosPage") != null){
				pageNo  = ParamUtil.getInteger(request, "pageNo")==0?1:ParamUtil.getInteger(request, "pageNo");
				jsonout =cache.get("StudiosPage").toString();
				
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
			_log.debug("Exception throws in studios "+e.getMessage());
		}
		
		request.setAttribute("return", ja);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pages", pages);
		 _log.info("pages no "+pageNo);
            
            if (roles.contains(STUDIO_OWNER_ROLE)){
                String stdId=portletSession.getAttribute("stdId", PortletSession.APPLICATION_SCOPE).toString();
                try {
            		String output=fiternityServiceImpl.getStudioDetails(stdId);
            		request.setAttribute("return", output);
            	} catch (Exception e) {	
            		request.setAttribute("return","null" );
            		_log.debug("Exception throws in studios owner details "+e.getMessage());
            	}
               // response.setWindowState(WindowState.MAXIMIZED);
                return "edit-studio";  
                }
            
            return "studios-listing";
            
	}
	
	/**
	   * Renders add studio page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=addStudio")
	public String renderAddStudio(Model model, RenderRequest request, RenderResponse response)
	{
		_log.info("add studio is running");
		request.setAttribute("formerror",request.getAttribute("formerror") );
		return "add-studio";
	}
	
	/**
	   * Renders edit studio page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=showeditStudio")
	public String renderEditStudio(Model model, RenderRequest request, RenderResponse response) throws PortletException
	{
	String stdId=	ParamUtil.getString(request, "stdid" );
	_log.info("this is action method of edit studio and the studio id is  "+stdId);
	
	try {
		String output=fiternityServiceImpl.getStudioDetails(stdId);
		request.setAttribute("return", output);
	} catch (Exception e) {	
		request.setAttribute("return","null" );
		_log.debug("Exception throws in showing details of studio "+e.getMessage());
	}
	return "edit-studio";
	}
	
	 /**
	   * It will be called when we search adverts and list the result in adverts listing page.
	   * 
	   * @param resourceRequest An object sent to the portlet to handle a resource.
	   * @param resourceResponse An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException throws runtime exception.
	   * @exception IOException It throws when IO operation has failed for some reason.
	   */
	@ResourceMapping(value = "studioListingResource")
	public void studioListingResource(ResourceRequest resourceRequest,ResourceResponse resourceResponse,Model model) throws UnknownException, IOException{
		_log.info("showing studio search results");
		String searchString =ParamUtil.getString(resourceRequest, "searchString"," ");
		if(searchString.equals("")){searchString=" ";}
		
		_log.info( "searchString "+searchString);
		
		String jsonout =cache.get("StudiosPage").toString();
		
			//jsonout = fiternityServiceImpl.studioSearch(searchString);
			//jsonout = fiternityServiceImpl.getStudiosListing();
			
			
			_log.info(" search resource is "+jsonout);
		
		resourceResponse.getWriter().print(jsonout);

	}
	
	/**
	   * This method will add new studio by calling web services.
	   * 
	   * @param request An object sent to the portlet to handle a action.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception PortalException The base class for all exceptions related to business logic.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @exception FileNotFoundException It will throw when required file is not found.
	   * @exception DuplicateFileException It will throw when uploading file is already exist.
	   */
	@ActionMapping(params = "action=addStudio")
	public void doAddStudios(Model model, ActionRequest request,ActionResponse response) throws FileNotFoundException ,SystemException, DuplicateFileException, PortalException
	{
		_log.info("this is addStudio action method");
		JSONObject stdprofjson=new JSONObject();
		DateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(request);
		String Stdname  = ParamUtil.getString(request, "Stdname","" );
		
		String fileName=uploadPortletRequest.getFileName("stdimage");
		File file = uploadPortletRequest.getFile("stdimage");
		String Stdimage="null";
		if(!(fileName.isEmpty())){
			Stdimage  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file,Stdname+"_cover");
		}
		String fileName1=uploadPortletRequest.getFileName("stdicon");	
		File file1 = uploadPortletRequest.getFile("stdicon");
		String  Stdicon="null";
		if(!(fileName1.isEmpty())){
			Stdicon  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file1,Stdname+"_icon");
		}
		String Stddesc  = ParamUtil.getString(request, "Stddesc","" ); 
		String Stdprodesc  = ParamUtil.getString(request, "Stdprodesc","" );
		String Stdaddr  =  ParamUtil.getString(request, "Stdaddr","" );
		String Stdtown  = ParamUtil.getString(request, "Stdtown","" );
		String Stdcounty  =ParamUtil.getString(request, "Stdcounty","" ) ;
		String Stdcountry  =ParamUtil.getString(request, "Stdcountry","" );
		String Stdpost  = ParamUtil.getString(request, "Stdpost","" ); ;
		String Stdbilladdr  = ParamUtil.getString(request, "Stdbilladdr","" );
		String Stdbilltown  = ParamUtil.getString(request, "Stdbilltown","" );
		String Stdbillcounty  =ParamUtil.getString(request, "Stdbillcounty","" ) ;
		String Stdbillcountry  = ParamUtil.getString(request, "Stdbillcountry","" );
		String Stdbillpost  =ParamUtil.getString(request, "Stdbillpost","" ) ;
		String Stdhouseno  = ParamUtil.getString(request, "Stdhouseno","" );
		String Stdvatno  = ParamUtil.getString(request, "Stdvatno","" );
		String Stdphone  = ParamUtil.getString(request, "Stdphone","" );
		String Stdemail  = ParamUtil.getString(request, "Stdemail","" ) ;
		String Stdlat  =  ParamUtil.getString(request, "Stdlat","0" );
		String Stdlog  = ParamUtil.getString(request, "Stdlog","0" ) ;
		String Stdurl  =  ParamUtil.getString(request, "Stdurl","" );
		String Stdmodifieddate  =  dateformat.format(new Date());
		String Stdpoints  =  ParamUtil.getString(request, "Stdpoints","0" );
		String Stdspenttime  =  ParamUtil.getString(request, "Stdspenttime","0" );
		String Stdtype  = ParamUtil.getString(request, "stdtype","NORMAL" ) ;
		String Stdstatus  = ParamUtil.getString(request, "stdspeed","INACTIVE" );
		String Stdcreateddate  = dateformat.format(new Date());
		String  username  = ParamUtil.getString(request, "username","" ) ;
		String  password  = ParamUtil.getString(request, "password","" ) ;
		String Stdcreatedby  = ParamUtil.getString(request, "Stdcreatedby","" );
		String Stdmodifiedby  = ParamUtil.getString(request, "Stdmodifiedby","" );
		_log.info("this is studio name "+Stdname);
		
		if(!(username.equals("null") || username.isEmpty() || password.equals("null") || password.isEmpty() || Stdname.equals("null") || Stdname.isEmpty() || Stdicon.equals("null") || Stdicon.isEmpty() ||Stdimage.equals("null") || Stdimage.isEmpty() || Stddesc.equals("null") || Stddesc.isEmpty() || Stdaddr.equals("null") || Stdaddr.isEmpty() ||Stdlat.equals("0") || Stdlat.isEmpty() ||Stdlog.equals("0") || Stdlog.isEmpty()||Stdpoints.equals("0") || Stdpoints.isEmpty() ||Stdspenttime.equals("0") || Stdspenttime.isEmpty()   )){
try{
		stdprofjson.put("STD_ID","0" );
		stdprofjson.put("STD_NAME",Stdname );
		stdprofjson.put("STD_TRADING_NAME",Stdname);
		stdprofjson.put("STD_ADDRESS_LINE1", Stdaddr);
		stdprofjson.put("STD_ADDRESS_LINE2","" );
		stdprofjson.put("STD_ADDRESS_LINE3","");
		stdprofjson.put("STD_TOWN", Stdtown);
		stdprofjson.put("STD_COUNTY",Stdcounty);//Stdcounty
		stdprofjson.put("STD_COUNTRY", Stdcountry);
		stdprofjson.put("STD_POST_CODE", Stdpost);
		stdprofjson.put("STD_BILLING_ADDRS_LINE1", Stdbilladdr);
		stdprofjson.put("STD_BILLING_ADDRS_LINE2","");
		stdprofjson.put("STD_BILLING_ADDRS_LINE3", "");
		stdprofjson.put("STD_BILLING_ADDRS_TOWN", Stdbilltown);
		stdprofjson.put("STD_BILLING_ADDRS_COUNTY", Stdbillcounty);
		stdprofjson.put("STD_BILLING_ADDRS_COUNTRY", Stdbillcountry);
		stdprofjson.put("STD_BILLING_ADDRS_POSTCODE", Stdbillpost);
		
		stdprofjson.put("STD_COMPANY_HOUSE_NUMBER", Stdhouseno);
		stdprofjson.put("STD_VAT_NUMBER", Stdvatno);
		stdprofjson.put("STD_COMPANY_LOGO", Stdicon);
		stdprofjson.put("STD_IMAGE_URL",Stdimage);
		stdprofjson.put("STD_LATITUDE",Stdlat);
		stdprofjson.put("STD_LONGITUDE",Stdlog);	
		stdprofjson.put("STD_DESCRIPTION", Stddesc);  	
		stdprofjson.put("STD_STREAM_DESC", Stdprodesc);
		stdprofjson.put("STD_PHONE_NO", Stdphone);	
		stdprofjson.put("STD_MAIL_ID",Stdemail);	
		
		stdprofjson.put("STD_SITE_URL", Stdurl);
		stdprofjson.put("STD_CREATED_BY", Stdcreatedby);
		stdprofjson.put("STD_CREATED_ON", Stdcreateddate); //02/17/2016"
		stdprofjson.put("STD_MODIFIED_BY", Stdmodifiedby);
		stdprofjson.put("STD_MODIFIED_ON", Stdmodifieddate);
		stdprofjson.put("STD_POINTS", Stdpoints);
		stdprofjson.put("STD_TIME_SPENT", Stdspenttime);
		stdprofjson.put("STD_TYPE", Stdtype);
		stdprofjson.put("STD_STATUS", Stdstatus);
		stdprofjson.put("STD_PAM_AUTH_ID", "");
		stdprofjson.put("STD_PAM_AUTH_TOKEN", "");
		
		_log.info("the post is "+stdprofjson.toString());
		String output=fiternityServiceImpl.addStudio(stdprofjson.toString());
		_log.info("the response is "+output);
		cache.remove("StudiosPage");
		JSONObject jo=new JSONObject(output);
		String stdid=jo.get("STD_ID").toString();
		
		ServiceContext serviceContext = ServiceContextFactory.getInstance(User.class.getName(), request);
		
		themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		long companyId = themeDisplay.getCompanyId();
		Role role = RoleLocalServiceUtil.getRole(companyId, STUDIO_OWNER_ROLE);
		long roleid=role.getRoleId();
		User user1 = (User) request.getAttribute(WebKeys.USER);
		long userId=user1.getUserId();
		Long groupId = themeDisplay.getLayout().getGroupId();
		Long orgId = OrganizationLocalServiceUtil.getOrganizationId(companyId, "Liferay, Inc.");
		Locale locale = Locale.forLanguageTag("en-US");
		
		
		if(Integer.valueOf(stdid)>0){
		//UserLocalServiceUtil.addUser(creatorUserId, companyId, autoPassword, password1, password2, autoScreenName, screenName, emailAddress, facebookId, openId, locale, firstName, middleName, lastName, prefixId, suffixId, male, birthdayMonth, birthdayDay, birthdayYear, jobTitle, groupIds, organizationIds, roleIds, userGroupIds, sendEmail, serviceContext)
		 User user=	UserLocalServiceUtil.addUser(userId, companyId, false, password, password, true, username, username, 0, "", locale, Stdname, "", "", 123, 321, true, 9, 30, 1991, "", new long[]{ groupId},new long[]{orgId} ,new long[]{ roleid} , /*new long[]{22710}*/ null, true, serviceContext);
		 user.getExpandoBridge().setAttribute("stdId",stdid);
		 _log.info("the new expando bridge in system "+user.getExpandoBridge().getAttribute("stdId"));
		 
		}
		

	} //catch (Exception e) {
catch (Exception e) {
	
	 if (e instanceof com.liferay.portal.DuplicateUserEmailAddressException) {
	        System.out.println("You've caught a DuplicateUserEmailAddressException");
	    }
	
		e.printStackTrace();
		System.out.println(" out put " +e);
		request.setAttribute("formerror",e.getMessage());
		request.setAttribute("Stdname", Stdname);
		request.setAttribute("Stdimage", Stdimage);
		request.setAttribute("Stdicon", Stdicon);
		request.setAttribute("Stddesc", Stddesc);
		request.setAttribute("Stdaddr", Stdaddr);
		request.setAttribute("Stdpost", Stdpost);
		request.setAttribute("Stdphone", Stdphone);
		request.setAttribute("Stdemail", Stdemail);
		request.setAttribute("Stdlat", Stdlat);
		request.setAttribute("Stdlog", Stdlog);
		request.setAttribute("Stdurl", Stdurl);
		request.setAttribute("Stdpoints", Stdpoints);
		request.setAttribute("Stdspenttime", Stdspenttime);
		request.setAttribute("Stdtype", Stdtype);
		request.setAttribute("Stdstatus", Stdstatus);
		request.setAttribute("username", username);
		 if (e instanceof com.liferay.portal.DuplicateUserEmailAddressException) {
			 request.setAttribute("formerror","Entered Email Id is already exist");
		    }
		response.setRenderParameter("render", "addStudio");
		  }
		}else{
			request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
			request.setAttribute("Stdname", Stdname);
			request.setAttribute("Stdimage", Stdimage);
			request.setAttribute("Stdicon", Stdicon);
			request.setAttribute("Stddesc", Stddesc);
			request.setAttribute("Stdaddr", Stdaddr);
			request.setAttribute("Stdpost", Stdpost);
			request.setAttribute("Stdphone", Stdphone);
			request.setAttribute("Stdemail", Stdemail);
			request.setAttribute("Stdlat", Stdlat);
			request.setAttribute("Stdlog", Stdlog);
			request.setAttribute("Stdurl", Stdurl);
			request.setAttribute("Stdpoints", Stdpoints);
			request.setAttribute("Stdspenttime", Stdspenttime);
			request.setAttribute("Stdtype", Stdtype);
			request.setAttribute("Stdstatus", Stdstatus);
			request.setAttribute("username", username);
			response.setRenderParameter("render", "addStudio");
			
			
		}
	}

	/**
	   * This method get all the details of studios and update existing record in database based on given id.
	   * 
	   * @param request An object sent to the portlet to handle a action.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortalException The base class for all exceptions related to business logic.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @exception DuplicateFileException It will throw when file is already exist.
	   * @exception IOException It throws when IO operation has failed for some reason.
	   */
	@ActionMapping(params = "action=editStudio")
	public void doEditStudios(Model model, ActionRequest request,ActionResponse response) throws SystemException, DuplicateFileException, PortalException, IOException, PortletException
	{
		
		_log.info("this is editStudio action method");
		PortletSession session = request.getPortletSession();
		session.setAttribute("ERR_REDIRECT","false", PortletSession.APPLICATION_SCOPE);
		User user1 = (User) request.getAttribute(WebKeys.USER);
      	String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
		String Stdimage="null";
		String Stdicon="null";
		String fileName="null";
		JSONObject stdprofjson=new JSONObject();
		
		DateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
		String Stdid  =ParamUtil.getString(request, "Stdid","0" ); 
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(request);
		
		String Stdname  = ParamUtil.getString(request, "Stdname","null" );
		String Stdtradename  = ParamUtil.getString(request, "Stdtradename","_null" );
		fileName=uploadPortletRequest.getFileName("stdimage");
		File file = uploadPortletRequest.getFile("stdimage");

		if( fileName.isEmpty()   ){  
			Stdimage= ParamUtil.getString(request, "Stdimgurl","null" );
		}else{
			Stdimage  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file,Stdname+"_cover");
		}
		_log.info(" this is beginig of studio Icon uplaod ");
		
		String fileName1=uploadPortletRequest.getFileName("stdicon");	
		File file1 = uploadPortletRequest.getFile("stdicon");
		
		if("null".equals(fileName1)  || fileName1.isEmpty()){
			 Stdicon=ParamUtil.getString(request, "Stdiconurl","null" );
		}else{
			 Stdicon  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file1,Stdname+"_icon");
		}
		
		String Stddesc  = ParamUtil.getString(request, "Stddesc","" );   
		String Stdprodesc  = ParamUtil.getString(request, "Stdprodesc","" );
		String Stdaddr  =  ParamUtil.getString(request, "Stdaddr","" );
		String Stdtown  =ParamUtil.getString(request, "Stdtown","" ); 
		String Stdcounty  =ParamUtil.getString(request, "Stdcounty","" ); 
		String Stdcountry  = ParamUtil.getString(request, "Stdcountry","" );
		String Stdpost  = ParamUtil.getString(request, "Stdpost","" ); 
		String Stdbilladdr  = ParamUtil.getString(request, "Stdbilladdr","" );
		String Stdbilltown  = ParamUtil.getString(request, "Stdbilltown","" );
		String Stdbillcounty  = ParamUtil.getString(request, "Stdbillcounty","" );
		String Stdbillcountry  =ParamUtil.getString(request, "Stdbillcountry","" ); 
		String Stdbillpost  = ParamUtil.getString(request, "Stdbillpost","" );
		String Stdhouseno  =ParamUtil.getString(request, "Stdhouseno","" ); 
		String Stdvatno  =ParamUtil.getString(request, "Stdvatno","" ); 
		String Stdphone  = ParamUtil.getString(request, "Stdphone","" ); 
		String Stdemail  = ParamUtil.getString(request, "Stdemail","" ); 
		String Stdlat  = ParamUtil.getString(request, "Stdlat","" ); 
		String Stdlog  =ParamUtil.getString(request, "Stdlog","" ); 
		String Stdurl  = ParamUtil.getString(request, "Stdurl","" );
	
		String Stdmodifieddate  =  dateformat.format(new Date());
		String Stdpoints  =  ParamUtil.getString(request, "Stdpoints","" );
		String Stdspenttime  = ParamUtil.getString(request, "Stdspenttime","" ); 
		String Stdtype  = ParamUtil.getString(request, "stdtype","" );
		String Stdstatus  = ParamUtil.getString(request, "stdspeed","" );
		String Stdauthid=ParamUtil.getString(request, "Stdauthid","" );
		String Stdauthtoken=ParamUtil.getString(request, "Stdauthtoken","" );
		String authCode=	ParamUtil.getString(request, "code","" );
		String Stdcreateddate  =  dateformat.format(ParamUtil.getDate(request, "createdOn", new SimpleDateFormat("yyyy-MM-dd hh:mm:ss")));
		
		if(!( Stdname.equals("null") || Stdname.isEmpty() || Stdicon.equals("null") || Stdicon.isEmpty() ||Stdimage.equals("null") || Stdimage.isEmpty() || Stddesc.equals("null") || Stddesc.isEmpty() || Stdaddr.equals("null") || Stdaddr.isEmpty() ||Stdlat.equals("0") || Stdlat.isEmpty() ||Stdlog.equals("0") || Stdlog.isEmpty()||Stdpoints.equals("0") || Stdpoints.isEmpty() ||Stdspenttime.equals("0") || Stdspenttime.isEmpty()   )){
			 try{ 
			stdprofjson.put("STD_ID", Stdid);
			stdprofjson.put("STD_NAME",Stdname );
			stdprofjson.put("STD_TRADING_NAME",Stdtradename);
			stdprofjson.put("STD_ADDRESS_LINE1", Stdaddr);
			stdprofjson.put("STD_ADDRESS_LINE2","" );
			stdprofjson.put("STD_ADDRESS_LINE3","");
			stdprofjson.put("STD_TOWN", Stdtown);
			stdprofjson.put("STD_COUNTY",Stdcounty);
			stdprofjson.put("STD_COUNTRY", Stdcountry);
			stdprofjson.put("STD_POST_CODE", Stdpost);
			
			stdprofjson.put("STD_BILLING_ADDRS_LINE1", Stdbilladdr);
			stdprofjson.put("STD_BILLING_ADDRS_LINE2","");
			stdprofjson.put("STD_BILLING_ADDRS_LINE3", "");
			stdprofjson.put("STD_BILLING_ADDRS_TOWN", Stdbilltown);
			stdprofjson.put("STD_BILLING_ADDRS_COUNTY", Stdbillcounty);
			stdprofjson.put("STD_BILLING_ADDRS_COUNTRY", Stdbillcountry);
			stdprofjson.put("STD_BILLING_ADDRS_POSTCODE", Stdbillpost);
			
			stdprofjson.put("STD_COMPANY_HOUSE_NUMBER", Stdhouseno);
			stdprofjson.put("STD_VAT_NUMBER", Stdvatno);
			stdprofjson.put("STD_COMPANY_LOGO", Stdicon);
			stdprofjson.put("STD_IMAGE_URL",Stdimage);
			stdprofjson.put("STD_LATITUDE",Stdlat);
			stdprofjson.put("STD_LONGITUDE",Stdlog);	
			stdprofjson.put("STD_DESCRIPTION", Stddesc);
			stdprofjson.put("STD_STREAM_DESC", Stdprodesc);
			stdprofjson.put("STD_PHONE_NO", Stdphone);	
			stdprofjson.put("STD_MAIL_ID",Stdemail);	
			
			stdprofjson.put("STD_SITE_URL", Stdurl);
			stdprofjson.put("STD_CREATED_BY", "");
			stdprofjson.put("STD_CREATED_ON", Stdcreateddate); 
			stdprofjson.put("STD_MODIFIED_BY", "");
			stdprofjson.put("STD_MODIFIED_ON", Stdmodifieddate);
			stdprofjson.put("STD_POINTS", Stdpoints);
			stdprofjson.put("STD_TIME_SPENT", Stdspenttime);
			stdprofjson.put("STD_TYPE", Stdtype);
			stdprofjson.put("STD_STATUS", Stdstatus);
			
			
					if(!(authCode.isEmpty() || authCode.equals("null"))){
						_log.info("this is staring of authcode calculation but inside of loop  ");
						HttpResponse<JsonNode> uniresponse = Unirest.post("https://api.instagram.com/oauth/access_token")
								.header("cache-control", "no-cache")
								.header("postman-token", "f498c952-3086-b4f7-597b-46a304a8039f")
								.header("content-type", "application/json")
								.body("client_id=07090c46105746deaf3104cf561bd211&client_secret=9cdcc2356291443caba7844497e16bde&grant_type=authorization_code&redirect_uri=https%3A%2F%2Fcms.fiternity.co%2Fc%2Fportal%2Finstagram_redirect&code="+authCode)
				/*				.body("client_id=07090c46105746deaf3104cf561bd211&client_secret=9cdcc2356291443caba7844497e16bde&grant_type=authorization_code&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fc%2Fportal%2Finstagram_redirect&code="+authCode)
*/
								.asJson();	
								_log.info("Body " +uniresponse.getBody());
			
								String output = uniresponse.getStatusText();
								_log.info("Output from Server "+output);
			
									if(uniresponse.getStatus()==200)
									{
										org.json.JSONObject responseBody = uniresponse.getBody().getObject();
										String accessToken= responseBody.getString("access_token");
										org.json.JSONObject userdet =  responseBody.getJSONObject("user");
										String pamAuthId = userdet.getString("id");
					
										_log.info("my auth id "+accessToken);
					
										stdprofjson.put("STD_PAM_AUTH_ID",pamAuthId);
										stdprofjson.put("STD_PAM_AUTH_TOKEN", accessToken);
										_log.info("this is STD_PAM_AUTH_ID  " +pamAuthId);
										_log.info("this is STD_PAM_AUTH_TOKEN  " +accessToken);
									}else{
										/*throw new RuntimeException("Failed : HTTP error code : "
							     		+ uniresponse.getStatus());*/
										_log.info("unireaponce status is "+uniresponse.getStatus());						
										request.setAttribute("formerror"," Instagram Matching code was not found or was already used");
										response.setRenderParameter("stdid", Stdid);
										response.setRenderParameter("render", "showeditStudio");
											}
					}    
					else{
						/*
			stdprofjson.put("STD_PAM_AUTH_ID", "");
			stdprofjson.put("STD_PAM_AUTH_TOKEN", "");*/
			stdprofjson.put("STD_PAM_AUTH_ID", Stdauthid);
			stdprofjson.put("STD_PAM_AUTH_TOKEN", Stdauthtoken);
					}
			_log.info("the input for edit studio is "+stdprofjson);
			String output=fiternityServiceImpl.editStudio(stdprofjson.toString());
			cache.remove("StudiosPage");
			_log.info("the response is "+output);
			 }
			 catch (Exception e) {
				 request.setAttribute("formerror",e.getMessage());
				 response.setRenderParameter("stdid", Stdid);
				 response.setRenderParameter("render", "showeditStudio");
				  }
		 }else{
				 request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
				 response.setRenderParameter("stdid", Stdid);
				 response.setRenderParameter("render", "showeditStudio");			 
		 }
		 
		 if(roles.contains(STUDIO_OWNER_ROLE)){
				long groupId = themeDisplay.getScopeGroupId();
			    String portletId = "adminpanel_WAR_adminpanelportlet";
			    long plid = PortalUtil.getPlidFromPortletId(groupId, portletId);
				 LiferayPortletURL renderURL = PortletURLFactoryUtil.create(request,
					        portletId, plid, PortletRequest.RENDER_PHASE); 
				 renderURL.setWindowState(WindowState.NORMAL);
				 renderURL.setPortletMode(PortletMode.VIEW);
				 response.sendRedirect(renderURL.toString());
			}
	}	
}


