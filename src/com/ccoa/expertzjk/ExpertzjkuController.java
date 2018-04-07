package com.ccoa.expertzjk;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;









import org.omg.CORBA.PRIVATE_MEMBER;

import com.ccoa.admin.Admin;
import com.ccoa.admin.set.Chapter;
import com.ccoa.admin.set.GroupExpert;
import com.ccoa.admin.set.WinningList;
import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.common.PingYinUtil;
import com.ccoa.common.Tools;
import com.ccoa.common.ZipUtil_new;
import com.ccoa.expert.Expert;
import com.ccoa.expert.Jobs;
import com.ccoa.expert.Results;
import com.ccoa.expert.Winners;
import com.ccoa.expert.Writings;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.ccoa.project.Project;
import com.ccoa.utils.EncryptionUtil;
import com.ccoa.utils.Result;
import com.ccoa.utils.StringUtils;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.ext.render.excel.PoiRender;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;

/**
 * 专家库 所有 sql 与业务逻辑写在 Model 或 Service 中
 */
@Before(AdminUserInterceptor.class)
public class ExpertzjkuController extends BaseController {
	private static Logger log = Logger.getLogger(ExpertzjkuController.class);

	public void index() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		setAttr("user", user);
		Map<String, String> queryParam = getQueryParam();
		setAttr("expertPage", Expert.me.paginateSetZjk(getParaToInt("pageNumber", 1), 
				Constants.PAGE_SIZE,
				queryParam.get("Name"), 
				queryParam.get("ChapterName"),
				queryParam.get("Job"), 
				queryParam.get("Learn"),
				queryParam.get("Working"),
				queryParam.get("TechTitle")
				));
		setAttr("queryParam", queryParam);
		render("guanli-zjk.html");
	}

	/**
	 * 进入 添加页面
	 */
	public void add() {
		setAttr("projectPage", Project.me.projectList(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE));
		setAttr("chapterPage", Chapter.me.paginate(
				getParaToInt("pageNumber", 1), 100));
		setAttr("chapterPage1", Jobs.me.paginate(getParaToInt("pageNumber", 1),
				Constants.PAGE_SIZE));
		setAttr("chapterPage2", Results.me.paginate(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE));
		setAttr("chapterPage3", Winners.me.paginate(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE));
		setAttr("chapterPage4", Writings.me.paginate(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE));
		// setAttr("chapterPage5",Expert.me.paginateSetZjkGL(getParaToInt("pageNumber",1),Constants.PAGE_SIZE,
		// getParaToInt("id")));

		setAttr("expert", new Expert());// 专家表
		setAttr("jobs", new Jobs());// 只要工作经历表
		setAttr("results", new Result());// 主要专业技术工作业绩表
		setAttr("winners", new Winners());// 获奖情况表
		setAttr("writings", new Writings());// 主要论著表
		render("guanli-zjk-xinzeng.html");
	}

	/*
	 * 修改 动态添加数据id,jobs id跟expert的id是一样的两张数据库的ID 相同 要将两张表的数据id设置为不相同 页面
	 * 先将数据库数据删除再插入两个问题：添加数据的时候动态添加id,2 删除数据的时候，要获取id
	 */
	public void edit() {
		setAttr("projectPage", Project.me.projectList(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE));
		setAttr("chapterPage", Chapter.me.paginate(
				getParaToInt("pageNumber", 1), 100));

		Expert expert = Expert.me.findById(getParaToInt("id"));
		int id = getParaToInt("id");
		List<Jobs> jobs = Jobs.me.findbyids(id);
		List<Results> results = Results.me.findbyids(id);
		List<Writings> writings = Writings.me.findbyids(id);
		List<Winners> winners = Winners.me.findbyids(id);
		setAttr("expert", expert);
		setAttr("jobs", jobs);
		setAttr("jobsSize", jobs.size());
		setAttr("results", results);
		setAttr("resultsSize", results.size());
		setAttr("winners", winners);
		setAttr("winnersSize", winners.size());
		setAttr("writings", writings);
		setAttr("writingsSize", writings.size());
		render("guanli-zjk-xiugai.html");

	}

	/***
	 * 添加、修改专家库
	 */
	public void save() {

		try {
			setAttr("chapterPage", Chapter.me.paginate(
					getParaToInt("pageNumber", 1), Constants.PAGE_SIZE));
			Expert expert = getModel(Expert.class);
			

			if (expert.get("id", null) == null) {
				expert.set("Password",
						EncryptionUtil.md5Encrypt(expert.getStr("Password")));
				expert.save();
				// 这里对应的而是页面下标值取得的是验证工作经历时间
				int rowIndex = getParaToInt("jobs.rowIndex");
				Jobs jobs;
				for (int i = 1; i <= rowIndex; i++) {
					if(getPara("jobs.StartTime" + i)!=null && getPara("jobs.EndTime" + i)!=null){
						jobs = new Jobs();					
						jobs.set("ExpertID", expert.get("id"));
						if(!"".equals( getPara("jobs.StartTime" + i)) &&  getPara("jobs.StartTime" + i)!=null ){
							jobs.set("StartTime", getPara("jobs.StartTime" + i));
						}
						if(!"".equals( getPara("jobs.EndTime" + i)) &&  getPara("jobs.EndTime" + i)!=null ){
							jobs.set("EndTime", getPara("jobs.EndTime" + i));
						}												
						jobs.set("Company", getPara("jobs.Company" + i));
						jobs.set("Job", getPara("jobs.Job" + i));
						jobs.save();
					}
					
				}
				// 这里对应的而是页面下标值取得的是主要专业技术工作业绩
				int a = getParaToInt("results.rowIndex1");
				Results results;
				for (int i = 1; i <= a; i++) {
					results = new Results();
					if(getPara("results.StartTime" + i)!=null && getPara("results.EndTime" + i)!=null){
						results.set("ExpertID", expert.get("id"));
						if(!"".equals( getPara("results.StartTime" + i)) &&  getPara("results.StartTime" + i)!=null ){
							results.set("StartTime", getPara("results.StartTime" + i));
						}
						if(!"".equals( getPara("results.EndTime" + i)) &&  getPara("results.EndTime" + i)!=null ){
							results.set("EndTime", getPara("results.EndTime" + i));
						}
						results.set("JobName", getPara("results.JobName" + i));
						results.set("Role", getPara("results.Role" + i));
						results.set("Results", getPara("results.Results" + i));
						results.set("Situation", getPara("results.Situation" + i));
						results.save();
					}
				}
				int b = getParaToInt("writings.rowIndex1");
				Writings writings;
				for (int i = 1; i <= b; i++) {
					if(getPara("writings.Date" + i)!=null){
						writings = new Writings();
						writings.set("ExpertID", expert.get("id"));
						writings.set("Writings", getPara("writings.Writings" + i));
						writings.set("Identity", getPara("writings.Identity" + i));
						writings.set("Publishers", getPara("writings.Publishers"
								+ i));
						if(!"".equals( getPara("writings.Date" + i)) &&  getPara("writings.Date" + i)!=null ){
							writings.set("Date", getPara("writings.Date" + i));
						}
						writings.save();
					}
				}
				// winners.set("id", expert.get("id"));

				int c = getParaToInt("winners.rowIndex1");
				Winners winners;
				for (int i = 1; i <= c; i++) {
					if(getPara("winners.Date" + i)!=null){
						winners = new Winners();
						winners.set("ExpertID", expert.get("id"));
						if(!"".equals( getPara("winners.Date" + i)) &&  getPara("winners.Date" + i)!=null ){
							winners.set("Date", getPara("winners.Date" + i));
						}
						winners.set("Title", getPara("winners.Title" + i));
						winners.set("Level", getPara("winners.Level" + i));
						winners.set("Ranking", getPara("winners.Ranking" + i));
						winners.set("Contribute", getPara("winners.Contribute" + i));
						winners.save();
					}
				}

			} else {
				Jobs jobs;
				Results results;

				// 需要判断密码是否被修改 如果没有被修改 默认数据库值
				Expert ex = Expert.me.findById(expert.get("id"));
				if (ex.get("Password").equals(expert.get("Password"))) {
					expert.set("Password", ex.get("Password"));
				} else {
					expert.set("Password", EncryptionUtil.md5Encrypt(expert
							.getStr("Password")));
				}

				expert.update();
				// List<Jobs> jobs=new ArrayList<Jobs>();
				// jobs=getModels(Jobs.class, "jobs");
				int d = getParaToInt("jobs.rowIndex");

				for (int i = 1; i <= d; i++) {
					if (getParaToInt("jobs.id" + i) != null) {
						jobs = Jobs.me.findById(getParaToInt("jobs.id" + i));
						if(!"".equals( getPara("jobs.StartTime" + i)) &&  getPara("jobs.StartTime" + i)!=null ){
							jobs.set("StartTime", getPara("jobs.StartTime" + i));
						}
						if(!"".equals( getPara("jobs.EndTime" + i)) &&  getPara("jobs.EndTime" + i)!=null ){
							jobs.set("EndTime", getPara("jobs.EndTime" + i));
						}	
						jobs.set("Company", getPara("jobs.Company" + i));
						jobs.set("Job", getPara("jobs.Job" + i));
						jobs.update();
					} else {
						jobs = new Jobs();
						jobs.set("ExpertID", expert.get("id"));
						if(!"".equals( getPara("jobs.StartTime" + i)) &&  getPara("jobs.StartTime" + i)!=null ){
							jobs.set("StartTime", getPara("jobs.StartTime" + i));
						}
						if(!"".equals( getPara("jobs.EndTime" + i)) &&  getPara("jobs.EndTime" + i)!=null ){
							jobs.set("EndTime", getPara("jobs.EndTime" + i));
						}	
						jobs.set("Company", getPara("jobs.Company" + i));
						jobs.set("Job", getPara("jobs.Job" + i));
						jobs.save();
					}

				}
				int e = getParaToInt("results.rowIndex");

				for (int i = 1; i <= e; i++) {
					if (getParaToInt("results.id" + i) != null) {
						results = Results.me.findById(getParaToInt("results.id"
								+ i));
						if(!"".equals( getPara("results.StartTime" + i)) &&  getPara("results.StartTime" + i)!=null ){
							results.set("StartTime", getPara("results.StartTime" + i));
						}
						if(!"".equals( getPara("results.EndTime" + i)) &&  getPara("results.EndTime" + i)!=null ){
							results.set("EndTime", getPara("results.EndTime" + i));
						}
						results.set("JobName", getPara("results.JobName" + i));
						results.set("Role", getPara("results.Role" + i));
						results.set("Results", getPara("results.Results" + i));
						results.set("Situation", getPara("results.Situation"
								+ i));
						results.update();
					} else {
						results = new Results();
						results.set("ExpertID", expert.get("id"));
						if(!"".equals( getPara("results.StartTime" + i)) &&  getPara("results.StartTime" + i)!=null ){
							results.set("StartTime", getPara("results.StartTime" + i));
						}
						if(!"".equals( getPara("results.EndTime" + i)) &&  getPara("results.EndTime" + i)!=null ){
							results.set("EndTime", getPara("results.EndTime" + i));
						}
						results.set("Role", getPara("results.Role" + i));
						results.set("Results", getPara("results.Results" + i));
						results.set("Situation", getPara("results.Situation"
								+ i));
						results.save();
					}

				}

				int f = 1;
				f = getParaToInt("writings.rowIndex1");
				Writings writings;
				for (int i = 1; i <= f; i++) {
					if (getParaToInt("writings.id" + i) != null) {
						writings = Writings.me
								.findById(getParaToInt("writings.id" + i));
						writings.set("Writings", getPara("writings.Writings"
								+ i));
						writings.set("Identity", getPara("writings.Identity"
								+ i));
						writings.set("Publishers",
								getPara("writings.Publishers" + i));
						if(!"".equals( getPara("writings.Date" + i)) &&  getPara("writings.Date" + i)!=null ){
							writings.set("Date", getPara("writings.Date" + i));
						}
						writings.update();
					} else {
						writings = new Writings();
						writings.set("ExpertID", expert.get("id"));
						writings.set("Writings", getPara("writings.Writings"
								+ i));
						writings.set("Identity", getPara("writings.Identity"
								+ i));
						writings.set("Publishers",
								getPara("writings.Publishers" + i));
						if(!"".equals( getPara("writings.Date" + i)) &&  getPara("writings.Date" + i)!=null ){
							writings.set("Date", getPara("writings.Date" + i));
						}
						writings.save();
					}

				}
				// winners.set("id", expert.get("id"));
				Winners winners;
				int g = getParaToInt("winners.rowIndex1");
				for (int i = 1; i <= g; i++) {
					if (getParaToInt("winners.id" + i) != null) {
						winners = Winners.me.findById(getParaToInt("winners.id"
								+ i));
						if(!"".equals( getPara("winners.Date" + i)) &&  getPara("winners.Date" + i)!=null ){
							winners.set("Date", getPara("winners.Date" + i));
						}
						winners.set("Title", getPara("winners.Title" + i));
						winners.set("Level", getPara("winners.Level" + i));
						winners.set("Ranking", getPara("winners.Ranking" + i));
						winners.set("Contribute", getPara("winners.Contribute"
								+ i));
						winners.update();
					} else {
						winners = new Winners();
						winners.set("ExpertID", expert.get("id"));
						if(!"".equals( getPara("winners.Date" + i)) &&  getPara("winners.Date" + i)!=null ){
							winners.set("Date", getPara("winners.Date" + i));
						}
						winners.set("Title", getPara("winners.Title" + i));
						winners.set("Level", getPara("winners.Level" + i));
						winners.set("Ranking", getPara("winners.Ranking" + i));
						winners.set("Contribute", getPara("winners.Contribute"
								+ i));
						winners.save();
					}

				}
			}
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			renderJson("success", false);
		}
	}

	public void delete() {
		try {
			String ids = getPara("ids");
			Long a = GroupExpert.me.findGroupExpertsByExpertId(ids);
			if(a!=0){
				renderJson("success", false);
			}else{
				Expert.me.deleteByIds(ids);
				renderJson("success", true);
			}			
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void delete1() {
		try {
			String ids = getPara("ids");
			Jobs.me.deleteById(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void delete2() {
		try {
			String ids = getPara("ids");
			Results.me.deleteById(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void delete3() {
		try {
			String ids = getPara("ids");
			Writings.me.deleteById(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void delete4() {
		try {
			String ids = getPara("ids");
			Winners.me.deleteById(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void operate() {
		try {
			int id = getParaToInt("expert.id", 0);
			int change = getParaToInt("expert.Change", 0);
			Expert.me.operate(change, id);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}

	}

	// 导出专家组 专家成员
	public void toExpertExcel() throws IllegalStateException {
		Map<String, String> queryParam = getQueryParam();
		List geList = Expert.me.paginateSetZjk(getParaToInt("pageNumber", 1),
				50000, queryParam.get("Name"), queryParam.get("ChapterName"),
				queryParam.get("Job"), queryParam.get("Moblie"),
				queryParam.get("Learn"),queryParam.get("TechTitle")).getList();
		setAttr("queryParam", queryParam);
		for (int i = 0; i < geList.size(); i++) {
			Expert map = (Expert) geList.get(i);
			map.put("id", i + 1);// 连续的序号
			if ("null".equals(map.get("Name"))) {
				map.put("Name", "");
			}
			if ("null".equals(map.get("Degree"))) {
				map.put("Degree", "");
			}
			if ("null".equals(map.get("UserName"))) {
				map.put("UserName", "");
			}
			if ("null".equals(map.get("Password"))) {
				map.put("Password", "");
			}
			if ("null".equals(map.get("Learn"))) {
				map.put("Learn", "");
			}
			if ("null".equals(map.get("Working"))) {
				map.put("Working", "");
			}
			if ("null".equals(map.get("TechTitle"))) {
				map.put("TechTitle", "");
			}
			if ("null".equals(map.get("Job"))) {
				map.put("Job", "");
			}
			if ("null".equals(map.get("Moblie"))) {
				map.put("Moblie", "");
			}
			if ("null".equals(map.get("Email"))) {
				map.put("Email", "");
			}
		}
		String[] columns = { "id", "Name", "UserName", "Password", "Degree",
				"Learn", "Working", "TechTitle", "Job", "Moblie", "Email" };
		String[] heades = { "序号", "姓名", "用户名", "密码", "学历/学位", "所学专业", "现从事专业",
				"专业技术职称", "工作单位及职务", "手机", "E-mail" };

		render(PoiRender.me(geList).fileName("Expertzjk.xls")
				.sheetName("专家基础信息列表").headers(heades).columns(columns)
				.cellWidth(5000).headerRow(2));

	}

	/*public void importExport()

	{
		Expert expert;
		String success = ""; // 提示用的
		// 先把文件上传
		UploadFile file = getFile("ExportExcel", PathKit.getWebRootPath()
				+ "\\upload\\import", 200 * 1024 * 1024, "utf-8"); // 后期需要定期清理该文件
		try {
			Workbook rwb = Workbook.getWorkbook(new FileInputStream(file
					.getFile().getPath())); // 再读取
			Sheet rs = rwb.getSheet(0);// 或者rwb.getSheet(0)
			int clos = rs.getColumns();// 得到所有的列
			int rows = rs.getRows();// 得到所有的行
			// System.out.println(clos+" rows:"+rows);
			for (int i = 1; i < rows; i++) {
				expert = new Expert();
				for (int j = 0; j < clos; j++) {
					// 第一个是列数，第二个是行数
					// expert.set("ChapterID",rs.getCell(j++,
					// i).getContents());//默认最左边编号也算一列 所以这里得j++
					expert.set("Name", rs.getCell(j++, i).getContents());
					expert.set("UserName", rs.getCell(j++, i).getContents());
					expert.set("Password", rs.getCell(j++, i).getContents());
					expert.set("Degree", rs.getCell(j++, i).getContents());
					expert.set("Learn", rs.getCell(j++, i).getContents());
					expert.set("Working", rs.getCell(j++, i).getContents());
					expert.set("TechTitle", rs.getCell(j++, i).getContents());
					expert.set("Job", rs.getCell(j++, i).getContents());
					expert.set("Moblie", rs.getCell(j++, i).getContents());
					expert.set("Email", rs.getCell(j++, i).getContents());

					// expert.set("Sex", rs.getCell(j++, i).getContents());
				}
				if (StringUtils.isNotEmpty(expert.get("UserName"))) {
					List ids = expert.me.isExist(expert.get("UserName")
							.toString());
					if (ids.size() > 0)// 表示存在
					{
						expert.set("id", ids.get(0)); // 根据查出来的ID进行修改
						expert.update();
					} else
						// 表示新增
						expert.save();
					{

					}
				}
			}

			boolean ts = (new File(file.getFile().getPath())).delete();// 导入成功后
																		// 删除文件

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.error(e);
			success = "导入失败!";
		}
		if (success == "") {
			success = "导入成功!";
		} else {
			success += "请重新导入!";
		}
		setAttr("Moblie", getPara("Moblie"));
		setAttr("Name", getPara("Name"));
		setAttr("success", success); // 提示
		render("zjkts.html");
	}*/
	
	//批量导入专家信息，打包成rar或者zip上传后代码自动解压进行处理
	public void importExport() throws Exception
	{

		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		// 默认年份
		Calendar c = Calendar.getInstance();
		// 转换日期格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
		String gtime = sdf.format(c.getTime()); // 获取当前年份
		Expert expert;
		String success = ""; // 提示用的
		String fail = ""; // 提示用的，导入失败
		String successBf = ""; // 导入成功，但是有的格式导入失败
		String uzipFilePath ="";
		String fileName ="";
		String jyFileNamePath = "";
		String tempPath ="";
		int a=0;
		int b=0;
		int cgtj=0;//统计成功导入数量
		int sbtj=0;//统计成功导入数量
		String isT="cg";//导入是否成功
		String uploadPath = PathKit.getWebRootPath()+ "\\upload\\import\\"+user.get("id").toString()+gtime;//上传文件路径
		File destDir = new File(uploadPath);
		if (!destDir.exists()) {
			destDir.mkdirs();
		}
		// 先把文件上传
		UploadFile file = getFile("ExportExcel", uploadPath, 200 * 1024 * 1024, "utf-8"); // 后期需要定期清理该文件		
		uzipFilePath = PathKit.getWebRootPath() + "\\temp\\import\\"+user.get("id").toString()+gtime;//复制到新的文件夹
		File destDir1 = new File(uzipFilePath);
		if (!destDir1.exists()) {
			destDir1.mkdirs();
		}
		 if ((file.getFileName() != null) && (file.getFileName().length() > 0)) { 
	            int dot = file.getFileName().lastIndexOf(".zip"); 
	            if ((dot >-1) && (dot < (file.getFileName().length()))) { 
	            	fileName = file.getFileName().substring(0, dot); 
	            } 
	        } 
		 String sf = PathKit.getWebRootPath() + "\\temp\\import\\";
		 //zip复制到新的目录
		 String czipPath = uzipFilePath+"\\"+fileName+".zip";
		 Tools.copyFile(file.getFile().getPath(),czipPath);		 
		//解压					
			ZipUtil_new.unZip(czipPath,uzipFilePath );
			jyFileNamePath = uzipFilePath + "\\"+fileName;
			File f1 = new File(jyFileNamePath);
			//获取文件夹下所有的文件
			 String[] filelist = f1.list();
			 if(filelist!=null){
				 cgtj=0;
				 for (int i = 0; i < filelist.length; i++) {					
						 tempPath = jyFileNamePath+"\\"+filelist[i];
			        	 File ft = new File(tempPath);
			        	 String fileType = tempPath.substring(tempPath.lastIndexOf(".") + 1, tempPath.length());
			        	 if(fileType.equals("xls")||fileType.equals("xlsx")){
					         InputStream stream = new FileInputStream(tempPath);
					         Workbook wb = null;
					         if (fileType.equals("xls")) {
					           wb = new HSSFWorkbook(stream);
					         } else if (fileType.equals("xlsx")) {
					           wb = new XSSFWorkbook(stream);
					         } else {
					           System.out.println("您输入的excel格式不正确");
					         }
					         Sheet sheet1 = wb.getSheetAt(0);
					         isT = saveExpert(sheet1);
					         if("cg".equals(isT)){//成功
					        	 cgtj++;
					         }else if("sb".equals(isT)) {
					        	 sbtj++;
					        	 fail = fail + filelist[i]+"导入失败，请检查名称和邮箱是否正确！正确后后再确认其他格式是否正确</br>"; 
					         }else if("sb1".equals(isT)) {
					        	 cgtj++;
					        	 successBf = successBf+filelist[i]+"成功导入，但是时间格式或者分会内容不正确！</br>";
					         } else if("sb2".equals(isT)) {//名称重复
					        	 sbtj++;
					        	 fail = fail + filelist[i]+"导入失败，该用户已存在！</br>"; 			        	 
					         }
					         //System.out.println(getCell(sheet1.getRow(0).getCell(3)));
					     /* // 遍历行Row
					       for(int rowNum=0;rowNum<=sheet1.getLastRowNum();rowNum++){
					                 Row row=sheet1.getRow(rowNum);
					                     if(row==null){
					                          continue;
					                     }
					                      // 遍历列Cell
					                     System.out.println( "第"+rowNum+"行");
					                      for(int cellNum=0;cellNum<=row.getLastCellNum();cellNum++){
					                          Cell cell=row.getCell(cellNum);
					                         if(cell==null){
					                             continue;
					                          }
					                          System.out.print( "第"+cellNum+"列值为："+getCell(cell));
					                      }
					                      System.out.println();
					                  }*/
					         stream.close();
					         wb.close();			          
					 }
		        	}
			 }else{
				String gsFail = "文件不能为空和zip文件名称和里面文件夹名称需要一致！"; 
				setAttr("gsFail", gsFail);
				render("zjkts.html");
			 }
		    Tools.deleteDir(f1);   		         
			file.getFile().delete();	
			File f2  = new File(czipPath);
			if(f2!=null){
				f2.delete();
			}
			destDir1.delete();
			destDir.delete();            
			success = "成功导入"+cgtj+"条信息</br>";
			if(sbtj!=0){
				fail = "导入失败"+sbtj+"条信息:</br>"+fail;
			}			
			setAttr("success", success);
			setAttr("fail", fail);
			setAttr("successBf", successBf);
	     	render("zjkts.html");					
	}
	public String getCell(Cell cell) {
			String result = "";
			if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC){  
			    short format = cell.getCellStyle().getDataFormat();
			    System.out.println("format:"+format);
			    SimpleDateFormat sdf = null;  
			    if(format == 14 || format == 31 || format == 57 || format == 58){  
			        //日期  
			        sdf = new SimpleDateFormat("yyyy-MM-dd");  
			    }else if (format == 20 || format == 32) {  
			        //时间  
			        sdf = new SimpleDateFormat("HH:mm");  
			    }else if(format == 0) {  
			        //时间  
			        sdf = new SimpleDateFormat("yyyy"); 			    	
			    }
			    double value = cell.getNumericCellValue();  
			    Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(value);  
			    if(date!=null && sdf!=null){
			    	 result = sdf.format(date);
			    }
			     
			} else{
			
				result = cell.getStringCellValue();
			}
			return result;
		}
	//导入初始化值入库
	private String  saveExpert(Sheet sheet){
			SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy.MM.dd" );
			SimpleDateFormat sdf1 =   new SimpleDateFormat( "yyyy年" );
			SimpleDateFormat sdf2 =   new SimpleDateFormat( "yyyy-MM-dd" );
			Expert expert = new Expert();
			String sex="男";
			String result="cg";
			String email="";
			String userNamet="";
			String userName="";
			try {
				email =getCell(sheet.getRow(9).getCell(2));;//9、2 E-mail				
				if(email==null||"".equals(email)||!emailFormat(email)){
					result = "sb";
					return result;
				}
				userNamet = getCell(sheet.getRow(3).getCell(2));
				if(userNamet==null||"".equals(userNamet)){
					result = "sb";
					return result;
				}
				expert.set("Email", email);//9、2 E-mail
				userName = PingYinUtil.getFirstSpell(userNamet)+emailContent(email);				
				if(Expert.me.checkName(userName)!=0){
					result = "sb2";//名称重复
					return result;
				}				
				expert.set("UserName", userName);//获取文字首字母
				expert.set("Password", "e10adc3949ba59abbe56e057f20f883e");//密码，初始化为123456				
			} catch (Exception e) {
				result = "sb";
				return result;
				// TODO: handle exception
			}
			try {
				expert.set("Name", getCell(sheet.getRow(3).getCell(2)));//3、2姓名	
				sex =getCell(sheet.getRow(3).getCell(8));
				if(sex=="女" || "女".equals(sex)){
					expert.set("Sex",0 );//3、8 性别 0女，1是男
				}else{
					expert.set("Sex",1);//3、8 性别 0女，1是男
				}								
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				String sss = getCell(sheet.getRow(3).getCell(13));
				if(sss!=null && !"".equals(sss)){
					Date t = sdf2.parse(sss);
					expert.set("Birthday",t);//3、13 出生年月
				}				
			} catch (Exception e) {
				result = "sb1";//sb1日期格式失败
				// TODO: handle exception
			}
			try {
				expert.set("Nation", getCell(sheet.getRow(4).getCell(2)));//4、2 民族
				expert.set("Origin", getCell(sheet.getRow(4).getCell(8)));//4、8 籍贯
				expert.set("Parties", getCell(sheet.getRow(4).getCell(13)));//4、13 政治面貌								
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				expert.set("Degree", getCell(sheet.getRow(5).getCell(2)));//5、2 学历
				expert.set("Learn", getCell(sheet.getRow(5).getCell(8)));//5、8 所学专业
				expert.set("Working", getCell(sheet.getRow(5).getCell(13)));//5、13 从事专业
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				expert.set("TechTitle", getCell(sheet.getRow(6).getCell(2)));//6、2 专业技术职称及任职时间
				expert.set("School", getCell(sheet.getRow(6).getCell(11)));//6、11 毕业学校
				expert.set("Job", getCell(sheet.getRow(7).getCell(2)));//7、2 工作单位及    职务
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				expert.set("Identity", getCell(sheet.getRow(7).getCell(11)));//7、11身份证号码
				expert.set("Address", getCell(sheet.getRow(8).getCell(2)));//8、2 通讯地址
				expert.set("Phone", getCell(sheet.getRow(8).getCell(12)));//8、12 电话
				Cell cell1= sheet.getRow(9).getCell(12);
				cell1.setCellType(Cell.CELL_TYPE_STRING);//转换程 字符串格式
				expert.set("Moblie", cell1.getStringCellValue());//9、12 手机
				String s =cell1.getStringCellValue();				
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				String chapterID = getCell(sheet.getRow(10).getCell(2));
				String sChapterID = getChapterID(chapterID);
				if(!"".equals(sChapterID)){
					sChapterID=sChapterID.substring(0, sChapterID.length()-1);
				}
				if(chapterID!=null && !"".equals(chapterID)){
					if(sChapterID==null || "".equals(sChapterID)){
						result = "sb1";
					}
				}
				expert.set("ChapterID", sChapterID);//	10、2 所属分会,需要查库获取ID
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
				expert.set("Situation", getCell(sheet.getRow(11).getCell(3)));//11、3技术组织任职情况
				expert.set("RecommendNote", getCell(sheet.getRow(36).getCell(1)));//36、1 推荐单位意见
				expert.set("OfficeNote", getCell(sheet.getRow(42).getCell(1)));//42、1 学会理事长办公会意见				
			} catch (Exception e) {
				// TODO: handle exception
			}
			expert.set("Change", 1);
			expert.set("beizhu", "导入,"+new Date());
			try {
				expert.save();
			} catch (Exception e) {
				result = "sb";				
				e.printStackTrace();
				return result;
				// TODO: handle exception
			}
			
            /**********************************保存主要工作经验**************************************************************/			
			String[] s = new String[2];
			Jobs jobs;
			    for (int i = 0; i < 5; i++) {
				jobs=null;
				jobs = new Jobs();
				jobs.set("ExpertID", expert.get("id"));
				try {
					String setime = getCell(sheet.getRow(13+i).getCell(1));// 13、1// 起止时间,获取开始-结束时间，格式为1986.7－1991.10
					s = setime.split("－");
				} catch (Exception e) {
					// TODO: handle exception
				}
				try {					
					if(s[0]!=null && !"".equals(s[0])){
						Date date = sdf.parse( s[0]+".00");
						jobs.set("StartTime", date);
	            	}
										
				} catch (Exception e) {
					result = "sb1";//sb1日期格式失败
					// TODO: handle exception
				}
				try {
					if(s[1]!=null && !"".equals(s[1])){
						 Date date1 = sdf.parse( s[1]+".00");
							jobs.set("EndTime",date1);
					}
				} catch (Exception e) {
					result = "sb1";//sb1日期格式失败
					// TODO: handle exception
				}
				try {
					jobs.set("Company", getCell(sheet.getRow(13+i).getCell(6)));// 13、6// 工作或学习单位
					jobs.set("Job", getCell(sheet.getRow(13+i).getCell(12)));// 13、12// 职务/职称
				} catch (Exception e) {
					// TODO: handle exception
				}
				if (jobs.get("Company") != null && !"".equals(jobs.get("Company"))) {// 工作或学习单位为空值则不保存
					try {					
						jobs.save();
					} catch (Exception e) {
						// TODO: handle exception
					}				
				}
			}
		/**********************************主要专业技术工作业绩**************************************************************/	
		String[] s1 = new String[2];
		Results results;
		for(int j=0;j<5;j++){
			results=null;
			results = new Results();
			results.set("ExpertID", expert.get("id"));
			try {
				String setime1 = getCell(sheet.getRow(19+j).getCell(1));// 19、1 起止时间,获取开始-结束时间，格式为1986.7－1991.10
				s1 = setime1.split("－");
			} catch (Exception e) {
				// TODO: handle exception
			}
			try {
	         	if(s1[0]!=null && !"".equals(s1[0])){
            		Date date2 = sdf1.parse(s1[0]);
            		results.set("StartTime", date2);
            	}
			} catch (Exception e) {
				result = "sb1";//sb1日期格式失败
				// TODO: handle exception
			}
			try {

            	if(s1[1]!=null && !"".equals(s1[1])){
            		Date date3 = sdf1.parse(s1[1]);
    				results.set("EndTime", date3);
            	}
				
			} catch (Exception e) {
				result = "sb1";//sb1日期格式失败
				// TODO: handle exception
			}
			try{
				results.set("JobName", getCell(sheet.getRow(19+j).getCell(4)));//19、1 起止时间
				results.set("Role", getCell(sheet.getRow(19+j).getCell(8)));//19、8担任角色
				results.set("Results", getCell(sheet.getRow(19+j).getCell(10)));//19、10成果水平
				results.set("Situation", getCell(sheet.getRow(19+j).getCell(14)));//19、14完成情况
			}catch (Exception e) {
				// TODO: handle exception
			}						
			if (results.get("JobName") != null && !"".equals(results.get("JobName"))) {// 工作或学习单位为空值则不保存
				try {					
					results.save();
				} catch (Exception e) {
					// TODO: handle exception
				}				
			}
		}
		/**********************************主要论著**************************************************************/	
		Writings writings;
		for(int k=0;k<4;k++){
			writings=null;
			writings = new Writings();
			writings.set("ExpertID", expert.get("id"));
			try {
				writings.set("Writings", getCell(sheet.getRow(25+k).getCell(1)));//25、1 论文/著作名称
				writings.set("Identity", getCell(sheet.getRow(25+k).getCell(7)));//25、7作者身份
				writings.set("Publishers", getCell(sheet.getRow(25+k).getCell(10)));//25、10发表期刊/出版社				
			} catch (Exception e) {
				// TODO: handle exception
			}
            try {
            	String da = getCell(sheet.getRow(25+k).getCell(14));
            	if(da!=null && !"".equals(da)){
            		Date date4 = sdf1.parse(da);
                	writings.set("Date", date4);//25、14 出版日期
            	}
            	
			} catch (Exception e) {
				result = "sb1";//sb1日期格式失败
				// TODO: handle exception
			}
            if (writings.get("Writings") != null && !"".equals(writings.get("Writings"))) {// 工作或学习单位为空值则不保存
				try {					
					writings.save();
				} catch (Exception e) {
					// TODO: handle exception
				}				
			}
			
		}
		/**********************************获奖情况**************************************************************/	
		Winners winners;
		for(int l=0;l<5;l++){
			winners=null;
			winners = new Winners();
			winners.set("ExpertID", expert.get("id"));
			try {
				winners.set("Title", getCell(sheet.getRow(31+l).getCell(3)));//31、3获奖项目名称
				winners.set("Ranking", getCell(sheet.getRow(31+l).getCell(7)));//31、7奖励名称及等级
				winners.set("Level", getCell(sheet.getRow(31+l).getCell(12)));//31、12 排名 
				winners.set("Contribute", getCell(sheet.getRow(31+l).getCell(14)));//31、14贡献 				
			} catch (Exception e) {
				// TODO: handle exception
			}
            try {
            	String da1 = getCell(sheet.getRow(31+l).getCell(1));
            	if(da1!=null && !"".equals(da1)){
            	Date date5 = sdf1.parse(da1);
            	winners.set("Date", date5);//31、1 时间
            	}
			} catch (Exception e) {
				result = "sb1";//sb1日期格式失败
				// TODO: handle exception
			}
            if (winners.get("Title") != null && !"".equals(winners.get("Title"))) {// 工作或学习单位为空值则不保存
				try {					
					winners.save();
				} catch (Exception e) {
					e.printStackTrace();
					// TODO: handle exception
				}				
			}
			
		}
		return result;
	}
	//获取分会名称，用英文逗号隔开
	public String getChapterID(String ChapterContent){
		String result="";
		List<Chapter>  lChapter;
		String[] ss1 = ChapterContent.split("，");
		if(ss1==null || ss1.length==0){
			ss1 = ChapterContent.split(",");
		}
        if(ss1!=null){
        	for(int i=0;i<ss1.length;i++){
        		lChapter=null;
        		lChapter = Chapter.me.findByName(ss1[i]);
        		if(lChapter!=null && !lChapter.isEmpty()){
        			result = result+ss1[i]+",";
        		}
        	}        	
        }	
		return result;
	}
	//判断邮箱格式是否正确
	public  boolean emailFormat(String email)
    {
        boolean tag = true;
        final String pattern1 = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        final Pattern pattern = Pattern.compile(pattern1);
        final Matcher mat = pattern.matcher(email);
        if (!mat.find()) {
            tag = false;
        }
        return tag;
    }
	//获取email前面拼音做为登录名的一部分
	public  String emailContent(String email)
    {
        int endIndex =email.indexOf("@") ;
        return email.substring(0, endIndex);
    }
	
}
