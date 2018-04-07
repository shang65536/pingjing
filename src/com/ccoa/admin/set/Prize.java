package com.ccoa.admin.set;

import java.util.List;

import com.ccoa.customawards.Baseinfo;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Prize extends Model<Prize> {
	public static final Prize me = new Prize();

	/**
	 * 查询
	 */
	public Page<Prize> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from blog order by id asc");
	}

	/**
	 * 查询 获取当前 年份
	 */
	public Prize findFirst() {
		return findFirst(" select * from set_prize where PrizeYear=year(NOW())  ");
	}
	public Prize findMaxPrize() {
		List<Prize>  list= find(" select * from set_prize order by PrizeYear desc");
		if(!list.isEmpty()){
			Prize prize = list.get(0);
			return prize;
		}
		return new Prize();
	}
}
