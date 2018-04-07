package com.ccoa.admin.set;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.ccoa.project.CommonModel;
import com.ccoa.project.Project;
import com.ccoa.projectreview.ProjectReview;
import com.ccoa.projectreview.ProjectReviewZH;
import com.ccoa.utils.StringUtils;
import com.jfinal.aop.Before;
import com.jfinal.ext.render.excel.PoiRender;

/**
 * 专业评审项目控制层
 */
@Before(AdminUserInterceptor.class)
public class ProfeProjectController extends BaseController {

	private static Logger log = Logger.getLogger(ProfeProjectController.class);

	public void index() {

	}

	/**
	 * 专业项目评审项目表
	 */
	public void project() {
		String cur_year = new SimpleDateFormat("yyyy").format(new Date());
		Map<String, String> queryParam = getQueryParam();
		if (!queryParam.containsKey("ApplyYear")) {
			queryParam.put("ApplyYear", cur_year);
		}
		setAttr("projectPage", Project.me.paging(getParaToInt("pageNumber", 1),
				Constants.PAGE_SIZE, queryParam, 1));
		setAttr("queryParam", queryParam);

		setAttr("cur_year", cur_year);
		setAttr("years", Project.me.years(Integer.parseInt(cur_year)));

		Group group = new Group();
		group.set("Group_Year", cur_year);
		group.set("Type", "1");
		setAttr("groupList", Group.me.findList(group));
		setAttr("groupList1", ProjectGroup.me.findAll());
		render("guanli-kejij05.html");
	}

	/**
	 * 分配专业评审专家组
	 */
	public void choose() {
		try {
			Project project = getModel(Project.class);
			String ids="";
			if(project!=null){
				String group_id = getPara("group_id");
				//String groupId = project.get("Group");
				project.set("Group", group_id);
				List<GroupExpert> groupExpertList = GroupExpert.me.paginate(Integer.parseInt(group_id));
				for (GroupExpert groupExpert : groupExpertList) {
					ids = ids +","+groupExpert.getInt("expert_id").toString();
				}
			}
			if(!"".equals(ids)&&ids!=""){
				ids=ids.substring(1, ids.length());
			}
			project.set("GroupExpertIDs",ids);
			project.update();
			renderJson("success", true);
		} catch (Exception e) {
			log.error("分配专业评审专家组失败", e);
			renderJson("success", false);
		}
	}

	/**
	 * 发送
	 */
	public void send() {
		try {
			Map<String, String> queryParam = getQueryParam();

			boolean flg = true;

			if ("4".equals(queryParam.get("state"))|| "5".equals(queryParam.get("state"))) {// //4、投票类型分配表保存																// 5、投票类型分配表发送
				if (null != queryParam.get("vote_type")&& !"".equals(queryParam.get("vote_type"))&& !"null".equals(queryParam.get("vote_type"))) {
					flg = Project.me.updateVoteType(queryParam.get("vote_type"));
				}
			}
			if ("1".equals(queryParam.get("flg"))) {
				//去掉没选项判断
				//flg = Project.me.sendCount(queryParam);
				//提交后修改状态，5特等奖，6一等奖，7二等奖，8三等奖，9未等奖
				if (null != queryParam.get("vote_type")
						&& !"".equals(queryParam.get("vote_type"))
						&& !"null".equals(queryParam.get("vote_type"))) {
					Project.me.updateStatusVoteType(queryParam.get("vote_type"));
				}
			}

			if (flg) {

				Project.me.updateSend(queryParam.get("state"));
			}

			renderJson("success", flg);
		} catch (Exception e) {

			log.error("发送失败", e);
			renderJson("success", false);
		}

	}

	/**
	 * 专业项目评审结果汇总表
	 */
	public void results() {

		String cur_year = new SimpleDateFormat("yyyy").format(new Date());
		Map<String, String> queryParam = getQueryParam();
		if (!queryParam.containsKey("ApplyYear")) {
			queryParam.put("ApplyYear", cur_year);
		}
		setAttr("projectPage", Project.me.pagingResults(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, queryParam));
		setAttr("queryParam", queryParam);
		setAttr("years", Project.me.years(Integer.parseInt(cur_year)));
         setAttr("groupList", ProjectGroup.me.findAll());
		render("guanli-kejij06.html");
	}

