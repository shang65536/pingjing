package com.ccoa.customawards;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.log4j.Logger;

import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.common.Tools;
import com.ccoa.company.Company;
import com.ccoa.interceptor.CompanyUserInterceptor;
import com.ccoa.project.Project;
import com.jfinal.aop.Before;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;

/**
 * GroupController 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller
 * 中，养成好习惯，有利于大型项目的开发与维护
 */
@Before(CompanyUserInterceptor.class)
public class DeclarationController extends BaseController {

	private static Logger log = Logger.getLogger(DeclarationController.class);

	// 未申报列表
	public void declarationList() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
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
			setAttr("years", Baseinfo.me.years(Integer.parseInt(gyear))); // 只能是当前年份
			if (queryParam.get("Year") != null) {
				gyear = queryParam.get("Year");
			}
			queryParam.put("Year", gyear);
			int userId = Integer.parseInt(user.get("id").toString());
			setAttr("baseinfoPage", Baseinfo.me.findNoDeclaration(
					getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, userId,
					queryParam));
			setAttr("user", user);
			setAttr("queryParam", queryParam);
			render("declaration/noDeclarationList.html");
		}
	}

	// 已申报列表
	public void hasDeclarationList() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
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
			setAttr("years", Baseinfo.me.years(Integer.parseInt(gyear))); // 只能是当前年份
			if (queryParam.get("Year") != null) {
				gyear = queryParam.get("Year");
			}
			queryParam.put("Year", gyear);		
			int userId = Integer.parseInt(user.get("id").toString());
			setAttr("declarationPage", Declaration.me.findHasDeclaration(
					getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, userId,
					queryParam));
			setAttr("user", user);
			setAttr("queryParam", queryParam);
			render("declaration/hasDeclarationList.html");
		}
	}

	// 申报界面
	public void view() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			String id = getPara("id");
			String type = getPara("type");
			Baseinfo baseinfo = Baseinfo.me.findById(id);
			setAttr("baseinfo", baseinfo);
			setAttr("user", user);
			setAttr("type", type);
			render("declaration/declaration.html");
		}
	}

	// 申报
	public void declaration() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			UploadFile file = getFile("file1");
			UploadFile filelei = getFile("filelei");
			String id = getPara("id");
			Baseinfo baseinfo = Baseinfo.me.findById(id);
			String content = getPara("content");
			String hav = getPara("hav");
			String headerAttribute = baseinfo.get("HeaderAttribute");
			// 设置表头对应的值
			List<String> headerAttributeList = new ArrayList<>();
			if (hav != "" && hav != null && !"".equals(hav)) {
				String a[] = hav.split(",----,");// ,----,用这个分开各个
													// :----:这个分开属性与属性值从界面获取截取回来的值,多选框时属性会存在相等，格式(,----,属性:----:属性值,----,属性:----:属性值,----,属性:----:属性值)
				String b[] = headerAttribute.split(",");// 获取数据表中已存表头信息,格式额：属性1，属性2，属性3
				for (String sha : b) {
					Boolean bl =false;
					for (String s : a) {// 属性：属性值
						int index = s.indexOf(":----:");
						if (index != -1) {
							int le = s.length();
							String aa = s.substring(0, index);
							if (sha.equals(s.substring(0, index))) {
								String sub = s.substring(index + 6, le);
								if(""!=sub && !"".equals(sub)){	
									if(!bl){
										headerAttributeList.add(sub);
										bl =true;
									}else{
										headerAttributeList.add("|"+sub);
									}
									
								}
								
							}
						}

					}
				   headerAttributeList.add(";----;");// 用;----;防止用户输入;----;
															// 前台已限制

				}
			}
			String headerAttributeValue = "";
			for (String string : headerAttributeList) {
				headerAttributeValue = headerAttributeValue + string;
			}
			Declaration declaration = new Declaration();
			UUID uuid = UUID.randomUUID();
			declaration.set("id", uuid.toString());
			declaration.set("BaseinfoID", id);
			declaration.set("FormalReviewStatus", 0);
			declaration.set("DeclareID", user.get("id"));
			declaration.set("Content", content);
			Date date = new Date();
			declaration.set("CreateTime", date);
			declaration.set("ModifyTime", date);
			if (!headerAttributeList.isEmpty()) {
				declaration.set("HeaderAttributeValue", headerAttributeValue);
			}
			declaration.save();
			if (file != null) {
				this.uploadFile("file1", "\\upload", Constants.FILE_MAXSize,
						"utf-8", uuid.toString(), user.get("id").toString());
			}
			if (filelei != null) {
				this.uploadFile("filelei", "\\upload", Constants.FILE_MAXSize,
						"utf-8", uuid.toString(), user.get("id").toString());
			}

		}
		declarationList();

	}

	// 下载申请书
	public void downloadDeclarationFile() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			String id = getPara("id");
			File file;
			if (getPara("type") == "1" || "1".equals(getPara("type"))) {
				Baseinfo baseinfo = Baseinfo.me.findById(id);
				file = new File(baseinfo.getStr("DeclarationFilePath"));
				if (file.exists()) {
					renderFile(file);
				} else {
					view();
				}
			} else {
				Declaration declaration = Declaration.me.findById(id);
				file = new File(declaration.getStr("DeclarationFilePath"));
				if (file.exists()) {
					renderFile(file);
				} else {
					show();
				}
			}

		}
	}

	// 附件上传公用方法
	// parameterName是指在表单中file表单域的名称，saveDirectory是指文件保有存路径，maxPostSize是指文件最大长度，encoding是指文件编码。
	public void uploadFile(String parameterName, String saveDirectory,
			Integer maxPostSize, String encoding, String id, String userID) {
		String nfilePathString = "\\customawards\\doc\\submit\\" + id;// 分项目
		File fileNew = new File(PathKit.getWebRootPath() + nfilePathString);
		// 如果文件夹不存在则创建
		if (!fileNew.exists() && !fileNew.isDirectory()) {
			fileNew.mkdir();
		}

		nfilePathString = nfilePathString + "\\" + userID;// 分提交人
		File fileNewT = new File(PathKit.getWebRootPath() + nfilePathString);
		// 如果文件夹不存在则创建
		if (!fileNewT.exists() && !fileNewT.isDirectory()) {
			fileNewT.mkdir();
		}

		// 上传附件
		UploadFile file = getFile(parameterName, PathKit.getWebRootPath()
				+ saveDirectory, maxPostSize, encoding);
		File source = file.getFile();
		// 得到文件名
		String fileName = file.getFileName();
		// 得到去掉后缀名 的名称
		String extension = fileName.substring(0, fileName.lastIndexOf("."));
		// 拼接保存到数据库的文件路径
		String path = PathKit.getWebRootPath() + saveDirectory + "\\"
				+ fileName;
		// 复制文件到newPath下
		String newPath = PathKit.getWebRootPath() + nfilePathString + "\\"
				+ fileName;
		Declaration declaration = Declaration.me.findById(id);
		declaration.set("DeclarationFilePath", newPath);
		declaration.set("DeclarationFile", fileName);
		declaration.update();
		// 复制文件都新的目录
		Tools.copyFile(path, newPath);
	}

	// 已申报查看界面
	public void show() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			String id = getPara("id");
			Declaration declaration = Declaration.me.findById(id);
			setAttr("declaration", declaration);
			setAttr("user", user);
			;
			render("declaration/show.html");
		}
	}

	// 补充资料界面
	public void repairView() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			String id = getPara("id");
			Declaration declaration = Declaration.me.findById(id);
			Baseinfo baseinfo = Baseinfo.me.findById(declaration.get("BaseinfoID"));
			setAttr("baseinfo", baseinfo);
			setAttr("declaration", declaration);
			setAttr("user", user);
			render("declaration/repairView.html");
		}
	}

	// 补充资料
	public void repair() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			UploadFile file = getFile("file1");
			UploadFile filelei = getFile("filelei");
			String id = getPara("id");
			String baseinfoID = getPara("baseinfoID");
			Baseinfo baseinfo = Baseinfo.me.findById(baseinfoID);
			String content = getPara("content");
			String hav = getPara("hav");
			String headerAttribute = baseinfo.get("HeaderAttribute");
			// 设置表头对应的值
			List<String> headerAttributeList = new ArrayList<>();
			if (hav != "" && hav != null && !"".equals(hav)) {
				String a[] = hav.split(",----,");// ,----,用这个分开各个
													// :----:这个分开属性与属性值从界面获取截取回来的值,多选框时属性会存在相等，格式(,----,属性:----:属性值,----,属性:----:属性值,----,属性:----:属性值)
				String b[] = headerAttribute.split(",");// 获取数据表中已存表头信息,格式额：属性1，属性2，属性3
				for (String sha : b) {
					Boolean bl =false;
					for (String s : a) {// 属性：属性值
						int index = s.indexOf(":----:");
						if (index != -1) {
							int le = s.length();
							String aa = s.substring(0, index);
							if (sha.equals(s.substring(0, index))) {
								String sub = s.substring(index + 6, le);
								if(""!=sub && !"".equals(sub)){	
									if(!bl){
										headerAttributeList.add(sub);
										bl =true;
									}else{
										headerAttributeList.add("|"+sub);
									}
									
								}
								
							}
						}

					}
				   headerAttributeList.add(";----;");// 用;----;防止用户输入;----;
															// 前台已限制

				}
			}
			String headerAttributeValue = "";
			for (String string : headerAttributeList) {
				headerAttributeValue = headerAttributeValue + string;
			}
			Declaration declaration = Declaration.me.findById(id);	
			declaration.set("Content", content);
			declaration.set("FormalReviewStatus", 0);
			Date date = new Date();
			declaration.set("ModifyTime", date);
			if (!headerAttributeList.isEmpty()) {
				declaration.set("HeaderAttributeValue", headerAttributeValue);
			}
			declaration.update();
			if (file != null) {
				this.uploadFile("file1", "\\upload", Constants.FILE_MAXSize,
						"utf-8", id, user.get("id").toString());
			}
			if (filelei != null) {
				this.uploadFile("filelei", "\\upload", Constants.FILE_MAXSize,
						"utf-8", id, user.get("id").toString());
			}

		}
		hasDeclarationList();

	}
		
	// 删除回传申请书
		public void delDeclarationFile() {
			try {
				String id = getPara("id");
				Declaration d = Declaration.me.findById(id);
				if (d != null) {
					Tools.delFile(d.getStr("DeclarationFilePath"));
					d.set("DeclarationFile", null).set("DeclarationFilePath", null).update();
					}
				renderJson("success", true);
			} catch (Exception e) {
				renderJson("success", false);
			}
		}

}
