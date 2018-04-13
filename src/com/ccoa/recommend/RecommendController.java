package com.ccoa.recommend;

import com.ccoa.common.Constants;
import com.ccoa.company.Company;
import com.jfinal.core.Controller;
import com.ccoa.utils.EncryptionUtil;

public class RecommendController extends Controller {


    public void index() {
        Recommend user = (Recommend) getSessionAttr(Constants.Company_User_Recommend);
        // setAttr("companyPage", Company.me.paginate(getParaToInt(0, 1),
        // 10,getPara(1),getPara(2)));
        if (user == null) {
            redirect("/");
        } else {
            setAttr("recommend", user);
            if (user.get("LinkUserName")==null ||user.get("LinkPhone")==null ||user.get("Email")==null ){
                render("edit.html");
            }else{
                render("index.html");
            }
        }
    }

    /**
     * 编辑推荐人信息
     */
    public void edit() {
        String method = getRequest().getMethod();
        Recommend user = (Recommend) getSessionAttr(Constants.Company_User_Recommend);

        if (method.equalsIgnoreCase(Constants.RequestMethod.GET)) {
            setAttr("recommend", user);
            render("edit.html");
        } else if (method.equalsIgnoreCase(Constants.RequestMethod.POST)) {
            String PassWord = getPara("PassWord");

            String LinkUserName = getPara("LinkUserName");
            String LinkPhone = getPara("LinkPhone");
            String Email = getPara("Email");

            if (!user.get("PassWord").equals(PassWord)) {
                user.set("PassWord", EncryptionUtil.md5Encrypt(PassWord));
            }
            user.set("LinkUserName", LinkUserName)
                    .set("LinkPhone", LinkPhone)
                    .set("Email", Email).update();

            renderJson("success", true);
        }
    }

}
