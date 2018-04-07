package com.ccoa.projectreview;

import java.util.List;
import java.util.Map;

import com.ccoa.project.Project;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/**
 * 综合评审项目对象管理 对应数据库表 project_review_gather 2015.05.14 xdf
 */

@SuppressWarnings("serial")
public class ProjectReviewZH extends Model<ProjectReviewZH> {
	public static final ProjectReviewZH dao = new ProjectReviewZH();

	/**
	 * 根据当前登录专家编号 查询该用户应该评审的项目信息及已评信息
	 */
	public Page<ProjectReviewZH> paginate(int pageNumber, int pageSize,
			Map params) {

		String sql = "select p.id as ProjectID, p.state as ProjectState, p.ProjectCN, p.ProjectEN,  p.Name as pgName,p.Category,pr.id as prid,p.RegisterNum,p.recom_results,"
				+ "(select Name from set_category sc where sc.id=p.Category) Category_name,p.GroupZH, pr.score,pr.vote,"
				+ "(case when pr.vote='1' then '同意' when  pr.vote='0' then '不同意' else '未投票' end ) voteName,"
				+ "(case when pr.status is null then '0' else pr.status end) status, pr.note  "; // 默认为0
																									// 未操作

		StringBuffer sqlStr = new StringBuffer();

	/*	// 在综评选择专家时 已把数据全部推送过来了 只需要根据专家编号查询数据即可
		sqlStr.append(" from project_review_gather pr LEFT JOIN project p on p.id=pr.projectID ,project_review pre");
		sqlStr.append("  where  p.ApplyYear=year(NOW()) and  pre.projectID=pr.projectID and  pr.expertID="
				+ params.get("ExpertID")+" and pre.expertID ="+params.get("ExpertID"));*/
	
		sqlStr.append(" from project_review_gather pr LEFT JOIN (select pp.*,pg.Name from project pp LEFT JOIN project_group pg on pg.id=pp.GroupZY) p on p.id=pr.projectID ");
		sqlStr.append("  where  p.ApplyYear=year(NOW()) and  pr.expertID="
				+ params.get("ExpertID"));

		// 项目名称
		if (null != params.get("ProjectCN")
				&& !"".equals(params.get("ProjectCN"))
				&& !"null".equals(params.get("ProjectCN"))) {

			sqlStr.append(" and p.ProjectCN like '%" + params.get("ProjectCN")
					+ "%' ");
		}
		// 登记好
			if (null != params.get("RegisterNum")
				&& !"".equals(params.get("RegisterNum"))
				&& !"null".equals(params.get("RegisterNum"))) {
					sqlStr.append(" and p.RegisterNum = " + params.get("RegisterNum")+ " ");
			}
		// 评奖类别
		if (null != params.get("Category")
				&& !"".equals(params.get("Category"))
				&& !"null".equals(params.get("Category"))) {
			sqlStr.append(" and p.Category = " + params.get("Category") + " ");
		}

		// 是否推荐一等奖
		 if(null !=params.get("prizecx") && !"".equals(params.get("prizecx")) &&!"null".equals(params.get("prizecx")))
		 {
		 sqlStr.append(" and p.recom_results = '"+params.get("prizecx")+"' ");
		}
		

		// 操作状态
		if (!"".equals(params.get("status")) && null != params.get("status")
				&& !"0".equals(params.get("status"))
				&& !"null".equals(params.get("status"))) {
			sqlStr.append(" and pr.status = '" + params.get("status") + "' ");
		} else if ("0".equals(params.get("status"))) // 0表示未操作
		{
			sqlStr.append(" and (pr.status = '" + params.get("status")
					+ "' or pr.status is null)");
		}

		// System.out.println("打印:"+sql+sqlStr.toString());
		return paginate(pageNumber, pageSize, sql, sqlStr.toString());
	}

