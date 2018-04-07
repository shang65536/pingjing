package com.ccoa.customawards;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import com.ccoa.admin.Admin;
import com.ccoa.admin.set.Group;
import com.ccoa.admin.set.GroupExpert;
import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.common.Tools;
import com.ccoa.common.ZipUtil_new;
import com.ccoa.expert.Expert;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.ccoa.project.CommonModel;
import com.ccoa.project.Project;
import com.ccoa.utils.StringUtils;
import com.jfinal.aop.Before;
import com.jfinal.ext.render.excel.PoiRender;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;
import java.util.UUID;

/**
 * GroupController 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller
 * 中，养成好习惯，有利于大型项目的开发与维护
 */
@Before(AdminUserInterceptor.class)
public class BaseinfoController extends BaseController {

	private static Logger log = Logger.getLogger(BaseinfoController.class);

	// 进行自定义奖项列表
	public void list() {
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
			String nyear = sdf.format(c.getTime()); // 获取当前年份
			setAttr("years", Baseinfo.me.years(Integer.parseInt(gyear))); // 只能是当前年份
			if (queryParam.get("Year") != null) {
				gyear = queryParam.get("Year");
			}
			queryParam.put("Year", gyear);
			setAttr("baseinfoPage", Baseinfo.me.baseinfoReviewPage(
					getParaToInt("pageNumber", 1), Constants.PAGE_SIZE,
					queryParam));
			setAttr("user", user);
			setAttr("nyear", nyear);
			setAttr("queryParam", queryParam);
			render("management/baseinfoList.html");
		}
	}

	// 存自定义科技奖信息表信息
	public void init() {
		try {
			Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
			UUID uuid = UUID.randomUUID();
			String idString = uuid.toString();
			if (user == null) {
				redirect("/");
			} else {
				String id = getPara("id");
				String source = getPara("source");
				// String tempString = Tools.GetTextForRegex(source,
				// "<input type=\"radio\" name=\"leipiNewField\".+?value");
				String hav = getPara("hav");
				if (hav != "" && hav != null) {
					String s[] = hav.split(",");
					for (String h : s) {

						source = source.replaceAll(
								"<input type=\"radio\" name=\"leipiNewField\" title=\""
										+ h + "\"",
								"<input type=\"radio\" name=\"" + h
										+ "\" title=\"" + h + "\"");
					}
				}

				String build = getPara("build");
				String form_name = getPara("form_name");
				// 保存自定义科技奖信息表信息
				if ("" != id && null != id) {
					Baseinfo baseinfo = Baseinfo.me.findById(id);
					idString = id;
					baseinfo.set("Name", form_name);
					baseinfo.set("Build", build);
					if (source != "" && source != null && source != " "
							&& !" ".equals(source)) {
						baseinfo.set("Content", source);
					}
					Date date = new Date();
					baseinfo.set("ModifyTime", date);
					baseinfo.update();
				} else {// 新增自定义科技奖信息表信息
					Baseinfo baseinfo = new Baseinfo();
					baseinfo.set("id", uuid.toString());
					baseinfo.set("Name", form_name);
					Calendar a = Calendar.getInstance();
					baseinfo.set("Year", a.get(Calendar.YEAR));
					baseinfo.set("ReleaseStatus", 0);
					baseinfo.set("ISDeclaration", 0);
					baseinfo.set("ISReview", 0);
					baseinfo.set("ISHasReview", 1);
					baseinfo.set("Content", source);
					baseinfo.set("Build", build);
					Date date = new Date();
					baseinfo.set("CreateTime", date);
					baseinfo.set("ModifyTime", date);
					baseinfo.save();
				}

			}
			renderJson("msg", idString);
		} catch (Exception e) {
			renderJson("msg", "yichang");
			// TODO: handle exception
		}

	}

	// 预览
	public void view() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			String id = getPara("id");
			Baseinfo baseinfo = Baseinfo.me.findById(id);
			setAttr("baseinfo", baseinfo);
			String gfrstring = Tools.GetTextForRegex(
					baseinfo.getStr("Content"), "orgname\">.+?</label>");
			String[] columnTemp = gfrstring.split("</label>");
			List<String> columnList = new ArrayList<>();
			for (String s2 : columnTemp) {
				columnList.add(s2.substring(9));
			}
			setAttr("columnList", columnList);
			render("management/view.html");
		}
	}

	// 预览后保存
	public void save() {
		try {
			Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
			if (user == null) {
				redirect("/");
			} else {
				String id = getPara("id");
				String headerAttribute = getPara("headerAttributeTemp");
				Baseinfo baseinfo = Baseinfo.me.findById(id);
				baseinfo.set("HeaderAttribute", headerAttribute);
				baseinfo.set("ReleaseStatus", "1");
				baseinfo.update();
				list();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	// 删除
	public void delete() {
		try {
			Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
			if (user == null) {
				redirect("/");
			} else {
				String id = getPara("id");
				Baseinfo.me.deleteById(id);
				list();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	// 发布
	public void release() {
		try {
			Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
			if (user == null) {
				redirect("/");
			} else {
				String id = getPara("id");
				Baseinfo baseinfo = Baseinfo.me.findById(id);
				baseinfo.set("ReleaseStatus", "2");
				baseinfo.update();
				list();
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	// 专家组
	public void groupExperList() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			setAttr("user", user);
			Calendar c = Calendar.getInstance();
			// 转换日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
			String gyear = sdf.format(c.getTime()); // 获取当前年份
			setAttr("years", Project.me.years(Integer.parseInt(gyear))); // 只能是当前年份
			String id = getPara("id");
			Baseinfo baseinfo = Baseinfo.me.findById(id);
			setAttr("baseinfo", baseinfo);
			String type = "3"; // 1 专评 2 综评 3自定义专家组
			// 先看该奖项自定义专家组是否存在
			List groupList = Group.me.findGroupAllByitem(gyear, type, id);
			// 如果专家组 不存在 则系统自动创建 一年只有一个综评组
			if (groupList.size() == 0) {
				Group gp1 = new Group();
				gp1.set("Name", "自定义奖项评审组").set("Status", "1")
						// 状态 1 有效
						.set("Group_Year", gyear).set("Type", type)
						.set("BaseinfoID", id)// 综评
						.save();
				groupList = Group.me.findGroupAllByitem(gyear, type, id);
			}
			setAttr("gyear", gyear);
			setAttr("groupList", groupList);
			Group gp = (Group) groupList.get(0);
			setAttr("group", gp);
			// 默认查询第一个专家组中的 专家成员
			setAttr("gePage", GroupExpert.me.paginate(gp.getInt("id")));

			render("management/expertGroupList.html");
		}
	}

	// 跳转到 添加专家成员 页面
	public void addList() {
		Map<String, String> queryParam = getQueryParam();
		String group_id = getPara("group_id");
		Map params = new HashMap();
		params.put("UserName", queryParam.get("UserName"));
		params.put("Job", queryParam.get("Job"));
		params.put("Name", queryParam.get("Name"));
		params.put("ChapterName", queryParam.get("ChapterName"));
		setAttr("expertPage", Expert.me.paginatExpert(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, params));
		setAttr("queryParam", queryParam);
		setAttr("group_id", group_id);
		render("management/expertAddList.html");
	}

	// 保存 专家成员
	public void expertGroupAdd() {
		// 批量新增
		try {
			String expert_ids = getPara("ids"); // 专家ID
			int group_id = getParaToInt("group_id"); // 专家组
			String[] ids = expert_ids.split(",");
			for (int i = 0; i < ids.length; i++) {
				int expert_id = Integer.parseInt(ids[i]);

				// 验证在一个组中 是否添加了重复的专家 如果是就不需要新增
				Long yz = GroupExpert.me.selectGroupExpert(group_id, expert_id);
				if (yz <= 0) {
					GroupExpert ge = new GroupExpert();
					ge.set("group_id", group_id).set("expert_id", expert_id)
							.save();
				}
			}
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	// 打标记
	public void egstatus() {
		try {
			// 批量打标记
			String idstr = getPara("ids");
			int status = getParaToInt("status");
			GroupExpert.me.egstatus(status, idstr);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	// 删除组成员
	public void deleteZH() {
		try {
			String ids = getPara("ids");
			int id = getParaToInt("group_id");
			Long a = GroupExpert.me.findCountByGroupId(id);
			String[] idsString = ids.split(",");
			if (a == idsString.length) {
				renderJson("msg", "该群组已被指定项目,组员不能全部都删除！");
			} else {
				GroupExpert.me.deleteByIds(ids);
				renderJson("msg", "删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("msg", "删除失败！");
		}
	}

	// 根据组ID 清空组成员
	public void deleteZHByGId() {
		try {
			int id = getParaToInt("group_id");
			GroupExpert.me.deleteByGId(id);
			renderJson("success", true);

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	// 上传申请书界面
	public void uploadFrom() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			String id = getPara("id");
			setAttr("step", 0);
			setAttr("id", id);
			render("management/uploadApplyBook.html");
		}
	}

	// 上传申请书
	public void uploadFApplyBook() {
		try {
			Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
			if (user == null) {
				list();
			} else {
				String id = getPara("id");
				setAttr("step", 1);
				// 上传第六个文件 其它证明
				UploadFile file = getFile("fileField");
				if (file != null) {
					this.uploadFile("fileField", "\\upload",
							Constants.FILE_MAXSize, "utf-8", "其它证明", id, 1);
				}
				render("management/uploadApplyBook.html");
			}
		} catch (Exception e) {
			// TODO: handle exception
			render("management/uploadApplyBook.html");
		}

	}

	// 下载申请书
	public void downloadDeclarationFile() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
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
					list();
				}
			} else if(getPara("type") == "2" || "2".equals(getPara("type"))) {
				Declaration declaration = Declaration.me.findById(id);
				file = new File(declaration.getStr("DeclarationFilePath"));
				if (file.exists()) {
					renderFile(file);
				} else {
					list();
				}
			}else{				
				CaReview caReview = CaReview.me.findById(id);
				file = new File(caReview.getStr("ScoreFilePath"));
				if (file.exists()) {
					renderFile(file);
				} else {
					redirect("/baseinfo/showReviewList?declarationID="+caReview.getStr("DeclarationID"));					
				}
			}

		}
	}

	// 判断名称是否存在
	public void getFormName() {
		String form_name = getPara("form_name");
		Calendar c = Calendar.getInstance();
		// 转换日期格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
		String gyear = sdf.format(c.getTime()); // 获取当前年份
		List<Baseinfo> listBaseinfoList = Baseinfo.me.findByName(form_name,gyear);
		int len = listBaseinfoList.size();
		if (len == 0) {
			renderJson("success", false);
		} else {
			renderJson("success", true);
		}
	}

	// 附件上传公用方法
	// parameterName是指在表单中file表单域的名称，saveDirectory是指文件保有存路径，maxPostSize是指文件最大长度，encoding是指文件编码。FileType为1时为DeclarationFile，2时为ReviewFilePath
	public void uploadFile(String parameterName, String saveDirectory,
			Integer maxPostSize, String encoding, String type, String id,
			int FileType) {
		String nfilePathString = "\\customawards\\doc\\template\\" + id;
		File fileNew = new File(PathKit.getWebRootPath() + nfilePathString);
		// 如果文件夹不存在则创建
		if (!fileNew.exists() && !fileNew.isDirectory()) {
			fileNew.mkdir();
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
		String newPath = PathKit.getWebRootPath() + nfilePathString + "\\"
				+ fileName;
		Baseinfo baseinfo = Baseinfo.me.findById(id);
		if (1 == FileType) {
			baseinfo.set("DeclarationFilePath", newPath);
			baseinfo.set("DeclarationFile", fileName);
		} else if (2 == FileType) {
			baseinfo.set("ReviewFilePath", newPath);
			baseinfo.set("ReviewFile", fileName);
		} else if (3 == FileType) {
			baseinfo.set("ReviewResultFilePath", newPath);
			baseinfo.set("ReviewResultFile", fileName);
		}
		baseinfo.update();

		// 复制文件都新的目录
		Tools.copyFile(path, newPath);
	}

	/**
	 * 推荐项目简表列表
	 */
	public void recommendList() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			Map<String, String> queryParam = getQueryParam();
			String baseinfoID = getPara("baseinfoID");
			Baseinfo baseinfo = Baseinfo.me.findById(baseinfoID);
			String bs = baseinfo.get("HeaderAttribute").toString();
			bs = bs.replaceAll(":", "");
			bs = bs.replaceAll("：", "");
			String[] base = bs.split(",");
			queryParam.put("baseinfoID", baseinfoID);
			setAttr("base", base);
			setAttr("declarationPage",
					Declaration.me.findDeclarationByBaseinfoID(
							getParaToInt("pageNumber", 1), 20, queryParam,
							false));
			setAttr("user", user);
			setAttr("baseinfo", baseinfo);
			setAttr("queryParam", queryParam);
			render("management/recommendList.html");
		}
	}

	// 维护登记号
	public void registerSub() {
		// 先验证数值是否 未被改变
		String id = getPara("id");
		int RegisterNum = getParaToInt("RegisterNum");
		int ApplyYear = getParaToInt("year");
		
		Declaration declaration = Declaration.me.findById(id);
		// 值未被改变 不需要验证 并且不调用修改方法
		if (declaration.getInt("RegisterNum") != null
				&& RegisterNum == declaration.getInt("RegisterNum")) {
			renderJson("success", false);
		} else // 再验证是否有重复的情况
		{
			Long yz = Declaration.me.RegisterSub(RegisterNum,
					declaration.get("BaseinfoID").toString());
			if (yz > 0) {
				renderJson("success", "登记号重复，请重新编辑!");
			} else {
				declaration.set("RegisterNum", RegisterNum).update(); // 修改登记号
				renderJson("success", "操作成功");
			}
		}

	}

	/**
	 * 形式审查表
	 */
	public void examinationList() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			Map<String, String> queryParam = getQueryParam();
			String baseinfoID = getPara("baseinfoID");
			Baseinfo baseinfo = Baseinfo.me.findById(baseinfoID);
			String bs = baseinfo.get("HeaderAttribute").toString();
			bs = bs.replaceAll(":", "");
			bs = bs.replaceAll("：", "");
			String[] base = bs.split(",");
			queryParam.put("baseinfoID", baseinfoID);
			setAttr("base", base);
			setAttr("declarationPage",
					Declaration.me
							.findDeclarationByBaseinfoID(
									getParaToInt("pageNumber", 1), 20,
									queryParam, true));
			setAttr("user", user);
			setAttr("baseinfo", baseinfo);
			setAttr("queryParam", queryParam);
			render("management/examinationList.html");
		}
	}

	// 预览
	public void examinationView() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			String id = getPara("id");
			String type = getPara("type");
			Declaration declaration = Declaration.me.findById(id);
			Baseinfo baseinfo = Baseinfo.me.findById(declaration
					.get("BaseinfoID"));
			Map<String, String> queryParam = getQueryParam();
			queryParam.put("DeclarationID", id);
			setAttr("rormalReviewOpinionPage",
					RormalReviewOpinion.me
							.findRormalReviewOpinionByDeclarationID(
									getParaToInt("pageNumber", 1), 50,
									queryParam));
			setAttr("baseinfo", baseinfo);
			setAttr("declaration", declaration);
			setAttr("type", type);
		}
		render("management/examination.html");
	}

	// 预览
	public void examination() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			String declarationID = getPara("id");
			String Opinion = getPara("Opinion");
			String Status = getPara("Status");
			Declaration declaration = Declaration.me.findById(declarationID);
			Baseinfo baseinfo = Baseinfo.me.findById(declaration
					.get("BaseinfoID"));
			declaration.set("FormalReviewOpinion", Opinion)
					.set("FormalReviewStatus", Status).update();
			RormalReviewOpinion rormalReviewOpinion = new RormalReviewOpinion();
			rormalReviewOpinion.set("id", UUID.randomUUID().toString());
			rormalReviewOpinion.set("DeclarationID", declarationID);
			rormalReviewOpinion.set("Status", Status);
			rormalReviewOpinion.set("Opinion", Opinion);
			rormalReviewOpinion.set("AdminID", user.get("id"));
			rormalReviewOpinion.set("CreateTime", new Date());
			rormalReviewOpinion.save();
			redirect("/baseinfo/examinationList?baseinfoID="
					+ baseinfo.get("id"));
		}
	}

	// 申报状态设置 是否可申报（0可申报，1不可申报）
	public void iSDeclaration() {
		// 先验证数值是否 未被改变
		String id = getPara("id");
		int ISDeclaration = getParaToInt("ISDeclaration");
		Baseinfo baseinfo = Baseinfo.me.findById(id);
		baseinfo.set("ISDeclaration", ISDeclaration).update();
		renderJson("success", "操作成功");
	}

	// 判断是否已完全审核完
	public void isAllReview() {
		String baseinfoID = getPara("baseinfoID");
		List<Declaration> declarationList = Declaration.me
				.findDeclarationByBaseinfoIDAndFormalReviewStatus(baseinfoID, 0);
		int len = declarationList.size();
		if (len == 0) {
			renderJson("success", true);
		} else {
			renderJson("success", false);
		}
	}

	// 上传申请书界面
	public void uploadReviewFrom() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			String id = getPara("baseinfoID");
			setAttr("step", 0);
			setAttr("id", id);
			render("management/uploadReviewFrom.html");
		}
	}

	// 发送给专家
	public void send() {
		try {
			Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
			if (user == null) {
				redirect("/");
			} else {
				// 上传第六个文件 其它证明
				UploadFile file = getFile("fileField");
				String id = getPara("baseinfoID");
				setAttr("step", 1);
				setAttr("id", id);
				if (file != null) {
					this.uploadFile("fileField", "\\upload",
							Constants.FILE_MAXSize, "utf-8", "其它证明", id, 2);
				}
				// 状态2：形式审查通过项目评审中
				List<Declaration> declarationList = Declaration.me
						.findDeclarationByBaseinfoIDAndFormalReviewStatus(id, 2);
				List<Expert> expertList = Expert.me.findbyBaseinfoID(id);
				Date date = new Date();
				for (Declaration declaration : declarationList) {
					for (Expert expert : expertList) {
						if ((CaReview.me.findByDeclarationIDAndExpertID(
								declaration.get("id").toString(),
								expert.get("id").toString())).isEmpty()) {
							CaReview caReview = new CaReview();
							caReview.set("id", UUID.randomUUID().toString());
							caReview.set("BaseinfoID", id);
							caReview.set("DeclarationID", declaration.get("id"));
							caReview.set("ExpertID", expert.get("id"));
							caReview.set("CreateTime", date);
							caReview.save();
						}
					}
				}
				render("management/uploadReviewFrom.html");
			}
		} catch (Exception e) {
			// TODO: handle exception
			render("management/uploadReviewFrom.html");
		}

	}

	/**
	 * 评审结果列表
	 */
	public void reviewResultList() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			Map<String, String> queryParam = getQueryParam();
			String baseinfoID = getPara("baseinfoID");
			Baseinfo baseinfo = Baseinfo.me.findById(baseinfoID);
			String bs = baseinfo.get("HeaderAttribute").toString();
			bs = bs.replaceAll(":", "");
			bs = bs.replaceAll("：", "");
			String[] base = bs.split(",");
			queryParam.put("baseinfoID", baseinfoID);
			setAttr("base", base);
			setAttr("declarationPage",
					Declaration.me.findReviewResult(
							getParaToInt("pageNumber", 1), 20, queryParam));
			setAttr("user", user);
			setAttr("baseinfo", baseinfo);
			setAttr("queryParam", queryParam);
			render("management/reviewResultList.html");
		}
	}

	// 评审结果审批
	public void reviewStatus() {
		String declarionID = getPara("declarionID");
		String formalReviewStatus = getPara("formalReviewStatus");
		Declaration declaration = Declaration.me.findById(declarionID);
		declaration.set("FormalReviewStatus", formalReviewStatus);
		declaration.update();
		renderJson("success", true);
	}

	// 填写评审意见
	public void reviewOpinion() {
		String declarionID = getPara("declarionID");
		String reviewOpinion = getPara("reviewOpinion");
		Declaration declaration = Declaration.me.findById(declarionID);
		declaration.set("ReviewOpinion", reviewOpinion);
		declaration.update();
		renderJson("success", true);
	}

	// 评审状态设置 是否可评审（0可评审，1不可评审）
	public void iSReview() {
		// 先验证数值是否 未被改变
		String id = getPara("id");
		int iSReview = getParaToInt("iSReview");
		Baseinfo baseinfo = Baseinfo.me.findById(id);
		baseinfo.set("ISReview", iSReview).update();
		renderJson("success", "操作成功");
	}

	/**
	 * 导出Excel
	 */
	public void exportExcel() {
		try {
			getResponse().setCharacterEncoding("UTF-8");
			Map<String, String> param = getQueryParam();
			String baseinfoID = getPara("baseinfoID");
			Baseinfo baseinfo = Baseinfo.me.findById(baseinfoID);
			String bs = baseinfo.get("HeaderAttribute").toString();
			bs = bs.replaceAll(":", "");
			bs = bs.replaceAll("：", "");
			String[] base = bs.split(",");
			CommonModel excel = Declaration.me.exportExcel(baseinfo, base);
			List<Declaration> list = excel.getListDeclarations();
			if (list != null && list.size() > 0) {
				List<Declaration> resList = new ArrayList<Declaration>();
				int j = 0;
				for (Declaration declaration : list) {
					String headerAttributeValue = declaration
							.getStr("HeaderAttributeValue");// 取获取获奖奖项
					String[] headerV = StringUtils.isNotEmpty(declaration
							.getStr("HeaderAttributeValue")) ? declaration
							.getStr("HeaderAttributeValue").split(";----;")
							: new String[0];// 单位
					if (headerV.length != 0) {
						for (int i = 0; i < base.length; i++) {
							declaration.put(base[i], headerV[i]);
						}
					}
					declaration.put("rows", j + 1);
					j++;
					resList.add(declaration);
				}
				list = resList;
				String fileName = excel.getFileName();
				/* 根据request的locale 得出可能的编码，中文操作系统通常是gb2312 */
				fileName = new String(fileName.getBytes("GB2312"), "ISO_8859_1");
				render(PoiRender.me(list).fileName(fileName)
						.sheetName(excel.getSheetName())
						.headers(excel.getHeades()).columns(excel.getColumns())
						.cellWidth(5000));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	// 下载申请书
	public void uploadAllDeclaration() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			String baseinfoID = getPara("baseinfoID");
			List<Declaration> list = Declaration.me
					.findDeclarationByBaseinfoID(baseinfoID);
			Baseinfo baseinfo = Baseinfo.me.findById(baseinfoID);
			String nfilePathString = PathKit.getWebRootPath()
					+ "\\customawards\\doc\\download\\"
					+ baseinfo.get("Name").toString() + "_申报书";
			for (Declaration declaration : list) {
				if (!"".equals(declaration.get("DeclarationFilePath"))
						&& declaration.get("DeclarationFilePath") != null
						&& "" != declaration.get("DeclarationFilePath")) {
					Tools.moveFile(declaration.get("DeclarationFilePath")
							.toString(), nfilePathString);
				}
			}
			ZipUtil_new.zipFile(nfilePathString, nfilePathString + ".zip");
			renderFile(new File(nfilePathString + ".zip"));
		}
	}

	// 上传评审结果界面
	public void sendHomePageView() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			String id = getPara("baseinfoID");
			setAttr("step", 0);
			setAttr("id", id);
			render("management/sendHomePageView.html");
		}
	}

	// 评审结果发送到首页
	public void sendHomePage() {
		try {
			Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
			if (user == null) {
				redirect("/");
			} else {
				// 上传第六个文件 其它证明
				UploadFile file = getFile("fileField");
				String id = getPara("baseinfoID");
				setAttr("step", 1);
				setAttr("id", id);
				if (file != null) {
					this.uploadFile("fileField", "\\upload",
							Constants.FILE_MAXSize, "utf-8", "其它证明", id, 3);
				}
				render("management/sendHomePageView.html");
			}
		} catch (Exception e) {
			// TODO: handle exception
			render("management/sendHomePageView.html");
		}

	}
	public void showReviewList() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			String declarationID = getPara("declarationID");
			Map<String, String> queryParam = getQueryParam();;
			setAttr("caReviewPage",CaReview.me.caReviewPageByDeclarationID(getParaToInt("pageNumber", 1), 20, queryParam,declarationID));
			setAttr("declarationID", declarationID);
			render("management/showReviewList.html");
		}
		
	}

}
