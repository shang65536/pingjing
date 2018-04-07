package com.ccoa.review;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * BlogController
 * 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller 中，养成好习惯，有利于大型项目的开发与维护
 */
public class ReviewController extends Controller {
	public void index() {
		setAttr("blogPage", Review.me.paginate(getParaToInt(0, 1), 10));
		render("blog.html");
	}
	
	public void add() {
	}
	
	public void save() {
		getModel(Review.class).save();
		redirect("/blog");
	}
	
	public void edit() {
		setAttr("blog", Review.me.findById(getParaToInt()));
	}
	
	public void update() {
		getModel(Review.class).update();
		redirect("/blog");
	}
	
	public void delete() {
		Review.me.deleteById(getParaToInt());
		redirect("/blog");
	}
}


