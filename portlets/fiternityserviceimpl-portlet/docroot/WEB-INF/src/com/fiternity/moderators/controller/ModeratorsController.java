package com.fiternity.moderators.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import org.apache.commons.lang.ArrayUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.fiternity.UnknownException;
import com.fiternity.rewards.controller.RewardsController;
import com.fiternity.servicecontroller.MailSenderUtil;
import com.liferay.portal.NoSuchUserException;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.OrderByComparator;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.kernel.workflow.WorkflowConstants;
import com.liferay.portal.model.Contact;
import com.liferay.portal.model.Phone;
import com.liferay.portal.model.Role;
import com.liferay.portal.model.User;
import com.liferay.portal.service.OrganizationLocalServiceUtil;
import com.liferay.portal.service.PhoneLocalServiceUtil;
import com.liferay.portal.service.RoleLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;


/**
 * ModeratorsController is controller class for moderators portlet. This class allows us to  list , edit their status or get their details.
 * This moderators can independently manage other portlets and they can be assigned to different roles like Studios Manager, Rewards Manager, Events Manager, Challenges Manager, Adverts Manager or Customers Manager
 * 
 * ModeratorsController can be accessed by user who are all have roles like administrator or Site Admin.
 * 
 * All methods functionality is determined. So while executing, it has some restrictions on parameters.
 *  
 * Attempting to add or edit an ineligible object throws an unchecked exception, typically SQLGrammerException or NumberFormatException.
 * 
 * Attempting to query the presence of an ineligible data may throw an exception, or it may simply return false, or an empty value.
 */
@Controller(value = "ModeratorsController")
@RequestMapping("VIEW")
public class ModeratorsController  {
	private static final Log _log = LogFactoryUtil.getLog(ModeratorsController.class.getName());
 
