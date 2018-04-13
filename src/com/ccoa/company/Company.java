package com.ccoa.company;

import com.ccoa.utils.StringUtils;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Company extends Model<Company> {
	public static final Company me = new Company();

	/**
	 * 查询
	 */
	public Page<Company> paginate(int pageNumber, int pageSize,String UserName, String CompanyName) {
		StringBuffer sql = new StringBuffer(" from company co where 1=1 ");
		if (StringUtils.isNotEmpty(UserName)) {
			sql.append(" and co.Username like '%");
			sql.append(UserName);
			sql.append("%'");
		}
		if (StringUtils.isNotEmpty(CompanyName)) {
			sql.append(" and co.CompanyName like '%");
			sql.append(CompanyName);
			sql.append("%'");
		}
		sql.append(" order by id desc ");
		return super.paginate(pageNumber, pageSize, "select *", sql.toString());
	}

/*	// 根据用户名，密码登录
	public Company login(String username, String password) {
		return super
				.findFirst(
						"select * from company where username = ? and Password = ? and  status=1 ",
						username, password); // 审核通过的
	}*/
	// 根据用户名，密码登录
	public Company login(String username, String password) {
		return super
				.findFirst(
						"select * from company where username = ? and Password = ? ",
						username, password); // 审核通过的
	}

	// 根据用户名，邮箱验证
		public Company newpassword(String username, String Email) {
			return super
					.findFirst(
							"select * from company where username = ? and Email = ? and  status=1 ",
							username, Email); // 审核通过的
		}
		// 根据用户名，邮箱验证
				public Company findBYNE(String username, String Email) {
					return super
							.findFirst(
									"select * from company where username = ? and Email = ? ",
									username, Email); // 审核通过的
				}		
	public Company findByUserName(String username) {
		return super.findFirst("select * from company where username = ?",
				username);
	}

	// 删除
	public int deleteByIds(String ids) {
		return Db.update("delete from company where id in ( " + ids + " )");
	}

	// 审核
	public int check(int status, String Note, int id) {
		return Db.update(
				" update company set status = ?,Note = ? where id = ?", status,
				Note, id);
	}

	// 验证用户名是否存在
	public long checkName(String Username) {
		return Db.queryLong("select count(1) from company where Username=?",
				Username);
	}

	//验证单位名称是否存在
	public long checkCompanyName(String CompanyName) {
		return Db.queryLong("select count(1) from company where CompanyName=?",
				CompanyName);
	}
	
	// 验证删除信息中是否存在已审核
		public long checkStatus(String Status,String ids ) {
			return Db.queryLong("select count(1) from company where Status=? and id in ( " + ids + " )",
					Status);
		}
}
