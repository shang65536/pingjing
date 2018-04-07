package com.ccoa.admin.set;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.ccoa.admin.Admin;
import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.company.Company;
import com.ccoa.expert.Expert;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.ccoa.project.Project;
import com.ccoa.utils.EncryptionUtil;
import com.jfinal.aop.Before;
import com.jfinal.ext.render.excel.PoiRender;

/**
 * GroupController 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller
 * 中，养成好习惯，有利于大型项目的开发与维护
 */
@Before(AdminUserInterceptor.class)
public class RegisterController extends BaseController {

	private static Logger log = Logger.getLogger(RegisterController.class);

	// 项目登记管理 首页
	public void index() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {

			Map<String, String> queryParam = getQueryParam();

			// 默认年份
			Calendar c = Calendar.getInstance();
			// 转换日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
			String gyear = sdf.format(c.getTime()); // 获取当前年份
			setAttr("years", Project.me.years(Integer.parseInt(gyear))); // 只能是当前年份

			if (queryParam.get("ApplyYear") != null) {
				gyear = queryParam.get("ApplyYear");
			}

			queryParam.put("ApplyYear", gyear);

			setAttr("projectPage", Project.me.projectRegisterPage(
					getParaToInt("pageNumber", 1), Constants.PAGE_SIZE,
					queryParam));
			setAttr("fromtaskList", FromTask.me.findAll());
			setAttr("user", user);
			setAttr("queryParam", queryParam);

			render("guanli-kejij02.html");
		}
	}

	// 导出 项目登记信息
	public void toProjectDjExcel() throws IllegalStateException {

		Map<String, String> queryParam = getQueryParam();
		List geList = Project.me.projectRegisterPage(
				getParaToInt("pageNumber", 1), 500, queryParam).getList();
		for (int i = 0; i < geList.size(); i++) {
			Project map = (Project) geList.get(i);
			map.put("id", i + 1);// 连续的序号
		}

		String[] columns = { "id", "RegisterNum", "ProjectCN", "CompanyName",
				"pkName", "RecommendCompany", "LinkmanName", "LinkmanPhone",
				"CompanyAddress", "ZipCode", "Email", "CategoryName", "sfName",
				"GroupName", "Status", "Remark" };
		String[] heades = { "序号", "登记号", "项目名称", "主要完成单位", "主要完成人", "推荐单位",
				"联系人", "联系电话", "通讯地址", "邮编", "邮箱", "评奖类别", "项目来源", "专业评审组",
				"项目状态", "备注" };

		render(PoiRender.me(geList).fileName("projectExpert.xls")
				.sheetName("项目登记列表").headers(heades).columns(columns)
				.cellWidth(5000).headerRow(2));

	}

	// 维护登记号
	public void RegisterSub() {
		// 先验证数值是否 未被改变
		int id = getParaToInt("id");
		int RegisterNum = getParaToInt("RegisterNum");
		String ApplyYear = getPara("year");

		Project p = Project.me.findById(id);
		// 值未被改变 不需要验证 并且不调用修改方法
		if (p.getInt("RegisterNum") != null
				&& RegisterNum == p.getInt("RegisterNum")) {
			renderJson("success", false);
		} else // 再验证是否有重复的情况
		{
			Long yz = Project.me.RegisterSub(RegisterNum,ApplyYear);
			if (yz > 0) {
				renderJson("success", "登记号重复，请重新编辑!");
			} else {
				p.set("RegisterNum", RegisterNum).update(); // 修改登记号
				renderJson("success", "操作成功");
			}
		}

	}

	// 维护登记号时 项目备注
	public void RegisterRemark() {
		try {
			int id = getParaToInt("id");
			String Remark = getPara("Remark");
			Project.me.findById(id).set("Remark", Remark).update();
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	// 形式审查 主页面
	public void reviewIndex() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {

			Map<String, String> queryParam = getQueryParam();
			// 默认年份
			Calendar c = Calendar.getInstance();
			// 转换日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
			String gyear = sdf.format(c.getTime()); // 获取当前年份
			setAttr("years", Project.me.years(Integer.parseInt(gyear))); // 只能是当前年份

			if (queryParam.get("ApplyYear") != null) {
				gyear = queryParam.get("ApplyYear");
			}

			queryParam.put("ApplyYear", gyear);

			Prize prize = Prize.me.findMaxPrize();
			if (prize == null) {
				prize = new Prize();
			}
			setAttr("prize", prize);

			setAttr("projectPage", Project.me.projectReviewPage(
					getParaToInt("pageNumber", 1), Constants.PAGE_SIZE,
					queryParam));
			setAttr("GroupList", ProjectGroup.me.findAll());
			setAttr("CategoryList", Category.me.findAll());
			setAttr("user", user);
			setAttr("queryParam", queryParam);
			render("guanli-kejij03.html");
		}
	}

	// 形式审查维护
	public void saveReview() {
		try {

			Fromreview fr = getModel(Fromreview.class);

			// 并且同时更新 项目状态及意见
			Project p = Project.me.findById(fr.getInt("ProjectID"));
			p.set("Note", fr.get("Note"));
			// 项目表中 2表示形式审查合格 3表示形式审查不合格 所以需要判断
			if (fr.getInt("Status") == 0) // 形式审查表中 0表示不通过 1表示通过
			{
				p.set("Status", 3);
			} else if (fr.getInt("Status") == 1) {
				p.set("Status", 2);
			}

			p.update();
			fr.save();

			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}

	}

	// 查看审查历史记录
	public void seeReview() {
		Long ProjectID = getParaToLong("ProjectID");
		Long AdminID = getParaToLong("AdminID");
		setAttr("reviewPage", Fromreview.me.selectFRbyId(ProjectID, AdminID));
		render("guanli-kejij03ReviewList.html");
	}

	// 导出审查结果表
	public void toProjectSCExcel() throws IllegalStateException {
		Map<String, String> queryParam = getQueryParam();
		List geList = Project.me.projectReviewPage(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, queryParam)
				.getList();
		for (int i = 0; i < geList.size(); i++) {
			Project map = (Project) geList.get(i);
			map.put("id", i + 1);// 连续的序号
			if (map.get("rStatus") != null && map.getInt("rStatus") == 1) {
				map.put("rStatus", "同意");
			} else if (map.get("rStatus") != null && map.getInt("rStatus") == 0) {
				map.put("rStatus", "未同意");
			} else {
				map.put("rStatus", "未操作");
			}
		}
		String[] columns = { "id", "RegisterNum", "ProjectCN", "CategoryName",
				"GroupName", "RecommendCompany", "rStatus", "Note" };
		String[] heades = { "序号", "登记号", "项目名称", "评奖类别", "专业评审组", "推荐单位",
				"形式审查结果", "形式审查意见 " };

		render(PoiRender.me(geList).fileName("pScExpert.xls")
				.sheetName("项目形式审查列表").headers(heades).columns(columns)
				.cellWidth(5000).headerRow(2));
	}

	// 受理公示表 首页
	public void caseIndex() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {

			Map<String, String> queryParam = getQueryParam();

			// 默认年份
			Calendar c = Calendar.getInstance();
			// 转换日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
			String gyear = sdf.format(c.getTime()); // 获取当前年份
			setAttr("years", Project.me.years(Integer.parseInt(gyear))); // 只能是当前年份
			String yy= gyear;

			if (queryParam.get("ApplyYear") != null) {
				gyear = queryParam.get("ApplyYear");
			}
			queryParam.put("SL", "1"); // 表示受理公示查询
			queryParam.put("ApplyYear", yy);

			setAttr("projectPage", Project.me.projectRegisterPage(
					getParaToInt("pageNumber", 1), Constants.PAGE_SIZE,
					queryParam));
			setAttr("fromtaskList", FromTask.me.findAll());
			setAttr("user", user);
			setAttr("queryParam", queryParam);

			render("guanli-kejij04.html");
		}
	}

	// 导出受理公示结果表
	public void toProjectSLExcel() throws IllegalStateException {
		Map<String, String> queryParam = getQueryParam();
		// 默认年份
		Calendar c = Calendar.getInstance();
					// 转换日期格式
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
					String gyear = sdf.format(c.getTime()); // 获取当前年份
					setAttr("years", Project.me.years(Integer.parseInt(gyear))); // 只能是当前年份
					String yy= gyear;
					String sl="1";

					if (queryParam.get("ApplyYear") != null) {
						gyear = queryParam.get("ApplyYear");
					}
					queryParam.put("SL", sl); // 表示受理公示查询
					queryParam.put("ApplyYear", yy);

		List geList = Project.me.projectRegisterPage(
				getParaToInt("pageNumber", 1), 63356, queryParam).getList();
		for (int i = 0; i < geList.size(); i++) {
			Project map = (Project) geList.get(i);
			map.put("id", i + 1);// 连续的序号
		}
		String[] columns = { "id", "RegisterNum", "ProjectCN", "CompanyName",
				"pkName", "RecommendCompany" };
		String[] heades = { "序号", "登记号", "名称", "单位", "主要完成人", "推荐单位" };

		render(PoiRender.me(geList).fileName("projectSLExpert.xls")
				.sheetName("受理公示列表").headers(heades).columns(columns)
				.cellWidth(5000).headerRow(2));
	}

}
