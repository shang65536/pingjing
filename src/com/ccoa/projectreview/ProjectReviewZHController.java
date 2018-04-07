package com.ccoa.projectreview;

import java.util.HashMap;
import java.util.Map;

import com.ccoa.admin.Admin;
import com.ccoa.admin.set.Category;
import com.ccoa.admin.set.Prize;
import com.ccoa.common.Constants;
import com.ccoa.company.Company;
import com.ccoa.expert.Expert;
import com.ccoa.interceptor.ExpertUserInterceptor;
import com.ccoa.project.Project;
import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * 综合评审项目 管理 
 * 2015.05.14
 * xdf
 */
@Before(ExpertUserInterceptor.class)
public class ProjectReviewZHController extends Controller {
	
	
	/**
	 * 综合评审项目  首页
	 * 
	 */
	public void index() {       
		Map params=new HashMap();		
		String ProjectCN=getPara("ProjectCN"); //项目名称
		//String ProjectCN="测试数据11"; //项目名称
		String Category=getPara("Category"); //评奖类型
		String prizecx=getPara("prizecx");//是否推荐一等奖
		String status=getPara("status");//操作类型
		String RegisterNum=getPara("RegisterNum");//操作类型
		
		//获取当前登录专家编号
		Expert expert =getSessionAttr(Constants.Expert_User_Session);
		
		if(expert==null){
			redirect("/");
		}else{
			int id=expert.get("id");
			params.put("ExpertID", id);
			params.put("ProjectCN", ProjectCN);
			params.put("Category", Category);
			params.put("prizecx", prizecx);
			params.put("status", status);
			params.put("RegisterNum", RegisterNum);
			setAttr("expert",expert);
			setAttr("ProjectCN",ProjectCN); 
			setAttr("prizecx",prizecx); //用来判断默认下拉框值
			setAttr("status",status); //用来判断默认下拉框值
			setAttr("status",status); //用来判断默认下拉框值
			setAttr("RegisterNum",RegisterNum);
			setAttr("proReviewPage", ProjectReviewZH.dao.paginate(getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, params));
			
			//项目打分规则 中获取综评时间
			Prize pz = Prize.me.findMaxPrize();
			if (pz != null) {
				setAttr("CompositeStartTime",pz.getTimestamp("CompositeStartTime")+"");
				setAttr("CompositeEndTime",pz.getTimestamp("CompositeEndTime")+"");	
			}			
			//调用显示评奖类别集合 用来显示动态下拉框
			Category me = new Category();
			setAttr("CategoryList",me.findAll());
			Prize prize = Prize.me.findMaxPrize();
			if(prize == null){
				prize = new Prize();
			}
			setAttr("prize", prize);
			render("reviewptZH.html");
		}
		
	}
	
	/**
	 * 各专家对该项目各项指标的评分情况
	 */
	public void totalSort(){
		
		String htmlText = ProjectReviewZH.dao.findTotalSort(getPara("id"),getPara("Status"));
		renderHtml(htmlText);
	}
	
	
	
	/**
	 * 评审  首页
	 * 
	 */
	public void psmain()
	{
		String ProjectID=getPara("ProjectID"); //项目编号
		String ExpertID=getPara("ExpertID"); //专家编号
		String UserName=getPara("UserName"); //专家编号
		String Category=getPara("Category"); //评奖类别
		int currentPage = getParaToInt("currentPage"); 
		setAttr("currentPage", currentPage);
		String prid=getPara("prid"); //已评ID
		
		setAttr("ProjectCN",Project.me.findById(ProjectID).get("ProjectCN")); 
		setAttr("ProjectID",ProjectID); 
		setAttr("ExpertID",ExpertID); 
		setAttr("UserName",UserName); 
		setAttr("prid",prid); 
		
		int RegisterNum=getParaToInt("RegisterNum"); //登记号
		setAttr("RegisterNum",RegisterNum);
		
		
		if("".equals(prid))  //新增
		{
			setAttr("pro",new ProjectReviewZH());
		}else//修改
		{
			ProjectReviewZH pro=ProjectReviewZH.dao.findById(getPara("prid"));
			setAttr("pro",pro);
		}
		Prize prize = Prize.me.findMaxPrize();
		if(prize == null){
			prize = new Prize();
		}
		setAttr("prize", prize);
		//根据评奖类别 跳转到不同页面
		/*if("1".equals(Category))
		{
			render("psmbZH2.html"); //技术发明模板
		}else if("2".equals(Category))
		{
			render("psmbZH1.html"); //自然科学模板
		}else if("3".equals(Category))
		{
			render("psmbZH3.html");
		}else if("4".equals(Category))
		{
			render("psmbZH4.html");
		}else if("5".equals(Category))
		{
			render("psmbZH5.html");
		}else
		{
			//
		}*/
		render("psmbZH1.html");//后续修改为不分组
		//String ProjectCN=getPara("ProjectCN"); //登记号
	}
	
