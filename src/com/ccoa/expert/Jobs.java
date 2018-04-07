package com.ccoa.expert;

import java.util.List;

import com.ccoa.admin.set.Category;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;


@SuppressWarnings("serial")
public class Jobs extends Model<Jobs> {
	public static final Jobs me = new Jobs();
	
	/**
	 * 查询
	 */
	public Page<Jobs> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from expert_jobs order by id asc");
	}

	public List<Jobs> findbyids(int id){
		return find("SELECT * FROM expert_jobs  WHERE ExpertID =? ",id);
	}
	public Page<Jobs> paginateSetZjkGL(int pageNumber, int pageSize,int id) {
		StringBuffer sql = new StringBuffer(" from expert e LEFT JOIN expert_jobs j on  e.id=j.ExpertID  where 1=1");
		sql.append(" and j.ExpertID ="+id);
		sql.append(" order by e.id desc ");
		return super.paginate(pageNumber, pageSize, "select * ", sql.toString());
	}
}
