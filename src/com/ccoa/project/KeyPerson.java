package com.ccoa.project;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class KeyPerson extends Model<KeyPerson> {
	public static final KeyPerson me = new KeyPerson();

	/**
	 * 查询
	 */
	public Page<KeyPerson> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from blog order by id asc");
	}

	/**
	 * 查询 根据项目ID查询主要完成人员列表
	 */
	public Page<KeyPerson> selectKPbyId(int pageNumber, int pageSize,
			long ProjectID) {
		return paginate(pageNumber, pageSize, "select *",
				"from project_key_person where ProjectID=" + ProjectID
						+ " order by Sort asc");
	}
	/**
	 * 查询 根据项目ID查询最大Sort主要完成人员
	 */
	public KeyPerson findMaxSortKPbyId(long ProjectID) {
		return super.findFirst("select * from project_key_person where ProjectID=" + ProjectID + " order by Sort desc");
	}
	
	/**
	 * 查询 根据项目ID和Sort查询比Sort小的最大Sort主要完成人员
	 */
	public KeyPerson findSortKPbyIdAndSort(long ProjectID,int Sort) {
		return super.findFirst("select * from project_key_person where ProjectID=" + ProjectID + " and Sort<"+Sort+" order by Sort desc");
	}

	/**
	 * 查询 根据ID 删除完成人员
	 */
	public int KPdel(String ids) {
		String sql = "delete  from project_key_person where id in (" + ids
				+ ")";

		return Db.update(sql);
	}
	
	// 统计已存在完成人员多少
	public Long countKeyPerson(int ProjectID) {
		String sql = "select count(*)  from project_key_person where  ProjectID=?";
		return Db.queryLong(sql, ProjectID);
	}
}
