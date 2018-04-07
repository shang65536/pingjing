package com.ccoa.centralenterprises;

import com.jfinal.plugin.activerecord.Model;

import java.util.List;

public class CentrlaEnterprises extends Model<CentrlaEnterprises> {
    public static final CentrlaEnterprises me = new CentrlaEnterprises();

    /**
     * 检索央企数据
     *
     * @param param
     * @return
     */
    public List<CentrlaEnterprises> search(String param) {
        StringBuilder sql = new StringBuilder();
        sql.append(" select id ,CompanyName from set_centrlaenterprises where 1=1 ");
        if (param != null) {
            sql.append(" and CompanyName like '%" + param + "%'");
        }
        sql.append(" order by OrderIndex");
        return this.find(sql.toString());
    }
}
