package com.ccoa.project;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ccoa.common.BaseController;
import com.ccoa.common.PDFWaterPrint;
import com.ccoa.common.Tools;

import javax.servlet.http.HttpServletResponse;

import com.ccoa.admin.set.Category;
import com.ccoa.admin.set.FromTask;
import com.ccoa.admin.set.GroupExpert;
import com.ccoa.admin.set.Prize;
import com.ccoa.admin.set.ProjectGroup;
import com.ccoa.common.Constants;
import com.ccoa.company.Company;
import com.ccoa.expert.Expert;
import com.ccoa.interceptor.CompanyUserInterceptor;
import com.ccoa.utils.StringUtils;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.jfinal.aop.Before;
import com.jfinal.ext.render.excel.PoiRender;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;


/**
 * BlogController 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller
 * 中，养成好习惯，有利于大型项目的开发与维护
 */
@Before(CompanyUserInterceptor.class)
public class ProjectController extends BaseController {

	public void index() {
		Map params = new HashMap();
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		removeSessionAttr(Constants.SESSION_USER_TYPE);
		setSessionAttr(Constants.SESSION_USER_TYPE, "company");
		Map<String, String> queryParam = getQueryParam();
		String ProjectCN = queryParam.get("ProjectCN"); // 项目名称	
		String Category = queryParam.get("Category"); // 评奖类型
		String Status = queryParam.get("Status");// 评奖状态
		String ApplyYear = queryParam.get("ApplyYear");// 年份

		if (user == null) {
			redirect("/");
		} else {

			long id = user.get("id");
			params.put("CompanyID", id); // 公司ID
			params.put("ProjectCN", ProjectCN);// 项目名称
			params.put("Category", Category); // 评奖类别
			params.put("Status", Status); // 评奖状态

			// 默认年份
			Calendar c = Calendar.getInstance();
			// 转换日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
			String gyear = sdf.format(c.getTime()); // 获取当前年份

			setAttr("years", Project.me.years(Integer.parseInt(gyear))); // 只能是当前年份

			if (ApplyYear != null) {
				gyear = ApplyYear;
			}

			params.put("ApplyYear", gyear);
			queryParam.put("ApplyYear", gyear);
			setAttr("user", user);

			// 项目打分规则 中获取申请时间范围
			Prize pz = Prize.me.findMaxPrize();
			if (pz != null) {
				setAttr("ApplyStartTime", pz.getTimestamp("ApplyStartTime") + "");
				setAttr("ApplyEndTime", pz.getTimestamp("ApplyEndTime") + "");
			}
			setAttr("queryParam", queryParam);
			// 调用显示评奖类别集合 用来显示动态下拉框
			Category me = new Category();
			setAttr("CategoryList", me.findAll());
			setAttr("projectList", Project.me.paginate(
					getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, params));

			Prize prize = Prize.me.findMaxPrize();
			if (prize == null) {
				prize = new Prize();
			}
			setAttr("prize", prize);
			// setAttr("project",Project.me.findById(getPara("id")));
			render("projectList.html");
		}
	}

	// 导出Excel 项目列表
	public void toExcel() throws IllegalStateException {

		Map params = new HashMap();
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		Map<String, String> queryParam = getQueryParam();
		String ProjectCN = queryParam.get("ProjectCN"); // 项目名称
		String Category = queryParam.get("Category"); // 评奖类型
		String Status = queryParam.get("Status");// 评奖状态
		String ApplyYear = queryParam.get("ApplyYear");// 年份

		long id = user.get("id");
		params.put("CompanyID", id); // 公司ID
		params.put("ProjectCN", ProjectCN);// 项目名称
		params.put("Category", Category); // 评奖类别
		params.put("Status", Status); // 评奖状态
		params.put("ApplyYear", ApplyYear); // 评奖状态

		// 默认年份
		Calendar c = Calendar.getInstance();
		// 转换日期格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
		String gyear = sdf.format(c.getTime()); // 获取当前年份

		if (ApplyYear != null) {
			gyear = ApplyYear;
		}

		params.put("ApplyYear", gyear);
		queryParam.put("ApplyYear", gyear);
		String ids = getPara("ids");
		params.put("ids", ids);
		List conList = Project.me.exportProjectExcel(params);
		for (int i = 0; i < conList.size(); i++) {
			Project map = (Project) conList.get(i);
			if (null == map.get("winning_results")) {
				map.put("winning_results", "");
			}

			if (null == map.get("ApplyYear")) {
				map.put("ApplyYear", "");
			}
			if (null == map.get("Note")) {
				map.put("Note", "");
			}
			map.put("id", i + 1);// 连续的序号

		}

		String[] columns = { "id", "ProjectCN", "ApplyYear", "Category_name",
				"Note", "winning_results" };
		String[] heades = { "序号", "项目名称", "年度", "评奖类别", "形式审查意见", "评奖状态" };
		render(PoiRender.me(conList).fileName("project.xls").sheetName("项目列表")
				.headers(heades).columns(columns).cellWidth(5000).headerRow(2));

	}

	// 申请，对应apply
	public void stepFrom() {
		String method = getRequest().getMethod();
		Integer id = getParaToInt("id");
		if (method.equalsIgnoreCase(Constants.RequestMethod.GET)) {// 地址栏直接方问Get方式访问
			Company user = (Company) getSessionAttr(Constants.Company_User_Session);
			if (user == null) {
				redirect("/");
			} else {
				Project pj = (Project) Project.me.findById(id);

				setAttr("user", user);
				setAttr("categoryList", Category.me.findAll());
				setAttr("groupList", ProjectGroup.me.findAll());
				setAttr("fromtaskList", FromTask.me.findAll());
				setAttr("project", pj);
				setAttr("st", "1"); // 1新增
				Prize prize = Prize.me.findMaxPrize();
				if (prize == null) {
					prize = new Prize();
				}
				setAttr("prize", prize);
				// setAttr("project",Project.me.findById(getPara("id")));
				render("step/step1.html");
			}

		}
	}

