package com.pis.redirectAction;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.struts.BaseStrutsAction;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.theme.ThemeDisplay;

/**
 * RedirectAction class extends BaseStrutsAction class and override its execute method.
 * This method is used for redirecting to studios edit page automatically after the user who has a role 'Studio Owner' integrate Instagram with their studio account.
 * 
 */
public class RedirectAction extends BaseStrutsAction {
	private static final Log _log = LogFactoryUtil.getLog(RedirectAction.class.getName());
	
	/**
	 * this overridden method used for redirecting to admin-panel page after successful log in.
	 * 
	 * @param req HttpServletRequest contains servlet's service methods (doGet, doPost, etc).
	 * @param res HttpServletResponse provide HTTP-specific functionality in sending a response.
	 * @throws Exception It throws runtime exception.
	 * 
	 */
@Override
public String execute(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
		ThemeDisplay themeDisplay = (ThemeDisplay) request
			.getAttribute(com.liferay.portal.kernel.util.WebKeys.THEME_DISPLAY);
		String code = ParamUtil.getString(request, "code");
		_log.info("code -->"+code);
		HttpSession psession = request.getSession(); 
	  
		String sessionurl = (String)psession.getAttribute("MYURL");
		HttpSession sescode = request.getSession(); 
		sescode.setAttribute("code", code);
		String myurl=themeDisplay.getPortalURL()+sessionurl;
		_log.info("Session url---  "+sessionurl);
	 
		_log.info("My URL---->"+myurl);
		if (Validator.isNotNull(code) && Validator.isNotNull(myurl) ) {
		
		response.sendRedirect(myurl+"&code="+code);
		_log.info("redirecting to "+myurl+"&code="+code);
	}
	
	return null;
}
}
