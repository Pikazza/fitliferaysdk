package com.fiternity.challenges.controller;

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

import com.fiternity.NullException;
import com.fiternity.NullPointerException;
import com.fiternity.NumberFormatException;
import com.fiternity.SQLGrammerException;
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
 * ChallengesController is controller class for challenges portlet. This class allows us to add, edit, list or get their details.
 * 
 * ChallengesController can be accessed by user who are all have roles like administrator, Site Admin, Studio Owner or Challenges Manager.
 * 
 * All methods functionality is determined. So while executing, it has some restrictions on parameters.
 *  
 * Attempting to add or edit an ineligible object throws an unchecked exception, typically SQLGrammerException or NumberFormatException.
 * 
 * Attempting to query the presence of an ineligible data may throw an exception, or it may simply return false, or an empty value.
 */

@Controller(value = "ChallengesController")
@RequestMapping("VIEW")
public class ChallengesController {
	private static final Log _log = LogFactoryUtil.getLog(ChallengesController.class.getName());
	public static final String STUDIO_OWNER_ROLE=PortletProps.get("role.studioowner");
	public static final String ADMIN_ROLE=PortletProps.get("role.admin");
	public static final String SITE_ADMIN_ROLE=PortletProps.get("role.siteadmin");
	public static final String CHALLENGER_MANAGER_ROLE=PortletProps.get("role.challengesmanager");
	public static final String IMAGE_FOLDER_NAME=PortletProps.get("fiternity.image.foldername");
	//FiternityServiceImpl  fiternityServiceImpl=new FiternityServiceImpl();
	PortalCache<String, Serializable> cache = SingleVMPoolUtil.getCache("Fiternity");
	@Autowired      
	private FiternityService fiternityService;
	
	 /**
	   * Returns challenges listing page with list of available challenges.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping
	public String showChallenges(Model model, RenderRequest request, RenderResponse response) throws PortletException, SystemException
	{
		_log.info("showing challenges listing page");
		User user1 = (User) request.getAttribute(WebKeys.USER);
	    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
		PortletSession portletSession = request.getPortletSession();
		String jsonout=null,jsonstd=null;
		int pages=0, pageNo=1,listLength=0;
		JSONArray ja=new JSONArray();
		JSONArray ja1=new JSONArray();
		JSONArray jaOwner=new JSONArray();

		
		try { 
			
			if(cache.get("ChallengesPage") == null){
			jsonout = fiternityService.getActivityListing("0", "2", "ALL", "ALL");
			_log.info("json out "+jsonout);
			cache.put("ChallengesPage", (Serializable)jsonout);
			_log.info("cache is "+(String)SingleVMPoolUtil.getCache("Fiternity").get("ChallengesPage"));
	       
			}
			if(cache.get("ChallengesPage") != null){
				pageNo  = ParamUtil.getInteger(request, "pageNo")==0?1:ParamUtil.getInteger(request, "pageNo");
				jsonout =cache.get("ChallengesPage").toString();
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
				
		
				_log.info("your cache is activated your page is " +pageNo +" content is  " +ja.toString() );
			}
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws in challenges listing "+e.getMessage());
		}
		
		request.setAttribute("return", ja);
		request.setAttribute("jsonstd", jsonstd);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pages", pages);
		 _log.info("pages no "+pageNo);
		return "challenges-listing";
		
	}
	
	 /**
	   * It will list all the participants who are accepted and attended given challenge
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException throws runtime exception.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=showParticipants")
	public String showInterestedParty(Model model, RenderRequest request, RenderResponse response) throws UnknownException
	{
		
		String staId=	ParamUtil.getString(request, "staId" );
		_log.info("this is to show interested party of challenges with studio id "+staId);
		
		String jsonout=null;
		try {
			jsonout = fiternityService.getInterestedParticipants(staId, "ALL");
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws in participants listing "+e.getMessage());
		}
		request.setAttribute("return", jsonout);
		return "participants";
		
	}
	
	 /**
	   * Renders add challenge page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException throws runtime exception.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=addChallenge")
	public String renderAddChallenge(Model model, RenderRequest request, RenderResponse response) throws UnknownException{
		String jsonout=null;
		try {
			jsonout = fiternityService.getStudiosListing();
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws while adding  challenges  "+e.getMessage());
		}
		request.setAttribute("return", jsonout);
		return "add-challenge";
		
	}
	
	
/*	@RenderMapping(params = "render=editchallenge")
	public String editchallenge(Model model, RenderRequest request, RenderResponse response) throws PortletException
	{
	return "edit-challenge";
	}
	@ActionMapping(params = "action=showEditChallenge")
	public void editchallenge(Model model, ActionRequest request, ActionResponse response) throws PortletException
	{
	String staId=	ParamUtil.getString(request, "staId" );
	_log.info("this is of details page of challenge with id of  "+staId);
	
	try {
		String output=fiternityService.getActivityDetails(staId);
		_log.info("the out put is "+output);
		request.setAttribute("return", output);
	} catch (Exception e) {	
		request.setAttribute("return","null" );
	}
   // response.setWindowState(WindowState.MAXIMIZED);
	 response.setRenderParameter("render", "editchallenge");
	}*/
	
