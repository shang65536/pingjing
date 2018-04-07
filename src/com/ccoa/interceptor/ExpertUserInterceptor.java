package com.ccoa.interceptor;

import com.ccoa.common.Constants;
import com.ccoa.expert.Expert;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * Created by leiufeng on 15/5/2.
 */
public class ExpertUserInterceptor implements Interceptor {
	@Override
	public void intercept(ActionInvocation ai) {
		HttpServletRequest request = ai.getController().getRequest();
		HttpSession session = request.getSession();
		Expert user = (Expert) session
				.getAttribute(Constants.Expert_User_Session);
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
			ai.getController().redirect("/expertlogin");
		} else {
			request.setAttribute("user", user);
			ai.invoke();
		}
	}
}
