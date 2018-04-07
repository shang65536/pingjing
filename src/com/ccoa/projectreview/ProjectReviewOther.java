package com.ccoa.projectreview;

import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;

/**
 * 评审项目对象管理 对应数据库表 project_review 2015.05.11 xdf
 */

@SuppressWarnings("serial")
public class ProjectReviewOther extends Model<ProjectReviewOther> {
	public static final ProjectReviewOther dao = new ProjectReviewOther();

	/**
	 * 根据当前登录专家编号 查询该用户应该评审的项目信息及已评信息
	 */
	public Page<ProjectReviewOther> paginate(int pageNumber, int pageSize,
			Map params) {

		String sql = "select p.id as ProjectID,  p.ProjectCN, p.ProjectEN, p.Category,pr.id as prid,p.RegisterNum,"
				+ "(select Name from set_category sc where sc.id=p.Category) Category_name,p.Group,"
				+ "(case when pr.recommend='1' then '是' when  pr.recommend='0' then '否' else '未评审' end ) recommend,"
				+ "(case when pr.status is null then '0' else pr.status end) status, pr.note  "; // 默认为0
																									// 未操作
																									// 方便前台页面判断
																									// 类型不一样
																									// 不能对比的问题

		StringBuffer sqlStr = new StringBuffer();

		sqlStr.append(" from project p ");
		sqlStr.append(" left join ");
		sqlStr.append(" (select id,expertID,projectID,recommend,status,note from project_review_other where expertID="
				+ params.get("ExpertID") + " ) pr   "); // 连接子查询
														// 用于区分在同一个专家组的评审项目信息
		sqlStr.append(" on p.id=pr.projectID ");
		sqlStr.append(" where p.Group in (select eg.group_id from set_expertgroup eg where eg.expert_id="
				+ params.get("ExpertID") + " )");

		// System.out.println(sql+sqlStr.toString());
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

		// 是否推荐一等奖
		if (null != params.get("recommend")
				&& !"".equals(params.get("recommend"))
				&& !"null".equals(params.get("recommend"))) {
			sqlStr.append(" and pr.recommend = '" + params.get("recommend")
					+ "' ");
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

		// System.out.println(sqlStr.toString());

		return paginate(pageNumber, pageSize, sql, sqlStr.toString());
	}

	/**
	 * 根据当前登录专家编号 查询剩余未评审的项目
	 */
	public int projectRevewCount(Map params) {
		String sql = "select p.id from project p left join   "
				+ " (select projectID,status from project_review_other where expertID="
				+ params.get("ExpertID")
				+ " ) pr "
				+ " on p.id=pr.ProjectID where "
				+ " p.Group in (select eg.group_id from set_expertgroup eg where eg.expert_id="
				+ params.get("ExpertID") + ") " + " and pr.status is null "; // 未评审项目
		List<ProjectReviewOther> countList = dao.find(sql);
		return countList.size();
	}

	/**
	 * 根据当前登录专家编号 、 评审时间范围 修改 评审状态为已提交 2 表示已提交
	 */
	public int projectRevewUpd(Map params) {
		String sql = "update  project_review_other  set status='2' "
				+ "  where  expertID=?  ";
		// 后面还要加 评审时间范围 条件
		// and projectID in (select id from project where 评审时间范围)
		int count = Db.update(sql, params.get("ExpertID"));
		return count;
	}

}
