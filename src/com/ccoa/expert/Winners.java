package com.ccoa.expert;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;


@SuppressWarnings("serial")
public class Winners extends Model<Winners> {
	public static final Winners me = new Winners();
	
	/**
	 * 查询
	 */
	public Page<Winners> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from expert_winners order by id asc");
	}
	public List<Winners> findbyids(int id){
		return find(" SELECT * FROM  expert_winners  where ExpertID =? ",id);
	}
	public Page<Winners> paginateSetZjkGL(int pageNumber, int pageSize,int id) {
		StringBuffer sql = new StringBuffer(" from expert e   LEFT JOIN expert_winners w  on e.id=w.ExpertID  where 1=1 ");
		sql.append(" and w.ExpertID ="+id);
		sql.append(" order by e.id desc ");
		return super.paginate(pageNumber, pageSize, "select * ", sql.toString());
	}
}
