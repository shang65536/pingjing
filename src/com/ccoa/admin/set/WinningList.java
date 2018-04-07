package com.ccoa.admin.set;

import java.util.List;
import java.util.Map;

import com.ccoa.project.Project;
import com.ccoa.utils.StringUtils;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

/*
 * 对应像版管理表 （winning_list）
 * 
 */

@SuppressWarnings("serial")
public class WinningList extends Model<WinningList> {
	public static final WinningList me = new WinningList();

	/**
	 * 查询 获奖名单父内容 type=1（表示父内容） status=1 （并且是已发布的） 首页展示 当前年份
	 */
	public Page<WinningList> paginate(int pageNumber, int pageSize) {
		return paginate(
				pageNumber,
				pageSize,
				"select *",
				"from winning_list where type='1' and status='1' and  winYear=year(NOW())  order by id desc");
	}

	/**
	 * 根据查询条件 查询 获奖名单 父内容 type=1（表示父内容）
	 */
	public List<WinningList> findAllList(String winYear) {
		String sql = "select * from winning_list where type='1' ";
		if (StringUtils.isNotEmpty(winYear)) {
			sql += " and winYear='" + winYear + "'";
		}
		sql += " order by id desc";
		return super.find(sql);
	}

	/**
	 * 根据当前年份 父内容 已发布的 条件查询最新插入的Id号
	 */
	public List selectId() {
		String sql = "select max(id) as id from winning_list where winYear=year(NOw()) and type='1' and  status='1' ";
		return find(sql);
	}

	/**
	 * 根据查询条件 查询 获奖项目 子内容 type=2（表示字内容）
	 */
	public List<WinningList> findAllProjectList(int parentID) {
		return super
				.find("select *,(select winName from winning_list w where w.id=wl.parentID) as PwinName from winning_list wl where type='2' and parentID=? order by id asc ",
						parentID);
	}

	/**
	 * 发布
	 */
	public int setStatus(String id) {
		return Db.update("update winning_list set status='1' where id in ("
				+ id + ")");
	}

	/**
	 * 通过登记号、父ID 判断是否存在
	 * 
	 * @param id
	 * @return
	 */
	public List<WinningList> isExist(int parentID, int registerNum) {
		return Db
				.query("select id  from  winning_list where parentID=? and registerNum=? limit 1 ",
						parentID, registerNum);
	}
	
	/**
	 * 发布
	 */
	public int delete (int parentID, int registerNum) {
		return Db.update("delete  from winning_list  where parentID=? and registerNum=?  ",
						parentID, registerNum);
	}
	
}
