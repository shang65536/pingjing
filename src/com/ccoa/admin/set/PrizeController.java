package com.ccoa.admin.set;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.apache.log4j.Logger;

import com.ccoa.common.BaseController;
import com.ccoa.interceptor.AdminUserInterceptor;
import com.jfinal.aop.Before;

/**
 * PrizeController 所有 sql 与业务逻辑写在 Model 或 Service 中，不要写在 Controller
 * 中，养成好习惯，有利于大型项目的开发与维护
 */
@Before(AdminUserInterceptor.class)
public class PrizeController extends BaseController {

	private static Logger log = Logger.getLogger(PrizeController.class);

	// 去掉默认
	// public void index() {
	// Prize prize = Prize.me.findById(getParaToInt("id"));
	// setAttr("prize", prize);
	// render("xmdfgz.html");
	// }

	/**
	 * 项目打分规则
	 */
	public void xmdfgz() {
		Prize prize = Prize.me.findFirst();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		render("xmdfgz.html");
	}

	/**
	 * 科技奖评审设置
	 */
	public void kjjps() {
		Prize prize = Prize.me.findFirst();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		render("kjjps.html");
	}

	/**
	 * 注意事项设置
	 */
	public void zysx() {
		Prize prize = Prize.me.findFirst();
		if (prize == null) {
			prize = new Prize();
		}
		setAttr("prize", prize);
		render("zysx.html");
	}

	public void save() {
		try {

			Prize prize = getModel(Prize.class);
			String expertNote = prize.get("expertNote");
			if(expertNote!=null&&!"".equals(expertNote)){
				expertNote = expertNote.replaceAll ("\\n", "<br\\>");
				prize.set("expertNote", expertNote);
			}
			
			if (prize.get("id", null) == null || prize.getInt("id") <= 0) {
				// 默认年份
				Calendar c = Calendar.getInstance();
				// 转换日期格式
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
				// 根据年度 、 类别 查询专家组信息 默认当前年份 及 专评状态
				String gyear = sdf.format(c.getTime()); // 获取当前年份
				prize.set("PrizeYear", gyear);
				prize.save();
			} else {
				prize.update();
			}
			renderJson("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
			renderJson("success", false);
		}
	}

}
