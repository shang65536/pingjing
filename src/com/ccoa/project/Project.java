package com.ccoa.project;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ccoa.admin.set.GroupExpert;
import com.ccoa.projectreview.ProjectReviewZH;
import com.ccoa.utils.StringUtils;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@SuppressWarnings("serial")
public class Project extends Model<Project> {
    public static final Project me = new Project();

    /**
     * 查询 申报资料导出项目列表
     */
    public Page<Project> paginateopen(int pageNumber, int pageSize, Map params) {
        String sql = "select p.id,p.ProjectCN,c.CompanyName,c.Username ";
        StringBuffer sqlStr = new StringBuffer();
        sqlStr.append(" from project p left join company c on p.CompanyID=c.id   where 1=1 and p.Status!=0  ");

        // 项目名称
        if (null != params.get("ProjectCN")
                && !"".equals(params.get("ProjectCN"))
                && !"null".equals(params.get("ProjectCN"))) {

            sqlStr.append(" and p.ProjectCN like '%" + params.get("ProjectCN")
                    + "%' ");
        }
        // 年份
        if (null != params.get("ApplyYear")
                && !"".equals(params.get("ApplyYear"))
                && !"null".equals(params.get("ApplyYear"))) {
            sqlStr.append(" and p.ApplyYear = " + params.get("ApplyYear") + " ");
        }

        // 单位名称
        if (StringUtils.isNotEmpty(params.get("CompanyName"))) {
            sqlStr.append(" and c.CompanyName  like '%"
                    + params.get("CompanyName") + "%'");
        }
        // 申报人
        if (StringUtils.isNotEmpty(params.get("CompanyUserName"))) {
            sqlStr.append(" and c.Username  like '%"
                    + params.get("CompanyUserName") + "%'");
        }
        sqlStr.append(" order by p.id asc");
        return paginate(pageNumber, pageSize, sql, sqlStr.toString());
    }

