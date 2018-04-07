package com.ccoa.customawards;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.ccoa.admin.Admin;
import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.common.Tools;
import com.ccoa.company.Company;
import com.ccoa.expert.Expert;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.ccoa.interceptor.ExpertUserInterceptor;
import com.ccoa.project.MajorCompany;
import com.ccoa.project.Project;
import com.ccoa.projectreview.ProjectReviewOther;
import com.ccoa.review.Review;
import com.ccoa.utils.EncryptionUtil;
import com.jfinal.aop.Before;
import com.jfinal.ext.render.excel.PoiRender;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;
//import com.sun.java.swing.plaf.windows.resources.windows;
//import com.sun.org.apache.bcel.internal.generic.NEW;

/**
 * GroupController 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller
 * 中，养成好习惯，有利于大型项目的开发与维护
 */
@Before(ExpertUserInterceptor.class)
public class ReviewController extends BaseController {

	private static Logger log = Logger.getLogger(ReviewController.class);

	/**
	 * 评审项目列表
	 */
	public void list() {
		Expert expert = (Expert) getSessionAttr(Constants.Expert_User_Session);
		if (expert == null) {
			redirect("/");
		} else {
			Map<String, String> queryParam = getQueryParam();
			// 默认年份
			Calendar c = Calendar.getInstance();
			// 转换日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
			String gyear = sdf.format(c.getTime()); // 获取当前年份
			String nyear = sdf.format(c.getTime()); // 获取当前年份
			setAttr("years", Baseinfo.me.years(Integer.parseInt(gyear))); // 只能是当前年份
			if (queryParam.get("Year") != null) {
				gyear = queryParam.get("Year");
			}
			queryParam.put("Year", gyear);
			setAttr("caReviewPage", CaReview.me.caReviewPage(
					getParaToInt("pageNumber", 1), Constants.PAGE_SIZE,
					queryParam, expert.get("id").toString()));
			setAttr("expert", expert);
			setAttr("nyear", nyear);
			setAttr("queryParam", queryParam);
			render("expert/reviewList.html");
		}
	}

	/**
	 * 评审列表
	 */
	public void reviewDeclarationList() {
		Expert expert = (Expert) getSessionAttr(Constants.Expert_User_Session);
		if (expert == null) {
			redirect("/");
		} else {
			Map<String, String> queryParam = getQueryParam();
			String baseinfoID = getPara("baseinfoID");
			Baseinfo baseinfo = Baseinfo.me.findById(baseinfoID);
			String bs = baseinfo.get("HeaderAttribute").toString();
			bs = bs.replaceAll(":", "");
			bs = bs.replaceAll("：", "");
			String[] base = bs.split(",");
			setAttr("base", base);
			setAttr("caReviewList", CaReview.me.findCaReview(expert.get("id")
					.toString(), baseinfoID));
			setAttr("expert", expert);
			setAttr("baseinfo", baseinfo);
			setAttr("queryParam", queryParam);
			render("expert/reviewDeclarationList.html");
		}
	}

	// 下载申请书
	public void downloadDeclarationFile() {
		String declarationID = getPara("declarationID");
		File file;
		Declaration declaration = Declaration.me.findById(declarationID);
		if (getPara("type") == "1" || "1".equals(getPara("type"))) {
			file = new File(declaration.getStr("DeclarationFilePath"));
			if (file.exists()) {
				renderFile(file);
			} else {
				list();
			}
		} else {
			Baseinfo baseinfo = Baseinfo.me.findById(declaration.get("BaseinfoID"));
			file = new File(baseinfo.getStr("ReviewFilePath"));
			if (file.exists()) {
				renderFile(file);
			} else {
				list();
			}
		}

	}
	// 下载上传的评分表
		public void downloadScoreFileFile() {
			String reviewID = getPara("reviewID");
			File file;
			CaReview caReview = CaReview.me.findById(reviewID);
			if (getPara("type") == "1" || "1".equals(getPara("type"))) {
				file = new File(caReview.getStr("ScoreFilePath"));
				if (file.exists()) {
					renderFile(file);
				} else {
					list();
				}
			} else {				
					list();
				
			}
		}

