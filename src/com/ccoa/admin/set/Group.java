package com.ccoa.admin.set;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Group extends Model<Group> {
	public static final Group me = new Group();

	/**
	 * 查询
	 */
	public Page<Group> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from set_group order by id desc");
	}

	// 查询所有有效数据
	public List<Group> findAll() {
		return find("select * from set_group where Status =1 order by id asc");
	}

	/**
	 * status 操作：0无效、1有效
	 * 
	 * @param status
	 * @param id
	 * @return
	 */
	public int operate(int status, int id) {
		return Db.update(" update set_group set Status = ? where id = ?",
				status, id);
	}

	// 删除
	public int deleteByIds(String ids) {
		return Db.update("delete from set_group where id in ( " + ids + " )");
	}

	/**
	 * 查询
	 * 
	 * @param group
	 * @return
	 */
	public List<Group> findList(Group group) {

		String sql = "select g.id,g.name,g.group_year from set_group g where g.Status = 1";
		if (group != null && group.getStr("Group_Year") != null
				&& !"".equals(group.getStr("Group_Year"))) {
			sql += " and g.Group_Year = '" + group.getStr("Group_Year") + "'";
		}
		if (group != null && group.getStr("Type") != null
				&& !"".equals(group.getStr("Type"))) {
			sql += " and g.Type = '" + group.getStr("Type") + "'";
		}
		return find(sql);
	}

	// 验证专家组名称同年份是否重复 如果大于0 表示存在 xdf 2015.06.01
	public Long group_validate(String gyear, String Name) {
		return Db
				.queryLong(
						"select count(id) from set_group where Status=1 and Group_Year=? and Name=?",
						gyear, Name);
	}

	// 根据类别（专评、综评）、年度、状态查询 所有专家组信息
	public List<Group> findGroupAll(String gyear, String type) {
		return find(
				"select * from set_group where Status =1 and Group_Year=? and Type=? order by id asc",
				gyear, type);
	}
	
	// 根据类别（专评、综评、自定义专家）、年度、状态和自定义奖项id查询 所有专家组信息
	public List<Group> findGroupAllByitem(String gyear, String type,String baseinfoID) {
		return find(
				"select * from set_group where Status =1 and Group_Year=? and Type=? and BaseinfoID =? order by id asc",
				gyear, type,baseinfoID);
	}


	/**
	 * 获取综评专家
	 * 
	 * @return
	 */
	public String findGroupPerson(String cur_year) {

		StringBuffer str = new StringBuffer();
		// 获取综评专家组
		List<Group> groupList = this.findGroupAll(cur_year, "2");
		if (groupList != null && groupList.size() > 0) {
			str.append("<ul>");
			Group group = groupList.get(0);
			str.append("<li>" + group.getStr("Name")
					+ "<input type='hidden' id='groupZH' value='"
					+ group.getInt("id") + "'/>");
			// 获取综评专家信息
			List<GroupExpert> expertList = GroupExpert.me.paginate(group
					.getInt("id"));
			if (expertList != null && expertList.size() > 0) {
				str.append("<ul>");
				for (int i = 0; i < expertList.size(); i++) {
					if (i % 4 == 0) {
						str.append("<li>");
					}
					str.append("<input type ='checkbox' value='"
							+ expertList.get(i).getInt("expert_id")
							+ "' name='checkName'/>"
							+ expertList.get(i).getStr("Name")
							+ "&nbsp;&nbsp;&nbsp;");

				}
				str.append("</ul>");
			}
			str.append("</li>");
			str.append("</ul>");
		}

		return str.toString();

	}

}
