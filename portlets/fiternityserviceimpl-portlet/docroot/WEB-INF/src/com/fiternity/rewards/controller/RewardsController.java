package com.fiternity.rewards.controller;

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
 * RewardsController is controller class for rewards portlet. This class allows us to list, add, edit or get their details.
 * 
 * RewardsController can be accessed by user who are all have roles like administrator, Site Admin, Studio Owner or Rewards Manager.
 * 
 * All methods functionality is determined.So while executing, it has some restrictions on parameters.
 *  
 * Attempting to add or edit an ineligible object throws an unchecked exception, typically SQLGrammerException or NumberFormatException.
 * 
 * Attempting to query the presence of an ineligible data may throw an exception, or it may simply return false, or an empty value.
 */
@Controller(value = "RewardsController")
@RequestMapping("VIEW")
public class RewardsController {
	private static final Log _log = LogFactoryUtil.getLog(RewardsController.class.getName());
	public static final String STUDIO_OWNER_ROLE=PortletProps.get("role.studioowner");
	public static final String ADMIN_ROLE=PortletProps.get("role.admin");
	public static final String SITE_ADMIN_ROLE=PortletProps.get("role.siteadmin");
	public static final String REWARDS_MANAGER_ROLE=PortletProps.get("role.rewardsmanager");
	public static final String IMAGE_FOLDER_NAME=PortletProps.get("fiternity.image.foldername");
	//FiternityServiceImpl  fiternityServiceImpl=new FiternityServiceImpl();
	PortalCache<String, Serializable> cache = SingleVMPoolUtil.getCache("Fiternity");
	@Autowired      
	private FiternityService fiternityServiceImpl;
 
