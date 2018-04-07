package com.ccoa.projectreview;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

import com.ccoa.admin.Admin;
import com.ccoa.admin.set.Category;
import com.ccoa.admin.set.FromTask;
import com.ccoa.admin.set.Group;
import com.ccoa.admin.set.Prize;
import com.ccoa.admin.set.ProjectGroup;
import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.common.Tools;
import com.ccoa.company.Company;
import com.ccoa.expert.Expert;
import com.ccoa.interceptor.ExpertUserInterceptor;
import com.ccoa.project.Accessory;
import com.ccoa.project.Economies;
import com.ccoa.project.KeyPerson;
import com.ccoa.project.MajorCompany;
import com.ccoa.project.Project;
import com.ccoa.project.Property;
import com.ccoa.utils.StringUtils;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;

/**
 * 评审项目 管理 2015.05.11 xdf
 */
@Before(ExpertUserInterceptor.class)
public class ProjectReviewController extends BaseController {

	/**
	 * 评审项目 首页
	 * 
	 */
	public void index() {

		Map params = new HashMap();

		Map<String, String> queryParam = getQueryParam();

		String ProjectCN = queryParam.get("ProjectCN"); // 项目名称
		String Category = queryParam.get("Category"); // 评奖类型
		String prizecx = queryParam.get("prizecx");// 是否推荐一等奖
		String status = queryParam.get("status");// 操作类型
		String RegisterNum = queryParam.get("RegisterNum");// 操作类型
		String tsNote = getPara("tsNote");
		if(tsNote==null||"".equals(tsNote)){
			setAttr("tsNote", 0);
		}else{
			setAttr("tsNote", 1);
		}
		// 获取当前登录专家编号
		Expert expert = getSessionAttr(Constants.Expert_User_Session);
		removeSessionAttr(Constants.SESSION_USER_TYPE);
		setSessionAttr(Constants.SESSION_USER_TYPE, "expert");

		if (expert == null) {
			redirect("/");
		} else {

			int id = expert.get("id");
			params.put("ExpertID", id);
			params.put("ProjectCN", ProjectCN);
			params.put("Category", Category);
			params.put("prize", prizecx);
			params.put("status", status);
			params.put("RegisterNum", RegisterNum);

			// 项目打分规则 中获取专评时间
			Prize pz = Prize.me.findMaxPrize();
			if (pz != null) {
				setAttr("ProfessionalStartTime",
						pz.getTimestamp("ProfessionalStartTime") + "");
				setAttr("ProfessionalEndTime",
						pz.getTimestamp("ProfessionalEndTime") + "");
			}			
			setAttr("expert", expert);
			setAttr("queryParam", queryParam);	
			
				
			// 调用显示评奖类别集合 用来显示动态下拉框
			Category me = new Category();
			setAttr("CategoryList", me.findAll());

			Prize prize = Prize.me.findMaxPrize();
			if (prize == null) {
				prize = new Prize();
			}
			setAttr("prize", prize);
			if(prize.get("Status")!=null && prize.getInt("Status")==1){//评审状态为开启状态才显示内容
				setAttr("proReviewPage", ProjectReview.dao.paginate(
						getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, params));		
				}
			
			render("reviewpt.html");
		}

	}
	
