package com.ccoa.customawards;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ccoa.admin.set.GroupExpert;
import com.ccoa.project.CommonModel;
import com.ccoa.projectreview.ProjectReviewZH;
import com.ccoa.utils.StringUtils;
import com.itextpdf.text.pdf.PdfStructTreeController.returnType;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@SuppressWarnings("serial")
public class CaReview extends Model<CaReview> {
	public static final CaReview me = new CaReview();

	// 根据项目登记号查询 项目信息
	public List<CaReview> findByDeclarationIDAndExpertID(String DeclarationID ,String ExpertID) {
		return find("select * from ca_review where  DeclarationID='" + DeclarationID+"' and ExpertID="+ExpertID);
	}
	
	// 项目形式审查表查询
		public Page<CaReview> caReviewPage(int pageNumber, int pageSize,Map params,String expertID) {
			String sql = "select r.*,cr.couTj, br.* ";
			StringBuffer sqlStr = new StringBuffer();
			sqlStr.append(" from (select * from ca_baseinfo where  id in (select distinct BaseinfoID from ca_review where  ExpertID="+expertID+" )) br LEFT JOIN (select BaseinfoID,count(*) as Total from ca_review where  ISRecommend is null and ExpertID="+expertID+" group by BaseinfoID) r on br.id = r.BaseinfoID ");
			sqlStr.append(" LEFT JOIN (select BaseinfoID,count(*) as couTj from ca_review where  ISSubmit=1 and ExpertID="+expertID+" group by BaseinfoID) cr on br.id = cr.BaseinfoID");	
			sqlStr.append( " where 1=1 and Year = year(NOW()) ");
			// 名称
			if (null != params.get("Name") && !"".equals(params.get("Name"))
					&& !"null".equals(params.get("Name"))) {

				sqlStr.append(" and Name like '%" + params.get("Name") + "%' ");
			}
			// 是否已提交
			if (null != params.get("IStj") && !"".equals(params.get("IStj"))
					&& !"null".equals(params.get("IStj"))) {
				   if("0".equals(params.get("IStj"))){
					   sqlStr.append(" and cr.couTj is not null");
				   }else{
					   sqlStr.append(" and cr.couTj is null");
				   }
                  
			}		
					
			sqlStr.append(" order by Year , CreateTime desc");
			return paginate(pageNumber, pageSize, sql, sqlStr.toString());
		}
		
		public List<CaReview> findCaReview(String expertID,String baseinfoID) {
			String sql = "select r.*,r.id as rID, d.* ";
			StringBuffer sqlStr = new StringBuffer();
			sqlStr.append(" from ca_review r LEFT JOIN ca_declaration d on r.DeclarationID=d.id where r.BaseinfoID='"+baseinfoID+"' and r.ExpertID= "+expertID);			
			sqlStr.append(" order by r.ISRecommend asc,r.CreateTime desc");
			return find(sql+sqlStr.toString());
		}
		public int updateISSubmit(String baseinfoID,String expertID){
			String sql ="update ca_review set ISSubmit=1 where BaseinfoID='"+baseinfoID+"' and ExpertID='"+expertID+"'";
			return Db.update(sql);
			
		}
		public List<CaReview> findRecommend(String expertID,String baseinfoID) {
			String sql = "select * ";
			StringBuffer sqlStr = new StringBuffer();
			sqlStr.append(" from ca_review  where ISRecommend is null and BaseinfoID='"+baseinfoID+"' and ExpertID= "+expertID);			
			sqlStr.append(" order by ISRecommend asc,CreateTime desc");
			return find(sql+sqlStr.toString());
		}
		// 审批信息
		public Page<CaReview> caReviewPageByDeclarationID(int pageNumber, int pageSize,Map params,String DeclarationID) {
			String sql = "select cr.*,e.UserName,e.Name ";
			StringBuffer sqlStr = new StringBuffer();
			sqlStr.append(" from ca_review cr LEFT JOIN  expert e on cr.ExpertID=e.id where 1=1 and cr.DeclarationID='"+DeclarationID+"'");							
			sqlStr.append(" order by CreateTime desc");
			return paginate(pageNumber, pageSize, sql, sqlStr.toString());
		}
}