	/**
	   * Returns rewards listing page with list of available rewards.
	   *
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping
	public String showRewards(Model model, RenderRequest request, RenderResponse response) throws PortletException, SystemException
	{   
		_log.info("this is show rewards method");
		User user1 = (User) request.getAttribute(WebKeys.USER);
	    String roles= RoleLocalServiceUtil.getUserRoles(user1.getUserId()).toString();
	    PortletSession portletSession = request.getPortletSession();
		String jsonout=null,jsonstd=null;
		int pages=0,pageNo=1,listLength=0;
		JSONArray ja=new JSONArray();
		JSONArray ja1=new JSONArray();
		JSONArray jaOwner=new JSONArray();
		
		
		
		try {
			
			if(cache.get("RewardsPage") == null){
			jsonout = fiternityServiceImpl.getRewardsListing("0","A","ALL");
			cache.put("RewardsPage", (Serializable)jsonout);
	        _log.info("cache is "+(String)SingleVMPoolUtil.getCache("Fiternity").get("RewardsPage"));
	       
			}
			if(cache.get("RewardsPage") != null){
				pageNo  = ParamUtil.getInteger(request, "pageNo")==0?1:ParamUtil.getInteger(request, "pageNo");
				jsonout =cache.get("RewardsPage").toString();
				jsonstd = fiternityServiceImpl.getStudiosListing();
				
				 if (roles.contains(STUDIO_OWNER_ROLE)){
		                String stdId=portletSession.getAttribute("stdId", PortletSession.APPLICATION_SCOPE).toString();
		                JSONArray	 jaInter= new JSONArray(jsonout);
		                for(int n = 0; n < jaInter.length(); n++){
		            	    JSONObject stdlist = jaInter.getJSONObject(n);
		            	    	if(stdId.equals( stdlist.get("RWD_STD_ID").toString())){
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
			_log.debug("Exception throws in rewards "+e.getMessage());
		}
		
		request.setAttribute("return", ja);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pages", pages);
		request.setAttribute("jsonstd", jsonstd);
		 _log.info("pages no "+pageNo);   
		return "rewards-listing";
		
	}
	
	/**
	   * Renders add reward page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=addReward")
	public String renderAddReward(Model model, RenderRequest request, RenderResponse response){
		String jsonout=null;
		try {
			jsonout = fiternityServiceImpl.getStudiosListing();
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws in add reward "+e.getMessage());
		}
		request.setAttribute("return", jsonout);
		return "add-reward";
		
	}
	/*@ActionMapping(params = "action=addaddReward")
	public void actionAddRewards(Model model, ActionRequest request, ActionResponse response){
		
		
		
		response.setRenderParameter("render", "add-reward");
		
	}*/
/*	@RenderMapping(params = "render=editReward")
	public String editReward(Model model, RenderRequest request, RenderResponse response) throws PortletException
	{
	return "edit-reward";
	}
	@ActionMapping(params = "action=showeditReward")
	public void editReward(Model model, ActionRequest request, ActionResponse response) throws PortletException
	{
	String rwdId=	ParamUtil.getString(request, "rwdId" );
	_log.info("this is action method of edit record  "+rwdId);
	
	try {
		String output=fiternityServiceImpl.getRewardDetails(rwdId);
		request.setAttribute("return", output);
	} catch (Exception e) {	
		request.setAttribute("return","null" );
	}
   // response.setWindowState(WindowState.MAXIMIZED);
	 response.setRenderParameter("render", "editReward");
	}
	*/
	
	
	/**
	   * Renders edit rewards page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=showeditReward")
	public String renderEditReward(Model model, RenderRequest request, RenderResponse response) throws PortletException
	{
	String rwdId=	ParamUtil.getString(request, "rwdId" );
	_log.info("this is action method of edit record  "+rwdId);
	
	try {
		String output=fiternityServiceImpl.getRewardDetails(rwdId);
		request.setAttribute("return", output);
	} catch (Exception e) {	
		request.setAttribute("return","null" );
		_log.debug("Exception throws while loading edit page "+e.getMessage());
	}
		return "edit-reward";
	}
	
	
	/**
	   * It will be called when we search rewards and list the result in rewards listing page.
	   * 
	   * @param resourceRequest An object sent to the portlet to handle a resource.
	   * @param resourceResponse An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException throws runtime exception.
	   * @exception IOException It throws when IO operation has failed for some reason.
	   */
	@ResourceMapping(value = "rewardListingResource")
	public void rewardListingResource(ResourceRequest resourceRequest,ResourceResponse resourceResponse,Model model) throws UnknownException, IOException {
		_log.info("reward searching result");
		String stdId =ParamUtil.getString(resourceRequest, "stdId");
		String rewardType =ParamUtil.getString(resourceRequest, "rewardType");
		String searchString =ParamUtil.getString(resourceRequest, "searchString","");
		if(searchString.equals("")){searchString="ALL";}
		
		_log.info( "stdId "+stdId);
		_log.info("rewardType "+rewardType);
		_log.info( "searchString "+searchString);
		
		String jsonout=null;
		try {
			jsonout = fiternityServiceImpl.getRewardsListing(stdId,rewardType,searchString);
			_log.info(" serve resource is "+jsonout);
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws while searching happens "+e.getMessage());
		}
		resourceResponse.getWriter().print(jsonout);



	}

	
	/**
	   * It method will add new reward by calling web services.
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
	@ActionMapping(params = "action=addReward")
	public void doAddReward(Model model, ActionRequest request,ActionResponse response) throws PortalException,SystemException,UnknownException,FileNotFoundException, java.text.ParseException
	{
		_log.info("we going to add new Reward");
		JSONObject rewardjson = new JSONObject();	
		JSONObject voucherjson = new JSONObject();	
		JSONObject rewardvoucherjson = new JSONObject();	
		DateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		Long groupId = themeDisplay.getLayout().getGroupId();
		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(request);
		String stdId  = ParamUtil.getString(request, "stdId","" );
		String stdName  = ParamUtil.getString(request, "stdNameHidden","" );
		String rwdName  = ParamUtil.getString(request, "rwdName","" ); 
		String rwdDesc  = ParamUtil.getString(request, "rwdDesc","" ); 
		String redeem  = ParamUtil.getString(request, "redeem","" );
		int exDay  = ParamUtil.getInteger(request, "exDay" ); 
		int exMonth  = ParamUtil.getInteger(request, "exMonth"); 
		int exYear  = ParamUtil.getInteger(request, "exYear" ); 
		Date utilDate = dateformat.parse(exDay + "/" +exMonth+ "/" + exYear);
		String rwdExDate  =  dateformat.format(utilDate);
		int pointsReq  = ParamUtil.getInteger(request, "pointsReq" );
		//String voucherCodecount  = ParamUtil.getString(request, "voucherCodecount","null" ); 
		String voucherCodes  = ParamUtil.getString(request, "voucherCodes","" ); 
		String rwdStatus  = ParamUtil.getString(request, "rwdStatus","INACTIVE" );
		
		String fileName=uploadPortletRequest.getFileName("rwdImage");
		File file = uploadPortletRequest.getFile("rwdImage");
		String rwdImage="null";
		if(!(fileName.isEmpty())){
			rwdImage  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file,stdId+"_"+rwdName+"_cover");
		}
		if(!(stdId.equals("null") || stdId.isEmpty() || rwdName.equals("null") || rwdName.isEmpty() || rwdDesc.isEmpty()  || exDay==0)){
		try{
			rewardjson.put("RWD_ID","0" );
			rewardjson.put("RWD_NAME",rwdName );
			rewardjson.put("RWD_POINTS", pointsReq);
			rewardjson.put("RWD_IMG_URL",rwdImage);
			rewardjson.put("RWD_DESCRIPTION",rwdDesc );
			rewardjson.put("RWD_EXPIRY_DATE", rwdExDate);
			rewardjson.put("RWD_STD_ID",stdId );		
			rewardjson.put("RWD_STATUS",rwdStatus );
			
			_log.info("the input field before adding reward is "+rewardjson.toString());
			String output=fiternityServiceImpl.addReward(rewardjson.toString());
			_log.info("the response is "+output);
			JSONObject jo=new JSONObject(output);
			String rwdId=jo.get("RESULT").toString();
		
			String[] vouarray = voucherCodes.split(",");
			_log.info("the array length is " +vouarray.length);
			cache.remove("RewardsPage");
			if( !(voucherCodes.equals("null") || voucherCodes.isEmpty()) ){
			for(int i=0;i<vouarray.length;i++){
				
				voucherjson.put("VOC_CODE",vouarray[i] );
				voucherjson.put("VOC_DISC_PERCENTAGE","0" );
				voucherjson.put("VOC_STATUS","ACTIVE" );
				_log.info("the response is "+voucherjson.toString());
				String output2=fiternityServiceImpl.addVoucher(voucherjson.toString()) ;
				JSONObject jo1=new JSONObject(output2);
				String vocId=jo1.get("VOC_ID").toString();
				
				rewardvoucherjson.put("RWD_ID", rwdId);
				rewardvoucherjson.put("VOC_ID", vocId);
				String output3=fiternityServiceImpl.addRewardVoucher(rewardvoucherjson.toString());
				
				_log.info("the response is "+output2);
				_log.info("the response is "+output3);
				
			}
			}	
			if(Integer.valueOf(rwdId)>0){
				
/*			User user1 = (User) request.getAttribute(WebKeys.USER);
			String toEmail=user1.getEmailAddress();
			MailSenderUtil.mailForReward(groupId,toEmail,rwdName,stdName);*/
			
