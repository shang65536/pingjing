package com.ccoa.common;

import com.ccoa.admin.Admin;
import com.ccoa.admin.AdminController;
import com.ccoa.admin.News;
import com.ccoa.admin.NewsController;
import com.ccoa.admin.UserController;
import com.ccoa.admin.set.Category;
import com.ccoa.admin.set.CategoryController;
import com.ccoa.admin.set.Chapter;
import com.ccoa.admin.set.ChapterController;
import com.ccoa.admin.set.ExpertSetController;
import com.ccoa.admin.set.FromTask;
import com.ccoa.admin.set.FromTaskController;
import com.ccoa.admin.set.Fromreview;
import com.ccoa.admin.set.Group;
import com.ccoa.admin.set.ProjectGroupController;
import com.ccoa.admin.set.GroupExpert;
import com.ccoa.admin.set.GroupExpertController;
import com.ccoa.admin.set.Prize;
import com.ccoa.admin.set.PrizeController;
import com.ccoa.admin.set.ProfeProjectController;
import com.ccoa.admin.set.ProjectGroup;
import com.ccoa.admin.set.ProjectSetAdminController;
import com.ccoa.admin.set.ProjectSetController;
import com.ccoa.admin.set.RegisterController;
import com.ccoa.admin.set.Template;
import com.ccoa.admin.set.TemplateController;
import com.ccoa.admin.set.WinningList;
import com.ccoa.admin.set.WinningListController;
import com.ccoa.area.Area;
import com.ccoa.area.AreaController;
import com.ccoa.centralenterprises.CentrlaEnterprises;
import com.ccoa.centralenterprises.CentrlaEnterprisesController;
import com.ccoa.company.Company;
import com.ccoa.company.CompanyController;
import com.ccoa.customawards.Baseinfo;
import com.ccoa.customawards.BaseinfoController;
import com.ccoa.customawards.CaReview;
import com.ccoa.customawards.Declaration;
import com.ccoa.customawards.DeclarationController;
import com.ccoa.customawards.ReviewController;
import com.ccoa.customawards.RormalReviewOpinion;
import com.ccoa.expert.Expert;
import com.ccoa.expert.ExpertController;
import com.ccoa.expert.Jobs;
import com.ccoa.expert.Results;
import com.ccoa.expert.Winners;
import com.ccoa.expert.Writings;
import com.ccoa.expertzjk.ExpertzjkuController;
import com.ccoa.handler.GlobalHandler;
import com.ccoa.handler.HtmlHandler;
import com.ccoa.index.IndexController;
import com.ccoa.project.Accessory;
import com.ccoa.project.Economies;
import com.ccoa.project.KeyPerson;
import com.ccoa.project.MajorCompany;
import com.ccoa.project.Project;
import com.ccoa.project.ProjectController;
import com.ccoa.project.Property;
import com.ccoa.projectreview.ProjectReview;
import com.ccoa.projectreview.ProjectReviewController;
import com.ccoa.projectreview.ProjectReviewOtherController;
import com.ccoa.projectreview.ProjectReviewOther;
import com.ccoa.projectreview.ProjectReviewZH;
import com.ccoa.projectreview.ProjectReviewZHController;
import com.ccoa.review.Review;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.core.JFinal;
import com.jfinal.ext.handler.ContextPathHandler;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;



/**
 * API引导式配置
 */
public class AppConfig extends JFinalConfig {
	
	/**
	 * 配置常量
	 */
	public void configConstant(Constants me) {
		// 加载少量必要配置，随后可用getProperty(...)获取值
		loadPropertyFile("config.properties");
		me.setDevMode(getPropertyToBoolean(com.ccoa.common.Constants.CONFIG_DEVMODE, false));
		
		me.setError401View("/common/401.html");
		me.setError403View("/common/403.html");
		me.setError404View("/common/404.html");
		me.setError500View("/common/500.html");
		me.setMaxPostSize(1024*1024*50);
	}
	