	// 查看项目基本信息 专家调用查看项目方法 所以获取专家登录信息
	public void projectView() {
		Integer id = getParaToInt("id");
		Expert user = (Expert) getSessionAttr(Constants.Expert_User_Session);

		setAttr("user", user);

		if (user == null) {
			redirect("/");
			return;
		} else {
			List ftList = new ArrayList();
			HashMap map;
			if (null != id) {
				Project pj = (Project) Project.me.findById(id);
				// 处理ID串 用于给 任务来源动态赋值
				String ft = (String) pj.get("FromTask");

				if (ft != null && !"".equals(ft)) {
					String[] ids = ft.split(",");
					for (int i = 0; i < ids.length; i++) {
						map = new HashMap();
						int ftid = Integer.parseInt(ids[i]);
						map.put("id", ftid);
						ftList.add(map);
					}
				}

				setAttr("project", pj); // 用于修改页面
				// 主要完成单位
				setAttr("MCList", MajorCompany.me.selectMCbyId(
						getParaToInt(0, 1), 20, id));
				// 主要完成人员
				setAttr("KPList",
						KeyPerson.me.selectKPbyId(getParaToInt(0, 1), 20, id));
				// 经济效益
				setAttr("EcList", Economies.me.selectEconmiesbyId(
						getParaToInt(0, 1), 20, id));
				setAttr("st", "2"); // 2修改
			} else {
				setAttr("st", "1"); // 1新增
				setAttr("project", new Project()); // 用于新增页面 判断

			}

			setAttr("ftsize", ftList.size()); // 被选中的
			setAttr("ftList", ftList); // 被选中的
			setAttr("user", user);
			setAttr("categoryList", Category.me.findAll());
			setAttr("groupList", ProjectGroup.me.findAll());
			setAttr("fromtaskList", (List) FromTask.me.findAll());

			render("projectView.html");
		}
	}

	// 跳转 页面 用于导航切换
	public void step() {
		Integer id = getParaToInt("ProjectID");
		Integer step = getParaToInt("step");
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		String fundamentals= "";
		String sfundamentals= "";
		String recommended= "";
		String sRecommended= "";
		String zylzsfyj="";
		String btryyqkjsfjy="";
		String kxpjzm="";
		String jspjzm="";
		String yyzm="";
		String qtzm="";
		
		List<Accessory> zylzsfyjList = Accessory.me.selectAybyIdType(id,"主要论著的复印件");
		setAttr("zylzsfyjList",zylzsfyjList);
		List<Accessory> btryyqkjsfjyList = Accessory.me.selectAybyIdType(id,"被他人引用情况检索复印件");
		setAttr("btryyqkjsfjyList",btryyqkjsfjyList);
		List<Accessory> kxpjzmList = Accessory.me.selectAybyIdType(id,"科学评价证明");
		setAttr("kxpjzmList",kxpjzmList);
		List<Accessory> jspjzmList = Accessory.me.selectAybyIdType(id,"技术评价证明(复印件)");
		setAttr("jspjzmList",jspjzmList);
		List<Accessory> yyzmList = Accessory.me.selectAybyIdType(id,"应用证明");
		setAttr("yyzmList",yyzmList);
		List<Accessory> qtzmList = Accessory.me.selectAybyIdType(id,"其它证明");
		setAttr("qtzmList",qtzmList);		
		Project p = new Project();
		if (null != id){
			p = Project.me.findById(id);
			if(p.get("Fundamentals")!=null && !"".equals(p.get("Fundamentals"))){
				sfundamentals = p.get("Fundamentals");
				int a = sfundamentals.lastIndexOf("/");
				fundamentals = sfundamentals.substring(a+1, sfundamentals.length());
			}
			if(p.get("Recommended")!=null && !"".equals(p.get("Recommended"))){
				sRecommended = p.get("Recommended");
				int a = sRecommended.lastIndexOf("/");
				recommended = sRecommended.substring(a+1, sRecommended.length());
			}

		}else{
			p = p.put("Status", 0);
		}
		setAttr("fundamentals",fundamentals); 
		setAttr("recommended",recommended); // 用于修改页面	
		switch (step) {
		case 1:// 项目基本信息
			List ftList = new ArrayList();
			HashMap map;
			if (null != id) {
				// 处理ID串 用于给 任务来源动态赋值
				String ft = (String) p.get("FromTask");

				if (ft != null && !"".equals(ft)) {
					String[] ids = ft.split(",");
					for (int i = 0; i < ids.length; i++) {
						map = new HashMap();
						int ftid = Integer.parseInt(ids[i]);
						map.put("id", ftid);
						ftList.add(map);
					}
				}

				setAttr("project", p); // 用于修改页面
				// setAttr("id",id);
				setAttr("st", "2"); // 2修改
			} else {
				setAttr("st", "1"); // 1新增
				setAttr("project", new Project().put("Status", 0)); // 用于新增页面 判断
				// setAttr("id",null);
			}

			setAttr("ftsize", ftList.size()); // 被选中的
			setAttr("ftList", ftList); // 被选中的
			setAttr("categoryList", Category.me.findAll());
			setAttr("groupList", ProjectGroup.me.findAll());
			setAttr("fromtaskList", (List) FromTask.me.findAll());
			render("step/step" + step + ".html");
			break;
		case 2:// 完成单位
			setAttr("MCList",
					MajorCompany.me.selectMCbyId(getParaToInt(0, 1), 100, id));
			render("step/step" + step + ".html");
			break;
		case 3:// 完成人员
			setAttr("KPList",
					KeyPerson.me.selectKPbyId(getParaToInt(0, 1), 30, id));
			render("step/step" + step + ".html");
			break;
		case 4:// 基本情况页盖章回传
			render("step/step" + step + ".html");
			break;
		case 5:// 项目简介
			setAttr("p", p);
			render("step/step" + step + ".html");
			break;
		case 6:// 项目详情
			setAttr("p", p);
			render("step/step" + step + ".html");
			break;
		case 7:// 应用情况
			setAttr("p", p);
			render("step/step" + step + ".html");
			break;
		case 8:// 经济效益
			setAttr("p", p);
			setAttr("EcList",
					Economies.me.selectEconmiesbyId(getParaToInt(0, 1), 100, id));
			render("step/step" + step + ".html");
			break;
		case 9:// 社会效益
			setAttr("p", p);
			render("step/step" + (step) + ".html");
			break;
		case 10:// 知识产权
			setAttr("p", p);
			setAttr("PtList",
					Property.me.selectPtbyId(getParaToInt(0, 1), 100, id));
			render("step/step" + (step) + ".html");
			break;
		case 11:// 推荐单位意见
			setAttr("p", p);
			render("step/step" + (step) + ".html");
			break;
		case 12:// 上传附件
			setAttr("id", id);
			render("step/step" + (step) + ".html");
			break;
		}

		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project", p);
		setAttr("step", step);
		setAttr("user", user);
		setAttr("id", id); // 项目ID
	}

	// 操作各步骤 并跳转到下一步骤
	public void apply() {
		String method = getRequest().getMethod();		
		Integer id = getParaToInt("id");
		Integer step = getParaToInt("step");
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);

