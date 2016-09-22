package com.fiternity.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.liferay.portal.kernel.events.Action;
import com.liferay.portal.kernel.events.ActionException;
import com.liferay.portal.kernel.struts.LastPath;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.WebKeys;

/**
 * CustomPostLoginAction class extends Action class and override its run method.
 * This method is used for redirecting to admin-panel page automatically after the user log in attempt is successful.
 * 
 */
public class CustomPostLoginAction extends Action {


	/**
	 * this overridden method used for redirecting to admin-panel page after successful log in.
	 * 
	 * @param req HttpServletRequest contains servlet's service methods (doGet, doPost, etc).
	 * @param res HttpServletResponse provide HTTP-specific functionality in sending a response.
	 * @throws ActionException It throws when required action is not done.
	 * 
	 */
	@Override
	public void run(HttpServletRequest req, HttpServletResponse res) throws ActionException {
		LastPath privatelastPath = new LastPath(StringPool.BLANK, "/group/fiternity/admin-panel");
			HttpSession session = req.getSession();
			session.setAttribute(WebKeys.LAST_PATH, privatelastPath);	
	}
}
