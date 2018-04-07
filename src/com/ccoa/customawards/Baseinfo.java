package com.ccoa.customawards;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ccoa.admin.set.GroupExpert;
import com.ccoa.admin.set.WinningList;
import com.ccoa.project.CommonModel;
import com.ccoa.project.Project;
import com.ccoa.projectreview.ProjectReviewZH;
import com.ccoa.utils.StringUtils;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@SuppressWarnings("serial")
public class Baseinfo extends Model<Baseinfo> {
	public static final Baseinfo me = new Baseinfo();

	// 删除
	public int deleteByIdAndRS(String id, String releaseStatus) {
		return Db.update("delete from ca_baseinfo where id ='" + id
				+ "' and ReleaseStatus!=" + releaseStatus);
	}

	/**
	 * 获取最底的年份
	 * 
	 * @return
	 */
	public int[] years(int max_year) {

		Baseinfo Baseinfo = findFirst("select min(Year) as year from ca_baseinfo");

		int min_year = Baseinfo == null ? 0
				: (Baseinfo.getStr("Year") == null || "" == Baseinfo
						.getStr("Year")) ? 0 : Integer.parseInt(Baseinfo
						.getStr("Year"));
		int length = min_year == 0 ? 1 : max_year - min_year + 1;
		int[] years = new int[length];
		for (int i = max_year, j = 0; i > (max_year - length); i--, j++) {
			years[j] = i;
		}
		return years;
	}

	/**
	 * 根据名称查询
	 */
	public List<Baseinfo> findByName(String name,String year) {
		return find("select * from ca_Baseinfo where  Name='" + name + "' and Year="+year);
	}

	/**
	 * 查询申报平台 自定义申报列表,该用户未申报的自定义奖项
	 */
	public Page<Baseinfo> findNoDeclaration(int pageNumber, int pageSize,
			int declareID, Map params) {
		String sql = "select b.* ";
		StringBuffer sqlStr = new StringBuffer();
		sqlStr.append(" from ca_baseinfo b where b.ReleaseStatus=2 ");

		// 名称
		if (null != params.get("Name") && !"".equals(params.get("Name"))
				&& !"null".equals(params.get("Name"))) {

			sqlStr.append(" and b.Name like '%" + params.get("Name") + "%' ");
		}
		// 年份
		if (null != params.get("Year") && !"".equals(params.get("Year"))
				&& !"null".equals(params.get("Year"))) {
			sqlStr.append(" and b.Year = " + params.get("Year") + " ");
		}
		sqlStr.append(" and b.id not in(select d.BaseinfoID from ca_declaration d where d.DeclareID="
				+ declareID + ")");
		sqlStr.append(" order by b.Year , b.CreateTime desc");
		return paginate(pageNumber, pageSize, sql, sqlStr.toString());
	}

	// 验证项目登记号是否重复
	public Long RegisterSub(int RegisterNum) {
		String sql = "select count(id)  from project where  RegisterNum=?";

		return Db.queryLong(sql, RegisterNum);
	}

	// 项目形式审查表查询
	public Page<Baseinfo> baseinfoReviewPage(int pageNumber, int pageSize,
			Map params) {
		String sql = "select * ";
		StringBuffer sqlStr = new StringBuffer();
		sqlStr.append(" from ca_baseinfo b  where 1=1  ");

		// 名称
		if (null != params.get("Name") && !"".equals(params.get("Name"))
				&& !"null".equals(params.get("Name"))) {

			sqlStr.append(" and b.Name like '%" + params.get("Name") + "%' ");
		}
		// 年份
		if (null != params.get("Year") && !"".equals(params.get("Year"))
				&& !"null".equals(params.get("Year"))) {
			sqlStr.append(" and b.Year = " + params.get("Year") + " ");
		}
		// 发布状态
		if (null != params.get("ReleaseStatus")
				&& !"".equals(params.get("ReleaseStatus"))
				&& !"null".equals(params.get("ReleaseStatus"))) {
			sqlStr.append(" and b.ReleaseStatus = "
					+ params.get("ReleaseStatus") + " ");
		}
		sqlStr.append(" order by b.Year , b.CreateTime desc");
		return paginate(pageNumber, pageSize, sql, sqlStr.toString());
	}
	//查询已发布到首页数据
	public Page<Baseinfo> paginate(int pageNumber, int pageSize) {
		return paginate(
				pageNumber,
				pageSize,
				"select *",
				" from ca_baseinfo where ReviewResultFile is not null and ReviewResultFilePath is not null order by 'Year',CreateTime desc ");
	}

}
