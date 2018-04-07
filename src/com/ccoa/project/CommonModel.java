package com.ccoa.project;

import java.util.List;

import com.ccoa.customawards.Declaration;

/**
 * 公共 model
 */
public class CommonModel {

	private String[] columns; // 列 字段名

	private String[] heades; // 头部标题

	private List<Project> list; // 查询集合
	
	private List<Declaration> listDeclarations;

	private String fileName; // 文件名称

	private String sheetName;

	private String table_columns; // 表字段

	private String table_join; // 表关联

	public CommonModel() {

	}

	public CommonModel(String table_columns, String table_join) {
		this.table_columns = table_columns;
		this.table_join = table_join;
	}

	public String[] getColumns() {
		return columns;
	}

	public void setColumns(String[] columns) {
		this.columns = columns;
	}

	public String[] getHeades() {
		return heades;
	}

	public void setHeades(String[] heades) {
		this.heades = heades;
	}

	
	
	public List<Project> getList() {
		return list;
	}

	public void setList(List<Project> pro_List) {
		this.list = pro_List;
	}
	public List<Declaration> getListDeclarations() {
		return listDeclarations;
	}

	public void setListDeclarations(List<Declaration> listDeclarations) {
		this.listDeclarations = listDeclarations;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getSheetName() {
		return sheetName;
	}

	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}

	public String getTable_columns() {
		return table_columns;
	}

	public void setTable_columns(String table_columns) {
		this.table_columns = table_columns;
	}

	public String getTable_join() {
		return table_join;
	}

	public void setTable_join(String table_join) {
		this.table_join = table_join;
	}

}
