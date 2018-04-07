package com.ccoa.common;

/**
 * Created by leilufeng on 15/5/2. 公共类
 */
public class Constants {

	public static final String ERROR = "error";
	// 后台管理员
	public static final String Admin_User_Session = "admin_user_session";
	// 企业会员
	public static final String Company_User_Session = "company_user_session";
	// 评审专家
	public static final String Expert_User_Session = "expert_user_session";
	// 回调地址
	public static final String BEFORE_URL = "before_url";
	// 开发模式
	public static final String CONFIG_DEVMODE = "devMode";
	// 登陆Session用户类型,company为申报单位，admin为总会管理，expert为专家
	public static final String SESSION_USER_TYPE = "session_user_type";
	// 分页条数
	public static final int PAGE_SIZE = 10;

	// 文件上传最大
	public static final int FILE_MAXSize = 50 * 1024 * 1024; // 50M
	// 文件上传目录名称，子目录名称
	public static final String FILE_UPLOAD_DIR = "upload";// WebRoot目录下

	public static class RequestMethod {
		public static final String GET = "get";
		public static final String POST = "post";
	}

	public static class ResultCode {
		public static final String SUCCESS = "200";
		public static final String FAILURE = "201";
	}

	public static class ResultDesc {
		public static final String SUCCESS = "success";
		public static final String FAILURE = "error";
	}

}