			long companyId = themeDisplay.getCompanyId();
			String toEmail="";
			Role role = RoleLocalServiceUtil.getRole(companyId, ADMIN_ROLE);
			long roleid=role.getRoleId();
			 List<User> users = UserLocalServiceUtil.getRoleUsers(roleid);
			for(User u:users){
				 toEmail=u.getEmailAddress();
				 _log.info("the mail triggered to super admin "+toEmail);
				 MailSenderUtil.mailForReward(groupId,toEmail,rwdName,stdName);
				}
			
			role = RoleLocalServiceUtil.getRole(companyId, SITE_ADMIN_ROLE);
			 roleid=role.getRoleId();
			 users = UserLocalServiceUtil.getRoleUsers(roleid);
			 for(User u:users){
				 toEmail=u.getEmailAddress();
				 _log.info("the mail triggered to site admin "+toEmail);
				 MailSenderUtil.mailForReward(groupId,toEmail,rwdName,stdName);				
			 }
			
			 role = RoleLocalServiceUtil.getRole(companyId, REWARDS_MANAGER_ROLE);
			 roleid=role.getRoleId();
			 users = UserLocalServiceUtil.getRoleUsers(roleid);
			 for(User u:users){
				 toEmail=u.getEmailAddress();
				 _log.info("the mail triggered to reward manager "+toEmail);
				 MailSenderUtil.mailForReward(groupId,toEmail,rwdName,stdName);				
			 	}
	
