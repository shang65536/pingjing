package com.ccoa.index;

import java.io.File;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ccoa.admin.Admin;
import com.ccoa.admin.News;
import com.ccoa.admin.set.Template;
import com.ccoa.admin.set.WinningList;
import com.ccoa.area.Area;
import com.ccoa.centralenterprises.CentrlaEnterprises;
import com.ccoa.common.Constants;
import com.ccoa.company.Company;
import com.ccoa.expert.Expert;
import com.ccoa.project.Accessory;
import com.ccoa.project.Economies;
import com.ccoa.project.KeyPerson;
import com.ccoa.project.MajorCompany;
import com.ccoa.project.Project;
import com.ccoa.project.Property;
import com.ccoa.recommend.Recommend;
import com.ccoa.utils.EncryptionUtil;
import com.ccoa.utils.StringUtils;
import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.plugin.activerecord.Page;
import com.ccoa.common.CookieTool;
import com.ccoa.customawards.Baseinfo;
import com.ccoa.customawards.Declaration;

/**
 * IndexController
 */
public class IndexController extends Controller {
    public void index() {
        String userName = "";


        HttpServletRequest request = getRequest();
        // HttpServletResponse response = getResponse();
        // 管理员登陆
        Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
        if (user != null) {
            userName = user.getStr("AdminName");

        }
        // 专家登录
        Expert expert = getSessionAttr(Constants.Expert_User_Session);
        if (expert != null) {
            userName = expert.getStr("UserName");
        }
        // 企业登录
        Company company = (Company) getSessionAttr(Constants.Company_User_Session);
        if (company != null) {
            userName = company.getStr("Username");
        }

        //推荐人登录
        Recommend recommend = (Recommend) getSessionAttr(Constants.Company_User_Recommend);
        if (recommend != null) {
            userName = recommend.getStr("LoginName");
        }

        String type = getPara("type"); // 1表示 新闻模块 2 表示模板下载 3表示科技奖 4表示其他奖
        if (type != null) {
            if (type.equals("1")) // 表示新闻分页跳转刷新
            {
                // 查询新闻公告信息 按五条分页
                setAttr("newsPage", News.me.paginate(
                        getParaToInt("pageNumber", 1), 5, null, null, "1")); // 查询已发布的新闻
                // 模板下载信息 默认第一页
                setAttr("templatePate", Template.me.paginate(1, 5));
                setAttr("WinningPage", WinningList.me.paginate(1, 5));
                // 其他奖项
                setAttr("baseinfoPage", Baseinfo.me.paginate(1, 5));
            } else if (type.equals("2")) // 表示模板下载模块
            {
                // 模板下载信息
                setAttr("templatePate",
                        Template.me.paginate(getParaToInt("pageNumber", 1), 5));
                // 查询新闻公告信息 按五条分页 默认第一页
                setAttr("newsPage", News.me.paginate(1, 5, null, null, "1"));
                setAttr("WinningPage", WinningList.me.paginate(1, 5));
                // 其他奖项
                setAttr("baseinfoPage", Baseinfo.me.paginate(1, 5));
            } else if (type.equals("3")) // 科技奖
            {
                setAttr("WinningPage", WinningList.me.paginate(
                        getParaToInt("pageNumber", 1), 5));
                // 模板下载信息
                setAttr("templatePate", Template.me.paginate(1, 5));
                // 查询新闻公告信息 按五条分页 默认第一页
                setAttr("newsPage", News.me.paginate(1, 5, null, null, "1"));
                // 其他奖项
                setAttr("baseinfoPage", Baseinfo.me.paginate(1, 5));
            } else if ("4".equals(type)) {
                // 其他奖项
                setAttr("baseinfoPage",
                        Baseinfo.me.paginate(getParaToInt("pageNumber", 1), 5));
                setAttr("WinningPage", WinningList.me.paginate(1, 5));
                // 模板下载信息
                setAttr("templatePate", Template.me.paginate(1, 5));
                // 查询新闻公告信息 按五条分页 默认第一页
                setAttr("newsPage", News.me.paginate(1, 5, null, null, "1"));
            }
        } else { // 默认显示第一页
            if (StringUtils.isNotEmpty(News.me.paginate(1, 5, null, null, "1"))) {
                setAttr("newsPage", News.me.paginate(1, 5, null, null, "1"));
            } else {
                setAttr("newsPage", new News());
            }
            if (StringUtils.isNotEmpty(Template.me.paginate(1, 5))) {
                setAttr("templatePate", Template.me.paginate(1, 5));
            } else {
                setAttr("templatePate", new Template());
            }

            if (StringUtils.isNotEmpty(WinningList.me.paginate(1, 5))) {
                setAttr("WinningPage", WinningList.me.paginate(1, 5));
            } else {
                setAttr("WinningPage", new WinningList());
            }
            if (StringUtils.isNotEmpty(Baseinfo.me.paginate(1, 5))) {
                setAttr("baseinfoPage", Baseinfo.me.paginate(1, 5));
            } else {
                setAttr("baseinfoPage", new Baseinfo());
            }

        }
        // 管理员登陆信息
        String adminName = "";
        String adminPwd = "";


        // 验证本地是否已经记住了相应登陆信息
        Cookie cokLoginName = CookieTool.getCookieByName(request, "adminName");
        Cookie cokLoginPwd = CookieTool.getCookieByName(request, "adminPwd");

        if (cokLoginName != null && cokLoginPwd != null
                && cokLoginName.getValue() != null
                && cokLoginPwd.getValue() != null) {
            String loginName = cokLoginName.getValue();
            String loginPwd = cokLoginPwd.getValue();
            adminName = loginName;
            adminPwd = loginPwd;
            // CookieTool.addCookie(response,"adminName",null,0); //清除Cookie
            // CookieTool.addCookie(response,"adminPwd",null,0); //清除Cookie
        }

        // 申报单位登陆信息
        String companyName = "";
        String companyPwd = "";

        // 验证本地是否已经记住了相应登陆信息
        Cookie cokLoginNamec = CookieTool.getCookieByName(request,
                "companyName");
        Cookie cokLoginPwdc = CookieTool.getCookieByName(request, "companyPwd");

        if (cokLoginNamec != null && cokLoginPwdc != null
                && cokLoginNamec.getValue() != null
                && cokLoginPwdc.getValue() != null) {
            String loginName = cokLoginNamec.getValue();
            String loginPwd = cokLoginPwdc.getValue();
            companyName = loginName;
            companyPwd = loginPwd;
            // CookieTool.addCookie(response,"adminName",null,0); //清除Cookie
            // CookieTool.addCookie(response,"adminPwd",null,0); //清除Cookie
        }

        // 专家登陆信息
        String expertName = "";
        String expertPwd = "";

        // 验证本地是否已经记住了相应登陆信息
        Cookie cokLoginNamee = CookieTool
                .getCookieByName(request, "expertName");
        Cookie cokLoginPwde = CookieTool.getCookieByName(request, "expertPwd");

        if (cokLoginNamee != null && cokLoginPwde != null
                && cokLoginNamee.getValue() != null
                && cokLoginPwde.getValue() != null) {
            String loginName = cokLoginNamee.getValue();
            String loginPwd = cokLoginPwde.getValue();
            expertName = loginName;
            expertPwd = loginPwd;
            // CookieTool.addCookie(response,"adminName",null,0); //清除Cookie
            // CookieTool.addCookie(response,"adminPwd",null,0); //清除Cookie
        }

        // 专家登陆信息
        String recoName = "";
        String recoPwd = "";

        // 验证本地是否已经记住了相应登陆信息
        Cookie cokLoginNamer = CookieTool
                .getCookieByName(request, "recoName");
        Cookie cokLoginPwder = CookieTool.getCookieByName(request, "recoPwd");

        if (cokLoginNamer != null && cokLoginPwder != null
                && cokLoginNamer.getValue() != null
                && cokLoginPwder.getValue() != null) {
            String loginName = cokLoginNamer.getValue();
            String loginPwd = cokLoginPwder.getValue();
            recoName = loginName;
            recoPwd = loginPwd;
            // CookieTool.addCookie(response,"adminName",null,0); //清除Cookie
            // CookieTool.addCookie(response,"adminPwd",null,0); //清除Cookie
        }

        setAttr("userName", userName);
        // 存相应登陆信息
        setAttr("adminName", adminName);
        setAttr("adminPwd", adminPwd);

        setAttr("companyName", companyName);
        setAttr("companyPwd", companyPwd);

        setAttr("expertName", expertName);
        setAttr("expertPwd", expertPwd);

        setAttr("recoName", recoName);
        setAttr("recoPwd", recoPwd);

        render("index.html");
    }

