package com.ccoa.admin.set;

import java.util.Date;
import java.util.Map;

import org.apache.log4j.Logger;

import com.ccoa.admin.Admin;
import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.jfinal.aop.Before;
import com.jfinal.upload.UploadFile;

/**
 * 模板管理
 * 
 */
@Before(AdminUserInterceptor.class)
public class TemplateController extends BaseController {

	private static Logger log = Logger.getLogger(TemplateController.class);

	public void index() {
		Map<String, String> queryParam = getQueryParam();
		setAttr("templatePage", Template.me.paginate(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE));
		setAttr("queryParam", queryParam);
		render("templateList.html");
	}

	public void add() {
		setAttr("template", new Template());
		render("templateEdit.html");
	}

	public void edit() {
		Template template = Template.me.findById(getParaToInt("id"));
		setAttr("template", template);
		render("templateEdit.html");
	}

	public void delete() {
		try {
			String ids = getPara("ids");
			Template.me.deleteByIds(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	/**
	 * 上传下载，只有创建，没有更新
	 */
	public void save() {
		try {
			UploadFile upFile = upload();
			Template template = getModel(Template.class);
			Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
			System.out.println(upFile.getSaveDirectory()
					.replace(WebRootPath, "").replace("\\", "/"));

			String path = upFile.getSaveDirectory().replace(WebRootPath, "")
					.replace("\\", "/");
			template.set("Date", new Date());
			template.set("AdminId", user.getInt("id"));
			template.set("Path", path + upFile.getOriginalFileName());// 文件上传子目录+文件名
																		// 存入数据库中
			template.save();
			setAttr("templatePage", Template.me.paginate(
					getParaToInt("pageNumber", 1), Constants.PAGE_SIZE));
			Map<String, String> queryParam = getQueryParam();
			setAttr("queryParam", queryParam);
			render("templateList.html");
			// renderJson("success",true);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			// renderJson("success",false);
		}
	}

	/**
	 * 下载
	 */
	public void download() {
		try {
			String id = getPara("id");
			Template template = Template.me.findById(id);
			String Path = "";
			if (template != null) {
				Path = template.get("Path");
			}
			renderFile(Path);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			redirect("/admin/set_template");
		}
	}
}