		setAttr("user", user);
		String ts="";
		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);

		if (user == null) {
			redirect("/");
			return;
		}
		if (method.equalsIgnoreCase(Constants.RequestMethod.GET)) {// 地址栏直接方问Get方式访问
			List ftList = new ArrayList();
			HashMap map;
			if (null != id) {
				Project pj = (Project) Project.me.findById(id);
				// 处理ID串 用于给 任务来源动态赋值
				String ft = (String) pj.get("FromTask");

				if (ft != null && !"".equals(ft)) {
					String[] ids = ft.split(",");
					for (int i = 0; i < ids.length; i++) {
						map = new HashMap();
						int ftid = Integer.parseInt(ids[i]);
						map.put("id", ftid);
						ftList.add(map);
					}
				}

				setAttr("project", pj); // 用于修改页面
				setAttr("id", id);
				setAttr("st", "2"); // 2修改
			} else {
				setAttr("st", "1"); // 1新增
				setAttr("project", new Project().put("Status", 0)); // 用于新增页面 判断
				setAttr("id", null);
			}

			setAttr("ftsize", ftList.size()); // 被选中的
			setAttr("ftList", ftList); // 被选中的
			setAttr("user", user);
			setAttr("categoryList", Category.me.findAll());
			setAttr("groupList", ProjectGroup.me.findAll());
			setAttr("fromtaskList", (List) FromTask.me.findAll());
			setAttr("step", step); // 用于页面导航条 判断是否默认样式
			render("step/step" + step + ".html");
		} else if (method.equalsIgnoreCase(Constants.RequestMethod.POST)) {// from提交的方式
			Project p = new Project();
			if (null != id){
				p = Project.me.findById(id);
			    setAttr("project", p); // 用于修改页面
			}else{
				setAttr("project", p.put("Status", 0)); // 用于新增页面 判断
			}
				
			switch (step) {
			case 1:// 项目基本情况更新
				Calendar c = Calendar.getInstance();
				// 转换日期格式
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
				// 转换日期格式
				SimpleDateFormat sdfdate = new SimpleDateFormat("yyyy-MM-dd");

				Project project = getModel(Project.class); // 获取页面表单数据
				String[] FromTaskAll  = getRequest().getParameterValues("FromTaskAll");
				String str1=StringUtils.join(FromTaskAll, ",");
				project.set("FromTask", str1);
				project.set("CompanyID", user.get("id"))
						.set("ApplyYear", sdf.format(c.getTime())) // 申报年度						
						.set("Step", "1") // 已完成步骤（1项目基本情况,2主要完成单位,3主要完成人,4基本情况页盖章回传,5项目简介,6项目详细内容,7应用情况,8经济效益,9社会效益,10知识产权表,11推荐单位意见,12上传附件）
						.set("Applytime", sdfdate.format(c.getTime())); // 申请时间
				// 如果ID不为空 就修改 为空 就新增
				int xmId;
				if (null != id) {
					project.update();
					xmId = id;
				} else {
					project.set("Status", 0); // 默认评奖状态为0 未提交
					project.save();
					// 查询当前用户 新增的项目ID xdf 2015.05.19
					long CompanyID = user.get("id");
					xmId = Project.me.selectId(CompanyID);
				}

				// 调用完成单位列表
				MajorCompany mc1 = new MajorCompany();
				setAttr("MCList",
						mc1.selectMCbyId(getParaToInt(0, 1), 20, xmId));
				setAttr("id", xmId);
				setAttr("step", step + 1); // 用于页面导航条 判断是否默认样式
				render("step/step" + (step + 1) + ".html");
				break;
			case 2:// 主要完成单位更新
				MajorCompany mc = new MajorCompany();
				
				MajorCompany majorCompany = getModel(MajorCompany.class); // 获取页面表单数据
				if (majorCompany.get("id", null) == null) {
					majorCompany.set("ProjectID", id);// 项目id
					long cMajor = majorCompany.me.countMajor(id);
					MajorCompany majorCompanyTemp = mc.findMaxSortKPbyId(id);
					if(majorCompanyTemp==null || majorCompanyTemp.getInt("Sort")==null){
						majorCompany.set("Sort",1);
					}else{
						majorCompany.set("Sort",majorCompanyTemp.getInt("Sort")+1);	
					}
					if(cMajor>4){
						ts = "增加失败，完成单位数不能超过5个！";
					}else{
						majorCompany.save();
					}
					
				} else {
					majorCompany.update();
				}

				// 已完成步骤（1项目基本情况,2主要完成单位,3主要完成人,4基本情况页盖章回传,5项目简介,6项目详细内容,7应用情况,8经济效益,9社会效益,10知识产权表,11推荐单位意见,12上传附件）
				p.set("Step", "2").update();
				setAttr("id", id);
				setAttr("ts", ts);
				// 调用完成单位列表
				setAttr("MCList", mc.selectMCbyId(getParaToInt(0, 1), 20, id));
				setAttr("step", step); // 用于页面导航条 判断是否默认样式
				render("step/step" + (step) + ".html");
				break;
			case 3:// 主要完成人更新
				KeyPerson kp = new KeyPerson();
				KeyPerson keyPerson = getModel(KeyPerson.class);
				if (keyPerson.get("id", null) == null) {
					keyPerson.set("ProjectID", id);// 项目id
					KeyPerson keyPersonTemp = kp.findMaxSortKPbyId(id);
					if(keyPersonTemp==null || keyPersonTemp.getInt("Sort")==null){
				    keyPerson.set("Sort",1);
					}else{
						keyPerson.set("Sort",keyPersonTemp.getInt("Sort")+1);	
					}
					long cPerson = keyPerson.me.countKeyPerson(id);
					if(cPerson>29){
						ts = "增加失败，完成人员数不能超过30个！";
					}else{
						keyPerson.save();
					}
					
				} else {
					keyPerson.update();
				}
				// 已完成步骤（1项目基本情况,2主要完成单位,3主要完成人,4基本情况页盖章回传,5项目简介,6项目详细内容,7应用情况,8经济效益,9社会效益,10知识产权表,11推荐单位意见,12上传附件）
				p.set("Step", "3").update();

				// 调用完成人员列表
				setAttr("KPList", kp.selectKPbyId(getParaToInt(0, 1), 30, id));
				setAttr("id", id);
				setAttr("ts", ts);
				setAttr("step", step); // 用于页面导航条 判断是否默认样式
				render("step/step" + (step) + ".html");
				break;
			case 4:// 基本情况页盖章回传更新
					// 上传附件
				UploadFile file = getFile("Fundamentals",
						PathKit.getWebRootPath() + "/upload/jbqk",
						Constants.FILE_MAXSize, "utf-8");

				File source = file.getFile();
				// 得到文件名
				String fileName = file.getFileName();
				// 得到去掉后缀名 的名称
				String extension = fileName.substring(0,
						fileName.lastIndexOf("."));
				// 拼接保存到数据库的文件路径
				String path = PathKit.getWebRootPath() + "/upload/jbqk/"
						+ fileName;

				p.set("Fundamentals", path).set("Step", "4") // 已完成步骤（1项目基本情况,2主要完成单位,3主要完成人,4基本情况页盖章回传,5项目简介,6项目详细内容,7应用情况,8经济效益,9社会效益,10知识产权表,11推荐单位意见,12上传附件）
						.update();

				setAttr("id", id);
				setAttr("p", p);
				setAttr("step", step + 1); // 用于页面导航条 判断是否默认样式
				render("step/step" + (step + 1) + ".html");

				break;
			case 5:// 项目简介更新
				p.set("Introduction", getPara("Introduction")).set("Step", "5") // 已完成步骤
						.update();

				setAttr("id", id);
				setAttr("p", p);
				setAttr("step", step + 1); // 用于页面导航条 判断是否默认样式
				render("step/step" + (step + 1) + ".html");
				break;
			case 6:// 项目详细内容更新
				p.set("Content", getPara("Content"))
						.set("Content1", getPara("Content1"))
						.set("Content2", getPara("Content2"))
						.set("Content3", getPara("Content3")).set("Content4", getPara("Content4")).set("Step", "6")
						.update(); // 已完成步骤
				setAttr("id", id);
				setAttr("p", p);
				setAttr("step", step + 1); // 用于页面导航条 判断是否默认样式
				render("step/step" + (step + 1) + ".html");
				break;
			case 7:// 应用情况更新
				p.set("AppSituation", getPara("AppSituation")).set("Step", "7") // 已完成步骤
						.update();

				// 调用经济效益列表
				Economies es = new Economies();
				setAttr("EcList",
						es.selectEconmiesbyId(getParaToInt(0, 1), 20, id));
				setAttr("id", id);
				setAttr("p", p);
				setAttr("step", step + 1); // 用于页面导航条 判断是否默认样式
				render("step/step" + (step + 1) + ".html");
				break;
			case 8:// 经济效益更新
				p.set("Step", "8").set("TotalFund", getPara("TotalFund"))
						.set("Payback", getPara("Payback"))
						.set("Calculations", getPara("Calculations")).update();

				setAttr("id", id);
				setAttr("p", p);
				setAttr("step", step + 1); // 用于页面导航条 判断是否默认样式
				render("step/step" + (step + 1) + ".html");

				break;
			case 9:// 社会效益更新
				p.set("Social", getPara("Social")).set("Step", "9").update();

				// 知识产权表更新
				Property pt = new Property();
				setAttr("id", id);
				setAttr("p", p);
				setAttr("PtList", pt.selectPtbyId(getParaToInt(0, 1), 20, id));
				setAttr("step", step + 1); // 用于页面导航条 判断是否默认样式
				render("step/step" + (step + 1) + ".html");
				break;
			case 10:// 知识产权表更新
				p.set("Step", "10").update();

				setAttr("id", id);
				setAttr("p", p);
				setAttr("step", step + 1); // 用于页面导航条 判断是否默认样式
				render("step/step" + (step + 1) + ".html");
				break;
			case 11:// 推荐单位意见更新
				// 上传附件
				UploadFile fileyj = getFile("Recommended",
						PathKit.getWebRootPath() + "/upload/dwyj",
						Constants.FILE_MAXSize, "utf-8");
				// 得到文件名
				String fileyjName = fileyj.getFileName();
				// 拼接保存到数据库的文件路径
				String pathyj = PathKit.getWebRootPath() + "/upload/dwyj/"
						+ fileyjName;

				p.set("Recommended", pathyj).set("Step", "11").update();
				List<Accessory> zylzsfyjList = Accessory.me.selectAybyIdType(id,"主要论著的复印件");
				setAttr("zylzsfyjList",zylzsfyjList);
				List<Accessory> btryyqkjsfjyList = Accessory.me.selectAybyIdType(id,"被他人引用情况检索复印件");
				setAttr("btryyqkjsfjyList",btryyqkjsfjyList);
				List<Accessory> kxpjzmList = Accessory.me.selectAybyIdType(id,"科学评价证明");
				setAttr("kxpjzmList",kxpjzmList);
				List<Accessory> jspjzmList = Accessory.me.selectAybyIdType(id,"技术评价证明(复印件)");
				setAttr("jspjzmList",jspjzmList);
				List<Accessory> yyzmList = Accessory.me.selectAybyIdType(id,"应用证明");
				setAttr("yyzmList",yyzmList);
				List<Accessory> qtzmList = Accessory.me.selectAybyIdType(id,"其它证明");
				setAttr("qtzmList",qtzmList);		
				setAttr("id", id);
				setAttr("step", step + 1); // 用于页面导航条 判断是否默认样式
				render("step/step" + (step + 1) + ".html");
				break;
			case 12:// 上传附件
				Integer type = 0;
				type = getParaToInt("type");
				String path1 = "uploads/"+id+"/"+user.get("id").toString()+"/"+type.toString();
				UploadFile uf = getFile("Filedata",path1);				
				Accessory accessory = new Accessory();
				if(type==1){
					accessory.set("type", "主要论著的复印件");
				}else if(type==2){
					accessory.set("type", "被他人引用情况检索复印件");
				}
				else if(type==3){
					accessory.set("type", "科学评价证明");
				}
				else if(type==4){
					accessory.set("type", "技术评价证明(复印件)");
				}
				else if(type==5){
					accessory.set("type", "应用证明");
				}
				else if(type==6){
					accessory.set("type", "其它证明");
				}				
				accessory.set("filePath", PathKit.getWebRootPath()+"/upload/"+path1+"/"+uf.getFileName()).set("fileName", uf.getFileName())
						.set("ProjectID", id).save();				
				this.setAttr("fileName", uf.getFileName());			
				//以json格式进行渲染
				renderJson();
				break;
			case 13:// 上传附件后提交
			/*	// 上传第一个文件 主要论著的复印件
				UploadFile file11 = getFile("file1");
				if (file11 != null) {
					this.uploadFile("file1", "/upload", Constants.FILE_MAXSize,
							"utf-8", "主要论著的复印件", id);
				}

				// 上传第二个文件 被他人引用情况检索复印件
				UploadFile file12 = getFile("file2");
				if (file12 != null) {
					this.uploadFile("file2", "/upload", Constants.FILE_MAXSize,
							"utf-8", "被他人引用情况检索复印件", id);
				}

				// 上传第三个文件 科学评价证明
				UploadFile file13 = getFile("file3");
				if (file13 != null) {
					this.uploadFile("file3", "/upload", Constants.FILE_MAXSize,
							"utf-8", "科学评价证明", id);
				}
				// 上传第四个文件 技术评价证明（复印件）
				UploadFile file14 = getFile("file4");
				if (file14 != null) {
					this.uploadFile("file4", "/upload", Constants.FILE_MAXSize,
							"utf-8", "技术评价证明(复印件)", id);
				}
				// 上传第五个文件 应用证明
				UploadFile file15 = getFile("file5");
				if (file15 != null) {
					this.uploadFile("file5", "/upload", Constants.FILE_MAXSize,
							"utf-8", "应用证明", id);
				}
				// 上传第六个文件 其它证明
				UploadFile file16 = getFile("file6");
				if (file16 != null) {
					this.uploadFile("file6", "/upload", Constants.FILE_MAXSize,
							"utf-8", "其它证明", id);
				}*/
				p.set("Step", "12").update();
				setAttr("id", id);
				setAttr("step", step); // 用于页面导航条 判断是否默认样式
				render("step/step" + (step) + ".html");
				break;
			}

			setAttr("project", p);

		}
	}

	// 附件上传公用方法
	// parameterName是指在表单中file表单域的名称，saveDirectory是指文件保有存路径，maxPostSize是指文件最大长度，encoding是指文件编码。
	public void uploadFile(String parameterName, String saveDirectory,
			Integer maxPostSize, String encoding, String type, int id) {
		// 上传附件
		UploadFile file = getFile(parameterName, PathKit.getWebRootPath()
				+ saveDirectory, maxPostSize, encoding);
		File source = file.getFile();
		// 得到文件名
		String fileName = file.getFileName();
		// 得到去掉后缀名 的名称
		String extension = fileName.substring(0, fileName.lastIndexOf("."));
		// 拼接保存到数据库的文件路径
		String path = PathKit.getWebRootPath() + saveDirectory + "/" + fileName;

		// 保存到数据库
		Accessory as = new Accessory();
		as.set("type", type).set("filePath", path).set("fileName", extension)
				.set("ProjectID", id).save();
	}

	// 主要完成单位导出
	public void toMcExcel() throws IllegalStateException {

		// Company user = (Company)
		// getSessionAttr(Constants.Company_User_Session);

		// setAttr("user",user);
		setAttr("id", getPara("ProjectID"));
		long id = Long.parseLong(getPara("ProjectID"));

		List conList = MajorCompany.me.selectMCbyId(getParaToInt(0, 1), 20, id)
				.getList();
		for (int i = 0; i < conList.size(); i++) {
			MajorCompany map = (MajorCompany) conList.get(i);
			map.put("id", i + 1);// 连续的序号
		}

		String[] columns = { "id", "CompanyName", "CompanyAddress", "ZipCode",
				"LinkMan", "LinkPhone" };
		String[] heades = { "序号", "单位名称", "通讯地址", "邮政编码", "联系人", "联系电话" };
		render(PoiRender.me(conList).fileName("majorcompany.xls")
				.sheetName("完成单位列表").headers(heades).columns(columns)
				.cellWidth(5000).headerRow(2));

	}

	// 批量删除完成单位
	public void delMC() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		// 批量删除
		String ids = getPara("ids");
		MajorCompany mc = new MajorCompany();
		mc.PMCdel(ids);

		setAttr("user", user);
		setAttr("id", getPara("ProjectID"));
		long id = Long.parseLong(getPara("ProjectID"));
		// 调用完成单位列表
		setAttr("MCList", mc.selectMCbyId(getParaToInt(0, 1), 10, id));
		setAttr("step", 2);

		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project", Project.me.findById(id));
		render("step/step2.html");
	}
	
	
	
	// 跳转到新增完成单位
	public void step2_xz() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		setAttr("user", user);
		setAttr("id", getPara("ProjectID"));
		// 如果ID为空 为新增
		if (null == getPara("id")) {
			setAttr("Mc", new MajorCompany());
		} else {
			setAttr("Mc", MajorCompany.me.findById(getPara("id")));
		}
		setAttr("step", 2);

		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project", Project.me.findById(getPara("ProjectID")));
		render("step/step2_xz.html");
	}

	// 主要完成人员导出
	public void toKpExcel() throws IllegalStateException {

		// Company user = (Company)
		// getSessionAttr(Constants.Company_User_Session);

		// setAttr("user",user);
		setAttr("id", getPara("ProjectID"));
		long id = Long.parseLong(getPara("ProjectID"));

		List conList = KeyPerson.me.selectKPbyId(getParaToInt(0, 1), 20, id)
				.getList();
		for (int i = 0; i < conList.size(); i++) {
			KeyPerson map = (KeyPerson) conList.get(i);
			if (null == map.get("Parties")) {
				map.put("Parties", "");
			}
			if (null == map.get("EMail")) {
				map.put("EMail", "");
			}
			if (null == map.get("Education")) {
				map.put("Education", "");
			}
			if (null == map.get("Degree")) {
				map.put("Degree", "");
			}
			if (null == map.get("Education")) {
				map.put("Education", "");
			}
			map.put("id", i + 1); // 连续的序号
		}

		String[] columns = { "id", "Name", "Parties", "Company",
				"ContactPhone", "EMail", "Education", "Degree", "Education" };
		String[] heades = { "序号", "姓名", "党派名称", "工作单位", "联系电话", "邮箱", "文化程度",
				"学位", "毕业学校" };
		render(PoiRender.me(conList).fileName("keyperson.xls")
				.sheetName("完成人员列表").headers(heades).columns(columns)
				.cellWidth(5000).headerRow(2));

	}

	// 跳转到主要完成人员 页面
	public void step3() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		setAttr("user", user);
		setAttr("id", getPara("ProjectID"));
		long id = Long.parseLong(getPara("ProjectID"));
		// 调用完成人员列表
		KeyPerson kp = new KeyPerson();
		setAttr("KPList", kp.selectKPbyId(getParaToInt(0, 1), 20, id));
		setAttr("step", 3);
		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project", Project.me.findById(id));
		render("step/step3.html");
	}

	// 跳转到新增 完成人员 页面
	public void step3_xz() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		setAttr("user", user);
		setAttr("id", getPara("ProjectID"));
		// 如果ID为空 为新增
		if (null == getPara("id")) {
			setAttr("keyPerson", new KeyPerson());
		} else {
			setAttr("keyPerson", KeyPerson.me.findById(getPara("id")));
		}
		setAttr("step", 3);
		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project", Project.me.findById(getPara("ProjectID")));
		render("step/step3_xz.html");
	}

	// 批量删除完成人员
	public void delKP() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		// 批量删除
		String ids = getPara("ids");
		KeyPerson kp = new KeyPerson();
		kp.KPdel(ids);

		setAttr("step", 3);
		setAttr("user", user);
		setAttr("id", getPara("ProjectID"));
		long id = Long.parseLong(getPara("ProjectID"));
		// 调用完成单位列表
		setAttr("KPList", kp.selectKPbyId(getParaToInt(0, 1), 10, id));

		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project", Project.me.findById(getPara("ProjectID")));
		render("step/step3.html");
	}
	
	
	// 主要完成定位顺序的升级
		public void shengXuMC() {
			Company user = (Company) getSessionAttr(Constants.Company_User_Session);			
			MajorCompany mc = new MajorCompany();
			long id = Long.parseLong(getPara("ProjectID"));
			int sort = getParaToInt("Sort");
			MajorCompany majorCompany = MajorCompany.me.findById(getPara("id"));
			MajorCompany majorCompanyTemp = mc.findSortKPbyIdAndSort(id,sort);
			if(majorCompanyTemp!=null ){
				int sortTemp = majorCompany.getInt("Sort");			
				majorCompany.set("Sort",majorCompanyTemp.getInt("Sort"));	
				majorCompanyTemp.set("Sort",sortTemp);
				majorCompany.update();
				majorCompanyTemp.update();
			}									
			setAttr("step", 2);
			setAttr("user", user);
			setAttr("id", getPara("ProjectID"));
			// 调用完成单位列表
			setAttr("MCList", mc.selectMCbyId(getParaToInt(0, 1), 20, id));
			Prize prize = Prize.me.findMaxPrize();
			if (prize == null) {
				prize = new Prize();
			}
			setAttr("prize", prize);
			setAttr("project", Project.me.findById(getPara("ProjectID")));
			render("step/step2.html");
		}
	
	// 主要完成人员顺序的升级
	public void shengXuKP() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		KeyPerson kp = new KeyPerson();
		long id = Long.parseLong(getPara("ProjectID"));
		int sort = getParaToInt("Sort");
		KeyPerson keyPerson = KeyPerson.me.findById(getPara("id"));
		KeyPerson keyPersonTemp = kp.findSortKPbyIdAndSort(id,sort);
		if(keyPersonTemp!=null ){
			int sortTemp = keyPerson.getInt("Sort");			
			keyPerson.set("Sort",keyPersonTemp.getInt("Sort"));	
			keyPersonTemp.set("Sort",sortTemp);
			keyPerson.update();
			keyPersonTemp.update();
		}				
		setAttr("step", 3);
		setAttr("user", user);
		setAttr("id", getPara("ProjectID"));
		// 调用完成单位列表
		setAttr("KPList", kp.selectKPbyId(getParaToInt(0, 1), 10, id));

		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project", Project.me.findById(getPara("ProjectID")));
		render("step/step3.html");
	}

	// 跳转到盖章回传页面
	public void step4() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		setAttr("user", user);
		setAttr("id", getPara("ProjectID"));
		setAttr("step", 4);
		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project", Project.me.findById(getPara("ProjectID")));
		render("step/step4.html");
	}

	// 跳转到新增 经济效益 页面
	public void step8_xz() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		setAttr("user", user);
		setAttr("id", getPara("ProjectID"));
		setAttr("TotalFund", getPara("TotalFund"));
		setAttr("Payback", getPara("Payback"));

		// 如果ID为空 为新增
		if (null == getPara("id")) {
			setAttr("Es", new Economies());
		} else {
			setAttr("Es", Economies.me.findById(getPara("id")));
		}
		setAttr("step", 8);
		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project", Project.me.findById(getPara("ProjectID")));
		render("step/step8_xz.html");
	}

	// 批量删除 经济效益
	public void delEc() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		// 批量删除
		String ids = getPara("ids");
		Economies es = new Economies();
		es.Econmiesdel(ids);

		setAttr("user", user);
		setAttr("id", getPara("ProjectID"));
		long id = Long.parseLong(getPara("ProjectID"));		
		// 调用经济效益列表
		setAttr("EcList", es.selectEconmiesbyId(getParaToInt(0, 1), 10, id));
		Project project = Project.me.findById(id);
		project.set("TotalFund", getPara("TotalFund"));
		project.set("Payback", getPara("Payback"));
		setAttr("p", project);
		setAttr("step", 8);
		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project", Project.me.findById(id));
		render("step/step8.html");
	}

	// 保存经济效益
	public void saveEc() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		Project pp = new Project();
		
		// 年度经济效益表更新
		Economies economies = getModel(Economies.class);
		if (economies.get("id", null) == null) {
			economies.set("ProjectID", getPara("id"));// 项目id
			economies.save();
		} else {
			economies.update();
		}

		Economies es1 = new Economies();
		setAttr("user", user);
		setAttr("id", getPara("id"));
		long id = Long.parseLong(getPara("id"));
		setAttr("EcList", es1.selectEconmiesbyId(getParaToInt(0, 1), 10, id));
		pp =Project.me.findById(id);
		pp.set("TotalFund", getPara("TotalFund"));
		pp.set("Payback", getPara("Payback"));
		setAttr("p", pp);
		setAttr("step", 8);
		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project",Project.me.findById(id) );
		setAttr("TotalFund", getPara("TotalFund"));
		setAttr("Payback", getPara("Payback"));
		render("step/step8.html");
	}

	// 跳转到 社会效益页面
	public void step9() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		setAttr("user", user);
		setAttr("id", getPara("id"));
		setAttr("p", Project.me.findById(getPara("id")));
		setAttr("step", 9);
		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project", Project.me.findById(getPara("id")));
		render("step/step9.html");
	}

	// 知识产权导出
	public void toPyExcel() throws IllegalStateException {

		// Company user = (Company)
		// getSessionAttr(Constants.Company_User_Session);

		// setAttr("user",user);
		setAttr("id", getPara("ProjectID"));
		long id = Long.parseLong(getPara("ProjectID"));

		List conList = Property.me.selectPtbyId(getParaToInt(0, 1), 20, id)
				.getList();
		for (int i = 0; i < conList.size(); i++) {
			Property map = (Property) conList.get(i);
			map.put("id", i + 1);// 连续的序号
		}

		String[] columns = { "id", "Categories", "Name", "ApplyDate",
				"AuthorityDate", "PatentNumber", "Obligee", "Inventor" };
		String[] heades = { "申请号", "国别", "名称", "申请日期", "授权日期", "专利号", "权利人",
				"发明人" };
		render(PoiRender.me(conList).fileName("property.xls")
				.sheetName("知识产权列表").headers(heades).columns(columns)
				.cellWidth(5000).headerRow(2));

	}

	// 跳转到新增 知识产权 页面
	public void step10_xz() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		setAttr("user", user);
		setAttr("id", getPara("ProjectID"));

		// 如果ID为空 为新增
		if (null == getPara("id")) {
			setAttr("property", new Property());
		} else {
			setAttr("property", Property.me.findById(getPara("id")));
		}
		setAttr("step", 10);
		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project", Project.me.findById(getPara("ProjectID")));
		render("step/step10_xz.html");
	}

	// 批量删除 知识产权
	public void delPt() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		// 批量删除
		String ids = getPara("ids");
		Property pt = new Property();
		pt.Ptdel(ids);

		setAttr("user", user);
		setAttr("id", getPara("ProjectID"));
		long id = Long.parseLong(getPara("ProjectID"));
		// 调用 知识产权列表
		setAttr("step", 10);
		setAttr("PtList", pt.selectPtbyId(getParaToInt(0, 1), 20, id));
		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project", Project.me.findById(id));
		render("step/step10.html");
	}

	// 保存 知识产权
	public void savePt() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		// 知识产权表更新
		Property property = getModel(Property.class);
		if (property.get("id", null) == null) {
			property.set("ProjectID", getPara("id"));// 项目id
			property.save();
		} else {
			property.update();
		}

		Property pt = new Property();
		setAttr("user", user);
		setAttr("id", getPara("id"));
		long id = Long.parseLong(getPara("id"));
		setAttr("step", 10);
		setAttr("PtList", pt.selectPtbyId(getParaToInt(0, 1), 20, id));
		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		setAttr("project", Project.me.findById(id));
		render("step/step10.html");
	}

	// 提交申报项目 验证
	public void projectYz() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);

		if (user == null) {
			redirect("/");
			return;
		} else {
			String msg = "";

			int id = getParaToInt("id", 0);
			Project p = Project.me.findById(id);

			// 先判断是否已经进行了提交操作 否则不允许提交
			String Status = p.getInt("Status") + "";// 状态
			if (!"0".equals(Status)&& !"3".equals(Status)) {
				msg += "项目已提交，不允许重复操作!";
			} else {
				// 先验证 所有内容 是否都填写完整 除 社会效益
				String Fundamentals = p.getStr("Fundamentals") + ""; // 盖章回传
				String Introduction = p.getStr("Introduction") + ""; // 项目简介
				String Content = p.getStr("Content") + ""; // 项目详情 立项背景
				String Content1 = p.getStr("Content1") + ""; // 项目详情
																// 详细科学技术内容、发现/发明及创新点
				String Content2 = p.getStr("Content2") + ""; // 项目详情 保密要点
				String Content3 = p.getStr("Content3") + ""; // 项目详情
																// 与当前国内外同类研究、同类技术的综合比较
				String AppSituation = p.getStr("AppSituation") + ""; // 应用情况
				String Social = p.getStr("Social") + ""; // 社会效益
				String Recommended = p.getStr("Recommended") + ""; // 推荐单位意见回传

				if ("null".equals(Fundamentals) || "".equals(Fundamentals)) {
					msg += "\n基本情况页盖章回传还未上传;";
				}
				if ("null".equals(Introduction) || "".equals(Introduction)) {
					msg += "\n项目简介还未填写;";
				}
				if ("null".equals(Content) || "".equals(Content)) {
					msg += "\n立项背景还未填写;";
				}
				if ("null".equals(Content1) || "".equals(Content1)) {
					msg += "\n详细科学技术内容、发现/发明及创新点还未填写;";
				}
				/*if ("null".equals(Content2) || "".equals(Content2)) {
					msg += "\n保密要点还未填写;";
				}*/
				if ("null".equals(Content3) || "".equals(Content3)) {
					msg += "\n与当前国内外同类研究、同类技术的综合比较还未填写;";
				}
				if ("null".equals(AppSituation) || "".equals(AppSituation)) {
					msg += "\n应用情况还未填写;";
				}
				if ("null".equals(Social) || "".equals(Social)) {
					msg += "\n社会效益还未填写;";
				}
				if ("null".equals(Recommended) || "".equals(Recommended)) {
					msg += "\n推荐单位意见回传还未上传;";
				}

				List mc = MajorCompany.me.selectMCbyId(getParaToInt(0, 1), 20,
						id).getList();
				if (mc.size() == 0) {
					msg += "\n完成单位还未填写;";
				}

				List kp = KeyPerson.me.selectKPbyId(getParaToInt(0, 1), 20, id)
						.getList();
				if (kp.size() == 0) {
					msg += "\n完成人员还未填写;";
				}

				List py = Property.me.selectPtbyId(getParaToInt(0, 1), 20, id)
						.getList();
				if (py.size() == 0) {
					msg += "\n知识产权还未填写;";
				}

				/**
				 * List ay=Accessory.me.selectAybyId(id); if(ay.size()==0) {
				 * msg+="\n主要论著的复印件等还未上传;"; }
				 */

			}
			renderJson("msg", msg); // 提示验证信息

		}

	}

	// 提交申报项目
	public void projectTj() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);

		if (user == null) {
			redirect("/");
			return;
		} else {
			Project.me.findById(getPara("id")).set("Status", "1").update(); // 已提交
			setAttr("user", user);
			setAttr("id", getPara("id"));
			setAttr("p", Project.me.findById(getPara("id")));
			Prize prize = Prize.me.findMaxPrize();
			if (prize == null) {
				prize = new Prize();
			}
			setAttr("prize", prize);
			setAttr("project", Project.me.findById(getPara("id")));
			render("step/step14.html");
		}

	}

	// 下载单位推荐意见模板
	public void rcNoteOut() throws Exception {
		renderFile(new File(PathKit.getWebRootPath()
				+ "/upload/project/doc/rcNote.docx"));
	}

	// 下载项目基本情况 保存到wrod
	public void projectOut() throws Exception {
		String pDFfile = PathKit.getWebRootPath()
				+ "/upload/project/doc/projectAllInfo.pdf";
		String pDFfile1 = PathKit.getWebRootPath()
				+ "/upload/project/doc/projectAllInfoTemp.pdf";
		String basePathString = PathKit.getWebRootPath()
				+ "/upload/project/doc/";
		String fileWrodPath ="";
		// 要写入wrod的html文件路径 及被写入的wrod路径
		String filepath = PathKit.getWebRootPath()
				+ "/project/project.html";
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String dateString = df.format(new Date());	
		if (null != getPara("id") && !"".equals(getPara("id"))) {
			// 先给项目基础信息模板动态赋值
			long id = Long.parseLong(getPara("id"));
			Project p = new Project();
			Project pp = new Project();
			KeyPerson kp = new KeyPerson();
			MajorCompany mc = new MajorCompany();
			List ps = p.me.selectProjectById(id);
			List kpList = kp.me.selectKPbyId(getParaToInt(0, 1), 20, id).getList();
			List mcList = mc.me.selectMCbyId(getParaToInt(0, 1), 20, id).getList();
			HttpServletResponse response = getResponse();
			if(ps!=null){
				pp = (Project)ps.get(0);
				pDFfile = basePathString+pp.getStr("ProjectCN").replaceAll("/", "").replaceAll("\\\\", "")+"_基本信息.pdf";
				pDFfile1 = basePathString+pp.getStr("ProjectCN").replaceAll("/", "").replaceAll("\\\\", "")+"_基本信息_"+dateString+".pdf";	
				//临时doc
				fileWrodPath =basePathString+pp.getStr("ProjectCN").replaceAll("/", "").replaceAll("\\\\", "")+"_基本信息_"+dateString+".doc";
				//创建临时doc
				this.createFile(basePathString, pp.getStr("ProjectCN").replaceAll("/", "").replaceAll("\\\\", "")+"_基本信息_"+dateString+".doc");
			}	

			// 读取页面内容
			String content = readFile(filepath);
			//response.setContentType("application/msword; charset=GB2312");
			response.setContentType("application/msword; charset=UTF-8");
			// 替换页面 标签内容
			String contentAfter = this.replaceProject(content, ps, kpList,
					mcList);

			boolean flag = this.writeWordFile(fileWrodPath, contentAfter);
			this.wordToPDF(fileWrodPath, pDFfile1);
			//创建临时pdf
			this.createFile(basePathString, pp.getStr("ProjectCN").replaceAll("/", "").replaceAll("\\\\", "")+"_基本信息_"+dateString+".pdf");
			
			PdfReader pdfReader = new PdfReader(pDFfile1);
		    PdfStamper pdfStamper = new PdfStamper(pdfReader, new FileOutputStream(pDFfile));
		    //加水印
		    new PDFWaterPrint().addWatermark(pdfStamper);
		  //删除临时doc
			deleteFile(fileWrodPath);
		  //删除临时pdf
			pdfReader.close();
			deleteFile(pDFfile1);			
		}

		renderFile(new File(pDFfile));
	}

	// 替换查询到的数据库 字段
	public String replaceProject(String content, List ps, List kpList,
			List mcList) {
		KeyPerson kp;// 项目完成人员
		String kpcontent = "";
		if (kpList != null && kpList.size() > 0) {
			for (int i = 0; i < kpList.size(); i++) {
				kp = (KeyPerson) kpList.get(i);
				kpcontent += kp.getStr("Name") + ";  ";
			}
		}
		MajorCompany mc;// 项目完成单位
		String mccontent = "";
		if (mcList != null && mcList.size() > 0) {
			for (int i = 0; i < mcList.size(); i++) {
				mc = (MajorCompany) mcList.get(i);
				mccontent += mc.getStr("CompanyName") + ";  ";
			}
		}

		Project p; // 项目基本信息
		if (ps != null && ps.size() > 0) {
			p = (Project) ps.get(0);

			// 拼接任务来源
			FromTask ft;
			String ftcontent = "";

			if (!"".equals(p.getStr("FromTask"))
					&& null != p.getStr("FromTask")) {
				// 根据任务来源编号 查询列表
				List ftList = FromTask.me.selectName(p.getStr("FromTask"));
				if (ftList != null && ftList.size() > 0) {
					for (int i = 0; i < ftList.size(); i++) {
						ft = (FromTask) ftList.get(i);
						ftcontent += ft.getStr("Name") + ";  ";
					}
				}
			}

			content = content
					.replaceAll("Category_name", p.getStr("Category_name"))
					.replaceAll("Group_name", p.getStr("Group_name"))
					.replaceAll("ProjectCN", p.getStr("ProjectCN"))
					.replaceAll("RecommendCompany",
							p.getStr("RecommendCompany") + "")
					.replaceAll("SecretTime", p.getStr("SecretTime") + "")
					.replaceAll("PlanFund", p.getStr("PlanFund") + "")
					.replaceAll("StartTime", p.getDate("StartTime") + "")
					.replaceAll("EndTime", p.getDate("EndTime") + "")
					.replace("FromTask",
							ftcontent + " " + p.getStr("FromOther") + "")
					.replaceAll("kp_Name", kpcontent + "")
					.replaceAll("mc_Name", mccontent + "").replace("null", "");
		}
		return content;
	}

	// 删除基本信息页盖章回传
	public void delFundamentals() {
		boolean isT = true;
		try {
			String id = getPara("id");
			Project p = Project.me.findById(id);
			if (p != null) {
				String fundamentals = p.get("Fundamentals");
				if (fundamentals != null && !"".equals(fundamentals)) {
					isT = Tools.delFile(fundamentals);
					p.set("Fundamentals", null).update();
				}
			}
			renderJson("success", true);
		} catch (Exception e) {
			renderJson("success", false);
		}
	}
	// 删除推荐单位意见
	public void delRecommended() {
		boolean isT = true;
		try {
			String id = getPara("id");
			Project p = Project.me.findById(id);
			if (p != null) {
				String recommended = p.get("Recommended");
				if (recommended != null && !"".equals(recommended)) {
					isT = Tools.delFile(recommended);
					p.set("Recommended", null).update();
				}
			}
			renderJson("success", true);
		} catch (Exception e) {
			renderJson("success", false);
		}
	}
	// 删除推荐单位意见
		public void delAccessory() {
			boolean isT = true;
			try {
				String id = getPara("id");
				String type = getPara("type");	
				String fileName = java.net.URLDecoder.decode(getPara("fileName"),"UTF-8");
				//String fileName = new String(getRequest().getParameter("fileName").getBytes("ISO8859-1"), "UTF-8");
				String sType="";
				if("1".equals(type)){
					sType="主要论著的复印件";
				}else if("2".equals(type)){
					sType="被他人引用情况检索复印件";
				}
				else if("3".equals(type)){
					sType="科学评价证明";
				}
				else if("4".equals(type)){
					sType="技术评价证明(复印件)";
				}
				else if("5".equals(type)){
					sType="应用证明";
				}
				else if("6".equals(type)){
					sType="其它证明";
				}else{
					sType="";
				}
				Accessory accessory = Accessory.me.selectAccessoryByPIdAndTY(id, sType,fileName);
				if(accessory!=null){
					Tools.delFile(accessory.get("filePath").toString());
					accessory.delete();	
					renderJson("success", true);
				}else{
					renderJson("success", false);
				}								
			} catch (Exception e) {
				renderJson("success", false);
			}
		}
		
	

}