	// 查看项目基本情况
		public void seeProject() {
			Integer id = getParaToInt("id");
			Integer step = getParaToInt("step");
			Integer registerNum = getParaToInt("registerNum"); // 登记号 根据登记号查询
																// 获奖名单管理用来查看
			Expert expert = getSessionAttr(Constants.Expert_User_Session);
            String fileName ="";
			Project p = new Project();
			if (null != id)
				p = Project.me.findById(id);
			if (null != registerNum)
				p = Project.me.findRegisterNum(registerNum).get(0);
			switch (step) {
			case 1:// 项目基本情况
				setAttr("project", Project.me.projectFindId(p.getInt("id")).get(0));
				render("xiangmu0" + (step) + ".html");
				break;
			case 2:// 项目简介
				setAttr("project", p);
				render("xiangmu0" + (step) + ".html");
				break;
			case 3:// 项目详细内容
				setAttr("project", p);
				render("xiangmu0" + (step) + ".html");
				break;
			case 4:// 应用情况
				setAttr("project", p);
				render("xiangmu0" + (step) + ".html");
				break;
			case 5:// 经济效益
				setAttr("project", p);
				setAttr("EcList",
						Economies.me.selectEconmiesbyId(getParaToInt(0, 1), 50,
								p.getInt("id")).getList());
				render("xiangmu0" + (step) + ".html");
				break;
			case 6:// 社会 效益
				setAttr("project", p);
				render("xiangmu0" + (step) + ".html");
				break;
			case 7:// 知识产权
				setAttr("project", p);
				setAttr("PtList",
						Property.me.selectPtbyId(getParaToInt(0, 1), 50,
								p.getInt("id")).getList());
				render("xiangmu0" + (step) + ".html");
				break;
			case 8:// 主要完成单位
				setAttr("project", p);
				setAttr("MCList",
						MajorCompany.me.selectMCbyId(getParaToInt(0, 1), 50,
								p.getInt("id")).getList());
				render("xiangmu0" + (step) + ".html");
				break;
			case 9:// 主要完成人
				setAttr("project", p);
				setAttr("KPList",
						KeyPerson.me.selectKPbyId(getParaToInt(0, 1), 50,
								p.getInt("id")).getList());
				render("xiangmu0" + (step) + ".html");
				break;
			case 10:// 附件
				setAttr("project", p);
				setAttr("ACList", Accessory.me.selectAybyId(p.getInt("id")));
				render("xiangmu" + (step) + ".html");
				break;
			case 11:// 基本信息页盖章
				setAttr("project", p);
				String fundamentals = p.get("Fundamentals").toString();			
				if(fundamentals!=null && !"".equals(fundamentals)){
					fileName = fundamentals.substring(fundamentals.lastIndexOf("/")+1, fundamentals.length());
							
				}
				setAttr("fileName", fileName);
				render("xiangmu" + (step) + ".html");
				break;
			case 12:// 推荐单位意见
				setAttr("project", p);
				String recommended = p.get("Recommended").toString();
				if(recommended!=null && !"".equals(recommended)){
					fileName = recommended.substring(recommended.lastIndexOf("/")+1, recommended.length());						
				}
				setAttr("fileName", fileName);
				render("xiangmu" + (step) + ".html");
				break;
			}

			setAttr("expert", expert);
		}

	/**
	 * 评审 首页
	 * 
	 * @throws UnsupportedEncodingException
	 * 
	 */
	public void psmain() throws UnsupportedEncodingException {
		String ProjectID = getPara("ProjectID"); // 项目编号
		String ExpertID = getPara("ExpertID"); // 专家编号
		String UserName = getPara("UserName"); // 专家编号
		String Category = getPara("Category"); // 评奖类别
		int currentPage = getParaToInt("currentPage"); 
		setAttr("currentPage", currentPage);
		String prid = getPara("prid"); // 已评ID

		setAttr("ProjectCN", Project.me.findById(ProjectID).get("ProjectCN"));
		setAttr("ProjectID", ProjectID);
		setAttr("ExpertID", ExpertID);
		setAttr("UserName", UserName);
		setAttr("prid", prid);
		int RegisterNum = getParaToInt("RegisterNum"); // 登记号
		setAttr("RegisterNum", RegisterNum);

		if ("".equals(prid)) // 新增
		{
			setAttr("pro", new ProjectReview());
		} else// 修改
		{
			ProjectReview pro = ProjectReview.dao.findById(getPara("prid"));
			setAttr("pro", pro);
		}
		Prize prize = Prize.me.findMaxPrize();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
	/*	// 根据评奖类别 跳转到不同页面
		if ("1".equals(Category)) // 技术发明
		{
			render("psmb2.html");
		} else if ("2".equals(Category)) // 自然科学
		{
			render("psmb1.html");
		} else if ("3".equals(Category)) // 技术开发
		{
			render("psmb3.html");
		} else if ("4".equals(Category))// 社会公益
		{
			render("psmb4.html");
		} else if ("5".equals(Category))// 重大工程
		{
			render("psmb5.html");
		} else {
			render("psmb1.html");
		}
*/
		render("psmb1.html");//后续修改为不分类别
		// String ProjectCN=getPara("ProjectCN"); //登记号
	}

