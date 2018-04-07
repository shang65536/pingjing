package com.ccoa.customawards;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ccoa.admin.set.GroupExpert;
import com.ccoa.project.CommonModel;
import com.ccoa.projectreview.ProjectReviewZH;
import com.ccoa.utils.StringUtils;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@SuppressWarnings("serial")
public class Declaration extends Model<Declaration> {
	public static final Declaration me = new Declaration();

	/**
	 * 查询申报平台 自定义申报列表,该用户已申报的自定义奖项
	 */
	public Page<Declaration> findHasDeclaration(int pageNumber, int pageSize,
			int declareID, Map params) {
		String sql = "select d.*,b.Name,b.Year";
		StringBuffer sqlStr = new StringBuffer();
		sqlStr.append(" from ca_declaration d LEFT JOIN ca_baseinfo b on d.BaseinfoID = b.id  where 1=1  ");
		sqlStr.append(" and d.DeclareID = " + declareID);
		// 名称
		if (null != params.get("Name") && !"".equals(params.get("Name"))
				&& !"null".equals(params.get("Name"))) {

			sqlStr.append(" and b.Name like '%" + params.get("Name") + "%' ");
		}
		// 年份
		if (null != params.get("Year") && !"".equals(params.get("Year"))
				&& !"null".equals(params.get("Year"))) {
			sqlStr.append(" and b.Year = " + params.get("Year") + " ");
		}				
		// 状态
		if (null != params.get("FormalReviewStatus")
				&& !"".equals(params.get("FormalReviewStatus"))
				&& !"null".equals(params.get("FormalReviewStatus"))) {
			sqlStr.append(" and d.FormalReviewStatus = "
					+ params.get("FormalReviewStatus") + " ");
		}
		sqlStr.append(" order by b.Year , d.CreateTime desc");
		return paginate(pageNumber, pageSize, sql, sqlStr.toString());
	}

	/**
	 * 查询
	 */
	public Page<Declaration> findDeclarationByBaseinfoID(int pageNumber,int pageSize, Map params, boolean isRegisterNum) {
		String sql = "select d.id,d.RegisterNum,d.HeaderAttributeValue,d.DeclarationFile,d.FormalReviewOpinion,d.FormalReviewStatus ";
		StringBuffer sqlStr = new StringBuffer();
		sqlStr.append(" from  ca_declaration d where 1=1 ");

		// 项目名称
		if (null != params.get("baseinfoID")
				&& !"".equals(params.get("baseinfoID"))
				&& !"null".equals(params.get("baseinfoID"))) {

			sqlStr.append(" and d.BaseinfoID = '" + params.get("baseinfoID")+ "' ");
		}
		// 项目名称
		if (isRegisterNum) {
			sqlStr.append(" and d.RegisterNum is not null ");
		}
		sqlStr.append(" order by CreateTime desc");
		return paginate(pageNumber, pageSize, sql, sqlStr.toString());
	}
	
	
	
	
	/**
	 * 查询
	 */
	public Page<Declaration> findReviewResult(int pageNumber,int pageSize, Map params) {
		String sql = "select * ";
		StringBuffer sqlStr = new StringBuffer();
		sqlStr.append(" from ca_declaration where id in ( select DISTINCT DeclarationID from ca_review where ISSubmit=1 and BaseinfoID='"+params.get("baseinfoID")+"') ");	
		sqlStr.append(" order by CreateTime desc");
		return paginate(pageNumber, pageSize, sql, sqlStr.toString());
	}

	// 验证项目登记号是否重复
	public Long RegisterSub(int RegisterNum, String BaseinfoID) {
		String sql = "select count(id)  from ca_declaration where  RegisterNum=? and BaseinfoID =? ";
		return Db.queryLong(sql, RegisterNum, BaseinfoID);
	}
	
	// 根据自定义信息id和状态查询
	public List<Declaration> findDeclarationByBaseinfoIDAndFormalReviewStatus(String BaseinfoID, int FormalReviewStatus) {
		return find("select * from ca_declaration where  FormalReviewStatus !=null and BaseinfoID='" + BaseinfoID+"' and FormalReviewStatus="+FormalReviewStatus);
	}
	// 根据自定义信息id查询
	public List<Declaration> findDeclarationByBaseinfoID(String BaseinfoID) {
		return find("select * from ca_declaration where  BaseinfoID='" + BaseinfoID+"'");
	}
	public CommonModel exportExcel(Baseinfo baseinfo,String[] base) {
		CommonModel exportExcel = new CommonModel();
		String[] columns = null;
		String[] heades = null;
		List<String> hList = new ArrayList<>();
		List<String> cList = new ArrayList<>();
		String sqlStr = "";
		hList.add("序号");
		hList.add("登记号");
		for (String s : base) {
			hList.add(s);
		}
		hList.add("评审");
		hList.add("评审意见");
		int size=hList.size();  
		heades = (String[]) hList.toArray(new String[size]);		
		cList.add("rows");
		cList.add("RegisterNum");
		for (String s : base) {
			cList.add(s);
			sqlStr = sqlStr + " ,ReviewOpinion as "+s;
		}
		cList.add("FormalReviewStatus");
		cList.add("ReviewOpinion");
		int csize=cList.size();  
		columns = (String[]) cList.toArray(new String[csize]);		
		List<Declaration> declaration_List = null;		
		exportExcel.setSheetName(baseinfo.get("Name") + "_评审结果表");

		
		String sqlString = "select (@rows := @rows+1) AS rows,d.RegisterNum,case when d.FormalReviewStatus=3 then '项目评审通过' when d.FormalReviewStatus=4 then '项目评审不通过' else '未评审' end as FormalReviewStatus,d.ReviewOpinion,d.HeaderAttributeValue "+
				sqlStr+" from ca_declaration d where d.id in ( select DISTINCT DeclarationID from ca_review where ISSubmit=1 and BaseinfoID='"+baseinfo.getStr("id")+"')";
		declaration_List = find(sqlString);
		// 文件名
		exportExcel.setFileName(baseinfo.get("Name") + "_评审结果.xls");
		exportExcel.setColumns(columns);
		exportExcel.setHeades(heades);
		exportExcel.setListDeclarations(declaration_List);		
		return exportExcel;
		
	}

}
