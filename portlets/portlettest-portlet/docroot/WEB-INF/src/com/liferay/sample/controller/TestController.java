package com.liferay.sample.controller;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.portlet.bind.annotation.RenderMapping;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;


@Controller(value="TestController")
@RequestMapping("VIEW")
public class TestController {
	private static Log _log = LogFactoryUtil.getLog(TestController.class);
	@RenderMapping
	 public String handleRenderRequest(RenderRequest request,RenderResponse response,Model model){
		_log.debug("default request handler is called");
				
	  return "personaldetails";
	 }
	
}
