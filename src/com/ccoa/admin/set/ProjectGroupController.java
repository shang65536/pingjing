package com.ccoa.admin.set;

import org.apache.log4j.Logger;

import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.jfinal.aop.Before;

/**
 * GroupController 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller
 * 中，养成好习惯，有利于大型项目的开发与维护
 */
@Before(AdminUserInterceptor.class)
public class ProjectGroupController extends BaseController {

	private static Logger log = Logger.getLogger(ProjectGroupController.class);

	public void index() {
		setAttr("groupPage", ProjectGroup.me.paginate(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE));
		render("groupList.html");
	}

	public void add() {
		setAttr("group", new ProjectGroup());
		render("groupEdit.html");
	}

	public void edit() {
		ProjectGroup group = ProjectGroup.me.findById(getParaToInt("id"));
		setAttr("group", group);
		render("groupEdit.html");
	}

	public void delete() {
		try {
			String ids = getPara("ids");
			ProjectGroup.me.deleteByIds(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void save() {
		try {
			ProjectGroup group = getModel(ProjectGroup.class);
			long checkr = ProjectGroup.me.checkName(group.getStr("Name")); // 验证是否重复
			if (checkr > 0) {
				renderJson("success", false);
			} else {
				if (group.get("id", null) == null || group.getInt("id") <= 0) {
					group.save();
				} else {
					group.update();
				}
				renderJson("success", true);
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void operate() {
		try {
			int id = getParaToInt("projectGroup.id", 0);
			int status = getParaToInt("projectGroup.Status", 0);
			ProjectGroup.me.operate(status, id);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}
}
