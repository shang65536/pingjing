package com.ccoa.projectreview;

import java.util.List;
import java.util.Map;

import com.ccoa.utils.StringUtils;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 评审项目对象管理 对应数据库表 project_review 2015.05.11 xdf
 */

@SuppressWarnings("serial")
public class ProjectReview extends Model<ProjectReview> {
	public static final ProjectReview dao = new ProjectReview();

	/**
	 * 根据当前登录专家编号 查询该用户应该评审的项目信息及已评信息
	 */
	public Page<ProjectReview> paginate(int pageNumber, int pageSize, Map params) {

		String sql = "select p.id as ProjectID, pg.Name, p.ProjectCN, p.ProjectEN, p.Category,pr.id as prid,p.RegisterNum,p.state,"
				+ "(select Name from set_category sc where sc.id=p.Category) Category_name,p.Group, pr.score,"
				+ "(case when pr.recommend='1' then '是' when  pr.recommend='0' then '否' else '未评审' end ) recommend,"
				+ "(case when pr.prize='0' then '不推荐' when pr.prize='1' then '一等奖' when pr.prize='2' then '二等奖' when pr.prize='3' then '三等奖'   else '未评审' end) prize,"
				+ "(case when pr.status is null then '0' else pr.status end) status, pr.note   "; // 默认为0
																									// 未操作
																									// 方便前台页面判断
																									// 类型不一样
																									// 不能对比的问题

		StringBuffer sqlStr = new StringBuffer();

		sqlStr.append(" from project p ");
		sqlStr.append(" left join ");
		sqlStr.append(" (select id,expertID,projectID,recommend,prize,status,note,score from project_review where expertID="
				+ params.get("ExpertID") + " ) pr   "); // 连接子查询
														// 用于区分在同一个专家组的评审项目信息
		sqlStr.append(" on p.id=pr.projectID ");
		
		sqlStr.append("left join  (select * from project_group ) pg    on p.GroupZY=pg.id ");
		
		sqlStr.append(" where p.ApplyYear=year(NOW()) and p.state >=1 and p.Group in (select eg.group_id from set_expertgroup eg where eg.expert_id="
				+ params.get("ExpertID") + " )");
		// p.state>=1 表示专家组分配已发送状态
		// System.out.println(sql+sqlStr.toString());
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
		if (null != params.get("prize") && !"".equals(params.get("prize"))
				&& !"null".equals(params.get("prize"))) {
			sqlStr.append(" and pr.prize = '" + params.get("prize") + "' ");
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
		sqlStr.append(" and (pr.status = '0' or pr.status is null or pr.status = '1')");//后续变更需求修改为已提交的不显示
		// System.out.println(sqlStr.toString());
		sqlStr.append(" order by p.id asc");

		return paginate(pageNumber, pageSize, sql, sqlStr.toString());
	}

	/**
	 * 根据当前登录专家编号 查询剩余未评审的项目
	 */
	public int projectRevewCount(Map params) {
		String sql = "select p.id from project p left join   "
				+ " (select projectID,status from project_review where expertID="
				+ params.get("ExpertID")
				+ " ) pr "
				+ " on p.id=pr.ProjectID where "
				+ " p.Group in (select eg.group_id from set_expertgroup eg where eg.expert_id="
				+ params.get("ExpertID")
				+ ") "
				+ " and pr.status is null and p.ApplyYear=year(NOW()) and p.state >=1 and p.state!=2 "; // 未评审项目
																							// p.state>=1,2为已经汇总，不能算未提交
																							// 表示专家组分配已发送状态
		List<ProjectReview> countList = dao.find(sql);
		return countList.size();
	}

	/**
	 * 根据当前登录专家编号 、 评审时间范围 修改 评审状态为已提交 2 表示已提交
	 */
	public int projectRevewUpd(Map params) {
		String sql = "update  project_review  set status='2' "
				+ "  where  expertID=?  ";
		// 后面还要加 评审时间范围 条件
		// and projectID in (select id from project where 评审时间范围)
		int count = Db.update(sql, params.get("ExpertID"));
		return count;
	}

	/**
	 * 显示各专家评分情况列表
	 * 
	 * @return
	 */
	public String findAverage(String id, String status) {

		String sql = "select r.score,r.prdescribe,r.Recommend,r.Prize,r.Note,e.UserName,e.Name,e.Phone from project_review r "
				+ "left join expert e on e.id = r.expertID where 1=1 and r.projectID = '"
				+ id + "'";
		if (StringUtils.isNotEmpty(status)) {
			sql += "and r.Status = 2 ";
		}
		List<ProjectReview> list = find(sql);
		if (list != null && list.size() > 0) {
			StringBuffer str = new StringBuffer();
			str.append("<div><table width='900px;' border='1' cellpadding='0' cellspacing='0'>");
			str.append("<tr style='height:30px;'>");
			str.append("<td width='100px'>用户名</td>");
			str.append("<td width='100px'>姓名</td>");
			str.append("<td width='100px'>电话</td>");
			str.append("<td width='100px'>是否推荐</td>");
			str.append("<td width='120px'>是否推荐一等奖</td>");
			str.append("<td width='80px'>分数</td>");
			/*str.append("<td width='200px'>得分描述</td>");*/
			str.append("<td width='200px;'>意见</td>");
			str.append("</tr>");
			for (ProjectReview pro : list) {
				str.append("<tr style='height:30px;'>");
				str.append("<td>" + pro.getStr("UserName") + "</td>");
				str.append("<td>" + pro.getStr("Name") + "</td>");
				str.append("<td>" + pro.getStr("Phone") + "</td>");
				str.append("<td>"
						+ ("1".equals(pro.getStr("Recommend")) ? "是" : "否")
						+ "</td>");
				str.append("<td>"
						+ ("1".equals(pro.getStr("Prize")) ? "是" : "否")
						+ "</td>");
				str.append("<td>" + pro.getBigDecimal("score") + "</td>");
				/*str.append("<td>" + pro.getStr("prdescribe") + "</td>");*/
				str.append("<td style='word-break:break-all;'>"
						+ pro.getStr("Note") + "</td>");
				str.append("</tr>");
			}
			str.append("</table></div>");
			return str.toString();
		} else {
			return null;
		}
	}
	
	
	public Long  findProjectReviewPidAndEid(String projectId,String expertID){
		String sqlString ="select count(*) from project_review pr  where pr.projectId ='"+projectId+"' and pr.expertID='"+expertID+"'";
		return Db.queryLong(sqlString);		
	}

}
