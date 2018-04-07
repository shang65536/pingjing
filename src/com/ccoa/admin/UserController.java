package com.ccoa.admin;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.ccoa.admin.set.GroupExpert;
import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.company.Company;
import com.ccoa.expert.Expert;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.ccoa.project.Project;
import com.ccoa.utils.EncryptionUtil;
import com.jfinal.aop.Before;

@Before(AdminUserInterceptor.class)
public class UserController extends BaseController {

	private static Logger log = Logger.getLogger(UserController.class);

	// ----------单位帐号管理
	public void index() {
		Map<String, String> queryParam = getQueryParam();
		Company company = Company.me.findById(getParaToInt("id"));
		setAttr("company", company);
		setAttr("companyPage", Company.me.paginate(getParaToInt("pageNumber", 1), 
				Constants.PAGE_SIZE,
				queryParam.get("UserName"), 
				queryParam.get("CompanyName")));		
		setAttr("queryParam", queryParam);
		render("companyUserList.html");
	}
	
	public void add() {
		setAttr("company", new Company());
		render("companyUserEdit.html");
	}

	public void edit() {
		Company company = Company.me.findById(getParaToInt("id"));
		System.out.println("密码："
				+ EncryptionUtil.decoderBase64(company.getStr("Password")
						.getBytes()));
		setAttr("company", company);
		render("companyUserEdit.html");
	}

	public void delete() {
		try {
			String ids = getPara("ids");
			long a = Company.me.checkStatus("1",ids);
			if(a!=0){
				renderJson("msg", "存在已审核信息，不能删除！");
			}else{
				Company.me.deleteByIds(ids);
				renderJson("msg", "删除成功！");
			}							
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("msg", "删除失败");
		}		
		
	}

	public void save() {
		try {
			Company company = getModel(Company.class);

			if (company.get("id", null) == null) {
				company.set("Password",
						EncryptionUtil.md5Encrypt(company.getStr("Password")));
				company.save();
			} else {
				// 需要判断密码是否被修改 如果没有被修改 默认数据库值
				Company com = Company.me.findById(company.get("id"));
				if (com.get("Password").equals(company.get("Password"))) {
					company.set("Password", com.get("Password"));
				} else {
					company.set("Password", EncryptionUtil.md5Encrypt(company
							.getStr("Password")));
				}

				company.update();
			}
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	// 验证企业用户名是否存在
	public void checkName() {
		try {
			String Username = getPara("Username");
			long c = Company.me.checkName(Username);
			if (c > 0) // 说明存在相同的用户
			{
				renderJson("success", false);
			} else {
				renderJson("success", true);
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	// 验证专家用户名是否存在
	public void checkExpertName() {
		try {
			String Username = getPara("Username");
			long c = Expert.me.checkName(Username);
			if (c > 0) // 说明存在相同的用户
			{
				renderJson("success", false);
			} else {
				renderJson("success", true);
			}

		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void check() {
		try {
			int id = getParaToInt("id", 0);
			int status = getParaToInt("status", 0);
			String Note = getPara("Note", "");
			Company.me.check(status, Note, id);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	// ----------专家帐号管理
	public void expertUser() {
		Map<String, String> queryParam = getQueryParam();
		Map params = new HashMap();
		params.put("UserName", queryParam.get("UserName"));
		params.put("Job", queryParam.get("Job"));
		params.put("Name", queryParam.get("Name"));
		setAttr("expertPage",Expert.me.paginateopen(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, queryParam));
		setAttr("queryParam", queryParam);
		render("expertUserList.html");
	}

	public void expertAdd() {
		setAttr("expert", new Expert());
		render("expertUserEdit.html");
	}

	public void expertEdit() {
		Expert expert = Expert.me.findById(getParaToInt("id"));
		setAttr("expert", expert);
		render("expertUserEdit.html");
	}

	public void expertDelete() {
		try {
			String ids = getPara("ids");
			Expert.me.deleteByIds(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void expertSave() {
		try {
			Expert expert = getModel(Expert.class);

			if (expert.get("id", null) == null) {
				expert.set("Password",
						EncryptionUtil.md5Encrypt(expert.getStr("Password")));
				expert.save();
			} else {
				// 需要判断密码是否被修改 如果没有被修改 默认数据库值
				Expert ex = Expert.me.findById(expert.get("id"));
				if (ex.get("Password").equals(expert.get("Password"))) {
					expert.set("Password", ex.get("Password"));
				} else {
					expert.set("Password", EncryptionUtil.md5Encrypt(expert
							.getStr("Password")));
				}

				expert.update();
			}
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	// ----------管理员帐号管理
	public void adminUser() {
		Map<String, String> queryParam = getQueryParam();
		setAttr("adminPage", Admin.me.paginate(getParaToInt("pageNumber", 1),
				Constants.PAGE_SIZE));
		setAttr("queryParam", queryParam);
		render("adminUserList.html");
	}
	
	

}
