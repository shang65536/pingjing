package com.ccoa.review;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Review extends Model<Review> {
	public static final Review me = new Review();

	/**
	 * 查询
	 */
	public Page<Review> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from blog order by id asc");
	}
}
