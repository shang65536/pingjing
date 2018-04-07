package com.ccoa.project;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

@SuppressWarnings("serial")
public class Accessory extends Model<Accessory> {
	public static final Accessory me = new Accessory();

	/**
	 * 查询
	 */
	public Page<Accessory> paginate(int pageNumber, int pageSize) {
		return paginate(pageNumber, pageSize, "select *",
				"from blog order by id asc");
	}

	/**
	 * 查询 根据项目ID查询附件上传 列表
	 */
	public List<Accessory> selectAybyId(long ProjectID) {
		return find("select * from  project_accessory where ProjectID="
				+ ProjectID + " order by id asc");
	}
	/**
	 * 查询 根据项目ID和type查询附件上传 列表
	 */
	public List<Accessory> selectAybyIdType(long ProjectID,String type) {
		return find("select id,type,fileName from  project_accessory where ProjectID="
				+ ProjectID +" and  type='"+type+"' order by id asc");
	}

	// 删除
	public int delAccessoryByPIdAndTY(String id, String type,String fileName) {
		return Db.update("delete from project_accessory where ProjectId =" + id
				+ " and type='" + type+"' and fileName='"+fileName+"'");
	}
	public Accessory selectAccessoryByPIdAndTY(String id, String type,String fileName) {
		return findFirst("select * from  project_accessory  where ProjectId =" + id
				+ " and type='" + type+"' and fileName='"+fileName+"'");
	}
}