	/**
	 * 推荐结果
	 */
	public void recomResults() {

		try {
			Project pro = getModel(Project.class);
			pro.update();

			renderJson("success", true);
		} catch (Exception e) {

			log.error("推荐结果失败", e);
			renderJson("success", false);
		}
	}

	/**
	 * 显示各专家评分情况列表
	 */
	public void average() {

		String htmlText = ProjectReview.dao.findAverage(getPara("id"),
				getPara("Status"));
		renderHtml(htmlText);
	}

	/**
	 * 专业项目评审推荐项目汇总表
	 */
	public void recomm() {

		String cur_year = new SimpleDateFormat("yyyy").format(new Date());
		Map<String, String> queryParam = getQueryParam();
		if (!queryParam.containsKey("ApplyYear")) {
			queryParam.put("ApplyYear", cur_year);
		}
		setAttr("projectPage", Project.me.paging(getParaToInt("pageNumber", 1),
				Constants.PAGE_SIZE, queryParam, 2));
		setAttr("queryParam", queryParam);

		setAttr("cur_year", cur_year);
		setAttr("years", Project.me.years(Integer.parseInt(cur_year)));

		// 综评专家信息
		String htmlText = Group.me.findGroupPerson(cur_year);
		setAttr("htmlText", htmlText);

		render("guanli-kejij07.html");
	}

	/**
	 * 修改综评专家
	 */
	public void distJudgedExperts() {

		try {

			Project pro = getModel(Project.class);
			pro.update();

			renderJson("success", true);

		} catch (Exception e) {
			log.error("修改综评专家失败", e);
			renderJson("success", false);
		}

	}

	/**
	 * 退回到专业评审结果汇总表
	 */
	public void recommBack() {

		try {
			Project pro = getModel(Project.class);
			pro.update();

			renderJson("success", true);
		} catch (Exception e) {

			log.error("退回到专业评审结果汇总表失败", e);
			renderJson("success", false);
		}
	}

	/**
	 * 专业项目评审总分排序表
	 */
	public void total() {

		String cur_year = new SimpleDateFormat("yyyy").format(new Date());
		Map<String, String> queryParam = getQueryParam();
		if (!queryParam.containsKey("ApplyYear")) {
			queryParam.put("ApplyYear", cur_year);
		}
		setAttr("projectPage", Project.me.pagingTotal(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, queryParam));
		setAttr("queryParam", queryParam);

		setAttr("years", Project.me.years(Integer.parseInt(cur_year)));

		render("guanli-kejij08.html");
	}

	/**
	 * 各专家对该项目各项指标的评分情况
	 */
	public void totalSort() {

		String htmlText = ProjectReviewZH.dao.findTotalSort(getPara("id"),
				getPara("Status"));
		renderHtml(htmlText);
	}

	/**
	 * 投票类型分配表
	 */
	public void type() {

		String cur_year = new SimpleDateFormat("yyyy").format(new Date());
		Map<String, String> queryParam = getQueryParam();
		if (!queryParam.containsKey("ApplyYear")) {
			queryParam.put("ApplyYear", cur_year);
		}
		setAttr("projectPage", Project.me.pagingTotal(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, queryParam));
		setAttr("queryParam", queryParam);
		setAttr("cur_year", cur_year);

		setAttr("years", Project.me.years(Integer.parseInt(cur_year)));

		render("guanli-kejij09.html");
	}

	/**
	 * 票数统计表
	 */
	public void statis() {

		String cur_year = new SimpleDateFormat("yyyy").format(new Date());
		Map<String, String> queryParam = getQueryParam();
		if (!queryParam.containsKey("ApplyYear")) {
			queryParam.put("ApplyYear", cur_year);
		}
		setAttr("projectPage", Project.me.pagingStatis(
				getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, queryParam));
		setAttr("queryParam", queryParam);

		setAttr("years", Project.me.years(Integer.parseInt(cur_year)));

		render("guanli-kejij10.html");
	}

	/**
	 * 获奖项目列表
	 */
	public void winning() {

		String cur_year = new SimpleDateFormat("yyyy").format(new Date());
		Map<String, String> queryParam = getQueryParam();
		if (!queryParam.containsKey("ApplyYear")) {
			queryParam.put("ApplyYear", cur_year);
		}
		setAttr("projectPage", Project.me.paging(getParaToInt("pageNumber", 1),
				Constants.PAGE_SIZE, queryParam, 3));
		setAttr("queryParam", queryParam);

		setAttr("cur_year", cur_year);
		setAttr("years", Project.me.years(Integer.parseInt(cur_year)));

		render("guanli-kejij11.html");
	}