	/**
	 * 配置路由
	 */
	public void configRoute(Routes me) {
		me.add("/", IndexController.class, "/index");	// 第三个参数为该Controller的视图存放路径

		areaRoute(me);

		centralenertprises(me);

		//添加后台路由
        adminRoute(me);
        //添加企业路由
        companyRoute(me);
        //添专家路由
        expertRoute(me);
        //project 添加项目路由
        projectRoute(me);
        
        //xdf 2015.5.14
        //project 添加项目评审路由
        projectreviewRoute(me);
        //project 添加项目评审路由  综评 
        projectreviewZHRoute(me);
      //hcl 2015 6.3 专家库
        expertzjkRoute(me);
        //首页路由
        indexRoute(me);


	}

	/**
	 * 地区路由
	 * @param me
	 */
	public  void areaRoute(Routes me)
	{
		me.add("/arae",AreaController.class);
	}

	/**
	 *
	 * @param me
	 */
	public  void centralenertprises(Routes me)
	{
		 me.add("/centralenertprises",CentrlaEnterprisesController.class);
	}

	//首页路由
	public void indexRoute(Routes me){
		me.add("/index",IndexController.class,"/index");
	}
	
	//后台路由
	public void adminRoute(Routes me) {
        me.add("/admin",AdminController.class);
        me.add("/admin/user", UserController.class);//帐号管理
        me.add("/admin/news", NewsController.class);//新闻公告
        me.add("/admin/set_template", TemplateController.class);//新闻公告
        me.add("/admin/set/category", CategoryController.class,"admin/set_category");//评奖类别管理
        me.add("/admin/set/group", ProjectGroupController.class,"admin/set_group");//专业评审组管理
        me.add("/admin/set/chapter", ChapterController.class,"admin/set_chapter");//分会管理
        me.add("/admin/set/expert", ExpertSetController.class,"admin/set_expert");//专家管理
        me.add("/admin/set/project", ProjectSetController.class,"admin/set_project");
        me.add("/admin/set/projectAdmin", ProjectSetAdminController.class,"admin/set_project");//申报资料导出
        
        me.add("/admin/set/prize", PrizeController.class,"admin/set_prize");//评奖设置
        //获奖名单管理
        me.add("/admin/set/winning",WinningListController.class,"/admin/winning");
        me.add("/admin/set/fromtask", FromTaskController.class,"admin/set_fromtask");//任务来源
        
        
        me.add("/technology/profe", ProfeProjectController.class,"admin");//专业评审项目
        me.add("/technology/groupexpert", GroupExpertController.class,"admin");//专业评审组 专家成员管理
        
        me.add("/technology/register",RegisterController.class,"admin");//项目登记管理
        me.add("/baseinfo",BaseinfoController.class,"customawards");//管理平台自定义奖项
        me.add("/declaration",DeclarationController.class,"customawards");//管理平台自定义奖项
        me.add("/review",ReviewController.class,"customawards");//专家平台自定义奖项
    }
	//企业用户路由
	public void companyRoute(Routes me) {
		me.add("/company", CompanyController.class);	// 第三个参数省略时默认与第一个参数值相同，在此即为 "/company"
    }
	//专家路由
	public void expertRoute(Routes me) {
		me.add("/expert", ExpertController.class);	// 第三个参数省略时默认与第一个参数值相同，在此即为 "/expert"
	 }
	//专家库路由  hcl 15.6.3
	public void expertzjkRoute(Routes me) {
		me.add("/expertzjk", ExpertzjkuController.class,"admin");	// 第三个参数省略时默认与第一个参数值相同，在此即为 "/expert"
	
	}
		
	//项目路由
	public void projectRoute(Routes me) {
		me.add("/project", ProjectController.class);	// 第三个参数省略时默认与第一个参数值相同，在此即为 "/project"
    }
	
