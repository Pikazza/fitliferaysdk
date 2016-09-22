package com.fiternity.adminpanel.controller;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletMode;
import javax.portlet.PortletRequest;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.WindowState;

import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.LiferayPortletURL;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.Layout;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.PortletURLFactoryUtil;



/**
 * AdminPanelController handles admin panel(dashboard) page which is acting as a front controller for all fiternity admin users. 
 * It will display list of modules so admin user can view and manage each module as per their wish.
 * 
 * Admin user access controls are defined based on their roles and each user can have many roles.
 * Roles can be granted permissions to various modules within Fiternity administrative application.
 * For example, some roles are like studio owner,site admin,reward manager.
 * Site Admin can manage all information of site but Studio Owner can manage their own studio informations only.
 * 
 */
@Controller(value = "AdminPanelController")
@RequestMapping("VIEW")
public class AdminPanelController {
	private static final Log _log = LogFactoryUtil.getLog(AdminPanelController.class.getName());
	
	 /**
	   * Returns a Page name as String "admin-panel" which has to be viewed next.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping
	 public String showAdminPanel(RenderRequest request,RenderResponse response,Model model){
		
		
	  return "admin-panel";
	 }
	
	 /**
	   * This method allows to render studios page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception Exception throws runtime exception.
	   */
	@ActionMapping(params = "action=showStudios")
	public void showStudios(Model model, ActionRequest request, ActionResponse response) throws Exception
	{
		_log.info("this is show studios method and itis Action Method");
		  
	   
		String portalURL = PortalUtil.getPortalURL(request);
		response.sendRedirect(portalURL+"/group/fiternity/studios");
	}
	
	 /**
	   * This method allows to render moderators page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception Exception throws runtime exception.
	   */
	 @ActionMapping(params = "action=showModerators")
	 public void showModerators(Model model, ActionRequest request, ActionResponse response) throws Exception
	 {
	 _log.info("this is show Moderator method and itis Action Method");
	 String portalURL = PortalUtil.getPortalURL(request);
	 response.sendRedirect(portalURL+"/group/fiternity/moderators");
	 } 
	 
	 /**
	   * This method allows to render beacons page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception Exception throws runtime exception.
	   */
	 @ActionMapping(params = "action=showBeacons")
	 public void showBeacons(Model model, ActionRequest request, ActionResponse response) throws Exception
	 {
	 _log.info("this is show Beacons method and itis Action Method");
	 String portalURL = PortalUtil.getPortalURL(request);
	 response.sendRedirect(portalURL+"/group/fiternity/beacons");
	 }  
	 
	 /**
	   * This method allows to render manage-content page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception Exception throws runtime exception.
	   */
	 @ActionMapping(params = "action=showNotifications")   //showContents
	 public void showNotifications(Model model, ActionRequest request, ActionResponse response) throws Exception
	 {
	 _log.info("this is show Notifications method and itis Action Method");
	 String portalURL = PortalUtil.getPortalURL(request);
	 response.sendRedirect(portalURL+"/group/fiternity/manage-content");
	 } 
	 
	 /**
	   * This method allows to render email-content page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception Exception throws runtime exception
	   */
	 @ActionMapping(params = "action=showContents")   //showContents
	 public void showContents(Model model, ActionRequest request, ActionResponse response) throws Exception
	 {
	 _log.info("this is show Notifications method and itis Action Method");
	 String portalURL = PortalUtil.getPortalURL(request);
	 response.sendRedirect(portalURL+"/group/fiternity/email-content?p_p_id=notifications_WAR_fiternityserviceimplportlet&p_p_lifecycle=0&p_p_state=normal&p_p_mode=view&p_p_col_id=column-1&p_p_col_count=1&_notifications_WAR_fiternityserviceimplportlet_render=showContentListing");
	 
	 } 
	 
	 /**
	   * This method allows to render customers page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception Exception throws runtime exception
	   */
	 @ActionMapping(params = "action=showCustomers")
	 public void showCustomers(Model model, ActionRequest request, ActionResponse response) throws Exception
	 {
	 _log.info("this is show Customer method and itis Action Method");
	 String portalURL = PortalUtil.getPortalURL(request);
	 response.sendRedirect(portalURL+"/group/fiternity/Customers");
	 }
	
	 /**
	   * This method allows to render rewards page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception Exception throws runtime exception.
	   */
	@ActionMapping(params = "action=showRewards")
	public void showRewards(Model model, ActionRequest request, ActionResponse response) throws Exception
	{
		_log.info("this is show rewards method and itis Action Method");
		  
	   
		String portalURL = PortalUtil.getPortalURL(request);
		response.sendRedirect(portalURL+"/group/fiternity/rewards");
	}
	