	/**
	 * 发布或发布到申报平台
	 */
	public void release() {
		try {
			Map<String, String> queryParam = getQueryParam();

			Project.me.updateRelease(queryParam);

			String cur_year = new SimpleDateFormat("yyyy").format(new Date());
			if (!queryParam.containsKey("ApplyYear")) {
				queryParam.put("ApplyYear", cur_year);
			}
			List<Project> proList = Project.me.paging(getParaToInt(0, 1), 500,
					queryParam, 3).getList();

			// 把获奖结果 发布到申报平台 state=7
			if ("7".equals(queryParam.get("state"))) {
				if (proList.size() > 0) {
					for (int i = 0; i < proList.size(); i++) {
						// 修改项目获奖结果字段
						Project p = (Project) proList.get(i);

						Project ps = Project.me.findById(p.get("id"));
						ps.set("winning_results", p.get("award")).update(); // 修改获奖结果
					}
				}

			} else // 发布到首页
			{
				if (proList != null && proList.size() > 0) { // 得到获奖的项目List
					List<Project> resList = new ArrayList<Project>();
					int one = 0, two = 0, three = 0;
					for (Project project : proList) {
						String award = project.getStr("award");// 取获取获奖奖项
						String[] major_name = StringUtils.isNotEmpty(project
								.getStr("major_name")) ? project.getStr(
								"major_name").split(",") : new String[0];// 单位
						/*if ("特等奖".equals(award)) {

							resList.add(project);
						} else if (one <= 12 && "一等奖".equals(award)
								&& major_name.length <= 7) {// 一等奖单项授奖人数不超过12人
															// 单位不超过7个
							resList.add(project);
							one++;
						} else if (two <= 9 && "二等奖".equals(award)
								&& major_name.length <= 5) {// 一等奖单项授奖人数不超过9人
															// 单位不超过5个
							resList.add(project);
							two++;
						} else if (three <= 6 && "三等奖".equals(award)
								&& major_name.length <= 3) {// 一等奖单项授奖人数不超过6人
															// 单位不超过3个
							resList.add(project);
							three++;
						}*/
								
								if ("特等奖".equals(award)) {

									resList.add(project);
								} else if ("一等奖".equals(award)) {														
									resList.add(project);
									one++;
								} else if ("二等奖".equals(award)) {
									resList.add(project);
									two++;
								} else if ("三等奖".equals(award)) {
									resList.add(project);
									three++;
								}
								
								
					}
					proList = resList;
				}
				// 再把得奖项目列表 写入到获奖名单中
				if (proList.size() > 0) {
					// 先查看本年度是否已经存在父内容 获奖名单说明
					List iList = WinningList.me.selectId();
					int id;
					if (iList.size() > 0
							&& ((WinningList) iList.get(0)).getInt("id") != null) {
						WinningList ids = (WinningList) iList.get(0);
						id = ids.getInt("id");
					} else {
						// 先插入父获奖名单说明
						WinningList wl = new WinningList();
						wl.set("winYear", cur_year); // 默认当前年份
						wl.set("type", "1"); // 默认父内容 表示获奖名单描述
						wl.set("status", "1"); // 默认已发布
						wl.set("winName", cur_year + "年项目获奖名单"); // 默认已发布
						wl.save();
						// 获取刚插入父内容的id
						List iList1 = WinningList.me.selectId();
						WinningList ids = (WinningList) iList1.get(0);
						id = ids.getInt("id");
					}

					for (int k = 0; k < proList.size(); k++) {
						Project p = (Project) proList.get(k);
						WinningList winning = new WinningList(); // 获奖项目列表对象
						winning.set("registerNum", p.get("RegisterNum"));
						winning.set("projectCN", p.get("ProjectCN"));
						winning.set("majorCompany", p.get("major_name"));
						winning.set("keyPerson", p.get("person_name"));
						winning.set("recommendCompany",
								p.get("RecommendCompany"));
						winning.set("winning", p.get("award"));
						winning.set("parentID", id);
						winning.set("type", "2"); // 表示子内容

						// 如果导入的文件中 登记号为空 就不验证 是否新增修改 直接新增
						if (StringUtils.isNotEmpty(winning.get("registerNum"))) {
							/*List ids = WinningList.me.isExist(id, Integer
									.parseInt(winning.get("registerNum")
											.toString()));
							// 再根据 登记号 查询该内容是否存在 如果存在就修改 不存在就新增
							if (ids.size() > 0)// 表示存在
							{

								winning.set("id", ids.get(0)); // 根据查出来的ID进行修改
								winning.update();
							} else// 表示新增
							{
								winning.save();
							}*/
							WinningList.me.delete(id, Integer.parseInt(winning.get("registerNum").toString()));
							winning.save();							
						} else // 登记号为空 提示 不允许导入
						{
						}
					}

				}

			}
			renderJson("success", true);
		} catch (Exception e) {

			log.error("发布失败", e);
			renderJson("success", false);
		}

	}

