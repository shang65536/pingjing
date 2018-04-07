package com.ccoa.admin.set;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;

import org.apache.log4j.Logger;

import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.common.PDFWaterPrint;
import com.ccoa.interceptor.CompanyUserInterceptor;
import com.ccoa.project.Accessory;
import com.ccoa.project.Economies;
import com.ccoa.project.KeyPerson;
import com.ccoa.project.MajorCompany;
import com.ccoa.project.Project;
import com.ccoa.project.Property;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.jfinal.aop.Before;
import com.jfinal.kit.PathKit;

@Before(CompanyUserInterceptor.class)
public class ProjectSetController extends BaseController {

	private static Logger log = Logger.getLogger(ProjectSetController.class);

	public void index() {
		String cur_year = new SimpleDateFormat("yyyy").format(new Date());
		Map<String, String> queryParam = getQueryParam();
		if (!queryParam.containsKey("ApplyYear")) {
			queryParam.put("ApplyYear", cur_year);
		}

		setAttr("years", Project.me.years(Integer.parseInt(cur_year)));

		// setAttr("projectPage",
		// Project.me.paginateSet(getParaToInt("pageNumber",
		// 1),Constants.PAGE_SIZE,queryParam.get("year"),queryParam.get("ProjectCN"),queryParam.get("CompanyID"),queryParam.get("companyuser")));
		setAttr("projectPage", Project.me.paginateopen(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, queryParam));
		setAttr("queryParam", queryParam);
		render("projectList.html");
	}

	/**
	 * 详情
	 */
	public void detail() {
		Project project = Project.me.findById(getParaToInt("id"));
		setAttr("project", project);
		render("projectDetail.html");
	}
	
	
	/**
	 * 单个导出
	 */
/*	public void exp() {
		try {
			// 要写入wrod的html文件路径 及被写入的wrod路径
			String filepath = PathKit.getWebRootPath()
					+ "/admin/set_project/projectAllInfo.html";
			String fileWrodPath = PathKit.getWebRootPath()
					+ "/upload/project/doc/projectAllInfo.doc";
			if (null != getPara("id") && !"".equals(getPara("id"))) {
				// 先给项目基础信息模板动态赋值
				long id = Long.parseLong(getPara("id"));
				List ps = Project.me.selectProjectById(id);
				List kpList = KeyPerson.me.selectKPbyId(getParaToInt(0, 1), 20,
						id).getList();
				List mcList = MajorCompany.me.selectMCbyId(getParaToInt(0, 1),
						20, id).getList();
				List esList = Economies.me.selectEconmiesbyId(
						getParaToInt(0, 1), 20, id).getList();
				List pyList = Property.me.selectPtbyId(getParaToInt(0, 1), 20,
						id).getList();
				// 读取页面内容
				String content = readFile(filepath);
				// 替换页面 标签内容
				String contentAfter = this.replaceProject(content, ps, kpList,
						mcList, esList, pyList);

				boolean flag = this.writeWordFile(fileWrodPath, contentAfter);
			}

			renderFile(new File(fileWrodPath));
			// renderJson("success",true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}
*/
	/**
	 * 单个导出
	 */
	public  void exp() {
		String basePathString = PathKit.getWebRootPath()
				+ "/upload/project/doc/";
		String filepath = PathKit.getWebRootPath()
				+ "/admin/set_project/projectAllInfo.html";
		String fileWrodPath ="";
		String pDFfile = "";
		String pDFfile1 = "";
		String fName ="";
		try {
			// 要写入wrod的html文件路径 及被写入的wrod路径
			Project pp = new Project();			
			if (null != getPara("id") && !"".equals(getPara("id"))) {
				// 先给项目基础信息模板动态赋值
				long id = Long.parseLong(getPara("id"));
				List ps = Project.me.selectProjectById(id);
				if(ps!=null){
					pp = (Project)ps.get(0);
					SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmssSSS");
					String dateString = df.format(new Date());					
				 	 fName = pp.getStr("ProjectCN")+"_"+dateString;
				 	fName =fName.replaceAll("/", "").replaceAll("\\\\", "");
				 	//输出pdf
					pDFfile = basePathString+pp.getStr("ProjectCN").replaceAll("/", "").replaceAll("\\\\", "")+".pdf";
					//临时doc
					fileWrodPath =basePathString+fName+".doc";
					//创建临时doc
					this.createFile(basePathString, fName+".doc");
					//临时pdf
					pDFfile1 = basePathString+fName+".pdf";
					//附件列表
					
				}				
				List kpList = KeyPerson.me.selectKPbyId(getParaToInt(0, 1), 100,
						id).getList();
				List mcList = MajorCompany.me.selectMCbyId(getParaToInt(0, 1),
						100, id).getList();
				List esList = Economies.me.selectEconmiesbyId(
						getParaToInt(0, 1), 100, id).getList();
				List pyList = Property.me.selectPtbyId(getParaToInt(0, 1), 100,
						id).getList();
				List acList = Accessory.me.selectAybyId(id);
				// 读取页面内容
				String content = readFile(filepath);
				// 替换页面 标签内容
				String contentAfter = this.replaceProject(content, ps, kpList,
						mcList, esList, pyList,acList);	
				boolean flag = this.writeWordFile(fileWrodPath, contentAfter);
				//doc转换成pdf
				wordToPDF(fileWrodPath, pDFfile1);
				log.error(new Exception("临时pdf路径:"+pDFfile1));
				log.error(new Exception("doc转换成临时pdf"));
			}
			//创建临时pdf
			createFile(basePathString, fName+".pdf");
			log.error(new Exception("0"));
			PdfReader pdfReader = new PdfReader(pDFfile1);
			log.error(new Exception("1"));
		    PdfStamper pdfStamper = new PdfStamper(pdfReader, new FileOutputStream( pDFfile));
		    log.error(new Exception("1"));
		    //加水印
		    new PDFWaterPrint().addWatermark(pdfStamper);			
			//new PDFWaterPrint().setWatermark(bos, pDFfile1, 17);	
			//删除临时doc
			deleteFile(fileWrodPath);
			//先关闭再删除临时pdf
			pdfReader.close();
			deleteFile(pDFfile1);	
			//生成的pdf输出到前台
			renderFile(new File(pDFfile));
			//deleteFile(pDFfile);
			// renderJson("success",true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(new Exception(e.getLocalizedMessage()));
			log.error(e);
			
			renderJson("success", false);
		}
	}
	
	

