package com.ccoa.admin;

import java.util.Date;
import java.util.Map;

import org.apache.log4j.Logger;

import com.ccoa.admin.set.Category;
import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.jfinal.aop.Before;

/**
 * 新闻公告发布
 * 
 * @author hr
 * 
 */
@Before(AdminUserInterceptor.class)
public class NewsController extends BaseController {

	private static Logger log = Logger.getLogger(NewsController.class);

	// 新闻公告

	public void index() {
		Map<String, String> queryParam = getQueryParam();
		setAttr("newsPage", News.me.paginate(getParaToInt("pageNumber", 1),
				Constants.PAGE_SIZE, queryParam.get("newsTitle"),
				queryParam.get("newsDate"), ""));
		setAttr("queryParam", queryParam);
		render("newsList.html");
	}

	public void add() {
		setAttr("news", new News());
		render("newsEdit.html");
	}

	public void edit() {
		News news = News.me.findById(getParaToInt("id"));
		setAttr("news", news);
		render("newsEdit.html");
	}

	public void delete() {
		try {
			String ids = getPara("ids");
			News.me.deleteByIds(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void save() {
		try {
			News news = getModel(News.class);
			if (news.get("id", null) == null) {
				news.set("NewsDate", new Date());
				news.set("status", "1"); // 默认已发布状态
				news.save();
			} else {
				news.update();
			}
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void operate() {
		try {
			int id = getParaToInt("news.id", 0);
			int status = getParaToInt("news.status", 0);
			News.me.operate(status, id);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

}