	/**
	 * 导出Excel
	 */
	public void exportExcel() {

		getResponse().setCharacterEncoding("UTF-8");

		Map<String, String> param = getQueryParam();
		CommonModel excel = Project.me.exportExcel1(param);

		List<Project> list = excel.getList();
		if ("11".equals(param.get("html_page"))) {// 获奖项目名单支持导出功能
			if (list != null && list.size() > 0) {
				List<Project> resList = new ArrayList<Project>();
				int one = 0, two = 0, three = 0;
				for (Project project : list) {
					String award = project.getStr("award");// 取获取获奖奖项
					String[] major_name = StringUtils.isNotEmpty(project
							.getStr("major_name")) ? project.getStr(
							"major_name").split(",") : new String[0];// 单位				
					/*if ("特等奖".equals(award)) {

						resList.add(project);
					} else if (one <= 12 && "一等奖".equals(award)
							&& major_name.length <= 7) {// 一等奖单项授奖人数不超过12人
														// 单位不超过7个
						resList.add(project);
						one++;
					} else if (two <= 9 && "二等奖".equals(award)
							&& major_name.length <= 5) {// 二等奖单项授奖人数不超过9人
														// 单位不超过5个
						resList.add(project);
						two++;
					} else if (three <= 6 && "三等奖".equals(award)
							&& major_name.length <= 3) {// 三等奖单项授奖人数不超过6人
														// 单位不超过3个
						resList.add(project);
						three++;
					}*/
					
					if ("特等奖".equals(award)) {

						resList.add(project);
					} else if ("一等奖".equals(award)) {														
						resList.add(project);
						one++;
					} else if ("二等奖".equals(award)) {
						resList.add(project);
						two++;
					} else if ("三等奖".equals(award)) {
						resList.add(project);
						three++;
					}
					
				}
				list = resList;
			}
		}

		render(PoiRender.me(list).fileName(excel.getFileName())
				.sheetName(excel.getSheetName()).headers(excel.getHeades())
				.columns(excel.getColumns()).cellWidth(5000));
	}
	
