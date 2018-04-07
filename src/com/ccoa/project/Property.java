package com.ccoa.project;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Property extends Model<Property> {
	public static final Property me = new Property();

	/**
	 * 查询
	 */
	public Page<Property> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from blog order by id asc");
	}

	/**
	 * 查询 根据项目ID查询 知识产权表
	 */
	public Page<Property> selectPtbyId(int pageNumber, int pageSize,
			long ProjectID) {
		return paginate(pageNumber, pageSize, "select *",
				"from project_property where ProjectID=" + ProjectID
						+ " order by id asc");
	}

	/**
	 * 查询 根据ID 删除知识产权列表
	 */
	public int Ptdel(String ids) {
		String sql = "delete  from project_property where id in (" + ids + ")";

		return Db.update(sql);
	}
}