	/**
	   * This method allows to render studios details page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception Exception throws runtime exception.
	   */
	@ActionMapping(params = "action=showStudioDetails")
	public void showStudioByStdId(Model model, ActionRequest request, ActionResponse response) throws Exception
	{
		_log.info("show studio details for stuidio owners");
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		String userid=	ParamUtil.getString(request, "userid" );
		User user=UserLocalServiceUtil.getUserById(Long.parseLong(userid));
		String stdid =user.getExpandoBridge().getAttribute("stdId").toString();
		_log.info("the studio id is"+stdid);

		PortletSession portletSession = request.getPortletSession();
		portletSession.setAttribute("stdId",stdid , PortletSession.APPLICATION_SCOPE);
	
		long groupId = themeDisplay.getScopeGroupId();
	    String portletId = "studios_WAR_fiternityserviceimplportlet";
	    long plid = PortalUtil.getPlidFromPortletId(groupId, portletId);

	    LiferayPortletURL actionURL = PortletURLFactoryUtil.create(request,
	        portletId, plid, PortletRequest.RENDER_PHASE); 
	    actionURL.setWindowState(WindowState.NORMAL);
	    actionURL.setPortletMode(PortletMode.VIEW); 
	    

	    response.sendRedirect(actionURL.toString());
		
	}

