package com.ccoa.customawards;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ccoa.admin.set.GroupExpert;
import com.ccoa.project.CommonModel;
import com.ccoa.project.Project;
import com.ccoa.projectreview.ProjectReviewZH;
import com.ccoa.utils.StringUtils;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

@SuppressWarnings("serial")
public class RormalReviewOpinion extends Model<RormalReviewOpinion> {
	public static final RormalReviewOpinion me = new RormalReviewOpinion();

	public Page<RormalReviewOpinion> findRormalReviewOpinionByDeclarationID(int pageNumber,int pageSize, Map params) {
		String sql = "select r.*,a.AdminName ";
		StringBuffer sqlStr = new StringBuffer();
		sqlStr.append(" from  ca_rormalreviewopinion r left join admin a on a.id=r.AdminID where 1=1 ");

		// 项目名称
		if (null != params.get("DeclarationID")
				&& !"".equals(params.get("DeclarationID"))
				&& !"null".equals(params.get("DeclarationID"))) {

			sqlStr.append(" and r.DeclarationID = '" + params.get("DeclarationID")+ "' ");
		}		
		sqlStr.append(" order by CreateTime desc");
		return paginate(pageNumber, pageSize, sql, sqlStr.toString());
	}


}