	/**
	 * 根据当前登录专家编号 查询剩余未评审的项目
	 */
	/*public int projectRevewCount(Map params) {
		String sql = "select pr.id from project_review_gather pr,project p ,project_review pre "
				+ " where p.id = pr.projectID and p.State<3 and pr.expertID=" + params.get("ExpertID")
				+ " and (pr.status is null or pr.status=0 or pr.status='')  and p.ApplyYear=year(NOW()) and pre.expertID="+ params.get("ExpertID")+" and  pre.projectID=pr.projectID"; // 未评审项目
		List<ProjectReviewZH> countList = dao.find(sql);
		return countList.size();
	}*/
	public int projectRevewCount(Map params) {
		String sql = "select pr.id from project_review_gather pr,project p"
				+ " where p.id = pr.projectID and p.State<3 and pr.expertID=" + params.get("ExpertID")
				+ " and (pr.status is null or pr.status=0 or pr.status='')  and p.ApplyYear=year(NOW()) "; // 未评审项目
		List<ProjectReviewZH> countList = dao.find(sql);
		return countList.size();
	}

	/**
	 * 根据当前登录专家编号 、 评审时间范围 修改 评审状态为已提交
	 */
	public int projectRevewUpd(Map params) {
		String sql = "update  project_review_gather  set status='2' "
				+ " where  expertID=?";
		int count = Db.update(sql, params.get("ExpertID"));
		return count;
	}

	/**
	 * 专业项目评审总分排序表
	 * 
	 * @param pageNumber
	 * @param pageSize
	 * @param params
	 * @return
	 */
	public Page<ProjectReviewZH> projectScore(int pageNumber, int pageSize,
			Map params) {
		String sql = "select p.id, p.ProjectCN, p.RegisterNum,tg.total as total,"
				+ "(select Name from set_category sc where sc.id=p.Category) Category_name,"
				+ "p.ApplyYear,p.recom_results,p.state,p.vote_type,"
				+ " case when sp.Composite = 1 then cast((tg.total / tg.judged_count) as decimal(11,2)) "
				+ " when sp.Composite = 0 then cast(((tg.total - tg.maxScore - tg.minScore) / tg.judged_count) as decimal(11,2)) "
				+ " else 0 end as total";
		StringBuffer sqlStr = new StringBuffer();
		sqlStr.append(" from project p ");
		sqlStr.append(" left join set_prize sp on sp.PrizeYear = p.ApplyYear  "); // and
																					// sp.Status
																					// =
																					// 1
																					// 去掉评审开启结束状态
		sqlStr.append(" left join (select sum(case when g.status = 2 then g.score else 0 end) as total,g.projectID, ");
		sqlStr.append(" min(case when g.status =2 then g.score else 0 end) as minScore, ");
		sqlStr.append(" max(case when g.status =2 then g.score else 0 end) as maxScore,count(g.id) as judged_count ");
		sqlStr.append(" from project_review_gather g where g.status = 2 group by g.projectID) tg on tg.projectID = p.id ");
		sqlStr.append(" where 1=1 and  p.ApplyYear=year(NOW())  "); // 查看本年度的
		// 评奖状态
		sqlStr.append(" and p.Status > 1  "); // 评审中的
		// 项目名称
		if (null != params.get("ProjectCN")
				&& !"".equals(params.get("ProjectCN"))
				&& !"null".equals(params.get("ProjectCN"))) {

			sqlStr.append(" and p.ProjectCN like '%" + params.get("ProjectCN")
					+ "%' ");
		}
		// 登记号
		if (null != params.get("RegisterNum")
				&& !"".equals(params.get("RegisterNum"))
				&& !"null".equals(params.get("RegisterNum"))) {

			sqlStr.append(" and p.RegisterNum like '%" + params.get("RegisterNum")
					+ "%' ");
		}
		// 评奖类别
		if (null != params.get("Category")
				&& !"".equals(params.get("Category"))
				&& !"null".equals(params.get("Category"))) {
			sqlStr.append(" and p.Category = " + params.get("Category") + " ");
		}

		// 是否推荐一等奖
		// if(null !=params.get("prize") && !"".equals(params.get("prize")) &&
		// !"null".equals(params.get("prize")))
		// {
		// sqlStr.append(" and pr.prize = '"+params.get("prize")+"' ");
		// }

		// System.out.println(sqlStr.toString());
		// 判断是否已从专业项目评审结果汇总表发送
		sqlStr.append(" and p.state  >= 3 "); // 已发送给专家平台

		sqlStr.append(" order by tg.total desc ");
		return paginate(pageNumber, pageSize, sql, sqlStr.toString());
	}

