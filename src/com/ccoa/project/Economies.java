package com.ccoa.project;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Economies extends Model<Economies> {
	public static final Economies me = new Economies();

	/**
	 * 查询
	 */
	public Page<Economies> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from blog order by id asc");
	}

	/**
	 * 查询 根据项目ID查询 经济效益列表
	 */
	public Page<Economies> selectEconmiesbyId(int pageNumber, int pageSize,
			long ProjectID) {
		return paginate(pageNumber, pageSize, "select *",
				"from project_economies where ProjectID=" + ProjectID
						+ " order by id asc");
	}

	/**
	 * 查询 根据ID 删除经济效益列表
	 */
	public int Econmiesdel(String ids) {
		String sql = "delete  from project_economies where id in (" + ids + ")";

		return Db.update(sql);
	}
}
