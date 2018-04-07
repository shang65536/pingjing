package com.ccoa.admin;

import com.ccoa.utils.StringUtils;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class News extends Model<News> {
	
	public static final News me = new News();
	
	/**
	 * 分页查询
	 */
	public Page<News> paginate(int pageNumber, int pageSize,String newsTitle,String newsDate,String status) {
		StringBuffer sql = new StringBuffer(" from news where 1=1 ");
		
		if(StringUtils.isNotEmpty(newsTitle)){
			sql.append(" and NewsTitle like '%");
			sql.append(newsTitle);
			sql.append("%'");
		}
		if(StringUtils.isNotEmpty(newsDate)){
			sql.append(" and NewsDate = '");
			sql.append(newsDate);
			sql.append("'");
		}
		if(StringUtils.isNotEmpty(status)){
			sql.append(" and status = ");
			sql.append(status);
		}
		sql.append(" order by id desc ");
		return super.paginate(pageNumber, pageSize, "select *", sql.toString());
	}
	
	//删除
    public int deleteByIds(String ids) {
    	return Db.update("delete from news where id in ( " + ids + " )");
    }
    
    public int operate(int status,int id) {
    	return Db.update(" update news set status = ? where id = ?", status,id);
    }
}