	/**
	 * 根据项目 查询所有专家打分情况
	 */
	public Page<ProjectReviewZH> scoreSee(int pageNumber, int pageSize,
			Map params) {
		String sql = "select projectID,expertID,score,note,"
				+ "(select UserName from expert e where e.id=pg.expertID) UserName ";

		StringBuffer sqlStr = new StringBuffer();

		sqlStr.append(" from project_review_gather pg ");
		sqlStr.append(" where pg.projectID=? ");
		return paginate(pageNumber, pageSize, sql, sqlStr.toString(),
				params.get("projectID"));
	}

	/**
	 * 根据当前登录专家编号 查询该用户应该投票的项目
	 */
	public Page<ProjectReviewZH> paginatetp(int pageNumber, int pageSize,
			Map params) {

		String sql = "select p.id as ProjectID,p.state,p.vote_type, p.ProjectCN, p.ProjectEN, p.Category,pr.expertID,p.RegisterNum,p.recom_results,"
				+ "(select Name from set_category sc where sc.id=p.Category) Category_name,p.GroupZH, pr.score,pr.vote,"
				+ "(select avg(pg.score) from project_review_gather pg where pg.projectID=p.id) zf,"
				+ "(case when pr.vote='1' then '同意' when  pr.vote='0' then '不同意' else '2' end ) voteName, "
				+ "(case when pr.statustp='2' then '已提交'  else '0' end ) statustp "; // 查询投票状态
																						// 如果为2
																						// 已投票
																						// 则不允许操作

		StringBuffer sqlStr = new StringBuffer();

		sqlStr.append(" from project_review_gather pr LEFT JOIN project p   ");
		// 投票类别vote_type 小于等于4 大于4的是直接进入获奖项目列表
		sqlStr.append(" on p.id=pr.projectID  where  p.vote_type<=4 and p.ApplyYear=year(NOW()) and p.state>4 and pr.expertID= "
				+ params.get("ExpertID"));

		// 项目名称
		if (null != params.get("ProjectCN")
				&& !"".equals(params.get("ProjectCN"))
				&& !"null".equals(params.get("ProjectCN"))) {

			sqlStr.append(" and p.ProjectCN like '%" + params.get("ProjectCN")
					+ "%' ");
		}
		// 评奖类别
		if (null != params.get("Category")
				&& !"".equals(params.get("Category"))
				&& !"null".equals(params.get("Category"))) {
			sqlStr.append(" and p.Category = " + params.get("Category") + " ");
		}
		
		// 投奖类别
		if (null != params.get("vote_type")
				&& !"".equals(params.get("vote_type"))
				&& !"null".equals(params.get("vote_type"))) {
			sqlStr.append(" and p.vote_type = " + params.get("vote_type") + " ");
		}

		// 是否推荐一等奖
		// if(null !=params.get("prize") && !"".equals(params.get("prize")) &&
		// !"null".equals(params.get("prize")))
		// {
		// sqlStr.append(" and pr.prize = '"+params.get("prize")+"' ");
		// }
		// 操作状态 1表示已投票 0 表示未投票
		if ("1".equals(params.get("status"))) {
			sqlStr.append(" and pr.vote is not null  ");
		} else if ("0".equals(params.get("status"))) // 0表示未操作
		{
			sqlStr.append(" and pr.vote is null  ");
		}

		// System.out.println(sql+sqlStr.toString());

		return paginate(pageNumber, pageSize, sql, sqlStr.toString());
	}

	/**
	 * 提交投票操作 先根据参数项目编号和专家编号 查找综合评审表是否有记录 如果有 直接修改 投票字段 如果没有需要新增一条数据
	 * 
	 */
	public void proTp(Map params) {
		String sql = "update project_review_gather set " + "vote="
				+ params.get("vote") + ",statustp='1' "
				+ // statustp='1' 记录投票时 默认投票为已操作状态
				" where  projectID=" + params.get("ProjectID") + " "
				+ " and expertID=" + params.get("expertID") + " ";
		int updTp = Db.update(sql);
		if (updTp > 0) // 说明有该专家的综评记录
		{

		} else {
			// 没有记录 直接新增一条综评 投票记录
			ProjectReviewZH zhTP = new ProjectReviewZH();
			zhTP.set("projectID", params.get("ProjectID"))
					.set("expertID", params.get("expertID"))
					.set("statustp", "1") // statustp='1' 记录投票时 默认投票为已操作状态
					.set("vote", params.get("vote"));
			zhTP.save();
		}
	}

