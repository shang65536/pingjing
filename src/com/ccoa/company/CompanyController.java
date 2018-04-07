package com.ccoa.company;

import com.ccoa.area.Area;
import com.ccoa.centralenterprises.CentrlaEnterprises;
import org.apache.log4j.Logger;

import com.ccoa.admin.UserController;
import com.ccoa.common.Constants;
import com.ccoa.interceptor.CompanyUserInterceptor;
import com.ccoa.utils.EncryptionUtil;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

import java.util.List;

/**
 * companyController 所有 sql 与业务逻辑写在 Model 或 Service 中
 */
public class CompanyController extends Controller {
	private static Logger log = Logger.getLogger(CompanyController.class);

	public void index() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		// setAttr("companyPage", Company.me.paginate(getParaToInt(0, 1),
		// 10,getPara(1),getPara(2)));
		if (user == null) {
			redirect("/");
		} else {

		}
	}

	public void edit() {
		String method = getRequest().getMethod();
		Integer id = getParaToInt("id");
		if (method.equalsIgnoreCase(Constants.RequestMethod.GET)) {
			setAttr("company", Company.me.findById(id));
			render("edit.html");
		} else if (method.equalsIgnoreCase(Constants.RequestMethod.POST)) {
			String LinkmanName = getPara("LinkmanName");
			String LinkmanPhone = getPara("LinkmanPhone");
			String Email = getPara("Email");
			String CompanyName = getPara("CompanyName");
			String AffiliatedArea = getPara("AffiliatedArea");
			String ZipCode = getPara("ZipCode");
			String CompanyPhone = getPara("CompanyPhone");
			//String CompanyFax = getPara("CompanyFax");
			String IsCentralEnterprises = getPara("IsCentralEnterprises");
			String CreditCode = getPara("CreditCode");

			String Note = getPara("Note");
			String AreaCode = getPara("AreaCode");
			String CentralEnterprisesName = getPara("CentralEnterprisesName");
			String CentralEnterprisesCode = getPara("CentralEnterprisesCode");

			Company company = Company.me.findById(id);
			company.set("LinkmanName", LinkmanName)
					.set("LinkmanPhone", LinkmanPhone)
					.set("Email", Email)
					.set("CompanyName", CompanyName)
					.set("AffiliatedArea", AffiliatedArea)
					.set("ZipCode", ZipCode)
					.set("CompanyPhone", CompanyPhone)
					.set("IsCentralEnterprises", IsCentralEnterprises)
					.set("CreditCode", CreditCode)
					.set("Note", Note)
					.set("AreaCode", AreaCode)
					.set("CentralEnterprisesName", CentralEnterprisesName)
					.set("CentralEnterprisesCode",CentralEnterprisesCode).update();
			renderText("修改成功！");
		}
	}

	// 申报单位 修改页面
	public void detail() {
		Company user = (Company) getSessionAttr(Constants.Company_User_Session);
		if (user != null) {
			Company company = Company.me.findById(user.get("id"));
			setAttr("company", company);
		}
		render("detail.html");
	}

	public void update() {
		getModel(Company.class).update();
		redirect("company.html");
	}

	public void delete() {
		Company.me.deleteById(getParaToInt());
		redirect("company.html");
	}

	// 注册用户 新增页面 2015.06.10
	public void add() {
		setAttr("company", new Company());
		render("companyUserEdit.html");
	}

	// 忘记密码 设置新密码 
		public void newpassword() {
			setAttr("company", new Company());
			render("sendemail.html");
		}
	// 忘记密码 设置新密码
		public void editpassword() {
			String method = getRequest().getMethod();
			Integer id = getParaToInt("id");
			if (method.equalsIgnoreCase(Constants.RequestMethod.GET)) {
				setAttr("company", Company.me.findById(id));
				render("sendemail.html");
			} else if (method.equalsIgnoreCase(Constants.RequestMethod.POST)) {
				String Username = getPara("Username");
				String Email = getPara("Email");
				String Password = getPara("Password");
				Company company = Company.me.findById(id);
				company.set("Username", Username)
						.set("Email", Email)
						.set("Password", Password).update();
				renderText("修改成功！");
			}
		}
		// 验证用户名邮箱是否存在正确
		public void checkNameEmail() {
			try {
				String Username = getPara("Username");
				long c = Company.me.checkName(Username);
				String Email = getPara("Email");
				long e = Company.me.checkName(Email);
				if (c > 0 && e > 0) // 说明存在相同的用户,和相同的邮箱
				{
					renderJson("success", true);
				} else {
					renderJson("success", false);
				}

			} catch (Exception e) {
				e.printStackTrace();
				log.error(e);
				renderJson("success", false);
			}
		}
	// 注册用户 修改页面 2015.06.10
	public void editCompany() {
		Company company = Company.me.findById(getParaToInt("id"));
		setAttr("company", company);
		render("companyUserEdit.html");
	}

	// 验证用户名是否存在
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

	// 保存
	public void save() {
		try {
			Company company = getModel(Company.class);

			if (company.get("id") == null ) {
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
	
	
	public void updatePassword() {
		Company company = getModel(Company.class);
		String Username = company.get("Username");
		String Email = company.get("Email");
		String Password = company.get("Password");
		Company com = Company.me.findBYNE(Username,Email);
		if(com==null){
			renderJson("success", false);
		}else{
			com.set("Password", EncryptionUtil.md5Encrypt(company
					.getStr("Password")));
			com.update();
			renderJson("success", true);
		}
	}

	public  void getArea()
    {
        List<Area> areas = Area.me.getArea();
      //  setAttr("areas", areas);
		renderJson("success", areas);
    }

    /**
     * 获取央企列表
     */
    public void getCentralEnerprises() {
        String param = getPara("param");
        List<CentrlaEnterprises> centrlaEnterprises = CentrlaEnterprises.me.search(param);
        //setAttr("CentrlaEnterprises", centrlaEnterprises);
		renderJson("success", centrlaEnterprises);
    }

}
