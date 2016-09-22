package com.fiternity.adverts.controller;

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
 * AdvertsController is controller class for adverts portlet. This class allows us to add, edit, list or get their details.
 * 
 * AdvertsController can be accessed by user who are all have roles like administrator, Site Admin, Studio Owner or Adverts Manager
 * 
 * All of this methods actions are determined. So while executing, it has some restrictions on parameters.
 *  
 * Attempting to add or edit an ineligible object (Studio,Reward,etc.,) throws an unchecked exception, typically SQLGrammerException or NumberFormatException.
 * 
 * Attempting to query the presence of an ineligible data may throw an exception, or it may simply return false, or an empty value.
 */

@Controller(value = "AdvertsController")
@RequestMapping("VIEW")
public class AdvertsController {
	private static final Log _log = LogFactoryUtil.getLog(AdvertsController.class.getName());
	public static final String STUDIO_OWNER_ROLE=PortletProps.get("role.studioowner");
	public static final String ADMIN_ROLE=PortletProps.get("role.admin");
	public static final String SITE_ADMIN_ROLE=PortletProps.get("role.siteadmin");
	public static final String ADVERTS_MANAGER_ROLE=PortletProps.get("role.advertsmanager");
	public static final String IMAGE_FOLDER_NAME=PortletProps.get("fiternity.image.foldername");
	//FiternityServiceImpl  fiternityServiceImpl=new FiternityServiceImpl();
	PortalCache<String, Serializable> cache = SingleVMPoolUtil.getCache("Fiternity");    
	@Autowired      
	private FiternityService fiternityService;
	