	 /**
	   * Renders edit challenge page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException throws runtime exception.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=showEditChallenge")
	public String renderEditchallenge(Model model, RenderRequest request, RenderResponse response) throws UnknownException
	{
		String staId=	ParamUtil.getString(request, "staId" );
		_log.info("this is of details page of challenge with id of  "+staId);
		
		try {
			String output=fiternityService.getActivityDetails(staId);
			_log.info("the out put is "+output);
			request.setAttribute("return", output);
		} catch (Exception e) {	
			request.setAttribute("return","null" );
			_log.debug("Exception throws while loading edit"+e.getMessage());
		}
		return "edit-challenge";
	}
	
	
	
	/**
	   * It will be called when we search challenges and list the result in challenges listing page.
	   * 
	   * @param resourceRequest An object sent to the portlet to handle a resource.
	   * @param resourceResponse An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException throws runtime exception.
	   * @exception IOException It throws when IO operation has failed for some reason.
	   */
	@ResourceMapping(value = "challengeListingResource")
	public void challengeListingResource(ResourceRequest resourceRequest,ResourceResponse resourceResponse,Model model) throws UnknownException, IOException {
		_log.info("entered into searching challenge");
		String stdId =ParamUtil.getString(resourceRequest, "stdId");
		String challengeId =ParamUtil.getString(resourceRequest, "challengeId");
		String searchString =ParamUtil.getString(resourceRequest, "searchString","");
		if(searchString.equals("")){searchString="ALL";}
		
		_log.info( "stdId "+stdId);
		_log.info("ChallengeType "+challengeId);
		_log.info( "searchString "+searchString);
		
		String jsonout=null;
		try {
			jsonout = fiternityService.getActivityListing(stdId, "2", challengeId, searchString);
			_log.info(" serve resource is "+jsonout);
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws in challenges searching "+e.getMessage());
		}
		resourceResponse.getWriter().print(jsonout);

	}
	
	/**
	   * It will be called when we select the winner who finished their challenge in participants listing page.
	   * 
	   * @param resourceRequest An object sent to the portlet to handle a resource.
	   * @param resourceResponse An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException throws runtime exception.
	   * @exception IOException It throws when IO operation has failed for some reason.
	   */
	@ResourceMapping(value = "participantWinnerResource")
	public void participantWinnerResource(ResourceRequest resourceRequest,ResourceResponse resourceResponse,Model model) throws UnknownException, IOException, NumberFormatException, SQLGrammerException, NullException {
		_log.info("selecting winner of all participants");
		String stdId =ParamUtil.getString(resourceRequest, "stdId");
		String staId =ParamUtil.getString(resourceRequest, "staId");
		String staBadge =ParamUtil.getString(resourceRequest, "staBadge");
		String ptyId =ParamUtil.getString(resourceRequest, "ptyId");
			
		_log.info( "stdId "+stdId);
		_log.info("ChallengeType "+staId);
		_log.info( "searchString "+staBadge);
		_log.info( "searchString "+ptyId); 
		
		JSONObject winner =new JSONObject();
		DateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		winner.put("PTY_ID", ptyId);
		winner.put("STA_ID", staId);
		winner.put("STA_STD_ID", stdId);
		winner.put("CHECKIN_TIME",  dateformat.format(new Date()));
		winner.put("GAINED_TASK_BADGE", staBadge);
		
		String jsonout=null;
		try {
			jsonout = fiternityService.selectWinner(winner.toString());
			_log.info(" serve resource is "+jsonout);
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws while selecting winner"+e.getMessage());
		}
		resourceResponse.getWriter().print(jsonout);

	}
	
