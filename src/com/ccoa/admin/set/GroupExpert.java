package com.ccoa.admin.set;

import java.util.List;
import java.util.Map;

import com.ccoa.project.Project;
import com.ccoa.utils.StringUtils;
import com.itextpdf.text.pdf.PdfStructTreeController.returnType;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * 专家组 专家管理 2015.06.01 xdf 
 */

@SuppressWarnings("serial")
public class GroupExpert extends Model<GroupExpert> {
	public static final GroupExpert me = new GroupExpert();
	
	/**
	 * 查询  根据 专家组Id  查询 专家成员信息 
	 */
	public List<GroupExpert> paginate(int gId) {
		
		String sqlStart = "select eg.id,e.Name,e.Sex,e.Job,e.TechTitle,e.Working,e.Phone,e.Email,eg.expert_id," +
				"(case when eg.status='1' then '主任委员' when eg.status='2' then '副主任委员' when eg.status='3' then '委员' else '' end ) as bj ";
		
		StringBuffer sql = new StringBuffer(" from set_expertgroup eg JOIN expert e on eg.expert_id=e.id  ");
				     sql.append(" where eg.group_id=? order by eg.id asc ");
		
		return find(sqlStart+sql.toString(),gId);
	}
	
	/**
	 * 
	 * @param expertId 专家ID
	 * @return List<GroupExpert>
	 */
	public Long  findGroupExpertsByExpertId(String expertId){
		String sqlString ="select count(*) from set_expertgroup where expert_id  in ( " + expertId + " )";
		return Db.queryLong(sqlString);
		
	}
	
	
    
    //删除
    public int deleteByIds(String ids) {
    	return Db.update("delete from set_expertgroup where id in ( " + ids + " )");
    }
    
    //根据专家组编号  清空 专家组所有成员 
    public int deleteByGId(int id) {
    	return Db.update("delete from set_expertgroup where group_id ="+id);
    }
    
    //批量打标记 
    public int egstatus(int status,String ids)
    {
    	return Db.update("update set_expertgroup set status=? where id in ("+ids+") ",status);
    }
    
    //验证专家 在同一个组中是否重复
    public Long selectGroupExpert(int group_id,int expert_id)
    {
    	return Db.queryLong("select count(id) from set_expertgroup where  group_id=? and expert_id=?", group_id,expert_id);
    }
    
	public Long  findCountByGroupId(int GroupId){
		String sqlString ="	select count(*) from set_expertgroup eg JOIN expert e on eg.expert_id=e.id where eg.group_id="+GroupId;
		return Db.queryLong(sqlString);		
	}
	
	// 根据专家组查询
	public List<GroupExpert> findByID(String ids) {
		return find("select * from set_expertgroup ep where ep.id in (" + ids + ")");
	}
}
