package com.ccoa.area;

import com.jfinal.core.Controller;

import java.util.List;

public class AreaController extends Controller {
    /**
     * 获取地区列表
     */
    public void getArea() {
        List<Area> areas = Area.me.getArea();
        renderJson("success", areas);
    }
}