	/**
	 * 评审   新增
	 * 
	 */
	public void psAdd()
	{
		ProjectReviewZH projectR=getModel(ProjectReviewZH.class);
		
		projectR.set("status", "1");
		
		if(!"".equals(projectR.getStr("projectID")) && !"".equals(projectR.getStr("expertID")) && projectR.getStr("projectID")!=null && projectR.getStr("expertID")!=null){
			long cpr = ProjectReviewZH.dao.findProjectReviewGatherPidAndEid(projectR.getStr("projectID"),projectR.getStr("expertID"));
			if (cpr==0) {			
				projectR.save();
			} else {			
				projectR.update();
			}
		}
		
		int currentPage;
		if(getPara("currentPage")!=null && getPara("currentPage")!=""){
			currentPage =  getParaToInt("currentPage");
		}else{
			currentPage=1;
		}
		//如果 prid 为空 则 新增 不为空 修改记录
		/*if(projectR.get("id",null)==null)
		{			
			projectR.save();
		}else
		{
			projectR.update();
		}*/
		//getModel(ProjectReview.class).save();
		//index();
		
		
		Map params=new HashMap();		
		String ProjectCN=getPara("ProjectCN"); //项目名称
		//String ProjectCN="测试数据11"; //项目名称
		String Category=getPara("Category"); //评奖类型
		String prizecx=getPara("prizecx");//是否推荐一等奖
		String status=getPara("status");//操作类型
		String RegisterNum=getPara("RegisterNum");//操作类型
		
		//获取当前登录专家编号
		Expert expert =getSessionAttr(Constants.Expert_User_Session);
		
		if(expert==null){
			redirect("/");
		}else{
			int id=expert.get("id");
			params.put("ExpertID", id);
			params.put("ProjectCN", ProjectCN);
			params.put("Category", Category);
			params.put("prizecx", prizecx);
			params.put("status", status);
			params.put("RegisterNum", RegisterNum);
			setAttr("expert",expert);
			setAttr("ProjectCN",ProjectCN); 
			setAttr("prizecx",prizecx); //用来判断默认下拉框值
			setAttr("status",status); //用来判断默认下拉框值
			setAttr("status",status); //用来判断默认下拉框值
			setAttr("RegisterNum",RegisterNum);
			setAttr("proReviewPage", ProjectReviewZH.dao.paginate(currentPage, Constants.PAGE_SIZE, params));
			
			//项目打分规则 中获取综评时间
			Prize pz = Prize.me.findMaxPrize();
			if (pz != null) {
				setAttr("CompositeStartTime",pz.getTimestamp("CompositeStartTime")+"");
				setAttr("CompositeEndTime",pz.getTimestamp("CompositeEndTime")+"");	
			}			
			//调用显示评奖类别集合 用来显示动态下拉框
			Category me = new Category();
			setAttr("CategoryList",me.findAll());
			Prize prize = Prize.me.findMaxPrize();
			if(prize == null){
				prize = new Prize();
			}
			setAttr("prize", prize);
			render("reviewptZH.html");
		}
		
	}
	
	/**
	 * 评审   提交所有综评项目
	 * 
	 */
	public void proTj()
	{
		Map params=new HashMap();
		//获取当前登录专家编号
		Expert expert =getSessionAttr(Constants.Expert_User_Session);
		int id=expert.get("id");
		params.put("ExpertID", id);
		int pcount=ProjectReviewZH.dao.projectRevewCount(params);
		if(pcount>0) //大于0 表示 还有未评审的项目
		{
			setAttr("ts","您还有"+pcount+"个未评审的项目，请全部评审后再提交！"); 
		}else  //调用修改方法  把状态改为 2 已提交
		{
			ProjectReviewZH.dao.projectRevewUpd(params);
			setAttr("ts","提交成功!请到投票表确认投票时间！！"); 
		}
		index();
	}
	
	
	/**
	 * 综合评审项目  分数排名
	 * 
	 */
	public void px() {
        
		Map params=new HashMap();
		
		String ProjectCN=getPara("ProjectCN"); //项目名称
		//String Category=getPara("Category"); //评奖类型
		String RegisterNum=getPara("RegisterNum"); //登记号
		//String prizecx=getPara("prizecx");//是否推荐一等奖
		//String status=getPara("status");//操作类型
		
		//获取当前登录专家编号
		Expert expert =getSessionAttr(Constants.Expert_User_Session);
		if(expert==null){
			redirect("/");
		}else{
			int id=expert.get("id");
			params.put("ExpertID", id);
			params.put("ProjectCN", ProjectCN);
		//	params.put("Category", Category);
			params.put("RegisterNum", RegisterNum);
			setAttr("expert",expert);
			setAttr("ProjectCN",ProjectCN); 
		//	setAttr("Category",Category);
			setAttr("RegisterNum",RegisterNum);
			setAttr("proReviewPage", ProjectReviewZH.dao.projectScore(getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, params));
			
			//项目打分规则 中获取综评时间
			Prize pz=Prize.me.findMaxPrize();
			setAttr("CompositeStartTime",pz.getTimestamp("CompositeStartTime")+"");
			setAttr("CompositeEndTime",pz.getTimestamp("CompositeEndTime")+"");
			
			//调用显示评奖类别集合 用来显示动态下拉框
			Category me = new Category();
			setAttr("CategoryList",me.findAll());
			Prize prize = Prize.me.findMaxPrize();
			if(prize == null){
				prize = new Prize();
			}
			setAttr("prize", prize);
			render("reviewptZHpx.html");
		}
		
	}
	