	// 导出专业评审项目表
		public void toZYPSXMBExcel() throws IllegalStateException, UnsupportedEncodingException {
			String cur_year = new SimpleDateFormat("yyyy").format(new Date());
			Map<String, String> queryParam = getQueryParam();
			if (!queryParam.containsKey("ApplyYear")) {
				queryParam.put("ApplyYear", cur_year);
			}
			if((queryParam.get("ProjectCN")!=null && queryParam.get("ProjectCN")!="")){
				queryParam.put("ProjectCN", java.net.URLDecoder.decode(queryParam.get("ProjectCN"),"UTF-8"));
			}
			if((queryParam.get("RecommendCompany")!=null && queryParam.get("RecommendCompany")!="")){
				queryParam.put("RecommendCompany", java.net.URLDecoder.decode(queryParam.get("RecommendCompany"),"UTF-8"));			
			}
			if((queryParam.get("major_name")!=null && queryParam.get("major_name")!="")){
				queryParam.put("major_name", java.net.URLDecoder.decode(queryParam.get("major_name"),"UTF-8"));
			}
			if((queryParam.get("person_name")!=null && queryParam.get("person_name")!="")){
				queryParam.put("person_name", java.net.URLDecoder.decode(queryParam.get("person_name"),"UTF-8"));
			}			
			List geList = Project.me.paging(1,65535, queryParam, 1).getList();

			/*List geList1 = Project.me.projectRegisterPage(getParaToInt("pageNumber", 1), 63356, queryParam).getList();*/
			for (int i = 0; i < geList.size(); i++) {
				Project map = (Project) geList.get(i);
				map.put("id", i + 1);// 连续的序号
			}
			String[] columns = { "id", "RegisterNum", "ProjectCN", "person_name","major_name", "RecommendCompany", "Category_name", "groupZY_Name", "group_name" };
			String[] heades = { "序号", "登记号", "项目名称", "主要完成人", "主要完成单位", "推荐单位", "评奖类别", "专业评审组" , "专业评审专家组"  };

			render(PoiRender.me(geList).fileName("projectXMBExpert.xls")
					.sheetName("专业评审项目表").headers(heades).columns(columns)
					.cellWidth(5000).headerRow(2));
		}
		// 导出专业评审结果汇总表
		public void toZYPSJGhZBExcel() throws IllegalStateException, UnsupportedEncodingException {
			String cur_year = new SimpleDateFormat("yyyy").format(new Date());
			Map<String, String> queryParam = getQueryParam();
			if (!queryParam.containsKey("ApplyYear")) {
				queryParam.put("ApplyYear", cur_year);
			}
			if((queryParam.get("ProjectCN")!=null && queryParam.get("ProjectCN")!="")){
				queryParam.put("ProjectCN", java.net.URLDecoder.decode(queryParam.get("ProjectCN"),"UTF-8"));
			}
			if((queryParam.get("RegisterNum")!=null && queryParam.get("RegisterNum")!="")){
				queryParam.put("RegisterNum", java.net.URLDecoder.decode(queryParam.get("RegisterNum"),"UTF-8"));			
			}

			List geList = Project.me.pagingResults(1, 65535, queryParam).getList();
			for (int i = 0; i < geList.size(); i++) {
				Project map = (Project) geList.get(i);
				map.put("id", i + 1);// 连续的序号
				if("".equals(map.get("recom_results"))||map.get("recom_results")==null){
					map.put("recom_results", "");
				}else if("1".equals(map.get("recom_results").toString())){
					map.put("recom_results", "已推荐一等奖");
				}else{
					map.put("recom_results", "已推荐");
				}
			}
			String[] columns = { "id", "RegisterNum", "ProjectCN", "RecommendCompany","averageNum", "recom_count", "prize_count", "er_count","san_count","person_count", "groupZY_Name" , "recom_results"};
			String[] heades = { "序号", "登记号", "项目名称", "推荐单位", "专业评审平均分", "推荐票数","一等奖票数", "二等奖票数", "三等奖票数", "专业组专家人数",  "专业组名称", "推荐结果" };

			render(PoiRender.me(geList).fileName("toZYPSJGhZBExcel.xls")
					.sheetName("专业评审结果汇总表").headers(heades).columns(columns)
					.cellWidth(5000).headerRow(2));
		}
		
