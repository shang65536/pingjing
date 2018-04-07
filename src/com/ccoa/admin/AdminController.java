package com.ccoa.admin;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;

import org.apache.log4j.Logger;

import com.ccoa.admin.set.Group;
import com.ccoa.admin.set.GroupExpert;
import com.ccoa.admin.set.Template;
import com.ccoa.common.Constants;
import com.ccoa.common.Tools;
import com.ccoa.customawards.Baseinfo;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.ccoa.project.Accessory;
import com.ccoa.project.Economies;
import com.ccoa.project.KeyPerson;
import com.ccoa.project.MajorCompany;
import com.ccoa.project.Project;
import com.ccoa.project.Property;
import com.ccoa.utils.EncryptionUtil;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * AdminController 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller
 * 中，养成好习惯，有利于大型项目的开发与维护
 */
@Before(AdminUserInterceptor.class)
public class AdminController extends Controller {
	private static Logger log = Logger.getLogger(NewsController.class);

	public void index() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {

		}
	}

	// 跳转到管理员修改页面
	public void userDetail() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		Admin admin = Admin.me.findById(user.get("id"));
		setAttr("user", admin);
		render("userDetail.html");
	}

	// 保存管理员修改信息
	public void adminAdd() {
		try {
			Admin admin = getModel(Admin.class);
			Admin ad = Admin.me.findById(admin.get("id"));
			if (ad.get("AdminPassword").equals(admin.get("AdminPassword"))) // 如果密码未发生改变就不需要在加密
																			// 保留数据库中的值
			{
				admin.set("AdminPassword", ad.get("AdminPassword"));
			} else {
				admin.set("AdminPassword", EncryptionUtil.md5Encrypt(admin
						.getStr("AdminPassword")));
			}

			admin.update();
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}

	}

	public void custom() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		setAttr("user", user);
		setAttr("isBuild", 0);
		Baseinfo  baseinfo = new Baseinfo();
		setAttr("baseinfo", baseinfo);
		setAttr("build", " <form id=\"target\" class=\"form-horizontal\"><fieldset><div id=\"legend\" class=\"component\" rel=\"popover\" title=\"编辑属性\" trigger=\"manual\"data-content=\"<form class='form'><div class='controls'> <label class='control-label'>奖项名称</label> <input type='text' id='orgvalue' placeholder='请输入奖项名称'><hr/><button class='btn btn-info' type='button'>确定</button><button class='btn btn-danger' type='button'>取消</button></div></form>\"><b><input type=\"hidden\" id =\"form_name\" name=\"form_name\" value=\"\" class=\"leipiplugins\" leipiplugins=\"form_name\"/><legend class=\"leipiplugins-orgvalue\">点击输入奖项名称</legend> </b> </div></fieldset></form> ");
		render("/admin/custom/index.html");
	}
	//重置
	public void reset() {		
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		setAttr("user", user);
		setAttr("isBuild", 0);
		String id =  getPara("id");	
		Baseinfo.me.deleteByIdAndRS(id,"2");
		Baseinfo  baseinfo = new Baseinfo();
		setAttr("baseinfo", baseinfo);
		setAttr("build", " <form id=\"target\" class=\"form-horizontal\"><fieldset><div id=\"legend\" class=\"component\" rel=\"popover\" title=\"编辑属性\" trigger=\"manual\"data-content=\"<form class='form'><div class='controls'> <label class='control-label'>科技奖名称</label> <input type='text' id='orgvalue' placeholder='请输入科技奖名称'><hr/><button class='btn btn-info' type='button'>确定</button><button class='btn btn-danger' type='button'>取消</button></div></form>\"><b><input type=\"hidden\" id =\"form_name\" name=\"form_name\" value=\"\" class=\"leipiplugins\" leipiplugins=\"form_name\"/><legend class=\"leipiplugins-orgvalue\">点击输入科技奖名称</legend> </b> </div></fieldset></form> ");
		render("/admin/custom/index.html");		
	}
	//预览后返回
		public void back(){
			try {					
				Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
				setAttr("user", user);
				if (user == null) {
					redirect("/");
				} else {
				String id =  getPara("id");	
				Baseinfo  baseinfo = Baseinfo.me.findById(id);
			    setAttr("baseinfo", baseinfo);
			    setAttr("isBuild", 1);
			    setAttr("build",  baseinfo.get("Build"));
			    render("/admin/custom/index.html");
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}

	public void add() {
	}

	public void save() {
		getModel(Admin.class).save();
		redirect("/blog");
	}

	public void edit() {
		setAttr("blog", Admin.me.findById(getParaToInt()));
	}

	public void update() {
		getModel(Admin.class).update();
		redirect("/blog");
	}

	public void delete() {
		Admin.me.deleteById(getParaToInt());
		redirect("/blog");
	}

	// 查看项目基本情况
	public void seeProject() {
		Integer id = getParaToInt("id");
		Integer step = getParaToInt("step");
		Integer registerNum = getParaToInt("registerNum"); // 登记号 根据登记号查询
															// 获奖名单管理用来查看
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		String fileName = "";
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
			p.set("Content", p.get("Content").toString().replaceAll("text-indent:-", "text-indent:"));
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

		setAttr("user", user);
	}

	/**
	 * 下载
	 */
	public void download() {
		String id = getPara("id");
		String projectID = getPara("projectID");
		try {			
			Accessory accessory = Accessory.me.findById(id);
			String Path = "";
			if (accessory != null) {
				Path = accessory.get("filePath");
			}
			File file = new File(Path);
			if(file!=null&&file.exists()){
				renderFile(new File(Path));
			}else{
				redirect("/admin/seeProject?id="+projectID+"&step=1");
			}			
		} catch (Exception e) {
			e.printStackTrace();
			redirect("/admin/seeProject?id="+projectID+"&step=1");
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
				}else if(fileName.contains(".pdf")||fileName.contains(".PDF")){
					type="2";
					swfPath = filePath.replaceAll(".pdf", ".swf").replaceAll(".PDF", ".swf");
					String swfPathName1 = swfPath.substring(swfPath.lastIndexOf("/")+1,swfPath.indexOf(".swf"));
					 swfPathName1 = StringFilter(swfPathName1);
					swfPath = swfPath.substring(0, swfPath.lastIndexOf("/")+1)+swfPathName1+".swf";
					Tools.pdf2SWF(filePath, swfPath);
					filePath = swfPath;
				}else if(fileName.contains(".jpg")||fileName.contains(".png")||fileName.contains(".JPG")||fileName.contains(".PNG")){
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
				redirect("/admin/seeProject?id="+projectID+"&step=1");
			}			
		} catch (Exception e) {
			e.printStackTrace();
			redirect("/admin/seeProject?id="+projectID+"&step=1");
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
				   if(fileName.contains(".pdf")||fileName.contains(".PDF")){
	                	swfPath = filePath.replaceAll(".pdf", ".swf");
	                	Tools.pdf2SWF(filePath, swfPath);
	                	filePath = swfPath;
						type="2";
					}else if(fileName.contains(".jpg")||fileName.contains(".png")||fileName.contains(".JPG")||fileName.contains(".PNG")){
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
