package com.ccoa.handler;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.ccoa.common.Constants;
import com.ccoa.utils.ToolWeb;
import com.jfinal.handler.Handler;

/**
 * 全局Handler，设置一些通用功能
 * 
 * @author yun 描述：主要是一些全局变量的设置
 */
public class GlobalHandler extends Handler {

	private static Logger log = Logger.getLogger(GlobalHandler.class);

	public static final String reqSysLogKey = "reqSysLog";

	@Override
	public void handle(String target, HttpServletRequest request,
			HttpServletResponse response, boolean[] isHandled) {
		log.info("初始化");

		// String cxt = ToolWeb.getContextPath(request);
		// request.setAttribute("cxt", cxt);
		//System.out.println("================:"+request.getSession().getAttribute(Constants.SESSION_USER_TYPE));
		request.setAttribute("session_user_type", request.getSession()
				.getAttribute(Constants.SESSION_USER_TYPE));// 用户类型
		request.setAttribute("requestURL", request.getRequestURL());

		log.debug("request cookie 处理");
		Map<String, Cookie> cookieMap = ToolWeb.readCookieMap(request);
		request.setAttribute("cookieMap", cookieMap);

		log.debug("request param 请求参数处理");
		request.setAttribute("paramMap", ToolWeb.getParamMap(request));

		log.info("设置Header");
		request.setAttribute("decorator", "none");
		response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setDateHeader("Expires", 0); // prevents caching at the proxy
												// server

		nextHandler.handle(target, request, response, isHandled);

		log.info("请求处理完毕");

	}

}