    // 新闻查看页面
    public void newEdit() {

        String userName = "";
        // 管理员登陆
        Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
        if (user != null) {
            userName = user.getStr("AdminName");
        }
        // 专家登录
        Expert expert = getSessionAttr(Constants.Expert_User_Session);
        if (expert != null) {
            userName = expert.getStr("UserName");
        }
        // 企业登录
        Company company = (Company) getSessionAttr(Constants.Company_User_Session);
        if (company != null) {
            userName = company.getStr("Username");
        }

        News news = News.me.findById(getParaToInt("id"));
        setAttr("news", news);
        setAttr("userName", userName);
        render("newsEdit.html");
    }

    // 获奖项目列表查看（科技奖 ）
    public void winningSee() {
        String userName = "";
        // 管理员登陆
        Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
        if (user != null) {
            userName = user.getStr("AdminName");
        }
        // 专家登录
        Expert expert = getSessionAttr(Constants.Expert_User_Session);
        if (expert != null) {
            userName = expert.getStr("UserName");
        }
        // 企业登录
        Company company = (Company) getSessionAttr(Constants.Company_User_Session);
        if (company != null) {
            userName = company.getStr("Username");
        }

        List winningproject = WinningList.me
                .findAllProjectList(getParaToInt("parentID"));
        WinningList winning = new WinningList();
        if (winningproject.size() > 0) {
            winning = (WinningList) winningproject.get(0);
        }

        setAttr("winningproject", winningproject);
        setAttr("PwinName", winning.get("PwinName"));
        setAttr("parentID", getParaToInt("parentID"));

        setAttr("userName", userName);
        render("winningProjectList.html");
    }

