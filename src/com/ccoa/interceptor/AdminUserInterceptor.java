package com.ccoa.interceptor;

import com.ccoa.admin.Admin;
import com.ccoa.common.Constants;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.UnsupportedEncodingException;

/**
 * Created by leilufeng on 15/5/2.
 */
public class AdminUserInterceptor implements Interceptor {
	@Override
	public void intercept(ActionInvocation ai) {
		HttpServletRequest request = ai.getController().getRequest();
		HttpSession session = ai.getController().getSession();
		Admin user = (Admin) session.getAttribute(Constants.Admin_User_Session);
		if (user == null) {
			String uri = request.getRequestURI();
			String param = "";
			if (request.getQueryString() != null) {
				try {
					param = new String(request.getQueryString().getBytes(
							"ISO8859-1"), "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			}
			if (!param.equals(""))
				uri += "?" + param;
			session.setAttribute(Constants.BEFORE_URL, uri);
			ai.getController().redirect("/adminlogin");
		} else {
			request.setAttribute("user", user);
			ai.invoke();
		}
	}
}