	// 评审界面
	public void reviewView() {
		Expert expert = (Expert) getSessionAttr(Constants.Expert_User_Session);
		if (expert == null) {
			redirect("/");
		} else {
			String reviewID = getPara("reviewID");
			CaReview caReview = CaReview.me.findById(reviewID);
			Baseinfo baseinfo = Baseinfo.me
					.findById(caReview.get("BaseinfoID"));
			Declaration declaration = Declaration.me.findById(caReview
					.get("DeclarationID"));
			setAttr("caReview", caReview);
			setAttr("baseinfo", baseinfo);
			setAttr("declaration", declaration);
			setAttr("expert", expert);
			setAttr("type", getPara("type"));
			render("expert/reviewView.html");
		}
	}

	// 评审
	public void review() {
		Expert expert = (Expert) getSessionAttr(Constants.Expert_User_Session);
		if (expert == null) {
			redirect("/");
		} else {
			try {
				UploadFile file = getFile("file");
				String reviewID = getPara("reviewID");
				CaReview caReviewTemp = CaReview.me.findById(reviewID);
				if (file != null) {
					this.uploadFile("file", "\\upload", Constants.FILE_MAXSize,
							"utf-8", caReviewTemp.get("BaseinfoID").toString(),
							expert.get("id").toString(), reviewID);
				}
				CaReview caReview = getModel(CaReview.class); // 获取页面表单数据
				caReview.set("ReviewTime", new Date());				
				caReview.update();
				redirect("/review/reviewDeclarationList?baseinfoID="+caReviewTemp.get("BaseinfoID"));
			} catch (Exception e) {
			}
		}
	}
/*	public void review() {
		Expert expert = (Expert) getSessionAttr(Constants.Expert_User_Session);
		if (expert == null) {
			redirect("/");
		} else {
			try {
				UploadFile file = getFile("file");
				String reviewID = getPara("reviewID");
				CaReview caReviewTemp = CaReview.me.findById(reviewID);
				if (file != null) {
					this.uploadFile("file", "\\upload", Constants.FILE_MAXSize,
							"utf-8", caReviewTemp.get("BaseinfoID").toString(),
							expert.get("id").toString(), reviewID);
				}
				CaReview caReview = getModel(CaReview.class); // 获取页面表单数据
				caReview.set("ReviewTime", new Date());
				caReview.update();
				renderJson("success", true);
			} catch (Exception e) {
				renderJson("success", false);
			}
		}
	}*/
    //提交评审
	public void sumbitReview() {
		Expert expert = (Expert) getSessionAttr(Constants.Expert_User_Session);
		try {
			if (expert == null) {
				redirect("/");
			} else {
				String baseinfoID = getPara("baseinfoID");
				String expertID = getPara("expertID");
				CaReview.me.updateISSubmit(baseinfoID, expertID);
				renderJson("success", true);
			}
		} catch (Exception e) {
			renderJson("success", false);
		}
	}
	//确认是否已全部评审
	public void totalNotRecommend() {
		Expert expert = (Expert) getSessionAttr(Constants.Expert_User_Session);
		try {
			if (expert == null) {
				redirect("/");
			} else {
				String baseinfoID = getPara("baseinfoID");
				String expertID = getPara("expertID");
				List<CaReview> caReviewList =  CaReview.me.findRecommend(expertID,baseinfoID);
				if(caReviewList.isEmpty()){
					renderJson("success", true);
				}else{
					renderJson("success", false);
				}				
			}
		} catch (Exception e) {
			renderJson("success", false);
		}
	}
	

	// 附件上传公用方法
	// parameterName是指在表单中file表单域的名称，saveDirectory是指文件保有存路径，maxPostSize是指文件最大长度，encoding是指文件编码。
	public void uploadFile(String parameterName, String saveDirectory,
			Integer maxPostSize, String encoding, String id, String userID,
			String reviewID) {
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
		CaReview caReview = CaReview.me.findById(reviewID);
		caReview.set("ScoreFilePath", newPath);
		caReview.set("ScoreFile", fileName);
		caReview.update();
		// 复制文件都新的目录
		Tools.copyFile(path, newPath);
	}
	
	// 删除回传评分表
	public void delScoreFile() {
		boolean isT = true;
		try {
			String reviewID = getPara("id");
			CaReview caReview = CaReview.me.findById(reviewID);
			if (caReview != null) {
				String scoreFilePath = caReview.get("ScoreFilePath");
				if (scoreFilePath != null && !"".equals(scoreFilePath)) {
					isT = Tools.delFile(scoreFilePath);
					caReview.set("ScoreFilePath", null).set("ScoreFile", null).update();
				}
			}
			renderJson("success", true);
		} catch (Exception e) {
			renderJson("success", false);
		}
	}

}
