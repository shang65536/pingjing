package com.ccoa.centralenterprises;

import com.jfinal.core.Controller;

import java.util.List;

public class CentrlaEnterprisesController extends Controller {

    /**
     * 获取央企列表
     */
    public void getCentralEnerprises() {
        String param = getPara("param");
        List<CentrlaEnterprises> centrlaEnterprises = CentrlaEnterprises.me.search(param);
        //setAttr("CentrlaEnterprises", centrlaEnterprises);

        renderJson("success", centrlaEnterprises);
    }
}