    // 查看项目基本情况
    public void seeProject() {

        String userName = "";
        // 管理员登陆
        Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
        if (user != null) {
            userName = user.getStr("AdminName");
        }
        // 专家登录
        Expert expert = getSessionAttr(Constants.Expert_User_Session);
        if (expert != null) {
            userName = expert.getStr("UserName");
        }
        // 企业登录
        Company company = (Company) getSessionAttr(Constants.Company_User_Session);
        if (company != null) {
            userName = company.getStr("Username");
        }

        setAttr("userName", userName);

        Integer id = getParaToInt("id");
        Integer step = getParaToInt("step");
        Integer registerNum = getParaToInt("registerNum"); // 登记号 根据登记号查询
        // 获奖名单管理用来查看

        Project p = new Project();
        if (null != id)
            p = Project.me.findById(id);
        if (null != registerNum)
            p = Project.me.findRegisterNum(registerNum).get(0);
        switch (step) {
            case 1:// 项目基本情况
                setAttr("project", Project.me.projectFindId(p.getInt("id")).get(0));
                render("xiangmu0" + (step) + ".html");
                break;
            case 2:// 项目简介
                setAttr("project", p);
                render("xiangmu0" + (step) + ".html");
                break;
            case 3:// 项目详细内容
                setAttr("project", p);
                render("xiangmu0" + (step) + ".html");
                break;
            case 4:// 应用情况
                setAttr("project", p);
                render("xiangmu0" + (step) + ".html");
                break;
            case 5:// 经济效益
                setAttr("project", p);
                setAttr("EcList",
                        Economies.me.selectEconmiesbyId(getParaToInt(0, 1), 50,
                                p.getInt("id")).getList());
                render("xiangmu0" + (step) + ".html");
                break;
            case 6:// 社会 效益
                setAttr("project", p);
                render("xiangmu0" + (step) + ".html");
                break;
            case 7:// 知识产权
                setAttr("project", p);
                setAttr("PtList",
                        Property.me.selectPtbyId(getParaToInt(0, 1), 50,
                                p.getInt("id")).getList());
                render("xiangmu0" + (step) + ".html");
                break;
            case 8:// 主要完成单位
                setAttr("project", p);
                setAttr("MCList",
                        MajorCompany.me.selectMCbyId(getParaToInt(0, 1), 50,
                                p.getInt("id")).getList());
                render("xiangmu0" + (step) + ".html");
                break;
            case 9:// 主要完成人
                setAttr("project", p);
                setAttr("KPList",
                        KeyPerson.me.selectKPbyId(getParaToInt(0, 1), 50,
                                p.getInt("id")).getList());
                render("xiangmu0" + (step) + ".html");
                break;
            case 10:// 附件
                setAttr("project", p);
                setAttr("ACList", Accessory.me.selectAybyId(p.getInt("id")));
                render("xiangmu" + (step) + ".html");
                break;
        }

        setAttr("user", user);
    }

