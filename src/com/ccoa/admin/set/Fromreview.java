package com.ccoa.admin.set;

import java.util.List;

import com.ccoa.project.Economies;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Fromreview extends Model<Fromreview> {
	public static final Fromreview me = new Fromreview();

	/**
	 * 查询
	 */
	public Page<Fromreview> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from set_fromreview order by id desc");
	}

	/**
	 * 根据项目ID查询 形式 审查列表
	 */
	public List<Fromreview> selectFRbyId(long ProjectID, long AdminID) {
		return find("select * from set_fromreview where ProjectID=" + ProjectID
				+ " and AdminID=" + AdminID + " order by id asc");
	}
}