		// 导出专业评审推荐项目汇总表
		public void toZYPSTJXMHZBExcel() throws IllegalStateException, UnsupportedEncodingException {
			String cur_year = new SimpleDateFormat("yyyy").format(new Date());
			Map<String, String> queryParam = getQueryParam();
			if (!queryParam.containsKey("ApplyYear")) {
				queryParam.put("ApplyYear", cur_year);
			}
			if((queryParam.get("ProjectCN")!=null && queryParam.get("ProjectCN")!="")){
				queryParam.put("ProjectCN", java.net.URLDecoder.decode(queryParam.get("ProjectCN"),"UTF-8"));
			}
			if((queryParam.get("RecommendCompany")!=null && queryParam.get("RecommendCompany")!="")){
				queryParam.put("RecommendCompany", java.net.URLDecoder.decode(queryParam.get("RecommendCompany"),"UTF-8"));			
			}
			if((queryParam.get("RegisterNum")!=null && queryParam.get("RegisterNum")!="")){
				queryParam.put("RegisterNum", java.net.URLDecoder.decode(queryParam.get("RegisterNum"),"UTF-8"));			
			}
			if((queryParam.get("major_name")!=null && queryParam.get("major_name")!="")){
				queryParam.put("major_name", java.net.URLDecoder.decode(queryParam.get("major_name"),"UTF-8"));
			}
			if((queryParam.get("person_name")!=null && queryParam.get("person_name")!="")){
				queryParam.put("person_name", java.net.URLDecoder.decode(queryParam.get("person_name"),"UTF-8"));
			}
			Calendar c = Calendar.getInstance();
			// 转换日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
			String gyear = sdf.format(c.getTime()); // 获取当前年份
			List groupList = Group.me.findGroupAll(gyear, "2");
			String groupZH_Name="";
			if(!groupList.isEmpty()){
				Group gp = (Group) groupList.get(0);
				List<GroupExpert> list= GroupExpert.me.paginate(gp.getInt("id"));
				for (GroupExpert groupExpert : list) {
					groupZH_Name= groupZH_Name+","+groupExpert.getStr("Name");
				}
			}			
			List geList = Project.me.paging(1,65535, queryParam, 2).getList();
			for (int i = 0; i < geList.size(); i++) {
				Project map = (Project) geList.get(i);
				map.put("id", i + 1);// 连续的序号
				if("".equals(map.get("recom_results"))||map.get("recom_results")==null){
					map.put("recom_results", "");
				}else if("1".equals(map.get("recom_results").toString())){
					map.put("recom_results", "已推荐一等奖");
				}else{
					map.put("recom_results", "已推荐");
				}
				if("".equals(map.get("groupZH_Name"))||map.get("groupZH_Name")==null){
					map.put("groupZH_Name", groupZH_Name);
				}
			}
			String[] columns = { "id", "RegisterNum", "ProjectCN", "person_name","major_name", "RecommendCompany", "average", "recom_results", "groupZY_Name" , "groupZH_Name"};
			String[] heades = { "序号", "登记号", "项目名称", "主要完成人", "主要完成单位","推荐单位", "专评平均分","推荐结果", "所属专家组", "综评专家"};

			render(PoiRender.me(geList).fileName("toZYPSTJXMHZBExcel.xls")
					.sheetName("专业评审推荐项目汇总表").headers(heades).columns(columns)
					.cellWidth(5000).headerRow(2));
		}
		// 导出综合评审总分排序表
		public void toZHPSZFPXBExcel() throws IllegalStateException, UnsupportedEncodingException {
			String cur_year = new SimpleDateFormat("yyyy").format(new Date());
			Map<String, String> queryParam = getQueryParam();
			if (!queryParam.containsKey("ApplyYear")) {
				queryParam.put("ApplyYear", cur_year);
			}
			if((queryParam.get("ProjectCN")!=null && queryParam.get("ProjectCN")!="")){
				queryParam.put("ProjectCN", java.net.URLDecoder.decode(queryParam.get("ProjectCN"),"UTF-8"));
			}
			
			if((queryParam.get("RegisterNum")!=null && queryParam.get("RegisterNum")!="")){
				queryParam.put("RegisterNum", java.net.URLDecoder.decode(queryParam.get("RegisterNum"),"UTF-8"));			
			}								
			List geList = Project.me.pagingTotal(1, 65535, queryParam).getList();
			for (int i = 0; i < geList.size(); i++) {
				Project map = (Project) geList.get(i);
				map.put("id", i + 1);// 连续的序号				
			}
			String[] columns = { "id", "RegisterNum", "ProjectCN", "average"};
			String[] heades = { "序号", "登记号", "项目名称", "综评平均分"};

			render(PoiRender.me(geList).fileName("toZYPSTJXMHZBExcel.xls")
					.sheetName("专业评审推荐项目汇总表").headers(heades).columns(columns)
					.cellWidth(5000).headerRow(2));
		}
		