	//根据项目ID 查看该项目 各个专家打分情况
	public void scoreSee()
	{
		Map params=new HashMap();
		//获取当前登录专家编号
	    Expert expert =getSessionAttr(Constants.Expert_User_Session);
	    if(expert==null){
			redirect("/");
		}else{
			String projectID = getPara("id"); //评奖类型
			params.put("projectID", projectID);
			setAttr("expert",expert);
			setAttr("proScorePage", ProjectReviewZH.dao.scoreSee(getParaToInt(0, 1), 20, params));
			render("scoreSee.html");
		}
	}
	
	/**
	 * 综合评审项目  投票 首页
	 * 
	 */
	public void tp() {
       
		Map params=new HashMap();		
		String ProjectCN=getPara("ProjectCN"); //项目名称
		String Category=getPara("Category"); //评奖类型
		//String prizecx=getPara("prizecx");//是否推荐一等奖
		String status=getPara("status");//操作类型
		String vote_type=getPara("vote_type");//投奖类别
		
		//获取当前登录专家编号
		Expert expert =getSessionAttr(Constants.Expert_User_Session);
		if(expert==null){
			redirect("/");
		}else{
			int id=expert.get("id");
			params.put("ExpertID", id);
			params.put("ProjectCN", ProjectCN);
			params.put("Category", Category);
			params.put("vote_type", vote_type);
			//params.put("prize", prizecx);
			params.put("status", status);
			setAttr("expert",expert);
			setAttr("ProjectCN",ProjectCN); 
			//setAttr("prizecx",prizecx); //用来判断默认下拉框值
			setAttr("status",status); //用来判断默认下拉框值
			setAttr("Category",Category);
			setAttr("vote_type",vote_type);
			setAttr("proReviewPage", ProjectReviewZH.dao.paginatetp(getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, params));
			
			//项目打分规则 中获取综评时间
			Prize pz=Prize.me.findMaxPrize();
			setAttr("CompositeVoteStartTime",pz.getTimestamp("CompositeVoteStartTime")+"");
			setAttr("CompositeVoteEndTime",pz.getTimestamp("CompositeVoteEndTime")+"");
			
			//调用显示评奖类别集合 用来显示动态下拉框
			Category me = new Category();
			setAttr("CategoryList",me.findAll());
			Prize prize = Prize.me.findFirst();			
			if(prize == null){
				prize = new Prize();
			}			
			setAttr("prize", prize);
			
			Map params1=new HashMap();
			Expert expert1 =getSessionAttr(Constants.Expert_User_Session);
			int id1=expert1.get("id");
			params1.put("ExpertID", id1);
			params1.put("vote_type", 1);
			int vt = ProjectReviewZH.dao.projectRevewTPCountByVotetype(params1);
			params1.put("vote_type", 2);
			int vt1 = ProjectReviewZH.dao.projectRevewTPCountByVotetype(params1);
			params1.put("vote_type", 3);
			int vt2 = ProjectReviewZH.dao.projectRevewTPCountByVotetype(params1);
			params1.put("vote_type", 4);
			int vt3 = ProjectReviewZH.dao.projectRevewTPCountByVotetype(params1);
			int GrandestVote;
			int OneVote;
			int TwoVote;
			int ThreeVote;
			String show="";
			
			if(prize.get("GrandestVote")==null){
				GrandestVote = -1;
			}else{
				GrandestVote = prize.getInt("GrandestVote");
			}
			if(prize.get("OneVote")==null){
				OneVote = -1;
			}else{
				OneVote = prize.getInt("OneVote");
			}
			if(prize.get("TwoVote")==null){
				TwoVote =-1;
			}else{
				TwoVote = prize.getInt("TwoVote");
			}
			if(prize.get("ThreeVote")==null){
				ThreeVote = -1;
			}else{
				ThreeVote = prize.getInt("ThreeVote");
			}
			if(GrandestVote>-1){
				show = " 特等奖："+(GrandestVote-vt)+"个  ";
				//setAttr("GrandestVote","特等奖:"+(GrandestVote-vt)+"个同意票数");
			}
			if(OneVote>-1){
				show = show + " 一等奖："+(OneVote-vt)+"个  ";
				//setAttr("OneVote","一等奖还有"+(OneVote-vt)+"个同意票数");
			}
			if(TwoVote>-1){
				show =  show + " 二等奖："+(TwoVote-vt)+"个  ";
				//setAttr("TwoVote","二等奖还有"+(TwoVote-vt)+"个同意票数");
			}
			if(ThreeVote>-1){
				show =  show + " 三等奖："+(ThreeVote-vt)+"个  ";
				//setAttr("ThreeVote","三等奖还有"+(ThreeVote-vt)+"个同意票数");
			}
			if(!"".equals(show) && show!=""){
				setAttr("show","同意票数剩余："+show);
			}
			render("reviewptZHtp.html");
		}
		
	}
	
	
	/**
	 * 投票操作
	 * 
	 */
	public void proTp()
	{
		Map params=new HashMap();
		//获取当前登录专家编号
		Expert expert =getSessionAttr(Constants.Expert_User_Session);
		int id=expert.get("id");
		params.put("expertID", id);
		params.put("ProjectID", getPara("ProjectID"));
		params.put("vote", getPara("vote"));
		ProjectReviewZH.dao.proTp(params);
		tp();
	}
	