	/**
	   * This method allows to render studios reward listing page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception Exception throws runtime exception.
	   */
@ActionMapping(params = "action=showOwnerRewards")
public void showRewardsByStdId(Model model, ActionRequest request, ActionResponse response) throws Exception
{
	_log.info("show studio details for stuidio owners");
	ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
	String userid=	ParamUtil.getString(request, "userid" );
	User user=UserLocalServiceUtil.getUserById(Long.parseLong(userid));
	String stdid =user.getExpandoBridge().getAttribute("stdId").toString();
	_log.info("the studio id is"+stdid);
	PortletSession portletSession = request.getPortletSession();
	portletSession.setAttribute("stdId",stdid , PortletSession.APPLICATION_SCOPE);
	
	long groupId = themeDisplay.getScopeGroupId();
    String portletId = "rewards_WAR_fiternityserviceimplportlet";
    long plid = PortalUtil.getPlidFromPortletId(groupId, portletId);

    LiferayPortletURL actionURL = PortletURLFactoryUtil.create(request,
        portletId, plid, PortletRequest.RENDER_PHASE); 
    actionURL.setWindowState(WindowState.NORMAL);
    actionURL.setPortletMode(PortletMode.VIEW);
    actionURL.setParameter("stdid",stdid ); 
    

    response.sendRedirect(actionURL.toString());
	
}
/**
 * This method allows to render events listing page.
 * 
 * @param request An object sent to the portlet to handle a render.
 * @param response An object to assist a portlet in sending a response to the portal.
 * @param model It is for adding attributes to the model.
 * @exception Exception throws runtime exception.
 */
@ActionMapping(params = "action=showEvents")
public void showEvents(Model model, ActionRequest request, ActionResponse response) throws Exception
{
	_log.info("this is show events method and itis Action Method");
	  
   
	String portalURL = PortalUtil.getPortalURL(request);
	response.sendRedirect(portalURL+"/group/fiternity/events");
}

/**
 * This method allows to render challenges listing page.
 * 
 * @param request An object sent to the portlet to handle a render.
 * @param response An object to assist a portlet in sending a response to the portal.
 * @param model It is for adding attributes to the model.
 * @exception Exception throws runtime exception.
 */
@ActionMapping(params = "action=showChallenges")
public void showChallenges(Model model, ActionRequest request, ActionResponse response) throws Exception
{
	_log.info("this is show challenges method and itis Action Method");
	  
   
	String portalURL = PortalUtil.getPortalURL(request);
	response.sendRedirect(portalURL+"/group/fiternity/challenges");
}

/**
 * This method allows to render studios events listing page.
 *
 * @param request An object sent to the portlet to handle a render.
 * @param response An object to assist a portlet in sending a response to the portal.
 * @param model It is for adding attributes to the model.
 * @exception Exception throws runtime exception.
 */
@ActionMapping(params = "action=showOwnerEvents")
public void showEventsByStdId(Model model, ActionRequest request, ActionResponse response) throws Exception
{
	_log.info("show studio details for stuidio owners");
	ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
	String userid=	ParamUtil.getString(request, "userid" );
	User user=UserLocalServiceUtil.getUserById(Long.parseLong(userid));
	String stdid =user.getExpandoBridge().getAttribute("stdId").toString();
	_log.info("the studio id is"+stdid);
	PortletSession portletSession = request.getPortletSession();
	portletSession.setAttribute("stdId",stdid , PortletSession.APPLICATION_SCOPE);
	
	long groupId = themeDisplay.getScopeGroupId();
    String portletId = "events_WAR_fiternityserviceimplportlet";
    long plid = PortalUtil.getPlidFromPortletId(groupId, portletId);

    LiferayPortletURL actionURL = PortletURLFactoryUtil.create(request,
        portletId, plid, PortletRequest.RENDER_PHASE); 
    actionURL.setWindowState(WindowState.NORMAL);
    actionURL.setPortletMode(PortletMode.VIEW);
    actionURL.setParameter("stdid",stdid ); 
    

    response.sendRedirect(actionURL.toString());
	
}

/**
 * This method allows to render studios challenge listing page.
 *    
 * @param request An object sent to the portlet to handle a render.
 * @param response An object to assist a portlet in sending a response to the portal.
 * @param model It is for adding attributes to the model.
 * @exception Exception throws runtime exception.
 */
@ActionMapping(params = "action=showOwnerChallenges")
public void showChallengesByStdId(Model model, ActionRequest request, ActionResponse response) throws Exception
{
	_log.info("show studio details for stuidio owners");
	ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
	String userid=	ParamUtil.getString(request, "userid" );
	User user=UserLocalServiceUtil.getUserById(Long.parseLong(userid));
	String stdid =user.getExpandoBridge().getAttribute("stdId").toString();
	_log.info("the studio id is"+stdid);
	PortletSession portletSession = request.getPortletSession();
	portletSession.setAttribute("stdId",stdid , PortletSession.APPLICATION_SCOPE);
	
	long groupId = themeDisplay.getScopeGroupId();
    String portletId = "challenges_WAR_fiternityserviceimplportlet";
    long plid = PortalUtil.getPlidFromPortletId(groupId, portletId);

    LiferayPortletURL actionURL = PortletURLFactoryUtil.create(request,
        portletId, plid, PortletRequest.RENDER_PHASE); 
    actionURL.setWindowState(WindowState.NORMAL);
    actionURL.setPortletMode(PortletMode.VIEW);
    actionURL.setParameter("stdid",stdid ); 
    

    response.sendRedirect(actionURL.toString());
	
}

/**
 * This method allows to render adverts page.
 * 
 * @param request An object sent to the portlet to handle a render.
 * @param response An object to assist a portlet in sending a response to the portal.
 * @param model It is for adding attributes to the model.
 * @exception Exception throws runtime exception.
 */
@ActionMapping(params = "action=showAdverts")
public void showAdverts(Model model, ActionRequest request, ActionResponse response) throws Exception
{
	_log.info("this is show adverts method and itis Action Method");
	  
   
	String portalURL = PortalUtil.getPortalURL(request);
	response.sendRedirect(portalURL+"/group/fiternity/adverts");
}

/**
 * This method allows to render each studios adverts listing page.
 * 
 * @param request An object sent to the portlet to handle a render.
 * @param response An object to assist a portlet in sending a response to the portal.
 * @param model It is for adding attributes to the model.
 * @exception Exception throws runtime exception.
 */
@ActionMapping(params = "action=showOwnerAdverts")
public void showAdvertsByStdId(Model model, ActionRequest request, ActionResponse response) throws Exception
{
	_log.info("show offers details for stuidio owners");
	ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
	String userid=	ParamUtil.getString(request, "userid" );
	User user=UserLocalServiceUtil.getUserById(Long.parseLong(userid));
	String stdid =user.getExpandoBridge().getAttribute("stdId").toString();
	_log.info("the studio id is"+stdid);
	PortletSession portletSession = request.getPortletSession();
	portletSession.setAttribute("stdId",stdid , PortletSession.APPLICATION_SCOPE);
	
	long groupId = themeDisplay.getScopeGroupId();
    String portletId = "adverts_WAR_fiternityserviceimplportlet";
    long plid = PortalUtil.getPlidFromPortletId(groupId, portletId);

    LiferayPortletURL actionURL = PortletURLFactoryUtil.create(request,
        portletId, plid, PortletRequest.RENDER_PHASE); 
    actionURL.setWindowState(WindowState.NORMAL);
    actionURL.setPortletMode(PortletMode.VIEW);
    actionURL.setParameter("stdid",stdid ); 
    

    response.sendRedirect(actionURL.toString());
	
}

/**
 * This method allows to render fuels page.
 * 
 * @param request An object sent to the portlet to handle a render.
 * @param response An object to assist a portlet in sending a response to the portal.
 * @param model It is for adding attributes to the model.
 * @exception Exception throws runtime exception.
 */
@ActionMapping(params = "action=showFuels")
public void showFuels(Model model, ActionRequest request, ActionResponse response) throws Exception
{
	_log.info("this is show adverts method and itis Action Method");
	  
   
	String portalURL = PortalUtil.getPortalURL(request);
	response.sendRedirect(portalURL+"/group/fiternity/fuel");
}

}
