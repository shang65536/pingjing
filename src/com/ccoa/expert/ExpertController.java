package com.ccoa.expert;

import java.util.List;

import org.apache.log4j.Logger;

import com.ccoa.admin.UserController;
import com.ccoa.admin.set.Chapter;
import com.ccoa.common.Constants;
import com.ccoa.company.Company;
import com.ccoa.interceptor.ExpertUserInterceptor;
import com.ccoa.project.Project;
import com.ccoa.utils.EncryptionUtil;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * xpertController 所有 sql 与业务逻辑写在 Model 或 Service 中
 */
@Before(ExpertUserInterceptor.class)
public class ExpertController extends Controller {
	private static Logger log = Logger.getLogger(UserController.class);

	public void index() {
		// setAttr("blogPage", Expert.me.paginate(getParaToInt(0, 1), 10));
		Expert user = (Expert) getSessionAttr(Constants.Expert_User_Session);
		// setAttr("companyPage", Company.me.paginate(getParaToInt(0, 1),
		// 10,getPara(1),getPara(2)));
		if (user == null) {
			redirect("/");
		} else {

		}
	}

	// 专家 修改页面
	public void detail() {
		Expert user = (Expert) getSessionAttr(Constants.Expert_User_Session);
		int id = user.get("id");
		if (user != null) {
			Expert expert = Expert.me.findById(id);
			setAttr("expert", expert);
			if(expert.getInt("Change")==1){//可以修改	
				setAttr("projectPage", Project.me.projectList(getParaToInt("pageNumber", 1), Constants.PAGE_SIZE));
				setAttr("chapterPage", Chapter.me.paginate(getParaToInt("pageNumber", 1), 100));
				List<Jobs> jobs = Jobs.me.findbyids(id);
				List<Results> results = Results.me.findbyids(id);
				List<Writings> writings = Writings.me.findbyids(id);
				List<Winners> winners = Winners.me.findbyids(id);
				setAttr("expert", expert);
				setAttr("jobs", jobs);
				setAttr("jobsSize", jobs.size());
				setAttr("results", results);
				setAttr("resultsSize", results.size());
				setAttr("winners", winners);
				setAttr("winnersSize", winners.size());
				setAttr("writings", writings);
				setAttr("writingsSize", writings.size());
				render("zjk-xiugai.html");				
			}else{
				render("expertUserEdit.html");
			}
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

	public void add() {
	}

	public void save() {
		getModel(Expert.class).save();
		redirect("/blog");
	}

	public void edit() {
		setAttr("blog", Expert.me.findById(getParaToInt()));
	}

	public void update() {
		getModel(Expert.class).update();
		redirect("/blog");
	}

	public void delete() {
		Expert.me.deleteById(getParaToInt());
		redirect("/blog");
	}
	
	public void delete1() {
		try {
			String ids = getPara("ids");
			Jobs.me.deleteById(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void delete2() {
		try {
			String ids = getPara("ids");
			Results.me.deleteById(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void delete3() {
		try {
			String ids = getPara("ids");
			Writings.me.deleteById(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	public void delete4() {
		try {
			String ids = getPara("ids");
			Winners.me.deleteById(ids);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}
	
	/***
	 * 添加、修改专家库
	 */
	public void save1() {

		try {
			setAttr("chapterPage", Chapter.me.paginate(
					getParaToInt("pageNumber", 1), Constants.PAGE_SIZE));
			Expert expert = getModel(Expert.class);
			

			if (expert.get("id", null) == null) {
				expert.set("Password",
						EncryptionUtil.md5Encrypt(expert.getStr("Password")));
				expert.save();
				// 这里对应的而是页面下标值取得的是验证工作经历时间
				int rowIndex = getParaToInt("jobs.rowIndex");
				Jobs jobs;
				for (int i = 1; i <= rowIndex; i++) {
					if(getPara("jobs.StartTime" + i)!=null && getPara("jobs.EndTime" + i)!=null){
						jobs = new Jobs();					
						jobs.set("ExpertID", expert.get("id"));
						if(!"".equals( getPara("jobs.StartTime" + i)) &&  getPara("jobs.StartTime" + i)!=null ){
							jobs.set("StartTime", getPara("jobs.StartTime" + i));
						}
						if(!"".equals( getPara("jobs.EndTime" + i)) &&  getPara("jobs.EndTime" + i)!=null ){
							jobs.set("EndTime", getPara("jobs.EndTime" + i));
						}												
						jobs.set("Company", getPara("jobs.Company" + i));
						jobs.set("Job", getPara("jobs.Job" + i));
						jobs.save();
					}
					
				}
				// 这里对应的而是页面下标值取得的是主要专业技术工作业绩
				int a = getParaToInt("results.rowIndex1");
				Results results;
				for (int i = 1; i <= a; i++) {
					results = new Results();
					if(getPara("results.StartTime" + i)!=null && getPara("results.EndTime" + i)!=null){
						results.set("ExpertID", expert.get("id"));
						if(!"".equals( getPara("results.StartTime" + i)) &&  getPara("results.StartTime" + i)!=null ){
							results.set("StartTime", getPara("results.StartTime" + i));
						}
						if(!"".equals( getPara("results.EndTime" + i)) &&  getPara("results.EndTime" + i)!=null ){
							results.set("EndTime", getPara("results.EndTime" + i));
						}
						results.set("JobName", getPara("results.JobName" + i));
						results.set("Role", getPara("results.Role" + i));
						results.set("Results", getPara("results.Results" + i));
						results.set("Situation", getPara("results.Situation" + i));
						results.save();
					}
				}
				int b = getParaToInt("writings.rowIndex1");
				Writings writings;
				for (int i = 1; i <= b; i++) {
					if(getPara("writings.Date" + i)!=null){
						writings = new Writings();
						writings.set("ExpertID", expert.get("id"));
						writings.set("Writings", getPara("writings.Writings" + i));
						writings.set("Identity", getPara("writings.Identity" + i));
						writings.set("Publishers", getPara("writings.Publishers"
								+ i));
						if(!"".equals( getPara("writings.Date" + i)) &&  getPara("writings.Date" + i)!=null ){
							writings.set("Date", getPara("writings.Date" + i));
						}
						writings.save();
					}
				}
				// winners.set("id", expert.get("id"));

				int c = getParaToInt("winners.rowIndex1");
				Winners winners;
				for (int i = 1; i <= c; i++) {
					if(getPara("winners.Date" + i)!=null){
						winners = new Winners();
						winners.set("ExpertID", expert.get("id"));
						if(!"".equals( getPara("winners.Date" + i)) &&  getPara("winners.Date" + i)!=null ){
							winners.set("Date", getPara("winners.Date" + i));
						}
						winners.set("Title", getPara("winners.Title" + i));
						winners.set("Level", getPara("winners.Level" + i));
						winners.set("Ranking", getPara("winners.Ranking" + i));
						winners.set("Contribute", getPara("winners.Contribute" + i));
						winners.save();
					}
				}

			} else {
				Jobs jobs;
				Results results;

				// 需要判断密码是否被修改 如果没有被修改 默认数据库值
				Expert ex = Expert.me.findById(expert.get("id"));
				if (ex.get("Password").equals(expert.get("Password"))) {
					expert.set("Password", ex.get("Password"));
				} else {
					expert.set("Password", EncryptionUtil.md5Encrypt(expert
							.getStr("Password")));
				}

				expert.update();
				// List<Jobs> jobs=new ArrayList<Jobs>();
				// jobs=getModels(Jobs.class, "jobs");
				int d = getParaToInt("jobs.rowIndex");

				for (int i = 1; i <= d; i++) {
					if (getParaToInt("jobs.id" + i) != null) {
						jobs = Jobs.me.findById(getParaToInt("jobs.id" + i));
						if(!"".equals( getPara("jobs.StartTime" + i)) &&  getPara("jobs.StartTime" + i)!=null ){
							jobs.set("StartTime", getPara("jobs.StartTime" + i));
						}
						if(!"".equals( getPara("jobs.EndTime" + i)) &&  getPara("jobs.EndTime" + i)!=null ){
							jobs.set("EndTime", getPara("jobs.EndTime" + i));
						}	
						jobs.set("Company", getPara("jobs.Company" + i));
						jobs.set("Job", getPara("jobs.Job" + i));
						jobs.update();
					} else {
						jobs = new Jobs();
						jobs.set("ExpertID", expert.get("id"));
						if(!"".equals( getPara("jobs.StartTime" + i)) &&  getPara("jobs.StartTime" + i)!=null ){
							jobs.set("StartTime", getPara("jobs.StartTime" + i));
						}
						if(!"".equals( getPara("jobs.EndTime" + i)) &&  getPara("jobs.EndTime" + i)!=null ){
							jobs.set("EndTime", getPara("jobs.EndTime" + i));
						}	
						jobs.set("Company", getPara("jobs.Company" + i));
						jobs.set("Job", getPara("jobs.Job" + i));
						jobs.save();
					}

				}
				int e = getParaToInt("results.rowIndex");

				for (int i = 1; i <= e; i++) {
					if (getParaToInt("results.id" + i) != null) {
						results = Results.me.findById(getParaToInt("results.id"
								+ i));
						if(!"".equals( getPara("results.StartTime" + i)) &&  getPara("results.StartTime" + i)!=null ){
							results.set("StartTime", getPara("results.StartTime" + i));
						}
						if(!"".equals( getPara("results.EndTime" + i)) &&  getPara("results.EndTime" + i)!=null ){
							results.set("EndTime", getPara("results.EndTime" + i));
						}
						results.set("JobName", getPara("results.JobName" + i));
						results.set("Role", getPara("results.Role" + i));
						results.set("Results", getPara("results.Results" + i));
						results.set("Situation", getPara("results.Situation"
								+ i));
						results.update();
					} else {
						results = new Results();
						results.set("ExpertID", expert.get("id"));
						if(!"".equals( getPara("results.StartTime" + i)) &&  getPara("results.StartTime" + i)!=null ){
							results.set("StartTime", getPara("results.StartTime" + i));
						}
						if(!"".equals( getPara("results.EndTime" + i)) &&  getPara("results.EndTime" + i)!=null ){
							results.set("EndTime", getPara("results.EndTime" + i));
						}
						results.set("Role", getPara("results.Role" + i));
						results.set("Results", getPara("results.Results" + i));
						results.set("Situation", getPara("results.Situation"
								+ i));
						results.save();
					}

				}

				int f = 1;
				f = getParaToInt("writings.rowIndex1");
				Writings writings;
				for (int i = 1; i <= f; i++) {
					if (getParaToInt("writings.id" + i) != null) {
						writings = Writings.me
								.findById(getParaToInt("writings.id" + i));
						writings.set("Writings", getPara("writings.Writings"
								+ i));
						writings.set("Identity", getPara("writings.Identity"
								+ i));
						writings.set("Publishers",
								getPara("writings.Publishers" + i));
						if(!"".equals( getPara("writings.Date" + i)) &&  getPara("writings.Date" + i)!=null ){
							writings.set("Date", getPara("writings.Date" + i));
						}
						writings.update();
					} else {
						writings = new Writings();
						writings.set("ExpertID", expert.get("id"));
						writings.set("Writings", getPara("writings.Writings"
								+ i));
						writings.set("Identity", getPara("writings.Identity"
								+ i));
						writings.set("Publishers",
								getPara("writings.Publishers" + i));
						if(!"".equals( getPara("writings.Date" + i)) &&  getPara("writings.Date" + i)!=null ){
							writings.set("Date", getPara("writings.Date" + i));
						}
						writings.save();
					}

				}
				// winners.set("id", expert.get("id"));
				Winners winners;
				int g = getParaToInt("winners.rowIndex1");
				for (int i = 1; i <= g; i++) {
					if (getParaToInt("winners.id" + i) != null) {
						winners = Winners.me.findById(getParaToInt("winners.id"
								+ i));
						if(!"".equals( getPara("winners.Date" + i)) &&  getPara("winners.Date" + i)!=null ){
							winners.set("Date", getPara("winners.Date" + i));
						}
						winners.set("Title", getPara("winners.Title" + i));
						winners.set("Level", getPara("winners.Level" + i));
						winners.set("Ranking", getPara("winners.Ranking" + i));
						winners.set("Contribute", getPara("winners.Contribute"
								+ i));
						winners.update();
					} else {
						winners = new Winners();
						winners.set("ExpertID", expert.get("id"));
						if(!"".equals( getPara("winners.Date" + i)) &&  getPara("winners.Date" + i)!=null ){
							winners.set("Date", getPara("winners.Date" + i));
						}
						winners.set("Title", getPara("winners.Title" + i));
						winners.set("Level", getPara("winners.Level" + i));
						winners.set("Ranking", getPara("winners.Ranking" + i));
						winners.set("Contribute", getPara("winners.Contribute"
								+ i));
						winners.save();
					}

				}
			}
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			renderJson("success", false);
		}
	}
	
}