	/**
	 * 根据当前登录专家编号 查询剩余未投票的项目
	 */
	public int projectRevewTPCount(Map params) {
		String sql = "select * from  project p LEFT JOIN project_review_gather pr  on p.id=pr.projectID where  "
				+ " expertID="
				+ params.get("ExpertID")
				+ " and p.state<6 and p.state>4 and  p.vote_type<=4 and p.ApplyYear=year(NOW())  and (pr.statustp =0 or pr.statustp='' or pr.statustp is null) "; // 未评审项目
		List<ProjectReviewZH> countList = dao.find(sql);
		return countList.size();
	}
	
	public int projectRevewTPCountByVotetype(Map params) {
		String sql = "select * from  project p LEFT JOIN project_review_gather pr  on p.id=pr.projectID where  "
				+ " pr.expertID="
				+ params.get("ExpertID")
	            + " and p.ApplyYear=year(NOW()) and (pr.statusTp=1 or pr.statusTp=2) and p.state>4  and pr.vote=1 and p.vote_type= "+ params.get("vote_type"); // 未评审项目
  	List<ProjectReviewZH> countList = dao.find(sql);
		return countList.size();
	}

	/**
	 * 根据当前登录专家编号 、 评审时间范围 修改 投票状态为已提交
	 */
	public int projectRevewTPUpd(Map params) {
		String sql = "update  project_review_gather pr  set pr.statustp='2' "
				+ " where  pr.expertID=? and pr.projectID in (SELECT p.id from project p where p.id=pr.projectID and p.state<6)";
		int count = Db.update(sql, params.get("ExpertID"));
		return count;
	}

	/**
	 * 各专家对该项目各项指标的评分情况
	 * 
	 * @return
	 */
	public String findTotalSort(String id, String status) {

		String sql = "select r.score,r.Note,e.UserName,e.Name,e.Phone,r.vote,r.status,r.prdescribe from project_review_gather r "
				+ "left join expert e on e.id = r.expertID where 1=1  and r.projectID = '"
				+ id + "' ";
		if (null != status && !"".equals(status) && !"null".equals(status)) // 综评分数
		{
			sql += "and r.Status = 2"; // 综评分数已提交
		} else {
			sql += "and r.statusTp = 2"; // 投票已提交
		}
		List<ProjectReviewZH> list = find(sql);
		if (list != null && list.size() > 0) {
			StringBuffer str = new StringBuffer();
			str.append("<div><table width='650px;' border='1' cellpadding='0' cellspacing='0'>");
			str.append("<tr style='height:30px;'>");
			str.append("<td width='100px'>用户名</td>");
			str.append("<td width='100px'>姓名</td>");
			str.append("<td width='100px'>电话</td>");
			if (null != status && !"".equals(status) && !"null".equals(status)) {

				str.append("<td width='80px'>分数</td>");
				/*str.append("<td width='200px'>得分描述</td>");
				str.append("<td width='100px;'>意见</td>");*/
			} else {
				str.append("<td width='100px;'>投票结果</td>");
			}
			str.append("</tr>");
			for (ProjectReviewZH pro : list) {
				str.append("<tr style='height:30px;'>");
				str.append("<td>" + pro.getStr("UserName") + "</td>");
				str.append("<td>" + pro.getStr("Name") + "</td>");
				str.append("<td>" + pro.getStr("Phone") + "</td>");
				if (null != status && !"".equals(status)
						&& !"null".equals(status)) {

					str.append("<td>" + pro.getBigDecimal("score") + "</td>");
				/*	str.append("<td>" + pro.getStr("prdescribe") + "</td>");
					str.append("<td style='word-break:break-all;'>"
							+ pro.getStr("Note") + "</td>");*/
				} else {
					if ("2".equals(pro.getStr("status"))) {
						if ("1".equals(pro.getStr("vote"))) {
							str.append("<td>同意</td>");
						} else {
							str.append("<td>不同意</td>");
						}
					} else {
						str.append("<td>未投票</td>");
					}
				}

				str.append("</tr>");
			}
			str.append("</table></div>");
			return str.toString();
		} else {
			return null;
		}
	}
	public Long  findProjectReviewGatherPidAndEid(String projectId,String expertID){
		String sqlString ="select count(*) from project_review_gather prg  where prg.projectId ='"+projectId+"' and prg.expertID='"+expertID+"'";
		return Db.queryLong(sqlString);		
	}
}
