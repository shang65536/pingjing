package com.ccoa.admin.set;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class ProjectGroup extends Model<ProjectGroup> {
	public static final ProjectGroup me = new ProjectGroup();

	/**
	 * 查询
	 */
	public Page<ProjectGroup> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from project_group order by id desc");
	}

	// 查询所有有效数据
	public List<ProjectGroup> findAll() {
		return find("select * from project_group where Status =1 order by id asc");
	}

	/**
	 * status 操作：0无效、1有效
	 * 
	 * @param status
	 * @param id
	 * @return
	 */
	public int operate(int status, int id) {
		return Db.update(" update project_group set Status = ? where id = ?",
				status, id);
	}

	// 删除
	public int deleteByIds(String ids) {
		return Db.update("delete from project_group where id in ( " + ids
				+ " )");
	}

	// 验证组名是否重复
	public Long checkName(String Name) {
		return Db.queryLong(
				"select count(id) from project_group where  Name=?  ", Name);
	}

}