	 /**
	   * It will list all the adverts(promos and upsells) by calling web services and display adverts listing page
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping
	public String showAdverts(Model model, RenderRequest request, RenderResponse response) throws PortletException, SystemException
	{
		_log.info("Showing Promos and upsells listings page");
		User user1 = (User) request.getAttribute(WebKeys.USER);
	    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
		PortletSession portletSession = request.getPortletSession();
		String jsonout=null;
		int pages=0, pageNo=1, listLength=0;
		JSONArray jaPage=new JSONArray();
		JSONArray ja=new JSONArray();
		JSONArray jaOwner=new JSONArray();		
		try {
			
			if(cache.get("AdvertsPage") == null){
				jsonout = fiternityService.getAdvertsListing("ALL");
				cache.put("AdvertsPage", (Serializable)jsonout);
				_log.info("Promos and sells is to be cached "+jsonout);
			}
			if(cache.get("AdvertsPage") != null){
				pageNo  = ParamUtil.getInteger(request, "pageNo")==0?1:ParamUtil.getInteger(request, "pageNo");
				jsonout =cache.get("AdvertsPage").toString();
				_log.info("Cached Promos and sells is "+jsonout);
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
				ja=new JSONArray(jsonout);
				int index=(int) (((pageNo*50)-50));
				listLength=ja.length();
				pages= (int) Math.ceil(listLength/50.0);
			
				for(int i=index;i<(index+50>listLength?listLength:index+50);i++){
					jaPage.put(ja.getJSONObject(i));
				}
				_log.info("your cache is activated your page is " +pageNo +" content is  " +jaPage.toString());
			}
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws in adverts listing "+e.getMessage());
		}
		
		request.setAttribute("return", jaPage);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pages", pages);
		 
		return "adverts-listing";
	}
	
	 /**
	   * Renders add adverts page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=addAdvert")
	public String renderAddAdvert(Model model, RenderRequest request, RenderResponse response){
		_log.info("Showing Promos and upsells adding page");
		String jsonout=null;
		try {
			jsonout = fiternityService.getStudiosListing();
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws while showing adverts page "+e.getMessage());
		}
		request.setAttribute("return", jsonout);
		return "add-advert";
		
	}
	
	
	 /**
	   * Renders edit adverts page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=showEditAdvert")
	public String renderEditadvert(Model model, RenderRequest request, RenderResponse response)
	{
	String ofrId=	ParamUtil.getString(request, "ofrId" );
	_log.info("Promos and upsells details with id of  "+ofrId);
	
	try {
		String output=fiternityService.getAdvertDetails(ofrId);
		request.setAttribute("return", output);
	} catch (Exception e) {	
		request.setAttribute("return","null" );
		_log.debug("Exception throws while showing edit page "+e.getMessage());
	}
	return "edit-advert";
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
	@ResourceMapping(value = "advertListingResource")
	public void advertchallengeListingResource(ResourceRequest resourceRequest,ResourceResponse resourceResponse,Model model) throws UnknownException, IOException {
		String searchString =ParamUtil.getString(resourceRequest, "searchString","");
		if(searchString.equals("")){searchString="ALL";}
		
		_log.info( " Promos and upsells search String "+searchString);
		
		String jsonout=null;
		try {
			jsonout = fiternityService.getAdvertsListing(searchString);
			System.out.println(" serve resource is "+jsonout);
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws while searching adverts"+e.getMessage());
		}
		_log.info( " Promos and sells search result is "+ jsonout);
		resourceResponse.getWriter().print(jsonout);

	}
	
	 /**
	   * This method will add new adverts(promos and upsells) by calling web services.
	   * 
	   * @param request An object sent to the portlet to handle a action.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @exception UnknownException A runtime exception.
	   * @exception FileNotFoundException It will throw when required file is not found.
	   * @exception ParseException An exception occurs when you fail to parse a Object.
	   */
	@ActionMapping(params = "action=addAdvert")
	public void doAddAdvert(Model model, ActionRequest request,ActionResponse response) throws PortalException,SystemException,UnknownException,FileNotFoundException, java.text.ParseException
	{
		_log.info("we going to add new promos and upsells");  
		DateFormat dateformat  = new SimpleDateFormat("dd/MM/yyyy");   //imageCover
		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(request);
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		Long groupId = themeDisplay.getLayout().getGroupId();
		JSONObject offJson  = new JSONObject();
		String stdId  = ParamUtil.getString(request, "stdId","0" );
		String stdName  = ParamUtil.getString(request, "stdNameHidden","" );
		String offDesc  = ParamUtil.getString(request, "offDesc","" );
		String offPhotoName=offDesc.length()<=15?offDesc:offDesc.substring(0, 15);
		String offLink  = ParamUtil.getString(request, "offLink","" );
		String notifyTypeString  = ParamUtil.getString(request, "notifyType","" );
		String notifyType=notifyTypeString.equals("Welcome")?"W":"E";
		String offStatus  = ParamUtil.getString(request, "offStatus","inactive" );
		String offCreDate  =  dateformat.format(new Date());
		
		String imageCover1=uploadPortletRequest.getFileName("imageCover");
		File file = uploadPortletRequest.getFile("imageCover");
		String imageCover="null";
		if(!(imageCover1.isEmpty() || imageCover1.equals("null") )){
			imageCover  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file,stdId+"_"+offPhotoName);
		}		
		if(!(stdId.equals("null") || stdId.isEmpty() || stdName.equals("null") || stdName.isEmpty() || offDesc.equals("null") || offDesc.isEmpty()  )){
			
			try{
			offJson.put("OFR_ID", "0");
			offJson.put("OFR_STD_ID", stdId);
			offJson.put("OFR_TYPE", notifyType);
			offJson.put("OFR_STATUS", offStatus);
			offJson.put("OFR_IMG", imageCover);
			offJson.put("OFR_DESCRIPTION", offDesc);
			offJson.put("OFR_EXTERNAL_LINK", offLink);
			offJson.put("OFR_CREATED_DATE", offCreDate);
			
			_log.info("input String is "+ offJson.toString());
			String output=fiternityService.addAdvert(offJson.toString());
			_log.info("the response is "+output);
			JSONObject jo=new JSONObject(output);
			String offId=jo.get("OFR_ID").toString();
			cache.remove("AdvertsPage");
			if(Integer.valueOf(offId)>0){
				
/*				User user1 = (User) request.getAttribute(WebKeys.USER);
				String toEmail=user1.getEmailAddress();
	//			MailSenderUtil.mailForAdvert(groupId,toEmail,notifyTypeString,stdName);
*/				String toEmail="";
				long companyId = themeDisplay.getCompanyId();				
				Role role = RoleLocalServiceUtil.getRole(companyId, ADMIN_ROLE);
				long roleid=role.getRoleId();
				List<User> users = UserLocalServiceUtil.getRoleUsers(roleid);
				for(User u:users){
					 toEmail=u.getEmailAddress();
					 _log.info("the mail triggered to super admin "+toEmail);
					MailSenderUtil.mailForAdvert(groupId,toEmail,notifyTypeString,stdName);					
				}
				
				 role = RoleLocalServiceUtil.getRole(companyId, SITE_ADMIN_ROLE);
				 roleid=role.getRoleId();
				 users = UserLocalServiceUtil.getRoleUsers(roleid);
				for(User u:users){
					 toEmail=u.getEmailAddress();
					 _log.info("the mail triggered to site admin "+toEmail);
					MailSenderUtil.mailForAdvert(groupId,toEmail,notifyTypeString,stdName);					
				}
				
				 role = RoleLocalServiceUtil.getRole(companyId, ADVERTS_MANAGER_ROLE);
				 roleid=role.getRoleId();
				 users = UserLocalServiceUtil.getRoleUsers(roleid);
				for(User u:users){
					 toEmail=u.getEmailAddress();
					 
					 _log.info("the mail triggered to advert manager "+toEmail);
					 MailSenderUtil.mailForAdvert(groupId,toEmail,notifyTypeString,stdName);					
				}
				
				
				 role = RoleLocalServiceUtil.getRole(companyId, STUDIO_OWNER_ROLE);
				 roleid=role.getRoleId();
				 users = UserLocalServiceUtil.getRoleUsers(roleid);
				 for(User u:users){
					 String studioOwnerId=	u.getExpandoBridge().getAttribute("stdId").toString();
					 if(stdId.equals(studioOwnerId)){
					 toEmail=u.getEmailAddress();
					 _log.info("the mail triggered to studio owner "+u.getFullName()+" mail id is "+toEmail);
					 MailSenderUtil.mailForAdvert(groupId,toEmail,notifyTypeString,stdName);
					 	}
				}
				
				_log.info("new promos and upsells added created");
				}				
			}
			catch(Exception e){
				request.setAttribute("formerror",e.getMessage());
				request.setAttribute("stdId", stdId);
				response.setRenderParameter("render", "addAdvert");				
			}			
			}
		else{
			request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
			request.setAttribute("stdId", stdId);
			response.setRenderParameter("render", "addAdvert");
		}		
	}
	
	 /**
	   * This method get all the details of adverts and update existing record in database based on given id.
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
	@ActionMapping(params = "action=editAdvert")
	public void doEditAdvert(Model model, ActionRequest request,ActionResponse response) throws PortalException,SystemException,UnknownException,FileNotFoundException, java.text.ParseException
	{
		_log.info("we going to edit promos and upsells "+ IMAGE_FOLDER_NAME);
		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(request);
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		JSONObject offJson  = new JSONObject();
		String stdId  = ParamUtil.getString(request, "stdId","" );
		String offId  = ParamUtil.getString(request, "offId","" );
		String offDesc  = ParamUtil.getString(request, "offDesc","" );
		String offPhotoName=offDesc.length()<=15?offDesc:offDesc.substring(0, 15);
		String offLink  = ParamUtil.getString(request, "offLink","" );
		String notifyTypeString  = ParamUtil.getString(request, "notifyType","" );
		String notifyType=notifyTypeString.equals("Welcome")?"W":"E";
		String offStatus  = ParamUtil.getString(request, "offStatus","inactive" );
		//Date offCreDate  = dateformat.parse( ParamUtil.getString(request, "offCreDate","null" ));
		String imageCoverOld  =  ParamUtil.getString(request, "imageCoverOld","" );
		
		String offCreDate1=ParamUtil.getString(request, "offCreDate","" );
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		Date enddate=df.parse(offCreDate1);
		df=new SimpleDateFormat("dd/MM/yyyy");
		String offCreDate=    df.format(enddate);
		
		String imageCover1=uploadPortletRequest.getFileName("imageCover");
		File file = uploadPortletRequest.getFile("imageCover");
		String imageCover=imageCoverOld;
		if(!(imageCover1.isEmpty() || imageCover1.equals("null") )){
			imageCover  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file,stdId+"_"+offPhotoName);
		}
		System.out.println("off desc "+ offDesc);
		
		if(!(stdId.equals("null") || stdId.isEmpty() || offDesc.equals("null") || offDesc.equals("") || offId.equals("null") || offId.isEmpty()  )){	
			try{
				_log.info("try part");
			offJson.put("OFR_STD_ID", stdId);
			offJson.put("OFR_ID", offId);
			offJson.put("OFR_TYPE", notifyType);
			offJson.put("OFR_STATUS", offStatus);
			offJson.put("OFR_IMG", imageCover);
			offJson.put("OFR_DESCRIPTION", offDesc); //offDesc
			offJson.put("OFR_EXTERNAL_LINK", offLink);
			offJson.put("OFR_CREATED_DATE", offCreDate);
			
			_log.info("input String is "+ offJson.toString());
			String output=fiternityService.editAdvert(offJson.toString());
			cache.remove("AdvertsPage");
			_log.info("the response is "+output);				
			}
			catch(Exception e){
				request.setAttribute("formerror",e.getMessage());
				response.setRenderParameter("ofrId", offId);
				response.setRenderParameter("render", "showEditAdvert");				
			}
			}
	else{
			System.out.println("pikazza  else part");
			request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
			response.setRenderParameter("ofrId", offId);
			response.setRenderParameter("render", "showEditAdvert");  
		}
	}
}
