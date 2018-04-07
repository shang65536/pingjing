package com.ccoa.admin.set;

import java.util.Map;

import org.apache.log4j.Logger;

import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.expert.Expert;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.jfinal.aop.Before;

@Before(AdminUserInterceptor.class)
public class ExpertSetController extends BaseController {

	private static Logger log = Logger.getLogger(ExpertSetController.class);

	public void index() {
		Map<String, String> queryParam = getQueryParam();
		setAttr("expertPage", Expert.me.paginateSet(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE,
				queryParam.get("Name"), queryParam.get("ChapterName"),
				queryParam.get("Job")));
		setAttr("queryParam", queryParam);
		render("expertList.html");
	}

	public void add() {
		setAttr("expert", new Expert());
		render("expertEdit.html");
	}

	public void edit() {
		Expert expert = Expert.me.findById(getParaToInt("id"));
		setAttr("expert", expert);
		render("expertEdit.html");
	}

	public void delete() {
		try {
			String ids = getPara("ids");
			Expert.me.deleteByIds(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void save() {
		try {
			Expert expert = getModel(Expert.class);
			if (expert.get("id", null) == null || expert.getInt("id") <= 0) {
				expert.save();
			} else {
				expert.update();
			}
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	/**
	 * 单个设置
	 */
	public void operate() {
		try {
			int id = getParaToInt("expert.id", 0);
			int change = getParaToInt("expert.Change", 0);
			Expert.me.operate(change, id);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	/**
	 * 批量设置
	 */
	public void bacthOperate() {
		try {
			String ids = getPara("ids");
			int change = getParaToInt("expert.Change", 0);
			Expert.me.bacthOperate(change, ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}
}
