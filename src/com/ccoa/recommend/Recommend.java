package com.ccoa.recommend;

import com.jfinal.plugin.activerecord.Model;

public class Recommend extends Model<Recommend> {

    public static final Recommend me = new Recommend();

    /**
     * 登录认证
     * @param loginName
     * @param Password
     * @return
     */
    public  Recommend login(String loginName,String Password)
    {
        return super
                .findFirst(
                        "select * from set_recommend where LoginName = ? and PassWord = ?   and Status=1  ",
                        loginName, Password); // 审核通过的
    }



}
