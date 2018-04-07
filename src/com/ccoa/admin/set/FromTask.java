package com.ccoa.admin.set;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class FromTask extends Model<FromTask> {
	public static final FromTask me = new FromTask();

	/**
	 * 查询
	 */
	public Page<FromTask> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from blog order by id asc");
	}

	// 查询所有
	public List<FromTask> findAll() {
		return find("select * from set_fromtask where Status =1 order by id asc");
	}

	// 根据 多个ID查询列表
	public List<FromTask> selectName(String ids) {
		return find("select Name from set_fromtask where Status =1 and id in ("
				+ ids + ")");
	}
}
