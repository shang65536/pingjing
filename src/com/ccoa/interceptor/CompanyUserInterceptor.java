package com.ccoa.interceptor;

import com.ccoa.common.Constants;
import com.ccoa.company.Company;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * Created by leiufeng on 15/5/2.
 */
public class CompanyUserInterceptor implements Interceptor {
	@Override
	public void intercept(ActionInvocation ai) {
		HttpServletRequest request = ai.getController().getRequest();
		HttpSession session = request.getSession();
		Company user = (Company) session
				.getAttribute(Constants.Company_User_Session);		
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
			System.out.println("打印:" + param);
			session.setAttribute(Constants.BEFORE_URL, uri);
			ai.getController().redirect("/companylogin");
		} else {
			request.setAttribute("user", user);
			ai.invoke();
		}
	}
}
