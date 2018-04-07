package com.ccoa.admin.set;

import com.ccoa.project.MajorCompany;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * BlogController 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller
 * 中，养成好习惯，有利于大型项目的开发与维护
 */
public class FromTaskController extends Controller {
	public void index() {
		setAttr("blogPage", MajorCompany.me.paginate(getParaToInt(0, 1), 10));
		render("blog.html");
	}

	public void add() {
	}

	public void save() {
		getModel(MajorCompany.class).save();
		redirect("/blog");
	}

	public void edit() {
		setAttr("blog", MajorCompany.me.findById(getParaToInt()));
	}

	public void update() {
		getModel(MajorCompany.class).update();
		redirect("/blog");
	}

	public void delete() {
		MajorCompany.me.deleteById(getParaToInt());
		redirect("/blog");
	}
}
