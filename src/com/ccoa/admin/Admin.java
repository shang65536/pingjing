package com.ccoa.admin;


import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * Admin model. 对应数据库表 admin
 *
 *
 *数据库字段名建议使用驼峰命名规则，便于与 java 代码保持一致，如字段名： userId
 */
@SuppressWarnings("serial")
public class Admin extends Model<Admin> {
	public static final Admin me = new Admin();
	
	/**
	 * 所有 sql 与业务逻辑写在 Model 或 Service 中
	 */
	public Page<Admin> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *", "from admin order by id desc");
	}
	
	//根据用户名，密码登录
    public Admin login(String username, String password) {
        return super.findFirst("select * from admin where AdminName = ? and AdminPassword = ?", username, password);
    }
    
  //根据用户名，邮箱验证
    public Admin newpassword(String username, String email) {
        return super.findFirst("select * from admin where AdminName = ? and AdminPassword = ?", username, email);
    }
}