	/**
	   * It will be called when we search the participants in participants listing page.
	   * 
	   * @param resourceRequest An object sent to the portlet to handle a resource.
	   * @param resourceResponse An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException throws runtime exception.
	   * @exception IOException It throws when IO operation has failed for some reason.
	   */
	@ResourceMapping(value = "participantListingResource")
	public void participantListingResource(ResourceRequest resourceRequest,ResourceResponse resourceResponse,Model model) throws UnknownException, IOException {
		_log.info("showing participants searching results");
		String staId =ParamUtil.getString(resourceRequest, "staId");
		String searchString =ParamUtil.getString(resourceRequest, "searchString","");
		if(searchString.equals("")){searchString="ALL";}
		
		_log.info("ChallengeType "+staId);
		_log.info( "searchString "+searchString);
		
		String jsonout=null;
		try {
			jsonout = fiternityService.getInterestedParticipants(staId,searchString);
			_log.info(" serve resource is "+jsonout);
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws in participants searching "+e.getMessage());
		}
		resourceResponse.getWriter().print(jsonout);

	}
	
	/**
	   * It method will add new challenge by calling web services.
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
	@ActionMapping(params = "action=addChallenge")
	public void doAddChallenge(Model model, ActionRequest request,ActionResponse response) throws PortalException,SystemException,UnknownException,FileNotFoundException, java.text.ParseException
	{
		_log.info("we going to add new Challenge");
		
		DateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(request);
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		Long groupId = themeDisplay.getLayout().getGroupId();
		JSONObject evntjson = new JSONObject();	
		String stdId  = ParamUtil.getString(request, "stdId","" );
		String stdName  = ParamUtil.getString(request, "stdNameHidden","" );
		String cheName  = ParamUtil.getString(request, "cheName","" );
		String cheShort  = ParamUtil.getString(request, "cheShort","" );
		String cheDetail  = ParamUtil.getString(request, "cheDetail","" );
		String badgeDesc  = ParamUtil.getString(request, "badgeDesc","" );
		String cheStatus  = ParamUtil.getString(request, "cheStatus","inactive" );
		String noOfDays  = ParamUtil.getString(request, "noOfDays","0" );
		String createddate  =  dateformat.format(new Date());
		String modifieddate  =  dateformat.format(new Date());

		int staDay  = ParamUtil.getInteger(request, "staDay" ); 
		int staMonth  = ParamUtil.getInteger(request, "staMonth"); 
		int staYear  = ParamUtil.getInteger(request, "staYear" );

		int endDay  = ParamUtil.getInteger(request, "endDay" ); 
		int endMonth  = ParamUtil.getInteger(request, "endMonth"); 
		int endYear  = ParamUtil.getInteger(request, "endYear" );		

		int exDay  = ParamUtil.getInteger(request, "exDay" ); 
		int exMonth  = ParamUtil.getInteger(request, "exMonth"); 
		int exYear  = ParamUtil.getInteger(request, "exYear" );

		String fileName=uploadPortletRequest.getFileName("iconBadge");
		File file = uploadPortletRequest.getFile("iconBadge");
		String iconBadge="";
		if(!(fileName.isEmpty())){
			iconBadge  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file,stdId+"_"+cheName+"_badge");
		}
		_log.info("  badge image name   "+iconBadge);
		String imageCover1=uploadPortletRequest.getFileName("imageCover");
		File file4 = uploadPortletRequest.getFile("imageCover");
		_log.info("  imageCover name  "+file4);
		String imageCover="null";
		if(!(imageCover1.isEmpty() || imageCover1.equals("null") )){
			imageCover  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file4,stdId+"_"+cheName+"_cover");			
		}
		_log.info("  Cover image name   "+imageCover);
		String fileName1=uploadPortletRequest.getFileName("fileButton0");
		File file1 = uploadPortletRequest.getFile("fileButton0");
		String infIcon0="";
		try{
		if(!(fileName1.isEmpty() || fileName1.equals("null") )){
			infIcon0  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file1,stdId+"_"+cheName+"_inf1");
		}
		}
		catch(java.lang.NullPointerException ne){ne.getStackTrace();}
		_log.info("  inf image name   "+infIcon0);
		String infDesc0  = ParamUtil.getString(request, "fileArea0","null" );		
		
		String fileName2="null";
		fileName2=uploadPortletRequest.getFileName("fileButton1");
		File file2 = uploadPortletRequest.getFile("fileButton1");
		String infIcon1="";
		try{
		if(!( fileName2.trim().equals("null") ) ||  fileName2.isEmpty() ){ 
			infIcon1  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file2,stdId+"_"+cheName+"_inf2");			
		}
		}
		catch(java.lang.NullPointerException ne){ne.getStackTrace();}
		String infDesc1  = ParamUtil.getString(request, "fileArea1","null" );
		
		String fileName3 = ParamUtil.getString(uploadPortletRequest, "fileButton2","null");
		File file3 = uploadPortletRequest.getFile("fileButton2");
		String infIcon2="";
		try{
		if(!(fileName3.isEmpty() || fileName3.equals("null") )){
			infIcon2  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file3,stdId+"_"+cheName+"_inf3");
		}}
		catch(java.lang.NullPointerException ne){ne.getStackTrace();}
		String infDesc2  = ParamUtil.getString(request, "fileArea2","null" );
		
		
		String infString="";
		if(!(infIcon0.equals("")))
		 infString=infIcon0+"~"+infDesc0;
		if(!(infIcon1.equals("")))
			infString=infString+"%"+infIcon1+"~"+infDesc1;
		if(!(infIcon2.equals(""))){
			infString=infString+"%"+infIcon2+"~"+infDesc2;
		}
		String batchString="";
		if(!(iconBadge.equals("")))
		batchString=iconBadge+"~"+badgeDesc;
			
		
		if(!(stdId.equals("null") || stdId.isEmpty() || cheName.equals("null") || cheName.isEmpty() || cheDetail.equals("null") || cheDetail.isEmpty()  || staDay==0 || endDay==0 || exDay==0)){
			
			try{
				evntjson.put("STA_ID", "0");
			evntjson.put("STA_NAME", cheName);
			evntjson.put("STD_ID",stdId);
			evntjson.put("STA_DESCRIPTION",cheDetail );		
			evntjson.put("STA_START_DATE",staDay  + "/" +staMonth + "/" + staYear );
			evntjson.put("STA_EXPIRY_DATE", exDay  + "/" +exMonth + "/" + exYear );
			evntjson.put("STA_END_DATE",endDay   + "/" + endMonth+ "/" + endYear );
			evntjson.put("STA_CREATED_DATE",createddate );
			evntjson.put("STA_MODIFIED_DATE", modifieddate);
			evntjson.put("STA_UPDATED_BY","1");
			evntjson.put("STA_START_TIME", "00:00:00" );
			evntjson.put("STA_END_TIME", "00:00:00");
			
			evntjson.put("STA_GOAL_POINTS", "0");
			evntjson.put("STA_TYPE_ID", "2");
			evntjson.put("STA_IMAGE_URL",imageCover );		
			evntjson.put("STA_ADDRESS_LINE1", "null");
			evntjson.put("STA_ADDRESS_LINE2", "null");
			evntjson.put("STA_ADDRESS_LINE3", "null");		
			evntjson.put("STA_TOWN", "null");
			evntjson.put("STA_COUNTY", "null");
			evntjson.put("STA_COUNTRY", "null");
			evntjson.put("STA_POST_CODE", "null");
			evntjson.put("STA_LATITUDE", "0");
			evntjson.put("STA_LONGITUDE", "0");
			evntjson.put("STA_LIKE_CNT", "0");
			evntjson.put("STA_PRICE", "0");
			evntjson.put("STA_EXTERNAL_LINK", "null");	
			evntjson.put("STA_LOCATION", "null");
			evntjson.put("STA_INFLUENCER",infString);
			evntjson.put("STA_STATUS", cheStatus );
			evntjson.put("STA_SHORT_DESCRIPTION",cheShort );	
			evntjson.put("STA_BADGE_ID",batchString);
			evntjson.put("STA_NO_OF_DAYS",noOfDays);
			evntjson.put("STA_COMPANY_NAME","");
			evntjson.put("STA_COMPANY_LOGO","");
			
			_log.info("the inputs field of challenge before add is "+evntjson.toString());
			String output=fiternityService.addChallenge(evntjson.toString());
			_log.info("the response is "+output);
			JSONObject jo=new JSONObject(output);
			String cheId=jo.get("STA_ID").toString();
			cache.remove("ChallengesPage");
			if(Integer.valueOf(cheId)>0){
				
				String toEmail="";
				long companyId = themeDisplay.getCompanyId();
				Role role = RoleLocalServiceUtil.getRole(companyId, ADMIN_ROLE);
				long roleid=role.getRoleId();
				_log.info("the mail triggered to admin"+toEmail);
				List<User> users = UserLocalServiceUtil.getRoleUsers(roleid);
				for(User u:users){
					 toEmail=u.getEmailAddress();
					 _log.info("the mail triggered to challenge manager"+toEmail);
					 MailSenderUtil.mailForChallenge(groupId,toEmail,cheName,stdName);
					
				}
				 role = RoleLocalServiceUtil.getRole(companyId, SITE_ADMIN_ROLE);
				 roleid=role.getRoleId();
				 users = UserLocalServiceUtil.getRoleUsers(roleid);
				 for(User u:users){
					 toEmail=u.getEmailAddress();
					 _log.info("the mail triggered to "+toEmail);
					 MailSenderUtil.mailForChallenge(groupId,toEmail,cheName,stdName);
					
				}
				 role = RoleLocalServiceUtil.getRole(companyId, CHALLENGER_MANAGER_ROLE);
				 roleid=role.getRoleId();
				 users = UserLocalServiceUtil.getRoleUsers(roleid);
				 for(User u:users){
					 toEmail=u.getEmailAddress();
					 _log.info("the mail triggered to "+toEmail);
					 MailSenderUtil.mailForChallenge(groupId,toEmail,cheName,stdName);
					
				}
				 
				 role = RoleLocalServiceUtil.getRole(companyId, STUDIO_OWNER_ROLE);
				 roleid=role.getRoleId();
				 users = UserLocalServiceUtil.getRoleUsers(roleid);
				 for(User u:users){
					 String studioOwnerId=	u.getExpandoBridge().getAttribute("stdId").toString();
					 if(stdId.equals(studioOwnerId)){
					 toEmail=u.getEmailAddress();
					 _log.info("the mail triggered to studio owner "+u.getFullName()+" mail id is "+toEmail);
					 MailSenderUtil.mailForChallenge(groupId,toEmail,cheName,stdName);
					 	}
				}
				}
			
			}catch(Exception e){
				
				request.setAttribute("formerror",e.getMessage());
				request.setAttribute("stdId", stdId);
				request.setAttribute("cheName", cheName);
				request.setAttribute("cheDetail", cheDetail);
				request.setAttribute("cheShort", cheShort);
				request.setAttribute("infString",infString); 
				request.setAttribute("batchString", batchString);
				request.setAttribute("noOfDays", noOfDays);
				request.setAttribute("staDay", staDay);
				request.setAttribute("staMonth", staMonth);
				request.setAttribute("staYear", staYear);
				request.setAttribute("exDay", exDay);
				request.setAttribute("exMonth", exMonth);
				request.setAttribute("exYear", exYear);
				request.setAttribute("endDay", endDay);
				request.setAttribute("endMonth", endMonth);
				request.setAttribute("endYear", endYear);
				request.setAttribute("infIcon0", infIcon0);
				request.setAttribute("infDesc0", infDesc0);
				response.setRenderParameter("render", "addChallenge");
				
			}
		}else{
			request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
			request.setAttribute("stdId", stdId);
			request.setAttribute("cheName", cheName);
			request.setAttribute("cheDetail", cheDetail);
			request.setAttribute("cheShort", cheShort);
			request.setAttribute("infString",infString); 
			request.setAttribute("batchString", batchString);
			request.setAttribute("noOfDays", noOfDays);
			request.setAttribute("staDay", staDay);
			request.setAttribute("staMonth", staMonth);
			request.setAttribute("staYear", staYear);
			request.setAttribute("exDay", exDay);
			request.setAttribute("exMonth", exMonth);
			request.setAttribute("exYear", exYear);
			request.setAttribute("endDay", endDay);
			request.setAttribute("endMonth", endMonth);
			request.setAttribute("endYear", endYear);
			request.setAttribute("infIcon0", infIcon0);
			request.setAttribute("infDesc0", infDesc0);
			response.setRenderParameter("render", "addChallenge");
			
		}
		
	}
	
	/**
	   * This method get all the details of existing challenge and update existing record in database based on given id.
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
	@ActionMapping(params = "action=editChallenge")
	public void doEditChallenge(Model model, ActionRequest request,ActionResponse response) throws PortalException,SystemException,UnknownException,FileNotFoundException, java.text.ParseException
	{
		_log.info("we going to edit Challenge");   //iconBadge,imageCover,fileButton0,fileArea0
		
		DateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(request);
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		JSONObject evntjson = new JSONObject();	
		String stdId  = ParamUtil.getString(request, "stdId","" );
		String staId  = ParamUtil.getString(request, "staId","" );
		String cheName  = ParamUtil.getString(request, "cheName","" );
		String cheShort  = ParamUtil.getString(request, "cheShort","" );
		String cheDetail  = ParamUtil.getString(request, "cheDetail","" );
		String badgeDesc  = ParamUtil.getString(request, "badgeDesc","" );
		String cheStatus  = ParamUtil.getString(request, "cheStatus","" );
		String infImg0  = ParamUtil.getString(request, "infImg0","" );
		String infImg1  = ParamUtil.getString(request, "infImg1","" );
		String infImg2  = ParamUtil.getString(request, "infImg2","" );
		String fileBox0  = ParamUtil.getString(request, "fileBox0","" );
		String fileBox1  = ParamUtil.getString(request, "fileBox1","" );
		String fileBox2  = ParamUtil.getString(request, "fileBox2","" );
		String imageCoverOld  = ParamUtil.getString(request, "imageCoverOld","" );
		String iconBadgeOld  = ParamUtil.getString(request, "iconBadgeOld","" );
		String noOfDays  = ParamUtil.getString(request, "noOfDays","0" );
		String createddate  =  dateformat.format(new Date());
		String modifieddate  =  dateformat.format(new Date());

		int staDay  = ParamUtil.getInteger(request, "staDay" ); 
		int staMonth  = ParamUtil.getInteger(request, "staMonth"); 
		int staYear  = ParamUtil.getInteger(request, "staYear" );
		
		int endDay  = ParamUtil.getInteger(request, "endDay" ); 
		int endMonth  = ParamUtil.getInteger(request, "endMonth"); 
		int endYear  = ParamUtil.getInteger(request, "endYear" );		

		int exDay  = ParamUtil.getInteger(request, "exDay" ); 
		int exMonth  = ParamUtil.getInteger(request, "exMonth"); 
		int exYear  = ParamUtil.getInteger(request, "exYear" );
		
		String fileName=uploadPortletRequest.getFileName("iconBadge");
		File file = uploadPortletRequest.getFile("iconBadge");
		String iconBadge=iconBadgeOld;
		_log.info("iconBadge value  "+iconBadge);
		try{
		if(!(fileName.isEmpty() || fileName.equals("null"))){
			iconBadge  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file,stdId+"_"+cheName+"_badge");
		}
		}
		catch(NullPointerException ne){ne.getStackTrace();}
		
		//String imageCover1 = ParamUtil.getString(uploadPortletRequest, "imageCover");
		String imageCover1=uploadPortletRequest.getFileName("imageCover");
		File file4 = uploadPortletRequest.getFile("imageCover");
		String imageCover=imageCoverOld;
		if(!(imageCover1.isEmpty() || imageCover1.equals("null") )){
			imageCover  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file4,stdId+"_"+cheName+"_cover");
		}
		
		//String fileName1 = ParamUtil.getString(uploadPortletRequest, "fileButton0");
		String fileName1="";
		 fileName1=uploadPortletRequest.getFileName("fileButton0");
		File file1 = uploadPortletRequest.getFile("fileButton0");
		String infIcon0=infImg0;
		try{
		if(!(fileName1.isEmpty() || 
				fileName1.trim().equals("null") )){
			infIcon0  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file1,stdId+"_"+cheName+"_inf1");
		}
		}
		catch(NullPointerException ne){ne.getStackTrace();}
		String infDesc0  = ParamUtil.getString(request, "fileArea0","" );
		
		
		//String fileName2 = ParamUtil.getString(uploadPortletRequest, "fileButton1","null")
		String fileName2=null;
		 fileName2=uploadPortletRequest.getFileName("fileButton1");
		File file2 = uploadPortletRequest.getFile("fileButton1");
		String infIcon1=infImg1;
		try{
		if(!( fileName2.isEmpty() || fileName2.trim().equals("null") )){  //||   fileName2.trim().equals("null")   "".trim().equals(fileName2)   fileName2.isEmpty()
			infIcon1  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file2,stdId+"_"+cheName+"_inf2");
			
		}
		}
		catch(java.lang.NullPointerException ne){ne.getStackTrace();}
		String infDesc1  = ParamUtil.getString(request, "fileArea1","" );
		
		

		//String fileName3 = ParamUtil.getString(uploadPortletRequest, "fileButton2","null");
		String fileName3=uploadPortletRequest.getFileName("fileButton2");
		File file3 = uploadPortletRequest.getFile("fileButton2");
		String infIcon2=infImg2;
		try{
		if(!(fileName3.isEmpty() || fileName3.equals("null") )){
			infIcon2  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file3,stdId+"_"+cheName+"_inf3");
		}}
		catch(java.lang.NullPointerException ne){ne.getStackTrace();}
		String infDesc2  = ParamUtil.getString(request, "fileArea2","" );
		
		
		String infString="";
		String batchString="";
		if(!(infIcon0.equals("") || fileBox0.equals("")))
			infString=infIcon0+"~"+infDesc0;
		if(!(infIcon1.equals("") || fileBox1.equals("")))
			infString=infString+"%"+infIcon1+"~"+infDesc1;
		if(!(infIcon2.equals("")|| fileBox2.equals("") )){
			infString=infString+"%"+infIcon2+"~"+infDesc2;
		}
		if(!(iconBadge.equals("") || badgeDesc.equals("")))
		 batchString=iconBadge+"~"+badgeDesc;
			
		
		if(!(stdId.equals("null") || stdId.isEmpty() || cheName.equals("null") || cheName.isEmpty() || cheDetail.equals("null") || cheDetail.isEmpty()  || staDay==0 || endDay==0 || exDay==0)){
			
			try{
		
			evntjson.put("STA_ID", staId);
			evntjson.put("STA_NAME", cheName);
			evntjson.put("STD_ID",stdId);
			evntjson.put("STA_DESCRIPTION",cheDetail );		
			evntjson.put("STA_START_DATE",staDay  + "/" +staMonth + "/" + staYear );
			evntjson.put("STA_EXPIRY_DATE", exDay  + "/" +exMonth + "/" + exYear );
			evntjson.put("STA_END_DATE",endDay   + "/" + endMonth+ "/" + endYear );
			evntjson.put("STA_CREATED_DATE",createddate );
			evntjson.put("STA_MODIFIED_DATE", modifieddate);
			evntjson.put("STA_UPDATED_BY","1");
			evntjson.put("STA_START_TIME", "00:00:00" );
			evntjson.put("STA_END_TIME", "00:00:00");
			
			evntjson.put("STA_GOAL_POINTS", "0");
			evntjson.put("STA_TYPE_ID", "2");
			evntjson.put("STA_IMAGE_URL",imageCover );		
			evntjson.put("STA_ADDRESS_LINE1", "null");
			evntjson.put("STA_ADDRESS_LINE2", "null");
			evntjson.put("STA_ADDRESS_LINE3", "null");		
			evntjson.put("STA_TOWN", "null");
			evntjson.put("STA_COUNTY", "null");
			evntjson.put("STA_COUNTRY", "null");
			evntjson.put("STA_POST_CODE", "null");
			evntjson.put("STA_LATITUDE", "0");
			evntjson.put("STA_LONGITUDE", "0");
			evntjson.put("STA_LIKE_CNT", "0");
			evntjson.put("STA_PRICE", "0");
			evntjson.put("STA_EXTERNAL_LINK", "null");	
			evntjson.put("STA_LOCATION", "null");
			evntjson.put("STA_INFLUENCER",infString);
			evntjson.put("STA_STATUS", cheStatus );
			evntjson.put("STA_SHORT_DESCRIPTION",cheShort );	
			evntjson.put("STA_BADGE_ID",batchString);
			evntjson.put("STA_NO_OF_DAYS",noOfDays);
			evntjson.put("STA_COMPANY_NAME","");
			evntjson.put("STA_COMPANY_LOGO","");
			
			_log.info("the inputs field of challenge before edit is "+evntjson.toString());
			String output=fiternityService.editChallenge(evntjson.toString());
			cache.remove("ChallengesPage");
			_log.info("the response is "+output);
			
			}catch(Exception e){
				
				request.setAttribute("formerror",e.getMessage());
				response.setRenderParameter("staId", staId);
				response.setRenderParameter("render", "showEditChallenge");
				
			}
		}else{
			request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
			response.setRenderParameter("staId", staId);
			response.setRenderParameter("render", "showEditChallenge");
			
		}
		
	}

}
