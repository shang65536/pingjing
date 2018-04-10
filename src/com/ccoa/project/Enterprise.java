package com.ccoa.project;

import com.jfinal.plugin.activerecord.Model;

public class Enterprise extends Model<Enterprise> {
    public static final Enterprise me = new Enterprise();

    /**
     * 根据项目ID获取企业基础信息
     * @param projectID
     * @return
     */
    public Enterprise getEnterprise(Long projectID)
    {
        String sql="select * from project_enterprise where project_id="+projectID;
        return this.findFirst(sql);
    }
}