	// 替换查询到的数据库 字段
	public String replaceProject(String content, List ps, List kpList,
			List mcList, List esList, List pyList,List acList) {
		KeyPerson kp;// 项目完成人员
		String kptr = "";// 主要完成人员
		if (kpList != null && kpList.size() > 0) {
			for (int i = 0; i < kpList.size(); i++) {
				kp = (KeyPerson) kpList.get(i);

				String sex = "";
				if (kp.getInt("Sex") != null && kp.getInt("Sex") == 1) {
					sex = "男";
				} else {
					sex = "女";
				}
                if(i!=0){
                kptr +="<br clear=all style='page-break-before:always' mce_style='page-break-before:always'>";//分页
                }
				kptr += "<p class='MsoNorma' align='center' style='margin-bottom:6.5pt;text-align:center'><b><span style='font-size:15.0pt;font-family:黑体;color:black'>六、主要完成人情况表</span></b></p>"
                        +"<div align='center'><table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 width=697 style='margin-left:1.4pt;border-collapse:collapse;border:none;table-layout: fixed;'>"
						+ "<tr style='height:25.35pt'> <td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:25.35pt'>"
						+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span style='font-family:宋体;color:black'>第   "
						+ (i + 1)
						+ " 完成人</span></p>"
						+ "</td><td width=88 style='width:65.65pt;border:solid black 1.0pt;border-left:none;padding:0cm 1.4pt 0cm 1.4pt;height:25.35pt'>"
						+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span style='font-family:宋体;color:black'>姓 &nbsp;名</span></p>"
						+ "</td><td width=145 colspan=3 style='width:108.8pt;border:solid black 1.0pt;border-left:none;padding:0cm 1.4pt 0cm 1.4pt;height:25.35pt'>"
						+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span lang=EN-US style='color:black'> "
						+ kp.getStr("Name")
						+ " </span></p>"
						+ "</td><td width=74 colspan=3 style='width:55.35pt;border:solid black 1.0pt;border-left:none;padding:0cm 1.4pt 0cm 1.4pt;height:25.35pt'>"
						+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span style='font-family:宋体;color:black'>性  &nbsp;别</span></p>"
						+ "</td><td width=74 colspan=2 style='width:55.35pt;border:solid black 1.0pt; border-left:none;padding:0cm 1.4pt 0cm 1.4pt;height:25.35pt'>"
						+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span lang=EN-US style='color:black'> "
						+ sex
						+ " </span></p>"
						+ "</td><td width=79 colspan=2 style='width:59.4pt;border:solid black 1.0pt;border-left:none;padding:0cm 1.4pt 0cm 1.4pt;height:25.35pt'>"
						+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span style='font-family:宋体;color:black'>民族</span></p>"
						+ "</td><td width=126 style='width:94.4pt;border:solid black 1.0pt;border-left:none; padding:0cm 1.4pt 0cm 1.4pt;height:25.35pt'>"
						+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span lang=EN-US style='color:black'> "
						+ kp.getStr("Nation")
						+ " </span></p>"
						+ "</td></tr><tr style='page-break-inside:avoid;height:27.15pt'><td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;"
						+ "border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:27.15pt'><p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
						+ "<span style='font-family:宋体;color:black'>出生地</span></p></td><td width=216 colspan=3 style='width:162.0pt;border-top:none;"
						+ "border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:27.15pt'>"
						+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span lang=EN-US style='color:black'> "
						+ kp.getStr("Homeplace")
						+ " </span></p>"
						+ "</td><td width=90 colspan=4 style='width:67.8pt;border-top:none;border-left:none;  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
						+ "padding:0cm 1.4pt 0cm 1.4pt; height:27.15pt'><p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
						+ "<span style='font-family:宋体;color:black'>出生日期</span></p> </td><td width=279 colspan=5 style='width:209.2pt;"
						+ "border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:27.15pt'>"
						+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span lang=EN-US style='color:black'> "
						+ kp.getDate("Birthday")
						+ " </span></p>"
						+ "</td></tr><tr style='page-break-inside:avoid;height:19.75pt'><td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;"
						+ "border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:19.75pt'><p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
						+ "<span style='font-family:宋体;color:black'>党派名称</span></p></td><td width=585 colspan=12 style='width:439.0pt;border-top:none;"
						+ "border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:19.75pt'>"
						+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span lang=EN-US style='color:black'> "
						+ kp.getStr("Parties")
						+ " </span></p>"
						+ "</td></tr> <tr style='page-break-inside:avoid;height:20.05pt'>  <td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;"
						+ " border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:20.05pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
						+ "<span  style='font-family:宋体;color:black'>工作单位</span></p>  </td>  <td width=298 colspan=6 style='width:223.55pt;border-top:none;"
						+ "border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt; padding:0cm 1.4pt 0cm 1.4pt;height:20.05pt'>"
						+ "<p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US  style='color:black'> "
						+ kp.getStr("Company")
						+ " </span></p>"
						+ "</td><td width=90 colspan=4 style='width:67.65pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;"
						+ "border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:20.05pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
						+ "<span style='font-family:宋体;color:black'>联系电话</span></p></td> <td width=197 colspan=2 style='width:147.8pt;border-top:none;"
						+ "border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:20.05pt'>"
						+ "<p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US style='color:black'> "
						+ kp.getStr("ContactPhone")
						+ " </span></p></td></tr>"
						+ "<tr style='page-break-inside:avoid;height:40.5pt'><td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;"
						+ "border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:40.5pt'><p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
						+ "<span style='font-family:宋体;color:black'>通讯地址及邮政编码</span></p></td>"
						+ "<td width=585 colspan=12 style='width:439.0pt;border-top:none;border-left: none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
						+ " padding:0cm 1.4pt 0cm 1.4pt;height:40.5pt'><p class=MsoNormal style='line-height:20.0pt'>"
						+ "<span lang=EN-US  style='color:black'> "
						+ kp.getStr("ContactAddress")
						+ "  "
						+ kp.getStr("ZipCode")
						+ " </span></p>"
						+ "</td> </tr> <tr style='page-break-inside:avoid;height:22.5pt'>  <td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;"
						+ "  border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:22.5pt'> <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
						+ "<span   style='font-family:宋体;color:black'>家庭住址</span></p> </td>  <td width=298 colspan=6 style='width:223.55pt;border-top:none;"
						+ "border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt; padding:0cm 1.4pt 0cm 1.4pt;height:22.5pt'>"
						+ " <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US   style='color:black'> "
						+ kp.getStr("HomeAddress")
						+ " </span></p>"
						+ "</td>  <td width=90 colspan=4 style='width:67.65pt;border-top:none;border-left:none;  border-bottom:solid black 1.0pt;"
						+ "border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;  height:22.5pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
						+ "<span   style='font-family:宋体;color:black'>住宅电话</span></p>   </td>   <td width=197 colspan=2 style='width:147.8pt;"
						+ "border-top:none;border-left:  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
						+ "  padding:0cm 1.4pt 0cm 1.4pt;height:22.5pt'>  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US   "
						+ "style='color:black'> "
						+ kp.getStr("HomePhone")
						+ " </span></p>  </td> </tr> <tr style='page-break-inside:avoid;height:26.95pt'>"
						+ "  <td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;  border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:26.95pt'>"
						+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span   style='font-family:宋体;color:black'>电子信箱</span></p>"
						+ "  </td>  <td width=585 colspan=12 style='width:439.0pt;border-top:none;border-left:  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
						+ "  padding:0cm 1.4pt 0cm 1.4pt;height:26.95pt'>  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US "
						+ "  style='color:black'> "
						+ kp.getStr("EMail")
						+ " </span></p>  </td> </tr> <tr style='height:25.4pt'>"
						+ "  <td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;  border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:25.4pt'>"
						+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span   style='font-family:宋体;color:black'>毕业学校</span></p>"
						+ "  </td>  <td width=167 colspan=2 style='width:125.2pt;border-top:none;border-left:  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
						+ "  padding:0cm 1.4pt 0cm 1.4pt;height:25.4pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
						+ "<span   lang=EN-US style='color:black'> "
						+ kp.getStr("School")
						+ " </span></p>  </td>  <td width=90 colspan=3 style='width:67.65pt;border-top:none;border-left:none;"
						+ "  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;  height:25.4pt'>"
						+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span  style='font-family:宋体;color:black'>文化程度</span></p>"
						+ "  </td>  <td width=115 colspan=3 style='width:86.1pt;border-top:none;border-left:none;"
						+ "  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;  height:25.4pt'>"
						+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span   lang=EN-US style='color:black'> "
						+ kp.getStr("Education")
						+ " </span></p>"
						+ "  </td>  <td width=88 colspan=3 style='width:65.65pt;border-top:none;border-left:none;  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
						+ "padding:0cm 1.4pt 0cm 1.4pt;  height:25.4pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
						+ "<span   style='font-family:宋体;color:black'>学&nbsp;位</span></p>  </td>  <td width=126 style='width:94.4pt;border-top:none;border-left:none;"
						+ "  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;  height:25.4pt'>"
						+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span   lang=EN-US style='color:black'> "
						+ kp.getStr("Degree")
						+ " </span></p>"
						+ "  </td> </tr> <tr style='height:36.2pt'>  <td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;"
						+ "  border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:36.2pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span "
						+ "   style='font-family:宋体;color:black'>职务、职称</span></p>  </td>  <td width=167 colspan=2 style='width:125.2pt;border-top:none;"
						+ "border-left:  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;  padding:0cm 1.4pt 0cm 1.4pt;height:36.2pt'>"
						+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span   lang=EN-US style='color:black'> "
						+ kp.getStr("JobTitle")
						+ " </span></p>"
						+ "  </td>  <td width=90 colspan=3 style='width:67.65pt;border-top:none;border-left:none;  border-bottom:solid black 1.0pt;"
						+ "border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;  height:36.2pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
						+ "<span   style='font-family:宋体;color:black'>专业、专长</span></p>  </td>  <td width=115 colspan=3 "
						+ "style='width:86.1pt;border-top:none;border-left:none;  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;  height:36.2pt'>"
						+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span   lang=EN-US style='color:black'> "
						+ kp.getStr("Speciality")
						+ " </span></p>"
						+ "  </td>  <td width=88 colspan=3 style='width:65.65pt;border-top:none;border-left:none;  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
						+ "padding:0cm 1.4pt 0cm 1.4pt;  height:36.2pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
						+ "<span   style='font-family:宋体;color:black'>毕业时间</span></p>  </td>  <td width=126 style='width:94.4pt;border-top:none;border-left:none;"
						+ "  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;  height:36.2pt'>"
						+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span   lang=EN-US style='color:black'> "
						+ kp.getStr("Graduation")
						+ " </span></p>"
						+ "  </td> </tr> <tr style='height:47.55pt'>  <td width=199 colspan=3 style='width:149.55pt;border:solid black 1.0pt;"
						+ "  border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:47.55pt'>  <p class=MsoNormal style='line-height:20.0pt'><span style='"
						+ "  font-family:宋体;color:black'>曾获奖励及</span></p>  <p class=MsoNormal style='line-height:20.0pt'><span style='"
						+ "  font-family:宋体;color:black'>荣誉称号情况：</span></p>  </td>  <td width=498 colspan=11 style='width:373.35pt;border-top:none;word-break:break-all;word-wrap:break-word;"
						+ "border-left:  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;  padding:0cm 1.4pt 0cm 1.4pt;height:47.55pt'>"
						+ "  <p class=MsoNormal align=left style='text-align:left;line-height:20.0pt'><span   lang=EN-US style='color:black'> "
						+ kp.getStr("Honor")
						+ " </span></p>"
						+ "  </td> </tr> <tr style='height:27.3pt'>  <td width=199 colspan=3 style='width:149.55pt;border:solid black 1.0pt;"
						+ "  border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:27.3pt'>  <p class=MsoNormal style='line-height:20.0pt'><span style='"
						+ "  font-family:宋体;color:black'>参加本项目的起止时间</span></p>  </td>  <td width=498 colspan=11 style='width:373.35pt;border-top:none;"
						+ "border-left:  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;  padding:0cm 1.4pt 0cm 1.4pt;height:27.3pt'>"
						+ "  <p class=MsoNormal style='line-height:20.0pt'><span style=' font-family:宋体;color:black'>自  "
						+ kp.getDate("StartTime")
						+ "  至   "
						+ kp.getDate("EndTime")
						+ "  </span></p>"
						+ "  </td> </tr> <tr style='page-break-inside:avoid;height:202.1pt'>  <td width=58 style='width:43.8pt;border:solid black 1.0pt;border-top:none;"
						+ "  padding:0cm 1.4pt 0cm 1.4pt;height:202.1pt'>  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US "
						+ "  style='color:black'>&nbsp; </span><span style='font-family:宋体;color:black'>创</span></p>"
						+ "  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US   style='color:black'>&nbsp;</span></p>"
						+ "  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US   style='color:black'>&nbsp; </span>"
						+ " <span style='font-family:宋体;color:black'>造</span></p>  <p class=MsoNormal style='line-height:20.0pt'>"
						+ "<span lang=EN-US  style='color:black'>&nbsp;</span></p>  <p class=MsoNormal style='line-height:20.0pt'>"
						+ "<span lang=EN-US  style='color:black'>&nbsp; </span><span style='font-family:宋体;color:black'>性</span></p>"
						+ "  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US  style='color:black'>&nbsp;</span></p>"
						+ "  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US  style='color:black'>&nbsp; </span>"
						+ "<span style='font-family:宋体;color:black'>贡</span></p>  <p class=MsoNormal style='line-height:20.0pt'>"
						+ "<span lang=EN-US  style='color:black'>&nbsp;</span></p>  <p class=MsoNormal style='line-height:20.0pt'>"
						+ "<span lang=EN-US  style='color:black'>&nbsp; </span><span style='font-family:宋体;color:black'>献</span></p>"
						+ "  </td>  <td width=639 colspan=13 style='width:479.1pt;border-top:none;border-left:  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
						+ "  padding:0cm 1.4pt 0cm 1.4pt;height:202.1pt;word-break:break-all;word-wrap:break-word;'>  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US  style='color:black'> "
						+ kp.getStr("Contribution")
						+ " </span></p>"
						+ "  <p class=MsoNormal style='text-indent:280.0pt;line-height:20.0pt'><span   style='font-family:宋体;color:black'>本人签名：</span>"
						+ "<span  lang=EN-US style='color:black'>_______________</span></p>  <p class=MsoNormal style='line-height:20.0pt'>"
						+ "<span lang=EN-US  style='color:black'>&nbsp;</span></p>  <p class=MsoNormal style='text-indent:300.0pt;line-height:20.0pt'>"
						+ "<span  style='font-family:宋体;color:black'>年     月    日</span></p>  </td> </tr></table></div> "
						/*+ "<span lang=EN-US style='font-size:12.0pt;font-family:宋体;color:black'><br clear=all style='page-break-before:always'>&nbsp;</br></span>"*/;
			}
		}else{
			kptr += "<p class='MsoNorma' align='center' style='margin-bottom:6.5pt;text-align:center'><b><span style='font-size:15.0pt;font-family:黑体;color:black'>六、主要完成人情况表</span></b></p>"
                    +"<div align='center'><table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0 width=697 style='margin-left:1.4pt;border-collapse:collapse;border:none'>"
					+ "<tr style='height:27.95pt'> <td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:27.95pt'>"
					+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span style='font-size:14.0pt;font-family:宋体;color:black'>第   "
					+  1
					+ " 完成人</span></p>"
					+ "</td><td width=88 style='width:65.65pt;border:solid black 1.0pt;border-left:none;padding:0cm 1.4pt 0cm 1.4pt;height:27.95pt'>"
					+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span style='font-size:14.0pt;font-family:宋体;color:black'>姓 &nbsp;名</span></p>"
					+ "</td><td width=145 colspan=3 style='width:108.8pt;border:solid black 1.0pt;border-left:none;padding:0cm 1.4pt 0cm 1.4pt;height:27.95pt'>"
					+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span lang=EN-US style='font-size:14.0pt;color:black'> "
					+ " </span></p>"
					+ "</td><td width=74 colspan=3 style='width:55.35pt;border:solid black 1.0pt;border-left:none;padding:0cm 1.4pt 0cm 1.4pt;height:27.95pt'>"
					+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span style='font-size:14.0pt;font-family:宋体;color:black'>性  &nbsp;别</span></p>"
					+ "</td><td width=74 colspan=2 style='width:55.35pt;border:solid black 1.0pt; border-left:none;padding:0cm 1.4pt 0cm 1.4pt;height:27.95pt'>"
					+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span lang=EN-US style='font-size:14.0pt;color:black'> "
					+ " </span></p>"
					+ "</td><td width=79 colspan=2 style='width:59.4pt;border:solid black 1.0pt;border-left:none;padding:0cm 1.4pt 0cm 1.4pt;height:27.95pt'>"
					+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span style='font-size:14.0pt;font-family:宋体;color:black'>民族</span></p>"
					+ "</td><td width=126 style='width:94.4pt;border:solid black 1.0pt;border-left:none; padding:0cm 1.4pt 0cm 1.4pt;height:27.95pt'>"
					+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span lang=EN-US style='font-size:14.0pt;color:black'> "
					+ " </span></p>"
					+ "</td></tr><tr style='page-break-inside:avoid;height:31.25pt'><td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;"
					+ "border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:31.25pt'><p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
					+ "<span style='font-size:14.0pt;font-family:宋体;color:black'>出生地</span></p></td><td width=216 colspan=3 style='width:162.0pt;border-top:none;"
					+ "border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:31.25pt'>"
					+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span lang=EN-US style='font-size:14.0pt;color:black'> "
					+ " </span></p>"
					+ "</td><td width=90 colspan=4 style='width:67.8pt;border-top:none;border-left:none;  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
					+ "padding:0cm 1.4pt 0cm 1.4pt; height:31.25pt'><p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
					+ "<span style='font-size:14.0pt;font-family:宋体;color:black'>出生日期</span></p> </td><td width=279 colspan=5 style='width:209.2pt;"
					+ "border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:31.25pt'>"
					+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span lang=EN-US style='font-size:14.0pt;color:black'> "
					+ " </span></p>"
					+ "</td></tr><tr style='page-break-inside:avoid;height:34.85pt'><td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;"
					+ "border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:34.85pt'><p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
					+ "<span style='font-size:14.0pt;font-family:宋体;color:black'>党派名称</span></p></td><td width=585 colspan=12 style='width:439.0pt;border-top:none;"
					+ "border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:34.85pt'>"
					+ "<p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span lang=EN-US style='font-size:14.0pt;color:black'> "
			
					+ " </span></p>"
					+ "</td></tr> <tr style='page-break-inside:avoid;height:37.5pt'>  <td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;"
					+ " border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:37.5pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
					+ "<span  style='font-size:14.0pt;font-family:宋体;color:black'>工作单位</span></p>  </td>  <td width=298 colspan=6 style='width:223.55pt;border-top:none;"
					+ "border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt; padding:0cm 1.4pt 0cm 1.4pt;height:37.5pt'>"
					+ "<p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US  style='font-size:14.0pt;color:black'> "
					
					+ " </span></p>"
					+ "</td><td width=90 colspan=4 style='width:67.65pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;"
					+ "border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:37.5pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
					+ "<span style='font-size:14.0pt;font-family:宋体;color:black'>联系电话</span></p></td> <td width=197 colspan=2 style='width:147.8pt;border-top:none;"
					+ "border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:37.5pt'>"
					+ "<p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US style='font-size:14.0pt;color:black'> "
					
					+ " </span></p></td></tr>"
					+ "<tr style='page-break-inside:avoid;height:40.5pt'><td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;"
					+ "border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:40.5pt'><p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
					+ "<span style='font-size:14.0pt;font-family:宋体;color:black'>通讯地址及邮政编码</span></p></td>"
					+ "<td width=585 colspan=12 style='width:439.0pt;border-top:none;border-left: none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
					+ " padding:0cm 1.4pt 0cm 1.4pt;height:40.5pt'><p class=MsoNormal style='line-height:20.0pt'>"
					+ "<span lang=EN-US  style='font-size:14.0pt;color:black'> "
				
					+ "  "
					
					+ " </span></p>"
					+ "</td> </tr> <tr style='page-break-inside:avoid;height:34.95pt'>  <td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;"
					+ "  border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:34.95pt'> <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
					+ "<span   style='font-size:14.0pt;font-family:宋体;color:black'>家庭住址</span></p> </td>  <td width=298 colspan=6 style='width:223.55pt;border-top:none;"
					+ "border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt; padding:0cm 1.4pt 0cm 1.4pt;height:34.95pt'>"
					+ " <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US   style='font-size:14.0pt;color:black'> "
					
					+ " </span></p>"
					+ "</td>  <td width=90 colspan=4 style='width:67.65pt;border-top:none;border-left:none;  border-bottom:solid black 1.0pt;"
					+ "border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;  height:34.95pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
					+ "<span   style='font-size:14.0pt;font-family:宋体;color:black'>住宅电话</span></p>   </td>   <td width=197 colspan=2 style='width:147.8pt;"
					+ "border-top:none;border-left:  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
					+ "  padding:0cm 1.4pt 0cm 1.4pt;height:34.95pt'>  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US   "
					+ "style='font-size:14.0pt;color:black'> "
					
					+ " </span></p>  </td> </tr> <tr style='page-break-inside:avoid;height:29.2pt'>"
					+ "  <td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;  border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:29.2pt'>"
					+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span   style='font-size:14.0pt;font-family:宋体;color:black'>电子信箱</span></p>"
					+ "  </td>  <td width=585 colspan=12 style='width:439.0pt;border-top:none;border-left:  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
					+ "  padding:0cm 1.4pt 0cm 1.4pt;height:29.2pt'>  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US "
					+ "  style='font-size:14.0pt;color:black'> "
					
					+ " </span></p>  </td> </tr> <tr style='height:39.25pt'>"
					+ "  <td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;  border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:39.25pt'>"
					+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span   style='font-size:14.0pt;font-family:宋体;color:black'>毕业学校</span></p>"
					+ "  </td>  <td width=167 colspan=2 style='width:125.2pt;border-top:none;border-left:  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
					+ "  padding:0cm 1.4pt 0cm 1.4pt;height:39.25pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
					+ "<span   lang=EN-US style='font-size:14.0pt;color:black'> "
					
					+ " </span></p>  </td>  <td width=90 colspan=3 style='width:67.65pt;border-top:none;border-left:none;"
					+ "  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;  height:39.25pt'>"
					+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span  style='font-size:14.0pt;font-family:宋体;color:black'>文化程度</span></p>"
					+ "  </td>  <td width=115 colspan=3 style='width:86.1pt;border-top:none;border-left:none;"
					+ "  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;  height:39.25pt'>"
					+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span   lang=EN-US style='font-size:14.0pt;color:black'> "
					
					+ " </span></p>"
					+ "  </td>  <td width=88 colspan=3 style='width:65.65pt;border-top:none;border-left:none;  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
					+ "padding:0cm 1.4pt 0cm 1.4pt;  height:39.25pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
					+ "<span   style='font-size:14.0pt;font-family:宋体;color:black'>学&nbsp;位</span></p>  </td>  <td width=126 style='width:94.4pt;border-top:none;border-left:none;"
					+ "  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;  height:39.25pt'>"
					+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span   lang=EN-US style='font-size:14.0pt;color:black'> "
				
					+ " </span></p>"
					+ "  </td> </tr> <tr style='height:39.7pt'>  <td width=112 colspan=2 style='width:83.9pt;border:solid black 1.0pt;"
					+ "  border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:39.7pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span "
					+ "   style='font-size:14.0pt;font-family:宋体;color:black'>职务、职称</span></p>  </td>  <td width=167 colspan=2 style='width:125.2pt;border-top:none;"
					+ "border-left:  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;  padding:0cm 1.4pt 0cm 1.4pt;height:39.7pt'>"
					+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span   lang=EN-US style='font-size:14.0pt;color:black'> "
					
					+ " </span></p>"
					+ "  </td>  <td width=90 colspan=3 style='width:67.65pt;border-top:none;border-left:none;  border-bottom:solid black 1.0pt;"
					+ "border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;  height:39.7pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
					+ "<span   style='font-size:14.0pt;font-family:宋体;color:black'>专业、专长</span></p>  </td>  <td width=115 colspan=3 "
					+ "style='width:86.1pt;border-top:none;border-left:none;  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;  height:39.7pt'>"
					+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span   lang=EN-US style='font-size:14.0pt;color:black'> "
					
					+ " </span></p>"
					+ "  </td>  <td width=88 colspan=3 style='width:65.65pt;border-top:none;border-left:none;  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
					+ "padding:0cm 1.4pt 0cm 1.4pt;  height:39.7pt'>  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'>"
					+ "<span   style='font-size:14.0pt;font-family:宋体;color:black'>毕业时间</span></p>  </td>  <td width=126 style='width:94.4pt;border-top:none;border-left:none;"
					+ "  border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;  height:39.7pt'>"
					+ "  <p class=MsoNormal align=center style='text-align:center;line-height:20.0pt'><span   lang=EN-US style='font-size:14.0pt;color:black'> "
					
					+ " </span></p>"
					+ "  </td> </tr> <tr style='height:47.55pt'>  <td width=199 colspan=3 style='width:149.55pt;border:solid black 1.0pt;"
					+ "  border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:47.55pt'>  <p class=MsoNormal style='line-height:20.0pt'><span style='font-size:14.0pt;"
					+ "  font-family:宋体;color:black'>曾获奖励及</span></p>  <p class=MsoNormal style='line-height:20.0pt'><span style='font-size:14.0pt;"
					+ "  font-family:宋体;color:black'>荣誉称号情况：</span></p>  </td>  <td width=498 colspan=11 style='width:373.35pt;border-top:none;"
					+ "border-left:  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;  padding:0cm 1.4pt 0cm 1.4pt;height:47.55pt'>"
					+ "  <p class=MsoNormal align=left style='text-align:left;line-height:20.0pt'><span   lang=EN-US style='font-size:14.0pt;color:black'> "
					
					+ " </span></p>"
					+ "  </td> </tr> <tr style='height:37.65pt'>  <td width=199 colspan=3 style='width:149.55pt;border:solid black 1.0pt;"
					+ "  border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:37.65pt'>  <p class=MsoNormal style='line-height:20.0pt'><span style='font-size:14.0pt;"
					+ "  font-family:宋体;color:black'>参加本项目的起止时间</span></p>  </td>  <td width=498 colspan=11 style='width:373.35pt;border-top:none;"
					+ "border-left:  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;  padding:0cm 1.4pt 0cm 1.4pt;height:37.65pt'>"
					+ "  <p class=MsoNormal style='line-height:20.0pt'><span style='font-size:14.0pt;  font-family:宋体;color:black'>自  "
					
					+ "  至   "
					
					+ "  </span></p>"
					+ "  </td> </tr> <tr style='page-break-inside:avoid;height:202.1pt'>  <td width=58 style='width:43.8pt;border:solid black 1.0pt;border-top:none;"
					+ "  padding:0cm 1.4pt 0cm 1.4pt;height:202.1pt'>  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US "
					+ "  style='font-size:14.0pt;color:black'>&nbsp; </span><span style='font-size:  14.0pt;font-family:宋体;color:black'>创</span></p>"
					+ "  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US   style='font-size:14.0pt;color:black'>&nbsp;</span></p>"
					+ "  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US   style='font-size:14.0pt;color:black'>&nbsp; </span>"
					+ " <span style='font-size:  14.0pt;font-family:宋体;color:black'>造</span></p>  <p class=MsoNormal style='line-height:20.0pt'>"
					+ "<span lang=EN-US  style='font-size:14.0pt;color:black'>&nbsp;</span></p>  <p class=MsoNormal style='line-height:20.0pt'>"
					+ "<span lang=EN-US  style='font-size:14.0pt;color:black'>&nbsp; </span><span style='font-size:  14.0pt;font-family:宋体;color:black'>性</span></p>"
					+ "  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US  style='font-size:14.0pt;color:black'>&nbsp;</span></p>"
					+ "  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US  style='font-size:14.0pt;color:black'>&nbsp; </span>"
					+ "<span style='font-size:  14.0pt;font-family:宋体;color:black'>贡</span></p>  <p class=MsoNormal style='line-height:20.0pt'>"
					+ "<span lang=EN-US  style='font-size:14.0pt;color:black'>&nbsp;</span></p>  <p class=MsoNormal style='line-height:20.0pt'>"
					+ "<span lang=EN-US  style='font-size:14.0pt;color:black'>&nbsp; </span><span style='font-size:  14.0pt;font-family:宋体;color:black'>献</span></p>"
					+ "  </td>  <td width=639 colspan=13 style='width:479.1pt;border-top:none;border-left:  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;"
					+ "  padding:0cm 1.4pt 0cm 1.4pt;height:202.1pt'>  <p class=MsoNormal style='line-height:20.0pt'><span lang=EN-US  style='font-size:14.0pt;color:black'> "
					
					+ " </span></p>"
					+ "  <p class=MsoNormal style='text-indent:280.0pt;line-height:20.0pt'><span   style='font-size:14.0pt;font-family:宋体;color:black'>本人签名：</span>"
					+ "<span  lang=EN-US style='font-size:14.0pt;color:black'>_______________</span></p>  <p class=MsoNormal style='line-height:20.0pt'>"
					+ "<span lang=EN-US  style='font-size:14.0pt;color:black'>&nbsp;</span></p>  <p class=MsoNormal style='text-indent:300.0pt;line-height:20.0pt'>"
					+ "<span  style='font-size:14.0pt;font-family:宋体;color:black'>年     月    日</span></p>  </td> </tr></table></div> ";
		}
		MajorCompany mc;// 项目完成单位
		String one = ""; // 第一完成单位
		String mctr = "";
		if (mcList != null && mcList.size() > 0) {
			mc = (MajorCompany) mcList.get(0);
			one = mc.get("CompanyName");
			System.out.println("===============:"+one);
			for (int n = 0; n < mcList.size(); n++) {
				mc = (MajorCompany) mcList.get(n);
				mctr += "<tr style='page-break-inside:avoid;height:30.75pt'>";

				mctr += "<td width=43 style='width:32.45pt;border:solid windowtext 1.0pt;border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:30.75pt'>";
				mctr += "<p class=MsoNormal align=center style='text-align:center'>";
				mctr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ (n + 1) + "</span></p></td>";

				mctr += "<td width=217 style='width:163.05pt;border:solid windowtext 1.0pt;border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:30.75pt'>";
				mctr += "<p class=MsoNormal align=center style='text-align:center'>";
				mctr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ mc.getStr("CompanyName") + "</span></p></td>";

				mctr += "<td width=217 style='width:163.05pt;border:solid windowtext 1.0pt;border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:30.75pt'>";
				mctr += "<p class=MsoNormal align=center style='text-align:center'>";
				mctr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ mc.getStr("CompanyAddress")
						+ "  "
						+ mc.getStr("ZipCode") + "</span></p></td>";

				mctr += "<td width=85 style='width:63.8pt;border:solid windowtext 1.0pt;border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:30.75pt'>";
				mctr += "<p class=MsoNormal align=center style='text-align:center'>";
				mctr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ mc.getStr("LinkMan") + "</span></p></td>";

				mctr += "<td width=106 style='width:79.15pt;border:solid windowtext 1.0pt;border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:30.75pt'>";
				mctr += "<p class=MsoNormal align=center style='text-align:center'>";
				mctr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ mc.getStr("LinkPhone") + "</span></p></td>";

				mctr += "</tr>";
			}

		}

		Economies es;// 经济效益
		String estr = ""; // 表单拼接
		if (esList != null && esList.size() > 0) {
			for (int k = 0; k < esList.size(); k++) {
				es = (Economies) esList.get(k);
				estr += "<tr style='height:31.0pt'>";

				estr += "<td width=113 style='width:84.4pt;border:solid black 1.0pt;border-top:none;padding:0cm 1.4pt 0cm 1.4pt;height:31.0pt'>";
				estr += "<p class=MsoNormal align=center style='text-align:center'>";
				estr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ es.getStr("Year") + "</span></p></td>";

				estr += "<td width=143 style='width:107.6pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:31.0pt'>";
				estr += "<p class=MsoNormal align=center style='text-align:center'>";
				estr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ es.getStr("Profit") + "</span></p></td>";

				estr += "<td width=136 style='width:102.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:31.0pt'>";
				estr += "<p class=MsoNormal align=center style='text-align:center'>";
				estr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ es.getStr("Tax") + "</span></p></td>";

				estr += "<td width=128 style='width:96.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:31.0pt'>";
				estr += "<p class=MsoNormal align=center style='text-align:center'>";
				estr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ es.getStr("Tevenue") + "</span></p></td>";

				estr += "<td width=140 style='width:105.0pt;border-top:none;border-left:none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;padding:0cm 1.4pt 0cm 1.4pt;height:31.0pt'>";
				estr += "<p class=MsoNormal align=center style='text-align:center'>";
				estr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ es.getStr("Cutting") + "</span></p></td>";

				estr += " </tr>";
			}
		}

		Property py; // 知识产权
		String pytr = "";// 拼接表单
		if (pyList != null && pyList.size() > 0) {
			for (int j = 0; j < pyList.size(); j++) {
				py = (Property) pyList.get(j);
				pytr += "<tr style='height:34.0pt'>";

				pytr += "<td width=127 style='width:95.0pt;border:solid windowtext 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:34.0pt'>";
				pytr += "<p class=MsoNormal align=center style='text-align:center'>";
				pytr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ py.getStr("Categories") + "</span></p></td>";

				pytr += "<td width=104 style='width:77.95pt;border:solid windowtext 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:34.0pt'>";
				pytr += "<p class=MsoNormal align=center style='text-align:center'>";
				pytr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ py.getStr("Name") + "</span></p></td>";

				pytr += "<td width=104 style='width:77.95pt;border:solid windowtext 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:34.0pt'>";
				pytr += "<p class=MsoNormal align=center style='text-align:center'>";
				pytr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ py.getDate("ApplyDate") + "</span></p></td>";

				pytr += "<td width=104 style='width:77.95pt;border:solid windowtext 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:34.0pt'>";
				pytr += "<p class=MsoNormal align=center style='text-align:center'>";
				pytr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ py.getDate("AuthorityDate") + "</span></p></td>";

				pytr += "<td width=104 style='width:77.95pt;border:solid windowtext 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:34.0pt'>";
				pytr += "<p class=MsoNormal align=center style='text-align:center'>";
				pytr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ py.getStr("PatentNumber") + "</span></p></td>";

				pytr += "<td width=80 style='width:77.95pt;border:solid windowtext 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:34.0pt'>";
				pytr += "<p class=MsoNormal align=center style='text-align:center'>";
				pytr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ py.getStr("Obligee") + "</span></p></td>";

				pytr += "<td width=80 style='width:77.95pt;border:solid windowtext 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt;height:34.0pt'>";
				pytr += "<p class=MsoNormal align=center style='text-align:center'>";
				pytr += "<span lang=EN-US style='font-size:14.0pt;color:black'>"
						+ py.getStr("Inventor") + "</span></p></td>";

				pytr += "</tr>";
			}
		}

		Project p; // 项目基本信息
		Accessory ac;
		String lz1="";
		String yy2="";
		String kx3="";
		String js4="";
		String yy5="";
		String qt6="";
		if (ps != null && ps.size() > 0) {
			p = (Project) ps.get(0);
			if(acList!=null && acList.size()>0){
				for (int h = 0; h < acList.size(); h++) {
					ac = (Accessory) acList.get(h);
					if("主要论著的复印件".equals(ac.getStr("type"))){
						lz1 = lz1+"<p class='MsoNormal' ><span lang='EN-US' style='color:black'>"+ac.getStr("fileName")+"</span></p>";						
					}else if("被他人引用情况检索复印件".equals(ac.getStr("type"))){						
						yy2 = yy2+"<p class='MsoNormal' ><span lang='EN-US' style='color:black'>"+ac.getStr("fileName")+"</span></p>";
					}else if("科学评价证明".equals(ac.getStr("type"))){
						kx3 = kx3+"<p class='MsoNormal' ><span lang='EN-US' style='color:black'>"+ac.getStr("fileName")+"</span></p>";				
					}else if("技术评价证明(复印件)".equals(ac.getStr("type"))){
						js4= js4+"<p class='MsoNormal' ><span lang='EN-US' style='color:black'>"+ac.getStr("fileName")+"</span></p>";					
					}else if("应用证明".equals(ac.getStr("type"))){
						yy5= yy5+"<p class='MsoNormal' ><span lang='EN-US' style='color:black'>"+ac.getStr("fileName")+"</span></p>";							
					}else if("其它证明".equals(ac.getStr("type"))){
						qt6= qt6+"<p class='MsoNormal' ><span lang='EN-US' style='color:black'>"+ac.getStr("fileName")+"</span></p>";						
					}
				}
				content = content.replaceAll("proj.lz1",lz1);
				content = content.replaceAll("proj.yy2", yy2);
				content = content.replaceAll("proj.kx3", kx3);
				content = content.replaceAll("proj.js4", js4);
				content = content.replaceAll("proj.yy5", yy5);
				content = content.replaceAll("proj.qt6", qt6);
				
			}
/*			String aa ="京东方刻录机迪斯科！@#￥%……&*（）%%%@#$%^&*(OP^&*()dsfhdsg";
			String bb =p.getStr("Introduction");
		    String cc =  "fgdgd!@#&*()_)&^%$".replaceAll("\\$", "\\\\$");
			aa = aa.replaceAll("%", cc);
			Matcher.quoteReplacement(b)*/
			try {
				content = content
						.replaceAll("proj.RegisterNum", p.getInt("RegisterNum") + "")
						.replaceAll("proj.ProjectCN", p.getStr("ProjectCN") + "")
						.replaceAll("proj.MajorCompanyOne", one + "")
						.replaceAll("proj.RecommendCompany",
								p.getStr("RecommendCompany") + "")
						.replaceAll("proj.Applytime", p.getStr("Applytime") + "")
						.replaceAll("proj.Category", p.getStr("Category_name") + "")
						.replaceAll("proj.Group", p.getStr("Group_name") + "")
						.replaceAll("proj.KeyPerson", p.getStr("pkName") + "")
						.replaceAll("proj.MajorCompany", p.getStr("CompanyName") + "")
						.replaceAll(
								"proj.FromTask",
								p.getStr("sfName") + "  " + p.getStr("FromOther")
										+ "")
						.replaceAll("proj.SecretTime", p.getStr("SecretTime") + "")
						.replaceAll("proj.PlanFund", p.getStr("PlanFund") + "")
						.replaceAll("proj.StartTime", p.getDate("StartTime") + "")
						.replaceAll("proj.EndTime", p.getDate("EndTime") + "") ;  
				if(p.getStr("Introduction")==null || "".equals(p.getStr("Introduction"))){
					content = content.replaceAll("proj.Introduction","");
				}else{
					content = content.replaceAll("proj.Introduction",Matcher.quoteReplacement(p.getStr("Introduction")) + "");
				}
				if(p.getStr("Content")==null || "".equals(p.getStr("Content"))){
					content = content.replaceAll("proj.Content","");
				}else{
					content = content.replaceAll("proj.Content",Matcher.quoteReplacement(p.getStr("Content")).replaceAll("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", "&nbsp;&nbsp;").replaceAll("<blockquote>", "").replaceAll("</blockquote>", "")   + "");
				}
				if(p.getStr("Content1")==null || "".equals(p.getStr("Content1"))){
					content = content.replaceAll("proj.co","");
				}else{
					content = content.replaceAll("proj.co",Matcher.quoteReplacement(p.getStr("Content1")).replaceAll("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", "&nbsp;&nbsp;").replaceAll("<blockquote>", "").replaceAll("</blockquote>", "")   + "");
				}
				if(p.getStr("Content2")==null || "".equals(p.getStr("Content2"))){
					content = content.replaceAll("proj.ct","");
				}else{
					content = content.replaceAll("proj.ct", Matcher.quoteReplacement(p.getStr("Content2")).replaceAll("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", "&nbsp;&nbsp;").replaceAll("<blockquote>", "").replaceAll("</blockquote>", "")   + "");
				}
				if(p.getStr("Content3")==null || "".equals(p.getStr("Content3"))){
					content = content.replaceAll("proj.cs","");
				}else{
					content = content.replaceAll("proj.cs", Matcher.quoteReplacement(p.getStr("Content3")).replaceAll("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", "&nbsp;&nbsp;").replaceAll("<blockquote>", "").replaceAll("</blockquote>", "")   + "");
				}
				if(p.getStr("Content4")==null || "".equals(p.getStr("Content4"))){
					content = content.replaceAll("proj.cp","");
				}else{
					content = content.replaceAll("proj.cp", Matcher.quoteReplacement(p.getStr("Content4")+"").replaceAll("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;", "&nbsp;&nbsp;").replaceAll("<blockquote>", "").replaceAll("</blockquote>", "")   + "");
				}
				if(p.getStr("AppSituation")==null || "".equals(p.getStr("AppSituation"))){
					content = content.replaceAll("proj.AppSituation","");
				}else{
					content = content.replaceAll("proj.AppSituation", Matcher.quoteReplacement(p.getStr("AppSituation")) + "");
				}
							
				content = content.replaceAll("proj.TotalFund", p.getStr("TotalFund") + "")
						.replaceAll("proj.Calculations",p.getStr("Calculations") + "")
						.replaceAll("proj.Payback", p.getStr("Payback") + "")	
					    .replaceAll("proj.Social", p.getStr("Social") + "")
						.replaceAll("proj.jjyy", estr) // 经济效益列表
						.replaceAll("proj.zscq", pytr) // 知识产权表
						.replaceAll("proj.zjwcdw", mctr) // 主要完成单位				
						.replaceAll("proj.wcry", kptr) // 主要完成人员
						.replaceAll("proj.lz1","")
						.replaceAll("proj.yy2","")
						.replaceAll("proj.kx3","")
						.replaceAll("proj.js4","")
						.replaceAll("proj.yy5","")
						.replaceAll("proj.qt6","")
						.replaceAll("null", "");
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		
		}
		return content;
	}

	/**
	 * 批量导出
	 */
	public void bacthExp() {
		try {
			String ids = getPara("ids");
			int change = getParaToInt("project.Change", 0);
			// Project.me.bacthExp(change,ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	// 下载项目基本情况 保存到wrod
	public void projectOut() throws Exception {

	}

}
