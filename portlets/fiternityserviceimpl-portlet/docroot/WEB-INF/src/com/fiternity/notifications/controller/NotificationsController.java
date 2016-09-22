package com.fiternity.notifications.controller;

import java.io.Serializable;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.ActionMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

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
import com.liferay.portal.kernel.xml.Document;
import com.liferay.portal.kernel.xml.DocumentException;
import com.liferay.portal.kernel.xml.Node;
import com.liferay.portal.kernel.xml.SAXReaderUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portlet.journal.model.JournalArticle;
import com.liferay.portlet.journal.service.JournalArticleLocalServiceUtil;
import com.liferay.util.portlet.PortletProps;


/**
 * NotificationsController is controller class for app's notification and mail content portlet. This class allows us to  list , edit their content or get their details.
 * 
 * NotificationsController can be accessed by user who are all have roles like administrator or Site Admin.
 * 
 * All methods functionality is determined. So while executing, it has some restrictions on parameters.
 *  
 * Attempting to add or edit an ineligible object throws an unchecked exception, typically SQLGrammerException or NumberFormatException.
 * 
 * Attempting to query the presence of an ineligible data may throw an exception, or it may simply return false, or an empty value.
 */
@Controller(value = "NotificationsController")
@RequestMapping("VIEW")
public class NotificationsController {
	
	private static final Log _log = LogFactoryUtil.getLog(NotificationsController.class.getName());
	//FiternityServiceImpl  fiternityServiceImpl=new FiternityServiceImpl();
	PortalCache<String, Serializable> cache = SingleVMPoolUtil.getCache("Fiternity");
	public static final String ADVERTS_EMAIL_CONTENT_ID=PortletProps.get("adverts.email.article.id");
	public static final String EVENT_EMAIL_CONTENT_ID=PortletProps.get("events.email.article.id");
	public static final String CHALLENGE_EMAIL_CONTENT_ID=PortletProps.get("challenges.email.article.id");
	public static final String MODERATOR_EMAIL_CONTENT_ID=PortletProps.get("moderators.email.article.id");
	public static final String REWARD_EMAIL_CONTENT_ID=PortletProps.get("rewards.email.article.id");
	@Autowired      
	private FiternityService fiternityService;
	
	/**
	   * It will list all the app's notification by calling web services and display manage content page
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException It throws runtime exception.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping
	 public String showNotificationListing(RenderRequest request,RenderResponse response,Model model) throws UnknownException{
		
		_log.info("this is show notification method");
		String jsonout=null;
		int pages=0,pageNo=1, listLength=0;
		JSONArray ja=new JSONArray();
		JSONArray ja1=new JSONArray();
		
		try {			
			if(cache.get("NotificationsPage") == null){
			jsonout = fiternityService.getNotificationsListing();
			cache.put("NotificationsPage", (Serializable)jsonout);
	        _log.info("cache is "+(String)SingleVMPoolUtil.getCache("Fiternity").get("NotificationsPage"));
	       
			}
			if(cache.get("NotificationsPage") != null){
				pageNo  = ParamUtil.getInteger(request, "pageNo")==0?1:ParamUtil.getInteger(request, "pageNo");
				jsonout =cache.get("NotificationsPage").toString();
				
				ja1=new JSONArray(jsonout);
				int index=(int) (((pageNo*10)-10));
				listLength=ja1.length();
				pages= (int) Math.ceil(listLength/10.0);				
				
				for(int i=index;i<(index+10>listLength?listLength:index+10);i++){
				ja.put(ja1.getJSONObject(i));
				}
						
				_log.info("your cache is activated your page is " +pageNo +" content is  " +ja.toString() );
			}
		} catch (UnknownException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			_log.debug("Exception throws in Notification listing "+e.getMessage());
		}
		
		request.setAttribute("return", ja);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pages", pages);
		_log.info("pages no "+pageNo);
		return "notification-listing";
	 }
	
	/**
	   * It will list all the site's email content in display 'manage mail' page
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception UnknownException It throws runtime exception.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=showContentListing")
	public String showContentListing(Model model, RenderRequest request, RenderResponse response) throws PortalException, SystemException{
			
		String type=	ParamUtil.getString(request, "type" );
		_log.info("this is render method of show edit record  "+type);
		
		try {
			request.setAttribute("advertsId", ADVERTS_EMAIL_CONTENT_ID);
			request.setAttribute("eventId", EVENT_EMAIL_CONTENT_ID);
			request.setAttribute("challengeId", CHALLENGE_EMAIL_CONTENT_ID);
			request.setAttribute("moderatorId", MODERATOR_EMAIL_CONTENT_ID);
			request.setAttribute("rewardId", REWARD_EMAIL_CONTENT_ID);
		} catch (Exception e) {	
			request.setAttribute("return","null" );
			_log.debug("Exception throws in content listing "+e.getMessage());
		}
		 return "content-listing";
	}
	
	/**
	   * Renders manage mail page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @exception PortalException The base class for all exceptions related to business logic.
	   * @exception DocumentException It throws when parsing the xml documents.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=showContentedit")
	public String renderContentedit(Model model, RenderRequest request, RenderResponse response) throws PortalException, SystemException, DocumentException{
			
		String contentId=	ParamUtil.getString(request, "type" );
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		Long groupId = themeDisplay.getLayout().getGroupId();
		_log.info("this is render method of show content edit with article id of "+contentId);
		
		JournalArticle body=JournalArticleLocalServiceUtil.getLatestArticle(groupId,contentId);
	/*	 Document document = SAXReaderUtil.read(body.getContent());
				Node node = document.selectSingleNode("/root/static-content");
				String  output = node.getText(); 
				
				request.setAttribute("return", output);   */  
				request.setAttribute("return", body.getContent());
				