				 role = RoleLocalServiceUtil.getRole(companyId, STUDIO_OWNER_ROLE);
				 roleid=role.getRoleId();
				 users = UserLocalServiceUtil.getRoleUsers(roleid);
				 for(User u:users){
					 String studioOwnerId=	u.getExpandoBridge().getAttribute("stdId").toString();
					 if(stdId.equals(studioOwnerId)){
					 toEmail=u.getEmailAddress();
					 _log.info("the mail triggered to studio owner "+u.getFullName()+" mail id is "+toEmail);
					 MailSenderUtil.mailForReward(groupId,toEmail,rwdName,stdName);
					 	}
				}			 
			}
			
		}
		catch (Exception e) {
			
			if (e instanceof SystemException) {
				e.printStackTrace();
			}
			else{
			e.printStackTrace();
			request.setAttribute("formerror",e.getMessage() );
			request.setAttribute("stdId", stdId);
			request.setAttribute("stdName", stdName);
			request.setAttribute("rwdImage", rwdImage);
			request.setAttribute("rwdName", rwdName);
			request.setAttribute("rwdDesc", rwdDesc);
			request.setAttribute("redeem", redeem);
			request.setAttribute("exDay", exDay);
			request.setAttribute("exMonth", exMonth);
			request.setAttribute("exYear", exYear);
			request.setAttribute("pointsReq", pointsReq);
			request.setAttribute("voucherCodes", voucherCodes);
			request.setAttribute("rwdStatus", rwdStatus);
			response.setRenderParameter("render", "addReward");
			}
			
			  }
			
		}else{
			request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
			request.setAttribute("stdId", stdId);
			request.setAttribute("stdName", stdName);
			request.setAttribute("rwdImage", rwdImage);
			request.setAttribute("rwdName", rwdName);
			request.setAttribute("rwdDesc", rwdDesc);
			request.setAttribute("redeem", redeem);
			request.setAttribute("exDay", exDay);
			request.setAttribute("exMonth", exMonth);
			request.setAttribute("exYear", exYear);
			request.setAttribute("pointsReq", pointsReq);
			request.setAttribute("voucherCodes", voucherCodes);
			request.setAttribute("rwdStatus", rwdStatus);
			response.setRenderParameter("render", "addReward");
			
		}
		
		
	}
	
	/**
	   * This method get all the details of rewards and update existing record in database based on given id.
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
	@ActionMapping(params ="action=editReward")
	public void doEditReward(Model model, ActionRequest request,ActionResponse response) throws Exception
	{
		
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
	
		_log.info("we going to edit the Reward");
		JSONObject rewardjson = new JSONObject();	
		JSONObject voucherjson = new JSONObject();	
		JSONObject rewardvoucherjson = new JSONObject();
		DateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
		//ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(request);
		String rwdId  = ParamUtil.getString(request, "rwdId","null" );
		String stdId  = ParamUtil.getString(request, "stdId","null" );    
		String stdName  = ParamUtil.getString(request, "stdName","null" );
		String rwdName  = ParamUtil.getString(request, "rwdName","null" ); 
		String rwdDesc  = ParamUtil.getString(request, "rwdDesc","null" ); 
		String redeem  = ParamUtil.getString(request, "redeem","null" );	
		String fileName=uploadPortletRequest.getFileName("rwdImage");
		File file = uploadPortletRequest.getFile("rwdImage");
		String rwdImage="null";
		if(fileName.isEmpty()){
			rwdImage=ParamUtil.getString(request, "imgUrlOld","null" );
		}else{
			rwdImage  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file,stdId+"_"+rwdName+"_cover");
		}
		int exDay  = ParamUtil.getInteger(request, "exDay" ); 
		int exMonth  = ParamUtil.getInteger(request, "exMonth"); 
		int exYear  = ParamUtil.getInteger(request, "exYear" ); 
		Date utilDate = dateformat.parse( exDay+ "/" + exMonth + "/" + exYear);
		String rwdExDate  =  dateformat.format(utilDate);
		int pointsReq  = ParamUtil.getInteger(request, "pointsReq" ); 
		String voucherCodes  = ParamUtil.getString(request, "voucherCodes","null" ); 
		String rwdStatus  = ParamUtil.getString(request, "rwdStatus","INACTIVE" );
		
		if(!(stdId.equals("null") || stdId.isEmpty() || rwdName.equals("null") || rwdName.isEmpty() || rwdDesc.isEmpty()  || exDay==0)){
		try{
			rewardjson.put("RWD_ID",rwdId );
			rewardjson.put("RWD_NAME",rwdName );
			rewardjson.put("RWD_POINTS", pointsReq);
			rewardjson.put("RWD_IMG_URL",rwdImage);
			rewardjson.put("RWD_DESCRIPTION",rwdDesc );
			rewardjson.put("RWD_EXPIRY_DATE", rwdExDate);
			rewardjson.put("RWD_STD_ID",stdId );		
			rewardjson.put("RWD_STATUS",rwdStatus );
			
			_log.info("the input field before edit reward is "+rewardjson.toString());
			String output=fiternityServiceImpl.editReward(rewardjson.toString());
			cache.remove("RewardsPage");
			_log.info("the response of edit reward "+output);
			String[] vouarray = voucherCodes.split(",");

			if( !(voucherCodes.equals("null") || voucherCodes.isEmpty()) ){
				for(int i=0;i<vouarray.length;i++){
					
					voucherjson.put("VOC_CODE",vouarray[i] );
					voucherjson.put("VOC_DISC_PERCENTAGE","0" );
					voucherjson.put("VOC_STATUS","ACTIVE" );
					_log.info("the string to add voucher "+voucherjson.toString());
					String output2=fiternityServiceImpl.addVoucher(voucherjson.toString()) ;
					_log.info("the response of add voucher "+output2);
					JSONObject jo1=new JSONObject(output2);
					String vocId=jo1.get("VOC_ID").toString();
					
					rewardvoucherjson.put("RWD_ID", rwdId);
					rewardvoucherjson.put("VOC_ID", vocId);
					String output3=fiternityServiceImpl.addRewardVoucher(rewardvoucherjson.toString());
					_log.info("the response of add reward and voucher combination "+output3);
					
				}
				}
			
		}
		catch (PortalException e) {

			e.printStackTrace();
			request.setAttribute("formerror",e.getMessage() );
			response.setRenderParameter("rwdId", rwdId);
			response.setRenderParameter("render", "showeditReward");
			
			
			  }
		
		}else{
			request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
			response.setRenderParameter("rwdId", rwdId);
			response.setRenderParameter("render", "showeditReward");
			
		}
		
	}
}
