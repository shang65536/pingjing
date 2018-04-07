package com.ccoa.expert;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Results extends Model<Results> {
	public static final Results me = new Results();

	/**
	 * 查询
	 */
	public Page<Results> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from expert_results order by id asc");
	}

	public List<Results> findbyids(int id) {
		return find("SELECT * FROM expert_results WHERE ExpertID =? ", id);
	}

	public Page<Results> paginateSetZjkGL(int pageNumber, int pageSize, int id) {
		StringBuffer sql = new StringBuffer(
				" from expert e  LEFT JOIN expert_results r on e.id=r.ExpertID  where 1=1 ");
		sql.append(" and r.ExpertID=" + id);
		sql.append(" order by e.id desc ");
		return super
				.paginate(pageNumber, pageSize, "select * ", sql.toString());
	}
}