    /**
     * 查询
     */
    public Page<Project> paginate(int pageNumber, int pageSize, Map params) {
        String sql = "select p.id ,  p.ProjectCN, p.ProjectEN,p.RegisterNum, p.Category, p.ApplyYear ,p.Status,Note ,winning_results,recom_results,"
                + "(select Name from set_category sc where sc.id=p.Category) Category_name ";

        StringBuffer sqlStr = new StringBuffer();
        sqlStr.append(" from  project p where CompanyID="
                + params.get("CompanyID") + " ");

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

            sqlStr.append(" and p.RegisterNum like '%"
                    + params.get("RegisterNum") + "%' ");
        }
        // 评奖类别
        if (null != params.get("Category")
                && !"".equals(params.get("Category"))
                && !"null".equals(params.get("Category"))) {
            sqlStr.append(" and p.Category = " + params.get("Category") + " ");
        }
        // 年份
        if (null != params.get("ApplyYear")
                && !"".equals(params.get("ApplyYear"))
                && !"null".equals(params.get("ApplyYear"))) {
            sqlStr.append(" and p.ApplyYear = " + params.get("ApplyYear") + " ");
        }
        // 评奖状态
        if (null != params.get("Status") && !"".equals(params.get("Status"))
                && !"null".equals(params.get("Status"))) {
            sqlStr.append(" and p.Status = " + params.get("Status") + " ");
		/*	if ("1".equals(params.get("Status"))) // 特等奖
			{
				sqlStr.append(" and p.winning_results = '特等奖' ");
			}
			if ("2".equals(params.get("Status"))) // 一等奖
			{
				sqlStr.append(" and p.winning_results = '一等奖' ");
			}
			if ("3".equals(params.get("Status"))) // 二等奖
			{
				sqlStr.append(" and p.winning_results = '二等奖' ");
			}
			if ("4".equals(params.get("Status"))) // 三等奖
			{
				sqlStr.append(" and p.winning_results = '三等奖' ");
			}
			if ("5".equals(params.get("Status"))) // 未得奖(包括项目已提交 管理员未推荐的项目)
			{
				sqlStr.append(" and (p.winning_results = '未得奖' or p.recom_results is null or p.recom_results='') and p.Status=2 ");
			}*/
        }
        sqlStr.append(" order by p.id asc");
        System.out.println("打印:" + sql + sqlStr);
        return paginate(pageNumber, pageSize, sql, sqlStr.toString());
    }

    // 根据项目登记号查询 项目信息
    public List<Project> findRegisterNum(int registerNum) {
        return find("select * from project where  registerNum=" + registerNum);
    }

    // 根据专家组查询
    public List<Project> findByGroupID(int groupId) {
        return find("select * from project p where  p.state is not null and p.Group=" + groupId);
    }

    // 导出项目列表
    public List exportProjectExcel(Map params) {
        String sql = "select p.id ,  p.ProjectCN, p.ProjectEN, p.Category, p.ApplyYear ,p.Status,Note ,winning_results,recom_results,"
                + "(select Name from set_category sc where sc.id=p.Category) Category_name ";

        sql += ", case when p.Status =0  then  '未提交' "
                + " when p.Status =1  then  '形式审查中' "
                + " when p.Status =2  then  '形式审查合格，项目评审中' "
                + " when p.Status =3  then  '形式审查不合格' "
                + " when p.Status =4  then  '评审中' "
                + " when p.Status =5  then  '特等奖' "
                + " when p.Status =6  then  '一等奖' "
                + " when p.Status =7  then  '二等奖' "
                + " when p.Status =8  then  '三等奖' "
                + " when p.Status =9  then  '未中奖' "
                + " else '未知'  end as winning_results ";


        StringBuffer sqlStr = new StringBuffer();
        sqlStr.append(" from  project p where CompanyID="
                + params.get("CompanyID") + " ");

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
        // 年份
        if (null != params.get("ApplyYear")
                && !"".equals(params.get("ApplyYear"))
                && !"null".equals(params.get("ApplyYear"))) {
            sqlStr.append(" and p.ApplyYear = " + params.get("ApplyYear") + " ");
        }
        // ids
        if (null != params.get("ids")
                && !"".equals(params.get("ids"))
                && !"null".equals(params.get("ids"))) {
            sqlStr.append(" and p.id in (" + params.get("ids") + ")");
        }
        // 评奖状态
        if (null != params.get("Status") && !"".equals(params.get("Status"))
                && !"null".equals(params.get("Status"))) {
            sqlStr.append(" and p.Status = " + params.get("Status") + " ");
			
			/*if ("1".equals(params.get("Status"))) // 特等奖
			{
				sqlStr.append(" and p.winning_results = '特等奖' ");
			}
			if ("2".equals(params.get("Status"))) // 一等奖
			{
				sqlStr.append(" and p.winning_results = '一等奖' ");
			}
			if ("3".equals(params.get("Status"))) // 二等奖
			{
				sqlStr.append(" and p.winning_results = '二等奖' ");
			}
			if ("4".equals(params.get("Status"))) // 三等奖
			{
				sqlStr.append(" and p.winning_results = '三等奖' ");
			}
			if ("5".equals(params.get("Status"))) // 未得奖(包括项目已提交 管理员未推荐的项目)
			{
				sqlStr.append(" and (p.winning_results = '未得奖' or p.recom_results is null or p.recom_results='') and p.Status=2 ");
			}*/

        }
        sqlStr.append(" order by p.id asc");
        return super.find(sql + sqlStr);
    }

    public Page<Project> projectList(int pageNumber, int pageSize) {
        String selectStr = "select p.id,p.CompanyID,p.ProjectCN,p.ApplyYear,c.Name,p.Note,p.Status";
        String fromStr = "from project p,set_category c where p.Category=c.id ";
        String orderStr = " order by p.id asc";
        return paginate(pageNumber, pageSize, selectStr, fromStr + orderStr);
    }

    /**
     * 获取当前用户 刚插入的项目ID
     */
    public int selectId(long CompanyID) {
        String sql = "select max(id) as id from project where CompanyID="
                + CompanyID + "";
        List pList = find(sql);
        Project p = (Project) pList.get(0);
        int id = p.get("id");
        return id;
    }

    // 根据项目ID获取 项目基本信息
    public List<Project> selectProjectById(long id) {
        StringBuilder selectStr = new StringBuilder();
        selectStr.append("select p.id as ProjectID,  p.ProjectCN, p.ProjectEN, p.Category ,Applytime,RegisterNum,Introduction,");
        selectStr.append("Content ,Content1,Content2,Content3,Content4,AppSituation ,TotalFund,Payback,Calculations,Social,  ");
        selectStr.append("(select Name from set_category sc where sc.id=p.Category) Category_name, ");
        selectStr.append("(SELECT GROUP_CONCAT(CompanyName ORDER BY Sort asc SEPARATOR ';') CompanyName  FROM project_major_company pmc WHERE pmc.ProjectID=p.id) CompanyName, ");
        selectStr.append("(SELECT GROUP_CONCAT(Name  ORDER BY pk.Sort asc SEPARATOR ';') Name  FROM project_key_person pk WHERE pk.ProjectID=p.id) pkName, ");
        selectStr.append("(SELECT GROUP_CONCAT(Name SEPARATOR ';') Name  FROM set_fromtask sf WHERE FIND_IN_SET(sf.id,p.FromTask)) sfName, ");
        selectStr.append("(select Name from project_group sc where sc.id=p.GroupZY) Group_name,p.GroupZY, ");
        selectStr.append("(case when p.Secret='1' then '是' else '否' end ) Secret_name,Secret,SecretTime,PlanFund, ");
        selectStr.append("RecommendCompany,FromTask,FromOther,StartTime,EndTime,ApplyYear,");
        selectStr.append("ImplementationPlans ,CurrentSituation ,StartingPlan ,Recommended from project p where id =" + id);

        return find(selectStr.toString());
    }

    /**
     * 专业项目评审项目表查询、专业评审推荐项目汇总表、获奖项目列表
     */
    public Page<Project> paging(int pageNumber, int pageSize, Map params,
                                int val) {

        String sql = "select p.id , p.GroupZY, p.ProjectCN, p.RegisterNum,p.RecommendCompany,p.ApplyYear, sc.Name Category_name,g.id as group_id,g.name as group_name, " // 此处为专业组
                + "tk.person_name as person_name,tm.major_name as major_name,p.recom_results,p.state,p.vote_type,"
                + "(select group_concat(Name) as groupZH_Name from expert where find_in_set(id,p.groupZH_person)) as groupZH_Name,"
                + "(select Name as groupZY_Name from project_group where p.GroupZY=id) as groupZY_Name,"
                + // 显示已选择的专家
                "p.groupZH_person,p.groupZH ";
        StringBuffer sqlStr = new StringBuffer();
        sqlStr.append(" from project p ");
        sqlStr.append(" left join set_category sc on sc.id=p.Category ");
        sqlStr.append(" left join set_prize sp on sp.PrizeYear = p.ApplyYear   "); // 去掉sp.Status
        // =
        // 1
        // 评审开启结束状态
        sqlStr.append(" left join set_group g on g.id=p.Group ");
        sqlStr.append(" left join (select group_concat(k.Name) as person_name,k.ProjectID from (select * from  project_key_person ORDER BY ProjectID desc,Sort asc) k group by k.ProjectID) tk on tk.ProjectID = p.id ");
        sqlStr.append(" left join (select group_concat(m.CompanyName ORDER BY Sort asc SEPARATOR ';') as major_name,m.ProjectID from project_major_company m group by m.ProjectID) tm on tm.ProjectID = p.id ");
        if (val == 2) {// 专业评审推荐项目汇总表
            sql += ", case when sp.Professional = 1 then cast((tr.score / tr.person_count) as decimal(11,2)) "
                    + " when sp.Professional = 0 and tr.person_count>2 then cast(((tr.score - tr.maxScore - tr.minScore) / (tr.person_count-2)) as decimal(11,2)) "
                    + " when sp.Professional = 0 and tr.person_count<3 then cast((tr.score / tr.person_count) as decimal(11,2))"
                    + " else cast((tr.score / tr.person_count) as decimal(11,2)) end as average ";
            sqlStr.append(" left join (select r.ProjectID,sum(case when r.Status = 2 then r.score else 0 end) as score,count(r.id) as person_count, ");
            sqlStr.append(" min(case when r.status =2 then r.score else 0 end) as minScore, ");
            sqlStr.append(" max(case when r.status =2 then r.score else 0 end) as maxScore ");
            sqlStr.append(" from project_review r where r.status =2 group by r.ProjectID) tr on tr.ProjectID = p.id "); // r.status
            // =2
            // 查询已提交的评审项目
        } else if (val == 3) {// 获奖项目列表
            sql += ", trg.* ";
            sql += " ,case "
                    + " when ((p.vote_type = 1 and trg.agreed_trg >= trg.person_trg/3*2) ) or p.vote_type = 5 then '特等奖' "
                    + " when (((p.vote_type = 2 and trg.agreed_trg >= trg.person_trg/3*2) or (p.vote_type = 1 and trg.agreed_trg < trg.person_trg/3*2))  ) or p.vote_type = 6  then '一等奖' "
                    + " when (((p.vote_type = 3 and trg.agreed_trg >= trg.person_trg/3*2) or (p.vote_type = 2 and trg.agreed_trg < trg.person_trg/3*2))  ) or p.vote_type = 7  then '二等奖' "
                    + " when (((p.vote_type = 4 and trg.agreed_trg >= trg.person_trg/3*2) or (p.vote_type = 3 and trg.agreed_trg < trg.person_trg/3*2)) ) or p.vote_type = 8  then '三等奖' "
                    + " else '未得奖' end as award ";
            sql += ",case when p.WinningType=3 then score_trg   else trg.agreed_trg  end as px,case when p.WinningType=3 then trg.score_trg   else 0 end as px1 ";

            sqlStr.append(" left join (select r.projectID,count(r.id) as person_trg, ");
            sqlStr.append(" sum(case when r.status =2 then r.score else 0 end ) as score_trg,sum(case when r.status =2 then r.score else 0 end )/count(r.id) as average, ");
            sqlStr.append(" sum(case when r.status=2 and r.vote = 1 then 1 else 0 end) as agreed_trg ");
            sqlStr.append(" from project_review_gather r where r.status =2  group by r.projectID) trg on trg.projectID = p.id  "); // r.statusTp
            // =2
            // 一般投票提交
            // 宗评早就提交了
        }
        sqlStr.append(" where 1=1  ");
        // 评奖状态
        sqlStr.append(" and p.Status > 1 and p.Status!=3"); // 形式审查结果通过的状态 都可以算分数 p.Status = 2

        // 申报年份
        if (null != params.get("ApplyYear")
                && !"".equals(params.get("ApplyYear"))
                && !"null".equals(params.get("ApplyYear"))) {
            sqlStr.append(" and p.ApplyYear = '" + params.get("ApplyYear")
                    + "' ");
        }
        // 项目名称
        if (null != params.get("ProjectCN")
                && !"".equals(params.get("ProjectCN"))
                && !"null".equals(params.get("ProjectCN"))) {
            sqlStr.append(" and p.ProjectCN like '%" + params.get("ProjectCN")
                    + "%' ");
        }
        // 推荐单位
        if (null != params.get("RecommendCompany")
                && !"".equals(params.get("RecommendCompany"))
                && !"null".equals(params.get("RecommendCompany"))) {
            sqlStr.append(" and p.RecommendCompany like '%"
                    + params.get("RecommendCompany") + "%' ");
        }
        // 专业评审组
        if (null != params.get("group_name")
                && !"".equals(params.get("group_name"))
                && !"null".equals(params.get("group_name"))) {
            sqlStr.append(" and g.name like '%" + params.get("group_name")
                    + "%' ");
        }
        // 完成人员
        if (null != params.get("person_name")
                && !"".equals(params.get("person_name"))
                && !"null".equals(params.get("person_name"))) {
            sqlStr.append(" and tk.person_name like '%"
                    + params.get("person_name") + "%' ");
        }
        // 完成单位
        if (null != params.get("major_name")
                && !"".equals(params.get("major_name"))
                && !"null".equals(params.get("major_name"))) {
            sqlStr.append(" and tm.major_name like '%"
                    + params.get("major_name") + "%' ");
        }
        // 序号
        if (null != params.get("id") && !"".equals(params.get("id"))
                && !"null".equals(params.get("id"))) {
            sqlStr.append(" and p.id like '" + params.get("id") + "%' ");
        }
        // 登记号
        if (null != params.get("RegisterNum")
                && !"".equals(params.get("RegisterNum"))
                && !"null".equals(params.get("RegisterNum"))) {
            sqlStr.append(" and p.RegisterNum like '"
                    + params.get("RegisterNum") + "%' ");
        }
        // 专业评审组
        if (null != params.get("GroupZY")
                && !"".equals(params.get("GroupZY"))
                && !"null".equals(params.get("GroupZY"))) {
            sqlStr.append(" and p.GroupZY = "
                    + params.get("GroupZY"));
        }

        if (val == 2) {// 专业评审推荐项目汇总表
            sqlStr.append(" and p.recom_results is not null and p.recom_results <> '' ");
        } else if (val == 3) {

            sqlStr.append(" and (p.state >= 6 or (p.vote_type >= 5 and p.state = 5)) ");
        }
        if (val == 1) {

            if (StringUtils.isNotEmpty(params.get("px"))
                    && params.get("px").equals("2")) {
                sqlStr.append(" order by p.RegisterNum asc ");

            } else {
                sqlStr.append(" order by p.id asc ");
            }

        } else if (val == 2) {
            if (StringUtils.isNotEmpty(params.get("px"))
                    && params.get("px").equals("2")) {
                sqlStr.append(" order by p.RegisterNum asc ");
            } else {
                sqlStr.append(" order by group_name desc,average desc  ");
            }
        } else if (val == 3) {
            sqlStr.append(" order by p.Status asc,p.WinningType asc,px desc,px1 desc ,trg.average desc");
        } else {
            sqlStr.append(" order by p.Status asc,p.WinningType asc,px desc,px1 desc ");
        }

        return paginate(pageNumber, pageSize, sql, sqlStr.toString());
    }

    /**
     * 获取项目申报年份最底的年份
     *
     * @return
     */
    public int[] years(int max_year) {

        Project project = findFirst("select min(ApplyYear) as year from project");

        int min_year = project == null ? 0
                : (project.getStr("year") == null || "" == project
                .getStr("year")) ? 0 : Integer.parseInt(project
                .getStr("year"));
        int length = min_year == 0 ? 1 : max_year - min_year + 1;
        int[] years = new int[length];
        for (int i = max_year, j = 0; i > (max_year - length); i--, j++) {
            years[j] = i;
        }
        return years;
    }

    /**
     * 专业项目评审结果汇总表
     *
     * @param pageNumber
     * @param pageSize
     * @param params
     * @return
     */
    public Page<Project> pagingResults(int pageNumber, int pageSize, Map params) {
        String sql = "select p.id, p.ProjectCN, p.RegisterNum,p.RecommendCompany,p.recom_results,g.name as group_name,re.*,"
                + " case when sp.Professional = 1 then cast((re.score / re.person_count) as decimal(11,2))"
                + " when sp.Professional = 0 and re.person_count>2 then cast(((re.score - re.maxScore - re.minScore) / (re.person_count-2)) as decimal(11,2))"
                + " when sp.Professional = 0 and re.person_count<3 then cast((re.score / re.person_count) as decimal(11,2))"
                + " else cast((re.score / re.person_count) as decimal(11,2)) end as averageNum,"
                + " cast((re.recom_count/re.person_count) as decimal(11,4))*100 as recomNum,"
                + "(select Name as groupZY_Name from project_group where p.GroupZY=id) as groupZY_Name,"
                + " cast((re.prize_count/re.person_count) as decimal(11,4))*100 as prizeNum ";
        StringBuffer sqlStr = new StringBuffer();
        sqlStr.append(" from project p ");
        sqlStr.append(" left join set_group g on g.id=p.Group  ");
        sqlStr.append(" left join set_prize sp on sp.PrizeYear = p.ApplyYear  "); // and
        // sp.Status
        // =
        // 1
        // 去掉
        // 评审开启状态限制
        // 结果随时都可以查
        sqlStr.append(" left join (select r.ProjectID,");
        sqlStr.append(" sum(case when r.Recommend = 1 and r.Status = 2 then 1 else 0 end) as recom_count, ");
        sqlStr.append(" sum(case when r.Prize = 1 and r.Status = 2 then 1 else 0 end) as prize_count, ");
        sqlStr.append(" sum(case when r.Prize = 2 and r.Status = 2 then 1 else 0 end) as er_count, ");
        sqlStr.append(" sum(case when r.Prize = 3 and r.Status = 2 then 1 else 0 end) as san_count, ");
        sqlStr.append(" sum(case when r.Status = 2 then r.score else 0 end) as score, ");
        sqlStr.append(" min(case when r.status =2 then r.score else 0 end) as minScore, ");
        sqlStr.append(" max(case when r.status =2 then r.score else 0 end) as maxScore, ");
        sqlStr.append(" count(r.id) as person_count ");
        sqlStr.append(" from project_review r  group by r.ProjectID");
        //sqlStr.append(" from project_review r where r.Status = 2  group by r.ProjectID"); // r.Status
        // =
        // 2已提交的评审
        sqlStr.append(" ) re on re.ProjectID = p.id ");
        sqlStr.append(" where 1=1 and p.group <> '' ");
        // 申报年份
        if (null != params.get("ApplyYear")
                && !"".equals(params.get("ApplyYear"))
                && !"null".equals(params.get("ApplyYear"))) {
            sqlStr.append(" and p.ApplyYear = '" + params.get("ApplyYear")
                    + "' ");
        }
        // 项目名称
        if (null != params.get("ProjectCN")
                && !"".equals(params.get("ProjectCN"))
                && !"null".equals(params.get("ProjectCN"))) {
            sqlStr.append(" and p.ProjectCN like '%" + params.get("ProjectCN")
                    + "%' ");
        }
        // 专业评审组
        if (null != params.get("group_name")
                && !"".equals(params.get("group_name"))
                && !"null".equals(params.get("group_name"))) {
            sqlStr.append(" and g.name like '%" + params.get("group_name")
                    + "%' ");
        }
        // 序号
        if (null != params.get("id") && !"".equals(params.get("id"))
                && !"null".equals(params.get("id"))) {
            sqlStr.append(" and p.id like '" + params.get("id") + "%' ");
        }
        // 登记号
        if (null != params.get("RegisterNum")
                && !"".equals(params.get("RegisterNum"))
                && !"null".equals(params.get("RegisterNum"))) {
            sqlStr.append(" and p.RegisterNum like '"
                    + params.get("RegisterNum") + "%' ");
        }
        // 推荐结果
        if (null != params.get("results") && !"".equals(params.get("results"))
                && !"null".equals(params.get("results"))) {
            sqlStr.append(" and p.recom_results = '" + params.get("results")
                    + "' ");
        }

        // 专业评审组
        if (null != params.get("GroupZY")
                && !"".equals(params.get("GroupZY"))
                && !"null".equals(params.get("GroupZY"))) {
            sqlStr.append(" and p.GroupZY = "
                    + params.get("GroupZY"));
        }
        sqlStr.append(" and p.state is not null and p.state <> ''");
        // 评奖状态
        sqlStr.append(" and p.Status > 1 "); // 形式审查结果通过 算分数 p.Status = 2
        if (StringUtils.isNotEmpty(params.get("px"))
                && params.get("px").equals("2")) {
            sqlStr.append(" order by p.RegisterNum asc ");
        } else {
            sqlStr.append(" order by g.name desc,averageNum desc  ");
        }
        return paginate(pageNumber, pageSize, sql, sqlStr.toString());
    }

    /**
     * 专业项目评审总分排序表
     *
     * @param pageNumber
     * @param pageSize
     * @param params
     * @return
     */
    public Page<Project> pagingTotal(int pageNumber, int pageSize, Map params) {
        String sql = "select p.id, p.ProjectCN, p.RegisterNum,tg.total as total,p.ApplyYear,p.recom_results,p.state,p.vote_type,"
                + " case when sp.Composite = 1 then cast((tg.total / tg.judged_count) as decimal(11,2)) "
                + " when sp.Composite = 0 and tg.judged_count>2 then cast(((tg.total - tg.maxScore - tg.minScore) / (tg.judged_count-2)) as decimal(11,2)) "
                + " when sp.Composite = 0 and tg.judged_count<3 then cast((tg.total / tg.judged_count) as decimal(11,2)) "
                + " else cast((tg.total / tg.judged_count) as decimal(11,2)) end as average";
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
        sqlStr.append(" from project_review_gather g where g.status = 2  and score is not null group by g.projectID) tg on tg.projectID = p.id ");
        sqlStr.append(" where 1=1 ");
        // 评奖状态
        sqlStr.append(" and p.Status >= 2 and p.Status!=3 "); // 评审中的
        // 申报年份
        if (null != params.get("ApplyYear")
                && !"".equals(params.get("ApplyYear"))
                && !"null".equals(params.get("ApplyYear"))) {
            sqlStr.append(" and p.ApplyYear = '" + params.get("ApplyYear")
                    + "' ");
        }
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
            sqlStr.append(" and p.RegisterNum like '"
                    + params.get("RegisterNum") + "%' ");
        }
        // 分数
        if (null != params.get("score") && !"".equals(params.get("score"))
                && !"null".equals(params.get("score"))) {
            sqlStr.append(" and tg.total >= " + params.get("score") + " ");
        }
        // 判断是否已从专业项目评审结果汇总表发送
        sqlStr.append(" and p.state  >= 2 ");

        sqlStr.append(" order by average desc ");
        return paginate(pageNumber, pageSize, sql, sqlStr.toString());
    }

    /**
     * 票数统计表
     *
     * @param pageNumber
     * @param pageSize
     * @param params
     * @return
     */
    public Page<Project> pagingStatis(int pageNumber, int pageSize, Map params) {
        String sql = "select p.id, p.ProjectCN, p.RegisterNum,p.ApplyYear,p.recom_results,p.state,p.vote_type,(tg.person_count-tg.agreed-tg.notVote) as notAgreed ,"
                + " case when sp.Composite = 1 then cast((tg.total / tg.person_count) as decimal(11,2)) "
                + " when sp.Composite = 0 then cast(((tg.total - tg.maxScore - tg.minScore) / tg.person_count) as decimal(11,2)) "
                + " else cast((tg.total / tg.person_count) as decimal(11,2)) end as total,tg.person_count,tg.agreed  ";
        StringBuffer sqlStr = new StringBuffer();
        sqlStr.append(" from project p ");
        sqlStr.append(" left join set_prize sp on sp.PrizeYear = p.ApplyYear  ");// and
        // sp.Status
        // =
        // 1
        sqlStr.append(" left join (select sum(case when g.statusTp = 2 then g.score else 0 end) as total,g.projectID, ");
        sqlStr.append(" sum(case when g.vote = 1 and g.status=2 then 1 else 0 end) as agreed, ");
        sqlStr.append(" sum(case when g.status!=2 then 1 else 0 end) as notVote, ");
        sqlStr.append(" count(g.id) as person_count, ");
        sqlStr.append(" min(case when g.statusTp =2 then g.score else 0 end) as minScore, ");
        sqlStr.append(" max(case when g.statusTp =2 then g.score else 0 end) as maxScore "); // statusTp
        // 投票为已提交状态
        sqlStr.append(" from project_review_gather g where g.statusTp =2  group by g.projectID) tg on tg.projectID = p.id ");
        sqlStr.append(" where 1=1 ");
        // 申报年份
        if (null != params.get("ApplyYear")
                && !"".equals(params.get("ApplyYear"))
                && !"null".equals(params.get("ApplyYear"))) {
            sqlStr.append(" and p.ApplyYear = '" + params.get("ApplyYear")
                    + "' ");
        }
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
            sqlStr.append(" and p.RegisterNum like '"
                    + params.get("RegisterNum") + "%' ");
        }
        // 分数
        if (null != params.get("score") && !"".equals(params.get("score"))
                && !"null".equals(params.get("score"))) {
            sqlStr.append(" and tg.total >= " + params.get("score") + " ");
        }
        // 登记号
        if (null != params.get("vote_type")
                && !"".equals(params.get("vote_type"))
                && !"null".equals(params.get("vote_type"))) {
            sqlStr.append(" and p.vote_type = "
                    + params.get("vote_type"));
        }
        // 投票类型分配表发送
        sqlStr.append(" and p.state >= 5 and p.vote_type <= 4");
        // 评奖状态
        sqlStr.append(" and p.Status >= 2 and p.Status!=3 ");

        sqlStr.append(" order by tg.agreed desc ");
        return paginate(pageNumber, pageSize, sql, sqlStr.toString());
    }

    /**
     * 判断未设置状态或未分配综评的数量
     */
    public boolean sendCount(Map<String, String> params) {
        String sql = "select count(p.id) as maxCount from project p ";
        if (null != params.get("state") && !"".equals(params.get("state"))
                && !"null".equals(params.get("state"))) {
            if ("1".equals(params.get("state"))) {// 专家评审项目表发送
                sql += " where (p.group is null or p.group = '') and p.Status = 2 ";
            } else if ("2".equals(params.get("state"))) {// 专业项目评审结果汇总表发送

            } else if ("5".equals(params.get("state"))) {// 投票类型分配表发送

                sql += " where (p.vote_type is null or p.vote_type = '' or p.vote_type = 0) and p.state >= 2";
            }
            sql += " and p.ApplyYear = '"
                    + new SimpleDateFormat("yyyy").format(new Date()) + "'";
        }
        Project pro = findFirst(sql);

        return (pro == null || pro.getLong("maxCount") > 0) ? false : true;
    }

    /**
     * 发送
     *
     * @return
     */
    public int updateSend(String state) {
        String sql1 = "";
        String sql = "update project set state = '" + state + "' ";

        String where = " where ApplyYear = '"
                + new SimpleDateFormat("yyyy").format(new Date()) + "' ";
        if ("1".equals(state)) {// 专家评审项目表发送
            where += " and (state is null or state = '') and Status = 2 ";
        } else if ("2".equals(state)) {// 专业项目评审结果汇总表发送

            // 发送至综评 分两种情况 一种是管理 员选择了几个专家 二种是默认本年综评专家组所有专家
            // （都必须是推荐的项目，否则不需要进行综评和投票）

            // 修改综评专家后 发送情况
            // 综评表添加
            String qeurySql = "select p.groupZH_person,p.id from project p "
                    + "where p.ApplyYear = '"
                    + new SimpleDateFormat("yyyy").format(new Date())
                    + "' and state = 1 "
                    + "and groupZH_person is not null and groupZH_person <> ''  "; // 不为空
            // 说明已被推荐并修改了综评专家

            List<Project> proList = Project.me.find(qeurySql);
            if (proList != null && proList.size() > 0) {
                for (Project pro : proList) {
                    if (StringUtils.isNotEmpty(pro.getStr("groupZH_person"))) {
                        String[] arr = pro.getStr("groupZH_person")
                                .indexOf(",") != -1 ? pro.getStr(
                                "groupZH_person").split(",")
                                : new String[]{pro.getStr("groupZH_person")};
                        for (String expertId : arr) {
                            if (StringUtils.isNotEmpty(expertId)) {
                                ProjectReviewZH reviewZH = new ProjectReviewZH();
                                reviewZH.set("expertID", expertId);
                                reviewZH.set("projectID", pro.getInt("id"));

                                reviewZH.save();
                            }
                        }
                    }
                }
            }

            // 未修改专家 默认所有综评组专家的情况发送 查出今年所有综评专家信息及未分配专家的项目信息 一年只有一个综评专家组
            String qeurySql1 = "select p.id from project p "
                    + "where p.ApplyYear = '"
                    + new SimpleDateFormat("yyyy").format(new Date())
                    + "' and state = 1 "
                    + "and (groupZH_person is  null or groupZH_person = '') "
                    + "and  p.recom_results is not null and p.recom_results <> ''  "; // 必须是管理员点击推荐后的项目
            // 才能发送到综评

            // 查询所有综评专家信息
            String qeurySql2 = "select expert_id from set_expertgroup where group_id in (select id from set_group where Group_Year="
                    + "'"
                    + new SimpleDateFormat("yyyy").format(new Date())
                    + "' and Type='2')  "; // and Type='2'表示综评组

            List<Project> proList1 = Project.me.find(qeurySql1);
            if (proList1 != null && proList1.size() > 0) {
                for (Project pro : proList1) {
                    List<GroupExpert> proList2 = GroupExpert.me.find(qeurySql2);
                    if (proList2 != null && proList2.size() > 0) {
                        for (GroupExpert expertId : proList2) {
                            if (StringUtils.isNotEmpty(expertId
                                    .get("expert_id"))) {
                                ProjectReviewZH reviewZH = new ProjectReviewZH();
                                reviewZH.set("expertID",
                                        expertId.get("expert_id"));
                                reviewZH.set("projectID", pro.getInt("id"));

                                reviewZH.save();
                            }
                        }
                    }

                }
            }

            where += " and state = 1 and  recom_results is not null and recom_results <> ''  "; // 必须是管理员点击推荐后的项目
            // 才能发送到综评
            // ";
            // 修改状态

        } else if ("3".equals(state)) {// 发送给专家

            where += " and state = 2 ";

        } else if ("4".equals(state) || "5".equals(state)) {// 4、投票类型分配表保存
            // 5、投票类型分配表发送
            if ("4".equals(state)) {
                where += " and state < 5 ";
            }
            where += " and state >= 2 and vote_type!=0 ";
        } else if ("6".equals(state)) {// 4、投票类型分配表保存 5、投票类型分配表发送

            where += " and state = 5 ";
            //中奖情况在status中体现,5特等奖，6一等奖，7二等奖，8三等奖，9未中奖
            sql1 = "UPDATE project pp, (SELECT p.id,case  when ((p.vote_type = 1 and trg.agreed_trg >= trg.person_trg/3*2)) or p.vote_type = 5 then 5 when (((p.vote_type = 2 and trg.agreed_trg >= trg.person_trg/3*2) or (p.vote_type = 1 and trg.agreed_trg < trg.person_trg/3*2))  ) or p.vote_type = 6  then 6 when (((p.vote_type = 3 and trg.agreed_trg >= trg.person_trg/3*2) or (p.vote_type = 2 and trg.agreed_trg < trg.person_trg/3*2))  ) or p.vote_type = 7  then 7 when (((p.vote_type = 4 and trg.agreed_trg >= trg.person_trg/3*2) or (p.vote_type = 3 and trg.agreed_trg < trg.person_trg/3*2)) ) or p.vote_type = 8  then 8 else '9' end as award,"
                    + "case  when (p.vote_type = 1 and trg.agreed_trg >= trg.person_trg/3*2) then 3 when (p.vote_type = 1 and trg.agreed_trg < trg.person_trg/3*2) then 2 when (p.vote_type = 2 and trg.agreed_trg >= trg.person_trg/3*2) then 3 when (p.vote_type = 2 and trg.agreed_trg < trg.person_trg/3*2) then 2 when (p.vote_type = 3 and trg.agreed_trg >= trg.person_trg/3*2) then 3 when (p.vote_type = 2 and trg.agreed_trg < trg.person_trg/3*2) then 2 when (p.vote_type = 4 and trg.agreed_trg >= trg.person_trg/3*2) then 3 when (p.vote_type = 3 and trg.agreed_trg < trg.person_trg/3*2) then 2 else 3 end as winningType"
                    + " from project p" +
                    " left join set_prize sp on sp.PrizeYear = p.ApplyYear left join (select r.projectID,count(r.id) as person_trg, sum(case when r.status =2 then r.score else 0 end ) as score_trg, sum(case when r.statusTp =2 and r.vote = 1 then 1 else 0 end) as agreed_trg from project_review_gather r where r.statusTp =2  group by r.projectID) trg on trg.projectID = p.id ) t SET pp.Status =t.award,pp.winningType=t.winningType WHERE pp.id = t.id  and state =5 and pp.ApplyYear = '" + new SimpleDateFormat("yyyy").format(new Date()) + "' ";
        }
        if (sql1 != "") {
            Db.update(sql1);
        }
        return Db.update(sql + where);
    }

    /**
     * 投票类别
     */
    public boolean updateVoteType(String vote_type) {

        String[] arr = vote_type.indexOf(";") != -1 ? vote_type.split(";")
                : new String[]{vote_type};
        int count = 0;
        for (String str : arr) {
            if (null != str && !"".equals(str) && !"null".equals(str)) {
                String[] val = str.split(",");
                count += Db.update("update project set vote_type = "
                        + (val.length == 2 ? str.split(",")[1] : "0")
                        + " where id = " + str.split(",")[0]);
            } else {
                count++;
            }
        }

        return count == arr.length ? true : false;
    }

    /**
     * 修改5特等奖，6一等奖，7二等奖，8三等奖，9未等奖
     */
    public int updateStatusVoteType(String vote_type) {

        String[] arr = vote_type.indexOf(";") != -1 ? vote_type.split(";")
                : new String[]{vote_type};
        int count = 0;
        int val1 = 0;
        for (String str : arr) {
            if (null != str && !"".equals(str) && !"null".equals(str)) {
                String[] val = str.split(",");
                val1 = 0;
                if (val.length > 1) {
                    val1 = Integer.parseInt(val[1]);
                }
                //直接推荐那种修改status状态 5特等奖，6一等奖，7二等奖，8三等奖，9未等奖
                if (val1 > 4) {
                    count += Db.update("update project set WinningType=1,status=" + val1 + " where id =" + val[0]);
                }

            }
        }

        return count;
    }


    // 受理公示与项目登记查询 公用方法
    // 项目登记表查询 GROUP_CONCAT(Name SEPARATOR ';') 函数用来把多条记录拼成一个字符串
    public Page<Project> projectRegisterPage(int pageNumber, int pageSize,
                                             Map params) {
        String sqls = "select p.id,p.RegisterNum,p.ProjectCN,p.RecommendCompany,c.LinkmanName,p.ApplyYear,"
                + "c.LinkmanPhone,c.CompanyAddress,c.ZipCode,c.Email,p.Remark,"
                + "(select Name from set_category sc where sc.id=p.Category) CategoryName,"
                + "(select Name from project_group sg where sg.id=p.GroupZY) GroupName, "
                + "(SELECT GROUP_CONCAT(CompanyName ORDER BY Sort asc SEPARATOR ';') CompanyName  FROM project_major_company pmc WHERE pmc.ProjectID=p.id) CompanyName,"
                + "(SELECT GROUP_CONCAT(Name  ORDER BY pk.Sort asc SEPARATOR ';') Name  FROM project_key_person pk WHERE pk.ProjectID=p.id) pkName,"
                + "(SELECT GROUP_CONCAT(Name SEPARATOR ';') Name  FROM set_fromtask sf WHERE FIND_IN_SET(sf.id,p.FromTask)) sfName, "
                + "(case when p.status=0 then '未提交' when p.status=1 then '形式审查中' "
                + "when p.status=2 then '式审查合格，项目评审中' when p.status=3 then '形式审查不合格' "
                + "when p.status=4 then '评审中' when p.status=5 then '特等奖' when p.status=6 then '一等奖' "
                + "when p.status=7 then '二等奖' when p.status=8 then '三等奖' when p.status=9 then '未得奖' else '' end) Status ";

        StringBuffer sql = new StringBuffer(
                "  from project p LEFT  JOIN company c on p.CompanyID=c.id  where 1=1 and p.status>0 ");

        // 年度
        if (StringUtils.isNotEmpty(params.get("ApplyYear"))) {
            sql.append(" and p.ApplyYear = " + params.get("ApplyYear"));
        }
        // 项目名称
        if (StringUtils.isNotEmpty(params.get("ProjectCN"))) {
            sql.append(" and p.ProjectCN like '%");
            sql.append(params.get("ProjectCN"));
            sql.append("%'");
        }
        // 推荐单位
        if (StringUtils.isNotEmpty(params.get("RecommendCompany"))) {
            sql.append(" and p.RecommendCompany like '%");
            sql.append(params.get("RecommendCompany"));
            sql.append("%'");
        }
        // 联系人
        if (StringUtils.isNotEmpty(params.get("LinkmanName"))) {
            sql.append(" and c.LinkmanName like '%");
            sql.append(params.get("LinkmanName"));
            sql.append("%'");
        }
        // 联系电话
        if (StringUtils.isNotEmpty(params.get("LinkmanPhone"))) {
            sql.append(" and c.LinkmanPhone like '%");
            sql.append(params.get("LinkmanPhone"));
            sql.append("%'");
        }
        // 项目来源 0表示查全部 不需要匹配
        if (StringUtils.isNotEmpty(params.get("FromTask"))
                && !"0".equals(params.get("FromTask"))) {
            sql.append(" and p.FromTask like '%" + params.get("FromTask")
                    + "%'");
        }

        // 项目ID 受理公示与项目登记查询 公用方法
        if (StringUtils.isNotEmpty(params.get("id"))) {
            sql.append(" and p.id=" + params.get("id"));
        }
        // 登记号 受理公示
        if (StringUtils.isNotEmpty(params.get("RegisterNum"))) {
            sql.append(" and p.RegisterNum=" + params.get("RegisterNum"));
        }
        // 主要完成人 受理公示
        if (StringUtils.isNotEmpty(params.get("KpName"))) {
            sql.append(" and p.id in (select ProjectId from project_key_person pk where Name like '%"
                    + params.get("KpName") + "%')");
        }
        // 主要完成单位 受理公示
        if (StringUtils.isNotEmpty(params.get("McName"))) {
            sql.append(" and p.id in (select ProjectId from project_major_company mc where CompanyName like '%"
                    + params.get("McName") + "%')");
        }
        // 状态为 形式审查合格 受理公示 SL表示是受理模块查询功能 状态必须是 形式审查通过的项目
        if (StringUtils.isNotEmpty(params.get("SL"))) {
            sql.append(" and p.Status>1 and p.Status!=3"); // 2 表示形式审查合格
        }
        // 排序 1 按序号排序 2 按登记号排序
        if (StringUtils.isNotEmpty(params.get("px"))
                && params.get("px").equals("2")) {
            sql.append(" order by p.RegisterNum asc ");

        } else {
            sql.append(" order by p.id asc ");
        }
        return super.paginate(pageNumber, pageSize, sqls, sql.toString());
    }

    // 项目形式审查表查询
    public Page<Project> projectReviewPage(int pageNumber, int pageSize,
                                           Map params) {
        String sqls = "select p.id,p.RegisterNum,p.ProjectCN,p.RecommendCompany,"
                + "(select Name from set_category sc where sc.id=p.Category) CategoryName,"
                + "(select Name from project_group sg where sg.id=p.GroupZY) GroupName, "
                + "(select  Status  from set_fromreview sf where sf.ProjectID=p.id  order by id desc limit 1) as rStatus,"
                + "(select  Note  from set_fromreview sf where sf.ProjectID=p.id  order by id desc limit 1) as Note  ";

        StringBuffer sql = new StringBuffer(" from project p where  "
                + "  RegisterNum <> 'null' and RegisterNum <> ''  "); // 登记号必须已经分配

        // 年度
        if (StringUtils.isNotEmpty(params.get("ApplyYear"))) {
            sql.append(" and p.ApplyYear = " + params.get("ApplyYear"));
        }
        // 项目名称
        if (StringUtils.isNotEmpty(params.get("ProjectCN"))) {
            sql.append(" and p.ProjectCN like '%");
            sql.append(params.get("ProjectCN"));
            sql.append("%'");
        }
        // 推荐单位
        if (StringUtils.isNotEmpty(params.get("RecommendCompany"))) {
            sql.append(" and p.RecommendCompany like '%");
            sql.append(params.get("RecommendCompany"));
            sql.append("%'");
        }
        // 审核状态
        if (StringUtils.isNotEmpty(params.get("Status"))) {
            sql.append(" and (select  Status  from set_fromreview sf where sf.ProjectID=p.id  order by id desc limit 1) = "
                    + params.get("Status"));
        }
        // 专业评审组
        if (StringUtils.isNotEmpty(params.get("ProjectGroup"))) {
            sql.append(" and p.GroupZY = " + params.get("ProjectGroup"));
        }
        // 评奖类别
        if (StringUtils.isNotEmpty(params.get("Category"))) {
            sql.append(" and p.Category = " + params.get("Category"));
        }
        // 排序 1 按序号排序 2 按登记号排序
        if (StringUtils.isNotEmpty(params.get("px"))
                && params.get("px").equals("2")) {
            sql.append(" order by p.RegisterNum asc ");

        } else {
            sql.append(" order by p.id asc ");
        }
        return super.paginate(pageNumber, pageSize, sqls, sql.toString());
    }

    // 验证项目登记号是否重复
    public Long RegisterSub(int RegisterNum, String ApplyYear) {
        String sql = "select count(id)  from project where  RegisterNum=? and ApplyYear=?";

        return Db.queryLong(sql, RegisterNum, ApplyYear);
    }

    // 查看项目基本信息
    public List<Project> projectFindId(int id) {
        String sqls = "select p.id,p.RegisterNum,p.ProjectCN,p.RecommendCompany,p.SecretTime,p.ProjectEN,p.PlanFund,"
                + "p.StartTime,p.EndTime,p.FromOther,"
                + "(select Name from set_category sc where sc.id=p.Category) CategoryName,"
                + "(select Name from project_group sg where sg.id=p.GroupZY) GroupName, "
                + "(SELECT GROUP_CONCAT(CompanyName SEPARATOR ';') CompanyName  FROM project_major_company pmc WHERE pmc.ProjectID=p.id) CompanyName,"
                + "(SELECT GROUP_CONCAT(Name  ORDER BY pk.Sort asc SEPARATOR ';') Name  FROM project_key_person pk WHERE pk.ProjectID=p.id) pkName,"
                + "(SELECT GROUP_CONCAT(Name SEPARATOR ';') Name  FROM set_fromtask sf WHERE FIND_IN_SET(sf.id,p.FromTask)) sfName  "
                + "from project p where p.id=? ";
        return find(sqls, id);
    }

    /**
     * 发布或发布到申报平台
     *
     * @param state
     * @return
     */
    public int updateRelease(Map<String, String> param) {
        String sql = "update project set ";
        String where = " where ApplyYear = '"
                + new SimpleDateFormat("yyyy").format(new Date()) + "' ";
        if (StringUtils.isNotEmpty(param.get("send_state"))) {
            sql += " send_state = " + param.get("send_state");
            where += " and state >= 6 ";
        } else {
            sql += " state = " + param.get("state");
            where += " and state = 6 ";
        }
        return Db.update(sql + where);
    }

    /**
     * 导出
     *
     * @return
     */
    public CommonModel exportExcel(Map<String, String> param) {

        CommonModel exportExcel = new CommonModel();

        String[] columns = null;
        String[] heades = null;
        List<Project> pro_List = null;

        String sql = "select @rows := @rows + 1 as rows,k.* from (select p.id, p.ProjectCN, p.RegisterNum,p.recom_results,p.vote_type,p.RecommendCompany,p.ApplyYear "; // sql
        // 字段
        String table_sql = " from project p  "; // 表关联
        String order = " order by p.id asc  "; // 排序
        String where = " where 1=1 and p.Status > 2 and p.ApplyYear = "
                + param.get("year"); // 条件

        String rows = " ) as k,(select   @rows:=0)   as   r ";

        String year = param.get("year");
        // guanli-kejij开头html导出功能 如：05 代表 guanli-kejij05.html
        String html_page = param.get("html_page");

        // 查询条件拼接
        if (StringUtils.isNotEmpty(param.get("ProjectCN"))) // 项目名称
        {
            where += " and p.ProjectCN like '%" + param.get("ProjectCN")
                    + "%' ";
        }
        if (StringUtils.isNotEmpty(param.get("RecommendCompany"))) // 推荐单位
        {
            where += " and p.RecommendCompany like '%"
                    + param.get("RecommendCompany") + "%' ";
        }
        if (StringUtils.isNotEmpty(param.get("group_name"))) // 专家评审组
        {
            where += " and group_name like '%" + param.get("group_name")
                    + "%' ";
        }
        if (StringUtils.isNotEmpty(param.get("major_name"))) // 主要完成单位
        {
            where += " and major_name like '%" + param.get("major_name")
                    + "%' ";
        }
        if (StringUtils.isNotEmpty(param.get("person_name"))) // 主要完成人
        {
            where += " and person_name like '%" + param.get("person_name")
                    + "%' ";
        }
        if (StringUtils.isNotEmpty(param.get("RegisterNum"))) // 登记号
        {
            where += " and RegisterNum like '%" + param.get("RegisterNum")
                    + "%' ";
        }
        if (StringUtils.isNotEmpty(param.get("results"))) // 推荐结果
        {
            where += " and recom_results like '%" + param.get("results")
                    + "%' ";
        }
        if (StringUtils.isNotEmpty(param.get("score"))) // 综评平均分数
        {
            where += " and review_average >= " + param.get("score");
        }

        // 公共sql
        Map<String, CommonModel> map = this.getCurJoin(year);
        switch (html_page) { // 根据不同的页面 增加不同的字段
            case "05":
                columns = new String[]{"rows", "RegisterNum", "ProjectCN",
                        "person_name", "major_name", "RecommendCompany",
                        "category_name", "group_name", "username"};
                heades = new String[]{"序号", "登记号", "项目名称", "主要完成人", "主要完成单位",
                        "推荐单位", "评奖类别", "专业评审组", "专业评审专家组"};
                // 关联专家评审组、专家组姓名
                sql += map.get("designed_evaluation").getTable_columns();
                table_sql += map.get("designed_evaluation").getTable_join();

                // 完成人员
                sql += map.get("key_person").getTable_columns();
                table_sql += map.get("key_person").getTable_join();

                // 完成单位
                sql += map.get("major_company").getTable_columns();
                table_sql += map.get("major_company").getTable_join();

                // 评奖类别
                sql += map.get("category").getTable_columns();
                table_sql += map.get("category").getTable_join();

                exportExcel.setSheetName(year + "专业评审项目表");

                break;
            case "06":
                columns = new String[]{"rows", "RegisterNum", "ProjectCN",
                        "RecommendCompany", "review_average", "review_recommend",
                        "review_prize", "review_count", "recommend_prop",
                        "prize_prop", "group_name", "recom_resultsName"};
                heades = new String[]{"序号", "登记号", "项目名称", "推荐单位", "专业评审平均分",
                        "推荐票数", "推荐一等奖票数", "专业组专家人数", "推荐票数/专家比例(%)",
                        "一等奖票数/专家比例(%)", "专业组名称", "推荐结果"};

                // 专评组名称
                sql += map.get("group").getTable_columns();
                table_sql += map.get("group").getTable_join();

                // 评奖设置
                sql += map.get("prize").getTable_columns();
                table_sql += map.get("prize").getTable_join();

                // 专评组平均分
                sql += map.get("designed_statis").getTable_columns();
                sql += " ,cast((tm_re.review_recommend/tm_re.review_count)*100  as decimal(11,2)) as recommend_prop,cast((tm_re.review_prize/tm_re.review_count)*100  as decimal(11,2)) as prize_prop,"
                        + "case "
                        + "when p.recom_results = 1 then '推荐一等奖' "
                        + "when p.recom_results = 2 then '推荐'"
                        + "else '无' end as recom_resultsName  ";
                table_sql += map.get("designed_statis").getTable_join();

                where += " and p.state >= 1 ";

                order = " order by (tm_re.review_score / tm_re.review_count) desc ";

                exportExcel.setSheetName(year + "专业评审结果汇总表");

                break;
            case "07":

                columns = new String[]{"rows", "RegisterNum", "ProjectCN",
                        "person_name", "major_name", "RecommendCompany",
                        "review_average", "group_name", "judged_name"};
                heades = new String[]{"序号", "登记号", "项目名称", "主要完成人", "主要完成单位",
                        "推荐单位", "专评平均分", "所属专业组", "综评专家"};

                // 完成人员
                sql += map.get("key_person").getTable_columns();
                table_sql += map.get("key_person").getTable_join();

                // 完成单位
                sql += map.get("major_company").getTable_columns();
                table_sql += map.get("major_company").getTable_join();

                // 专评组名称
                sql += map.get("group").getTable_columns();
                table_sql += map.get("group").getTable_join();

                // 评奖设置
                sql += map.get("prize").getTable_columns();
                table_sql += map.get("prize").getTable_join();

                // 专评组平均分
                sql += map.get("designed_statis").getTable_columns();
                table_sql += map.get("designed_statis").getTable_join();

                // 综评专评姓名
                sql += map.get("judged_evaluation").getTable_columns();
                table_sql += map.get("judged_evaluation").getTable_join();

                where += " and p.recom_results is not null and p.recom_results <> ''  ";

                exportExcel.setSheetName(year + "专业评审推荐项目汇总表");

                break;
            case "08":

                columns = new String[]{"rows", "RegisterNum", "ProjectCN",
                        "judged_average"};
                heades = new String[]{"序号", "登记号", "项目名称", "综评平均分"};

                // 评奖设置
                sql += map.get("prize").getTable_columns();
                table_sql += map.get("prize").getTable_join();

                // 综评平均分
                sql += map.get("judged_statis").getTable_columns();
                table_sql += map.get("judged_statis").getTable_join();

                where += " and p.state >= 2 ";

                order = " order by (tm_rg.judged_score / tm_rg.judged_count) desc  ";

                exportExcel.setSheetName(year + "综合评审总分排序表");

                break;
            case "09":

                columns = new String[]{"rows", "RegisterNum", "ProjectCN",
                        "judged_average", "recom_resultsName", "vote_typeName",
                        "vote_name"};
                heades = new String[]{"序号", "登记号", "项目名称", "综评平均分", "专评结果",
                        "投票类别", "直接进入获奖项目列表"};

                // 评奖设置
                sql += map.get("prize").getTable_columns();
                table_sql += map.get("prize").getTable_join();

                // 综评平均分
                sql += map.get("judged_statis").getTable_columns();
                table_sql += map.get("judged_statis").getTable_join();

                sql += " , case " + " when p.vote_type = 1 then '特等奖' "
                        + " when p.vote_type = 2 then '一等奖' "
                        + " when p.vote_type = 3 then '二等奖' "
                        + " when p.vote_type = 4 then '三等奖' "
                        + " else '无' end as vote_typeName" + " , case "
                        + " when p.vote_type = 5 then '特等奖' "
                        + " when p.vote_type = 6 then '一等奖' "
                        + " when p.vote_type = 7 then '二等奖' "
                        + " when p.vote_type = 8 then '三等奖' "
                        + "  else '无' end as vote_name" + " , case "
                        + "when p.recom_results = 1 then '推荐一等奖' "
                        + "when p.recom_results = 2 then '推荐'"
                        + "else '无' end as recom_resultsName  ";

                where += " and p.state >= 3 ";

                order = " order by (tm_rg.judged_score / tm_rg.judged_count) desc  ";

                exportExcel.setSheetName(year + "投票类别分配表");

                break;
            case "10":

                columns = new String[]{"rows", "RegisterNum", "ProjectCN",
                        "judged_count", "review_agreed", "review_notAgreed"};
                heades = new String[]{"序号", "登记号", "项目名称", "专家人数", "同意票数",
                        "不同意票数"};

                // 评奖设置
                sql += map.get("prize").getTable_columns();
                table_sql += map.get("prize").getTable_join();

                // 综评平均分 投票
                sql += map.get("judged_statis_tp").getTable_columns();
                table_sql += map.get("judged_statis_tp").getTable_join();

                where += " and p.state >= 5 and p.vote_type <= 4 ";

                order = " order by review_agreed desc  ";

                exportExcel.setSheetName(year + "票数统计表");

                break;
            case "11":

                columns = new String[]{"rows", "RegisterNum", "ProjectCN",
                        "major_name", "person_name", "RecommendCompany", "award"};
                heades = new String[]{"序号", "登记号", "项目名称", "主要完成单位", "主要完成人",
                        "推荐单位", "获奖奖项"};

                // 完成人员
                sql += map.get("key_person").getTable_columns();
                table_sql += map.get("key_person").getTable_join();

                // 完成单位
                sql += map.get("major_company").getTable_columns();
                table_sql += map.get("major_company").getTable_join();

                // 评奖设置
                sql += map.get("prize").getTable_columns();
                table_sql += map.get("prize").getTable_join();

                // 综评平均分 投票
                sql += map.get("judged_statis_tp").getTable_columns();
                table_sql += map.get("judged_statis_tp").getTable_join();
                sql += " ,case "
                        + " when ((p.vote_type = 1 and tm_rg.review_agreed >= tm_rg.judged_count/3*2) ) or p.vote_type = 5  then '特等奖' "
                        + " when (((p.vote_type = 2 and tm_rg.review_agreed >= tm_rg.judged_count/3*2) or (p.vote_type = 1 and tm_rg.review_agreed < tm_rg.judged_count/3*2)) ) or p.vote_type = 6  then '一等奖' "
                        + " when (((p.vote_type = 3 and tm_rg.review_agreed >= tm_rg.judged_count/3*2) or (p.vote_type = 2 and tm_rg.review_agreed < tm_rg.judged_count/3*2)) ) or p.vote_type = 7  then '二等奖' "
                        + " when (((p.vote_type = 4 and tm_rg.review_agreed >= tm_rg.judged_count/3*2) or (p.vote_type = 3 and tm_rg.review_agreed < tm_rg.judged_count/3*2)) ) or p.vote_type = 8 then '三等奖' "
                        + " else '未得奖' end as award ";

                where += " and p.state >= 6  ";
                order = "order by trg.agreed_trg desc,trg.score_trg desc";
                exportExcel.setSheetName(year + "获奖项目列表");

                break;
        }

        pro_List = find(sql + table_sql + where + order + rows);

        // 文件名
        exportExcel.setFileName("project_" + year + ".xls");

        exportExcel.setColumns(columns);
        exportExcel.setHeades(heades);
        exportExcel.setList(pro_List);

        return exportExcel;
    }

    public CommonModel exportExcel1(Map<String, String> param) {
        CommonModel exportExcel = new CommonModel();
        String year = param.get("year");
        String[] columns = null;
        String[] heades = null;
        List<Project> pro_List = null;
        columns = new String[]{"rows", "RegisterNum", "ProjectCN",
                "major_name", "person_name", "RecommendCompany", "award"};
        heades = new String[]{"序号", "登记号", "项目名称", "主要完成单位", "主要完成人",
                "推荐单位", "获奖奖项"};
        exportExcel.setSheetName(year + "获奖项目列表");
        pro_List = find(getSQLByPArams(param));
        // 文件名
        exportExcel.setFileName("project_" + year + ".xls");
        exportExcel.setColumns(columns);
        exportExcel.setHeades(heades);
        exportExcel.setList(pro_List);
        return exportExcel;

    }

    public String getSQLByPArams(Map params) {

        String sql = "select  @rows := @rows + 1 as rows,ggg.* from (select p.id , p.GroupZY, p.ProjectCN, p.RegisterNum,p.RecommendCompany,p.ApplyYear, sc.Name Category_name,g.id as group_id,g.name as group_name, " // 此处为专业组
                + "tk.person_name as person_name,tm.major_name as major_name,p.recom_results,p.state,p.vote_type,"
                + "(select group_concat(Name) as groupZH_Name from expert where find_in_set(id,p.groupZH_person)) as groupZH_Name,"
                + "(select Name as groupZY_Name from project_group where p.GroupZY=id) as groupZY_Name,"
                + // 显示已选择的专家
                "p.groupZH_person,p.groupZH ";
        StringBuffer sqlStr = new StringBuffer();
        sqlStr.append(" from project p ");
        sqlStr.append(" left join set_category sc on sc.id=p.Category ");
        sqlStr.append(" left join set_prize sp on sp.PrizeYear = p.ApplyYear   "); // 去掉sp.Status
        // =
        // 1
        // 评审开启结束状态
        sqlStr.append(" left join set_group g on g.id=p.Group ");
        sqlStr.append(" left join (select group_concat(k.Name) as person_name,k.ProjectID from (select * from  project_key_person ORDER BY ProjectID desc,Sort asc) k group by k.ProjectID) tk on tk.ProjectID = p.id ");
        sqlStr.append(" left join (select group_concat(m.CompanyName ORDER BY Sort asc SEPARATOR ';') as major_name,m.ProjectID from project_major_company m group by m.ProjectID) tm on tm.ProjectID = p.id ");
        sql += ", trg.* ";
        sql += " ,case "
                + " when ((p.vote_type = 1 and trg.agreed_trg >= trg.person_trg/3*2) ) or p.vote_type = 5 then '特等奖' "
                + " when (((p.vote_type = 2 and trg.agreed_trg >= trg.person_trg/3*2) or (p.vote_type = 1 and trg.agreed_trg < trg.person_trg/3*2))  ) or p.vote_type = 6  then '一等奖' "
                + " when (((p.vote_type = 3 and trg.agreed_trg >= trg.person_trg/3*2) or (p.vote_type = 2 and trg.agreed_trg < trg.person_trg/3*2))  ) or p.vote_type = 7  then '二等奖' "
                + " when (((p.vote_type = 4 and trg.agreed_trg >= trg.person_trg/3*2) or (p.vote_type = 3 and trg.agreed_trg < trg.person_trg/3*2)) ) or p.vote_type = 8  then '三等奖' "
                + " else '未得奖' end as award ";
        sql += ",case when p.WinningType=3 then score_trg   else trg.agreed_trg  end as px,case when p.WinningType=3 then trg.score_trg   else 0 end as px1 ";

        sqlStr.append(" left join (select r.projectID,count(r.id) as person_trg, ");
        sqlStr.append(" sum(case when r.status =2 then r.score else 0 end ) as score_trg, sum(case when r.status =2 then r.score else 0 end )/count(r.id) as average, ");
        sqlStr.append(" sum(case when r.statusTp =2 and r.vote = 1 then 1 else 0 end) as agreed_trg ");
        sqlStr.append(" from project_review_gather r where r.status =2  group by r.projectID) trg on trg.projectID = p.id  "); // r.statusTp
        sqlStr.append(" where 1=1  ");
        // 评奖状态
        sqlStr.append(" and p.Status > 1 "); // 形式审查结果通过的状态 都可以算分数 p.Status = 2

        // 申报年份
        if (null != params.get("ApplyYear")
                && !"".equals(params.get("ApplyYear"))
                && !"null".equals(params.get("ApplyYear"))) {
            sqlStr.append(" and p.ApplyYear = '" + params.get("ApplyYear")
                    + "' ");
        }
        // 项目名称
        if (null != params.get("ProjectCN")
                && !"".equals(params.get("ProjectCN"))
                && !"null".equals(params.get("ProjectCN"))) {
            sqlStr.append(" and p.ProjectCN like '%" + params.get("ProjectCN")
                    + "%' ");
        }
        // 推荐单位
        if (null != params.get("RecommendCompany")
                && !"".equals(params.get("RecommendCompany"))
                && !"null".equals(params.get("RecommendCompany"))) {
            sqlStr.append(" and p.RecommendCompany like '%"
                    + params.get("RecommendCompany") + "%' ");
        }
        // 专业评审组
        if (null != params.get("group_name")
                && !"".equals(params.get("group_name"))
                && !"null".equals(params.get("group_name"))) {
            sqlStr.append(" and g.name like '%" + params.get("group_name")
                    + "%' ");
        }
        // 完成人员
        if (null != params.get("person_name")
                && !"".equals(params.get("person_name"))
                && !"null".equals(params.get("person_name"))) {
            sqlStr.append(" and tk.person_name like '%"
                    + params.get("person_name") + "%' ");
        }
        // 完成单位
        if (null != params.get("major_name")
                && !"".equals(params.get("major_name"))
                && !"null".equals(params.get("major_name"))) {
            sqlStr.append(" and tm.major_name like '%"
                    + params.get("major_name") + "%' ");
        }
        // 序号
        if (null != params.get("id") && !"".equals(params.get("id"))
                && !"null".equals(params.get("id"))) {
            sqlStr.append(" and p.id like '" + params.get("id") + "%' ");
        }
        // 登记号
        if (null != params.get("RegisterNum")
                && !"".equals(params.get("RegisterNum"))
                && !"null".equals(params.get("RegisterNum"))) {
            sqlStr.append(" and p.RegisterNum like '"
                    + params.get("RegisterNum") + "%' ");
        }
        // 专业评审组
        if (null != params.get("GroupZY")
                && !"".equals(params.get("GroupZY"))
                && !"null".equals(params.get("GroupZY"))) {
            sqlStr.append(" and p.GroupZY = "
                    + params.get("GroupZY"));
        }
        sqlStr.append(" and (p.state >= 6 or (p.vote_type >= 5 and p.state = 5)) ");

        sqlStr.append(" order by p.Status asc,p.WinningType asc,px desc,px1 desc,trg.average desc ");
        sqlStr.append(" ) as ggg,(select   @rows:=0)   as   r where ggg.award!='未得奖' ");

        return sql + sqlStr.toString();
    }


    public Long findProjectByGroupId(int GroupId) {
        String sqlString = "select count(*) from project p  where p.Group =" + GroupId;
        return Db.queryLong(sqlString);
    }

    public Long findProjectByGroupZHId(int GroupId) {
        String sqlString = "select count(*) from project p  where p.GroupZH =" + GroupId;
        return Db.queryLong(sqlString);
    }


    /**
     * 关联sql
     */
    private Map<String, CommonModel> getCurJoin(String year) {

        Map<String, CommonModel> map = new HashMap<String, CommonModel>();
        // 关联专家评审组或综评专家评审组、专家组姓名
        map.put("designed_evaluation",
                new CommonModel(
                        " ,tm_g.group_name,tm_g.username  ",
                        " left join (select g.id as group_id,g.name as group_name,group_concat(e.username) as username"
                                + " from set_group g "
                                + " left join set_expertgroup eg on eg.group_id = g.id"
                                + " left join expert e on e.id = eg.expert_id"
                                + " where g.Type = 1 and Group_Year = '"
                                + year
                                + "'"
                                + " group by g.name,g.id) tm_g on tm_g.group_id = p.Group "));

        // 综评专家组姓名
        map.put("judged_evaluation",
                new CommonModel(
                        " ,tm_j.judged_name ",
                        " left join (select group_concat(e.username) as judged_name,g.ProjectID from project_review_gather g "
                                + "left join expert e on e.id = g.expertID group by g.ProjectID) tm_j on tm_j.ProjectID = p.id "));

        // 专家组名称
        map.put("group", new CommonModel(" ,g.name as group_name",
                " left join set_group g on g.id=p.Group "));

        // 完成人员
        map.put("key_person",
                new CommonModel(
                        " ,tm_k.person_name ",
                        " left join (select group_concat(k.Name) as person_name,k.ProjectID from project_key_person k "
                                + " group by k.ProjectID) tm_k on tm_k.ProjectID = p.id "));

        // 完成单位
        map.put("major_company",
                new CommonModel(
                        " ,tm_m.major_name ",
                        " left join (select group_concat(m.CompanyName) as major_name,m.ProjectID from project_major_company m "
                                + "group by m.ProjectID) tm_m on tm_m.ProjectID = p.id "));

        // 评奖类别
        map.put("category",
                new CommonModel(" ,sc.name as category_name ",
                        " left join set_category sc on sc.id = p.Category and sc.Status = 1 "));

        // 专评
        map.put("designed_statis",
                new CommonModel(
                        " ,tm_re.review_count,tm_re.review_score,tm_re.review_recommend,"
                                + "tm_re.review_prize,"
                                + "case "
                                + " when sp.Professional = 1 then cast((tm_re.review_score / tm_re.review_count) as decimal(11,2)) "
                                + " when sp.Professional = 0 then cast(((tm_re.review_score - tm_re.maxScore - tm_re.minScore) / tm_re.review_count) as decimal(11,2)) "
                                + " else cast((tm_re.review_score / tm_re.review_count) as decimal(11,2)) end as review_average ",
                        " left join (select r.projectID,count(r.id) as review_count,"
                                + "sum(case when r.status =2 then r.score else 0 end ) as review_score,"
                                + "sum(case when r.status =2 and r.recommend = 1 then 1 else 0 end) as review_recommend,"
                                + "sum(case when r.status =2 and r.prize = 1 then 1 else 0 end) as review_prize,"
                                + "min(case when r.status =2 then r.score else 0 end) as minScore,"
                                + "max(case when r.status =2 then r.score else 0 end) as maxScore "
                                + "from project_review r where r.status =2 group by r.projectID) tm_re on tm_re.projectID = p.id "));
        // 综评
        map.put("judged_statis",
                new CommonModel(
                        " ,tm_rg.judged_count,tm_rg.judged_score,tm_rg.review_agreed,"
                                + "(tm_rg.judged_count-tm_rg.review_agreed) as review_notAgreed,"
                                + "case "
                                + " when sp.Composite = 1 then cast((tm_rg.judged_score / tm_rg.judged_count) as decimal(11,2)) "
                                + " when sp.Composite = 0 then cast(((tm_rg.judged_score - tm_rg.maxScore - tm_rg.minScore) / tm_rg.judged_count) as decimal(11,2)) "
                                + " else cast((tm_rg.judged_score / tm_rg.judged_count) as decimal(11,2)) end as judged_average ",
                        " left join (select r.projectID,count(r.id) as judged_count,r.status as zpStatus , r.statusTp ,"
                                + "sum(case when r.status =2 then r.score else 0 end ) as judged_score,"
                                + "sum(case when r.statusTp =2 and r.vote = 1 then 1 else 0 end) as review_agreed,"
                                + "min(case when r.status =2 then r.score else 0 end) as minScore,"
                                + "max(case when r.status =2 then r.score else 0 end) as maxScore "
                                + "from project_review_gather r where r.status =2 group by r.projectID) tm_rg on tm_rg.projectID = p.id ")); // r.statusTp
        // =2投票已经提交了
        // 说明宗评也就早提交了

        // 投票
        map.put("judged_statis_tp",
                new CommonModel(
                        " ,tm_rg.judged_count,tm_rg.judged_score,tm_rg.review_agreed,"
                                + "(tm_rg.judged_count-tm_rg.review_agreed) as review_notAgreed,"
                                + "case "
                                + " when sp.Composite = 1 then cast((tm_rg.judged_score / tm_rg.judged_count) as decimal(11,2)) "
                                + " when sp.Composite = 0 then cast(((tm_rg.judged_score - tm_rg.maxScore - tm_rg.minScore) / tm_rg.judged_count) as decimal(11,2)) "
                                + " else cast((tm_rg.judged_score / tm_rg.judged_count) as decimal(11,2)) end as judged_average ",
                        " left join (select r.projectID,count(r.id) as judged_count,r.status as zpStatus , r.statusTp ,"
                                + "sum(case when r.status =2 then r.score else 0 end ) as judged_score,"
                                + "sum(case when r.statusTp =2 and r.vote = 1 then 1 else 0 end) as review_agreed,"
                                + "min(case when r.status =2 then r.score else 0 end) as minScore,"
                                + "max(case when r.status =2 then r.score else 0 end) as maxScore "
                                + "from project_review_gather r where r.statusTp =2 group by r.projectID) tm_rg on tm_rg.projectID = p.id ")); // r.statusTp
        // =2投票已经提交了
        // 说明宗评也就早提交了

        // 评奖设置
        map.put("prize",
                new CommonModel(
                        " ,sp.Grandest,sp.One,sp.Two,sp.Three,sp.Professional,sp.Composite,"
                                + "sp.GrandestVote,sp.OneVote,sp.TwoVote,sp.ThreeVote ",
                        " left join set_prize sp on sp.PrizeYear = p.ApplyYear "));// and
        // sp.Status
        // =
        // 1

        return map;
    }


    /**
     * 查询 申报资料导出项目列表
     */
    public List<Project> findZip(Map params) {
        String sql = "select p.id,p.ProjectCN,c.CompanyName,c.Username ";
        StringBuffer sqlStr = new StringBuffer();
        sqlStr.append(" from project p left join company c on p.CompanyID=c.id   where 1=1 and p.Status!=0 ");

        // 项目名称
        if (null != params.get("ProjectCN")
                && !"".equals(params.get("ProjectCN"))
                && !"null".equals(params.get("ProjectCN"))) {

            sqlStr.append(" and p.ProjectCN like '%" + params.get("ProjectCN")
                    + "%' ");
        }
        // 年份
        if (null != params.get("ApplyYear")
                && !"".equals(params.get("ApplyYear"))
                && !"null".equals(params.get("ApplyYear"))) {
            sqlStr.append(" and p.ApplyYear = " + params.get("ApplyYear") + " ");
        }

        // 单位名称
        if (StringUtils.isNotEmpty(params.get("CompanyName"))) {
            sqlStr.append(" and c.CompanyName  like '%"
                    + params.get("CompanyName") + "%'");
        }
        // 申报人
        if (StringUtils.isNotEmpty(params.get("CompanyUserName"))) {
            sqlStr.append(" and c.Username  like '%"
                    + params.get("CompanyUserName") + "%'");
        }
        sqlStr.append(" order by p.id asc");
        return find(sql + sqlStr.toString());
    }

}
