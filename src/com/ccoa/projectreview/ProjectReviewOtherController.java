package com.ccoa.projectreview;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.ccoa.admin.set.Category;
import com.ccoa.admin.set.TemplateController;
import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.expert.Expert;
import com.ccoa.interceptor.ExpertUserInterceptor;
import com.ccoa.project.MajorCompany;
import com.ccoa.project.Project;
import com.ccoa.utils.StringUtils;
import com.jfinal.aop.Before;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;
import com.ccoa.utils.StringUtils;

/**
 * 评审项目 管理 其他奖项 2015.05.28 xdf
 */
@Before(ExpertUserInterceptor.class)
public class ProjectReviewOtherController extends BaseController {
	private static Logger log = Logger
			.getLogger(ProjectReviewOtherController.class);

	/**
	 * 评审项目 首页
	 * 
	 */
	public void index() {

		Map params = new HashMap();

		Map<String, String> queryParam = getQueryParam();

		String ProjectCN = queryParam.get("ProjectCN"); // 项目名称
		String Category = queryParam.get("Category"); // 评奖类型
		String recommend = queryParam.get("recommend");// 是否推荐
		String status = queryParam.get("status");// 操作类型

		// 获取当前登录专家编号
		Expert expert = getSessionAttr(Constants.Expert_User_Session);

		if (expert == null) {
			redirect("/");
		} else {

			int id = expert.get("id");
			params.put("ExpertID", id);
			params.put("ProjectCN", ProjectCN);
			params.put("Category", Category);
			params.put("recommend", recommend);
			params.put("status", status);

			setAttr("expert", expert);
			setAttr("queryParam", queryParam);
			setAttr("proReviewPage", ProjectReviewOther.dao.paginate(
					getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, params));

			// 调用显示评奖类别集合 用来显示动态下拉框
			Category me = new Category();
			setAttr("CategoryList", me.findAll());
			render("reviewOtherpt.html");
		}

	}

	/**
	 * 评审 首页
	 * 
	 */
	public void psmain() {
		String ProjectID = getPara("ProjectID"); // 项目编号
		String ExpertID = getPara("ExpertID"); // 专家编号
		String UserName = getPara("UserName"); // 专家编号

		setAttr("ProjectCN", Project.me.findById(ProjectID).get("ProjectCN"));
		setAttr("ProjectID", ProjectID);
		setAttr("ExpertID", ExpertID);
		setAttr("UserName", UserName);
		int RegisterNum = getParaToInt("RegisterNum"); // 登记号
		setAttr("RegisterNum", RegisterNum);

		String prid = getPara("prid"); // 已评ID

		if ("".equals(prid)) // 新增
		{
			setAttr("pro", new ProjectReviewOther());
		} else// 修改
		{
			ProjectReviewOther pro = ProjectReviewOther.dao
					.findById(getPara("prid"));
			setAttr("pro", pro);
			String ts = "未上传";
			if (StringUtils.isNotEmpty(pro.get("FilePath") + "")) {
				ts = "已上传";
			}
			setAttr("ts", ts);
		}

		// 根据评奖类别 跳转到不同页面
		render("psmbOther.html");
		// String ProjectCN=getPara("ProjectCN"); //登记号
	}

	/**
	 * 评审 新增 修改 如果没有提交前 还允许修改 评审记录
	 */
	public void psAdd() {
		try {
			String path = "";
			// 上传附件
			UploadFile file = getFile("projectReviewOther.FilePath",
					PathKit.getWebRootPath() + "/upload/qtjx",
					Constants.FILE_MAXSize, "utf-8");
			if (file != null) {
				// 得到文件名
				String fileName = file.getFileName();
				// 得到去掉后缀名 的名称
				String extension = fileName.substring(0,
						fileName.lastIndexOf("."));
				// 拼接保存到数据库的文件路径
				path = PathKit.getWebRootPath() + "/upload/qtjx/" + fileName;
			}
			ProjectReviewOther pro = getModel(ProjectReviewOther.class); // 获取页面表单数据
			pro

			.set("Status", "1");
			// 如果 prid 为空 则 新增 不为空 修改记录
			if (pro.get("id", null) != null) {
				if (path == "")// 修改时未上传 取数据库值进行覆盖
				{
					path = pro.findById(pro.get("id")).getStr("FilePath");
				}
				pro.set("FilePath", path).update();
			} else {
				pro.set("FilePath", path).save();
			}
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	/**
	 * 评审 提交所有项目
	 * 
	 */
	public void proTj() {
		Map params = new HashMap();
		// 获取当前登录专家编号
		Expert expert = getSessionAttr(Constants.Expert_User_Session);
		int id = expert.get("id");
		params.put("ExpertID", id);
		int pcount = ProjectReviewOther.dao.projectRevewCount(params);
		if (pcount > 0) // 大于0 表示 还有未评审的项目
		{
			setAttr("ts", "您还有" + pcount + "个未评审的项目，请全部评审后再提交！");
		} else // 调用修改方法 把状态改为 2 已提交
		{
			ProjectReviewOther.dao.projectRevewUpd(params);
			setAttr("ts", "提交成功!");
		}
		index();
	}

}
