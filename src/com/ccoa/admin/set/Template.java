package com.ccoa.admin.set;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/*
 * 对应像版管理表 模板管理（template）
 * 
 */

@SuppressWarnings("serial")
public class Template extends Model<Template> {
	public static final Template me = new Template();

	/**
	 * 查询
	 */
	public Page<Template> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from set_template order by id desc");
	}

	// 删除
	public int deleteByIds(String ids) {
		return Db
				.update("delete from set_template where id in ( " + ids + " )");
	}

}
