package com.ccoa.admin.set;

import org.apache.log4j.Logger;

import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.jfinal.aop.Before;

/**
 * 评奖类别设置 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
 */
@Before(AdminUserInterceptor.class)
public class CategoryController extends BaseController {

	private static Logger log = Logger.getLogger(CategoryController.class);

	public void index() {
		// Map<String,String> queryParam = getQueryParam();
		setAttr("categoryPage", Category.me.paginate(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE));
		// setAttr("queryParam", queryParam);
		render("categoryList.html");
	}

	public void add() {
		setAttr("category", new Category());
		render("categoryEdit.html");
	}

	public void edit() {
		Category category = Category.me.findById(getParaToInt("id"));
		setAttr("category", category);
		render("categoryEdit.html");
	}

	public void delete() {
		try {
			String ids = getPara("ids");
			Category.me.deleteByIds(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void save() {
		try {
			Category category = getModel(Category.class);

			// 先验证是否有重复评奖类别
			long checkr = Category.me.checkName(category.getStr("Name"));
			if (checkr > 0) {
				renderJson("success", false);
			} else {
				if (category.get("id", null) == null
						|| category.getInt("id") <= 0) {
					category.save();
				} else {
					category.update();
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
			int id = getParaToInt("category.id", 0);
			int status = getParaToInt("category.Status", 0);
			Category.me.operate(status, id);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

}
