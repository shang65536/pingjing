package com.ccoa.handler;

import com.jfinal.handler.Handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by leilufeng on 15/4/8.
 */
public class HtmlHandler extends Handler {
    @Override
    public void handle(String s, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, boolean[] booleans) {
        //过滤.html请求，但以js/kindeditor/baidumap/map.html结尾的排除
    	if(s.lastIndexOf(".html") != -1 && s.lastIndexOf("baidumap/map.html") == -1) {
            s = s.substring(0, s.indexOf(".html"));
        }
        nextHandler.handle(s, httpServletRequest, httpServletResponse, booleans);
    }
}