	/**
	 * 投票   提交所有已投票项目
	 * 
	 */
	public void proTPTj()
	{
		Map params=new HashMap();
		Prize prize;
		//获取当前登录专家编号
		Expert expert =getSessionAttr(Constants.Expert_User_Session);
		int id=expert.get("id");
		params.put("ExpertID", id);
		//state小于6不统计（6未已提交统计，7为已发布）
		int pcount=ProjectReviewZH.dao.projectRevewTPCount(params);
		if(pcount>0) //大于0 表示 还有未投票的项目
		{
			setAttr("ts","您还有"+pcount+"个未投票的项目，请全部投票后再提交！"); 
		}else  //调用修改方法  把状态改为 2 已提交
		{		
			prize = Prize.me.findFirst();
			//统计特等奖、一等奖、二等奖、三等奖同意的票数
			params.put("vote_type", 1);
			int vt = ProjectReviewZH.dao.projectRevewTPCountByVotetype(params);
			params.put("vote_type", 2);
			int vt1 = ProjectReviewZH.dao.projectRevewTPCountByVotetype(params);
			params.put("vote_type", 3);
			int vt2 = ProjectReviewZH.dao.projectRevewTPCountByVotetype(params);
			params.put("vote_type", 4);
			int vt3 = ProjectReviewZH.dao.projectRevewTPCountByVotetype(params);
			int GrandestVote;
			int OneVote;
			int TwoVote;
			int ThreeVote;
			
			if(prize!=null){
				if(prize.getInt("GrandestVote")==null){
					GrandestVote=-1;
				}else{
					GrandestVote=prize.getInt("GrandestVote");
				}
				if(prize.getInt("OneVote")==null){
					OneVote=-1;
				}else{
					OneVote=prize.getInt("OneVote");
				}
				if(prize.getInt("TwoVote")==null){
					TwoVote=-1;
				}else{
					TwoVote=prize.getInt("TwoVote");
				}
				if(prize.getInt("ThreeVote")==null){
					ThreeVote=-1;
				}else{
					ThreeVote=prize.getInt("ThreeVote");
				}
				
				if(ThreeVote!=-1 && vt>ThreeVote){
					setAttr("ts","特等奖您最多可投"+ThreeVote+"个同意票！"); 
					
				}else if(OneVote!=-1 && vt1>OneVote ){
					setAttr("ts","一等奖您最多可投"+OneVote+"个同意票！"); 
				}
				else if(TwoVote!=-1 && vt2>TwoVote ){
					setAttr("ts","二等奖您最多可投"+TwoVote+"个同意票！"); 
				}else if(ThreeVote!=-1 && vt3>ThreeVote ){
					setAttr("ts","三等奖您最多可投"+ThreeVote+"个同意票！"); 
				}else{
					//只提交state小于6的投票信息，state值为6和7对应已经提交统计结果和发布，不能再投票
					ProjectReviewZH.dao.projectRevewTPUpd(params);
					setAttr("ts","提交成功!"); 
				}							
			}else{
				ProjectReviewZH.dao.projectRevewTPUpd(params);
				setAttr("ts","提交成功!"); 
			}
			
		}
		tp();
	}
}


