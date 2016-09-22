package com.fiternity.servicecontroller;

import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;

@Controller(value = "FiternityServiceController")
@RequestMapping("VIEW")
public class FiternityServiceController {
	private static final Log _log = LogFactoryUtil.getLog(FiternityServiceController.class.getName());
	
	
	/**
	   * It will display view page and implemented for testing.
	   * 
	   * @param request An object sent to the portlet to handle a render.
	   * @param response An object to assist a portlet in sending a response to the portal.
	   * @param model It is for adding attributes to the model.
	   * @return Page name as a string that has to be loaded.
	   */
	@RenderMapping
	 public String handleRenderRequest(RenderRequest request,RenderResponse response,Model model){
	  
	  return "view";
	 }

}
