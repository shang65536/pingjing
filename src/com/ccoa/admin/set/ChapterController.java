package com.ccoa.admin.set;

import org.apache.log4j.Logger;

import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.jfinal.aop.Before;

/**
 * ChapterController 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller
 * 中，养成好习惯，有利于大型项目的开发与维护
 */
@Before(AdminUserInterceptor.class)
public class ChapterController extends BaseController {
	private static Logger log = Logger.getLogger(ChapterController.class);

	public void index() {
		setAttr("chapterPage", Chapter.me.paginateopen(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE));
		render("chapterList.html");
	}

	public void add() {
		setAttr("chapter", new Chapter());
		render("chapterEdit.html");
	}

	public void edit() {
		Chapter chapter = Chapter.me.findById(getParaToInt("id"));
		setAttr("chapter", chapter);
		render("chapterEdit.html");
	}

	public void delete() {
		try {
			String ids = getPara("ids");
			Chapter.me.deleteByIds(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void save() {
		try {
			Chapter chapter = getModel(Chapter.class);
			long checkr = Chapter.me.checkName(chapter.getStr("Name")); // 验证是否重复
			if (checkr > 0) {
				renderJson("success", false);
			} else {
				if (chapter.get("id", null) == null
						|| chapter.getInt("id") <= 0) {
					chapter.save();
				} else {
					chapter.update();
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
			int id = getParaToInt("chapter.id", 0);
			int status = getParaToInt("chapter.Status", 0);
			Chapter.me.operate(status, id);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}
}