		// 导出投票类别分配表
		public void toTPLBFPBExcel() throws IllegalStateException, UnsupportedEncodingException {
			String cur_year = new SimpleDateFormat("yyyy").format(new Date());
			Map<String, String> queryParam = getQueryParam();
			if (!queryParam.containsKey("ApplyYear")) {
				queryParam.put("ApplyYear", cur_year);
			}
			if((queryParam.get("ProjectCN")!=null && queryParam.get("ProjectCN")!="")){
				queryParam.put("ProjectCN", java.net.URLDecoder.decode(queryParam.get("ProjectCN"),"UTF-8"));
			}
			
			if((queryParam.get("RegisterNum")!=null && queryParam.get("RegisterNum")!="")){
				queryParam.put("RegisterNum", java.net.URLDecoder.decode(queryParam.get("RegisterNum"),"UTF-8"));			
			}								
			List geList = Project.me.pagingTotal(1, 65535, queryParam).getList();
			for (int i = 0; i < geList.size(); i++) {
				Project map = (Project) geList.get(i);
				map.put("id", i + 1);// 连续的序号	
				if("".equals(map.get("recom_results"))||map.get("recom_results")==null){
					map.put("recom_results", "");
				}else if("1".equals(map.get("recom_results").toString())){
					map.put("recom_results", "已推荐一等奖");
				}else{
					map.put("recom_results", "已推荐");
				}
				if("1".equals(map.get("vote_type").toString())){
					map.put("vote_type", "特等奖");
					map.put("vote_type1", "");
				}else if("2".equals(map.get("vote_type").toString())){
					map.put("vote_type", "一等奖");
					map.put("vote_type1", "");
				}else if("3".equals(map.get("vote_type").toString())){
					map.put("vote_type", "二等奖");
					map.put("vote_type1", "");
				}else if("4".equals(map.get("vote_type").toString())){
					map.put("vote_type", "三等奖");
					map.put("vote_type1", "");
				}else if("6".equals(map.get("vote_type").toString())){
					map.put("vote_type", "");
					map.put("vote_type1", "一等奖");
				}else if("7".equals(map.get("vote_type").toString())){
					map.put("vote_type", "");
					map.put("vote_type1", "二等奖");
				}else if("8".equals(map.get("vote_type").toString())){
					map.put("vote_type", "");
					map.put("vote_type1", "三等奖");
				}else{
					map.put("vote_type", "");
					map.put("vote_type1", "");
				}
				
			}
			String[] columns = { "id", "RegisterNum", "ProjectCN", "average", "recom_results", "vote_type", "vote_type1"};
			String[] heades = { "序号", "登记号", "项目名称", "综评平均分", "专评结果", "投票类别", "直接进入获奖项目列表"};

			render(PoiRender.me(geList).fileName("toTPLBFPBExcel.xls")
					.sheetName("投票类别分配表").headers(heades).columns(columns)
					.cellWidth(5000).headerRow(2));
		}
		// 导出票数统计表
		public void toPSTJBExcel() throws IllegalStateException, UnsupportedEncodingException {
			String cur_year = new SimpleDateFormat("yyyy").format(new Date());
			Map<String, String> queryParam = getQueryParam();
			if (!queryParam.containsKey("ApplyYear")) {
				queryParam.put("ApplyYear", cur_year);
			}
			if((queryParam.get("ProjectCN")!=null && queryParam.get("ProjectCN")!="")){
				queryParam.put("ProjectCN", java.net.URLDecoder.decode(queryParam.get("ProjectCN"),"UTF-8"));
			}			
			if((queryParam.get("RegisterNum")!=null && queryParam.get("RegisterNum")!="")){
				queryParam.put("RegisterNum", java.net.URLDecoder.decode(queryParam.get("RegisterNum"),"UTF-8"));			
			}								
			List geList = Project.me.pagingStatis(1, 65535, queryParam).getList();
			for (int i = 0; i < geList.size(); i++) {
				Project map = (Project) geList.get(i);
				map.put("id", i + 1);// 连续的序号	
				if("1".equals(map.get("vote_type").toString())){
					map.put("vote_type", "特等奖");
				}else if("2".equals(map.get("vote_type").toString())){
					map.put("vote_type", "一等奖");
				}else if("3".equals(map.get("vote_type").toString())){
					map.put("vote_type", "二等奖");
				}else{
					map.put("vote_type", "三等奖");					
				}
			}
			String[] columns = { "id", "RegisterNum", "ProjectCN", "vote_type", "person_count", "agreed", "notAgreed"};
			String[] heades = { "序号", "登记号", "项目名称", "投票类别", "专家人数", "同意票数", "不同意票数"};

			render(PoiRender.me(geList).fileName("toPSTJBExcel.xls")
					.sheetName("导出票数统计表").headers(heades).columns(columns)
					.cellWidth(5000).headerRow(2));
		}		
		
		
		
		

}