	//项目评审路由
	public void projectreviewRoute(Routes me) {
		me.add("/projectreview", ProjectReviewController.class);	// 第三个参数省略时默认与第一个参数值相同，在此即为 "/projectreview"
		me.add("/projectreview/other", ProjectReviewOtherController.class);
	}
	//项目评审路由 综评
	public void projectreviewZHRoute(Routes me) {
		me.add("/projectreviewZH", ProjectReviewZHController.class);	// 第三个参数省略时默认与第一个参数值相同，在此即为 "/projectreviewZH"
	}
	
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		// 配置C3p0数据库连接池插件
		C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"), getProperty("user"), getProperty("password").trim());
		me.add(c3p0Plugin);
		
		// 配置ActiveRecord插件
		ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
		me.add(arp);
		//admin 
		arp.addMapping("admin", Admin.class);
		arp.addMapping("news", News.class);
		
		//admin set 设置
		arp.addMapping("set_category", Category.class);	//第一个参数需要与数据库表名相对应
		arp.addMapping("set_chapter", Chapter.class);
		arp.addMapping("set_group", Group.class); //专家评审组
		arp.addMapping("set_expertgroup", GroupExpert.class);  //评审组专家管理
		arp.addMapping("set_fromtask", FromTask.class);	
		arp.addMapping("set_prize", Prize.class);	
		arp.addMapping("set_template", Template.class);
		arp.addMapping("set_fromreview", Fromreview.class); //形式审查表
		arp.addMapping("winning_list", WinningList.class); //获奖名单
		
		//admin 管理
		
		
		//company 公司
		arp.addMapping("company", Company.class);
		//project 项目
		arp.addMapping("project", Project.class);
		arp.addMapping("project_group", ProjectGroup.class); //专业评审组
		arp.addMapping("project_accessory", Accessory.class);
		arp.addMapping("project_economies", Economies.class);
		arp.addMapping("project_key_person", KeyPerson.class);
		arp.addMapping("project_major_company", MajorCompany.class);
		arp.addMapping("project_property", Property.class);
//		//expert 专家
		arp.addMapping("expert", Expert.class);
		arp.addMapping("expert_jobs", Jobs.class);
		arp.addMapping("expert_results", Results.class);
		arp.addMapping("expert_winners", Winners.class);
		arp.addMapping("expert_writings", Writings.class);
//		//review 评审
		arp.addMapping("review", Review.class);
		
//		//review 专家项目评审
		arp.addMapping("project_review", ProjectReview.class);
		//review 专家项目评审 综合
		arp.addMapping("project_review_gather", ProjectReviewZH.class);
		
		//review 专家项目评审 其他奖项
		arp.addMapping("project_review_other", ProjectReviewOther.class);
		//customawords 自定义奖项
		arp.addMapping("ca_baseinfo", Baseinfo.class);
		arp.addMapping("ca_declaration", Declaration.class);
		arp.addMapping("ca_review", CaReview.class);
		arp.addMapping("ca_rormalreviewopinion",RormalReviewOpinion.class);

		arp.addMapping("set_area",Area.class);
		arp.addMapping("set_centrlaenterprises",CentrlaEnterprises.class);
		
		
		//arp.setTransactionLevel(4);//事务隔离级别
		arp.setDevMode(getPropertyToBoolean(com.ccoa.common.Constants.CONFIG_DEVMODE, false)); // 设置开发模式
		arp.setShowSql(getPropertyToBoolean(com.ccoa.common.Constants.CONFIG_DEVMODE, false)); // 是否显示SQL
		
	}
	
	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {
		me.add(new SessionInViewInterceptor());
	}
	
	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers me) {
		me.add(new HtmlHandler());
		me.add(new ContextPathHandler("ctx_path"));
		me.add(new GlobalHandler());
		
	}
	
	/**
	 * 建议使用 JFinal 手册推荐的方式启动项目
	 * 运行此 main 方法可以启动项目，此main方法可以放置在任意的Class类定义中，不一定要放于此
	 */
	public static void main(String[] args) {
		JFinal.start("WebRoot", 8080, "/", 5);
	}
}
