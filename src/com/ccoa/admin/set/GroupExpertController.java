package com.ccoa.admin.set;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.ccoa.admin.Admin;
import com.ccoa.common.BaseController;
import com.ccoa.common.Constants;
import com.ccoa.expert.Expert;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.ccoa.project.Project;
import com.ccoa.project.Property;
import com.jfinal.aop.Before;
import com.jfinal.ext.render.excel.PoiRender;

/**
 * GroupController 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller
 * 中，养成好习惯，有利于大型项目的开发与维护
 */
@Before(AdminUserInterceptor.class)
public class GroupExpertController extends BaseController {

	private static Logger log = Logger.getLogger(GroupExpertController.class);

	// 根据专家组ID 查询专家成员
	public void index() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {

			setAttr("user", user);

			String gyear = getPara("group_year");
			String type = getPara("group_type"); // 1 专评 2 综评

			List groupList = Group.me.findGroupAll(gyear, type);

			setAttr("gyear", gyear);
			setAttr("groupList", groupList);

			Calendar c = Calendar.getInstance();
			// 转换日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
			String newyear = sdf.format(c.getTime()); // 获取当前年份

			setAttr("years", Project.me.years(Integer.parseInt(newyear)));

			setAttr("group", Group.me.findById(getParaToInt("group_id"))); // 选择的专家组
			setAttr("gePage", GroupExpert.me.paginate(getParaToInt("group_id")));
			render("guanli-kejij01.html");
		}
	}

	// 专家组 首页 第一次调用的方法
	public void indexzj() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			setAttr("user", user);

			Calendar c = Calendar.getInstance();
			// 转换日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
			String gyear = sdf.format(c.getTime()); // 获取当前年份
			String type = "1"; // 1 专评 2 综评
			setAttr("years", Project.me.years(Integer.parseInt(gyear))); // 只能是当前年份
			removeSessionAttr(Constants.SESSION_USER_TYPE);
			setSessionAttr(Constants.SESSION_USER_TYPE, "admin");

			if (getPara("group_year") != null) {
				gyear = getPara("group_year");
			}

			List groupList = Group.me.findGroupAll(gyear, type);

			setAttr("gyear", gyear);
			setAttr("groupList", groupList);

			if (groupList.size() > 0) {
				Group gp = (Group) groupList.get(0);
				setAttr("group", gp);
				// 默认查询第一个专家组中的 专家成员
				setAttr("gePage", GroupExpert.me.paginate(gp.getInt("id")));
			} else // 默认一个不存在的空对象 0 永远也不存在该组别Id
			{
				Group group = new Group();
				group.set("id", 0);
				setAttr("group", group);
				setAttr("gePage", GroupExpert.me.paginate(0));
			}

			render("guanli-kejij01.html");
		}
	}

	// 跳转到 添加专家成员 页面
	public void add() {
		Map<String, String> queryParam = getQueryParam();
		String group_id = getPara("group_id");			
		Map params = new HashMap();
		params.put("UserName", queryParam.get("UserName"));
		params.put("Job", queryParam.get("Job"));
		params.put("Name", queryParam.get("Name"));
		params.put("ChapterName", queryParam.get("ChapterName"));		
		setAttr("expertPage",Expert.me.paginatExpert(getParaToInt("pageNumber", 1), Constants.PAGE_SIZE, params));
		setAttr("queryParam", queryParam);
		setAttr("group_id", group_id);
		render("guanli-kejij01expertList.html");
	}

	// 保存 专家成员
	public void expertGroupAdd() {
		// 批量新增
		try {
			String expert_ids = getPara("ids"); // 专家ID
			int group_id = getParaToInt("group_id"); // 专家组
			String[] ids = expert_ids.split(",");
			for (int i = 0; i < ids.length; i++) {
				int expert_id = Integer.parseInt(ids[i]);

				// 验证在一个组中 是否添加了重复的专家 如果是就不需要新增
				Long yz = GroupExpert.me.selectGroupExpert(group_id, expert_id);
				if (yz <= 0) {
					GroupExpert ge = new GroupExpert();
					ge.set("group_id", group_id).set("expert_id", expert_id)
							.save();
				}
			}
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	// 删除组成员
	public void delete() {
		Boolean isHas = false;
		try {
			//考虑到时间飞逝
			String ids = getPara("ids");
			String expertIDs="";
			List<GroupExpert> groupExpertList =  GroupExpert.me.findByID(ids);
			for (GroupExpert groupExpert : groupExpertList) {
				expertIDs = expertIDs+","+groupExpert.getInt("expert_id").toString();
			}
			if(!"".equals(expertIDs)&&expertIDs!=""){
				expertIDs=expertIDs.substring(1, expertIDs.length());
			}
			String[] id1 = expertIDs.split(",");
			int id = getParaToInt("group_id");	
			List<Project> projectList = Project.me.findByGroupID(id);
			for (Project project : projectList) {
				String[] id2 = project.getStr("GroupExpertIDs").split(",");
				for (String string : id1) {
					for (String string2 : id2) {
						if(string==string2||string.equals(string2)){
							isHas=true;
							break;
						}
					}					
				}
			}
/*			
			Long a = GroupExpert.me.findCountByGroupId(id);
			String[] idsString = ids.split(",");*/
			if(isHas){
				renderJson("msg", "该群组已被指定项目,组员不能全部都删除！");
			}else{
				GroupExpert.me.deleteByIds(ids);
				renderJson("msg", "删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("msg", "删除失败！");
		}
	}

	// 根据组ID 清空组成员
	public void deleteByGId() {
		try {
			int id = getParaToInt("group_id");			
			Long a = Project.me.findProjectByGroupId(id);
            if(a!=0){
    			renderJson("success", false);            	
            }else{
            	GroupExpert.me.deleteByGId(id);
    			renderJson("success", true);
            }
			
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}
	
	
	
	// 删除组成员
	public void deleteZH() {
		try {
			String ids = getPara("ids");
			int id = getParaToInt("group_id");			
			Long a = GroupExpert.me.findCountByGroupId(id);
			String[] idsString = ids.split(",");
			if(a==idsString.length){
				renderJson("msg", "该群组已被指定项目,组员不能全部都删除！");
			}else{
				GroupExpert.me.deleteByIds(ids);
				renderJson("msg", "删除成功！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("msg", "删除失败！");
		}
	}

	// 根据组ID 清空组成员
	public void deleteZHByGId() {
		try {
			int id = getParaToInt("group_id");			
			Long a = Project.me.findProjectByGroupZHId(id);
            if(a!=0){
    			renderJson("success", false);            	
            }else{
            	GroupExpert.me.deleteByGId(id);
    			renderJson("success", true);
            }
			
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}


	// 打标记
	public void egstatus() {
		try {
			// 批量打标记
			String idstr = getPara("ids");
			int status = getParaToInt("status");
			GroupExpert.me.egstatus(status, idstr);
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	// 保存组名
	public void save() {
		try {

			Calendar c = Calendar.getInstance();
			// 转换日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
			String gyear = sdf.format(c.getTime()); // 获取当前年份

			Group group = getModel(Group.class);
			// 验证组名是否重复
			Long yz = Group.me.group_validate(gyear, group.get("Name") + "");
			if (yz > 0) {
				renderJson("success", false);
			} else {
				if (group.get("id", null) == null || group.getInt("id") <= 0) {

					group.set("Group_Year", gyear);
					group.save();
				} else {
					group.update();
				}
				renderJson("success", true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

	// 导出专家组 专家成员
	public void toExpertExcel() throws IllegalStateException {

		List geList = GroupExpert.me.paginate(getParaToInt("group_id"));
		for (int i = 0; i < geList.size(); i++) {
			GroupExpert map = (GroupExpert) geList.get(i);
			map.put("id", i + 1);// 连续的序号
		}
		String[] columns = { "id", "Name", "bj", "Sex", "Job", "TechTitle",
				"Working", "Phone", "Email" };
		String[] heades = { "序号", "姓名", "标记为", "性别", "工作单位", "技术职称", "从事专业",
				"电话", "邮箱" };

		render(PoiRender.me(geList).fileName("groupExpert.xls")
				.sheetName("专家组成员列表").headers(heades).columns(columns)
				.cellWidth(5000).headerRow(2));

	}

	// 综合组 首页
	public void indexzh() {
		Admin user = (Admin) getSessionAttr(Constants.Admin_User_Session);
		if (user == null) {
			redirect("/");
		} else {
			setAttr("user", user);

			Calendar c = Calendar.getInstance();
			// 转换日期格式
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
			String gyear = sdf.format(c.getTime()); // 获取当前年份

			setAttr("years", Project.me.years(Integer.parseInt(gyear))); // 只能是当前年份

			String type = "2"; // 1 专评 2 综评

			if (getPara("group_year") != null) {
				gyear = getPara("group_year");
			}

			// 先看综评组是否存在
			List groupList = Group.me.findGroupAll(gyear, type);
			// 如果综评组 不存在 则系统自动创建 一年只有一个综评组
			if (groupList.size() == 0) {
				Group gp1 = new Group();
				gp1.set("Name", "综评组").set("Status", "1") // 状态 1 有效
						.set("Group_Year", gyear).set("Type", type) // 综评
						.save();
			}

			List groupList1 = Group.me.findGroupAll(gyear, type);
			setAttr("gyear", gyear);
			setAttr("groupList", groupList1);

			Group gp = (Group) groupList1.get(0);
			setAttr("group", gp);
			// 默认查询第一个专家组中的 专家成员
			setAttr("gePage", GroupExpert.me.paginate(gp.getInt("id")));

			render("guanli-kejij01zh.html");
		}
	}

}