				_log.info("body.getContent() "+body.getVersion());
				request.setAttribute("version", body.getVersion());
				request.setAttribute("groupId", groupId);
				request.setAttribute("type", contentId);
				return "edit-content";
				
				
	}
	
	/**
	   * Renders manage content (edit notification) page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   * @exception PortalException The base class for all exceptions related to business logic.
	   * @exception DocumentException It throws when parsing the xml documents.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=showEdit")
	public String renderNotificationEdit(Model model, RenderRequest request, RenderResponse response) throws PortalException, SystemException,DocumentException{
			
		String type=	ParamUtil.getString(request, "type" );
		_log.info("this is render method of show edit record  "+type);
		
		try {
			String output=fiternityService.getNotificationDetails(type);
			_log.info("the out put is "+output);
			request.setAttribute("return", output);
		} catch (Exception e) {	
			request.setAttribute("return","null" );
			_log.debug("Exception throws in showing Notification details page "+e.getMessage());
		}
		 return "edit-notification";
	}
	
	
	/**
	   * This method get all the details of mail content and do update existing record.
	   * 
	   * @param request An object sent to the portlet to handle a action.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   */
	@ActionMapping(params = "action=doContentEdit")
	public void doContentEdit(Model model, ActionRequest request, ActionResponse response) throws PortalException, SystemException{

	_log.info("we going to edit Contents");
	int groupId  = ParamUtil.getInteger(request, "groupId" );
	String versionNo  = ParamUtil.getString(request, "version","" );
	String contType  = ParamUtil.getString(request, "contType","" );
	String contDesc  = ParamUtil.getString(request, "contDesc","" ); 
	if(!(groupId==0 || contType.isEmpty()   || contDesc.isEmpty())){
		try{
			JournalArticle body=JournalArticleLocalServiceUtil.updateContent(groupId, contType, Double.valueOf(versionNo) , contDesc);		
			_log.info("the email content has been succcessfully edited");
		}
		catch(Exception e){
			_log.debug("Exception throws in editing content details "+e.getMessage());
			request.setAttribute("formerror", e.getMessage());
			response.setRenderParameter("type", contType);
			response.setRenderParameter("render", "showContentedit");
		}
		
		}
	else{
		request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
		response.setRenderParameter("type", contType);
		response.setRenderParameter("render", "showEdit");
	}
	
	response.setRenderParameter("render", "showContentListing");
	}
	
	/**
	   * This method get all the details of manage app's notification content and do update existing record.
	   * 
	   * @param request An object sent to the portlet to handle a action.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @exception PortletException A general exception that a portlet can throw when it is unable to perform its operation.
	   * @exception SystemException A base class for all exceptions caused by system problems.
	   */
	@ActionMapping(params = "action=doEdit")
	public void doNotificationEdit(Model model, ActionRequest request, ActionResponse response) throws PortalException, SystemException{

	_log.info("we going to edit Notifications");
	JSONObject notify  = new JSONObject();
	String noteId  = ParamUtil.getString(request, "noteId","" );
	String noteType  = ParamUtil.getString(request, "noteType","" );
	String noteTitle  = ParamUtil.getString(request, "noteTitle","" );
	String noteDesc  = ParamUtil.getString(request, "noteDesc","" ); //

	if(!(noteId.isEmpty() || noteType.isEmpty()   || noteTitle.isEmpty() || noteDesc.isEmpty() || noteDesc.equals(""))){	
		try{
			
			notify.put("ID", noteId);
			notify.put("TYPE", noteType);
			notify.put("TITLE",noteTitle);
			notify.put("DESCRIPTION",noteDesc );
		
		_log.info("input field of notification before edit "+ notify.toString());
		String output=fiternityService.saveNotification(notify.toString());
		_log.info("the response is "+output);
		cache.remove("NotificationsPage");
			
		}
		catch(Exception e){
			_log.debug("Exception throws while editing Notification "+e.getMessage());
			request.setAttribute("formerror", e.getMessage());
			response.setRenderParameter("type", noteType);
			response.setRenderParameter("render", "showEdit");
		}
		
		}
	else{
		request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
		response.setRenderParameter("type", noteType);
		response.setRenderParameter("render", "showEdit");
	}
	
	}
}
