package com.ccoa.area;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

public class Area extends Model<Area> {

    public static final Area me = new Area();

    /**
     * 获取地区列表
     * @return
     */
    public List<Area>  getArea()
    {
        String sql="select id, AreaName from set_area order by OrderIndex";
        return this.find(sql);
    }
}
