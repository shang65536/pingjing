package com.ccoa.recommend;

import com.ccoa.common.Constants;
import com.jfinal.core.Controller;

public class RecommendController extends Controller {


    public void index() {
        Recommend user = (Recommend) getSessionAttr(Constants.Company_User_Recommend);
        // setAttr("companyPage", Company.me.paginate(getParaToInt(0, 1),
        // 10,getPara(1),getPara(2)));
        if (user == null) {
            redirect("/");
        } else {
            render("edit.html");
        }
    }

    /**
     * 编辑推荐人信息
     */
    public void edit() {
        String method = getRequest().getMethod();
        Integer id = getParaToInt("id");
        if (method.equalsIgnoreCase(Constants.RequestMethod.GET)) {
            setAttr("recommend", Recommend.me.findById(id));
            render("edit.html");
        } else if (method.equalsIgnoreCase(Constants.RequestMethod.POST)) {
            String PassWord = getPara("PassWord");

            String LinkUserName = getPara("LinkUserName");
            String LinkPhone = getPara("LinkPhone");
            String Email = getPara("Email");

            Recommend recommend = Recommend.me.findById(id);
            recommend.set("PassWord", PassWord)
                    .set("LinkUserName", LinkUserName)
                    .set("LinkPhone", LinkPhone)
                    .set("Email", Email).update();
            renderText("修改成功！");
        }
    }

}
