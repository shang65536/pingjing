package com.ccoa.project;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * 主要完成单位
 */

@SuppressWarnings("serial")
public class MajorCompany extends Model<MajorCompany> {
	public static final MajorCompany me = new MajorCompany();

	/**
	 * 查询 根据项目ID查询主要完成单位列表
	 */
	public Page<MajorCompany> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from project_major_company  order by id asc");
	}

	/**
	 * 查询 根据项目ID查询主要完成单位列表
	 */
	public Page<MajorCompany> selectMCbyId(int pageNumber, int pageSize,
			long ProjectID) {
		return paginate(pageNumber, pageSize, "select *",
				"from project_major_company where ProjectID=" + ProjectID
						+ " order by Sort asc");
	}
	
	/**
	 * 查询 根据项目ID和Sort查询比Sort小的最大Sort主要完成人员
	 */
	public MajorCompany findSortKPbyIdAndSort(long ProjectID,int Sort) {
		return super.findFirst("select * from project_major_company where ProjectID=" + ProjectID + " and Sort<"+Sort+" order by Sort desc");
	}
	/**
	 * 查询 根据项目ID查询最大Sort主要完成人员
	 */
	public MajorCompany findMaxSortKPbyId(long ProjectID) {
		return super.findFirst("select * from project_major_company where ProjectID=" + ProjectID + " order by Sort desc");
	}
	

	/**
	 * 查询 根据ID 删除完成单位
	 */
	public int PMCdel(String ids) {
		String sql = "delete  from project_major_company where id in (" + ids
				+ ")";

		return Db.update(sql);
	}
	
	// 统计已存在完成单位多少
	public Long countMajor(int ProjectID) {
		String sql = "select count(*)  from project_major_company where  ProjectID=?";
		return Db.queryLong(sql, ProjectID);
	}

}
