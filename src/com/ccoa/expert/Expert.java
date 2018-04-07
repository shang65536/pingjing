package com.ccoa.expert;

import java.util.List;
import java.util.Map;

import com.ccoa.project.Project;
import com.ccoa.utils.StringUtils;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Expert extends Model<Expert> {
	public static final Expert me = new Expert();

	/**
	 * 帐号管理查询方法
	 */
	public Page<Expert> paginateopen(int pageNumber, int pageSize, Map params) {
		String sql = "from expert ";
		sql = sql+ "where 1=1  ";
		StringBuffer sqlStr = new StringBuffer();
		if (null != params.get("UserName")&& !"".equals(params.get("UserName"))&& !"null".equals(params.get("UserName"))) {
				sqlStr.append(" and UserName like '%" + params.get("UserName")
							+ "%' ");
		}
		if (null != params.get("Job")&& !"".equals(params.get("Job"))&& !"null".equals(params.get("Job"))) {
			sqlStr.append(" and Job like '%" + params.get("Job")
						+ "%' ");
	    }
		if (null != params.get("Name")&& !"".equals(params.get("Name"))&& !"null".equals(params.get("Name"))) {
			sqlStr.append(" and Name like '%" + params.get("Name")
						+ "%' ");
	    }
		
		sqlStr.append(" order by id desc");
		return super.paginate(pageNumber, pageSize, "select *", sql+sqlStr.toString());
		
	}
	
	
	/**
	 * 专家评审添加人员查询
	 */
	public Page<Expert> paginatExpert(int pageNumber, int pageSize, Map params) {
		String sql = "from expert e ";	
		sql = sql+ "  where 1=1  ";
		StringBuffer sqlStr = new StringBuffer();
		if (null != params.get("ChapterName")&& !"".equals(params.get("ChapterName"))&& !"null".equals(params.get("ChapterName"))) {
			sqlStr.append(" and e.ChapterID like '%" + params.get("ChapterName")
						+ "%' ");
	   }		
		if (null != params.get("UserName")&& !"".equals(params.get("UserName"))&& !"null".equals(params.get("UserName"))) {
				sqlStr.append(" and e.UserName like '%" + params.get("UserName")
							+ "%' ");
		}
		if (null != params.get("Job")&& !"".equals(params.get("Job"))&& !"null".equals(params.get("Job"))) {
			sqlStr.append(" and e.Job like '%" + params.get("Job")
						+ "%' ");
	    }
		if (null != params.get("Name")&& !"".equals(params.get("Name"))&& !"null".equals(params.get("Name"))) {
			sqlStr.append(" and e.Name like '%" + params.get("Name")
						+ "%' ");
	    }		
		sqlStr.append(" order by id desc");
		return super.paginate(pageNumber, pageSize, "select e.*", sql+sqlStr.toString());
		
	}
	
	/*	public Page<Expert> paginate(int pageNumber, int pageSize, String userName,
			String job, String name, String Learn,String Working) {
		StringBuffer sql = new StringBuffer(" from expert where 1=1 ");
		if (StringUtils.isNotEmpty(userName)) {
			sql.append(" and Username like '%");
			sql.append(userName);
			sql.append("%'");
		}
		if (StringUtils.isNotEmpty(job)) {
			sql.append(" and Job like '%");
			sql.append(job);
			sql.append("%'");
		}
		if (StringUtils.isNotEmpty(name)) {
			sql.append(" and name like '%");
			sql.append(name);
			sql.append("%'");
		}
		if (StringUtils.isNotEmpty(Learn)) {
			sql.append(" and Learn like '%");
			sql.append(Learn);
			sql.append("%'");
		}
		if (StringUtils.isNotEmpty(Working)) {
			sql.append(" and Working like '%");
			sql.append(Working);
			sql.append("%'");
		}
		sql.append(" order by id desc ");
		return super.paginate(pageNumber, pageSize, "select *", sql.toString());
	}*/

	/**
	 * 专家设置查询方法
	 */
	public Page<Expert> paginateSet(int pageNumber, int pageSize, String name,
			String chapterName, String job) {
		StringBuffer sql = new StringBuffer(" from expert e ");		
		sql.append(" where 1=1 ");
		
		if (StringUtils.isNotEmpty(chapterName)) {
			sql.append(" and e.ChapterID like '%"
					+ chapterName + "%' ");
		}
		if (StringUtils.isNotEmpty(job)) {
			sql.append(" and e.Job like '%");
			sql.append(job);
			sql.append("%'");
		}
		if (StringUtils.isNotEmpty(name)) {
			sql.append(" and e.Name like '%");
			sql.append(name);
			sql.append("%'");
		}
		sql.append(" order by id desc ");
		return super
				.paginate(
						pageNumber,
						pageSize,
						"select e.id,e.Name,e.Identity,e.Job,e.Change,e.ChapterID AS ChapterName ",
						sql.toString());
	}

	/**
	 * 专家库查询方法
	 * 
	 * @param pageNumber
	 * @param pageSize
	 * @param name
	 * @param chapterName
	 * @param job
	 * @param Learn
	 * @param Working
	 * @return
	 */
	public Page<Expert> paginateSetZjk(int pageNumber, int pageSize,
			String name, String chapterName, String job, String Learn,
			String Working,String TechTitle) {
		StringBuffer sql = new StringBuffer(
				" from expert e where 1=1");

		if (StringUtils.isNotEmpty(chapterName)) {
			sql.append(" and e.ChapterID like '%");
			sql.append(chapterName);
			sql.append("%'");
		}
		if (StringUtils.isNotEmpty(job)) {
			sql.append(" and e.Job like '%");
			sql.append(job);
			sql.append("%'");
		}
		if (StringUtils.isNotEmpty(name)) {
			sql.append(" and e.Name like '%");
			sql.append(name);
			sql.append("%'");
		}
		if (StringUtils.isNotEmpty(Learn)) {
			sql.append(" and e.Learn like '%");
			sql.append(Learn);
			sql.append("%'");
		}
		if (StringUtils.isNotEmpty(Working)) {
			sql.append(" and e.Working like '%");
			sql.append(Working);
			sql.append("%'");
		}
		if (StringUtils.isNotEmpty(TechTitle)) {
			sql.append(" and e.TechTitle like '%");
			sql.append(TechTitle);
			sql.append("%'");
		}
		sql.append(" order by id desc ");
		return super
				.paginate(
						pageNumber,
						pageSize,
						"select e.id,e.beizhu,e.Name,e.Degree,e.Learn,e.Working,e.TechTitle,e.Moblie,e.Email,e.Identity,e.Job,e.Change,e.ChapterID AS ChapterName,e.UserName,e.Password ",
						sql.toString());
	}

	/**
	 * 关联查询
	 * 
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public Page<Expert> paginateSetZjkGL(int pageNumber, int pageSize, int id) {
		StringBuffer sql = new StringBuffer(
				" from expert e LEFT JOIN expert_jobs j on  e.id=j.ExpertID LEFT JOIN expert_results r on e.id=r.ExpertID LEFT JOIN expert_winners w  on e.id=w.ExpertID LEFT JOIN expert_writings s on e.id=s.ExpertID  WHERE 1=1 ");
		sql.append(" and e.id =" + id);
		sql.append(" order by e.id desc ");
		return super
				.paginate(pageNumber, pageSize, "select * ", sql.toString());
	}

	// 根据用户名，密码登录
	public Expert login(String username, String password) {
		return super.findFirst(
				"select * from expert where username = ? and Password = ?",
				username, password);
	}
	
	// 根据用户名，邮箱验证
		public Expert newpassword(String username, String Email) {
			return super.findFirst(
					"select * from expert where username = ? and Email = ?",
					username, Email);
		}

	public List<Expert> findbyids(int id) {
		return find("select * from  expert e left join set_chapter sc on e.ChapterID = e.id  left join expert_jobs j on j.ExpertID = e.id left join expert_results   r on r.ExpertID = e.id left join expert_winners   s on s.ExpertID = e.id left join expert_writings  w on w.ExpertID = e.id WHERE 1=1 and e.id="
				+ id + " ");
	}

	// 删除
	public int deleteByIds(String ids) {
		return Db.update("delete from expert where id in ( " + ids + " )");
	}

	/**
	 * status 操作：0不允许、1允许
	 * 
	 * @param status
	 * @param id
	 * @return
	 */
	public int operate(int change, int id) {
		return Db.update(" update expert t set t.Change = ? where t.id = ? ",
				change, id);
	}

	/**
	 * status 操作：0不允许、1允许
	 * 
	 * @param status
	 * @param id
	 * @return
	 */
	public int bacthOperate(int change, String ids) {
		return Db.update(" update expert t set t.Change = " + change
				+ " where t.id in ( " + ids + ")");
	}

	// 验证用户名是否存在
	public long checkName(String Username) {
		return Db.queryLong("select count(1) from expert where UserName=?",
				Username);
	}

	public List<Expert> isExist(String UserName) {
		return Db.query("select id  from  expert where  UserName=? limit 1 ",
				UserName);
	}
	
	public List<Expert> findbyBaseinfoID(String  BaseinfoID) {
		return find("select e.* from expert e where e.id in (select eg.expert_id from set_expertgroup eg  where eg.group_id in(select id from set_group g where g.BaseinfoID='"+BaseinfoID+"'))");
	}
}
