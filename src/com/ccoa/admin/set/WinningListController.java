package com.ccoa.admin.set;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import jxl.Sheet;
import jxl.Workbook;

import org.apache.log4j.Logger;

import com.ccoa.admin.Admin;
import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.ccoa.project.Project;
import com.ccoa.utils.StringUtils;
import com.jfinal.aop.Before;
import com.jfinal.ext.render.excel.PoiRender;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;

/**
 * 获奖名单管理
 * 
 */
@Before(AdminUserInterceptor.class)
public class WinningListController extends BaseController {

	private static Logger log = Logger.getLogger(WinningListController.class);

	public void index() {

		Calendar c = Calendar.getInstance();
		// 转换日期格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
		String winYear = sdf.format(c.getTime()); // 获取当前年份

		if (getPara("winYear") != null) {
			winYear = getPara("winYear");
		}

		List winningList = WinningList.me.findAllList(winYear);

		setAttr("winYear", winYear);
		setAttr("winningList", winningList);

		render("winningList.html");
	}

	// 查看具体获奖项目列表
	public void projectList() {

		List winningproject = WinningList.me
				.findAllProjectList(getParaToInt("parentID"));
		WinningList winning = new WinningList();
		if (winningproject.size() > 0) {
			winning = (WinningList) winningproject.get(0);
		}

		setAttr("winningproject", winningproject);
		setAttr("PwinName", winning.get("PwinName"));
		setAttr("winYear", getPara("winYear"));
		setAttr("parentID", getParaToInt("parentID"));
		render("winningProjectList.html");
	}

	// 导出具体项目列表
	public void exportExcel() {
		List winningproject = WinningList.me
				.findAllProjectList(getParaToInt("parentID"));
		for (int i = 0; i < winningproject.size(); i++) {
			WinningList map = (WinningList) winningproject.get(i);
			map.put("id", i + 1);
		}
		String[] columns = new String[] { "id", "registerNum", "projectCN",
				"majorCompany", "keyPerson", "recommendCompany", "winning" };
		String[] heades = new String[] { "序号", "登记号", "项目名称", "主要完成单位",
				"主要完成人", "推荐单位", "获奖奖项" };
		render(PoiRender.me(winningproject).fileName("winning.xls")
				.sheetName("获奖项目列表").headers(heades).columns(columns)
				.cellWidth(5000).headerRow(2));
	}

	// 发布
	public void egstatus() {
		try {
			WinningList.me.setStatus(getPara("ids"));
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	/**
	 * 新增获奖名单描述
	 */
	public void save() {
		try {
			String cur_year = new SimpleDateFormat("yyyy").format(new Date());
			// 先插入父获奖名单说明
			WinningList wl = new WinningList();
			wl.set("winYear", cur_year); // 默认当前年份
			wl.set("type", "1"); // 默认父内容 表示获奖名单描述
			wl.set("status", "0"); // 默认未发布
			wl.set("winName", getPara("winName"));
			wl.save();
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	/**
	 * 查询指定目录中电子表格中所有的数据 导入到数据库
	 * 
	 * @param file
	 *            文件完整路径
	 * @return
	 */
	public void importWinning() {
		String success = ""; // 提示用的
		// 先把文件上传
		UploadFile file = getFile("winningExcel", PathKit.getWebRootPath()
				+ "/upload/import", 50 * 1024 * 1024, "utf-8"); // 后期需要定期清理该文件
		try {
			Workbook rwb = Workbook.getWorkbook(new FileInputStream(file
					.getFile().getPath())); // 再读取
			Sheet rs = rwb.getSheet(0);// 或者rwb.getSheet(0)
			int clos = rs.getColumns();// 得到所有的列
			int rows = rs.getRows();// 得到所有的行

			WinningList winning;

			// System.out.println(clos+" rows:"+rows);
			for (int i = 1; i < rows; i++) {
				winning = new WinningList();
				for (int j = 0; j < clos; j++) {
					// 第一个是列数，第二个是行数
					winning.set("registerNum", rs.getCell(j++, i).getContents());// 默认最左边编号也算一列
																					// 所以这里得j++
					winning.set("projectCN", rs.getCell(j++, i).getContents());
					winning.set("majorCompany", rs.getCell(j++, i)
							.getContents());
					winning.set("keyPerson", rs.getCell(j++, i).getContents());
					winning.set("recommendCompany", rs.getCell(j++, i)
							.getContents());
					winning.set("winning", rs.getCell(j++, i).getContents());
					winning.set("parentID", getParaToInt("parentID"));
					winning.set("type", "2"); // 表示子内容
				}

				// 如果导入的文件中 登记号为空 就不验证 是否新增修改 直接新增
				if (StringUtils.isNotEmpty(winning.get("registerNum"))) {
					List ids = WinningList.me.isExist(getParaToInt("parentID"),
							Integer.parseInt(winning.get("registerNum")
									.toString()));
					// 再根据取到的Excel中的登记号 查询该内容是否存在 如果存在就修改 不存在就新增
					if (ids.size() > 0)// 表示存在
					{

						winning.set("id", ids.get(0)); // 根据查出来的ID进行修改
						winning.update();
					} else// 表示新增
					{
						winning.save();
					}
				} else // 登记号为空 提示 不允许导入
				{
					success += "\n第" + i + "行的登记号为空;<br/>";
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
		setAttr("parentID", getParaToInt("parentID"));
		setAttr("winYear", getPara("winYear"));
		setAttr("success", success); // 提示
		render("ts.html");
	}

	public void delete() {
		try {
			String ids = getPara("ids");
			Template.me.deleteByIds(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}
}