	/**
	 * 评审 新增 修改 如果没有提交前 还允许修改 评审记录
	 */
	public void psAdd() {

		ProjectReview projectR = getModel(ProjectReview.class);
		// 如果 prid 为空 则 新增 不为空 修改记录
/*		if (projectR.get("id") != null && !"".equals(projectR.get("id"))) {
			projectR.set("status", "1").update();
		} else {			
			projectR.set("status", "1"); // 1默认已操作
			projectR.save();
		}*/
		if(!"".equals(projectR.getStr("projectID")) && !"".equals(projectR.getStr("expertID")) && projectR.getStr("projectID")!=null && projectR.getStr("expertID")!=null){
			long cpr = ProjectReview.dao.findProjectReviewPidAndEid(projectR.getStr("projectID"),projectR.getStr("expertID"));
			if (cpr==0) {			
				projectR.set("status", "1"); // 1默认已操作
				projectR.save();
			} else {			
				projectR.set("status", "1").update();
			}
		}
								
		int currentPage;
		if(getPara("currentPage")!=null && getPara("currentPage")!=""){
			currentPage =  getParaToInt("currentPage");
		}else{
			currentPage=1;
		}
		
		
		// getModel(ProjectReview.class).save();
		//index();
		
		Map params = new HashMap();

		Map<String, String> queryParam = getQueryParam();

		String ProjectCN = queryParam.get("ProjectCN"); // 项目名称
		String Category = queryParam.get("Category"); // 评奖类型
		String prizecx = queryParam.get("prizecx");// 是否推荐一等奖
		String status = queryParam.get("status");// 操作类型

		// 获取当前登录专家编号
		Expert expert = getSessionAttr(Constants.Expert_User_Session);
		removeSessionAttr(Constants.SESSION_USER_TYPE);
		setSessionAttr(Constants.SESSION_USER_TYPE, "expert");

		if (expert == null) {
			redirect("/");
		} else {

			int id = expert.get("id");
			params.put("ExpertID", id);
			params.put("ProjectCN", ProjectCN);
			params.put("Category", Category);
			params.put("prize", prizecx);
			params.put("status", status);

			// 项目打分规则 中获取专评时间
			Prize pz = Prize.me.findMaxPrize();
			if (pz != null) {
				setAttr("ProfessionalStartTime",
						pz.getTimestamp("ProfessionalStartTime") + "");
				setAttr("ProfessionalEndTime",
						pz.getTimestamp("ProfessionalEndTime") + "");
			}			
			setAttr("expert", expert);
			setAttr("queryParam", queryParam);			
			setAttr("proReviewPage", ProjectReview.dao.paginate(
					currentPage, Constants.PAGE_SIZE, params));
				
			// 调用显示评奖类别集合 用来显示动态下拉框
			Category me = new Category();
			setAttr("CategoryList", me.findAll());

			Prize prize = Prize.me.findMaxPrize();
			if (prize == null) {
				prize = new Prize();
			}
			setAttr("prize", prize);

			render("reviewpt.html");
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
		int pcount = ProjectReview.dao.projectRevewCount(params);
		if (pcount > 0) // 大于0 表示 还有未评审的项目
		{
			setAttr("ts", "您还有" + pcount + "个未评审的项目，请全部评审后再提交！");
		} else // 调用修改方法 把状态改为 2 已提交
		{
			ProjectReview.dao.projectRevewUpd(params);
			setAttr("ts", "提交成功!");
		}
		index();
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

				setAttr("project", Project.me.findById(id)); // 用于修改页面
				// 主要完成单位
				setAttr("MCList", MajorCompany.me.selectMCbyId(
						getParaToInt(0, 1), 10, id));
				// 主要完成人员
				setAttr("KPList",
						KeyPerson.me.selectKPbyId(getParaToInt(0, 1), 10, id));
				// 经济效益
				setAttr("EcList", Economies.me.selectEconmiesbyId(
						getParaToInt(0, 1), 10, id));
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

	// 下载项目基本情况 保存到wrod
	public void projectOut() throws Exception {
		if (null != getPara("id") && !"".equals(getPara("id"))) {
			// 先给项目基础信息模板动态赋值
			long id = Long.parseLong(getPara("id"));
			Project p = new Project();
			KeyPerson kp = new KeyPerson();
			MajorCompany mc = new MajorCompany();
			List ps = p.me.selectProjectById(id);
			List kpList = kp.me.selectKPbyId(getParaToInt(0, 1), 20, id)
					.getList();
			List mcList = mc.me.selectMCbyId(getParaToInt(0, 1), 20, id)
					.getList();

			// 要写入wrod的html文件路径 及被写入的wrod路径
			String filepath = PathKit.getWebRootPath()
					+ "/project/project.html";
			String fileWrodPath = PathKit.getWebRootPath()
					+ "/upload/project/doc/temp.doc";

			// 读取页面内容
			String content = readFile(filepath);
			// 替换页面 标签内容
			String contentAfter = this.replaceProject(content, ps, kpList,
					mcList);

			boolean flag = this.writeWordFile(fileWrodPath, contentAfter);
		}

		renderFile(new File(PathKit.getWebRootPath()
				+ "/upload/project/doc/temp.doc"));
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
					.replaceAll("EndTime", p.getDate("StartTime") + "")
					.replace("FromTask",
							ftcontent + " " + p.getStr("FromOther") + "")
					.replaceAll("kp_Name", kpcontent + "")
					.replaceAll("mc_Name", mccontent + "").replace("null", "");
		}
		return content;
	}
	/**
	 * 下载
	 */
	public void download() {
		String projectID = getPara("projectID");			
		try {
			String id = getPara("id");
			Accessory accessory = Accessory.me.findById(id);
			String Path = "";
			if (accessory != null) {
				Path = accessory.get("filePath");
			}
			File file = new File(Path);
			renderFile(file);
		} catch (Exception e) {
			e.printStackTrace();
			redirect("/projectreview/seeProject?step=10&id="+projectID);
		}
	}
	/**
	 * 预览
	 */
	public void preview() {
		String id = getPara("id");
		String projectID = getPara("projectID");
		try {			
			Accessory accessory = Accessory.me.findById(id);
			String filePath = "";
			String fileName="";
			String type="1";
			String pdfPath="";
			String swfPath="";
			if (accessory != null) {
				filePath = accessory.get("filePath");
				fileName = accessory.get("fileName");				
				if(fileName.contains(".doc") || fileName.contains(".docx") ){
					pdfPath=filePath.replaceAll(".docx", ".pdf").replaceAll(".doc", ".pdf");
					swfPath = pdfPath.replaceAll(".pdf", ".swf");
					String swfPathName = swfPath.substring(swfPath.lastIndexOf("/")+1,swfPath.indexOf(".swf"));
					swfPathName = StringFilter(swfPathName);
					swfPath = swfPath.substring(0, swfPath.lastIndexOf("/")+1)+swfPathName+".swf";
					type="2";
					Tools.wordToPDFNoRe(filePath, pdfPath);
					Tools.pdf2SWF(pdfPath, swfPath);					
					filePath = swfPath;
				}else if(fileName.contains(".pdf")){
					type="2";
					swfPath = filePath.replaceAll(".pdf", ".swf");
					String swfPathName = swfPath.substring(swfPath.lastIndexOf("/")+1,swfPath.indexOf(".swf"));
					 swfPathName = StringFilter(swfPathName);
					swfPath = swfPath.substring(0, swfPath.lastIndexOf("/")+1)+swfPathName+".swf";
					Tools.pdf2SWF(filePath, swfPath);
					filePath = swfPath;
				}else if(fileName.contains(".jpg")||fileName.contains(".png")){
					type="1";
				}else{
					type="0";
				}
			}
			filePath = filePath.substring(filePath.indexOf("upload"),filePath.length());
			setAttr("type", type);
			setAttr("filePath", filePath);
			render("preview.html");
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	
	
	
	
	/**
	 * 下载基本信息页盖章和推荐单位意见
	 * fileType等于1就是基本信息页盖章，2是推荐单位意见
	 */
	public void downloadProject() {
		String fileType = getPara("fileType");
		String projectID = getPara("projectID");
		try {			
			Project project = Project.me.findById(projectID);
			String Path = "";
			if (project != null) {
				if("1".equals(fileType)){
					Path = project.get("Fundamentals");
				}else{
					Path = project.get("Recommended");
				}				
			}
			File file = new File(Path);
			if(file!=null&&file.exists()){
				renderFile(new File(Path));
			}else{
				redirect("/projectreview/seeProject?id="+projectID+"&step=1");
			}			
		} catch (Exception e) {
			e.printStackTrace();
			redirect("/projectreview/seeProject?id="+projectID+"&step=1");
		}
	}
	
	/**
	 * 预览
	 * * fileType等于1就是基本信息页盖章，2是推荐单位意见
	 */
	public void previewProject() {
		String fileType = getPara("fileType");
		String projectID = getPara("projectID");
		try {			
			Project project = Project.me.findById(projectID);
			String filePath = "";
			String fileName="";
			String swfPath="";
			String type="1";
			if (project != null) {
				if("1".equals(fileType)){
					filePath = project.get("Fundamentals");					
				}else{
					filePath = project.get("Recommended");	
				}
				if(filePath!=null && !"".equals(filePath)){
					fileName = filePath.substring(filePath.lastIndexOf("/")+1, filePath.length());							
				}				
                if(fileName.contains(".pdf")){
                	swfPath = filePath.replaceAll(".pdf", ".swf");
                	Tools.pdf2SWF(filePath, swfPath);
                	filePath = swfPath;
					type="2";
				}else if(fileName.contains(".jpg")||fileName.contains(".png")){
					type="1";
				}else{
					type="0";
				}
			}
			filePath = filePath.substring(filePath.indexOf("upload"),filePath.length());
			setAttr("type", type);
			setAttr("filePath", filePath);
			render("preview.html");
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	public String StringFilter(String str) throws PatternSyntaxException {
		// 只允许字母和数字
		// String regEx = "[^a-zA-Z0-9]";
		// 清除掉所有特殊字符
		String regEx = "[`~!@#$%^&*()+=|{}':;',//[//].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);
		return m.replaceAll("").trim();
	}

}