	/**
	   * Returns moderators listing page with list of available moderators.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @exception NoSuchUserException It throws when given user is neither active nor existing in liferay database.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping
	public String showModerators(Model model, RenderRequest request, RenderResponse response) throws PortletException,NoSuchUserException ,SystemException
	{
		_log.info("this is show moderator method");
		int pages=0, pageNo=1;
		int listLength=0;
		List<User> usrlist = new ArrayList<User>();
		List<User> usrpage = new ArrayList<User>();
		try {
			pageNo  = ParamUtil.getInteger(request, "pageNo")==0?1:ParamUtil.getInteger(request, "pageNo");
			_log.info("this is show method "+ pageNo);
			List<Role>rolelist =  RoleLocalServiceUtil.getRoles(1, "Manager");
			_log.info("Length of RoleList"+rolelist.size());
			
			for(Role r : rolelist)
			{
			_log.info(r.getName());
		     List<User> roleusrlist = UserLocalServiceUtil.getRoleUsers(r.getRoleId());
		     usrlist.addAll(roleusrlist);
			}
			
		} catch (Exception e) {	
			//e.printStackTrace();
			_log.info("the exception is  "+e.getMessage());	 
		}
		
		
		Set<User> distinctUsers = new LinkedHashSet<User>(usrlist);
		usrlist.clear();
		//System.out.println("your result is usrlist "+usrlist.l);
		usrlist.addAll(distinctUsers);
		
		
		int index=(int) (((pageNo*50)-50));
		listLength=usrlist.size();
		pages= (int) Math.ceil(listLength/50.0);
		_log.info("the listLength are "+pages);
		
		for( int i=index,j=0 ; i<(index+50>listLength?listLength:index+50);i++,j++){ 
			usrpage.add(j, usrlist.get(i));
		}
		request.setAttribute("result", usrpage);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pages", pages);
        System.out.println("your result is pageNo "+pageNo);
        System.out.println("your result is pages "+pages);
		return "moderators-listing";
		
	}
	
	/**
	   * Renders add moderators page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=addModerator")
	public String renderAddModerator(Model model, RenderRequest request, RenderResponse response){
		return "add-moderator";		
	}
	
	/**
	   * Renders edit moderators page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=editModerator")
	public String renderEditModerator(Model model, RenderRequest request, RenderResponse response) throws PortletException
	{
	return "edit-moderator";
	}
	
	
	/**
	   * It will be redirected to edit moderator page.
	   * 
	   * @param request An object sent to the portlet to handle a action.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException It throws runtime exception.
	   */
	@ActionMapping(params = "action=showeditModerator")
	public void actionEditModerator(Model model, ActionRequest request, ActionResponse response) throws UnknownException
	{
	long usrId=	ParamUtil.getLong(request, "usrId" );
	_log.info("this is action method of edit record  "+usrId);
	
	try {
		request.setAttribute("result", usrId);
		response.setRenderParameter("render", "editModerator"); 
	} catch (Exception e) {	
		request.setAttribute("return","null" );
	}
   // response.setWindowState(WindowState.MAXIMIZED);
	   
	}
	/**
	   * It method will add new moderator in liferay database.
	   * 
	   * @param request An object sent to the portlet to handle a action.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @throws Exception It throws runtime exception
	   *  
	   */
	@ActionMapping(params = "action=submitModerator")
	public void doAddModerators(Model model, ActionRequest request,ActionResponse response) throws Exception
	{
		_log.info("adding moderator");
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		String portalURL = PortalUtil.getPortalURL(request);
		String usrName = ParamUtil.getString(request,"usrname",null);
		String usrEmail = ParamUtil.getString(request,"email",null);
		String usrPno = ParamUtil.getString(request,"pno",null);
		String usrpwd = ParamUtil.getString(request,"pwd",null);
		String[] manages = ParamUtil.getParameterValues(request, "manange", null);
				
		String status   = ParamUtil.getString(request, "status");
		status=status.equalsIgnoreCase("Active")?"0":"5";
		
		_log.info( "usrName:"+usrName+"usrEmail::"+usrEmail+"usrPno::"+usrPno+"usrpwd::"+usrpwd );
		
		_log.info("manager"+manages);
		
		_log.info("status::"+status);
		
		if(usrName != null && usrEmail != null && usrPno != null && usrpwd != null && manages != null && status != null)
		{
			ServiceContext serviceContext = ServiceContextFactory.getInstance(User.class.getName(), request);
			
			themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
			long companyId = themeDisplay.getCompanyId();
			
			User user1 = (User) request.getAttribute(WebKeys.USER);
			long userId=user1.getUserId();
			
			List<Long> roleidlist = new ArrayList<Long>();
//			Map<Locale, String> titleMap = new HashMap<Locale, String>();
//			Map<Locale, String> descriptionMap = new HashMap<Locale, String>();
			
			 for(String manage : manages )
				{
					_log.info("/n"+manage);
										 
					Role extrole = RoleLocalServiceUtil.getRole(companyId, manage+" Manager");					
					if(extrole != null)
					{
						_log.info("test3");
						//RoleLocalServiceUtil.addUserRole(userId, extrole.getRoleId());						
						roleidlist.add(extrole.getRoleId());		
					}
					/*else
					{
						System.out.println("test2");
						Role role = RoleLocalServiceUtil.addRole(userId, Role.class.getName(), 0, manage+" Manager", titleMap, descriptionMap, 1, "Manager", serviceContext);
						 roleidlist.add(role.getRoleId());			
					}*/							
				}
			 Long classroleids[] = new Long[roleidlist.size()];
			 classroleids = roleidlist.toArray(classroleids);
			 
			 long[] roleIds = ArrayUtils.toPrimitive(classroleids);								
			 long[] userGroupIds = {};
			
			Long groupId = themeDisplay.getLayout().getGroupId();
			Long orgId = OrganizationLocalServiceUtil.getOrganizationId(companyId, "Liferay, Inc.");
			Locale locale = Locale.forLanguageTag("en-US");
			 
			//UserLocalServiceUtil.addUser(creatorUserId, companyId, autoPassword, password1, password2, autoScreenName, screenName, emailAddress, facebookId, openId, locale, firstName, middleName, lastName, prefixId, suffixId, male, birthdayMonth, birthdayDay, birthdayYear, jobTitle, groupIds, organizationIds, roleIds, userGroupIds, sendEmail, serviceContext)
			
			
			 User user=	UserLocalServiceUtil.addUser(userId, companyId, false, usrpwd,usrpwd , true, usrName, usrEmail, 0, "", locale, usrName, "", "", 0, 0, true, 9, 30, 1991, "", new long[]{ groupId},new long[]{orgId} ,roleIds , userGroupIds, false, serviceContext);
			 //user.getExpandoBridge().setAttribute("userStatus",status);
			 user.setStatus(Integer.parseInt(status));
			 
			 
			 Phone p = PhoneLocalServiceUtil.addPhone(user.getUserId(), Contact.class.getName(), user.getContactId(), usrPno, "", 11008, true, serviceContext);
			// _log.info("the new expando bridge in system "+user.getExpandoBridge().getAttribute("userStatus"));
			 _log.info("the new status in system  " + user.getStatus());
			 MailSenderUtil.mailForModerator(groupId, portalURL, usrEmail, usrpwd);
		}		
	
	}
	
