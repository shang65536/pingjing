package com.ccoa.admin.set;


import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Chapter extends Model<Chapter> {
	public static final Chapter me = new Chapter();

	/**
	 * 查询
	 */
	public Page<Chapter> paginateopen(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select * ","from set_chapter order by id asc");

	}
	
	public Page<Chapter> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select * ","from set_chapter where  Status =1 order by id asc");

	}
	
	// 查询所有有效数据
	public List<Chapter> findAll() {
		return find("select * from set_chapter where  Status =1 order by id desc ");
	}

	/**
	 * status 操作：0无效、1有效
	 * 
	 * @param status
	 * @param id
	 * @return
	 */
	public int operate(int status, int id) {
		return Db.update(" update set_chapter set Status = ? where id = ?",
				status, id);
	}

	// 删除
	public int deleteByIds(String ids) {
		return Db.update("delete from set_chapter where id in ( " + ids + " )");
	}

	// 验证是否重复
	public Long checkName(String Name) {
		return Db.queryLong(
				"select count(id) from set_chapter where  Name=?  ", Name);
	}
	// 验证是否重复
	public Long checkLearn(String Learn) {
			return Db.queryLong(
					"select count(id) from set_chapter where  Learn=?  ", Learn);
		}
	// 查询所有有效数据
	public List<Chapter> findByName(String name ) {		
		 return find("select * from set_chapter where  Status =1 and Name ='"+name+"' order by id desc ");	
			
	}
}