    // 下载模板
    public void templateOut() {
        // renderFile(getPara("path"));
        Template t = Template.me.findById(getParaToInt("id")); // 传ID 直接传路径 怕有乱码
        renderFile(new File(PathKit.getWebRootPath() + t.getStr("Path")));
    }

    // 公司注册
    public void companyregister() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.RequestMethod.GET)) {
            render("/company/register.html");
        } else if (method.equalsIgnoreCase(Constants.RequestMethod.POST)) {
            String Username = getPara("Username");
            String Password = getPara("Password");
            String LinkmanName = getPara("LinkmanName");
            String LinkmanPhone = getPara("LinkmanPhone");
            String Email = getPara("Email");
            String CompanyName = getPara("CompanyName");
            String CompanyAddress = getPara("CompanyAddress");
            String ZipCode = getPara("ZipCode");
            String CompanyPhone = getPara("CompanyPhone");
            String CompanyFax = getPara("CompanyFax");
            String IsMember = getPara("IsMember");
            String MemberCode = getPara("MemberCode");
            String Note = getPara("Note");
            String AccountType = getPara("AccountType");
            if (Company.me.findByUserName(Username) == null) {
                Company company = new Company();
                company.set("Username", Username)
                        .set("Password", EncryptionUtil.md5Encrypt(Password))
                        .set("LinkmanName", LinkmanName)
                        .set("LinkmanPhone", LinkmanPhone).set("Email", Email)
                        .set("CompanyName", CompanyName)
                        .set("CompanyAddress", CompanyAddress)
                        .set("ZipCode", ZipCode)
                        .set("CompanyPhone", CompanyPhone)
                        .set("CompanyFax", CompanyFax)
                        .set("IsMember", IsMember)
                        .set("MemberCode", MemberCode).set("Note", Note)
                        .set("AccountType", AccountType).save();
                // setSessionAttr(Constants.Company_User_Session, company);
                renderText("注册成功！");
            } else {
                renderText("该账号已注册！");
            }
        }
    }

    // 登录
    public void login() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.RequestMethod.GET)) {
            redirect("/");
        } else if (method.equalsIgnoreCase(Constants.RequestMethod.POST)) {
            HttpServletResponse response = getResponse();
            HttpServletRequest request = getRequest();
            String username = getPara("username");
            String password = getPara("password");
            String remb = getPara("remb");
            String type = getPara("type");
            setSessionAttr(Constants.SESSION_USER_TYPE, type);
            if (type.equals("admin")) {// 管理员登录
                Admin admin = Admin.me.login(username,
                        EncryptionUtil.md5Encrypt(password));
                if (admin == null) {
                    renderText("用户名或密码错误！");
                } else {
                    setSessionAttr(Constants.Admin_User_Session, admin);
                    int loginMaxAge = 30 * 24 * 60 * 60; // 定义账户密码的生命周期，这里是一个月。单位为秒
                    if (StringUtils.isNotEmpty(remb)) // 需要记住密码
                    {
                        CookieTool.addCookie(response, "adminName", username,
                                loginMaxAge);
                        CookieTool.addCookie(response, "adminPwd", password,
                                loginMaxAge);
                        // System.out.println("打印保存的用户名:"+CookieTool.getCookieByName(request,
                        // "adminName").getValue());
                    } else // 不需要记住密码 如果cookie存在 就清空
                    {
                        Cookie cokLoginName = CookieTool.getCookieByName(
                                request, "adminName");
                        Cookie cokLoginPwd = CookieTool.getCookieByName(
                                request, "adminPwd");
                        // 清空
                        if (cokLoginName != null && cokLoginPwd != null
                                && cokLoginName.getValue() != null
                                && cokLoginPwd.getValue() != null) {

                            CookieTool
                                    .addCookie(response, "adminName", null, 0); // 清除Cookie
                            CookieTool.addCookie(response, "adminPwd", null, 0); // 清除Cookie
                        }
                    }
                    redirect("/technology/groupexpert/indexzj");
                }
            } else if (type.equals("expert")) {// 专家用户登录
                Expert expert = Expert.me.login(username,
                        EncryptionUtil.md5Encrypt(password));
                if (expert == null) {
                    renderText("用户名或密码错误！");
                } else {
                    setSessionAttr(Constants.Expert_User_Session, expert);
                    int loginMaxAge = 30 * 24 * 60 * 60; // 定义账户密码的生命周期，这里是一个月。单位为秒
                    if (StringUtils.isNotEmpty(remb)) // 需要记住密码
                    {
                        CookieTool.addCookie(response, "expertName", username,
                                loginMaxAge);
                        CookieTool.addCookie(response, "expertPwd", password,
                                loginMaxAge);
                        // System.out.println("打印保存的用户名:"+CookieTool.getCookieByName(request,
                        // "adminName").getValue());
                    } else {
                        Cookie cokLoginName = CookieTool.getCookieByName(
                                request, "expertName");
                        Cookie cokLoginPwd = CookieTool.getCookieByName(
                                request, "expertPwd");
                        // 清空
                        if (cokLoginName != null && cokLoginPwd != null
                                && cokLoginName.getValue() != null
                                && cokLoginPwd.getValue() != null) {

                            CookieTool.addCookie(response, "expertName", null,
                                    0); // 清除Cookie
                            CookieTool
                                    .addCookie(response, "expertPwd", null, 0); // 清除Cookie
                        }
                    }
                    redirect("/projectreview?tsNote=1");

                }
            } else if (type.equals("company")) {// 企业用户登录
                Company company = Company.me.login(username,
                        EncryptionUtil.md5Encrypt(password));
                if (company == null) {
                    renderText("用户名或密码错误！");
                } else {
                    setSessionAttr(Constants.Company_User_Session, company);
                    int loginMaxAge = 30 * 24 * 60 * 60; // 定义账户密码的生命周期，这里是一个月。单位为秒
                    if (StringUtils.isNotEmpty(remb)) // 需要记住密码
                    {
                        CookieTool.addCookie(response, "companyName", username,
                                loginMaxAge);
                        CookieTool.addCookie(response, "companyPwd", password,
                                loginMaxAge);
                        // System.out.println("打印保存的用户名:"+CookieTool.getCookieByName(request,
                        // "adminName").getValue());
                    } else {
                        Cookie cokLoginName = CookieTool.getCookieByName(
                                request, "companyName");
                        Cookie cokLoginPwd = CookieTool.getCookieByName(
                                request, "companyPwd");
                        // 清空
                        if (cokLoginName != null && cokLoginPwd != null
                                && cokLoginName.getValue() != null
                                && cokLoginPwd.getValue() != null) {

                            CookieTool.addCookie(response, "companyName", null,
                                    0); // 清除Cookie
                            CookieTool.addCookie(response, "companyPwd", null,
                                    0); // 清除Cookie
                        }
                    }
                    redirect("/project");
                }
            } else if (type.equals("recommend")) {
                Recommend recommend = Recommend.me.login(username,
                        EncryptionUtil.md5Encrypt(password));
                if (recommend == null) {
                    renderText("用户名或密码错误！");
                } else {
                    setSessionAttr(Constants.Company_User_Recommend, recommend);
                    int loginMaxAge = 30 * 24 * 60 * 60; // 定义账户密码的生命周期，这里是一个月。单位为秒
                    if (StringUtils.isNotEmpty(remb)) // 需要记住密码
                    {
                        CookieTool.addCookie(response, "recoName", username,
                                loginMaxAge);
                        CookieTool.addCookie(response, "recoPwd", password,
                                loginMaxAge);
                        // System.out.println("打印保存的用户名:"+CookieTool.getCookieByName(request,
                        // "adminName").getValue());
                    } else {
                        Cookie cokLoginName = CookieTool.getCookieByName(
                                request, "recoName");
                        Cookie cokLoginPwd = CookieTool.getCookieByName(
                                request, "recoPwd");
                        // 清空
                        if (cokLoginName != null && cokLoginPwd != null
                                && cokLoginName.getValue() != null
                                && cokLoginPwd.getValue() != null) {

                            CookieTool.addCookie(response, "recoName", null,
                                    0); // 清除Cookie
                            CookieTool.addCookie(response, "recoPwd", null,
                                    0); // 清除Cookie
                        }
                    }
                    redirect("/recommend");
                }
            }
        }
    }

    // 退出
    public void logout() {
        removeSessionAttr(Constants.Admin_User_Session);
        removeSessionAttr(Constants.Company_User_Session);
        removeSessionAttr(Constants.Expert_User_Session);
        removeSessionAttr(Constants.Company_User_Recommend);
        removeSessionAttr(Constants.SESSION_USER_TYPE);
        redirect("/");
    }

    // 找回密码
    public void getPassword() {
        String method = getRequest().getMethod();
        if (method.equalsIgnoreCase(Constants.RequestMethod.GET)) {
            redirect("/");
        } else if (method.equalsIgnoreCase(Constants.RequestMethod.POST)) {
            HttpServletResponse response = getResponse();
            HttpServletRequest request = getRequest();
            String username = getPara("username");
            String password = getPara("password");
            String remb = getPara("remb");
            String type = getPara("type");
            setSessionAttr(Constants.SESSION_USER_TYPE, type);
            if (type.equals("admin")) {// 管理员忘记密码
                Admin admin = Admin.me.newpassword(username,
                        EncryptionUtil.md5Encrypt(password));
                if (admin == null) {
                    renderText("用户名或邮箱错误！");
                } else {
                    setSessionAttr(Constants.Admin_User_Session, admin);
                    int loginMaxAge = 30 * 24 * 60 * 60; // 定义账户密码的生命周期，这里是一个月。单位为秒
                    if (StringUtils.isNotEmpty(remb)) // 需要记住密码
                    {
                        CookieTool.addCookie(response, "adminName", username,
                                loginMaxAge);
                        CookieTool.addCookie(response, "adminPwd", password,
                                loginMaxAge);
                        // System.out.println("打印保存的用户名:"+CookieTool.getCookieByName(request,
                        // "adminName").getValue());
                    } else // 不需要记住密码 如果cookie存在 就清空
                    {
                        Cookie cokLoginName = CookieTool.getCookieByName(
                                request, "adminName");
                        Cookie cokLoginPwd = CookieTool.getCookieByName(
                                request, "adminPwd");
                        // 清空
                        if (cokLoginName != null && cokLoginPwd != null
                                && cokLoginName.getValue() != null
                                && cokLoginPwd.getValue() != null) {

                            CookieTool
                                    .addCookie(response, "adminName", null, 0); // 清除Cookie
                            CookieTool.addCookie(response, "adminPwd", null, 0); // 清除Cookie
                        }
                    }
                    redirect("/technology/groupexpert/indexzj");
                }
            } else if (type.equals("expert")) {// 专家用户登录
                Expert expert = Expert.me.newpassword(username,
                        EncryptionUtil.md5Encrypt(password));
                if (expert == null) {
                    renderText("用户名或邮箱错误！");
                } else {
                    setSessionAttr(Constants.Expert_User_Session, expert);
                    int loginMaxAge = 30 * 24 * 60 * 60; // 定义账户密码的生命周期，这里是一个月。单位为秒
                    if (StringUtils.isNotEmpty(remb)) // 需要记住密码
                    {
                        CookieTool.addCookie(response, "expertName", username,
                                loginMaxAge);
                        CookieTool.addCookie(response, "expertPwd", password,
                                loginMaxAge);
                        // System.out.println("打印保存的用户名:"+CookieTool.getCookieByName(request,
                        // "adminName").getValue());
                    } else {
                        Cookie cokLoginName = CookieTool.getCookieByName(
                                request, "expertName");
                        Cookie cokLoginPwd = CookieTool.getCookieByName(
                                request, "expertPwd");
                        // 清空
                        if (cokLoginName != null && cokLoginPwd != null
                                && cokLoginName.getValue() != null
                                && cokLoginPwd.getValue() != null) {

                            CookieTool.addCookie(response, "expertName", null,
                                    0); // 清除Cookie
                            CookieTool
                                    .addCookie(response, "expertPwd", null, 0); // 清除Cookie
                        }
                    }
                    redirect("/projectreview");

                }
            } else if (type.equals("company")) {// 企业用户登录
                Company company = Company.me.newpassword(username,
                        EncryptionUtil.md5Encrypt(password));
                if (company == null) {
                    renderText("用户名或邮箱错误！");
                } else {
                    setSessionAttr(Constants.Company_User_Session, company);
                    int loginMaxAge = 30 * 24 * 60 * 60; // 定义账户密码的生命周期，这里是一个月。单位为秒
                    if (StringUtils.isNotEmpty(remb)) // 需要记住密码
                    {
                        CookieTool.addCookie(response, "companyName", username,
                                loginMaxAge);
                        CookieTool.addCookie(response, "companyPwd", password,
                                loginMaxAge);
                        // System.out.println("打印保存的用户名:"+CookieTool.getCookieByName(request,
                        // "adminName").getValue());
                    } else {
                        Cookie cokLoginName = CookieTool.getCookieByName(
                                request, "companyName");
                        Cookie cokLoginPwd = CookieTool.getCookieByName(
                                request, "companyPwd");
                        // 清空
                        if (cokLoginName != null && cokLoginPwd != null
                                && cokLoginName.getValue() != null
                                && cokLoginPwd.getValue() != null) {

                            CookieTool.addCookie(response, "companyName", null,
                                    0); // 清除Cookie
                            CookieTool.addCookie(response, "companyPwd", null,
                                    0); // 清除Cookie
                        }
                    }
                    redirect("/project");
                }
            }
        }
    }

    // 下载申报结果
    public void reciewResult() {
        String baseinfoID = getPara("baseinfoID");
        File file;
        Baseinfo baseinfo = Baseinfo.me.findById(baseinfoID);
        file = new File(baseinfo.getStr("ReviewResultFilePath"));
        if (file.exists()) {
            renderFile(file);
        } else {
            index();
        }
    }
}
