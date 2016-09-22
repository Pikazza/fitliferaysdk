package com.fiternity.fuels.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import com.fiternity.servicecontroller.FileUploderUtil;
import com.liferay.portal.kernel.cache.PortalCache;
import com.liferay.portal.kernel.cache.SingleVMPoolUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;
import com.liferay.util.portlet.PortletProps;

/**
 * Portlet implementation class FuelsController
 */
@Controller(value="FuelsController")
@RequestMapping("VIEW")
public class FuelsController {
	private static final Log _log = LogFactoryUtil.getLog(FuelsController.class.getName());
	public static final String IMAGE_FOLDER_NAME=PortletProps.get("fiternity.image.foldername");
	
	PortalCache<String, Serializable> cache = SingleVMPoolUtil.getCache("Fiternity");    
	@Autowired      
	private FiternityService fiternityService;
	
	@RenderMapping
	public String showFuels(Model model, RenderRequest request, RenderResponse response) throws PortletException, SystemException
	{
		_log.info("listing all the restaurants");
		String jsonout=null;
		int pages=0,pageNo=1, listLength=0;
		JSONArray ja=new JSONArray();
		JSONArray ja1=new JSONArray();
		
		try {			
			if(cache.get("FuelsPage") == null){
			jsonout = fiternityService.getFuelsListing("ALL");
			cache.put("FuelsPage", (Serializable)jsonout);
	        _log.info("cache is "+(String)SingleVMPoolUtil.getCache("Fiternity").get("FuelsPage"));
	       
			}
			if(cache.get("FuelsPage") != null){
				pageNo  = ParamUtil.getInteger(request, "pageNo")==0?1:ParamUtil.getInteger(request, "pageNo");
				jsonout =cache.get("FuelsPage").toString();
				
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
			_log.debug("Exception throws in Notification listing "+e.getMessage());
		}
		
		request.setAttribute("return", ja);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pages", pages);
		_log.info("pages no "+pageNo);
		return "fuels-listing";
	}
	
	/**
	   * Renders edit restaurant page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=showEdit")
	public String renderEditFuel(Model model, RenderRequest request, RenderResponse response) throws PortletException
	{
		String resId=	ParamUtil.getString(request, "resId" );
		_log.info("this is details page of fuel section with res id "+resId );
		
		try {
			String output=fiternityService.getFuelDetails(resId);
			_log.info("the out put is "+output);
			request.setAttribute("return", output);
		} catch (Exception e) {	
			request.setAttribute("return","null" );
			_log.debug("Exception throws while loading edit page "+e.getMessage());
		}
		return "edit-fuel";
	}
	
	 /**
	   * Renders add restaurant page.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping(params = "render=addFuel")
	public String renderaddFuel(Model model, RenderRequest request, RenderResponse response){

		return "add-fuel";
		
	}
	
	/**
	   * It method will add new restaurant by calling web services.
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
	@ActionMapping(params = "action=addFuel")
	public void doAddFuel(Model model, ActionRequest request,ActionResponse response) throws PortalException,SystemException,UnknownException,FileNotFoundException, java.text.ParseException
	{
		JSONObject obj = new JSONObject();
		DateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(request);
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		System.out.println(" restaurant will be added ");
		//int beaId  = ParamUtil.getInteger(request, "beaId" );
		String resName  = ParamUtil.getString(request, "resName","" );
		String resType  = ParamUtil.getString(request, "resType","" );
		String resLat  = ParamUtil.getString(request, "resLat","" );
		String resLong  = ParamUtil.getString(request, "resLong","" );
		String resStatus  = ParamUtil.getString(request, "resStatus","" );
		String createdOn  = dateformat.format(new Date());
		
		String fileName=uploadPortletRequest.getFileName("resImage");
		File file = uploadPortletRequest.getFile("resImage");
		String resImage="null";
		if(!(fileName.isEmpty())){
			resImage  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file,resName+"_cover");
		}
		String fileName1=uploadPortletRequest.getFileName("resIcon");	
		File file1 = uploadPortletRequest.getFile("resIcon");
		String  resIcon="null";
		if(!(fileName1.isEmpty())){
			resIcon  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file1,resName+"_icon");
		}
		
		if(!( resName.isEmpty() || resType.isEmpty()  || resLat.isEmpty() || resLong.isEmpty() )){
			try{
		
				obj.put("RES_ID", "0");
				obj.put("RES_NAME", resName);
				obj.put("RES_COVER_IMAGE", resImage);
				obj.put("RES_LOGO", resIcon);
				obj.put("RES_LATITUDE",resLat );
				obj.put("RES_LONGITUDE", resLong);
				obj.put("RES_CLASSIFICATION", resType);
				obj.put("RES_STATUS",resStatus );
				obj.put("RES_CREATED_DATE", createdOn);
				
				_log.info("the inputs field of restaurant before add is "+obj.toString());
				String output=fiternityService.saveFuel(obj.toString());
				_log.info("the response is "+output);
				cache.remove("FuelsPage");
			}
			catch (Exception e) {
				request.setAttribute("formerror",e.getMessage() );
				request.setAttribute("resName", resName);
				request.setAttribute("resLat", resLat);
				request.setAttribute("resLong", resLong);
				request.setAttribute("resType", resType);
				response.setRenderParameter("render", "addFuel");
			}
	}
		else{
			request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
			request.setAttribute("resName", resName);
			request.setAttribute("resLat", resLat);
			request.setAttribute("resLong", resLong);
			request.setAttribute("resType", resType);
			response.setRenderParameter("render", "addFuel");
			
		}
	
	}
	
	/**
	   * It method will update restaurant by calling web services.
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
	@ActionMapping(params = "action=editFuel")
	public void doEditFuel(Model model, ActionRequest request,ActionResponse response) throws PortalException,SystemException,UnknownException,FileNotFoundException, java.text.ParseException
	{
		JSONObject obj = new JSONObject();
		DateFormat dateformat = new SimpleDateFormat("dd/MM/yyyy");
		UploadPortletRequest uploadPortletRequest = PortalUtil.getUploadPortletRequest(request);
		ThemeDisplay themeDisplay = (ThemeDisplay) request.getAttribute(WebKeys.THEME_DISPLAY);
		System.out.println("given current restaurant will be edited ");
		String resId  = ParamUtil.getString(request, "resId" );
		String resName  = ParamUtil.getString(request, "resName","" );
		String resType  = ParamUtil.getString(request, "resType","" );
		String resLat  = ParamUtil.getString(request, "resLat","" );
		String resLong  = ParamUtil.getString(request, "resLong","" );
		String resStatus  = ParamUtil.getString(request, "resStatus","" );
		String createdOn  =  dateformat.format(ParamUtil.getDate(request, "createdOn", new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.S")));
		
		String fileName=uploadPortletRequest.getFileName("resImage");
		File file = uploadPortletRequest.getFile("resImage");
		String resImage=ParamUtil.getString(request, "resImgUrl","" );
		if(! fileName.isEmpty()   ){
			resImage  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file,resName+"_cover");
		}
		
		String fileName1=uploadPortletRequest.getFileName("resIcon");	
		File file1 = uploadPortletRequest.getFile("resIcon");
		String  resIcon=ParamUtil.getString(request, "resIconUrl","" );
		if(!fileName1.isEmpty()){
			resIcon  =FileUploderUtil.fileUploadByApp(IMAGE_FOLDER_NAME,themeDisplay,request,file1,resName+"_icon");
		}
		
		
		if(!( resName.isEmpty() || resType.isEmpty()  || resLat.isEmpty() || resLong.isEmpty() )){
			try{
		
				obj.put("RES_ID", resId);
				obj.put("RES_NAME", resName);
				obj.put("RES_COVER_IMAGE", resImage);
				obj.put("RES_LOGO", resIcon);
				obj.put("RES_LATITUDE",resLat );
				obj.put("RES_LONGITUDE", resLong);
				obj.put("RES_CLASSIFICATION", resType);
				obj.put("RES_STATUS",resStatus );
				obj.put("RES_CREATED_DATE", createdOn);
				
				_log.info("the inputs field of restaurant before edit is "+obj.toString());
				String output=fiternityService.saveFuel(obj.toString());
				_log.info("the response is "+output);
				cache.remove("FuelsPage");
			}
			catch (Exception e) {
				request.setAttribute("formerror",e.getMessage() );
				
				response.setRenderParameter("resId", resId);
				response.setRenderParameter("render", "showEdit");
			}
	}
		else{
			request.setAttribute("formerror", "There are few errors in the form. Please enter the correct details in the form below");
			response.setRenderParameter("resId", resId);
			response.setRenderParameter("render", "showEdit");
			
		}
	
	}
}
