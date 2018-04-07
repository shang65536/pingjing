package com.ccoa.expert;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;


@SuppressWarnings("serial")
public class Writings extends Model<Writings> {
	public static final Writings me = new Writings();
	
	/**
	 * 查询
	 */
	public Page<Writings> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from expert_writings order by id asc");
	}
	public List<Writings> findbyids(int id){
		return find("SELECT * FROM expert_writings  where ExpertID=? ",id);
	}
	public Page<Writings> paginateSetZjkGL(int pageNumber, int pageSize,int id) {
		StringBuffer sql = new StringBuffer(" from expert e LEFT JOIN expert_writings s on e.id=s.ExpertID where 1=1 ");
		sql.append(" and s.ExpertID ="+id);
		sql.append(" order by e.id desc ");
		return super.paginate(pageNumber, pageSize, "select * ", sql.toString());
	}
}