	/**
	   * This method get all the details of existing moderator and update existing record in database based on given id.
	   * 
	   * @param request An object sent to the portlet to handle a action.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @exception PortalException The base class for all exceptions related to business logic.
	   */
	@ActionMapping(params = "action=updateModerator")
	public void doEditModerator(Model model, ActionRequest request,ActionResponse response) throws SystemException, PortalException
	{
		_log.info("this is addStudio action method");
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		String usrName = ParamUtil.getString(request,"usrname",null);
		String usrEmail = ParamUtil.getString(request,"email",null);
		String usrPno = ParamUtil.getString(request,"pno",null);
		String usrpwd = ParamUtil.getString(request,"pwd",null);
		String[] manages = ParamUtil.getParameterValues(request, "manange", null);
		long userId = ParamUtil.getLong(request, "usrId", 0l);
		
		String status   = ParamUtil.getString(request, "status");
		status=status.equalsIgnoreCase("Active")?"0":"5";
		_log.info( "usrName:"+usrName+"usrEmail::"+usrEmail+"usrPno::"+usrPno+"usrpwd::"+usrpwd );
		
		_log.info("manager"+manages);
		
		_log.info("status::"+status);
		
		if(usrName != null && usrEmail != null  && manages != null && status != null)
		{
//			ServiceContext serviceContext = ServiceContextFactory.getInstance(User.class.getName(), request);
			
			themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
			long companyId = themeDisplay.getCompanyId();
			
			User user1 = UserLocalServiceUtil.getUser(userId);
			
			
//			List<Long> roleidlist = new ArrayList<Long>();
//			Map<Locale, String> titleMap = new HashMap<Locale, String>();
//			Map<Locale, String> descriptionMap = new HashMap<Locale, String>();		
			
					
					List<Role> playrole = RoleLocalServiceUtil.getUserRoles(userId);
					
				  	for(Role r : playrole)
				  	{
				  	
				  		if(r.getName().indexOf("Manager") > 0)
				  		{ 		
				  		String rolename = r.getName().substring(0, r.getName().indexOf(" "));
				  		_log.info("rolename :::::::::::::"+rolename);
				  		
				  		if(Arrays.asList(manages).contains(rolename) == false)				  		
				  		{	
				  			Arrays.asList(manages).remove(rolename);
				  			RoleLocalServiceUtil.deleteUserRole(userId, r.getRoleId());
				  		}
				  		
				  		}
				  	}
				  	 for(String manage : manages )
						{
							_log.info("/n"+manage);
							Role extrole = RoleLocalServiceUtil.getRole(companyId, manage+" Manager");
							if(extrole != null)
							{
								RoleLocalServiceUtil.addUserRole(userId, extrole.getRoleId());						
							}
							/*else
							{
								Role role = RoleLocalServiceUtil.addRole(userId, Role.class.getName(), 0, manage+" Manager", titleMap, descriptionMap, 1, "Manager", serviceContext);
										
							}*/
									
						}				  			
				  			
				  		
		/*	 Long classroleids[] = new Long[roleidlist.size()];
			 classroleids = roleidlist.toArray(classroleids);
			 
			 long[] roleIds = ArrayUtils.toPrimitive(classroleids);			
		
			
			 
			long[] userGroupIds = {};
			
			Long groupId = themeDisplay.getLayout().getGroupId();
			Long orgId = OrganizationLocalServiceUtil.getOrganizationId(companyId, "Liferay, Inc.");
			Locale locale = Locale.forLanguageTag("en-US");*/
			
			user1.setScreenName(usrName);
			user1.setFirstName(usrName);
			if(usrpwd != null || usrpwd.length() > 0)
			{
				user1.setPassword(usrpwd);
				user1.setPasswordEncrypted(false);
			}
			
			
			//user1.getExpandoBridge().setAttribute("userStatus",status);
			user1.setStatus(Integer.parseInt(status));
			UserLocalServiceUtil.updateUser(user1);		
			
			
			 List<Phone> plist = PhoneLocalServiceUtil.getPhones(user1.getCompanyId(), Contact.class.getName(), user1.getContactId());
		 	  String phonenos = null; 	
		 	  	if(plist != null)
		 	  	{
		 	  		for(Phone p : plist )
		 	  		{
		 	  			System.out.print("phone:::::"+phonenos);		 	  			
		 	  			phonenos = p.getNumber();
		 	  			if(phonenos.equals(usrPno))
		 	  			{}
		 	  			else
		 	  			{
		 	  				p.setNumber(usrPno);
		 	  				PhoneLocalServiceUtil.updatePhone(p);
		 	  			}
		 	  		}
		 	  	} 	
		 	  	
		}		
	
	}
	
	
	/**
	   * It will be called when we search moderator and list the result in moderators listing page.
	   * 
	   * @param resourceRequest An object sent to the portlet to handle a resource.
	   * @param resourceResponse An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortalException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @exception UnknownException throws runtime exception.
	   * @exception IOException It throws when IO operation has failed for some reason.
	   */
	@ResourceMapping(value = "moderatorListingResource")
	public void moderatorListingResource(ResourceRequest resourceRequest,ResourceResponse resourceResponse,Model model) throws UnknownException, IOException ,PortalException,SystemException{
		_log.info("entered into resource");
		String searchString =ParamUtil.getString(resourceRequest, "searchString"," ");
		ThemeDisplay themeDisplay = (ThemeDisplay) resourceRequest.getAttribute(WebKeys.THEME_DISPLAY);
		long companyId = themeDisplay.getCompanyId();
		
		LinkedHashMap<String, Object> userParams = new LinkedHashMap<String, Object>();
		
		if(searchString.equals("")){searchString=" ";}
		
		_log.info( "searchString "+searchString);
		
//		String jsonout=null;
		List<User> srcUsr = new ArrayList<User>();
		 srcUsr= UserLocalServiceUtil.search(companyId, searchString, WorkflowConstants.STATUS_ANY, userParams, 0, 10, (OrderByComparator)null);
		JSONArray usrArray = new JSONArray();
		JSONObject srcuser;
		if(srcUsr != null)
		{
			for(User u :  srcUsr)
			{
				List<Role> rlist = RoleLocalServiceUtil.getUserRoles(u.getUserId());
				if(rlist.size() > 0)
				{
					
					for(Role r : rlist)
					{

				  		if(r.getName().indexOf("Manager") > 0)
				  		{ 		
				  			 List<Phone> plist = PhoneLocalServiceUtil.getPhones(u.getCompanyId(), Contact.class.getName(), u.getContactId());
						 	  String phonenos = null; 	
						 	  	if(plist != null)
						 	  	{
						 	  		for(Phone p : plist )
						 	  		{
						 	  			System.out.print("phone:::::"+phonenos);		 	  			
						 	  			phonenos = p.getNumber();						 	  			
						 	  		}
						 	  	}
				  			srcuser = new JSONObject();
							srcuser.put("USR_NAME", u.getFirstName().toString());
							srcuser.put("USR_EMAIL", u.getEmailAddress().toString());
							srcuser.put("USR_PHONE", phonenos);
							srcuser.put("USR_STATUS", u.getExpandoBridge().getAttribute("userStatus").toString());				
							srcuser.put("USR_ID", u.getUserId());
							usrArray.put(srcuser);
							break;
				  		}
					}
				}	
				
			}
			
		}
		 
		_log.info(" serve resource is "+usrArray);
		resourceResponse.getWriter().print(usrArray);
	}


}