package com.ccoa.admin.set;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Category extends Model<Category> {
	public static final Category me = new Category();

	/**
	 * 查询
	 */
	public Page<Category> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from set_category order by id desc");
	}

	public List<Category> findAll() {
		return find("select * from set_category where Status =1 order by id asc");
	}

	/**
	 * status 操作：0无效、1有效
	 * 
	 * @param status
	 * @param id
	 * @return
	 */
	public int operate(int status, int id) {
		return Db.update(" update set_category set Status = ? where id = ?",
				status, id);
	}

	// 删除
	public int deleteByIds(String ids) {
		return Db
				.update("delete from set_category where id in ( " + ids + " )");
	}

	// 验证评奖类别是否重复
	public Long checkName(String Name) {
		return Db.queryLong(
				"select count(id) from set_category where  Name=?  ", Name);
	}
}
