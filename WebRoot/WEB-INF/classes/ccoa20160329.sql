/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50623
Source Host           : localhost:3306
Source Database       : ccoa3

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2016-03-03 09:49:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `AdminName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '管理员账号',
  `AdminPassword` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '管理员密码',
  `MobilePhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机',
  `OfficePhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '办公室电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'yun', 'e10adc3949ba59abbe56e057f20f883e', '18774017712', '01025487587');
INSERT INTO `admin` VALUES ('2', 'zhgl', 'e10adc3949ba59abbe56e057f20f883e', '18724017700', '345555');
INSERT INTO `admin` VALUES ('3', 'sdfa', 'e10adc3949ba59abbe56e057f20f883e', '18724017700', '345555');

-- ----------------------------
-- Table structure for `ca_baseinfo`
-- ----------------------------
DROP TABLE IF EXISTS `ca_baseinfo`;
CREATE TABLE `ca_baseinfo` (
  `id` varchar(64) NOT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '奖项名称',
  `Year` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '年度',
  `ReleaseStatus` int(11) DEFAULT NULL COMMENT '发布状态（0草稿，1未发布，2已发布）',
  `ISDeclaration` int(11) DEFAULT NULL COMMENT '是否可申报（0可申报，1不可申报）',
  `ISReview` int(11) DEFAULT NULL COMMENT '是否可评审（0可评审，1不可评审）',
  `ISHasReview` int(11) DEFAULT NULL COMMENT '是否已评审（0已评审，1未评审）',
  `DeclarationFile` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '申请书模板名称',
  `DeclarationFilePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '申报书模板路径',
  `ReviewFile` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '评分表模板名称',
  `ReviewFilePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '评审书模板路径',
  `ReviewResultFile` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '评审结果文件名称（评审结果列表中发布到前台）',
  `ReviewResultFilePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '评审结果文件路径（评审结果列表中发布到前台）',
  `expertID` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '评审专家编号（用,号隔开）',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyTime` datetime DEFAULT NULL COMMENT '修改时间',
  `Content` text CHARACTER SET utf8 COMMENT 'html内容',
  `HeaderAttribute` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '表头,用,隔开',
  `Build` text CHARACTER SET utf8 COMMENT '原始html',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ca_baseinfo
-- ----------------------------
INSERT INTO `ca_baseinfo` VALUES ('5117770c-7e06-40e8-9973-4cf89b520ea0', '成果鉴定', '2016', '2', '0', '0', '1', '附件2.粮油科技成果鉴定申请表.doc', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\template\\5117770c-7e06-40e8-9973-4cf89b520ea0\\附件2.粮油科技成果鉴定申请表.doc', '回传评分表222.doc', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\template\\5117770c-7e06-40e8-9973-4cf89b520ea0\\回传评分表222.doc', null, null, null, '2016-01-20 13:54:39', '2016-01-20 13:55:55', '\n          \n           <form class=\"form-horizontal\"><fieldset><div id=\"legend\"><b><input id=\"form_name\" class=\"leipiplugins\" name=\"form_name\" value=\"成果鉴定\" type=\"hidden\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">成果鉴定</legend> </b> </div>\n\n    <div class=\"control-group\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">成果名称</label>\n  <div class=\"controls\">\n    <input class=\"leipiplugins\" title=\"成果名称\" name=\"leipiNewField\" value=\"\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    \n\n    <div class=\"control-group\">\n  <!-- Textarea -->\n  <label class=\"control-label leipiplugins-orgname\">完成单位</label>\n  <div class=\"controls\">\n    <div class=\"textarea\">\n          <textarea class=\"leipiplugins\" title=\"完成单位\" name=\"leipiNewField\" leipiplugins=\"textarea\" orgname=\"完成单位\"> </textarea>\n    </div>\n  </div>\n</div><div class=\"control-group\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">申请鉴定单位</label>\n  <div class=\"controls\">\n    <input class=\"leipiplugins\" title=\"申请鉴定单位\" name=\"leipiNewField\" value=\"\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\n  </div>\n\n</div><div class=\"control-group\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">申请日期</label>\n  <div class=\"controls\">\n    <input class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" title=\"申请日期\" name=\"leipiNewField\" value=\"\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\n  </div>\n\n</div><div class=\"control-group\">\n  <label class=\"control-label leipiplugins-orgname\">主持鉴定单位</label>\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\n<label class=\"radio inline\">\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"总会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">总会\n</label><label class=\"radio inline\">\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"油脂分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">油脂分会\n</label><label class=\"radio inline\">\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"食品分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">食品分会\n</label><label class=\"radio inline\">\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"储藏分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">储藏分会\n</label><label class=\"radio inline\">\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"玉米深加工分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">玉米深加工分会\n</label><label class=\"radio \">\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" value=\"质检分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"\">质检分会\n</label></div>\n</div><div class=\"control-group\">\n  <label class=\"control-label leipiplugins-orgname\">计划</label>\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\n<label class=\"checkbox inline\">\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"国家\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">国家\n</label><label class=\"checkbox inline\">\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"省\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">省\n</label><label class=\"checkbox inline\">\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"自然基金\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">自然基金\n</label><label class=\"checkbox inline\">\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"自选\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">自选\n</label><label class=\"checkbox inline\">\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"其他\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">其他\n</label></div>\n\n</div>\n\n    <div class=\"control-group\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">联系人</label>\n  <div class=\"controls\">\n    <input class=\"leipiplugins\" title=\"联系人\" name=\"leipiNewField\" value=\"\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    \n\n    <div class=\"control-group\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">联系电话</label>\n  <div class=\"controls\">\n    <input class=\"leipiplugins\" title=\"联系电话\" name=\"leipiNewField\" value=\"\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    \n\n    \n\n    \n\n    <div class=\"control-group\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">电子邮箱</label>\n  <div class=\"controls\">\n    <input class=\"leipiplugins\" title=\"电子邮箱\" name=\"leipiNewField\" value=\"\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    <div class=\"control-group\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">身份证号</label>\n  <div class=\"controls\">\n    <input class=\"leipiplugins\" title=\"身份证号\" name=\"leipiNewField\" value=\"\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    </fieldset></form>                          \n                     \n        ', '成果名称,完成单位,申请鉴定单位,申请日期,主持鉴定单位,联系人,联系电话,电子邮箱,身份证号', '\n          \n           <form style=\"background-color: rgb(255, 255, 255);\" id=\"target\" class=\"form-horizontal\"><fieldset><div style=\"border-top-color: white; border-bottom-color: currentColor; border-top-width: 1px; border-bottom-width: medium; border-top-style: solid; border-bottom-style: none;\" id=\"legend\" class=\"component\" data-original-title=\"编辑属性\" data-content=\"<form class=\'form\'><div class=\'controls\'> <label class=\'control-label\'>科技奖名称</label> <input type=\'text\' id=\'orgvalue\' placeholder=\'请输入科技奖名称\'><hr/><button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button></div></form>\" trigger=\"manual\" rel=\"popover\"><b><input id=\"form_name\" class=\"leipiplugins\" name=\"form_name\" value=\"成果鉴定\" type=\"hidden\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">成果鉴定</legend> </b> </div>\n\n    <div style=\"border-top-color: white; border-bottom-color: currentColor; border-top-width: 1px; border-bottom-width: medium; border-top-style: solid; border-bottom-style: none;\" class=\"control-group component\" data-original-title=\"文本框控件\" data-content=\"&#13;&#10;  <form class=\'form\'>&#13;&#10;    <div class=\'controls\'> &#13;&#10;      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>&#13;&#10;      <label class=\'control-label\'>默认值</label> <input type=\'text\' id=\'orgvalue\' placeholder=\'默认值\'>&#13;&#10;      <hr/>&#13;&#10;      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>&#13;&#10;    </div>&#13;&#10;  </form>\" trigger=\"manual\" rel=\"popover\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">成果名称</label>\n  <div class=\"controls\">\n    <input class=\"leipiplugins\" title=\"成果名称\" name=\"leipiNewField\" value=\"\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    \n\n    <div style=\"border-top-color: white; border-bottom-color: currentColor; border-top-width: 1px; border-bottom-width: medium; border-top-style: solid; border-bottom-style: none;\" class=\"control-group component\" data-original-title=\"多行文本控件\" data-content=\"&#13;&#10;  <form class=\'form\'>&#13;&#10;    <div class=\'controls\'>&#13;&#10;      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>&#13;&#10;      <label class=\'control-label\'>默认值</label> <input type=\'text\' id=\'orgvalue\' placeholder=\'默认值\'>&#13;&#10;      <hr/>&#13;&#10;      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>&#13;&#10;    </div>&#13;&#10;  </form>\" trigger=\"manual\" rel=\"popover\">\n  <!-- Textarea -->\n  <label class=\"control-label leipiplugins-orgname\">完成单位</label>\n  <div class=\"controls\">\n    <div class=\"textarea\">\n          <textarea class=\"leipiplugins\" title=\"完成单位\" name=\"leipiNewField\" leipiplugins=\"textarea\" orgname=\"完成单位\"> </textarea>\n    </div>\n  </div>\n</div><div style=\"border-top-color: white; border-bottom-color: currentColor; border-top-width: 1px; border-bottom-width: medium; border-top-style: solid; border-bottom-style: none;\" class=\"control-group component\" data-original-title=\"文本框控件\" data-content=\"&#13;&#10;  <form class=\'form\'>&#13;&#10;    <div class=\'controls\'> &#13;&#10;      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>&#13;&#10;      <label class=\'control-label\'>默认值</label> <input type=\'text\' id=\'orgvalue\' placeholder=\'默认值\'>&#13;&#10;      <hr/>&#13;&#10;      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>&#13;&#10;    </div>&#13;&#10;  </form>\" trigger=\"manual\" rel=\"popover\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">申请鉴定单位</label>\n  <div class=\"controls\">\n    <input class=\"leipiplugins\" title=\"申请鉴定单位\" name=\"leipiNewField\" value=\"\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\n  </div>\n\n</div><div style=\"border-top-color: white; border-bottom-color: currentColor; border-top-width: 1px; border-bottom-width: medium; border-top-style: solid; border-bottom-style: none;\" class=\"control-group component\" data-original-title=\"日期控件\" data-content=\"&#13;&#10;  <form class=\'form\'>&#13;&#10;    <div class=\'controls\'> &#13;&#10;      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>&#13;&#10;      <hr/>&#13;&#10;      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>&#13;&#10;    </div>&#13;&#10;  </form>\" trigger=\"manual\" rel=\"popover\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">申请日期</label>\n  <div class=\"controls\">\n    <input class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" title=\"申请日期\" name=\"leipiNewField\" value=\"\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\n  </div>\n\n</div><div style=\"border-top-color: white; border-bottom-color: currentColor; border-top-width: 1px; border-bottom-width: medium; border-top-style: solid; border-bottom-style: none;\" class=\"control-group component\" data-original-title=\"单选控件\" data-content=\"&#13;&#10;  <form class=\'form\'>&#13;&#10;    <div class=\'controls\'>&#13;&#10;      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>&#13;&#10;      <label class=\'control-label\'>单选框</label>&#13;&#10;      <textarea style=\'min-height: 200px\' id=\'orgvalue\'></textarea>&#13;&#10;      <p class=\'help-block\'>一行一个选项</p>&#13;&#10;      <hr/>&#13;&#10;      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>&#13;&#10;    </div>&#13;&#10;  </form>\" trigger=\"manual\" rel=\"popover\">\n  <label class=\"control-label leipiplugins-orgname\">主持鉴定单位</label>\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\n<label class=\"radio inline\">\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"总会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">总会\n</label><label class=\"radio inline\">\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"油脂分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">油脂分会\n</label><label class=\"radio inline\">\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"食品分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">食品分会\n</label><label class=\"radio inline\">\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"储藏分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">储藏分会\n</label><label class=\"radio inline\">\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"玉米深加工分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">玉米深加工分会\n</label><label class=\"radio \">\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" value=\"质检分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"\">质检分会\n</label></div>\n</div><div style=\"border-top-color: white; border-bottom-color: currentColor; border-top-width: 1px; border-bottom-width: medium; border-top-style: solid; border-bottom-style: none;\" class=\"control-group component\" data-original-title=\"复选控件\" data-content=\"&#13;&#10;  <form class=\'form\'>&#13;&#10;    <div class=\'controls\'>&#13;&#10;      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>&#13;&#10;      <label class=\'control-label\'>复选框</label>&#13;&#10;      <textarea style=\'min-height: 200px\' id=\'orgvalue\'></textarea>&#13;&#10;      <p class=\'help-block\'>一行一个选项</p>&#13;&#10;      <hr/>&#13;&#10;      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>&#13;&#10;    </div>&#13;&#10;  </form>\" trigger=\"manual\" rel=\"popover\">\n  <label class=\"control-label leipiplugins-orgname\">计划</label>\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\n<label class=\"checkbox inline\">\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"国家\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">国家\n</label><label class=\"checkbox inline\">\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"省\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">省\n</label><label class=\"checkbox inline\">\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"自然基金\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">自然基金\n</label><label class=\"checkbox inline\">\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"自选\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">自选\n</label><label class=\"checkbox inline\">\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"其他\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">其他\n</label></div>\n\n</div>\n\n    <div style=\"border-top-color: white; border-bottom-color: currentColor; border-top-width: 1px; border-bottom-width: medium; border-top-style: solid; border-bottom-style: none;\" class=\"control-group component\" data-original-title=\"文本框控件\" data-content=\"&#13;&#10;  <form class=\'form\'>&#13;&#10;    <div class=\'controls\'> &#13;&#10;      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>&#13;&#10;      <label class=\'control-label\'>默认值</label> <input type=\'text\' id=\'orgvalue\' placeholder=\'默认值\'>&#13;&#10;      <hr/>&#13;&#10;      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>&#13;&#10;    </div>&#13;&#10;  </form>\" trigger=\"manual\" rel=\"popover\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">联系人</label>\n  <div class=\"controls\">\n    <input class=\"leipiplugins\" title=\"联系人\" name=\"leipiNewField\" value=\"\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    \n\n    <div style=\"border-top-color: white; border-bottom-color: currentColor; border-top-width: 1px; border-bottom-width: medium; border-top-style: solid; border-bottom-style: none;\" class=\"control-group component\" data-original-title=\"文本框控件\" data-content=\"&#13;&#10;  <form class=\'form\'>&#13;&#10;    <div class=\'controls\'> &#13;&#10;      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>&#13;&#10;      <label class=\'control-label\'>默认值</label> <input type=\'text\' id=\'orgvalue\' placeholder=\'默认值\'>&#13;&#10;      <hr/>&#13;&#10;      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>&#13;&#10;    </div>&#13;&#10;  </form>\" trigger=\"manual\" rel=\"popover\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">联系电话</label>\n  <div class=\"controls\">\n    <input class=\"leipiplugins\" title=\"联系电话\" name=\"leipiNewField\" value=\"\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    \n\n    \n\n    \n\n    <div style=\"border-top-color: white; border-bottom-color: currentColor; border-top-width: 1px; border-bottom-width: medium; border-top-style: solid; border-bottom-style: none;\" class=\"control-group component\" data-original-title=\"文本框控件\" data-content=\"&#13;&#10;  <form class=\'form\'>&#13;&#10;    <div class=\'controls\'> &#13;&#10;      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>&#13;&#10;      <label class=\'control-label\'>默认值</label> <input type=\'text\' id=\'orgvalue\' placeholder=\'默认值\'>&#13;&#10;      <hr/>&#13;&#10;      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>&#13;&#10;    </div>&#13;&#10;  </form>\" trigger=\"manual\" rel=\"popover\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">电子邮箱</label>\n  <div class=\"controls\">\n    <input class=\"leipiplugins\" title=\"电子邮箱\" name=\"leipiNewField\" value=\"\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    <div class=\"control-group component\" data-original-title=\"文本框控件\" data-content=\"&#13;&#10;  <form class=\'form\'>&#13;&#10;    <div class=\'controls\'> &#13;&#10;      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>&#13;&#10;      <label class=\'control-label\'>默认值</label> <input type=\'text\' id=\'orgvalue\' placeholder=\'默认值\'>&#13;&#10;      <hr/>&#13;&#10;      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>&#13;&#10;    </div>&#13;&#10;  </form>\" trigger=\"manual\" rel=\"popover\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">身份证号</label>\n  <div class=\"controls\">\n    <input class=\"leipiplugins\" title=\"身份证号\" name=\"leipiNewField\" value=\"\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    </fieldset></form>                          \n                                 \n        ');
INSERT INTO `ca_baseinfo` VALUES ('83caf299-abba-47e9-b3ff-4e44a3511f00', '454545', '2016', '2', '0', '0', '1', '陈富渊测试_评审结果.rar', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\template\\83caf299-abba-47e9-b3ff-4e44a3511f00\\陈富渊测试_评审结果.rar', null, null, null, null, null, '2016-02-02 11:19:31', '2016-02-02 11:19:31', '\n           <form class=\"form-horizontal\"><fieldset><div id=\"legend\" class=\"\"><b><input type=\"hidden\" id=\"form_name\" name=\"form_name\" value=\"454545\" class=\"leipiplugins\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">454545</legend> </b> </div><div class=\"control-group\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">文本框</label>\n  <div class=\"controls\">\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"文本框\" value=\"\" class=\"leipiplugins\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    <div class=\"control-group\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">日期</label>\n  <div class=\"controls\">\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"日期\" value=\"\" class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    </fieldset></form>                          \n        ', '文本框,日期', '\n           <form id=\"target\" class=\"form-horizontal\" style=\"background-color: rgb(255, 255, 255);\"><fieldset><div id=\"legend\" class=\"component\" rel=\"popover\" trigger=\"manual\" data-content=\"<form class=\'form\'><div class=\'controls\'> <label class=\'control-label\'>科技奖名称</label> <input type=\'text\' id=\'orgvalue\' placeholder=\'请输入科技奖名称\'><hr/><button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button></div></form>\" data-original-title=\"编辑属性\" style=\"border-top-width: 1px; border-top-style: solid; border-top-color: white; border-bottom-style: none;\"><b><input type=\"hidden\" id=\"form_name\" name=\"form_name\" value=\"454545\" class=\"leipiplugins\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">454545</legend> </b> </div><div class=\"control-group component\" rel=\"popover\" trigger=\"manual\" data-content=\"\n  <form class=\'form\'>\n    <div class=\'controls\'> \n      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>\n      <label class=\'control-label\'>默认值</label> <input type=\'text\' id=\'orgvalue\' placeholder=\'默认值\'>\n      <hr/>\n      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>\n    </div>\n  </form>\" data-original-title=\"文本框控件\" style=\"border-top-width: 1px; border-top-style: solid; border-top-color: white; border-bottom-style: none;\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">文本框</label>\n  <div class=\"controls\">\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"文本框\" value=\"\" class=\"leipiplugins\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    <div class=\"control-group component\" rel=\"popover\" trigger=\"manual\" data-content=\"\n  <form class=\'form\'>\n    <div class=\'controls\'> \n      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>\n      <hr/>\n      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>\n    </div>\n  </form>\" data-original-title=\"日期控件\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">日期</label>\n  <div class=\"controls\">\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"日期\" value=\"\" class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    </fieldset></form>                          \n        ');
INSERT INTO `ca_baseinfo` VALUES ('92d07c07-2195-4d9c-a185-a8538cdb4a6b', '测试1', '2016', '2', '0', '0', '1', '申请书模板.doc', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\template\\92d07c07-2195-4d9c-a185-a8538cdb4a6b\\申请书模板.doc', '陈富渊测试_评审结果1.rar', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\template\\92d07c07-2195-4d9c-a185-a8538cdb4a6b\\陈富渊测试_评审结果1.rar', null, null, null, '2016-02-01 15:58:40', '2016-02-01 15:58:40', '\n           <form class=\"form-horizontal\"><fieldset><div id=\"legend\" class=\"\"><b><input type=\"hidden\" id=\"form_name\" name=\"form_name\" value=\"测试1\" class=\"leipiplugins\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">测试1</legend> </b> </div><div class=\"control-group\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">名称：</label>\n  <div class=\"controls\">\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"名称：\" value=\"\" class=\"leipiplugins\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    <div class=\"control-group\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">日期</label>\n  <div class=\"controls\">\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"日期\" value=\"\" class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    <div class=\"control-group\">\n  <!-- Select -->\n  <label class=\"control-label leipiplugins-orgname\">性别</label>\n  <div class=\"controls\">\n    <select name=\"leipiNewField\" title=\"性别\" class=\"leipiplugins\" leipiplugins=\"select\">\n      <option>男</option>\n      <option>女</option>\n      <option>其他</option></select>\n  </div>\n\n</div>\n\n    </fieldset></form>                          \n        ', '名称：,日期,性别', '\n           <form id=\"target\" class=\"form-horizontal\" style=\"background-color: rgb(255, 255, 255);\"><fieldset><div id=\"legend\" class=\"component\" rel=\"popover\" trigger=\"manual\" data-content=\"<form class=\'form\'><div class=\'controls\'> <label class=\'control-label\'>科技奖名称</label> <input type=\'text\' id=\'orgvalue\' placeholder=\'请输入科技奖名称\'><hr/><button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button></div></form>\" data-original-title=\"编辑属性\" style=\"border-top-width: 1px; border-top-style: solid; border-top-color: white; border-bottom-style: none;\"><b><input type=\"hidden\" id=\"form_name\" name=\"form_name\" value=\"测试1\" class=\"leipiplugins\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">测试1</legend> </b> </div><div class=\"control-group component\" rel=\"popover\" trigger=\"manual\" data-content=\"\n  <form class=\'form\'>\n    <div class=\'controls\'> \n      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>\n      <label class=\'control-label\'>默认值</label> <input type=\'text\' id=\'orgvalue\' placeholder=\'默认值\'>\n      <hr/>\n      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>\n    </div>\n  </form>\" data-original-title=\"文本框控件\" style=\"border-top-width: 1px; border-top-style: solid; border-top-color: white; border-bottom-style: none;\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">名称：</label>\n  <div class=\"controls\">\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"名称：\" value=\"\" class=\"leipiplugins\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    <div class=\"control-group component\" rel=\"popover\" trigger=\"manual\" data-content=\"\n  <form class=\'form\'>\n    <div class=\'controls\'> \n      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>\n      <hr/>\n      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>\n    </div>\n  </form>\" data-original-title=\"日期控件\" style=\"border-top-width: 1px; border-top-style: solid; border-top-color: white; border-bottom-style: none;\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">日期</label>\n  <div class=\"controls\">\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"日期\" value=\"\" class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    <div class=\"control-group component\" rel=\"popover\" trigger=\"manual\" data-content=\"\n  <form class=\'form\'>\n    <div class=\'controls\'>\n      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>\n      <label class=\'control-label\'>下拉选项</label>\n      <textarea style=\'min-height: 200px\' id=\'orgvalue\'></textarea>\n      <p class=\'help-block\'>一行一个选项</p>\n      <hr/>\n      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>\n    </div>\n  </form>\" data-original-title=\"下拉控件\">\n  <!-- Select -->\n  <label class=\"control-label leipiplugins-orgname\">性别</label>\n  <div class=\"controls\">\n    <select name=\"leipiNewField\" title=\"性别\" class=\"leipiplugins\" leipiplugins=\"select\">\n      <option>男</option>\n      <option>女</option>\n      <option>其他</option></select>\n  </div>\n\n</div>\n\n    </fieldset></form>                          \n        ');
INSERT INTO `ca_baseinfo` VALUES ('fa674373-0145-4bd9-ba56-10b8796d69f1', '陈富渊测试', '2016', '2', '0', '0', '1', null, null, null, null, null, null, null, '2016-01-21 10:50:06', '2016-01-21 10:50:06', '\n           <form class=\"form-horizontal\"><fieldset><div id=\"legend\" class=\"\"><b><input type=\"hidden\" id=\"form_name\" name=\"form_name\" value=\"陈富渊测试\" class=\"leipiplugins\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">陈富渊测试</legend> </b> </div><div class=\"control-group\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">文本框</label>\n  <div class=\"controls\">\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"文本框\" value=\"\" class=\"leipiplugins\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    <div class=\"control-group\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">日期</label>\n  <div class=\"controls\">\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"日期\" value=\"\" class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    </fieldset></form>                          \n        ', '文本框,日期', '\n           <form id=\"target\" class=\"form-horizontal\" style=\"background-color: rgb(255, 255, 255);\"><fieldset><div id=\"legend\" class=\"component\" rel=\"popover\" trigger=\"manual\" data-content=\"<form class=\'form\'><div class=\'controls\'> <label class=\'control-label\'>科技奖名称</label> <input type=\'text\' id=\'orgvalue\' placeholder=\'请输入科技奖名称\'><hr/><button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button></div></form>\" data-original-title=\"编辑属性\" style=\"border-top-width: 1px; border-top-style: solid; border-top-color: white; border-bottom-style: none;\"><b><input type=\"hidden\" id=\"form_name\" name=\"form_name\" value=\"陈富渊测试\" class=\"leipiplugins\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">陈富渊测试</legend> </b> </div><div class=\"control-group component\" rel=\"popover\" trigger=\"manual\" data-content=\"\n  <form class=\'form\'>\n    <div class=\'controls\'> \n      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>\n      <label class=\'control-label\'>默认值</label> <input type=\'text\' id=\'orgvalue\' placeholder=\'默认值\'>\n      <hr/>\n      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>\n    </div>\n  </form>\" data-original-title=\"文本框控件\" style=\"border-top-width: 1px; border-top-style: solid; border-top-color: white; border-bottom-style: none;\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">文本框</label>\n  <div class=\"controls\">\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"文本框\" value=\"\" class=\"leipiplugins\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    <div class=\"control-group component\" rel=\"popover\" trigger=\"manual\" data-content=\"\n  <form class=\'form\'>\n    <div class=\'controls\'> \n      <label class=\'control-label\'>控件名称</label> <input type=\'text\' id=\'orgname\' placeholder=\'必填项\'>\n      <hr/>\n      <button class=\'btn btn-info\' type=\'button\'>确定</button><button class=\'btn btn-danger\' type=\'button\'>取消</button>\n    </div>\n  </form>\" data-original-title=\"日期控件\">\n  <!-- Text -->\n  <label class=\"control-label leipiplugins-orgname\">日期</label>\n  <div class=\"controls\">\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"日期\" value=\"\" class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" leipiplugins=\"text\">\n  </div>\n\n</div>\n\n    </fieldset></form>                          \n        ');

-- ----------------------------
-- Table structure for `ca_declaration`
-- ----------------------------
DROP TABLE IF EXISTS `ca_declaration`;
CREATE TABLE `ca_declaration` (
  `id` varchar(64) NOT NULL,
  `BaseinfoID` varchar(64) DEFAULT NULL COMMENT '自定义奖项信息表id',
  `FormalReviewStatus` int(11) DEFAULT NULL COMMENT '形式审查状态（0形式审查中、1形式审查未通过-状态列显示补充材料按钮、2形式审查通过项目评审中、3项目评审通过、4项目评审未通过）',
  `FormalReviewOpinion` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '最新形式审查意见',
  `ReviewOpinion` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '评审意见',
  `DeclarationFile` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '提交申报书名称',
  `DeclarationFilePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '申报书上传路径',
  `DeclareID` int(11) DEFAULT NULL COMMENT '申报人编号',
  `Content` text CHARACTER SET utf8 COMMENT '申报内容，把界面保存进来',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `ModifyTime` datetime DEFAULT NULL COMMENT '修改时间',
  `RegisterNum` int(10) DEFAULT NULL COMMENT '登记号',
  `HeaderAttributeValue` varchar(5000) CHARACTER SET utf8 DEFAULT NULL COMMENT '表头属性对应的值，用;----;号隔开(;----;这个可防止用户在输入内容中包括，前台已验证)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ca_declaration
-- ----------------------------
INSERT INTO `ca_declaration` VALUES ('010ee272-cc64-46be-be6c-a0998de9f08e', '5117770c-7e06-40e8-9973-4cf89b520ea0', '0', null, null, '贵州南方嘉木食品有限公司推荐书.doc', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\submit\\010ee272-cc64-46be-be6c-a0998de9f08e\\172\\贵州南方嘉木食品有限公司推荐书.doc', '172', '\r\n         \r\n          \r\n           <form class=\"form-horizontal\"><fieldset><div id=\"legend\"><b><input id=\"form_name\" class=\"leipiplugins\" name=\"form_name\" value=\"成果鉴定\" type=\"hidden\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">成果鉴定</legend> </b> </div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">成果名称</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"成果名称\" name=\"leipiNewField\" value=\"陈海强\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Textarea -->\r\n  <label class=\"control-label leipiplugins-orgname\">完成单位</label>\r\n  <div class=\"controls\">\r\n    <div class=\"textarea\">\r\n          <textarea class=\"leipiplugins\" title=\"完成单位\" name=\"leipiNewField\" leipiplugins=\"textarea\" orgname=\"完成单位\"> 32</textarea>\r\n    </div>\r\n  </div>\r\n</div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">申请鉴定单位</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"申请鉴定单位\" name=\"leipiNewField\" value=\"43242\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">申请日期</label>\r\n  <div class=\"controls\">\r\n    <input class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" title=\"申请日期\" name=\"leipiNewField\" value=\"2016-01-07\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\" readonly=\"\">\r\n  </div>\r\n\r\n</div><div class=\"control-group\">\r\n  <label class=\"control-label leipiplugins-orgname\">主持鉴定单位</label>\r\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\r\n<label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"总会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">总会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"油脂分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">油脂分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"食品分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\" checked=\"checked\">食品分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"储藏分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">储藏分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"玉米深加工分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">玉米深加工分会\r\n</label><label class=\"radio \">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" value=\"质检分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"\">质检分会\r\n</label></div>\r\n</div><div class=\"control-group\">\r\n  <label class=\"control-label leipiplugins-orgname\">计划</label>\r\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\r\n<label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"国家\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">国家\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"省\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\" checked=\"checked\">省\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"自然基金\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">自然基金\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"自选\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">自选\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"其他\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">其他\r\n</label></div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">联系人</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"联系人\" name=\"leipiNewField\" value=\"323\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">联系电话</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"联系电话\" name=\"leipiNewField\" value=\"323\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    \r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">电子邮箱</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"电子邮箱\" name=\"leipiNewField\" value=\"323\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">身份证号</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"身份证号\" name=\"leipiNewField\" value=\"32\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    </fieldset></form>                          \r\n                     \r\n        \r\n      ', '2016-01-21 14:53:59', '2016-01-21 14:53:59', null, '陈海强;----; 32;----;43242;----;2016-01-07;----;食品分会;----;323;----;323;----;323;----;32;----;');
INSERT INTO `ca_declaration` VALUES ('2758ec48-d990-40b3-888a-3bb4ba4f08f7', 'fa674373-0145-4bd9-ba56-10b8796d69f1', '2', '565', null, null, null, '172', '', '2016-01-21 14:37:33', '2016-01-21 14:37:33', '7', null);
INSERT INTO `ca_declaration` VALUES ('489653e6-f37e-4d08-bac3-9ce029c17c47', 'fa674373-0145-4bd9-ba56-10b8796d69f1', '0', null, null, null, null, '170', '', '2016-01-21 10:54:37', '2016-01-21 10:54:37', null, null);
INSERT INTO `ca_declaration` VALUES ('578272bc-8e34-4af7-86df-3fd161fae4b8', '92d07c07-2195-4d9c-a185-a8538cdb4a6b', '2', '通过', null, '2015年度中国粮油学会科学技术奖申报书.pdf', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\submit\\578272bc-8e34-4af7-86df-3fd161fae4b8\\175\\2015年度中国粮油学会科学技术奖申报书.pdf', '175', '\r\n         \r\n         \r\n           <fieldset><div id=\"legend\" class=\"\"><b><input type=\"hidden\" id=\"form_name\" name=\"form_name\" value=\"测试1\" class=\"leipiplugins\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">测试1</legend> </b> </div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">名称：</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"名称：\" value=\"陈富渊\" class=\"leipiplugins\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">日期</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"日期\" value=\"2016-02-23\" class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" leipiplugins=\"text\" readonly=\"\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Select -->\r\n  <label class=\"control-label leipiplugins-orgname\">性别</label>\r\n  <div class=\"controls\">\r\n    <select name=\"leipiNewField\" title=\"性别\" class=\"leipiplugins\" leipiplugins=\"select\">\r\n      <option selected=\"selected\">男</option>\r\n      <option>女</option>\r\n      <option>其他</option></select>\r\n  </div>\r\n\r\n</div>\r\n\r\n    </fieldset>                          \r\n        \r\n      \r\n      ', '2016-02-01 16:45:10', '2016-02-01 17:28:20', '1', '陈富渊;----;2016-02-23;----;男;----;');
INSERT INTO `ca_declaration` VALUES ('79e5bd18-66ff-4b21-b166-b0982bb8edf8', '83caf299-abba-47e9-b3ff-4e44a3511f00', '0', null, null, '陈富渊测试_评审结果.rar', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\submit\\79e5bd18-66ff-4b21-b166-b0982bb8edf8\\164\\陈富渊测试_评审结果.rar', '164', '\r\n         \r\n           <form class=\"form-horizontal\"><fieldset><div id=\"legend\" class=\"\"><b><input type=\"hidden\" id=\"form_name\" name=\"form_name\" value=\"454545\" class=\"leipiplugins\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">454545</legend> </b> </div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">文本框</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"文本框\" value=\"23\" class=\"leipiplugins\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">日期</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"日期\" value=\"2016-02-17\" class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" leipiplugins=\"text\" readonly=\"\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    </fieldset></form>                          \r\n        \r\n      ', '2016-02-02 11:36:52', '2016-02-02 11:36:52', null, '23;----;2016-02-17;----;');
INSERT INTO `ca_declaration` VALUES ('8ba5173c-2815-4b2c-a223-f936129fd13e', '5117770c-7e06-40e8-9973-4cf89b520ea0', '2', '5', null, '贵州南方嘉木食品有限公司推荐书.doc', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\submit\\8ba5173c-2815-4b2c-a223-f936129fd13e\\176\\贵州南方嘉木食品有限公司推荐书.doc', '176', '\r\n         \r\n          \r\n           <fieldset><div id=\"legend\"><b><input id=\"form_name\" class=\"leipiplugins\" name=\"form_name\" value=\"成果鉴定\" type=\"hidden\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">成果鉴定</legend> </b> </div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">成果名称</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"成果名称\" name=\"leipiNewField\" value=\"陈富渊\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Textarea -->\r\n  <label class=\"control-label leipiplugins-orgname\">完成单位</label>\r\n  <div class=\"controls\">\r\n    <div class=\"textarea\">\r\n          <textarea class=\"leipiplugins\" title=\"完成单位\" name=\"leipiNewField\" leipiplugins=\"textarea\" orgname=\"完成单位\"> 3434</textarea>\r\n    </div>\r\n  </div>\r\n</div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">申请鉴定单位</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"申请鉴定单位\" name=\"leipiNewField\" value=\"434\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">申请日期</label>\r\n  <div class=\"controls\">\r\n    <input class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" title=\"申请日期\" name=\"leipiNewField\" value=\"2016-01-21\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\" readonly=\"\">\r\n  </div>\r\n\r\n</div><div class=\"control-group\">\r\n  <label class=\"control-label leipiplugins-orgname\">主持鉴定单位</label>\r\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\r\n<label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"总会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">总会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"油脂分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">油脂分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"食品分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\" checked=\"checked\">食品分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"储藏分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">储藏分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"玉米深加工分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">玉米深加工分会\r\n</label><label class=\"radio \">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" value=\"质检分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"\">质检分会\r\n</label></div>\r\n</div><div class=\"control-group\">\r\n  <label class=\"control-label leipiplugins-orgname\">计划</label>\r\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\r\n<label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"国家\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">国家\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"省\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">省\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"自然基金\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\" checked=\"checked\">自然基金\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"自选\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">自选\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"其他\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">其他\r\n</label></div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">联系人</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"联系人\" name=\"leipiNewField\" value=\"434\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">联系电话</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"联系电话\" name=\"leipiNewField\" value=\"434\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    \r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">电子邮箱</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"电子邮箱\" name=\"leipiNewField\" value=\"434\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">身份证号</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"身份证号\" name=\"leipiNewField\" value=\"434\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    </fieldset>                          \r\n                     \r\n        \r\n      ', '2016-01-21 10:21:31', '2016-01-21 10:21:31', '3', '陈富渊;----; 3434;----;434;----;2016-01-21;----;食品分会;----;434;----;434;----;434;----;434;----;');
INSERT INTO `ca_declaration` VALUES ('9dcbfff2-43e0-4cb4-91ff-1cf5078fe4b4', 'fa674373-0145-4bd9-ba56-10b8796d69f1', '0', null, null, null, null, '165', '', '2016-01-21 11:27:14', '2016-01-21 11:27:14', null, null);
INSERT INTO `ca_declaration` VALUES ('a6f92af7-735a-489b-90cc-61deb2ec1f30', '5117770c-7e06-40e8-9973-4cf89b520ea0', '2', '4', null, '贵州南方嘉木食品有限公司推荐书.doc', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\submit\\a6f92af7-735a-489b-90cc-61deb2ec1f30\\169\\贵州南方嘉木食品有限公司推荐书.doc', '169', '\r\n         \r\n          \r\n           <form class=\"form-horizontal\"><fieldset><div id=\"legend\"><b><input name=\"form_name\" class=\"leipiplugins\" id=\"form_name\" type=\"hidden\" value=\"成果鉴定\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">成果鉴定</legend> </b> </div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">成果名称</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" title=\"成果名称\" class=\"leipiplugins\" type=\"text\" placeholder=\"默认值\" value=\"陈富渊测试\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Textarea -->\r\n  <label class=\"control-label leipiplugins-orgname\">完成单位</label>\r\n  <div class=\"controls\">\r\n    <div class=\"textarea\">\r\n          <textarea name=\"leipiNewField\" title=\"完成单位\" class=\"leipiplugins\" leipiplugins=\"textarea\" orgname=\"完成单位\"> 但神烦大叔</textarea>\r\n    </div>\r\n  </div>\r\n</div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">申请鉴定单位</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" title=\"申请鉴定单位\" class=\"leipiplugins\" type=\"text\" placeholder=\"默认值\" value=\"343242\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">申请日期</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" title=\"申请日期\" class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" type=\"text\" readOnly=\"\" placeholder=\"默认值\" value=\"2016-01-07\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div><div class=\"control-group\">\r\n  <label class=\"control-label leipiplugins-orgname\">主持鉴定单位</label>\r\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\r\n<label class=\"radio inline\">\r\n<input name=\"leipiNewField\" title=\"主持鉴定单位\" class=\"leipiplugins\" type=\"radio\" value=\"总会\" leipiplugins=\"radio\" orginline=\"inline\">总会\r\n</label><label class=\"radio inline\">\r\n<input name=\"leipiNewField\" title=\"主持鉴定单位\" class=\"leipiplugins\" type=\"radio\" CHECKED=\"checked\" value=\"油脂分会\" leipiplugins=\"radio\" orginline=\"inline\">油脂分会\r\n</label><label class=\"radio inline\">\r\n<input name=\"leipiNewField\" title=\"主持鉴定单位\" class=\"leipiplugins\" type=\"radio\" value=\"食品分会\" leipiplugins=\"radio\" orginline=\"inline\">食品分会\r\n</label><label class=\"radio inline\">\r\n<input name=\"leipiNewField\" title=\"主持鉴定单位\" class=\"leipiplugins\" type=\"radio\" value=\"储藏分会\" leipiplugins=\"radio\" orginline=\"inline\">储藏分会\r\n</label><label class=\"radio inline\">\r\n<input name=\"leipiNewField\" title=\"主持鉴定单位\" class=\"leipiplugins\" type=\"radio\" value=\"玉米深加工分会\" leipiplugins=\"radio\" orginline=\"inline\">玉米深加工分会\r\n</label><label class=\"radio \">\r\n<input title=\"主持鉴定单位\" class=\"leipiplugins\" type=\"radio\" value=\"质检分会\" leipiplugins=\"radio\" orginline=\"\">质检分会\r\n</label></div>\r\n</div><div class=\"control-group\">\r\n  <label class=\"control-label leipiplugins-orgname\">计划</label>\r\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\r\n<label class=\"checkbox inline\">\r\n<input name=\"leipiNewField\" title=\"计划\" class=\"leipiplugins\" type=\"checkbox\" value=\"国家\" leipiplugins=\"checkbox\" orginline=\"inline\">国家\r\n</label><label class=\"checkbox inline\">\r\n<input name=\"leipiNewField\" title=\"计划\" class=\"leipiplugins\" type=\"checkbox\" CHECKED=\"checked\" value=\"省\" leipiplugins=\"checkbox\" orginline=\"inline\">省\r\n</label><label class=\"checkbox inline\">\r\n<input name=\"leipiNewField\" title=\"计划\" class=\"leipiplugins\" type=\"checkbox\" value=\"自然基金\" leipiplugins=\"checkbox\" orginline=\"inline\">自然基金\r\n</label><label class=\"checkbox inline\">\r\n<input name=\"leipiNewField\" title=\"计划\" class=\"leipiplugins\" type=\"checkbox\" value=\"自选\" leipiplugins=\"checkbox\" orginline=\"inline\">自选\r\n</label><label class=\"checkbox inline\">\r\n<input name=\"leipiNewField\" title=\"计划\" class=\"leipiplugins\" type=\"checkbox\" value=\"其他\" leipiplugins=\"checkbox\" orginline=\"inline\">其他\r\n</label></div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">联系人</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" title=\"联系人\" class=\"leipiplugins\" type=\"text\" placeholder=\"默认值\" value=\"43242\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">联系电话</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" title=\"联系电话\" class=\"leipiplugins\" type=\"text\" placeholder=\"默认值\" value=\"424\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    \r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">电子邮箱</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" title=\"电子邮箱\" class=\"leipiplugins\" type=\"text\" placeholder=\"默认值\" value=\"4324\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">身份证号</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" title=\"身份证号\" class=\"leipiplugins\" type=\"text\" placeholder=\"默认值\" value=\"4234\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    </fieldset></form>                          \r\n                     \r\n        \r\n      ', '2016-01-21 11:37:41', '2016-01-21 11:37:41', '1', '陈富渊测试;----; 但神烦大叔;----;343242;----;2016-01-07;----;油脂分会;----;43242;----;424;----;4324;----;4234;----;');
INSERT INTO `ca_declaration` VALUES ('ac1e8ae8-47a9-418b-ada7-86d9f767e0a1', 'fa674373-0145-4bd9-ba56-10b8796d69f1', '0', null, null, null, null, '173', '', '2016-01-21 10:51:00', '2016-01-21 10:51:00', null, null);
INSERT INTO `ca_declaration` VALUES ('c6872cb7-b3a9-4d6a-8a55-84c3827fcf4a', '5117770c-7e06-40e8-9973-4cf89b520ea0', '2', '', null, '附件2.粮油科技成果鉴定申请表1.doc', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\submit\\c6872cb7-b3a9-4d6a-8a55-84c3827fcf4a\\177\\附件2.粮油科技成果鉴定申请表1.doc', '177', '\r\n         \r\n          \r\n           <fieldset><div id=\"legend\"><b><input name=\"form_name\" class=\"leipiplugins\" id=\"form_name\" type=\"hidden\" value=\"成果鉴定\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">成果鉴定</legend> </b> </div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">成果名称</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" title=\"成果名称\" class=\"leipiplugins\" type=\"text\" placeholder=\"默认值\" value=\"茶叶籽油—低温低水份压榨纯物理精炼技术\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Textarea -->\r\n  <label class=\"control-label leipiplugins-orgname\">完成单位</label>\r\n  <div class=\"controls\">\r\n    <div class=\"textarea\">\r\n          <textarea name=\"leipiNewField\" title=\"完成单位\" class=\"leipiplugins\" leipiplugins=\"textarea\" orgname=\"完成单位\"> 贵州南方嘉木食品有限公司</textarea>\r\n    </div>\r\n  </div>\r\n</div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">申请鉴定单位</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" title=\"申请鉴定单位\" class=\"leipiplugins\" type=\"text\" placeholder=\"默认值\" value=\" 贵州粮食行业协会\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">申请日期</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" title=\"申请日期\" class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" type=\"text\" readonly=\"\" placeholder=\"默认值\" value=\"2016-01-20\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div><div class=\"control-group\">\r\n  <label class=\"control-label leipiplugins-orgname\">主持鉴定单位</label>\r\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\r\n<label class=\"radio inline\">\r\n<input name=\"leipiNewField\" title=\"主持鉴定单位\" class=\"leipiplugins\" type=\"radio\" value=\"总会\" leipiplugins=\"radio\" orginline=\"inline\">总会\r\n</label><label class=\"radio inline\">\r\n<input name=\"leipiNewField\" title=\"主持鉴定单位\" class=\"leipiplugins\" type=\"radio\" checked=\"checked\" value=\"油脂分会\" leipiplugins=\"radio\" orginline=\"inline\">油脂分会\r\n</label><label class=\"radio inline\">\r\n<input name=\"leipiNewField\" title=\"主持鉴定单位\" class=\"leipiplugins\" type=\"radio\" value=\"食品分会\" leipiplugins=\"radio\" orginline=\"inline\">食品分会\r\n</label><label class=\"radio inline\">\r\n<input name=\"leipiNewField\" title=\"主持鉴定单位\" class=\"leipiplugins\" type=\"radio\" value=\"储藏分会\" leipiplugins=\"radio\" orginline=\"inline\">储藏分会\r\n</label><label class=\"radio inline\">\r\n<input name=\"leipiNewField\" title=\"主持鉴定单位\" class=\"leipiplugins\" type=\"radio\" value=\"玉米深加工分会\" leipiplugins=\"radio\" orginline=\"inline\">玉米深加工分会\r\n</label><label class=\"radio \">\r\n<input title=\"主持鉴定单位\" class=\"leipiplugins\" type=\"radio\" value=\"质检分会\" leipiplugins=\"radio\" orginline=\"\">质检分会\r\n</label></div>\r\n</div><div class=\"control-group\">\r\n  <label class=\"control-label leipiplugins-orgname\">计划</label>\r\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\r\n<label class=\"checkbox inline\">\r\n<input name=\"leipiNewField\" title=\"计划\" class=\"leipiplugins\" type=\"checkbox\" value=\"国家\" leipiplugins=\"checkbox\" orginline=\"inline\">国家\r\n</label><label class=\"checkbox inline\">\r\n<input name=\"leipiNewField\" title=\"计划\" class=\"leipiplugins\" type=\"checkbox\" value=\"省\" leipiplugins=\"checkbox\" orginline=\"inline\">省\r\n</label><label class=\"checkbox inline\">\r\n<input name=\"leipiNewField\" title=\"计划\" class=\"leipiplugins\" type=\"checkbox\" value=\"自然基金\" leipiplugins=\"checkbox\" orginline=\"inline\">自然基金\r\n</label><label class=\"checkbox inline\">\r\n<input name=\"leipiNewField\" title=\"计划\" class=\"leipiplugins\" type=\"checkbox\" checked=\"checked\" value=\"自选\" leipiplugins=\"checkbox\" orginline=\"inline\">自选\r\n</label><label class=\"checkbox inline\">\r\n<input name=\"leipiNewField\" title=\"计划\" class=\"leipiplugins\" type=\"checkbox\" value=\"其他\" leipiplugins=\"checkbox\" orginline=\"inline\">其他\r\n</label></div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">联系人</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" title=\"联系人\" class=\"leipiplugins\" type=\"text\" placeholder=\"默认值\" value=\"金德国\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">联系电话</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" title=\"联系电话\" class=\"leipiplugins\" type=\"text\" placeholder=\"默认值\" value=\"13985665696\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    \r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">电子邮箱</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" title=\"电子邮箱\" class=\"leipiplugins\" type=\"text\" placeholder=\"默认值\" value=\"1658767542@qq.com\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">身份证号</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" title=\"身份证号\" class=\"leipiplugins\" type=\"text\" placeholder=\"默认值\" value=\"1324165468787987984\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    </fieldset>                          \r\n                     \r\n        \r\n      ', '2016-01-20 17:20:27', '2016-01-20 17:20:27', '6', '茶叶籽油—低温低水份压榨纯物理精炼技术;----; 贵州南方嘉木食品有限公司;----; 贵州粮食行业协会;----;2016-01-20;----;油脂分会;----;金德国;----;13985665696;----;1658767542@qq.com;----;1324165468787987984;----;');
INSERT INTO `ca_declaration` VALUES ('d91bc0d4-1589-4cf8-90ef-4a30ceced840', '83caf299-abba-47e9-b3ff-4e44a3511f00', '0', null, null, '回传申报书.docx', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\submit\\d91bc0d4-1589-4cf8-90ef-4a30ceced840\\175\\回传申报书.docx', '175', '', '2016-02-02 11:31:27', '2016-02-02 11:31:27', null, null);
INSERT INTO `ca_declaration` VALUES ('ee3e5eca-a28c-441b-9a10-404597abb531', 'fa674373-0145-4bd9-ba56-10b8796d69f1', '2', '通过', null, null, null, '175', '\r\n         \r\n         \r\n           <fieldset><div id=\"legend\" class=\"\"><b><input type=\"hidden\" id=\"form_name\" name=\"form_name\" value=\"陈富渊测试\" class=\"leipiplugins\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">陈富渊测试</legend> </b> </div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">文本框</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"文本框\" value=\"测试\" class=\"leipiplugins\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">日期</label>\r\n  <div class=\"controls\">\r\n    <input name=\"leipiNewField\" type=\"text\" placeholder=\"默认值\" title=\"日期\" value=\"2016-01-28\" class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" leipiplugins=\"text\" readonly=\"\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    </fieldset>                          \r\n        \r\n      \r\n      ', '2016-01-31 23:49:50', '2016-01-31 23:51:16', '4', '测试;----;2016-01-28;----;');
INSERT INTO `ca_declaration` VALUES ('f1eae73b-4321-48d6-82ad-f280325b51c6', '5117770c-7e06-40e8-9973-4cf89b520ea0', '2', '5', null, '贵州南方嘉木食品有限公司推荐书1.doc', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\submit\\f1eae73b-4321-48d6-82ad-f280325b51c6\\173\\贵州南方嘉木食品有限公司推荐书1.doc', '173', '\r\n         \r\n          \r\n           <fieldset><div id=\"legend\"><b><input id=\"form_name\" class=\"leipiplugins\" name=\"form_name\" value=\"成果鉴定\" type=\"hidden\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">成果鉴定</legend> </b> </div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">成果名称</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"成果名称\" name=\"leipiNewField\" value=\"jkdskjfdksj\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Textarea -->\r\n  <label class=\"control-label leipiplugins-orgname\">完成单位</label>\r\n  <div class=\"controls\">\r\n    <div class=\"textarea\">\r\n          <textarea class=\"leipiplugins\" title=\"完成单位\" name=\"leipiNewField\" leipiplugins=\"textarea\" orgname=\"完成单位\"> fsdfs</textarea>\r\n    </div>\r\n  </div>\r\n</div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">申请鉴定单位</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"申请鉴定单位\" name=\"leipiNewField\" value=\"dsfs\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">申请日期</label>\r\n  <div class=\"controls\">\r\n    <input class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" title=\"申请日期\" name=\"leipiNewField\" value=\"2016-01-21\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\" readonly=\"\">\r\n  </div>\r\n\r\n</div><div class=\"control-group\">\r\n  <label class=\"control-label leipiplugins-orgname\">主持鉴定单位</label>\r\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\r\n<label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"总会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">总会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"油脂分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">油脂分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"食品分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\" checked=\"checked\">食品分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"储藏分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">储藏分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"玉米深加工分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">玉米深加工分会\r\n</label><label class=\"radio \">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" value=\"质检分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"\">质检分会\r\n</label></div>\r\n</div><div class=\"control-group\">\r\n  <label class=\"control-label leipiplugins-orgname\">计划</label>\r\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\r\n<label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"国家\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">国家\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"省\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">省\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"自然基金\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\" checked=\"checked\">自然基金\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"自选\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">自选\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"其他\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">其他\r\n</label></div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">联系人</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"联系人\" name=\"leipiNewField\" value=\"fds\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">联系电话</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"联系电话\" name=\"leipiNewField\" value=\"fds\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    \r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">电子邮箱</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"电子邮箱\" name=\"leipiNewField\" value=\"fds\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">身份证号</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"身份证号\" name=\"leipiNewField\" value=\"fds\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    </fieldset>                          \r\n                     \r\n        \r\n      ', '2016-01-21 10:29:08', '2016-01-21 10:29:08', '2', 'jkdskjfdksj;----; fsdfs;----;dsfs;----;2016-01-21;----;食品分会;----;fds;----;fds;----;fds;----;fds;----;');
INSERT INTO `ca_declaration` VALUES ('fb32878a-b1b7-40df-9c89-24f11da4614b', '5117770c-7e06-40e8-9973-4cf89b520ea0', '1', 'r', null, null, null, '175', '\r\n         \r\n          \r\n           <fieldset><div id=\"legend\"><b><input id=\"form_name\" class=\"leipiplugins\" name=\"form_name\" value=\"成果鉴定\" type=\"hidden\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">成果鉴定</legend> </b> </div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">成果名称</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"成果名称\" name=\"leipiNewField\" value=\"陈富渊测试\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Textarea -->\r\n  <label class=\"control-label leipiplugins-orgname\">完成单位</label>\r\n  <div class=\"controls\">\r\n    <div class=\"textarea\">\r\n          <textarea class=\"leipiplugins\" title=\"完成单位\" name=\"leipiNewField\" leipiplugins=\"textarea\" orgname=\"完成单位\"> 1212</textarea>\r\n    </div>\r\n  </div>\r\n</div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">申请鉴定单位</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"申请鉴定单位\" name=\"leipiNewField\" value=\"212\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">申请日期</label>\r\n  <div class=\"controls\">\r\n    <input class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" title=\"申请日期\" name=\"leipiNewField\" value=\"2016-01-20\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\" readonly=\"\">\r\n  </div>\r\n\r\n</div><div class=\"control-group\">\r\n  <label class=\"control-label leipiplugins-orgname\">主持鉴定单位</label>\r\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\r\n<label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"总会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">总会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"油脂分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">油脂分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"食品分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\" checked=\"checked\">食品分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"储藏分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">储藏分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"玉米深加工分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">玉米深加工分会\r\n</label><label class=\"radio \">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" value=\"质检分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"\">质检分会\r\n</label></div>\r\n</div><div class=\"control-group\">\r\n  <label class=\"control-label leipiplugins-orgname\">计划</label>\r\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\r\n<label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"国家\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">国家\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"省\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\" checked=\"checked\">省\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"自然基金\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\" checked=\"checked\">自然基金\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"自选\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">自选\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"其他\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">其他\r\n</label></div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">联系人</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"联系人\" name=\"leipiNewField\" value=\"22\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">联系电话</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"联系电话\" name=\"leipiNewField\" value=\"22\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    \r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">电子邮箱</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"电子邮箱\" name=\"leipiNewField\" value=\"22\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">身份证号</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"身份证号\" name=\"leipiNewField\" value=\"22\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    </fieldset>                          \r\n                     \r\n        \r\n      ', '2016-01-20 16:59:32', '2016-01-20 16:59:32', '7', '陈富渊测试;----; 1212;----;212;----;2016-01-20;----;食品分会;----;22;----;22;----;22;----;22;----;');
INSERT INTO `ca_declaration` VALUES ('fb949a63-4ec6-4e1c-9085-acd445442012', '5117770c-7e06-40e8-9973-4cf89b520ea0', '2', '', null, '贵州南方嘉木食品有限公司推荐书.doc', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\submit\\fb949a63-4ec6-4e1c-9085-acd445442012\\165\\贵州南方嘉木食品有限公司推荐书.doc', '165', '\r\n         \r\n          \r\n           <fieldset><div id=\"legend\"><b><input id=\"form_name\" class=\"leipiplugins\" name=\"form_name\" value=\"成果鉴定\" type=\"hidden\" leipiplugins=\"form_name\"><legend class=\"leipiplugins-orgvalue\">成果鉴定</legend> </b> </div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">成果名称</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"成果名称\" name=\"leipiNewField\" value=\"陈富渊测试\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Textarea -->\r\n  <label class=\"control-label leipiplugins-orgname\">完成单位</label>\r\n  <div class=\"controls\">\r\n    <div class=\"textarea\">\r\n          <textarea class=\"leipiplugins\" title=\"完成单位\" name=\"leipiNewField\" leipiplugins=\"textarea\" orgname=\"完成单位\"> 中科软</textarea>\r\n    </div>\r\n  </div>\r\n</div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">申请鉴定单位</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"申请鉴定单位\" name=\"leipiNewField\" value=\"中科院\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div><div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">申请日期</label>\r\n  <div class=\"controls\">\r\n    <input class=\"Wdate leipiplugins\" onfocus=\"WdatePicker({isShowClear:false,readOnly:true})\" title=\"申请日期\" name=\"leipiNewField\" value=\"2016-01-20\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\" readonly=\"\">\r\n  </div>\r\n\r\n</div><div class=\"control-group\">\r\n  <label class=\"control-label leipiplugins-orgname\">主持鉴定单位</label>\r\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\r\n<label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"总会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\" checked=\"checked\">总会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"油脂分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">油脂分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"食品分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">食品分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"储藏分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">储藏分会\r\n</label><label class=\"radio inline\">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" name=\"leipiNewField\" value=\"玉米深加工分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"inline\">玉米深加工分会\r\n</label><label class=\"radio \">\r\n<input class=\"leipiplugins\" title=\"主持鉴定单位\" value=\"质检分会\" type=\"radio\" leipiplugins=\"radio\" orginline=\"\">质检分会\r\n</label></div>\r\n</div><div class=\"control-group\">\r\n  <label class=\"control-label leipiplugins-orgname\">计划</label>\r\n  <div class=\"controls leipiplugins-orgvalue\"><!-- Multiple Checkboxes -->\r\n<label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"国家\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\" checked=\"checked\">国家\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"省\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">省\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"自然基金\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">自然基金\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"自选\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">自选\r\n</label><label class=\"checkbox inline\">\r\n<input class=\"leipiplugins\" title=\"计划\" name=\"leipiNewField\" value=\"其他\" type=\"checkbox\" leipiplugins=\"checkbox\" orginline=\"inline\">其他\r\n</label></div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">联系人</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"联系人\" name=\"leipiNewField\" value=\"陈还枪\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">联系电话</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"联系电话\" name=\"leipiNewField\" value=\"1234243\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    \r\n\r\n    \r\n\r\n    \r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">电子邮箱</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"电子邮箱\" name=\"leipiNewField\" value=\"434324\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    <div class=\"control-group\">\r\n  <!-- Text -->\r\n  <label class=\"control-label leipiplugins-orgname\">身份证号</label>\r\n  <div class=\"controls\">\r\n    <input class=\"leipiplugins\" title=\"身份证号\" name=\"leipiNewField\" value=\"432432432\" type=\"text\" placeholder=\"默认值\" leipiplugins=\"text\">\r\n  </div>\r\n\r\n</div>\r\n\r\n    </fieldset>                          \r\n                     \r\n        \r\n      ', '2016-01-20 22:07:01', '2016-01-20 22:07:01', '5', '陈富渊测试;----; 中科软;----;中科院;----;2016-01-20;----;总会;----;陈还枪;----;1234243;----;434324;----;432432432;----;');

-- ----------------------------
-- Table structure for `ca_review`
-- ----------------------------
DROP TABLE IF EXISTS `ca_review`;
CREATE TABLE `ca_review` (
  `id` varchar(64) NOT NULL,
  `BaseinfoID` varchar(64) DEFAULT NULL COMMENT '自定义信息ID',
  `DeclarationID` varchar(64) DEFAULT NULL COMMENT '申报信息表id',
  `ISRecommend` int(11) DEFAULT NULL COMMENT '是否已推荐（0未推荐，1已推荐）',
  `ISSubmit` int(11) DEFAULT NULL COMMENT '是否已提交（1已提交，其他未提交，null也为未提交）',
  `Opinion` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '意见',
  `ExpertID` int(11) DEFAULT NULL COMMENT '评审人编号',
  `ScoreFile` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '评分表名称',
  `ScoreFilePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '评分表上传路径',
  `ReviewTime` datetime DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ca_review
-- ----------------------------
INSERT INTO `ca_review` VALUES ('0221e377-a1ed-438c-a61b-5edfccf79ef4', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'c6872cb7-b3a9-4d6a-8a55-84c3827fcf4a', '1', null, null, '126', '评分表模板1.doc', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\submit\\5117770c-7e06-40e8-9973-4cf89b520ea0\\126\\评分表模板1.doc', '2016-01-21 11:51:15', '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('0ac66046-3eb4-4776-8fe4-ae8cb523aa36', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'fb949a63-4ec6-4e1c-9085-acd445442012', null, null, null, '117', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('0d67382b-c7c5-448b-a87a-a5c1ce598750', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'fb949a63-4ec6-4e1c-9085-acd445442012', null, null, null, '120', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('178a601c-52a9-4adb-af42-bbbb18d4fca8', '5117770c-7e06-40e8-9973-4cf89b520ea0', '8ba5173c-2815-4b2c-a223-f936129fd13e', null, null, null, '122', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('1af2c2de-7eeb-4fc1-8c3c-d9996e296288', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'c6872cb7-b3a9-4d6a-8a55-84c3827fcf4a', null, null, null, '117', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('1caf2cef-7aed-43e7-b5f9-94ec1e21af61', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'fb949a63-4ec6-4e1c-9085-acd445442012', null, null, null, '121', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('26b52fd9-582f-4e02-b173-7b842de58fea', '92d07c07-2195-4d9c-a185-a8538cdb4a6b', '578272bc-8e34-4af7-86df-3fd161fae4b8', null, null, null, '400', null, null, null, '2016-02-01 17:29:43');
INSERT INTO `ca_review` VALUES ('29d6bf38-0f20-4018-b5a3-a25e00d70e07', '5117770c-7e06-40e8-9973-4cf89b520ea0', '8ba5173c-2815-4b2c-a223-f936129fd13e', null, null, null, '119', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('2a6a9abb-5b94-4116-8e7f-02e1bd185624', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'f1eae73b-4321-48d6-82ad-f280325b51c6', null, null, null, '119', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('30d716d4-dad7-478a-b9f9-3379da97f0c2', '92d07c07-2195-4d9c-a185-a8538cdb4a6b', '578272bc-8e34-4af7-86df-3fd161fae4b8', null, null, null, '395', null, null, null, '2016-02-01 17:29:43');
INSERT INTO `ca_review` VALUES ('336e74ec-5676-47b4-ae16-4104a2463b30', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'c6872cb7-b3a9-4d6a-8a55-84c3827fcf4a', null, null, null, '119', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('4287e820-929a-44bf-b855-7ba0b670233b', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'f1eae73b-4321-48d6-82ad-f280325b51c6', '1', '1', '543', '125', null, null, '2016-01-21 15:36:28', '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('45d0d740-a9a4-46d3-b183-a509fb961368', '5117770c-7e06-40e8-9973-4cf89b520ea0', '8ba5173c-2815-4b2c-a223-f936129fd13e', '1', '1', '3432', '125', '评分表模板.doc', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\submit\\5117770c-7e06-40e8-9973-4cf89b520ea0\\125\\评分表模板.doc', '2016-01-21 14:38:00', '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('47b50934-8ab0-49c0-911e-b5ee71c1722a', '92d07c07-2195-4d9c-a185-a8538cdb4a6b', '578272bc-8e34-4af7-86df-3fd161fae4b8', null, null, null, '396', null, null, null, '2016-02-01 17:29:43');
INSERT INTO `ca_review` VALUES ('4bb38379-4146-4210-8dc8-4a5bb49252f6', '5117770c-7e06-40e8-9973-4cf89b520ea0', '8ba5173c-2815-4b2c-a223-f936129fd13e', null, null, null, '118', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('544417ee-9dac-48da-a8b0-05108857def1', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'fb949a63-4ec6-4e1c-9085-acd445442012', '1', null, '34342', '126', null, null, '2016-01-21 12:13:29', '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('56b5b978-917a-4abb-bb4c-4e9e6f3cdb72', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'a6f92af7-735a-489b-90cc-61deb2ec1f30', '1', '1', '432', '125', null, null, '2016-01-21 11:57:35', '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('581d5108-6c4d-4049-8941-ca3e76f6d1ca', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'fb949a63-4ec6-4e1c-9085-acd445442012', null, null, null, '124', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('59d904c1-3e38-4961-b203-c9de760635a2', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'a6f92af7-735a-489b-90cc-61deb2ec1f30', null, null, null, '119', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('5d3046e6-00ba-4c87-b12e-31c9a0fe97e4', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'c6872cb7-b3a9-4d6a-8a55-84c3827fcf4a', null, null, null, '118', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('64d22590-17bd-4ba5-86a4-37640946c748', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'f1eae73b-4321-48d6-82ad-f280325b51c6', null, null, null, '123', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('66afc297-3ff4-46a8-931c-19098eefbf4f', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'fb949a63-4ec6-4e1c-9085-acd445442012', null, null, null, '119', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('66dc3a4e-a2e9-4cac-8082-7a9fff87eb37', '92d07c07-2195-4d9c-a185-a8538cdb4a6b', '578272bc-8e34-4af7-86df-3fd161fae4b8', null, null, null, '401', null, null, null, '2016-02-01 17:29:43');
INSERT INTO `ca_review` VALUES ('6ceee7f4-845f-477b-99a3-9fe446fb2787', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'a6f92af7-735a-489b-90cc-61deb2ec1f30', null, null, null, '118', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('75a9fe11-4f69-4664-bd47-6d20b6a79a95', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'c6872cb7-b3a9-4d6a-8a55-84c3827fcf4a', null, null, null, '123', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('77d9512b-b926-4a84-90f9-b291261b43be', '5117770c-7e06-40e8-9973-4cf89b520ea0', '8ba5173c-2815-4b2c-a223-f936129fd13e', null, null, null, '121', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('7f11b234-d459-4256-b5b3-95637b33df3c', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'a6f92af7-735a-489b-90cc-61deb2ec1f30', null, null, null, '123', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('80bb65e2-6188-4cbd-b991-9c3a98f89c8d', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'c6872cb7-b3a9-4d6a-8a55-84c3827fcf4a', null, null, null, '121', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('82de3f30-3817-4f9f-8244-c7006d7e1d3b', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'a6f92af7-735a-489b-90cc-61deb2ec1f30', null, null, null, '124', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('83c276f4-3368-494f-a8e7-9644d98be911', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'c6872cb7-b3a9-4d6a-8a55-84c3827fcf4a', '1', '1', '54353', '125', null, null, '2016-01-21 11:58:10', '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('88792c18-7534-4ca6-8c09-6a98a7867353', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'f1eae73b-4321-48d6-82ad-f280325b51c6', null, null, null, '120', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('8f476767-c1df-4a66-a6d6-328263434ebc', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'c6872cb7-b3a9-4d6a-8a55-84c3827fcf4a', null, null, null, '120', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('96546349-1d68-45d8-822b-bed11be7fdc0', '92d07c07-2195-4d9c-a185-a8538cdb4a6b', '578272bc-8e34-4af7-86df-3fd161fae4b8', null, null, null, '398', null, null, null, '2016-02-01 17:29:43');
INSERT INTO `ca_review` VALUES ('973090c1-392c-4a7a-83ee-42fb53a223d5', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'a6f92af7-735a-489b-90cc-61deb2ec1f30', null, null, null, '117', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('9dc6fc6f-4357-4921-bce5-ecc4d8fa68ab', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'a6f92af7-735a-489b-90cc-61deb2ec1f30', null, null, null, '126', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('a1eeb827-aa4b-4729-991b-fc694f67d5c3', '92d07c07-2195-4d9c-a185-a8538cdb4a6b', '578272bc-8e34-4af7-86df-3fd161fae4b8', '1', null, null, '392', '回传申报书.docx', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\submit\\92d07c07-2195-4d9c-a185-a8538cdb4a6b\\392\\回传申报书.docx', '2016-02-02 16:09:25', '2016-02-01 17:29:43');
INSERT INTO `ca_review` VALUES ('a4e30288-8241-4e79-a93c-8a4b96e085d0', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'fb949a63-4ec6-4e1c-9085-acd445442012', null, null, null, '122', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('a76fa635-6314-45af-859c-fef15f0dce50', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'fb949a63-4ec6-4e1c-9085-acd445442012', null, null, null, '123', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('a9755f47-22db-4195-a93a-0e847a92a5f4', '5117770c-7e06-40e8-9973-4cf89b520ea0', '8ba5173c-2815-4b2c-a223-f936129fd13e', null, null, null, '117', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('b3bb3138-32eb-41c4-884f-14902f89c74d', '5117770c-7e06-40e8-9973-4cf89b520ea0', '8ba5173c-2815-4b2c-a223-f936129fd13e', null, null, null, '126', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('bd64c6bf-5ac5-4918-8eb2-b3fdbf356187', '92d07c07-2195-4d9c-a185-a8538cdb4a6b', '578272bc-8e34-4af7-86df-3fd161fae4b8', null, null, null, '397', null, null, null, '2016-02-01 17:29:43');
INSERT INTO `ca_review` VALUES ('c1e1050b-0190-4cef-83ad-4916d9da52e2', '92d07c07-2195-4d9c-a185-a8538cdb4a6b', '578272bc-8e34-4af7-86df-3fd161fae4b8', null, null, null, '393', null, null, null, '2016-02-01 17:29:43');
INSERT INTO `ca_review` VALUES ('c8ceff3a-59a9-4fcc-b8d6-aaf9055410ad', '5117770c-7e06-40e8-9973-4cf89b520ea0', '8ba5173c-2815-4b2c-a223-f936129fd13e', null, null, null, '123', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('c93ee5fd-dc29-476c-b401-4ac33734ebcb', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'f1eae73b-4321-48d6-82ad-f280325b51c6', null, null, null, '126', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('cba6ed0c-0c0d-47f0-849f-bf93a0645740', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'fb949a63-4ec6-4e1c-9085-acd445442012', null, null, null, '118', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('cd5ab01d-e890-47d1-8eed-1dc368520b6b', '92d07c07-2195-4d9c-a185-a8538cdb4a6b', '578272bc-8e34-4af7-86df-3fd161fae4b8', null, null, null, '399', null, null, null, '2016-02-01 17:29:43');
INSERT INTO `ca_review` VALUES ('d2d0cedf-1b3d-4bd9-b322-b23605d11628', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'fb949a63-4ec6-4e1c-9085-acd445442012', '1', '1', '4324', '125', '回传申报书.docx', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa\\customawards\\doc\\submit\\5117770c-7e06-40e8-9973-4cf89b520ea0\\125\\回传申报书.docx', '2016-01-21 14:06:15', '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('d633ea93-2322-4b63-a1f2-66061b8b3b24', '5117770c-7e06-40e8-9973-4cf89b520ea0', '8ba5173c-2815-4b2c-a223-f936129fd13e', null, null, null, '120', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('d695e611-4599-468e-ae24-b3bbf3e3cf30', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'f1eae73b-4321-48d6-82ad-f280325b51c6', null, null, null, '122', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('d72706b3-f2a3-4d48-94ec-babf12d69245', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'f1eae73b-4321-48d6-82ad-f280325b51c6', null, null, null, '121', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('de3aec2e-80ad-4695-a645-5fae3660724b', '92d07c07-2195-4d9c-a185-a8538cdb4a6b', '578272bc-8e34-4af7-86df-3fd161fae4b8', null, null, null, '394', null, null, null, '2016-02-01 17:29:43');
INSERT INTO `ca_review` VALUES ('e635d567-0dd7-4064-92f4-dbb1b41ff568', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'a6f92af7-735a-489b-90cc-61deb2ec1f30', null, null, null, '122', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('e72dc64b-02e6-4ed4-9fe6-b4992e81d2d9', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'c6872cb7-b3a9-4d6a-8a55-84c3827fcf4a', null, null, null, '122', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('ed92b3ac-d252-4c9e-8293-e6914e350ca4', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'f1eae73b-4321-48d6-82ad-f280325b51c6', null, null, null, '117', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('f1562886-a348-463d-a7aa-f26aa31645aa', '5117770c-7e06-40e8-9973-4cf89b520ea0', '8ba5173c-2815-4b2c-a223-f936129fd13e', null, null, null, '124', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('f39e9190-f996-409d-be05-13ca0c03c984', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'a6f92af7-735a-489b-90cc-61deb2ec1f30', null, null, null, '120', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('f423ef13-9349-4e91-a7f1-6f830331aaa1', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'f1eae73b-4321-48d6-82ad-f280325b51c6', null, null, null, '124', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('f5656da3-6053-40ba-8531-70dbc5188753', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'c6872cb7-b3a9-4d6a-8a55-84c3827fcf4a', null, null, null, '124', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('fd2a7d0a-07bf-4f3d-90c0-440fd1407a60', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'f1eae73b-4321-48d6-82ad-f280325b51c6', null, null, null, '118', null, null, null, '2016-01-21 11:46:14');
INSERT INTO `ca_review` VALUES ('ffb5949c-e91d-480e-9bb7-801748166a6c', '5117770c-7e06-40e8-9973-4cf89b520ea0', 'a6f92af7-735a-489b-90cc-61deb2ec1f30', null, null, null, '121', null, null, null, '2016-01-21 11:46:14');

-- ----------------------------
-- Table structure for `ca_rormalreviewopinion`
-- ----------------------------
DROP TABLE IF EXISTS `ca_rormalreviewopinion`;
CREATE TABLE `ca_rormalreviewopinion` (
  `id` varchar(64) NOT NULL,
  `DeclarationID` varchar(64) DEFAULT NULL COMMENT '申报表id',
  `Status` int(11) DEFAULT NULL COMMENT '状态（1形式审查未通过2形式审查通过项目评审中）',
  `Opinion` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '意见',
  `AdminID` int(11) DEFAULT NULL COMMENT '审查人ID',
  `CreateTime` datetime DEFAULT NULL COMMENT '审查时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ca_rormalreviewopinion
-- ----------------------------
INSERT INTO `ca_rormalreviewopinion` VALUES ('04f71a3c-b373-40ee-b5c7-da03f629479c', '8ba5173c-2815-4b2c-a223-f936129fd13e', '2', '5', '2', '2016-01-21 11:43:43');
INSERT INTO `ca_rormalreviewopinion` VALUES ('07fed52d-7ff4-4c3d-b415-1454f1cce150', 'ee3e5eca-a28c-441b-9a10-404597abb531', '1', '不通过', '2', '2016-01-31 23:50:51');
INSERT INTO `ca_rormalreviewopinion` VALUES ('0b367586-2a61-4895-b146-57e7b1d549f1', '578272bc-8e34-4af7-86df-3fd161fae4b8', '2', '通过', '2', '2016-02-01 17:29:23');
INSERT INTO `ca_rormalreviewopinion` VALUES ('463c25e6-955b-4eca-85f5-9421ccb53417', 'fb949a63-4ec6-4e1c-9085-acd445442012', '2', '', '2', '2016-01-21 11:46:00');
INSERT INTO `ca_rormalreviewopinion` VALUES ('67b4a789-4cbc-40be-b3d7-dd14535925cf', 'fb32878a-b1b7-40df-9c89-24f11da4614b', '1', 'r', '2', '2016-01-21 11:46:09');
INSERT INTO `ca_rormalreviewopinion` VALUES ('70c676ad-b7aa-48e9-8309-a07e4a1e43cf', '578272bc-8e34-4af7-86df-3fd161fae4b8', '1', '不通过', '2', '2016-02-01 16:46:37');
INSERT INTO `ca_rormalreviewopinion` VALUES ('759e4e67-8d25-466d-8290-7a862dfe2a7c', 'ee3e5eca-a28c-441b-9a10-404597abb531', '2', '通过', '2', '2016-01-31 23:51:51');
INSERT INTO `ca_rormalreviewopinion` VALUES ('9b5ac954-9141-4dc2-9292-ccbf288a8e22', '2758ec48-d990-40b3-888a-3bb4ba4f08f7', '2', '565', '2', '2016-01-21 16:37:52');
INSERT INTO `ca_rormalreviewopinion` VALUES ('baa7add0-1f1a-4fc9-a492-df3cb425525a', 'f1eae73b-4321-48d6-82ad-f280325b51c6', '2', '5', '2', '2016-01-21 11:43:39');
INSERT INTO `ca_rormalreviewopinion` VALUES ('bc7f111e-c5a8-4888-947a-4fa65bcfba6c', 'c6872cb7-b3a9-4d6a-8a55-84c3827fcf4a', '2', '', '2', '2016-01-21 11:46:03');
INSERT INTO `ca_rormalreviewopinion` VALUES ('de8b3899-b657-4368-85b5-fc6ac96bf316', 'a6f92af7-735a-489b-90cc-61deb2ec1f30', '2', '4', '2', '2016-01-21 11:43:36');

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '公司ID',
  `Username` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `Password` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户密码',
  `LinkmanName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人姓名',
  `LinkmanPhone` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人手机',
  `Email` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '电子邮件',
  `CompanyName` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位名称',
  `CompanyAddress` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位地址',
  `ZipCode` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位邮编',
  `CompanyPhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位电话',
  `CompanyFax` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `IsMember` int(1) DEFAULT NULL COMMENT '是否会员(1为会员，0为非会员)',
  `MemberCode` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '会员号',
  `Note` text CHARACTER SET utf8,
  `AccountType` int(50) DEFAULT NULL COMMENT '账号类别(0为普通账号,1为推荐账号)',
  `LoginTime` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `status` int(1) DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('164', 'zy1111', 'e10adc3949ba59abbe56e057f20f883e', '1111', '1111', 'dddd@qq.com', '1111', null, null, null, null, '0', null, '', null, null, '1');
INSERT INTO `company` VALUES ('165', 'cs1', '96e79218965eb72c92a549dd5a330112', '测试', '13822170460', '243326549@qq.com', 'cs', null, null, null, null, null, null, '通过', null, null, '1');
INSERT INTO `company` VALUES ('166', 'yxj1111', 'b59c67bf196a4758191e42f76670ceba', '1111', '1111', '1111@qq.com', '1111', '1', '100012', null, null, '0', null, '', null, null, '1');
INSERT INTO `company` VALUES ('167', 'yxj1111', 'b59c67bf196a4758191e42f76670ceba', '1111', '1111', '1111@qq.com', '1111', '1', '100012', null, null, '0', null, '', null, null, '1');
INSERT INTO `company` VALUES ('168', 'hyb1111', 'b59c67bf196a4758191e42f76670ceba', '惠延波', '1344444444', '1@qq.com', '河南工大', null, null, null, null, null, null, '', null, null, '1');
INSERT INTO `company` VALUES ('169', 'dy1111', 'e10adc3949ba59abbe56e057f20f883e', '董宇', '1111', '1@qq.com', '牧羊', null, null, null, null, null, null, '', null, null, '1');
INSERT INTO `company` VALUES ('170', 'hr1111', 'e10adc3949ba59abbe56e057f20f883e', '何荣', '110', '1@qq.com', '南京财大', null, null, null, null, null, null, '', null, null, '1');
INSERT INTO `company` VALUES ('171', 'hdp1111', 'b59c67bf196a4758191e42f76670ceba', '何东平', '111', '1@qq.com', '武汉轻工', null, null, null, null, null, null, '', null, null, '1');
INSERT INTO `company` VALUES ('172', 'chzx1111', 'e10adc3949ba59abbe56e057f20f883e', '陈正行', '1111', '1@qq.com', '江大', null, null, null, null, null, null, '', null, null, '1');
INSERT INTO `company` VALUES ('173', 'lyl1111', 'e10adc3949ba59abbe56e057f20f883e', '刘玉兰', '1111', '1@qq.com', '河南工大', null, null, null, null, null, null, '', null, null, '1');
INSERT INTO `company` VALUES ('174', 'wsx1111', 'b59c67bf196a4758191e42f76670ceba', '王松雪', '1111', '1@qq.com', '粮科院', null, null, null, null, null, null, '', null, null, '1');
INSERT INTO `company` VALUES ('175', 'lsd01', 'e10adc3949ba59abbe56e057f20f883e', 'lsd', '13552965896', '13552965896@139.com', '申报单位一', null, null, null, null, '0', null, '', null, null, '1');
INSERT INTO `company` VALUES ('176', 'cds1111', 'e10adc3949ba59abbe56e057f20f883e', '严晓平', '1111', '1@qq.com', '成都所', null, null, null, null, '0', null, '', null, null, '1');
INSERT INTO `company` VALUES ('177', '2016lsd', 'e10adc3949ba59abbe56e057f20f883e', 'lsd', '123456789', '123456789@139.com', '123456789', null, null, null, null, '0', null, '', null, null, '1');
INSERT INTO `company` VALUES ('178', 'ccss1', 'e10adc3949ba59abbe56e057f20f883e', 'ccss1', '23423432', '243326549@qq.com', 'ccss1', '22', '22', '22', '22', null, null, '122', null, null, '1');
INSERT INTO `company` VALUES ('179', 'ssss1', 'e10adc3949ba59abbe56e057f20f883e', '54353', '5435', '3434@qq.com', '4543', null, null, null, null, null, null, '', null, null, '0');
INSERT INTO `company` VALUES ('180', 'rrrr1111', 'e10adc3949ba59abbe56e057f20f883e', '323', '323', '232@qq.com', '2323', null, null, null, null, null, null, '', null, null, '0');
INSERT INTO `company` VALUES ('181', 'cs1', 'c33367701511b4f6020ec61ded352059', null, null, '232@qq.com', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `company` VALUES ('182', 'cs1', 'c33367701511b4f6020ec61ded352059', null, null, '222@qq.com', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `expert`
-- ----------------------------
DROP TABLE IF EXISTS `expert`;
CREATE TABLE `expert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` text CHARACTER SET utf8 COMMENT '用户名',
  `Password` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录密码',
  `Name` text CHARACTER SET utf8,
  `Nation` text CHARACTER SET utf8 COMMENT '民族',
  `Sex` int(1) DEFAULT NULL COMMENT '性别',
  `Origin` text CHARACTER SET utf8 COMMENT '籍贯',
  `Birthday` date DEFAULT NULL,
  `Parties` text CHARACTER SET utf8 COMMENT '政治面貌',
  `Degree` text CHARACTER SET utf8 COMMENT '学历学位',
  `Learn` text CHARACTER SET utf8 COMMENT '所学专业',
  `Working` text CHARACTER SET utf8 COMMENT '从事专业',
  `TechTitle` text CHARACTER SET utf8 COMMENT '专业技术职称',
  `School` text CHARACTER SET utf8 COMMENT '毕业学校',
  `Job` text CHARACTER SET utf8 COMMENT '工作单位及职务',
  `Identity` text CHARACTER SET utf8 COMMENT '身份证号',
  `Address` text CHARACTER SET utf8 COMMENT '通讯地址',
  `Phone` text CHARACTER SET utf8 COMMENT '电话',
  `Email` text CHARACTER SET utf8,
  `Moblie` text CHARACTER SET utf8 COMMENT '手机',
  `ChapterID` text CHARACTER SET utf8 COMMENT '所属分会名称(逗号隔开)',
  `Situation` text CHARACTER SET utf8 COMMENT '技术组织任职情况',
  `RecommendTime` datetime DEFAULT NULL COMMENT '推荐单位意见时间',
  `RecommendNote` text CHARACTER SET utf8 COMMENT '推荐单位意见',
  `OfficeTime` datetime DEFAULT NULL COMMENT '学会理事长办公会意见时间',
  `OfficeNote` text CHARACTER SET utf8 COMMENT '学会理事长办公会意见',
  `Change` int(1) DEFAULT NULL COMMENT '是否允许修改资料',
  `beizhu` text CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=404 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of expert
-- ----------------------------
INSERT INTO `expert` VALUES ('54', 'wry', 'e10adc3949ba59abbe56e057f20f883e', '王瑞元', '民族', '1', '籍贯', '2016-02-09', '44', '学历学位', 'TE', '从事专业', '专业技术职称及任职时间', '毕业学校', '工作单位及职务', '5656565', '3434', '656', '434@QQ.COM', '12343434', '22,23,24,25', '434343434其他国内外学术、\n技术组织任职情况', '2015-12-18 15:59:51', '45ERTE', '2016-01-12 15:59:57', '543543', '1', null);
INSERT INTO `expert` VALUES ('55', 'zyr', 'e10adc3949ba59abbe56e057f20f883e', '张玉荣', '汉', '0', '新疆省阜康县', '1967-02-05', '中共党员', '大学/硕士', '食品科学', '粮油储藏与品质检验', '教授/2010年10月', '江南大学', '河南工业大学', '410102196702052000', '410102196702052000', '0371-6678022', 'yurongzh@163.com', '18623717819', '储藏分会', null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('56', 'hzj', 'e10adc3949ba59abbe56e057f20f883e', '何志军', '汉', '0', '浙江', '1969-01-01', '党员', '大学本科/理学士', '水生生物', '食品检验', '高级工程师/2006.12', '上海水产大学', '上海科茂粮油食品质量检测有限公司/副经理', '310109196910070845', '上海市府村路445号1幢103室', '021-50766095', 'h60889@sina.com', '13611786032', '质检分会', null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('57', 'scp', 'e10adc3949ba59abbe56e057f20f883e', '孙长坡', '汉', '1', '山东', '1975-09-24', '中共党员', '研究生/理学博士', '生物化学与分子生物学 ', '粮油微生物与质量安全', '正高/2013.03', '中国农业科学院', '国家粮食局科学研究院/团队负责人', '372927197509244718', '北京市西城区百万庄大街11号粮科大厦1104', '010-58523630', 'scp@chinagrain.org', '13718104129', '质检分会', '国际真菌毒素学会会员，质检分会理事', null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('58', 'xyx', 'e10adc3949ba59abbe56e057f20f883e', '许艳霞', '汉', '0', '湖北省仙桃市', '1982-07-01', '群众', '博士/博士研究生', '分析化学', '粮油检测及质量管理', '副教授/2011年12月', '武汉大学', '湖南省粮油产品质量监测中心', '429004198207292206', '长沙市开福区金霞经济开发区芙蓉北路粮油交易大楼北楼', '0731-89853103', '289637417@qq.com', '13548540012', '质检分会', null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('59', 'txy1', 'e10adc3949ba59abbe56e057f20f883e', '谭晓燕', '汉', '0', '黑龙江', '1964-09-17', '党员', '本科', '化学教育', '粮油储藏与检验', '副教授  2009.9', '哈尔滨师范大学', '黑龙江粮食职业学院', '230103196409174669', '哈尔滨市南岗区和兴路三道街83号', '18045059351', 'tanxiaoyan06@126.com', '13030037622', '储藏分会', null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('60', 'cb', 'e10adc3949ba59abbe56e057f20f883e', '崔波', '汉', '1', '山东诸城', '1973-07-23', '群众', '博士', '粮食油脂与植物蛋白工程', '玉米深加工', '教授，2012.04', '江南大学', '齐鲁工业大学食品科学与工程学院，院长', '370728197103232016', '齐鲁工业大学    山东省济南市长清区大学路3501号', '0531-89631191', 'cuiborr@163.com', '18660811718', '玉米分会', '山东省食品科技学会副秘书长', null, '推荐成为玉米深加工专业学科研究领域的技术骨干', null, null, '1', null);
INSERT INTO `expert` VALUES ('61', 'wdj', 'e10adc3949ba59abbe56e057f20f883e', '邬大江', '汉', '1', '江西高安', '1969-12-01', '党员', '大学/学士', '粮食加工', '粮食加工', '高级工程师', '河南工业大学', '浙江恒天控股集团有限公司副总', '362222196912047000', '浙江省杭州市萧山金一路1号', '57182835791', 'wdjiang2008@163.com', '13777385398', '发酵面食分会', '中国粮油学会理事', null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('100', 'wzj', 'e10adc3949ba59abbe56e057f20f883e', '汪振炯', '汉', '1', '浙江湖州', '1978-08-01', '党员', '博研/博士', '粮食油脂与植物蛋白工程', '食品科学与工程', '讲师/2013.5', '江南大学', '南京晓庄学院食品科学学院食品教研室主任', '42011119780801761X', '南京市江宁区弘景大道3601号', '025-86178303', 'wangzhenjiong@outlook.com', '15995278539', '中国粮油学会 会员', '中国生物工程学会 会员', null, '推荐成为玉米深加工专业玉米淀粉及其衍生物加工技术领域的技术骨干', null, null, '1', null);
INSERT INTO `expert` VALUES ('101', 'lht', 'e10adc3949ba59abbe56e057f20f883e', '李海涛', '汉', '0', '黑龙江', '1968-01-01', '党员', '博士', '动物生理', '农业', '技术总监/2012年', '美国奥本大学AUBURN UNIVERSITY', '中粮贸易饲料部', '230107196810220460', '北京朝阳门南大街八号福临门大厦五层', '85019681', 'lihaitao@cofco.com', '18610015078', '营养分会', '中国畜牧兽医学会高级会员', null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('102', 'wz', 'e10adc3949ba59abbe56e057f20f883e', '王竹', '汉', '0', '辽宁', '1970-03-20', '九三社员', '博士', '营养与食品卫生', '营养', '研究员/1993年', '浙江大学', '中国疾病预防控制中心营养与健康所', '330103197003200044', '北京西城区南纬路29号', '83132569', 'wzhblue5464@163.com', '13366322019', '营养分会', '中国营养学会副秘书长，北京营养师协会副理事长，地病分会委员，老年保健委员会委员等', null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('109', 'hwx', 'e10adc3949ba59abbe56e057f20f883e', '黄蔚霞', '汉', '0', '江西', '1973-06-01', '党员', '博士', '应用化学', '食品质量与安全', '高级工程师/2004.9', '大连理工大学', '中粮营养健康研究院', '36222219730623023', '北京昌平北七家科技城中粮', '010-56989810', 'huangwx@cofco.com', '13910552326', '营养分会', '中国粮油学会粮油质检分会常务理事', null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('112', 'zyx', 'e10adc3949ba59abbe56e057f20f883e', '赵玉霞', '汉', '0', '山东', '1972-02-01', '群众', '博士', '信息', '信息', '高工', '北京师范大学', '国贸工程设计院', '110108197202156403', '北京市西城区百万庄大街11号粮科大厦912', '58523589', 'shdzyx@126.com', '13661243526', '信息与自动化分会', null, '2015-04-03 18:04:08', '    该同志擅长信息领域，从事信息专业的工作，推荐为物联网与云计算分支的技术骨干。\n    同意推荐。', null, null, '1', null);
INSERT INTO `expert` VALUES ('114', 'lb', 'e10adc3949ba59abbe56e057f20f883e', '刘斌', '汉', '1', '河南郑州', '1974-01-01', null, '本科', '电子商务', '计算机信息技术', '高级工程师／2009', '郑州大学', '郑州华粮科技股份有限公司／总工程师', '410105197401102733', '郑州市郑东新区商务内环路28号中储粮大厦6楼', '0371-68085997', 'ryuuhin@163.com', '18638158839', '信息与自动化分会', null, null, '该同志擅长电子商务领域，从事计算机信息技术专业的工作，推荐为粮食信息智能处理与决策分支的技术骨干。\n    同意推荐。', null, null, '1', null);
INSERT INTO `expert` VALUES ('115', 'yld', 'e10adc3949ba59abbe56e057f20f883e', '杨雷东', '汉', '1', null, '1981-10-31', '群众', '硕士', '计算机应用', '粮食仪器研制', '副研究员 2008年', '北京理工大学', '中国科学院遥感与数字地球研究所', '410311198110315053', '北京市朝阳区大屯路奥运科学园区', '010-64842375', 'yangld@radi.ac.cn', '13520052091', '信息与自动化分会', '无', null, ' 该同志擅长计算机应用领域，从事粮食仪器研制专业的工作，推荐为粮食信息检测技术分支的技术骨干。\n    同意推荐。', null, null, '1', null);
INSERT INTO `expert` VALUES ('116', 'qp', 'e10adc3949ba59abbe56e057f20f883e', '邱平', '汉', '1', '福建', '1969-12-11', '预备党员', '大学本科/学士', '粮食加工', '粮食仓储、加工', '教授级高工/2013.12', '郑州粮食学院', '总工', '110102196912152000', '西城区百万庄大街11号粮科大厦', '58523473', '13701087279@126.com', '13701087279', '粮油学会物流分会', null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('117', 'jsr', 'e10adc3949ba59abbe56e057f20f883e', '金树人', '汉', '1', '上海', '1943-01-16', '中共党员', '大学毕业', '工业微生物', '淀粉精细化工', '教授级高工 2012.12', '北京轻工业学院', '广西轻工业研究院 顾问', '450103194301160515', '广西南宁市东葛路19－1荣和中央公园8－25－B', '0771－5675729', 'jinshuren2003@163.com', '13807888320', '玉米分会', '中粮集团公司第二届学术委员会委员', null, '推荐成为玉米深加工专业玉米淀粉及其衍生物加工技术领域的技术骨干', null, null, '1', null);
INSERT INTO `expert` VALUES ('118', 'ypb', 'e10adc3949ba59abbe56e057f20f883e', '余鹏彪', '汉', '1', '重庆梁平', '1964-09-02', '中共党员', '硕士研究生', '粮食工程', '工程设计及管理', '高级工程师，1996年', '郑州粮食学院', '四川省粮食工程设计院', '510624196409020017', '四川省成都市上东大街176号', '028-88651043', '251414685@qq.com', '13908028673', '粮油学会物流分会', null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('119', 'nq', 'e10adc3949ba59abbe56e057f20f883e', '聂琦', '汉', '1', '江苏', '1962-11-14', '中共党员', '硕士研究生', 'EMBA', '港口', '交通部经济师，1993年', '清华大学经济管理学院', '深圳赤湾港航股份有限公司副总', '440301196211087000', '深圳市南山区赤湾六路，赤湾石油大厦8楼', '26817637', 'sznieqi@126.com', '13802235000', '粮油学会物流分会', '深圳港口协会副秘书长，深圳市粮食协会监事会主席', null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('120', 'zjc', 'e10adc3949ba59abbe56e057f20f883e', '郑竟成', '汉', '1', '湖北公安', '1963-01-15', '中共党员', '硕士', '食品工程', '食品工程', '教授，2002年', '江南大学', '武汉轻工大学，图书馆馆长', '420104196301154000', '武汉轻工大学 图书馆', '027-83913431', 'JINGCHENGZHENG@163.COM', '13907128261', '油脂专业分会', '湖北省信息学会理事，中国油脂专业分会理事', null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('121', 'lz', 'e10adc3949ba59abbe56e057f20f883e', '罗质', '汉', '1', '福建 上杭', '1963-04-11', null, '大学本科/工学士', '油脂工程', '油脂及植物蛋白  工程', '副教授  2000', '无锡轻工业学院          （现江南大学）', '武汉轻工大学               食品科学与工程学院', '420102196304112532', '武汉市东西湖区常青花园学府南路68号     武汉轻工大学食品科学与工程学院', '027-83924790', 'luozhi0633@163.com', '13871016781', '油脂专业分会', null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('122', 'wxh', 'e10adc3949ba59abbe56e057f20f883e', '王秀华', '汉', '0', '山东', '1975-08-01', '群众', '本科/学士', '粮油加工', '粮油检验', '高工/2010年', '郑州粮食学院', '山东三星集团有限公司技术中心研发', '372330197508253765', '山东省邹平县韩店镇民营科技园', '0543-4618036', 'wxh63654@126.com', '13563054654', '油脂专业分会', null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('123', 'czj', 'e10adc3949ba59abbe56e057f20f883e', '程宗佳', '汉', '1', '江西南昌', '1962-05-01', null, '博士', '动物营养与饲料', '饲料', '研究员', '美国堪萨斯州立大学', '中粮营养健康研究院', '422038477', '北京昌平北七家未来科技城南区4路', null, 'chengzongjia@cofco.com', '13911300528', '饲料分会', '中国农牧首席CTO俱乐部秘书长（2014-现在）', null, '同意推荐。', null, null, '1', null);
INSERT INTO `expert` VALUES ('124', 'xss', 'e10adc3949ba59abbe56e057f20f883e', '解松嵩', '汉', '1', '安徽省铜陵', '1964-01-14', '中共党员', '本科/学士', '粮食工程', '饲料工业管理', '2000年评为高级工程师', '郑州粮食学院', '中粮饲料有限公司副总经理', '340702196401142074', '北京朝阳区朝阳门外南大街8号福临门大厦6F-02', '010-85636920', 'xiesongsong@163.com', '17701163267', '饲料分会', null, null, '同意推荐。', null, null, '1', null);
INSERT INTO `expert` VALUES ('125', 'wqn', 'e10adc3949ba59abbe56e057f20f883e', '王青年', '汉', '1', '湖南.祁阳', '1962-12-13', '中共党员', '大学本科', '经济管理', '粮食仓储', null, '解放军军需大学', '四川省粮食局仓储处 处长', '510122196212299878', '成都市上东大街176号', '028-86739833', '8515367@qq.com', '13808069813', '储藏分会', null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('126', 'zzy', 'e10adc3949ba59abbe56e057f20f883e', '金振玉', '汉', '1', '江苏常熟', '1943-05-05', '中共党员', '本科', '粮食工程', '粮油食品研究与工程', '教授级高工，1994', '无锡轻工业学院', '国粮局无锡科研设计院，原院长', '32021119420519341X', '江苏无锡市惠河路186号', null, 'jzy1943@163.com', '13812286863', '食品分会', '全国饲标委委员', null, '    金振玉教授级高工多年来长期从事粮油食品加工的科学研究、工程设计，主持研究的多项国家、部、省级重大科研项目成果达到国内领先水平。科研成果荣获国家科技进步奖三等奖一项，部、省级科技进步二等奖一项，三等奖一项。推荐为中国粮油学会专家库技术骨干。', null, null, '1', null);
INSERT INTO `expert` VALUES ('127', '54353', 'e10adc3949ba59abbe56e057f20f883e', '453', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('128', '3323', 'e10adc3949ba59abbe56e057f20f883e', '2323', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('129', '434', '17e62166fc8586dfa4d1bc0e1742c08b', '34', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('130', '33', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '23', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('131', '33', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '3', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('132', '33', '182be0c5cdcd5072bb1864cdee4d3d6e', '23', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('133', '323', 'bc6dc48b743dc5d013b1abaebd2faed2', '23', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, 'erer@qq.com', null, '23,24', null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('143', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 18:36:31 CST 2016');
INSERT INTO `expert` VALUES ('144', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 18:44:13 CST 2016');
INSERT INTO `expert` VALUES ('145', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 21:00:36 CST 2016');
INSERT INTO `expert` VALUES ('146', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 21:03:44 CST 2016');
INSERT INTO `expert` VALUES ('147', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 21:05:55 CST 2016');
INSERT INTO `expert` VALUES ('148', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 21:06:38 CST 2016');
INSERT INTO `expert` VALUES ('149', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 21:14:55 CST 2016');
INSERT INTO `expert` VALUES ('150', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 21:15:31 CST 2016');
INSERT INTO `expert` VALUES ('151', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 21:20:01 CST 2016');
INSERT INTO `expert` VALUES ('152', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 21:23:00 CST 2016');
INSERT INTO `expert` VALUES ('153', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 21:28:29 CST 2016');
INSERT INTO `expert` VALUES ('154', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 21:32:04 CST 2016');
INSERT INTO `expert` VALUES ('155', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 21:37:09 CST 2016');
INSERT INTO `expert` VALUES ('156', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 21:47:42 CST 2016');
INSERT INTO `expert` VALUES ('157', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 21:52:11 CST 2016');
INSERT INTO `expert` VALUES ('158', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', null, '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '推荐\n单位意见1', null, '学会理事长办公会意见1', '1', '导入,Tue Jan 26 21:57:05 CST 2016');
INSERT INTO `expert` VALUES ('159', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', null, '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '', null, '', '1', '导入,Tue Jan 26 22:03:37 CST 2016');
INSERT INTO `expert` VALUES ('160', 'ljx', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', null, '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', null, '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Tue Jan 26 22:04:45 CST 2016');
INSERT INTO `expert` VALUES ('161', 'ljx', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', null, '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', null, '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Tue Jan 26 22:07:05 CST 2016');
INSERT INTO `expert` VALUES ('162', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', null, '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '', null, '', '1', '导入,Tue Jan 26 22:07:07 CST 2016');
INSERT INTO `expert` VALUES ('163', 'hdm', 'e10adc3949ba59abbe56e057f20f883e', '韩德明', '汉', '1', '湖北', null, '', '大学/学士', '粮食加工工程', '粮食仓储、物流，饲料加工工程咨询，工程设计', '高级工程师', '郑州粮食学院', '国粮武汉科学研究设计院有限公司　　　副总工程师', '420111196208094019', '武汉市洪山区卓刀泉南路3号', '027－50657724', 'Hdm_wh@163.com', '13607188317', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:07:23 CST 2016');
INSERT INTO `expert` VALUES ('164', 'ljx', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', null, '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', null, '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Tue Jan 26 22:11:37 CST 2016');
INSERT INTO `expert` VALUES ('165', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', null, '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '', null, '', '1', '导入,Tue Jan 26 22:11:39 CST 2016');
INSERT INTO `expert` VALUES ('166', 'hdm', 'e10adc3949ba59abbe56e057f20f883e', '韩德明', '汉', '1', '湖北', null, '', '大学/学士', '粮食加工工程', '粮食仓储、物流，饲料加工工程咨询，工程设计', '高级工程师', '郑州粮食学院', '国粮武汉科学研究设计院有限公司　　　副总工程师', '420111196208094019', '武汉市洪山区卓刀泉南路3号', '027－50657724', 'Hdm_wh@163.com', '13607188317', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:11:42 CST 2016');
INSERT INTO `expert` VALUES ('167', 'ljx', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', null, '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Tue Jan 26 22:12:49 CST 2016');
INSERT INTO `expert` VALUES ('168', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '', null, '', '1', '导入,Tue Jan 26 22:12:51 CST 2016');
INSERT INTO `expert` VALUES ('169', 'ypb', 'e10adc3949ba59abbe56e057f20f883e', '余鹏彪', '汉', '1', '重庆梁平', '1964-09-02', '中共党员', '硕士研究生', '粮食工程', '工程设计及管理', '高级工程师，1996年', '郑州粮食学院', '四川省粮食工程设计院', '510624196409020017', '四川省成都市上东大街176号', '028-88651043', '251414685@qq.com', '13908028673', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:16:49 CST 2016');
INSERT INTO `expert` VALUES ('170', 'jlg', 'e10adc3949ba59abbe56e057f20f883e', '冀浏果', '汉', '0', '河北', '1974-06-01', '群众', '研究生/硕士', '粮食工程/工商管理', '粮食物流', '高级工程师 2008年12月', '中国人民大学', '国贸工程设计院 部门副总工', null, null, null, 'liuguoem@126.com', null, null, '', null, '1905', null, '', '1', '导入,Tue Jan 26 22:16:49 CST 2016');
INSERT INTO `expert` VALUES ('171', 'ypb', 'e10adc3949ba59abbe56e057f20f883e', '余鹏彪', '汉', '1', '重庆梁平', '1964-09-02', '中共党员', '硕士研究生', '粮食工程', '工程设计及管理', '高级工程师，1996年', '郑州粮食学院', '四川省粮食工程设计院', '510624196409020017', '四川省成都市上东大街176号', '028-88651043', '251414685@qq.com', '13908028673', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:19:08 CST 2016');
INSERT INTO `expert` VALUES ('172', 'jlg', 'e10adc3949ba59abbe56e057f20f883e', '冀浏果', '汉', '0', '河北', '1974-06-01', '群众', '研究生/硕士', '粮食工程/工商管理', '粮食物流', '高级工程师 2008年12月', '中国人民大学', '国贸工程设计院 部门副总工', null, null, null, 'liuguoem@126.com', null, null, '', null, '1905', null, '', '1', '导入,Tue Jan 26 22:19:08 CST 2016');
INSERT INTO `expert` VALUES ('173', 'ljx', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', null, '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Tue Jan 26 22:20:24 CST 2016');
INSERT INTO `expert` VALUES ('174', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '', null, '', '1', '导入,Tue Jan 26 22:20:25 CST 2016');
INSERT INTO `expert` VALUES ('175', 'ypb', 'e10adc3949ba59abbe56e057f20f883e', '余鹏彪', '汉', '1', '重庆梁平', '1964-09-02', '中共党员', '硕士研究生', '粮食工程', '工程设计及管理', '高级工程师，1996年', '郑州粮食学院', '四川省粮食工程设计院', '510624196409020017', '四川省成都市上东大街176号', '028-88651043', '251414685@qq.com', '13908028673', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:23:40 CST 2016');
INSERT INTO `expert` VALUES ('176', 'jlg', 'e10adc3949ba59abbe56e057f20f883e', '冀浏果', '汉', '0', '河北', '1974-06-01', '群众', '研究生/硕士', '粮食工程/工商管理', '粮食物流', '高级工程师 2008年12月', '中国人民大学', '国贸工程设计院 部门副总工', '', '百万庄大街11号粮科大厦', '2900038', 'liuguoem@126.com', '13910629008', null, '', null, '1905', null, '', '1', '导入,Tue Jan 26 22:23:40 CST 2016');
INSERT INTO `expert` VALUES ('177', 'ljx', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', null, '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Tue Jan 26 22:23:41 CST 2016');
INSERT INTO `expert` VALUES ('178', 'wwf', 'e10adc3949ba59abbe56e057f20f883e', '吴文福', '汉', '1', '甘肃白银', '1965-01-05', '民革', '研究生/博士', '农业机械化', '农业电气化及自动化', '教授、2005.1', '吉林大学', '吉林大学', '220102196501053394', '吉林大学生物与农业工程学院', '', 'wwfzlb@126.com', '13504472613', null, '粮食储运国家工程实验室理事、吉林省农业机械学会常务理事、中国粮油学会理事、吉林农业大学兼职教授', null, '', null, '', '1', '导入,Tue Jan 26 22:23:41 CST 2016');
INSERT INTO `expert` VALUES ('179', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '', 'tangxuejun@263.net', '13503864962', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:23:42 CST 2016');
INSERT INTO `expert` VALUES ('180', 'zzj', 'e10adc3949ba59abbe56e057f20f883e', '张忠杰', '汉', '1', '山东莱阳', '1966-02-28', '九三学社', '研究生/博士', '农产品加工与贮藏工程', '粮油干燥与储藏', '研究员，2009.11', '中国农业大学', '国家粮食局科学研究院，\n粮食储运国家工程实验室副主任\n', '', '北京市西城区百万庄大街11号', '', 'zzj@chinagrain.org', '13661225610', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:23:43 CST 2016');
INSERT INTO `expert` VALUES ('181', 'lfj', 'e10adc3949ba59abbe56e057f20f883e', '李福君', '汉', '1', '宁夏隆德', '1968-09-01', '中共党员', '大学/硕士', '植物保护', '粮食仓储物流', '副研究员 2011年', '北京农业大学', '国家粮食局科学研究院总工程师', '11010819680911933X', '北京市西城区百万庄大街11号', '2900039', 'lfj@chinagrain.org', '13801274036', null, '《粮油食品科技》主编；中国粮油学会常务理事、储藏分会副理事长', null, '', null, '', '1', '导入,Tue Jan 26 22:23:43 CST 2016');
INSERT INTO `expert` VALUES ('182', 'dlp', 'e10adc3949ba59abbe56e057f20f883e', '杜连鹏', '汉', '1', '黑龙江', '1968-11-04', '党员', '大学', '粮食工程', '粮食工程设计', '高级工程师  2004年', '郑州粮食学院', '国贸工程设计院', '110102196811042759', '北京市西城区百万庄大街11号', '010-58523511', 'dulianpeng@126.com', '13520053072', null, '', null, '2013年', null, '                                                              年   月   日', '1', '导入,Tue Jan 26 22:23:43 CST 2016');
INSERT INTO `expert` VALUES ('183', 'zt', 'e10adc3949ba59abbe56e057f20f883e', '甄彤', '', '1', '', '1964-12-17', '中共党员', '硕士', '计算机应用技术', '粮情测控技术', '教授', '武汉大学', '河南工业大学', '370105196412173716', '郑州市高新区莲花街1号', '0371-67756791', 'zt@haut.edu.cn', '13703950124', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:23:44 CST 2016');
INSERT INTO `expert` VALUES ('184', 'nq', 'e10adc3949ba59abbe56e057f20f883e', '聂琦', '汉', '1', '江苏', '1962-11-01', '中共党员', '硕士研究生', 'EMBA', '港口', '交通部经济师，1993年', '清华大学经济管理学院', '深圳赤湾港航股份有限公司副总', '5881510', '深圳市南山区赤湾六路，赤湾石油大厦8楼', '75324', 'sznieqi@126.com', '13802235000', null, '深圳港口协会副秘书长，深圳市粮食协会监事会主席', null, '', null, '', '1', '导入,Tue Jan 26 22:23:45 CST 2016');
INSERT INTO `expert` VALUES ('185', 'zml', 'e10adc3949ba59abbe56e057f20f883e', '郑沫利', '汉', '1', '广东', '1967-07-01', '中共党员', '大学本科/工学学士', '粮食工程', '粮食物流', '教授级高工，2009年11月14日', '武汉粮食工业学院', '国贸工程设计院工程咨询所所长', '420104196707034316', '北京市西城区百万庄大街11号粮科大厦801', '010-58523505', 'zhengmoli@sohu.com', '13311013766', null, '中国粮油学会理事；全国粮油标准化技术委员会委员；北京市工程咨询协会专家。', null, '', null, '', '1', '导入,Tue Jan 26 22:23:45 CST 2016');
INSERT INTO `expert` VALUES ('186', 'gl', 'e10adc3949ba59abbe56e057f20f883e', '高兰', '汉', '0', '河南 新安', '1975-09-26', '党员', '本科', '物流工程', '粮食物流', '2008年任高级工程师', '北京科技大学', '中粮工程科技（郑州）有限公司', '110108197509262243', '河南省郑州市南阳路153号', '0371-63753612', 'zzgaolan@163.com', '13526759156', null, '无', null, '东北地区水稻外运方式初探', null, '', '1', '导入,Tue Jan 26 22:23:46 CST 2016');
INSERT INTO `expert` VALUES ('187', 'whz', 'e10adc3949ba59abbe56e057f20f883e', '魏恒州', '汉', '1', '河北省元氏县', '1944-06-17', '中共党员', '大学', '港口工程', ' 港口机械 及     装卸工艺', '教授级高级工程师', '天津大学', '中交天津港湾工程设计院 专家', '120103194406175418', '天津港保税区 跃进路 航运服务中心 8号楼 一航局大厦10-12层', '022-25603895 ', 'whz4598@163.com', '13702174598', null, '全国港口标准化技术委员会委员 集装箱委员会委员', null, '', null, '', '1', '导入,Tue Jan 26 22:23:46 CST 2016');
INSERT INTO `expert` VALUES ('188', 'ljx', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', null, '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', null, '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Tue Jan 26 22:31:06 CST 2016');
INSERT INTO `expert` VALUES ('189', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', null, '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '', null, '', '1', '导入,Tue Jan 26 22:31:08 CST 2016');
INSERT INTO `expert` VALUES ('190', 'hdm', 'e10adc3949ba59abbe56e057f20f883e', '韩德明', '汉', '1', '湖北', null, '', '大学/学士', '粮食加工工程', '粮食仓储、物流，饲料加工工程咨询，工程设计', '高级工程师', '郑州粮食学院', '国粮武汉科学研究设计院有限公司　　　副总工程师', '420111196208094019', '武汉市洪山区卓刀泉南路3号', '027－50657724', 'Hdm_wh@163.com', '13607188317', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:31:10 CST 2016');
INSERT INTO `expert` VALUES ('191', 'ljx', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', null, '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', null, '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Tue Jan 26 22:32:17 CST 2016');
INSERT INTO `expert` VALUES ('192', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '', null, '', '1', '导入,Tue Jan 26 22:32:35 CST 2016');
INSERT INTO `expert` VALUES ('193', 'ljx', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', null, '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Tue Jan 26 22:33:28 CST 2016');
INSERT INTO `expert` VALUES ('194', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '', null, '', '1', '导入,Tue Jan 26 22:33:31 CST 2016');
INSERT INTO `expert` VALUES ('195', 'hdm', 'e10adc3949ba59abbe56e057f20f883e', '韩德明', '汉', '1', '湖北', null, '', '大学/学士', '粮食加工工程', '粮食仓储、物流，饲料加工工程咨询，工程设计', '高级工程师', '郑州粮食学院', '国粮武汉科学研究设计院有限公司　　　副总工程师', '420111196208094019', '武汉市洪山区卓刀泉南路3号', '027－50657724', 'Hdm_wh@163.com', '13607188317', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:33:34 CST 2016');
INSERT INTO `expert` VALUES ('196', 'ypb', 'e10adc3949ba59abbe56e057f20f883e', '余鹏彪', '汉', '1', '重庆梁平', '1964-09-02', '中共党员', '硕士研究生', '粮食工程', '工程设计及管理', '高级工程师，1996年', '郑州粮食学院', '四川省粮食工程设计院', '510624196409020017', '四川省成都市上东大街176号', '028-88651043', '251414685@qq.com', '13908028673', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:33:59 CST 2016');
INSERT INTO `expert` VALUES ('197', 'jlg', 'e10adc3949ba59abbe56e057f20f883e', '冀浏果', '汉', '0', '河北', '1974-06-01', '群众', '研究生/硕士', '粮食工程/工商管理', '粮食物流', '高级工程师 2008年12月', '中国人民大学', '国贸工程设计院 部门副总工', '', '百万庄大街11号粮科大厦', '2900038', 'liuguoem@126.com', '13910629008', null, '', null, '1905', null, '', '1', '导入,Tue Jan 26 22:33:59 CST 2016');
INSERT INTO `expert` VALUES ('198', 'lzj', 'e10adc3949ba59abbe56e057f20f883e', '冷志杰', '汉族', '0', '吉林德惠', null, '中共党员', '研究生/博士', '管理科学与工程', '物流管理', '教授，2003.9', '大连理工大学', '黑龙江八一农垦大学经济管理学院副院长', '5881510', '大庆市开发区新阳路2号', '0459-6819254', 'jenniferleng@163.com', '13836961589', null, '中国物流学会理事,中国农业工程学会农业系统工程专业委员会副主任，兼任《农业技术经济》等刊物的审稿人，《物流技术》编委,大庆物流采购联合会秘书长、副会长', null, '', null, '', '1', '导入,Tue Jan 26 22:33:59 CST 2016');
INSERT INTO `expert` VALUES ('199', 'ljx', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', null, '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Tue Jan 26 22:34:00 CST 2016');
INSERT INTO `expert` VALUES ('200', 'wwf', 'e10adc3949ba59abbe56e057f20f883e', '吴文福', '汉', '1', '甘肃白银', null, '民革', '研究生/博士', '农业机械化', '农业电气化及自动化', '教授、2005.1', '吉林大学', '吉林大学', '220102196501053394', '吉林大学生物与农业工程学院', '', 'wwfzlb@126.com', '13504472613', null, '粮食储运国家工程实验室理事、吉林省农业机械学会常务理事、中国粮油学会理事、吉林农业大学兼职教授', null, '', null, '', '1', '导入,Tue Jan 26 22:34:01 CST 2016');
INSERT INTO `expert` VALUES ('201', 'zxg', 'e10adc3949ba59abbe56e057f20f883e', '周晓光', '汉', '1', '上海', null, '党员', '研究生/博士', '机电控制', '物流自动化/信息化', '教授/1998', '清华大学/东京农工大学', '北京邮电大学/教育部信息网络工程研究中心副主任', '5881510', '100876北京市海淀区西土城路10号137信箱', '172424', 'zxg@bupt.edu.cn', '13701228266', null, '自动化学会设备制造委员会常委、机械工程学会高级会员、中国通信学会设备制造委员会委员', null, '', null, '', '1', '导入,Tue Jan 26 22:34:01 CST 2016');
INSERT INTO `expert` VALUES ('202', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '', 'tangxuejun@263.net', '13503864962', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:34:02 CST 2016');
INSERT INTO `expert` VALUES ('203', 'sw', 'e10adc3949ba59abbe56e057f20f883e', '宋 伟', '', '1', '', null, '中共党员', '', '粮食储藏', '粮食储藏技术与品质控制，储粮害虫防治', '教 授', '郑州粮食学院', '南京财经大学；教授', '320106195701013000', '南京市铁路北街128号16信箱', '', 'songwei@njue.edu.cn', '13809046127', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:34:03 CST 2016');
INSERT INTO `expert` VALUES ('204', 'qxm', 'e10adc3949ba59abbe56e057f20f883e', '屈新明', '汉', '1', '河南武陟', null, '中共党员', '本科', '经济管理', '经营管理', '经济师', '河南师范大学', '河南省粮食交易物流市场董事长兼总经理', '5881510', '郑州是黄河路11号豫粮大厦附4007', '0371-69156783', 'MHJ7040@126.COM', '', null, '河南粮食行业协会副会长', null, '', null, '', '1', '导入,Tue Jan 26 22:34:03 CST 2016');
INSERT INTO `expert` VALUES ('205', 'zzj', 'e10adc3949ba59abbe56e057f20f883e', '张忠杰', '汉', '1', '山东莱阳', null, '九三学社', '研究生/博士', '农产品加工与贮藏工程', '粮油干燥与储藏', '研究员，2009.11', '中国农业大学', '国家粮食局科学研究院，\n粮食储运国家工程实验室副主任\n', '', '北京市西城区百万庄大街11号', '', 'zzj@chinagrain.org', '13661225610', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:34:03 CST 2016');
INSERT INTO `expert` VALUES ('206', 'cbm', 'e10adc3949ba59abbe56e057f20f883e', '曹宝明', '汉', '1', '', null, '无党派', '博士', '农业经济', '农业经济管理\n农业技术经济\n农村经济发展\n', '', '南京农业大学', '南京财经大学粮食经济研究院院长 ', '', '南京市铁路北街128号31号信箱', '025-83495889', '2000cbm@163.com', '13805167536', null, '无', null, '', null, '', '1', '导入,Tue Jan 26 22:34:04 CST 2016');
INSERT INTO `expert` VALUES ('207', 'lfj', 'e10adc3949ba59abbe56e057f20f883e', '李福君', '汉', '1', '宁夏隆德', '1968-09-01', '中共党员', '大学/硕士', '植物保护', '粮食仓储物流', '副研究员 2011年', '北京农业大学', '国家粮食局科学研究院总工程师', '11010819680911933X', '北京市西城区百万庄大街11号', '2900039', 'lfj@chinagrain.org', '13801274036', null, '《粮油食品科技》主编；中国粮油学会常务理事、储藏分会副理事长', null, '', null, '', '1', '导入,Tue Jan 26 22:34:04 CST 2016');
INSERT INTO `expert` VALUES ('208', 'dlp', 'e10adc3949ba59abbe56e057f20f883e', '杜连鹏', '汉', '1', '黑龙江', null, '党员', '大学', '粮食工程', '粮食工程设计', '高级工程师  2004年', '郑州粮食学院', '国贸工程设计院', '110102196811042759', '北京市西城区百万庄大街11号', '010-58523511', 'dulianpeng@126.com', '13520053072', null, '', null, '2013年', null, '                                                              年   月   日', '1', '导入,Tue Jan 26 22:34:05 CST 2016');
INSERT INTO `expert` VALUES ('209', 'zt', 'e10adc3949ba59abbe56e057f20f883e', '甄彤', '', '1', '', null, '中共党员', '硕士', '计算机应用技术', '粮情测控技术', '教授', '武汉大学', '河南工业大学', '370105196412173716', '郑州市高新区莲花街1号', '0371-67756791', 'zt@haut.edu.cn', '13703950124', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:34:05 CST 2016');
INSERT INTO `expert` VALUES ('210', 'gc', 'e10adc3949ba59abbe56e057f20f883e', '管超', '', '1', '', null, '', '', '无线电工程', '计算机应用与自动控制', '教授级高工2007', '杭州商学院', '部门总工', '110102196208082713', '北京市西城区百万庄大街11号', '', 'Guanchao8421@126.com', '13910622331', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:34:06 CST 2016');
INSERT INTO `expert` VALUES ('211', 'nq', 'e10adc3949ba59abbe56e057f20f883e', '聂琦', '汉', '1', '江苏', '1962-11-01', '中共党员', '硕士研究生', 'EMBA', '港口', '交通部经济师，1993年', '清华大学经济管理学院', '深圳赤湾港航股份有限公司副总', '5881510', '深圳市南山区赤湾六路，赤湾石油大厦8楼', '75324', 'sznieqi@126.com', '13802235000', null, '深圳港口协会副秘书长，深圳市粮食协会监事会主席', null, '', null, '', '1', '导入,Tue Jan 26 22:34:06 CST 2016');
INSERT INTO `expert` VALUES ('212', 'qp', 'e10adc3949ba59abbe56e057f20f883e', '邱平', '汉族', '1', '福建', null, '预备党员', '大学本科/学士', '粮食加工', '粮食仓储、加工', '教授级高工/2013.12', '郑州粮食学院', '总工', '', '西城区百万庄大街11号粮科大厦', '162131', '13701087279@126.com', '13701087279', null, '', null, '', null, '', '1', '导入,Tue Jan 26 22:34:06 CST 2016');
INSERT INTO `expert` VALUES ('213', 'zml', 'e10adc3949ba59abbe56e057f20f883e', '郑沫利', '汉', '1', '广东', '1967-07-01', '中共党员', '大学本科/工学学士', '粮食工程', '粮食物流', '教授级高工，2009年11月14日', '武汉粮食工业学院', '国贸工程设计院工程咨询所所长', '420104196707034316', '北京市西城区百万庄大街11号粮科大厦801', '010-58523505', 'zhengmoli@sohu.com', '13311013766', null, '中国粮油学会理事；全国粮油标准化技术委员会委员；北京市工程咨询协会专家。', null, '', null, '', '1', '导入,Tue Jan 26 22:34:07 CST 2016');
INSERT INTO `expert` VALUES ('214', 'hdm', 'e10adc3949ba59abbe56e057f20f883e', '韩德明', '汉', '1', '湖北', null, null, '大学/学士', '粮食加工工程', '粮食仓储、物流，饲料加工工程咨询，工程设计', '高级工程师', '郑州粮食学院', '国粮武汉科学研究设计院有限公司　　　副总工程师', '420111196208094019', '武汉市洪山区卓刀泉南路3号', '027－50657724', 'Hdm_wh@163.com', '13607188317', null, null, '2016-01-27 22:36:18', '453', '2016-01-26 22:36:16', '435', '1', '导入,Tue Jan 26 22:34:07 CST 2016');
INSERT INTO `expert` VALUES ('215', 'gl', 'e10adc3949ba59abbe56e057f20f883e', '高兰', '汉', '0', '河南 新安', null, '党员', '本科', '物流工程', '粮食物流', '2008年任高级工程师', '北京科技大学', '中粮工程科技（郑州）有限公司', '110108197509262243', '河南省郑州市南阳路153号', '0371-63753612', 'zzgaolan@163.com', '13526759156', null, '无', null, '东北地区水稻外运方式初探', null, '', '1', '导入,Tue Jan 26 22:34:08 CST 2016');
INSERT INTO `expert` VALUES ('216', 'whz', 'e10adc3949ba59abbe56e057f20f883e', '魏恒州', '汉', '1', '河北省元氏县', '1944-06-17', '中共党员', '大学', '港口工程', ' 港口机械 及     装卸工艺', '教授级高级工程师', '天津大学', '中交天津港湾工程设计院 专家', '120103194406175418', '天津港保税区 跃进路 航运服务中心 8号楼 一航局大厦10-12层', '022-25603895 ', 'whz4598@163.com', '13702174598', null, '全国港口标准化技术委员会委员 集装箱委员会委员', null, '', null, '', '1', '导入,Tue Jan 26 22:34:08 CST 2016');
INSERT INTO `expert` VALUES ('217', 'ljx', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', null, '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Tue Jan 26 23:55:38 CST 2016');
INSERT INTO `expert` VALUES ('218', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '', null, '', '1', '导入,Tue Jan 26 23:55:39 CST 2016');
INSERT INTO `expert` VALUES ('219', 'ljx', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', null, '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Tue Jan 26 23:56:36 CST 2016');
INSERT INTO `expert` VALUES ('220', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '', null, '', '1', '导入,Tue Jan 26 23:56:36 CST 2016');
INSERT INTO `expert` VALUES ('221', 'hdm', 'e10adc3949ba59abbe56e057f20f883e', '韩德明', '汉', '1', '湖北', null, '', '大学/学士', '粮食加工工程', '粮食仓储、物流，饲料加工工程咨询，工程设计', '高级工程师', '郑州粮食学院', '国粮武汉科学研究设计院有限公司　　　副总工程师', '420111196208094019', '武汉市洪山区卓刀泉南路3号', '027－50657724', 'Hdm_wh@163.com', '13607188317', null, '', null, '', null, '', '1', '导入,Tue Jan 26 23:56:38 CST 2016');
INSERT INTO `expert` VALUES ('222', 'ljx', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', null, '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Wed Jan 27 00:01:46 CST 2016');
INSERT INTO `expert` VALUES ('223', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', null, '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 00:01:46 CST 2016');
INSERT INTO `expert` VALUES ('224', 'hdm', 'e10adc3949ba59abbe56e057f20f883e', '韩德明', '汉', '1', '湖北', null, '', '大学/学士', '粮食加工工程', '粮食仓储、物流，饲料加工工程咨询，工程设计', '高级工程师', '郑州粮食学院', '国粮武汉科学研究设计院有限公司　　　副总工程师', '420111196208094019', '武汉市洪山区卓刀泉南路3号', '027－50657724', 'Hdm_wh@163.com', '13607188317', null, '', null, '', null, '', '1', '导入,Wed Jan 27 00:01:48 CST 2016');
INSERT INTO `expert` VALUES ('225', 'ypb', 'e10adc3949ba59abbe56e057f20f883e', '余鹏彪', '汉', '1', '重庆梁平', '1964-09-02', '中共党员', '硕士研究生', '粮食工程', '工程设计及管理', '高级工程师，1996年', '郑州粮食学院', '四川省粮食工程设计院', '510624196409020017', '四川省成都市上东大街176号', '028-88651043', '251414685@qq.com', '13908028673', null, '', null, '', null, '', '1', '导入,Wed Jan 27 00:05:42 CST 2016');
INSERT INTO `expert` VALUES ('226', 'jlg', 'e10adc3949ba59abbe56e057f20f883e', '冀浏果', '汉', '0', '河北', '1974-06-01', '群众', '研究生/硕士', '粮食工程/工商管理', '粮食物流', '高级工程师 2008年12月', '中国人民大学', '国贸工程设计院 部门副总工', '', '百万庄大街11号粮科大厦', '2900038', 'liuguoem@126.com', '13910629008', null, '', null, '1905', null, '', '1', '导入,Wed Jan 27 00:05:43 CST 2016');
INSERT INTO `expert` VALUES ('227', 'lzj', 'e10adc3949ba59abbe56e057f20f883e', '冷志杰', '汉族', '0', '吉林德惠', null, '中共党员', '研究生/博士', '管理科学与工程', '物流管理', '教授，2003.9', '大连理工大学', '黑龙江八一农垦大学经济管理学院副院长', '5881510', '大庆市开发区新阳路2号', '0459-6819254', 'jenniferleng@163.com', '13836961589', null, '中国物流学会理事,中国农业工程学会农业系统工程专业委员会副主任，兼任《农业技术经济》等刊物的审稿人，《物流技术》编委,大庆物流采购联合会秘书长、副会长', null, '', null, '', '1', '导入,Wed Jan 27 00:05:43 CST 2016');
INSERT INTO `expert` VALUES ('228', 'ljx', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', null, '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Wed Jan 27 00:05:44 CST 2016');
INSERT INTO `expert` VALUES ('229', 'wwf', 'e10adc3949ba59abbe56e057f20f883e', '吴文福', '汉', '1', '甘肃白银', null, '民革', '研究生/博士', '农业机械化', '农业电气化及自动化', '教授、2005.1', '吉林大学', '吉林大学', '220102196501053394', '吉林大学生物与农业工程学院', '', 'wwfzlb@126.com', '13504472613', null, '粮食储运国家工程实验室理事、吉林省农业机械学会常务理事、中国粮油学会理事、吉林农业大学兼职教授', null, '', null, '', '1', '导入,Wed Jan 27 00:05:44 CST 2016');
INSERT INTO `expert` VALUES ('230', 'zxg', 'e10adc3949ba59abbe56e057f20f883e', '周晓光', '汉', '1', '上海', null, '党员', '研究生/博士', '机电控制', '物流自动化/信息化', '教授/1998', '清华大学/东京农工大学', '北京邮电大学/教育部信息网络工程研究中心副主任', '5881510', '100876北京市海淀区西土城路10号137信箱', '172424', 'zxg@bupt.edu.cn', '13701228266', null, '自动化学会设备制造委员会常委、机械工程学会高级会员、中国通信学会设备制造委员会委员', null, '', null, '', '1', '导入,Wed Jan 27 00:05:45 CST 2016');
INSERT INTO `expert` VALUES ('231', 'txj', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '', 'tangxuejun@263.net', '13503864962', null, '', null, '', null, '', '1', '导入,Wed Jan 27 00:05:46 CST 2016');
INSERT INTO `expert` VALUES ('232', 'sw', 'e10adc3949ba59abbe56e057f20f883e', '宋 伟', '', '1', '', null, '中共党员', '', '粮食储藏', '粮食储藏技术与品质控制，储粮害虫防治', '教 授', '郑州粮食学院', '南京财经大学；教授', '320106195701013000', '南京市铁路北街128号16信箱', '', 'songwei@njue.edu.cn', '13809046127', null, '', null, '', null, '', '1', '导入,Wed Jan 27 00:05:46 CST 2016');
INSERT INTO `expert` VALUES ('233', 'qxm', 'e10adc3949ba59abbe56e057f20f883e', '屈新明', '汉', '1', '河南武陟', null, '中共党员', '本科', '经济管理', '经营管理', '经济师', '河南师范大学', '河南省粮食交易物流市场董事长兼总经理', '5881510', '郑州是黄河路11号豫粮大厦附4007', '0371-69156783', 'MHJ7040@126.COM', '', null, '河南粮食行业协会副会长', null, '', null, '', '1', '导入,Wed Jan 27 00:05:47 CST 2016');
INSERT INTO `expert` VALUES ('234', 'zzj', 'e10adc3949ba59abbe56e057f20f883e', '张忠杰', '汉', '1', '山东莱阳', null, '九三学社', '研究生/博士', '农产品加工与贮藏工程', '粮油干燥与储藏', '研究员，2009.11', '中国农业大学', '国家粮食局科学研究院，\n粮食储运国家工程实验室副主任\n', '', '北京市西城区百万庄大街11号', '', 'zzj@chinagrain.org', '13661225610', null, '', null, '', null, '', '1', '导入,Wed Jan 27 00:05:47 CST 2016');
INSERT INTO `expert` VALUES ('235', 'cbm', 'e10adc3949ba59abbe56e057f20f883e', '曹宝明', '汉', '1', '', null, '无党派', '博士', '农业经济', '农业经济管理\n农业技术经济\n农村经济发展\n', '', '南京农业大学', '南京财经大学粮食经济研究院院长 ', '', '南京市铁路北街128号31号信箱', '025-83495889', '2000cbm@163.com', '13805167536', null, '无', null, '', null, '', '1', '导入,Wed Jan 27 00:05:48 CST 2016');
INSERT INTO `expert` VALUES ('236', 'lfj', 'e10adc3949ba59abbe56e057f20f883e', '李福君', '汉', '1', '宁夏隆德', '1968-09-01', '中共党员', '大学/硕士', '植物保护', '粮食仓储物流', '副研究员 2011年', '北京农业大学', '国家粮食局科学研究院总工程师', '11010819680911933X', '北京市西城区百万庄大街11号', '2900039', 'lfj@chinagrain.org', '13801274036', null, '《粮油食品科技》主编；中国粮油学会常务理事、储藏分会副理事长', null, '', null, '', '1', '导入,Wed Jan 27 00:05:48 CST 2016');
INSERT INTO `expert` VALUES ('237', 'dlp', 'e10adc3949ba59abbe56e057f20f883e', '杜连鹏', '汉', '1', '黑龙江', null, '党员', '大学', '粮食工程', '粮食工程设计', '高级工程师  2004年', '郑州粮食学院', '国贸工程设计院', '110102196811042759', '北京市西城区百万庄大街11号', '010-58523511', 'dulianpeng@126.com', '13520053072', null, '', null, '2013年', null, '                                                              年   月   日', '1', '导入,Wed Jan 27 00:05:49 CST 2016');
INSERT INTO `expert` VALUES ('238', 'zt', 'e10adc3949ba59abbe56e057f20f883e', '甄彤', '', '1', '', null, '中共党员', '硕士', '计算机应用技术', '粮情测控技术', '教授', '武汉大学', '河南工业大学', '370105196412173716', '郑州市高新区莲花街1号', '0371-67756791', 'zt@haut.edu.cn', '13703950124', null, '', null, '', null, '', '1', '导入,Wed Jan 27 00:05:49 CST 2016');
INSERT INTO `expert` VALUES ('239', 'gc', 'e10adc3949ba59abbe56e057f20f883e', '管超', '', '1', '', null, '', '', '无线电工程', '计算机应用与自动控制', '教授级高工2007', '杭州商学院', '部门总工', '110102196208082713', '北京市西城区百万庄大街11号', '', 'Guanchao8421@126.com', '13910622331', null, '', null, '', null, '', '1', '导入,Wed Jan 27 00:05:50 CST 2016');
INSERT INTO `expert` VALUES ('240', 'nq', 'e10adc3949ba59abbe56e057f20f883e', '聂琦', '汉', '1', '江苏', '1962-11-01', '中共党员', '硕士研究生', 'EMBA', '港口', '交通部经济师，1993年', '清华大学经济管理学院', '深圳赤湾港航股份有限公司副总', '5881510', '深圳市南山区赤湾六路，赤湾石油大厦8楼', '75324', 'sznieqi@126.com', '13802235000', null, '深圳港口协会副秘书长，深圳市粮食协会监事会主席', null, '', null, '', '1', '导入,Wed Jan 27 00:05:50 CST 2016');
INSERT INTO `expert` VALUES ('241', 'qp', 'e10adc3949ba59abbe56e057f20f883e', '邱平', '汉族', '1', '福建', null, '预备党员', '大学本科/学士', '粮食加工', '粮食仓储、加工', '教授级高工/2013.12', '郑州粮食学院', '总工', '', '西城区百万庄大街11号粮科大厦', '162131', '13701087279@126.com', '13701087279', null, '', null, '', null, '', '1', '导入,Wed Jan 27 00:05:51 CST 2016');
INSERT INTO `expert` VALUES ('242', 'zml', 'e10adc3949ba59abbe56e057f20f883e', '郑沫利', '汉', '1', '广东', '1967-07-01', '中共党员', '大学本科/工学学士', '粮食工程', '粮食物流', '教授级高工，2009年11月14日', '武汉粮食工业学院', '国贸工程设计院工程咨询所所长', '420104196707034316', '北京市西城区百万庄大街11号粮科大厦801', '010-58523505', 'zhengmoli@sohu.com', '13311013766', null, '中国粮油学会理事；全国粮油标准化技术委员会委员；北京市工程咨询协会专家。', null, '', null, '', '1', '导入,Wed Jan 27 00:05:51 CST 2016');
INSERT INTO `expert` VALUES ('243', 'hdm', 'e10adc3949ba59abbe56e057f20f883e', '韩德明', '汉', '1', '湖北', null, '', '大学/学士', '粮食加工工程', '粮食仓储、物流，饲料加工工程咨询，工程设计', '高级工程师', '郑州粮食学院', '国粮武汉科学研究设计院有限公司　　　副总工程师', '420111196208094019', '武汉市洪山区卓刀泉南路3号', '027－50657724', 'Hdm_wh@163.com', '13607188317', null, '', null, '', null, '', '1', '导入,Wed Jan 27 00:05:52 CST 2016');
INSERT INTO `expert` VALUES ('244', 'gl', 'e10adc3949ba59abbe56e057f20f883e', '高兰', '汉', '0', '河南 新安', null, '党员', '本科', '物流工程', '粮食物流', '2008年任高级工程师', '北京科技大学', '中粮工程科技（郑州）有限公司', '110108197509262243', '河南省郑州市南阳路153号', '0371-63753612', 'zzgaolan@163.com', '13526759156', null, '无', null, '东北地区水稻外运方式初探', null, '', '1', '导入,Wed Jan 27 00:05:52 CST 2016');
INSERT INTO `expert` VALUES ('245', 'whz', 'e10adc3949ba59abbe56e057f20f883e', '魏恒州', '汉', '1', '河北省元氏县', '1944-06-17', '中共党员', '大学', '港口工程', ' 港口机械 及     装卸工艺', '教授级高级工程师', '天津大学', '中交天津港湾工程设计院 专家', '120103194406175418', '天津港保税区 跃进路 航运服务中心 8号楼 一航局大厦10-12层', '022-25603895 ', 'whz4598@163.com', '13702174598', null, '全国港口标准化技术委员会委员 集装箱委员会委员', null, '', null, '', '1', '导入,Wed Jan 27 00:05:53 CST 2016');
INSERT INTO `expert` VALUES ('246', 'ljxcautomation', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', '', '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Wed Jan 27 10:52:25 CST 2016');
INSERT INTO `expert` VALUES ('247', 'txjtangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 10:52:25 CST 2016');
INSERT INTO `expert` VALUES ('248', 'cfytangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '陈富渊', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '22,29', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 10:52:26 CST 2016');
INSERT INTO `expert` VALUES ('249', 'hdmHdm_wh', 'e10adc3949ba59abbe56e057f20f883e', '韩德明', '汉', '1', '湖北', null, '', '大学/学士', '粮食加工工程', '粮食仓储、物流，饲料加工工程咨询，工程设计', '高级工程师', '郑州粮食学院', '国粮武汉科学研究设计院有限公司　　　副总工程师', '420111196208094019', '武汉市洪山区卓刀泉南路3号', '027－50657724', 'Hdm_wh@163.com', '13607188317', '', '', null, '', null, '', '1', '导入,Wed Jan 27 10:52:28 CST 2016');
INSERT INTO `expert` VALUES ('250', 'ljxcautomation', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', '', '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Wed Jan 27 10:54:56 CST 2016');
INSERT INTO `expert` VALUES ('251', 'txjtangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 10:54:57 CST 2016');
INSERT INTO `expert` VALUES ('252', 'cfytangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '陈富渊', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '22,29', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 10:54:57 CST 2016');
INSERT INTO `expert` VALUES ('253', 'hdmHdm_wh', 'e10adc3949ba59abbe56e057f20f883e', '韩德明', '汉', '1', '湖北', null, '', '大学/学士', '粮食加工工程', '粮食仓储、物流，饲料加工工程咨询，工程设计', '高级工程师', '郑州粮食学院', '国粮武汉科学研究设计院有限公司　　　副总工程师', '420111196208094019', '武汉市洪山区卓刀泉南路3号', '027－50657724', 'Hdm_wh@163.com', '13607188317', '', '', null, '', null, '', '1', '导入,Wed Jan 27 10:54:59 CST 2016');
INSERT INTO `expert` VALUES ('254', 'ljxcautomation', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', '', '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Wed Jan 27 10:56:23 CST 2016');
INSERT INTO `expert` VALUES ('255', 'txjtangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 10:56:23 CST 2016');
INSERT INTO `expert` VALUES ('256', 'cfytangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '陈富渊', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '22,29', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 10:56:24 CST 2016');
INSERT INTO `expert` VALUES ('257', 'hdmHdm_wh', 'e10adc3949ba59abbe56e057f20f883e', '韩德明', '汉', '1', '湖北', null, '', '大学/学士', '粮食加工工程', '粮食仓储、物流，饲料加工工程咨询，工程设计', '高级工程师', '郑州粮食学院', '国粮武汉科学研究设计院有限公司　　　副总工程师', '420111196208094019', '武汉市洪山区卓刀泉南路3号', '027－50657724', 'Hdm_wh@163.com', '13607188317', '', '', null, '', null, '', '1', '导入,Wed Jan 27 10:56:25 CST 2016');
INSERT INTO `expert` VALUES ('258', 'ljxcautomation', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', '', '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Wed Jan 27 10:58:09 CST 2016');
INSERT INTO `expert` VALUES ('259', 'txjtangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 10:58:09 CST 2016');
INSERT INTO `expert` VALUES ('260', 'cfytangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '陈富渊', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '22,29', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 10:58:10 CST 2016');
INSERT INTO `expert` VALUES ('261', 'hdmHdm_wh', 'e10adc3949ba59abbe56e057f20f883e', '韩德明', '汉', '1', '湖北', null, '', '大学/学士', '粮食加工工程', '粮食仓储、物流，饲料加工工程咨询，工程设计', '高级工程师', '郑州粮食学院', '国粮武汉科学研究设计院有限公司　　　副总工程师', '420111196208094019', '武汉市洪山区卓刀泉南路3号', '027－50657724', 'Hdm_wh@163.com', '13607188317', '', '', null, '', null, '', '1', '导入,Wed Jan 27 10:58:11 CST 2016');
INSERT INTO `expert` VALUES ('262', 'cfytangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '陈富渊', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '22,29', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 10:59:55 CST 2016');
INSERT INTO `expert` VALUES ('263', 'cfytangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '陈富渊', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '22,29', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 11:04:19 CST 2016');
INSERT INTO `expert` VALUES ('264', 'cfytangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '陈富渊', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '22,29', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 11:13:51 CST 2016');
INSERT INTO `expert` VALUES ('265', 'ljxcautomation', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', '', '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Wed Jan 27 11:17:02 CST 2016');
INSERT INTO `expert` VALUES ('266', 'txjtangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 11:17:05 CST 2016');
INSERT INTO `expert` VALUES ('267', 'cfytangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '陈富渊', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '22,29', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 11:17:08 CST 2016');
INSERT INTO `expert` VALUES ('268', 'cfytangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '陈富渊', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '22,29', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 11:17:08 CST 2016');
INSERT INTO `expert` VALUES ('269', 'ljxcautomation', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', '', '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Wed Jan 27 11:18:07 CST 2016');
INSERT INTO `expert` VALUES ('270', 'txjtangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 11:18:07 CST 2016');
INSERT INTO `expert` VALUES ('271', 'cfytangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '陈富渊', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '22,29', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 11:18:08 CST 2016');
INSERT INTO `expert` VALUES ('272', 'cfytangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '陈富渊', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '22,29', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 11:18:09 CST 2016');
INSERT INTO `expert` VALUES ('273', 'hdmHdm_wh', 'e10adc3949ba59abbe56e057f20f883e', '韩德明', '汉', '1', '湖北', null, '', '大学/学士', '粮食加工工程', '粮食仓储、物流，饲料加工工程咨询，工程设计', '高级工程师', '郑州粮食学院', '国粮武汉科学研究设计院有限公司　　　副总工程师', '420111196208094019', '武汉市洪山区卓刀泉南路3号', '027－50657724', 'Hdm_wh@163.com', '13607188317', '', '', null, '', null, '', '1', '导入,Wed Jan 27 11:18:11 CST 2016');
INSERT INTO `expert` VALUES ('274', 'ljxcautomation', 'e10adc3949ba59abbe56e057f20f883e', '冷江祥', '汉', '1', '江西', '1984-11-27', '群众', '本科', '机械设计', '物流自动化', '', '江西农业大学', '湖南智新科自动化设备有限公司 总经理 ', '360424198411261311', '湖南省长沙经济技术开发区东六路与漓湘路交汇处华天大厦1512室', '0731-86171253', 'cautomation@136.com', '13670124111', '', '无', null, '                                                    签字（盖章）： ', null, null, '1', '导入,Wed Jan 27 11:19:58 CST 2016');
INSERT INTO `expert` VALUES ('275', 'txjtangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '唐学军', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 11:19:59 CST 2016');
INSERT INTO `expert` VALUES ('276', 'cfytangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '陈富渊', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '22,29', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 11:19:59 CST 2016');
INSERT INTO `expert` VALUES ('277', 'cfytangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '陈富渊', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '22,29', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Jan 27 11:20:00 CST 2016');
INSERT INTO `expert` VALUES ('278', 'ypb251414685', 'e10adc3949ba59abbe56e057f20f883e', '余鹏彪', '汉', '1', '重庆梁平', '1964-09-02', '中共党员', '硕士研究生', '粮食工程', '工程设计及管理', '高级工程师，1996年', '郑州粮食学院', '四川省粮食工程设计院', '510624196409020017', '四川省成都市上东大街176号', '028-88651043', '251414685@qq.com', '13908028673', '', '', null, '', null, '', '1', '导入,Wed Jan 27 11:49:34 CST 2016');
INSERT INTO `expert` VALUES ('279', 'jlgliuguoem', 'e10adc3949ba59abbe56e057f20f883e', '冀浏果', '汉', '0', '河北', '1974-06-01', '群众', '研究生/硕士', '粮食工程/工商管理', '粮食物流', '高级工程师 2008年12月', '中国人民大学', '国贸工程设计院 部门副总工', '', '百万庄大街11号粮科大厦', '2900038', 'liuguoem@126.com', '13910629008', '', '', null, '1905', null, '', '1', '导入,Wed Jan 27 11:49:34 CST 2016');
INSERT INTO `expert` VALUES ('280', 'lzjjenniferleng', 'e10adc3949ba59abbe56e057f20f883e', '冷志杰', '汉族', '0', '吉林德惠', null, '中共党员', '研究生/博士', '管理科学与工程', '物流管理', '教授，2003.9', '大连理工大学', '黑龙江八一农垦大学经济管理学院副院长', '5881510', '大庆市开发区新阳路2号', '0459-6819254', 'jenniferleng@163.com', '13836961589', '', '中国物流学会理事,中国农业工程学会农业系统工程专业委员会副主任，兼任《农业技术经济》等刊物的审稿人，《物流技术》编委,大庆物流采购联合会秘书长、副会长', null, '', null, '', '1', '导入,Wed Jan 27 11:49:35 CST 2016');
INSERT INTO `expert` VALUES ('281', 'wwfwwfzlb', 'e10adc3949ba59abbe56e057f20f883e', '吴文福', '汉', '1', '甘肃白银', null, '民革', '研究生/博士', '农业机械化', '农业电气化及自动化', '教授、2005.1', '吉林大学', '吉林大学', '220102196501053394', '吉林大学生物与农业工程学院', '', 'wwfzlb@126.com', '13504472613', '', '粮食储运国家工程实验室理事、吉林省农业机械学会常务理事、中国粮油学会理事、吉林农业大学兼职教授', null, '', null, '', '1', '导入,Wed Jan 27 11:49:36 CST 2016');
INSERT INTO `expert` VALUES ('282', 'zxgzxg', 'e10adc3949ba59abbe56e057f20f883e', '周晓光', '汉', '1', '上海', null, '党员', '研究生/博士', '机电控制', '物流自动化/信息化', '教授/1998', '清华大学/东京农工大学', '北京邮电大学/教育部信息网络工程研究中心副主任', '5881510', '100876北京市海淀区西土城路10号137信箱', '172424', 'zxg@bupt.edu.cn', '13701228266', '', '自动化学会设备制造委员会常委、机械工程学会高级会员、中国通信学会设备制造委员会委员', null, '', null, '', '1', '导入,Wed Jan 27 11:49:36 CST 2016');
INSERT INTO `expert` VALUES ('283', 'swsongwei', 'e10adc3949ba59abbe56e057f20f883e', '宋 伟', '', '1', '', null, '中共党员', '', '粮食储藏', '粮食储藏技术与品质控制，储粮害虫防治', '教 授', '郑州粮食学院', '南京财经大学；教授', '320106195701013000', '南京市铁路北街128号16信箱', '', 'songwei@njue.edu.cn', '13809046127', '', '', null, '', null, '', '1', '导入,Wed Jan 27 11:49:37 CST 2016');
INSERT INTO `expert` VALUES ('284', 'qxmMHJ7040', 'e10adc3949ba59abbe56e057f20f883e', '屈新明', '汉', '1', '河南武陟', null, '中共党员', '本科', '经济管理', '经营管理', '经济师', '河南师范大学', '河南省粮食交易物流市场董事长兼总经理', '5881510', '郑州是黄河路11号豫粮大厦附4007', '0371-69156783', 'MHJ7040@126.COM', '', '', '河南粮食行业协会副会长', null, '', null, '', '1', '导入,Wed Jan 27 11:49:37 CST 2016');
INSERT INTO `expert` VALUES ('285', 'zzjzzj', 'e10adc3949ba59abbe56e057f20f883e', '张忠杰', '汉', '1', '山东莱阳', null, '九三学社', '研究生/博士', '农产品加工与贮藏工程', '粮油干燥与储藏', '研究员，2009.11', '中国农业大学', '国家粮食局科学研究院，\n粮食储运国家工程实验室副主任\n', '', '北京市西城区百万庄大街11号', '', 'zzj@chinagrain.org', '13661225610', '', '', null, '', null, '', '1', '导入,Wed Jan 27 11:49:38 CST 2016');
INSERT INTO `expert` VALUES ('286', 'cbm2000cbm', 'e10adc3949ba59abbe56e057f20f883e', '曹宝明', '汉', '1', '', null, '无党派', '博士', '农业经济', '农业经济管理\n农业技术经济\n农村经济发展\n', '', '南京农业大学', '南京财经大学粮食经济研究院院长 ', '', '南京市铁路北街128号31号信箱', '025-83495889', '2000cbm@163.com', '13805167536', '', '无', null, '', null, '', '1', '导入,Wed Jan 27 11:49:38 CST 2016');
INSERT INTO `expert` VALUES ('287', 'lfjlfj', 'e10adc3949ba59abbe56e057f20f883e', '李福君', '汉', '1', '宁夏隆德', '1968-09-01', '中共党员', '大学/硕士', '植物保护', '粮食仓储物流', '副研究员 2011年', '北京农业大学', '国家粮食局科学研究院总工程师', '11010819680911933X', '北京市西城区百万庄大街11号', '2900039', 'lfj@chinagrain.org', '13801274036', '', '《粮油食品科技》主编；中国粮油学会常务理事、储藏分会副理事长', null, '', null, '', '1', '导入,Wed Jan 27 11:49:39 CST 2016');
INSERT INTO `expert` VALUES ('288', 'dlpdulianpeng', 'e10adc3949ba59abbe56e057f20f883e', '杜连鹏', '汉', '1', '黑龙江', null, '党员', '大学', '粮食工程', '粮食工程设计', '高级工程师  2004年', '郑州粮食学院', '国贸工程设计院', '110102196811042759', '北京市西城区百万庄大街11号', '010-58523511', 'dulianpeng@126.com', '13520053072', '', '', null, '2013年', null, '                                                              年   月   日', '1', '导入,Wed Jan 27 11:49:39 CST 2016');
INSERT INTO `expert` VALUES ('289', 'ztzt', 'e10adc3949ba59abbe56e057f20f883e', '甄彤', '', '1', '', null, '中共党员', '硕士', '计算机应用技术', '粮情测控技术', '教授', '武汉大学', '河南工业大学', '370105196412173716', '郑州市高新区莲花街1号', '0371-67756791', 'zt@haut.edu.cn', '13703950124', '', '', null, '', null, '', '1', '导入,Wed Jan 27 11:49:40 CST 2016');
INSERT INTO `expert` VALUES ('290', 'gcGuanchao8421', 'e10adc3949ba59abbe56e057f20f883e', '管超', '', '1', '', null, '', '', '无线电工程', '计算机应用与自动控制', '教授级高工2007', '杭州商学院', '部门总工', '110102196208082713', '北京市西城区百万庄大街11号', '', 'Guanchao8421@126.com', '13910622331', '', '', null, '', null, '', '1', '导入,Wed Jan 27 11:49:40 CST 2016');
INSERT INTO `expert` VALUES ('291', 'nqsznieqi', 'e10adc3949ba59abbe56e057f20f883e', '聂琦', '汉', '1', '江苏', '1962-11-01', '中共党员', '硕士研究生', 'EMBA', '港口', '交通部经济师，1993年', '清华大学经济管理学院', '深圳赤湾港航股份有限公司副总', '5881510', '深圳市南山区赤湾六路，赤湾石油大厦8楼', '75324', 'sznieqi@126.com', '13802235000', '', '深圳港口协会副秘书长，深圳市粮食协会监事会主席', null, '', null, '', '1', '导入,Wed Jan 27 11:49:41 CST 2016');
INSERT INTO `expert` VALUES ('292', 'qp13701087279', 'e10adc3949ba59abbe56e057f20f883e', '邱平', '汉族', '1', '福建', null, '预备党员', '大学本科/学士', '粮食加工', '粮食仓储、加工', '教授级高工/2013.12', '郑州粮食学院', '总工', '', '西城区百万庄大街11号粮科大厦', '162131', '13701087279@126.com', '13701087279', '粮油学会物流分会', '', null, '', null, '', '1', '导入,Wed Jan 27 11:49:41 CST 2016');
INSERT INTO `expert` VALUES ('293', 'zmlzhengmoli', 'e10adc3949ba59abbe56e057f20f883e', '郑沫利', '汉', '1', '广东', '1967-07-01', '中共党员', '大学本科/工学学士', '粮食工程', '粮食物流', '教授级高工，2009年11月14日', '武汉粮食工业学院', '国贸工程设计院工程咨询所所长', '420104196707034316', '北京市西城区百万庄大街11号粮科大厦801', '010-58523505', 'zhengmoli@sohu.com', '13311013766', '', '中国粮油学会理事；全国粮油标准化技术委员会委员；北京市工程咨询协会专家。', null, '', null, '', '1', '导入,Wed Jan 27 11:49:41 CST 2016');
INSERT INTO `expert` VALUES ('294', 'glzzgaolan', 'e10adc3949ba59abbe56e057f20f883e', '高兰', '汉', '0', '河南 新安', null, '党员', '本科', '物流工程', '粮食物流', '2008年任高级工程师', '北京科技大学', '中粮工程科技（郑州）有限公司', '110108197509262243', '河南省郑州市南阳路153号', '0371-63753612', 'zzgaolan@163.com', '13526759156', '', '无', null, '东北地区水稻外运方式初探', null, '', '1', '导入,Wed Jan 27 11:49:42 CST 2016');
INSERT INTO `expert` VALUES ('295', 'whzwhz4598', 'e10adc3949ba59abbe56e057f20f883e', '魏恒州', '汉', '1', '河北省元氏县', '1944-06-17', '中共党员', '大学', '港口工程', ' 港口机械 及     装卸工艺', '教授级高级工程师', '天津大学', '中交天津港湾工程设计院 专家', '120103194406175418', '天津港保税区 跃进路 航运服务中心 8号楼 一航局大厦10-12层', '022-25603895 ', 'whz4598@163.com', '13702174598', '', '全国港口标准化技术委员会委员 集装箱委员会委员', null, '', null, '', '1', '导入,Wed Jan 27 11:49:43 CST 2016');
INSERT INTO `expert` VALUES ('296', 'yldzhtll999', 'e10adc3949ba59abbe56e057f20f883e', '杨龙德', '汉族', '1', '重庆', null, '中共党员', '研究生', '工商管理（MBA）', '企业管理', '高级经济师', '中国人民大学', '重庆粮食集团副总经理', '510228195504150038’', '重庆市渝中区泰安大厦', '023－63708508', 'zhtll999@sina.com', '13908325623', '', '重庆市粮油行业协会 副会长', null, '', null, '', '1', '导入,Thu Jan 28 10:56:38 CST 2016');
INSERT INTO `expert` VALUES ('297', 'xhmxiongheming', 'e10adc3949ba59abbe56e057f20f883e', '熊鹤鸣', '汉', '1', '', null, '党员', '大学本科/学士', '粮油储藏', '仓储管理', '正高级工程师', '郑州粮食学院', '中国储备粮管理总公司仓储管理部部长', '420102195705111210', '北京市西城区西直门外大街甲143号（邮编：100044）', '010-88016698', 'xiongheming@sohu.com', '13907130206', '', '', null, '散装稻谷储藏品质变化规律的研究', null, '1905', '1', '导入,Thu Jan 28 10:56:39 CST 2016');
INSERT INTO `expert` VALUES ('298', 'wytwytxyl', 'e10adc3949ba59abbe56e057f20f883e', '王玉田', '汉', '1', '河南开封', null, '中共党员', '硕士学位', '农产品储藏与加工、公共管理', '仓储管理', '无', '河南农业大学、中南财经政法大学', '河南省粮食局流通与科技发展处副处长', '，410105197605292000', '郑州市黄河路11号', '0371-65683107', 'wytxyl@126.com', '13949088655', '储藏分会', '', null, '', null, '', '1', '导入,Thu Jan 28 10:56:39 CST 2016');
INSERT INTO `expert` VALUES ('299', 'wqn8515367', 'e10adc3949ba59abbe56e057f20f883e', '王青年', '汉', '1', '湖南.祁阳', null, '中共党员', '大学本科', '经济管理', '粮食仓储', '', '解放军军需大学', '四川省粮食局仓储处 处长', '510122196212299878', '成都市上东大街176号', '028-86739833', '8515367@qq.com', '13808069813', '', '', null, '', null, '', '1', '导入,Thu Jan 28 10:56:39 CST 2016');
INSERT INTO `expert` VALUES ('300', 'gysgaoys666', 'e10adc3949ba59abbe56e057f20f883e', '高玉树', '汉', '1', '北京市怀柔区', null, '中共党员', '研究生', '科学技术哲学', '粮油储藏', '高级技师 5年', '中央党校在职研究生院', '北京市西南郊粮食收储库 部长', '110104196510200453', '北京市西城区马连道路13号', '010-63267018', 'gaoys666@126.com', '13601259929', '储藏分会', '北京市粮食行业协会仓储分会技术委员会成员', null, '', null, '', '1', '导入,Thu Jan 28 10:56:40 CST 2016');
INSERT INTO `expert` VALUES ('301', 'wgf13503310825', 'e10adc3949ba59abbe56e057f20f883e', '魏国富', '汉', '1', '河北藁城', null, '中共党员', '本科', '粮油储检', '粮食储藏', '高级工程师2004年', '郑州粮食学院（函授）', '中央储备粮涿州直属库、书记', '130104196412250610', '河北省涿州市郦道元路中央储备粮涿州直属库', '0312——3985598', '13503310825@163.COM', '13503310825', '', '中国粮油学会储备分会理事', null, '', null, '', '1', '导入,Thu Jan 28 10:56:41 CST 2016');
INSERT INTO `expert` VALUES ('302', 'djwcddingj', 'e10adc3949ba59abbe56e057f20f883e', '丁建武', '汉族', '1', '河南开封', null, '中共党员', '硕士', '食品科学与工程', '粮油储藏', '高级工程师,2007年评聘', '郑州粮食学院', '中储粮成都粮食储藏科学研究所', '410204197312251015', '四川省成都市青羊工业总部基地内广富路239号N区32幢', '028-87661768', 'cddingj@163.com', '13330943350', '', '/', null, '', null, '', '1', '导入,Thu Jan 28 10:56:41 CST 2016');
INSERT INTO `expert` VALUES ('303', 'fpcchucangzhongxin', 'e10adc3949ba59abbe56e057f20f883e', '付鹏程', '汉', '1', '四川巴中', null, '民盟', '硕士研究生/学士', '粮油储藏、机电一体化', '粮油储藏', '研究员、2011年', '郑州粮食学院', '中储粮成都粮食储藏科学研究所 副总工程师', ',513027197011260612', '四川省成都市青羊区广富路239号32幢', '(028)87668536', 'chucangzhongxin@126.com', '13350071379', '', '1.中国粮油学会理事，储藏技术专家组成员。2.全国粮油标准化委员会“粮油储藏及物流分会”副组长单位联络人。3.成都市科技评估技术专家。\n', null, '', null, '', '1', '导入,Thu Jan 28 10:56:42 CST 2016');
INSERT INTO `expert` VALUES ('304', 'lsblanshengbin', 'e10adc3949ba59abbe56e057f20f883e', '兰盛斌', '汉', '1', '四川彭州', null, '中共党员', '本科/学士', '粮油储藏', '粮油储藏、质检', '2011年任职研究员', '河南工业大学', '中储粮成都粮食储藏科学研究所', '，510126196909010013', '成都市青羊区广富路239号N区32栋', '028-87663506', 'lanshengbin@163.com', '13330943358', '', '中国粮油学会理事、中国粮油学会质检分会常务理事', null, '', null, '', '1', '导入,Thu Jan 28 10:56:43 CST 2016');
INSERT INTO `expert` VALUES ('305', 'bchzjbchh', 'e10adc3949ba59abbe56e057f20f883e', '卜春海', '汉族', '1', '河南商城', null, '中共党员', '大学学士', '粮油储藏', '仓储管理 仓储技术', '正高级工程师', '郑州粮食学院', '中储粮浙江分公司总经理、党组书记', '110102196909122431', '杭州市求是路8号公元大厦北楼19层', '0571-86753699', 'zjbchh@sina.com', '18958083601', '', '中国粮油学会储藏分会副会长；全国专业标准化技术委员会委员；全国粮食职业教育教学指导委员会委员', null, '', null, '', '1', '导入,Thu Jan 28 10:56:43 CST 2016');
INSERT INTO `expert` VALUES ('306', 'yzhyzh_9988', 'e10adc3949ba59abbe56e057f20f883e', '叶真洪', '汉族', '1', '重庆忠县', '1970-06-28', '', '大学/工学学士', '粮油储藏', '粮油储藏', '高级工程师2009年12月', '南京财经大学', '中储粮成都粮食储藏科学研究所', '510702197006280713', '成都市青羊区广富路239号（N区）32栋', '028-87660926', 'yzh_9988@163.com', '13540010361', '', '无', null, '', null, '', '1', '导入,Thu Jan 28 10:56:44 CST 2016');
INSERT INTO `expert` VALUES ('307', 'zfyzhoufengying1964', 'e10adc3949ba59abbe56e057f20f883e', '周凤英', '汉', '0', '沈阳', null, '', '研究生/硕士', '粮油储藏、食品科学', '粮油储藏', '教授，2010年9月', '郑州粮食学院', '黑龙江粮食职业学院', '5881510', '哈尔滨市南岗区和兴路92号黑龙江广播电视大学粮油工程', '5881510', 'zhoufengying1964@163.com', '13796064628', '储藏分会', '全国粮食职业教育教学委员会粮油储检分委员会委员（2011-1018）', null, '', null, '', '1', '导入,Thu Jan 28 10:56:45 CST 2016');
INSERT INTO `expert` VALUES ('308', 'ztz864977787', 'e10adc3949ba59abbe56e057f20f883e', '周天智', '汉', '1', '湖北省荆门市', '1959-11-12', '中共党员', '大学本科', '经济管理', '粮食储藏检验与管理', '高级工程师/1998年', '中央党校', '湖北中储粮粮油质监中心', '，420802195911120000', '湖北省武汉市黄陂区滠口街冯树岭中央储备粮武汉直属库院内', '', '864977787@QQ.com;  zhoutianzhi@tom.com', '13995558630', '', '湖北省昆虫学会副理事长兼植物检疫与储粮专业委员会主任委员', null, '', null, '', '1', '导入,Thu Jan 28 10:56:45 CST 2016');
INSERT INTO `expert` VALUES ('309', 'zhczhanghuachang', 'e10adc3949ba59abbe56e057f20f883e', '张华昌', '汉', '1', '四川平昌县', null, '党员', '本科', '粮食储藏', '粮食储藏', '正高级工程师(2011年 )', '南京财经大学（原南京经济学院）', '中储粮成都粮食储藏科学研究所', '', '成都市青羊区广富路239号32栋', '5881510', 'zhanghuachang@163.com', '1335071380', '储藏分会', '无', null, '', null, '', '1', '导入,Thu Jan 28 10:56:46 CST 2016');
INSERT INTO `expert` VALUES ('310', 'zll13607666577', 'e10adc3949ba59abbe56e057f20f883e', '张来林', '汉', '1', '浙江省瑞安市', null, '中共党员', '本科/学士', '粮油储藏', '粮油储藏', '教授、2003年11月', '郑州粮食学院', '河南工业大学、教师', '，410102195505232000', '河南省郑州市高新区莲花街100号', '', '13607666577@163.com', '13607666577', '', '国家粮食局储粮专家组专家、中储粮广州新沙港粮库储粮顾问、《粮油科技与食品》、《粮食储藏》《粮食流通技术》、《粮食科技与经济》等杂志的编委。', null, '', null, '', '1', '导入,Thu Jan 28 10:56:46 CST 2016');
INSERT INTO `expert` VALUES ('311', 'cycaoyi024', 'e10adc3949ba59abbe56e057f20f883e', '曹毅', '汉族', '1', '浙江宁波', null, '中共党员', '大学本科/工学学士', '食品工程', '粮食储藏', '教授研究员级高级工程师  自2008年至今', '郑州粮食学院', '辽宁省粮食科学研究所     总工程师', ',410102197102092000', '沈阳市皇姑区宁山东路29号', '024-86228747', 'caoyi024@163.com', '13504924023', '', '', null, '', null, '', '1', '导入,Thu Jan 28 10:56:47 CST 2016');
INSERT INTO `expert` VALUES ('312', 'lj13903867500', 'e10adc3949ba59abbe56e057f20f883e', '李杰', '汉族', '1', '河南 永城', null, '中共党员', '大学本科', '机械', '粮食干燥', '研究员', '甘肃工业大学', '中粮工程科技（郑州）有限公司', '620103196701051036', '郑州市南阳路153号', '037163753613', '13903867500@139.com', '13903867500', '', '全国标准化技术委员会干燥工作组委员、《粮食流通技术》编委', null, '', null, '', '1', '导入,Thu Jan 28 10:56:47 CST 2016');
INSERT INTO `expert` VALUES ('313', 'lljllj-xs', 'e10adc3949ba59abbe56e057f20f883e', '李林杰', '汉', '1', '江苏徐州', null, '中共党员', '本科/工程硕士', '粮油储藏', '粮油储藏', '粮食技术高级工程师/2009.11', '郑州粮食学院', '中央储备粮东莞油脂直属库', '410102197406232570', '广东省东莞市麻涌镇新沙港工业区', '076988236688-8008', 'llj-xs@163.com', '13922119763', '', '无', null, '', null, '', '1', '导入,Thu Jan 28 10:56:47 CST 2016');
INSERT INTO `expert` VALUES ('314', 'lhj412lihaojie', 'e10adc3949ba59abbe56e057f20f883e', '李浩杰', '汉', '1', '河南许昌', null, '群众', '硕士', '粮油储藏', '粮油储藏', '工程师 2012.4', '河南工业大学', '中储粮成都粮食储藏科学研究所', '410426198208022013', '成都市青羊区广富路239号32幢', '028-87660926', '412lihaojie@163.com', '13608238933', '', '', null, '', null, '', '1', '导入,Thu Jan 28 10:56:48 CST 2016');
INSERT INTO `expert` VALUES ('315', 'yjYj610124', 'e10adc3949ba59abbe56e057f20f883e', '杨健', '汉', '1', '四川成都', null, '中共党员', '本科', '农化专业', '粮食储藏', '高级工程师，2011年', '云南大学', '中储粮成都粮食储藏科学研究所', '11010819616124141X', '四川省成都市青羊区广富路239号N区32栋', '028-87661771', 'Yj610124@126.com', '13980005215', '储藏分会', '无', null, '', null, '', '1', '导入,Thu Jan 28 10:56:48 CST 2016');
INSERT INTO `expert` VALUES ('316', 'ygfgfyang129', 'e10adc3949ba59abbe56e057f20f883e', '杨国峰', '汉', '1', '江苏宜兴', '1954-01-01', '中共党员', '大学/学士', '机械设计', '粮食仓储', '教授/2003年8月', '东南大学', '南京财经大学', '‘320106195401293213', '南京市仙林大学城文苑路3号', '5881510', 'gfyang129@njue.edu.cn', '13951893615', '储藏分会', '', null, '', null, '', '1', '导入,Thu Jan 28 10:56:49 CST 2016');
INSERT INTO `expert` VALUES ('317', 'yzhcjlj_sdzb', 'e10adc3949ba59abbe56e057f20f883e', '杨长海', '汉', '1', '山东淄博桓台', null, '中共党员', '硕士', '工商管理', '企业管理', '政工师', '中国人民大学', '山东长江粮油仓储机械有限公司', '370321196805233338', '山东省淄博市桓台县205国道侯庄路口', '0533-8401950', 'cjlj_sdzb@163.com', '13906438366', '储藏分会', '中国粮油学会储藏分会常务理事、市工商联常务委员、淄博市总商会副会长', null, '1905', null, '                                                              年   月   日', '1', '导入,Thu Jan 28 10:56:49 CST 2016');
INSERT INTO `expert` VALUES ('318', 'lrqxinliang0576', 'e10adc3949ba59abbe56e057f20f883e', '林汝谦', '汉', '1', '中国', '1968-12-17', '团员', '高中', '科技储粮', '储粮设备生产', '中级工程师（2010年至今）', '新桥高中', '台州市鑫良仓储器材有限公司（总经理）', ',332603196812175000', '浙江省台州市路桥区横街镇上林村1区15-8号', '0576-82643166', 'xinliang0576@126.com', '13905768242', '', '', null, '', null, '', '1', '导入,Thu Jan 28 10:56:50 CST 2016');
INSERT INTO `expert` VALUES ('319', 'qclquchenling', 'e10adc3949ba59abbe56e057f20f883e', '渠琛玲', '汉族', '0', '江苏省丰县', null, '中共党员', '博士', '分析化学', '食品科学与工程', '副教授，2012.1', '吉林大学', '河南工业大学粮油食品学院', '410901198210114000', '河南省郑州市莲花街河南工业大学', '', 'quchenling@163.com', '15038301108', '储藏分会', '', null, '', null, '', '1', '导入,Thu Jan 28 10:56:50 CST 2016');
INSERT INTO `expert` VALUES ('320', 'nxhniuxinghe', 'e10adc3949ba59abbe56e057f20f883e', '牛兴和', '汉', '1', '山东平阴', '1963-04-13', '中共党员', '博士', '农产品加工与储藏', '农产品加工与储藏及科技管理', '研究员级高级工程师', '北京农业工程大学', '中粮营养健康研究院', '110108196304132272', '北京市昌平区未来科技城南区四路中粮营养健康研究院', '010-56989888', 'niuxinghe@cofco.com', '13801378669', '储藏分会', '', null, '', null, '', '1', '导入,Thu Jan 28 10:56:51 CST 2016');
INSERT INTO `expert` VALUES ('321', 'wslshuanglin.wang', 'e10adc3949ba59abbe56e057f20f883e', '王双林', '汉', '1', '湖南衡阳', null, '党员', '大学', '粮食工程', '粮油储藏', '研究员，2011/11/1', '南京经济学院', '中储粮成都粮食储藏科学研究所', '430421196909175138', '青羊区蜀鑫东路88号', '', 'shuanglin.wang@163.com', '13330943351', '', '', null, '', null, '', '1', '导入,Thu Jan 28 10:56:51 CST 2016');
INSERT INTO `expert` VALUES ('322', 'wyjyujun_wang', 'e10adc3949ba59abbe56e057f20f883e', '王玉军', '汉', '1', '天津', null, '群众', '硕士', '工商管理', '机械工程', '', '华南理工大学', '广州市维通工业气体技术有限公司  总经理', '120222197207265232', '广州市番禺区南村镇坑头村西线路15号', '02084569638', 'yujun_wang@weiton.com', '18922265333', '', '', null, '', null, '', '1', '导入,Thu Jan 28 10:56:52 CST 2016');
INSERT INTO `expert` VALUES ('323', 'wrlwangruol', 'e10adc3949ba59abbe56e057f20f883e', '王若兰', '汉', '0', '河南省', null, '群众', '大学本科/硕士', '粮油储藏', '粮油储藏', '教授 2002年', '郑州粮食学院', '河南工业大学 系主任', '410102196009302569', '河南省郑州市高新技术开发区莲花街100号', '0371-67755923', 'wangruol@163.com', '13607660099', '储藏分会', '1.全国粮油标准化技术委员会粮食储藏及物流分技术委员会委员 2.全国粮食行业职业技能鉴定专家评审委员会委员 3.全国粮食职业教育教学指导委员会委员', null, '', null, '', '1', '导入,Thu Jan 28 10:56:52 CST 2016');
INSERT INTO `expert` VALUES ('324', 'ztzhentong1217', 'e10adc3949ba59abbe56e057f20f883e', '甄彤', '汉', '1', '山东', null, '中共党员', '研究生/硕士', '计算机', '计算机', '教授/2008', '解放军信息工程大学', '河南工业大学 ', '370105196412173716', '郑州高新技术产业开发区莲花街', '0371-67756840', 'zhentong1217@163.com', '18623716856', '信息与自动化分会', '中国仪器仪表学会信息工作委员会委员 ', null, '', null, '', '1', '导入,Thu Jan 28 10:56:53 CST 2016');
INSERT INTO `expert` VALUES ('325', 'stysty', 'e10adc3949ba59abbe56e057f20f883e', '石天玉', '汉', '1', '宁夏隆德', '1980-09-21', '群众', '研究生/博士', '植物保护', '粮油仓储', '副研究员/2014', '中国农业大学', '国家粮食局科学研究院', '64222119800921003X', '北京市西城区百万庄大街11号', '010-68523428', 'sty@chinagrain.org', '13520847754', '储藏分会', '', null, '', null, '', '1', '导入,Thu Jan 28 10:56:54 CST 2016');
INSERT INTO `expert` VALUES ('326', 'jwd963662604', 'e10adc3949ba59abbe56e057f20f883e', '纪伟东', '汉', '1', '黑龙江青冈县', null, '党员', '大学本科/学士学位', '机械工程', '粮仓机械', '副高级，2004年', '武汉工业大学', '黑龙江粮食职业学院实验室主任', '232326197011242918', '哈尔滨和兴三道街83号', '5881510', '963662604@qq.com', '13684605086', '储藏分会', '1.担任黑龙江省粮食行业特有工种粮油检验员、粮油保管员职业技能工的鉴定评委及考前培训教师；2.担任黑龙江省响水大米营养成分研究所研究员。', null, '', null, '', '1', '导入,Thu Jan 28 10:56:54 CST 2016');
INSERT INTO `expert` VALUES ('327', 'xyzxyz8213', 'e10adc3949ba59abbe56e057f20f883e', '肖渊壮', '汉', '1', '黑龙江巴彦人', '1964-11-01', '九三学社', '研究生/工学硕士', '精密机械', '粮食储藏', '研究员2003年9月', '哈尔滨工业大学', '黑龙江省粮食科学研究所研发中心主任', '230103196411043211', '哈尔滨市南岗区巴陵街158号', '0451-82625641', 'xyz8213@vip.163.com', '13351886425', '储藏分会', '', null, '', null, '', '1', '导入,Thu Jan 28 10:56:55 CST 2016');
INSERT INTO `expert` VALUES ('328', 'szxshuzaixi', 'e10adc3949ba59abbe56e057f20f883e', '舒在习', '汉', '1', '湖北大冶', null, '中共党员', '本科/硕士', '粮油储藏', '粮油储藏', '副教授  2002年1月', '河南工业大学', '武汉轻工大学  系主任', '422421196501050016', '湖北省武汉市东西湖区学府南路68号', '027-83924790', 'shuzaixi@163.com', '13628632406', '', '中国农学会农产品贮藏加工分会理事', null, '', null, '', '1', '导入,Thu Jan 28 10:56:55 CST 2016');
INSERT INTO `expert` VALUES ('329', 'xswhcfzzx', 'e10adc3949ba59abbe56e057f20f883e', '许胜伟', '汉', '1', '河南', null, '党员', '本科', '粮油储藏', '粮油储藏', '高级工程师', '郑州粮食学院', '中储粮成都粮食储藏科学研究所', '513021197204248451', '成都市青羊区广富路239号32幢', '028-87660488', 'hcfzzx@126.com', '13881780447', '', '', null, '', null, '                                                          年    月   日', '1', '导入,Thu Jan 28 10:56:56 CST 2016');
INSERT INTO `expert` VALUES ('330', 'zxjzxj_cd', 'e10adc3949ba59abbe56e057f20f883e', '赵小军', '汉', '1', '四川达县', null, '无', '本科/学士', '计算机应用', '仓储智能化、信息化', '高级工程师、2008年', '郑州粮食学院\n（现河南工业大学）', '中储粮成都粮食储藏科学研究所、工程总监', '513021197309258000', '四川省成都市青羊区广富路239号32栋', '028-87660926', 'zxj_cd@126.com', '13088099099', '', '', null, '', null, '', '1', '导入,Thu Jan 28 10:56:56 CST 2016');
INSERT INTO `expert` VALUES ('331', 'gdlguodaolin', 'e10adc3949ba59abbe56e057f20f883e', '郭道林', '汉', '1', '四川成都', '1963-08-16', '中共党员', '本科', '农化专业', '粮食储藏', '研究员，2010年', '吉林农业大学', '中储粮成都粮食储藏科学研究所', '', '四川省成都市青羊区广富路239号N区32栋', '028-87660568', 'guodaolin@vip.sina.com', '13808069765', '储藏分会', '无', null, '', null, '', '1', '导入,Thu Jan 28 10:56:57 CST 2016');
INSERT INTO `expert` VALUES ('332', 'cjd13922266989', 'e10adc3949ba59abbe56e057f20f883e', '陈嘉东', '汉族', '1', '广东', '1957-08-20', '中国共产党', '大学本科/学士', '昆虫学', '粮油及其制品加工、储藏及质检', '教授级高级工程师  2005年1月', '中山大学', '广东省粮食科学研究所 所长    广东省粮食质量安全中心 主任', '440104195708200012', '广东省广州市越秀北路222号越良大厦4楼', '020-83642059', '13922266989@139.com', '13922266989', '', '现任中国食品科学技术学会高级成员，中国粮油学会储藏专业分会理事，广东省食品协会、广东省轻工业协会副会长', null, '1993-06-01', null, '                                                    签字（盖章）：    ', '1', '导入,Thu Jan 28 10:56:57 CST 2016');
INSERT INTO `expert` VALUES ('333', null, null, ' 陈炳申', '汉', '1', '浙江金华', '1974-07-31', '中共党员', '专科', '建筑施工与管理', '建筑', '高工 ', '中央广播电视大学', '金华金匠建材科技有限公司        总经理', '330721197407313518', '浙江省金华市婺城区雅畈工业园', '0579-82626777', ' ', '18967988777', '储藏分会', '储藏分会副秘书长', null, '', null, '', '1', '导入,Thu Jan 28 10:56:58 CST 2016');
INSERT INTO `expert` VALUES ('334', 'tclscctc', 'e10adc3949ba59abbe56e057f20f883e', '陶诚', '汉', '1', '四川眉山', null, '中共党员', '学士', '粮食储藏、信息管理', '粮食储藏', '研究员，2011.7', '北京大学', '中国粮油学会储藏分会/副秘书长', '5881510', '成都市青羊区广富路239号N32栋', '028-87664375', 'lscctc@126.com', '13330943359', '储藏分会', '储藏分会副秘书长', null, '', null, '', '1', '导入,Thu Jan 28 10:56:58 CST 2016');
INSERT INTO `expert` VALUES ('335', 'yxpy5889', 'e10adc3949ba59abbe56e057f20f883e', '严晓平', '汉', '1', '江苏东台', '1970-01-01', '中共党员', '本科', '植物保护', '粮食储藏', '研究员，2011年', '南京农业大学', '中储粮成都粮食储藏科学研究所', '320919197001177234', '四川省成都市青羊区广富路239号N区32栋', '028-87666620', 'y5889@126.com', '13330943365', '', '无', null, '                                                    签字（盖章）：    ', null, '', '1', '导入,Thu Jan 28 10:56:59 CST 2016');
INSERT INTO `expert` VALUES ('336', 'ljhjianhlv', 'e10adc3949ba59abbe56e057f20f883e', '吕建华', '汉族', '1', '河南上蔡', null, '中共党员', '博士', '农业害虫防治', '储粮害虫防治', '副教授，2006.11', '浙江大学', '河南工业大学', '41282519710420881X', '郑州市高新区莲花街河南工业大学粮油食品学院', '5881510', 'jianhlv@163.com', '15936203560', '', '为《河南工大学学报》、《粮油食品科技》等多家专业期刊审稿人', null, '', null, '', '1', '导入,Thu Jan 28 10:56:59 CST 2016');
INSERT INTO `expert` VALUES ('337', 'zhcdzhouhao', 'e10adc3949ba59abbe56e057f20f883e', '周  浩', '汉', '1', '四川蓬溪', '1977-11-01', '中共党员', '本科', '粮食储藏', '粮食储藏', '助理研究员，2009年', '河南工业大学', '中储粮成都粮食储藏科学研究所，副主任', '510921197711031000', '四川省成都市青羊区广富路239号N区32栋', '028-87662192', 'cdzhouhao@163.com', '18208156983', '储藏分会', '无', null, '', null, '', '1', '导入,Thu Jan 28 10:57:00 CST 2016');
INSERT INTO `expert` VALUES ('338', 'tpatangpeian', 'e10adc3949ba59abbe56e057f20f883e', '唐培安', '汉', '1', '山东潍坊', '1981-09-01', '中共党员', '研究生/博士', '农药学', '储粮害虫防治', '副教授2012年7月', '西南大学', '南京财经大学/副院长', '5881510', '江苏省南京市仙林大学城文苑路3号', '025-86718520', 'tangpeian@163.com', '15951885967', '', '', null, '', null, '', '1', '导入,Thu Jan 28 10:57:00 CST 2016');
INSERT INTO `expert` VALUES ('339', 'zhyhongyu.zhang', 'e10adc3949ba59abbe56e057f20f883e', '张宏宇', '汉', '1', '湖南祁东', null, '中共党员', '博士', '农业昆虫与害虫防治、微生物学', '农业昆虫与害虫防治', '教授，2004', '华中农业大学', '华中农业大学', '430404196504232000', '湖北省武汉市洪山区狮子山街一号华中农业大学植科院', '027-87280276', 'hongyu.zhang@mail.hzau.edu.cn', '18202751797', '储藏分会', 'International Foundation for Science科学顾问、Asian Journal of Plant Sciences编委、Chemosphere评阅人；中国粮油学会理事、中国昆虫学会城市昆虫专业委员会委员、中国昆虫学会药剂毒理专业委员会委员；2013中国植保学会园艺病虫害防治专业委员会委员；湖北省植保学会副理事长、湖北省昆虫学会常务理事。', null, '', null, '', '1', '导入,Thu Jan 28 10:57:00 CST 2016');
INSERT INTO `expert` VALUES ('340', 'zxf13825011891', 'e10adc3949ba59abbe56e057f20f883e', '张新府', '汉', '1', '广东省揭西县', '1958-02-13', '中共党员', '学士', '生物昆虫学', '', '粮食工程高级（教授级）工程师，任职时间2013.12.', '中山大学', '广东省粮食科学研究所 副所长', '440104195802130014', '任职时间', '020-83642371', '13825011891@163.com', '13825011891', '储藏分会', '', null, '', null, '', '1', '导入,Thu Jan 28 10:57:01 CST 2016');
INSERT INTO `expert` VALUES ('341', 'cycy', 'e10adc3949ba59abbe56e057f20f883e', '曹阳', '汉', '1', '辽宁大连', '1958-05-18', '群众', '研究生/硕士', '粮油储藏', '粮油仓储', '教授/2002年1月', '郑州粮食学院', '国家粮食局科学研究院', '410102195805182516', '北京市西城区百万庄大街11号', '5881510', 'cy@chinagrain.org', '13371786268', '储藏分会', '', null, '', null, '', '1', '导入,Thu Jan 28 10:57:01 CST 2016');
INSERT INTO `expert` VALUES ('342', null, null, '汉族', '研究生/博士', '1', '农业昆虫', null, '粮食储藏与害虫防治', '教授级高级工程师        2007年1月至今', '毕业学校', '', '广东省粮食科学研究所 主任', '44010619650313184X', '广州市越秀北路222号越良大厦306室 ', '', 'zengling33@163.com', '5881510', '中国粮油学会储藏分会', '', '', '', null, '', null, '', '1', '导入,Thu Jan 28 10:57:02 CST 2016');
INSERT INTO `expert` VALUES ('343', 'wzmwzm', 'e10adc3949ba59abbe56e057f20f883e', '汪中明', '汉', '1', '安徽潜山', null, '党员', '博士研究生/博士', '病原生物学', '粮油储藏', '副研究员，2014.10', '军事医学科学院', '国家粮食局科学研究院，助研', '11010819711017935X', '北京市百万庄大街11号粮科大厦419室', '162132', 'wzm@chinagrain.org', '13240355206', '', '中华预防医学会媒介生物学与控制分会蚊虫组成员', null, '', null, '', '1', '导入,Thu Jan 28 10:57:03 CST 2016');
INSERT INTO `expert` VALUES ('344', 'wyjwangyj', 'e10adc3949ba59abbe56e057f20f883e', '王跃进', '汉', '1', '重庆云阳县', '1961-04-10', '党员', '本科/农学学士', '植物保护', '检疫处理', '研究员，2003年12月', '西南农业大学', '中国检验检疫科学研究院', '110105196104104518', '北京市', '179685', 'wangyj@caiq.gov.cn', '13901020400', '', '国际植物保护公约组织植物检疫处理技术专家组成员、国际森林检疫专家组成员、国际植物检疫措施委员会溴甲烷替代特别工作组成员、中国植物保护学会理事、国际气调与熏蒸大会常设委员会委员', null, '', null, '', '1', '导入,Thu Jan 28 10:57:03 CST 2016');
INSERT INTO `expert` VALUES ('345', 'bxgbxg58', 'e10adc3949ba59abbe56e057f20f883e', '白旭光', '汉', '1', '山东省诸城市', null, '中共党员', '本科/学士', '粮油储藏', '粮油储藏', '教授/2004年', '郑州粮食学院', '河南工业大学 系副主任', ',410102195812092000', '郑州高新区莲花街100号', '', 'bxg58@126.com', '13523562358', '储藏分会', '', null, '', null, '', '1', '导入,Thu Jan 28 10:57:04 CST 2016');
INSERT INTO `expert` VALUES ('346', 'cjpcaijp163', 'e10adc3949ba59abbe56e057f20f883e', '蔡静平', '汉', '1', '浙江省', null, '', '硕研/硕士', '粮食微生物', '粮食微生物', '教授/2001', '郑州粮食学院', '河南工业大学', '5881510', '河南省郑州市高新区莲花街，河南工业大学', '', 'caijp163@163.com', '13503812146', '', '', null, '', null, '', '1', '导入,Thu Jan 28 10:57:05 CST 2016');
INSERT INTO `expert` VALUES ('347', 'xldxianld', 'e10adc3949ba59abbe56e057f20f883e', '谢令德', '汉', '1', '青海', null, '中共党员', '研究生/博士', '动物学', '粮食储藏', '教授,2004年任职', '陕西师范大学', '武汉轻工大学', '5881510', '湖北省武汉市常青花园学府南路68号', '', 'xianld@163.com', '13135661639', '储藏分会', '', null, '', null, '', '1', '导入,Thu Jan 28 10:57:05 CST 2016');
INSERT INTO `expert` VALUES ('348', 'dsh2338356923', 'e10adc3949ba59abbe56e057f20f883e', '邓树华', '汉', '1', '湖南沅江', '1976-02-01', '共产党员', '本科/学士', '生物化学', '粮食储藏', '高级工程师，2012年至今', '北京师范大学', '湖南省粮油科学研究设计院储藏加工所所长', '432300197602133012', '长沙市开福区金霞经济开发区粮油交易大楼', '073184863390', '2338356923@qq.com', '18874877522', '', '无', null, '', null, '', '1', '导入,Thu Jan 28 10:57:05 CST 2016');
INSERT INTO `expert` VALUES ('349', 'lyjluyujie1971', 'e10adc3949ba59abbe56e057f20f883e', '鲁玉杰', '汉', '0', '河南省唐河县', null, '九三', '博士', '农业昆虫与害虫防治', '粮食储藏', '教授，2012.4', '南京农业大学', '河南工业大学粮油食品学院', '410105197109092742', '郑州市高新技术开发区莲花街', '5881510', 'luyujie1971@163.com', '13938274563', '储藏分会', '河南省昆虫学会 理事； 河南省核学会 理事', null, '', null, '', '1', '导入,Thu Jan 28 10:57:06 CST 2016');
INSERT INTO `expert` VALUES ('350', 'lwwliwanwu', 'e10adc3949ba59abbe56e057f20f883e', '黎万武', '汉', '1', '重庆忠县', null, '中共党员', '大学本科', '农药', '储粮害虫防治', '副研究员，2000年', '吉林农业大学', '中储粮成都粮食储藏科学研究所 运营部主任', '510702196508040918', '成都市青羊区广富路239号32栋', '241914', 'liwanwu@126.com', '13330943367', '储藏分会', '无', null, '', null, '', '1', '导入,Thu Jan 28 10:57:06 CST 2016');
INSERT INTO `expert` VALUES ('351', 'frfr64', 'e10adc3949ba59abbe56e057f20f883e', '冯 任', '汉', '1', '四川巴中', null, '中共党员', '大专', '数学', '粮油质量管理', '', '中南林业科技大学', '四川省粮油中心监测站', '，513001196409250000', '成都市上东大街176号', '239384', 'fr64@163.com', '', '', '', null, '', null, '', '1', '导入,Thu Jan 28 10:57:07 CST 2016');
INSERT INTO `expert` VALUES ('352', null, null, '冯永建', '汉族', '1', '四川、广安', null, '群众', '本科', '应用化学', '粮油质检', '副研，２００１年', '中国农业大学', '中储粮成都储藏所，总工', '５１２９２５１９７００３１２８３７７', '成都市青羊区广富路２３９号３２栋', '０２８－８７６６０７７０', 'ｃｅｒｅａｌｓｃｉｅｎｃｅ＠１６３．Ｃｏｍ', '13679001146', '质检分会', '中国质量检验协会委员，四川省分析测试协会会员', null, '', null, '', '1', '导入,Thu Jan 28 10:57:07 CST 2016');
INSERT INTO `expert` VALUES ('353', 'jtjiangt915', 'e10adc3949ba59abbe56e057f20f883e', '姜涛', '汉', '1', '四川什邡', null, '/', '本科', '动物科学', '粮油检验', '助理研究员，2010年', '江南大学', '中储粮成都粮食储存科学研究所，副主任', '510104198109154116', '成都市青羊区成飞大道1号N区32栋', '02887661472', 'jiangt915@163.com', '13683419512', '', '/', null, '', null, '', '1', '导入,Thu Jan 28 10:57:07 CST 2016');
INSERT INTO `expert` VALUES ('354', 'zlp13862450007', 'e10adc3949ba59abbe56e057f20f883e', '张榴萍', '汉', '1', '江苏镇江', '1977-01-01', '中共党员', '本科/学士', '食品质量与安全', '质检、研发', '工程师/2011年', '江南大学', '中储粮镇江粮油质检中心/经理', '321102197701191555', '江苏省镇江市谏壁镇粮山村', '0511-83367683', '13862450007@163.com', '13862450007', '', '国家认可委（CNAS）/评审员                           ', null, '', null, '', '1', '导入,Thu Jan 28 10:57:08 CST 2016');
INSERT INTO `expert` VALUES ('355', 'zyryurongzh', 'e10adc3949ba59abbe56e057f20f883e', '张玉荣', '汉', '0', '新疆省阜康县', '1967-02-05', '中共党员', '大学/硕士', '食品科学', '粮油储藏与品质检验', '教授/2010年10月', '江南大学', '河南工业大学', '，410102196702052000', '郑州市高新技术产业开发区莲花街100号\n', '0371-6678022', 'yurongzh@163,com', '18623717819', '储藏分会', '', null, '小麦图像检测技术研究进展（EI收录）', null, '1905', '1', '导入,Thu Jan 28 10:57:08 CST 2016');
INSERT INTO `expert` VALUES ('356', 'lhlhui', 'e10adc3949ba59abbe56e057f20f883e', '李慧', '汉', '0', '山东', '1971-11-26', '群众', '博士', '食品生物', '食品生物检测', '高级工程师/2005年12月', '中国农业大学', '中粮营养健康研究院', '，372801197111260000', '北京市昌平区北七家镇未来科技城南区四路（102209）', '010-5698-9827', 'lhui@cofco.com', '13522622797', '', '', null, '', null, '', '1', '导入,Thu Jan 28 10:57:09 CST 2016');
INSERT INTO `expert` VALUES ('357', 'yj120471392', 'e10adc3949ba59abbe56e057f20f883e', '杨军', '汉族', '1', '四川大邑', null, '党员', '本科/学士', '工业分析', '粮油质检', '副研究员 2012.12', '沈阳化工学院', '四川省粮油中心监测站', '510129197506061012', '成都市东大街上东大街段176号', '028-86730105', '120471392@qq.com', '15281036393', '', '无', null, '', null, '', '1', '导入,Thu Jan 28 10:57:09 CST 2016');
INSERT INTO `expert` VALUES ('358', 'yytyangyongtan', 'e10adc3949ba59abbe56e057f20f883e', '杨永坛', '汉', '1', '河北南宫', null, '民革', '博士研究生/博士', '分析化学', '分析化学', '高级工程师，2001,09', '中国科学院兰州化学物理研究所', '中粮营养健康研究院 分析检测副总工程师', '5881510', '北京市昌平区北京未来科技城南区四路中粮营养健康研究院', '010-56989811', 'yangyongtan@cofco.com', '19810599228', '', '国色谱学会理事，中国分析仪器学会理事，北京色谱学会秘书长，中国分析测试协会色谱仪器评议专家组成员', null, '', null, '', '1', '导入,Thu Jan 28 10:57:10 CST 2016');
INSERT INTO `expert` VALUES ('359', 'wyjwangyujun1877', 'e10adc3949ba59abbe56e057f20f883e', '王玉军', '汉', '1', '黑龙江省泰来县', null, '中共党员', '研究生/硕士', '食品加工与安全专业', '粮油检验', '副教授、2010年', '东北农业大学', '黑龙江粮食职业学院粮油工程系粮油加工教研室主任', '230223197708010010', '黑龙江省哈尔滨市南岗区和兴三道街83号', '5881510', 'wangyujun1877@163.com', '13936169687', '储藏分会', '1.担任黑龙江省粮食行业特有工种粮油检验员、粮油保管员职业技能工的鉴定评委及考前培训教师；\n2.担任黑龙江省响水大米营养成分研究所研究员。\n', null, '', null, '', '1', '导入,Thu Jan 28 10:57:11 CST 2016');
INSERT INTO `expert` VALUES ('360', 'shshihengcd', 'e10adc3949ba59abbe56e057f20f883e', '石恒', '汉', '0', '四川遂宁', '1973-10-01', '共产党员', '硕士', '机械电子', '检化验仪器开发', '高工,2013年', '西华大学', '中储粮成都粮食储藏科学研究所', '', '成都市青羊区广富路239号N区32栋', '', 'shihengcd@163.com', '13688442120', '', '无', null, '', null, '', '1', '导入,Thu Jan 28 10:57:11 CST 2016');
INSERT INTO `expert` VALUES ('361', 'xxbxb263', 'e10adc3949ba59abbe56e057f20f883e', '肖学彬', '汉', '1', '四川省资阳市', null, '共产党员', '大学本科/学士', '粮油储藏', '粮油质量检验', '副研究员    2009年11月', '郑州粮食学院', '成都中储粮质量检测有限公司', '511026197206017411', '成都市成华区龙潭寺华盛路69号', '028-84495055', 'xb263@126.com', '13982156034', '', '全国专业标准化技术委员会 粮标委粮油制品分技术委员会', null, '', null, '', '1', '导入,Thu Jan 28 10:57:11 CST 2016');
INSERT INTO `expert` VALUES ('362', 'ddlDDL318', 'e10adc3949ba59abbe56e057f20f883e', '董德良', '汉', '1', '四川巴中', '1970-07-13', '', '本科', '食品工程机械/计算机应用', '仪器设备开发', '2011年任高级工程师', '西华大学/电子科技大学', '中储粮成都储藏科学研究所', '513027197007130030', '成都市青羊区广富路1号青羊工业总部基地N区32幢', '241923', 'DDL318@126.com', '13330943353', '储藏分会', '', null, '', null, '', '1', '导入,Thu Jan 28 10:57:12 CST 2016');
INSERT INTO `expert` VALUES ('363', 'ddwlnlksddw01', 'e10adc3949ba59abbe56e057f20f883e', '董殿文', '汉族', '1', '辽宁绥中', null, '中共党员', '研究生', '管理科学与工程', '粮油储检', '教授级高工，2006年8月', '沈阳工业大学', '辽宁省粮食科学研究所所长', '210105195707014035', '沈阳市皇姑区宁山东路29号', '024-86843390', 'lnlksddw01@163.com', '13604011906', '', '辽宁省农学会常务理事、辽宁省普通高等学校专业教学指导委员会委员\n', null, '', null, '', '1', '导入,Thu Jan 28 10:57:12 CST 2016');
INSERT INTO `expert` VALUES ('364', 'yjyuanjian', 'e10adc3949ba59abbe56e057f20f883e', '袁建', '汉', '1', '江苏泰兴', null, '中共党员', '本科/学士', '粮油储藏', '食品质量安全', '教授，2008.7', '南京粮食经济学院', '南京财经大学', '，320106196512203000', '南京市仙林大学城文苑路3号', '025-86718509', 'yuanjian@njue.edu.cn', '13611513715', '', '国家食品安全标准审评委员会委员，全国粮油标准委员会委员、油脂油料工作组副组长，中国粮油学会理事、质检分会常务理事、米制品分会理事、中国粮油学报、中国油脂等杂志编委', null, '', null, '', '1', '导入,Thu Jan 28 10:57:13 CST 2016');
INSERT INTO `expert` VALUES ('365', 'txytanxiaoyan06', 'e10adc3949ba59abbe56e057f20f883e', '谭晓燕', '汉', '0', '黑龙江', null, '党员', '本科', '化学教育', '粮油储藏与检验', '副教授  2009.9', '哈尔滨师范大学', '黑龙江粮食职业学院', '230103196409174669', '哈尔滨市南岗区和兴路三道街83号', '5881510', 'tanxiaoyan06@126.com', '13030037622', '', '', null, '', null, null, '1', '导入,Thu Jan 28 10:57:13 CST 2016');
INSERT INTO `expert` VALUES ('366', 'hyxhuangwx', 'e10adc3949ba59abbe56e057f20f883e', '黄蔚霞', '汉', '0', '江西高安', null, '党员', '博士研究生/博士', '应用化学', '食品质量与安全', '高级工程师，2004,09', '大连理工大学', '中粮营养健康研究院食品质量与安全中心主任', '，362222197306230000', '北京市昌平区北京未来科技城南区四路中粮营养健康研究院', '010-56989810', 'huangwx@cofco.com', '13910552326', '', '中国粮油学会粮油质检分会常务理事，中国仪器仪表学会近红外光谱分会理事', null, '', null, '', '1', '导入,Thu Jan 28 10:57:13 CST 2016');
INSERT INTO `expert` VALUES ('367', null, null, ' 陈炳申', '汉', '1', '浙江金华', '1974-07-31', '中共党员', '专科', '建筑施工与管理', '建筑', '高工 ', '中央广播电视大学', '金华金匠建材科技有限公司        总经理', '330721197407313518', '浙江省金华市婺城区雅畈工业园', '0579-82626777', ' ', '18967988777', '储藏分会', '储藏分会副秘书长', null, '', null, '', '1', '导入,Thu Jan 28 10:58:13 CST 2016');
INSERT INTO `expert` VALUES ('368', null, null, '汉族', '研究生/博士', '1', '农业昆虫', null, '粮食储藏与害虫防治', '教授级高级工程师        2007年1月至今', '毕业学校', '', '广东省粮食科学研究所 主任', '44010619650313184X', '广州市越秀北路222号越良大厦306室 ', '', 'zengling33@163.com', '5881510', '中国粮油学会储藏分会', '', '', '', null, '', null, '', '1', '导入,Thu Jan 28 10:58:14 CST 2016');
INSERT INTO `expert` VALUES ('369', null, null, '冯永建', '汉族', '1', '四川、广安', null, '群众', '本科', '应用化学', '粮油质检', '副研，２００１年', '中国农业大学', '中储粮成都储藏所，总工', '５１２９２５１９７００３１２８３７７', '成都市青羊区广富路２３９号３２栋', '０２８－８７６６０７７０', 'ｃｅｒｅａｌｓｃｉｅｎｃｅ＠１６３．Ｃｏｍ', '13679001146', '质检分会', '中国质量检验协会委员，四川省分析测试协会会员', null, '', null, '', '1', '导入,Thu Jan 28 10:58:15 CST 2016');
INSERT INTO `expert` VALUES ('370', null, null, ' 陈炳申', '汉', '1', '浙江金华', '1974-07-31', '中共党员', '专科', '建筑施工与管理', '建筑', '高工 ', '中央广播电视大学', '金华金匠建材科技有限公司        总经理', '330721197407313518', '浙江省金华市婺城区雅畈工业园', '0579-82626777', ' ', '18967988777', '储藏分会', '储藏分会副秘书长', null, '', null, '', '1', '导入,Thu Jan 28 10:58:48 CST 2016');
INSERT INTO `expert` VALUES ('371', null, null, '汉族', '研究生/博士', '1', '农业昆虫', null, '粮食储藏与害虫防治', '教授级高级工程师        2007年1月至今', '毕业学校', '', '广东省粮食科学研究所 主任', '44010619650313184X', '广州市越秀北路222号越良大厦306室 ', '', 'zengling33@163.com', '5881510', '中国粮油学会储藏分会', '', '', '', null, '', null, '', '1', '导入,Thu Jan 28 10:58:48 CST 2016');
INSERT INTO `expert` VALUES ('372', null, null, '冯永建', '汉族', '1', '四川、广安', null, '群众', '本科', '应用化学', '粮油质检', '副研，２００１年', '中国农业大学', '中储粮成都储藏所，总工', '５１２９２５１９７００３１２８３７７', '成都市青羊区广富路２３９号３２栋', '０２８－８７６６０７７０', 'ｃｅｒｅａｌｓｃｉｅｎｃｅ＠１６３．Ｃｏｍ', '13679001146', '质检分会', '中国质量检验协会委员，四川省分析测试协会会员', null, '', null, '', '1', '导入,Thu Jan 28 10:58:49 CST 2016');
INSERT INTO `expert` VALUES ('373', null, null, ' 陈炳申', '汉', '1', '浙江金华', '1974-07-31', '中共党员', '专科', '建筑施工与管理', '建筑', '高工 ', '中央广播电视大学', '金华金匠建材科技有限公司        总经理', '330721197407313518', '浙江省金华市婺城区雅畈工业园', '0579-82626777', ' ', '18967988777', '储藏分会', '储藏分会副秘书长', null, '', null, '', '1', '导入,Thu Jan 28 11:01:44 CST 2016');
INSERT INTO `expert` VALUES ('374', null, null, '汉族', '研究生/博士', '1', '农业昆虫', null, '粮食储藏与害虫防治', '教授级高级工程师        2007年1月至今', '毕业学校', '', '广东省粮食科学研究所 主任', '44010619650313184X', '广州市越秀北路222号越良大厦306室 ', '', 'zengling33@163.com', '5881510', '中国粮油学会储藏分会', '', '', '', null, '', null, '', '1', '导入,Thu Jan 28 11:01:45 CST 2016');
INSERT INTO `expert` VALUES ('375', null, null, '冯永建', '汉族', '1', '四川、广安', null, '群众', '本科', '应用化学', '粮油质检', '副研，２００１年', '中国农业大学', '中储粮成都储藏所，总工', '５１２９２５１９７００３１２８３７７', '成都市青羊区广富路２３９号３２栋', '０２８－８７６６０７７０', 'ｃｅｒｅａｌｓｃｉｅｎｃｅ＠１６３．Ｃｏｍ', '13679001146', '质检分会', '中国质量检验协会委员，四川省分析测试协会会员', null, '', null, '', '1', '导入,Thu Jan 28 11:01:46 CST 2016');
INSERT INTO `expert` VALUES ('376', null, null, ' 陈炳申', '汉', '1', '浙江金华', '1974-07-31', '中共党员', '专科', '建筑施工与管理', '建筑', '高工 ', '中央广播电视大学', '金华金匠建材科技有限公司        总经理', '330721197407313518', '浙江省金华市婺城区雅畈工业园', '0579-82626777', ' ', '18967988777', '储藏分会', '储藏分会副秘书长', null, '', null, '', '1', '导入,Thu Jan 28 11:02:39 CST 2016');
INSERT INTO `expert` VALUES ('377', null, null, '汉族', '研究生/博士', '1', '农业昆虫', null, '粮食储藏与害虫防治', '教授级高级工程师        2007年1月至今', '毕业学校', '', '广东省粮食科学研究所 主任', '44010619650313184X', '广州市越秀北路222号越良大厦306室 ', '', 'zengling33@163.com', '5881510', '中国粮油学会储藏分会', '', '', '', null, '', null, '', '1', '导入,Thu Jan 28 11:02:39 CST 2016');
INSERT INTO `expert` VALUES ('378', null, null, '冯永建', '汉族', '1', '四川、广安', null, '群众', '本科', '应用化学', '粮油质检', '副研，２００１年', '中国农业大学', '中储粮成都储藏所，总工', '５１２９２５１９７００３１２８３７７', '成都市青羊区广富路２３９号３２栋', '０２８－８７６６０７７０', 'ｃｅｒｅａｌｓｃｉｅｎｃｅ＠１６３．Ｃｏｍ', '13679001146', '质检分会', '中国质量检验协会委员，四川省分析测试协会会员', null, '', null, '', '1', '导入,Thu Jan 28 11:02:40 CST 2016');
INSERT INTO `expert` VALUES ('379', null, null, ' 陈炳申', '汉', '1', '浙江金华', '1974-07-31', '中共党员', '专科', '建筑施工与管理', '建筑', '高工 ', '中央广播电视大学', '金华金匠建材科技有限公司        总经理', '330721197407313518', '浙江省金华市婺城区雅畈工业园', '0579-82626777', ' ', '18967988777', '储藏分会', '储藏分会副秘书长', null, '', null, '', '1', '导入,Thu Jan 28 11:04:12 CST 2016');
INSERT INTO `expert` VALUES ('380', null, null, '汉族', '研究生/博士', '1', '农业昆虫', null, '粮食储藏与害虫防治', '教授级高级工程师        2007年1月至今', '毕业学校', '', '广东省粮食科学研究所 主任', '44010619650313184X', '广州市越秀北路222号越良大厦306室 ', '', 'zengling33@163.com', '5881510', '中国粮油学会储藏分会', '', '', '', null, '', null, '', '1', '导入,Thu Jan 28 11:04:35 CST 2016');
INSERT INTO `expert` VALUES ('381', null, null, '冯永建', '汉族', '1', '四川、广安', null, '群众', '本科', '应用化学', '粮油质检', '副研，２００１年', '中国农业大学', '中储粮成都储藏所，总工', '５１２９２５１９７００３１２８３７７', '成都市青羊区广富路２３９号３２栋', '０２８－８７６６０７７０', 'ｃｅｒｅａｌｓｃｉｅｎｃｅ＠１６３．Ｃｏｍ', '13679001146', '质检分会', '中国质量检验协会委员，四川省分析测试协会会员', null, '', null, '', '1', '导入,Thu Jan 28 11:04:39 CST 2016');
INSERT INTO `expert` VALUES ('382', 'ctcentao', 'e10adc3949ba59abbe56e057f20f883e', '岑涛', '汉', '1', '河北', '1967-06-29', '群众', '大学本科', '食品工程', '食品添加剂和配料技术支持和服务', '工程师资质（1998年取得）', '河南工业大学\n（郑州粮食学院）', '丰益（上海）生物技术研发中心有限公司', '410102196706292511', '上海市浦东新区高东工业园区高东路118号', '021-3115 3112', 'centao@cn.wilmar-intl.com', '13913258990', '', '中国粮油学会食品分会常务理事', null, '', null, '                                                          2015 年 4  月 8 日', '1', '导入,Thu Jan 28 11:19:07 CST 2016');
INSERT INTO `expert` VALUES ('383', 'lhz477829439', 'e10adc3949ba59abbe56e057f20f883e', '连惠章', '汉', '1', '漳州', null, '群众', '大专', '食品工程', '食品工程及管理', '食品专业高级工程师2010年', '厦门水产学院', '无锡华顺民生食品有限公司技术总监', '', '无锡市惠山区钱桥晓星工业园区晓陆路68号', '0510-80219635', '477829439@qq.com', '13616170044', '发酵面食分会', '无', null, '', null, '                                                         2015年 10  月 25 日', '1', '导入,Thu Jan 28 11:19:10 CST 2016');
INSERT INTO `expert` VALUES ('384', 'wdjwdjiang2008', 'e10adc3949ba59abbe56e057f20f883e', '邬大江', '汉', '1', '江西高安', null, '党员', '大学/学士', '粮食加工', '粮食加工', '高级工程师', '河南工业大学', '浙江恒天控股集团有限公司副总', '5881510', '浙江省杭州市萧山金一路1号', '5881510', 'wdjiang2008@163.com', '13777385398', '', '中国粮油学会理事', null, '', null, '', '1', '导入,Thu Jan 28 11:19:11 CST 2016');
INSERT INTO `expert` VALUES ('385', 'wsmwushimin', 'e10adc3949ba59abbe56e057f20f883e', '吴时敏', '汉', '1', '湖北', '1970-05-18', '中共党员', '博士研究生/博士 ', '食品科学与工程', '食品质量与安全', '教授，2013', '德国汉诺威大学', '上海交通大学，博导', '5881510', '上海市东川路800号上海交大农生大楼47#', '021-34205717', 'wushimin@sjtu.edu.cn', '13816378172', '发酵面食分会', '美国化学会会员，国家粮油标准化委员会油脂组专家委员，中国粮油学会油脂分会常务理事，上海市食品安全地方标准审评委员会、上海市食品安全风险监测评估委员会等专家委员，以及上海FDA食品安全科普专家等', null, '', null, '', '1', '导入,Thu Jan 28 11:19:11 CST 2016');
INSERT INTO `expert` VALUES ('386', 'jzqzhqjiang', 'e10adc3949ba59abbe56e057f20f883e', '江正强', '汉', '1', '河南', null, '中共党员', '研究生/博士', '食品科学', '食品科学', '教授（2004.12）', '中国农业大学', '中国农业大学食品学院副院长', '11010819710610227x', '北京市海淀区清华东路17号294#信箱', '10-62737689', 'zhqjiang@cau.edu.cn', '13641363631', '', '中国食品科学技术学会酶制剂分会常务理事等', null, '', null, '', '1', '导入,Thu Jan 28 11:19:12 CST 2016');
INSERT INTO `expert` VALUES ('387', 'zkq13938487122', 'e10adc3949ba59abbe56e057f20f883e', '朱克庆', '汉', '1', '河南省', null, '中共党员', '硕士研究生', '机械设计与制造', '食品装备设计与制造', '1993.11。教授', '郑州大学', '河南工业大学、主食工程研究所所长', '5881510', '河南省郑州市嵩山南路140号河南工业大学36号信箱', '', '13938487122@163.com', '13938487122', '', '中国机械工程学会高级会员、发酵面食分会理事', null, '', null, '', '1', '导入,Thu Jan 28 11:19:13 CST 2016');
INSERT INTO `expert` VALUES ('388', 'zxyxingtai', 'e10adc3949ba59abbe56e057f20f883e', '郑心羽', '汉', '1', '', '1971-10-17', '无党派', '学士', '食品工程', '面制品工艺及装备开发', '高级工程师', '河南工业大学', '河南兴泰科技实业有限公司总经理', '5881510', '河南郑州高新技术开发区银屏路22号', '0371-67997170', 'xingtai@china.com', '13607667511', '', '面制食品国家地方联合工程研究中心副主任', null, '', null, '', '1', '导入,Thu Jan 28 11:19:13 CST 2016');
INSERT INTO `expert` VALUES ('389', 'dwpwhdingwp', 'e10adc3949ba59abbe56e057f20f883e', '丁文平', '汉', '1', '湖北天门', null, '党员', '研究生/博士', '食品科学与工程', '食品科学与工程', '教授/2009年', '江南大学', '武汉轻工大学视食品学院/副院长', '422428197109281273', '武汉市东西湖区常青花园学府南路68号', '027-83924790', 'whdingwp@163.com', '13476191780', '发酵面食分会', '稻米精深加工产业技术创新战略联盟副秘书长', null, '', null, '', '1', '导入,Thu Jan 28 11:19:14 CST 2016');
INSERT INTO `expert` VALUES ('390', 'wflweifl', 'e10adc3949ba59abbe56e057f20f883e', '位凤鲁', '汉', '1', '安徽泗县', null, '群众', '大专', '面点工艺学', '发酵面食', '高级技师/2009年', '四川高等烹饪专科学校', '安琪酵母股份有限公司发酵面食技术总监', '', '湖北省宜昌市城东大道168号', '0717-6369699', 'weifl@angelyeast.com', '13807203708', '发酵面食分会', '', null, '', null, '', '1', '导入,Thu Jan 28 11:19:14 CST 2016');
INSERT INTO `expert` VALUES ('391', 'ljxlengjx', 'e10adc3949ba59abbe56e057f20f883e', '冷建新', '汉', '0', '江西修水', null, '群众', '本科', '食品工程', '食品工程', '高级工程师/2010年', '杭州商学院', '安琪酵母股份有限公司烘焙与发酵面食技术中心副总经理', '', '湖北省宜昌市城东大道168号', '0717-6369699', 'lengjx@angelyeast.com', '13872558673', '发酵面食分会', '中焙糖协面包师分会秘书长', null, '', null, '', '1', '导入,Thu Jan 28 11:19:15 CST 2016');
INSERT INTO `expert` VALUES ('392', 'lxzxingtai', 'e10adc3949ba59abbe56e057f20f883e', '刘晓真', '汉', '1', '河南郑州', '1947-11-07', '无党派', '学士', '食品化学', '面制品工艺及装备开发', '高级工程师', '郑州大学', '河南兴泰科技实业有限公司董事长', '5881510', '河南郑州高新技术开发区银屏路22号', '0371-67997170', 'xingtai@china.com', '13783529048', '', '面制食品国家地方联合工程研究中心主任,河南省面制食品标准化工程技术研究中心主任', null, '', null, '', '1', '导入,Thu Jan 28 11:19:15 CST 2016');
INSERT INTO `expert` VALUES ('393', 'lzhliuzzit', 'e10adc3949ba59abbe56e057f20f883e', '刘长虹', '汉', '1', '河南南阳', null, '无', '研究生/硕士', '食品科学', '食品科学与工程', '教授，2006年；            高级工程师  1997年', '郑州粮食学院', '河南工业大学', '5881510', '郑州市高新技术产业开发区莲花街100号', '0371-67758022', 'liuzzit@126.com', '13703925994', '发酵面食分会', '', null, '', null, '', '1', '导入,Thu Jan 28 11:19:16 CST 2016');
INSERT INTO `expert` VALUES ('394', 'shsh', 'e10adc3949ba59abbe56e057f20f883e', '孙辉', '汉族', '0', '山东', '1971-04-16', '九三学社', '博士', '植物遗传育种', '粮食科学', '研究员，2009年', '中国农业大学', '国家粮食局科学研究院，研究员', '', '北京市西城区百万庄大街11号', '162132', 'sh@chinagrain.org', '13601375755', '发酵面食分会', 'ISO TC34/SC4/WG7 CONVENOR，全国粮油标准化技术委员会委员，北京市品种审定委员会小麦分委员会委员，中国粮油学会发酵面食分会副会长', null, '', null, '', '1', '导入,Thu Jan 28 11:19:16 CST 2016');
INSERT INTO `expert` VALUES ('395', 'zytzhangyt1', 'e10adc3949ba59abbe56e057f20f883e', '张云涛', '汉', '1', '陕西宝鸡', '1974-05-28', '群众', '学士', '粮食工程', '食品', '高级技师', '武汉食品工业学院', '北京稻香村食品有限责任公司技研部主任', '', '北京市昌平区北七家镇工业园区', '2985551', 'zhangyt1@126.com', '13331089001', '发酵面食分会', '中国食品协会烘焙食品国家评委、发酵面食分会理事、中华糕饼研究院研究员、北京食品学会常务理事、中国农业大学食品科学与营养工程学院客座教授。', null, '', null, '', '0', '导入,Thu Jan 28 11:19:17 CST 2016');
INSERT INTO `expert` VALUES ('396', 'yzzyangzz', 'e10adc3949ba59abbe56e057f20f883e', '杨子忠', '汉', '1', '湖北长阳', null, '党员', '本科', '食品科学与工程', '食品科学与工程', '高级工程师', '华中农业大学', '安琪酵母股份有限公司酵母营销中心总经理', '', '湖北省宜昌市城东大道168号', '0717-6369699', 'yangzz@angelyeast.com', '13986746255', '发酵面食分会', '', null, '', null, '', '1', '导入,Thu Jan 28 11:19:17 CST 2016');
INSERT INTO `expert` VALUES ('397', 'xsbxiongsb', 'e10adc3949ba59abbe56e057f20f883e', '熊善柏', '汉族', '1', '湖北荆门', null, '中共党员', '研究生/硕士', '微生物学', '食品科学与工程', '教授，2001年', '华中农业大学', '华中农业大学，研发中心主任', '420106196309065670', '湖北武汉市洪山区', '5881510', 'xiongsb@mail.hzau.edu.cn', '13971039012', '', '中国粮油学会资深会员、中国粮油学会发酵面制品分会常务理事、中国农业工程学会终身会员、中国水产学会水产品加工与贮运专业委员会理事', null, '', null, '', '1', '导入,Thu Jan 28 11:19:18 CST 2016');
INSERT INTO `expert` VALUES ('398', 'wlkwanglekai', 'e10adc3949ba59abbe56e057f20f883e', '王乐凯', '汉', '1', '江苏', null, '中共党员', '大学', '化学', '谷物化学', '研究员（二级）/1998年', '黑龙江大学', '黑龙江省农科院农产品质量安全研究所/所长', '/230103195503130318', '哈尔滨市南岗区学府路368号', '0451-86665716', 'wanglekai@vip.163.com', '13904515949', '发酵面食分会', '国家农产品质量安全风险评估专家委员会委员、农业部农产品质量安全专家组成员、食品安全国家标准审评委员会污染物分委员会委员、全国粮油标准化技术委员会委员、 黑龙江省作物学会理事', null, '', null, '', '1', '导入,Thu Jan 28 11:19:18 CST 2016');
INSERT INTO `expert` VALUES ('399', 'hxzhxinzhong', 'e10adc3949ba59abbe56e057f20f883e', '胡新中', '汉', '1', '陕西省西安市', null, '中共党员', '博士', '粮食油脂与蛋白质工程', '食品科学与工程', '教授/2014年', '西北农林科技大学', '陕西师范大学食品工程与营养科学学院/副院长', '5881510', '陕西省西安市陕西师范大学长安校区', '029-85310410', 'hxinzhong@126.com', '13571816620', '发酵面食分会', '国家燕麦荞麦产业技术体系加工与研究室主任，中国食品工业协会燕麦专业委员会秘书长', null, '', null, '', '1', '导入,Thu Jan 28 11:19:19 CST 2016');
INSERT INTO `expert` VALUES ('400', 'yyxlyxuebao', 'e10adc3949ba59abbe56e057f20f883e', '于衍霞', '汉', '0', '山东', null, '群众', '学士', '食品工程', '粮油科技', '高级工程师                      2002   年 4  月          ', '天津轻工业学院', '中国粮油学会 主任', '620302196809010468', '北京市西城区百万庄大街11号中国粮油学会', '189056', 'lyxuebao@ccoaonline.com', '13651028005', '米制品分会', '中国食品工业协会理事、《食品科技》编委会委员、 \n《食品安全导刊》编委会委员', null, null, null, null, '1', '导入,Thu Jan 28 12:02:33 CST 2016');
INSERT INTO `expert` VALUES ('401', 'etrt656', 'e10adc3949ba59abbe56e057f20f883e', '45发给h', null, '1', null, null, null, null, null, null, null, null, '饭当发斯蒂芬', null, null, null, null, null, '饲料分会,油脂专业分会,食品分会,米制品分会', null, '2016-02-10 10:56:28', null, null, null, '1', null);
INSERT INTO `expert` VALUES ('402', '323', '12e086066892a311b752673a28583d3f', '23222的', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '粮油质检研究分会,营养分会,饲料分会,食品分会', null, null, null, null, null, '1', null);
INSERT INTO `expert` VALUES ('403', 'cfy1tangxuejun', 'e10adc3949ba59abbe56e057f20f883e', '陈富渊1', '汉', '1', '江苏阜宁', '1964-12-01', '中共党员', '本科/学士', '粮油机械', '粮食储运', '享受研究员同等待遇的高级工程师/2014年12月', '郑州粮食学院', '中粮工程科技（郑州）有限公司/副总经理', '410105196412124000', '河南省郑州市南阳路153号', '020-83726234', 'tangxuejun@263.net', '13503864962', '储藏分会,粮油营养分会', '技术组织任职情况1', null, '', null, '', '1', '导入,Wed Feb 03 14:16:49 CST 2016');

-- ----------------------------
-- Table structure for `expert_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `expert_jobs`;
CREATE TABLE `expert_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ExpertID` int(11) DEFAULT NULL COMMENT '专家编号',
  `StartTime` date DEFAULT NULL COMMENT '起时间',
  `EndTime` date DEFAULT NULL COMMENT '止时间',
  `Company` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '工作或学习单位',
  `Job` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '职务/职称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1174 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of expert_jobs
-- ----------------------------
INSERT INTO `expert_jobs` VALUES ('56', '56', '1992-07-01', '2002-06-01', '上海市酿造科学研究所/国内贸易部酿造产品质量监督检验站(上海)', '副站长/工程师');
INSERT INTO `expert_jobs` VALUES ('57', '56', '2002-07-01', '2005-08-01', '上海市粮食科学研究所/上海市粮油制品质量监督检验站', '实验室主任/工程师');
INSERT INTO `expert_jobs` VALUES ('58', '56', '2005-09-01', '2016-01-08', '上海科茂粮油食品质量检测有限公司', '副经理/高级工程师');
INSERT INTO `expert_jobs` VALUES ('59', '55', '1985-09-01', '1989-07-01', '郑州粮食学院', '学生');
INSERT INTO `expert_jobs` VALUES ('60', '55', '1998-09-01', '2000-06-01', '无锡轻工大学', '攻读在职硕士');
INSERT INTO `expert_jobs` VALUES ('61', '55', '1989-07-01', '2016-01-08', '郑州粮食学院、郑州工程学院、河南工业大学 ', '教师/讲师、副教授、教授');
INSERT INTO `expert_jobs` VALUES ('62', '57', '1999-07-01', '2000-09-01', '山东省丝绸总公司济宁分公司', '助理农艺师');
INSERT INTO `expert_jobs` VALUES ('63', '57', '2007-07-01', '2016-01-08', '国家粮食局科学研究院', '研究员');
INSERT INTO `expert_jobs` VALUES ('64', '58', '2008-07-01', '2011-12-01', '武汉生物工程学院', '教师/讲师');
INSERT INTO `expert_jobs` VALUES ('65', '58', '2011-12-01', '2013-07-01', '武汉生物工程学院', '教师/副教授');
INSERT INTO `expert_jobs` VALUES ('66', '58', '2013-07-01', '2016-01-08', '湖南省粮油产品质量监测中心', '粮油检验及质量监督员/副教授');
INSERT INTO `expert_jobs` VALUES ('67', '59', '1986-08-01', '1989-11-01', '虎林县面粉厂化验室', '化验员/初级');
INSERT INTO `expert_jobs` VALUES ('68', '59', '1989-11-01', '1992-01-03', '虎林县宝东粮库化验室', '化验员/中级');
INSERT INTO `expert_jobs` VALUES ('69', '59', '1992-03-01', '2016-01-08', '黑龙江粮食职业学院', '教师/副教授');
INSERT INTO `expert_jobs` VALUES ('70', '60', '1993-07-01', '2013-04-01', '山东轻工业学院食品与生物工程学院', '助教、讲师、副教授、教授');
INSERT INTO `expert_jobs` VALUES ('71', '60', '2013-05-01', '2016-01-08', '齐鲁工业大学食品科学与工程学院', '教授');
INSERT INTO `expert_jobs` VALUES ('72', '60', '2015-01-01', '2016-01-08', '齐鲁工业大学食品科学与工程学院', '院长');
INSERT INTO `expert_jobs` VALUES ('73', '62', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('74', '62', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('75', '62', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('76', '63', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('77', '63', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('78', '63', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('79', '64', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('80', '64', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('81', '64', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('82', '65', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('83', '65', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('84', '65', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('85', '66', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('86', '66', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('87', '66', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('88', '67', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('89', '67', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('90', '67', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('91', '68', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('92', '68', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('93', '68', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('94', '69', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('95', '69', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('96', '69', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('97', '70', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('98', '70', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('99', '70', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('100', '71', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('101', '71', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('102', '71', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('103', '72', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('104', '73', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('105', '73', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('106', '74', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('107', '76', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('108', '75', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('109', '77', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('110', '73', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('111', '76', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('112', '74', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('113', '72', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('114', '78', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('115', '80', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('116', '80', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('117', '79', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('118', '81', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('119', '79', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('120', '80', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('121', '83', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('122', '79', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('123', '82', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('124', '81', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('125', '82', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('126', '72', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('127', '84', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('128', '83', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('129', '85', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('130', '74', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('131', '85', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('132', '85', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('133', '86', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('134', '86', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('135', '86', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('136', '83', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('137', '88', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('138', '76', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('139', '87', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('140', '84', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('141', '87', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('142', '84', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('143', '87', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('144', '82', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('145', '78', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('146', '78', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('147', '88', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('148', '77', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('149', '88', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('150', '81', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('151', '75', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('152', '75', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('153', '77', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('154', '89', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('155', '89', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('156', '89', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('157', '90', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('158', '90', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('159', '90', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('160', '91', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('161', '91', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('162', '91', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('163', '92', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('164', '92', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('165', '92', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('166', '93', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('167', '93', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('168', '93', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('169', '94', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('170', '94', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('171', '94', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('172', '95', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('173', '95', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('174', '95', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('175', '96', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('176', '96', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('177', '96', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('178', '97', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('179', '97', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('180', '97', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('181', '98', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('182', '98', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('183', '98', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('184', '99', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('185', '99', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('186', '99', '2002-01-01', '2016-01-08', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('187', '100', '2000-07-01', '2003-06-01', '湖北省粮食机械厂', '设计工程师/助理工程师');
INSERT INTO `expert_jobs` VALUES ('188', '100', '2012-08-01', '2014-12-01', '南京晓庄学院食品科学学院', '教师/讲师');
INSERT INTO `expert_jobs` VALUES ('189', '101', '2012-07-01', '2016-01-08', '中粮集团', '技术总监/首席技术官');
INSERT INTO `expert_jobs` VALUES ('190', '101', '2006-02-01', '2012-05-01', '美国建明中国公司', '技术总监/首席技术官');
INSERT INTO `expert_jobs` VALUES ('191', '101', '2004-02-01', '2006-02-01', '法国安迪苏中国公司', '技术经理');
INSERT INTO `expert_jobs` VALUES ('192', '101', '1993-08-01', '1998-08-01', '泰国正大集团北京家禽育种有限公司', '技术员');
INSERT INTO `expert_jobs` VALUES ('193', '102', '1993-01-01', '2016-01-08', '中国疾病预防控制中心营养与健康所', '研究员');
INSERT INTO `expert_jobs` VALUES ('194', '103', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('195', '103', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('196', '104', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('197', '104', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('198', '105', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('199', '105', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('200', '106', '1972-01-01', '1985-01-01', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('201', '106', '1985-01-01', '2002-01-01', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('202', '108', '2009-10-01', '2016-01-08', '中粮营养健康研究院', '食品质量与安全中心主任');
INSERT INTO `expert_jobs` VALUES ('203', '109', '2009-10-01', '2016-01-08', '中粮营养健康研究院', '食品质量与安全中心主任');
INSERT INTO `expert_jobs` VALUES ('205', '107', '2015-12-30', '2016-01-29', '电饭锅电饭锅', '');
INSERT INTO `expert_jobs` VALUES ('206', '111', '1999-01-01', '2003-01-01', '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('207', '111', '2003-01-01', '2016-01-08', '国贸工程设计院', '高工');
INSERT INTO `expert_jobs` VALUES ('208', '112', '1999-01-01', '2003-01-01', '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('209', '113', '1999-01-01', '2003-01-01', '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('210', '112', '2003-01-01', '2016-01-08', '国贸工程设计院', '高工');
INSERT INTO `expert_jobs` VALUES ('211', '113', '2003-01-01', '2016-01-08', '国贸工程设计院', '高工');
INSERT INTO `expert_jobs` VALUES ('212', '114', '1994-09-01', '2002-03-01', '河南思达科技股份有限公司', '项目管理工程师');
INSERT INTO `expert_jobs` VALUES ('213', '114', '2002-03-01', '2004-10-01', '河南思达软件工程有限公司', '项目管理工程师');
INSERT INTO `expert_jobs` VALUES ('214', '114', '2004-10-01', '2016-01-08', '郑州华粮科技股份有限公司', '总工程师');
INSERT INTO `expert_jobs` VALUES ('215', '115', '2006-01-05', '2012-01-04', '中国科学院遥感应用研究所农业与生态研究室', '助理研究员');
INSERT INTO `expert_jobs` VALUES ('216', '115', '2013-01-04', '2016-01-08', '中国科学院遥感与数字地球研究所数字农业研究室', '助理研究员');
INSERT INTO `expert_jobs` VALUES ('217', '117', '1972-01-06', '1985-01-09', '广西轻工业研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('218', '117', '1985-01-10', '2002-01-16', '广西南宁木薯技术开发中心', '主任、高级工程师');
INSERT INTO `expert_jobs` VALUES ('219', '117', '2002-01-05', '2016-01-09', '广西轻工业研究院', '顾问');
INSERT INTO `expert_jobs` VALUES ('220', '118', '1984-08-01', '2004-03-18', '四川省粮食学校', '');
INSERT INTO `expert_jobs` VALUES ('221', '118', '2004-03-10', '2016-01-09', '四川省粮食工程设计院', '院长');
INSERT INTO `expert_jobs` VALUES ('222', '119', '1983-01-06', '1989-01-19', '安徽佳通轮胎', '总助');
INSERT INTO `expert_jobs` VALUES ('223', '119', '1990-01-10', '1997-01-15', ' 蛇口港', '经理');
INSERT INTO `expert_jobs` VALUES ('224', '119', '1997-01-16', '2015-01-14', '深圳赤湾港航股份有限公司', '副总');
INSERT INTO `expert_jobs` VALUES ('225', '120', '1985-01-09', '2016-01-09', '武汉轻工大学工作', '图书馆馆长，教授');
INSERT INTO `expert_jobs` VALUES ('226', '121', '1984-08-15', '1988-03-09', '河南工业大学', '教师/助教');
INSERT INTO `expert_jobs` VALUES ('227', '121', '1988-03-10', '1992-03-03', '武汉轻工大学', '教师/助教');
INSERT INTO `expert_jobs` VALUES ('228', '121', '1992-03-01', '2000-03-01', '武汉轻工大学', '教师/讲师');
INSERT INTO `expert_jobs` VALUES ('229', '121', '2000-03-01', '2016-01-11', '武汉轻工大学', '教师/副教授');
INSERT INTO `expert_jobs` VALUES ('230', '122', '1999-10-01', '2002-01-01', '山东三星玉米产业科技有限公司质检科 ', '职员');
INSERT INTO `expert_jobs` VALUES ('231', '122', '2003-01-01', '2007-01-01', '山东三星玉米产业科技有限公司质检科 ', '质检科长');
INSERT INTO `expert_jobs` VALUES ('232', '122', '2008-01-02', '2016-01-11', '山东三星集团有限公司技术中心', '研发工程师');
INSERT INTO `expert_jobs` VALUES ('233', '123', '2000-01-01', '2002-12-31', '中粮营养健康研究院动物营养与饲料中心', '中心主任');
INSERT INTO `expert_jobs` VALUES ('234', '123', '2003-01-01', '2012-06-30', '美国大豆协会国际项目', '饲料技术主任');
INSERT INTO `expert_jobs` VALUES ('235', '123', '2012-07-01', '2016-01-12', '美国爱达荷大学', '研究员');
INSERT INTO `expert_jobs` VALUES ('236', '124', '1988-07-01', '2002-09-01', '安徽省铜陵市面粉厂', '经理/高级工程师');
INSERT INTO `expert_jobs` VALUES ('237', '124', '2002-09-02', '2005-11-01', '安徽省淮北市天宏集团 ', '副总裁/高级工程师');
INSERT INTO `expert_jobs` VALUES ('238', '124', '2005-11-01', '2016-01-12', '中粮饲料有限公司', '副总经理/高级工程师');
INSERT INTO `expert_jobs` VALUES ('239', '125', '1979-11-01', '1994-07-20', '陆军第五十九中心医院', '医师、干事');
INSERT INTO `expert_jobs` VALUES ('240', '125', '1994-08-11', '2006-05-11', '昆明陆军学院成都分院', '正团职主任');
INSERT INTO `expert_jobs` VALUES ('241', '125', '2006-06-01', '2010-05-05', '四川省粮食局', '办公室主任');
INSERT INTO `expert_jobs` VALUES ('242', '125', '2010-06-03', '2016-01-12', '四川省粮食局', '仓储处处长');
INSERT INTO `expert_jobs` VALUES ('243', '126', '1965-01-01', '2008-01-01', '无锡粮科院', '技术员、工程师、高工、教授级高工，副总工、副院长兼总工、院长');
INSERT INTO `expert_jobs` VALUES ('244', '126', '1984-01-01', '1986-01-01', '美国堪萨斯州立大学(KSU)粮食科学与工程系', '访问学者');
INSERT INTO `expert_jobs` VALUES ('245', '128', null, null, '', '');
INSERT INTO `expert_jobs` VALUES ('246', '129', null, null, '', '');
INSERT INTO `expert_jobs` VALUES ('247', '130', '2015-12-29', '2015-12-27', '', '');
INSERT INTO `expert_jobs` VALUES ('248', '130', '2016-01-07', '2016-01-05', '', '');
INSERT INTO `expert_jobs` VALUES ('249', '131', '2016-01-29', '2016-02-06', '', '');
INSERT INTO `expert_jobs` VALUES ('250', '131', '2016-01-21', '2016-02-26', '', '');
INSERT INTO `expert_jobs` VALUES ('251', '132', null, null, '', '');
INSERT INTO `expert_jobs` VALUES ('252', '133', null, null, '', '');
INSERT INTO `expert_jobs` VALUES ('253', '143', '1997-10-00', '1991-10-00', '22', 'sdds');
INSERT INTO `expert_jobs` VALUES ('254', '143', '1997-10-00', '1991-10-00', '22', 'sdds');
INSERT INTO `expert_jobs` VALUES ('255', '144', '1986-07-00', '1991-10-00', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('256', '144', '1991-11-00', '1999-11-00', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('257', '144', '1999-12-00', '2004-11-00', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('258', '144', '2004-12-00', '2014-05-00', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('259', '145', '1986-07-00', '1991-10-00', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('260', '145', '1991-11-00', '1999-11-00', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('261', '145', '1999-12-00', '2004-11-00', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('262', '145', '2004-12-00', '2014-05-00', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('263', '146', '1986-07-00', '1991-10-00', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('264', '146', '1991-11-00', '1999-11-00', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('265', '146', '1999-12-00', '2004-11-00', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('266', '146', '2004-12-00', '2014-05-00', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('267', '147', '1986-07-00', '1991-10-00', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('268', '147', '1991-11-00', '1999-11-00', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('269', '147', '1999-12-00', '2004-11-00', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('270', '147', '2004-12-00', '2014-05-00', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('271', '148', '1986-07-00', '1991-10-00', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('272', '148', '1991-11-00', '1999-11-00', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('273', '148', '1999-12-00', '2004-11-00', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('274', '148', '2004-12-00', '2014-05-00', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('275', '149', null, null, '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('276', '149', null, null, '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('277', '149', null, null, '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('278', '149', null, null, '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('279', '149', null, null, '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('280', '150', null, null, '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('281', '150', null, null, '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('282', '150', null, null, '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('283', '150', null, null, '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('284', '150', null, null, '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('285', '151', null, null, '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('286', '151', null, null, '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('287', '151', null, null, '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('288', '151', null, null, '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('289', '151', null, null, '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('290', '152', null, null, '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('291', '152', null, null, '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('292', '152', null, null, '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('293', '152', null, null, '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('294', '152', null, null, '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('295', '153', null, null, '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('296', '153', null, null, '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('297', '153', null, null, '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('298', '153', null, null, '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('299', '153', null, null, '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('300', '154', null, null, '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('301', '154', null, null, '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('302', '154', null, null, '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('303', '154', null, null, '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('304', '154', null, null, '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('305', '155', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('306', '155', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('307', '155', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('308', '155', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('309', '155', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('310', '156', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('311', '156', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('312', '156', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('313', '156', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('314', '156', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('315', '157', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('316', '157', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('317', '157', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('318', '157', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('319', '157', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('320', '158', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('321', '158', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('322', '158', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('323', '158', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('324', '158', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('325', '159', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('326', '159', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('327', '159', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('328', '159', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('329', '159', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('330', '160', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('331', '160', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('332', '161', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('333', '161', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('334', '162', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('335', '162', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('336', '162', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('337', '162', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('338', '162', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('339', '163', null, null, ' 国粮武汉科学研究设计院有限公司　　（国家粮食储备局武汉科学研究设计院）', '工程师、高工、主任工程师、副总工');
INSERT INTO `expert_jobs` VALUES ('340', '163', null, null, '饲料研究室、食品加工工程中心', '');
INSERT INTO `expert_jobs` VALUES ('341', '164', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('342', '164', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('343', '165', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('344', '165', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('345', '165', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('346', '165', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('347', '165', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('348', '166', null, null, ' 国粮武汉科学研究设计院有限公司　　（国家粮食储备局武汉科学研究设计院）', '工程师、高工、主任工程师、副总工');
INSERT INTO `expert_jobs` VALUES ('349', '166', null, null, '饲料研究室、食品加工工程中心', '');
INSERT INTO `expert_jobs` VALUES ('350', '167', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('351', '167', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('352', '168', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('353', '168', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('354', '168', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('355', '168', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('356', '168', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('357', '169', null, null, '四川省粮食学校', '');
INSERT INTO `expert_jobs` VALUES ('358', '169', null, null, '四川省粮食工程设计院', '院长');
INSERT INTO `expert_jobs` VALUES ('359', '170', null, null, '国贸工程设计院', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('360', '170', null, null, '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('361', '170', null, null, '国贸工程设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('362', '171', null, null, '四川省粮食学校', '');
INSERT INTO `expert_jobs` VALUES ('363', '171', null, null, '四川省粮食工程设计院', '院长');
INSERT INTO `expert_jobs` VALUES ('364', '172', null, null, '国贸工程设计院', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('365', '172', null, null, '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('366', '172', null, null, '国贸工程设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('367', '173', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('368', '173', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('369', '174', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('370', '174', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('371', '174', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('372', '174', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('373', '174', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('374', '175', null, null, '四川省粮食学校', '');
INSERT INTO `expert_jobs` VALUES ('375', '175', null, null, '四川省粮食工程设计院', '院长');
INSERT INTO `expert_jobs` VALUES ('376', '176', null, null, '国贸工程设计院', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('377', '176', null, null, '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('378', '176', null, null, '国贸工程设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('379', '177', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('380', '177', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('381', '178', null, null, '吉林工业大学,农业机械系', '助教');
INSERT INTO `expert_jobs` VALUES ('382', '178', '1992-07-31', '1992-07-31', '吉林工业大学,农业机械系', '讲师');
INSERT INTO `expert_jobs` VALUES ('383', '178', '1998-07-31', '1998-07-31', '吉林大学，生物与农业工程学院', '副教授、系副主任');
INSERT INTO `expert_jobs` VALUES ('384', '178', '2004-12-31', '2004-12-31', '吉林大学，生物与农业工程学院', '教授');
INSERT INTO `expert_jobs` VALUES ('385', '179', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('386', '179', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('387', '179', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('388', '179', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('389', '179', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('390', '180', null, null, '山东省科学院', '　科研');
INSERT INTO `expert_jobs` VALUES ('391', '180', null, null, '中国农业大学', '博士研究生');
INSERT INTO `expert_jobs` VALUES ('392', '180', null, null, '中国科学院生态环境研究中心', '博士后');
INSERT INTO `expert_jobs` VALUES ('393', '180', null, null, '华中农业大学', '大学教师');
INSERT INTO `expert_jobs` VALUES ('394', '180', null, null, '国家粮食局科学研究院', '科研');
INSERT INTO `expert_jobs` VALUES ('395', '181', null, null, '商业部粮食储运局', '');
INSERT INTO `expert_jobs` VALUES ('396', '181', null, null, '国家粮食储备局仓储司', '副处长');
INSERT INTO `expert_jobs` VALUES ('397', '181', null, null, '国家粮食局流通与科技发展司', '处长');
INSERT INTO `expert_jobs` VALUES ('398', '181', null, null, '国家粮食局科学研究院', '总工程师');
INSERT INTO `expert_jobs` VALUES ('399', '182', null, null, '国内贸易部科学研究院', '');
INSERT INTO `expert_jobs` VALUES ('400', '182', null, null, '国内贸易部北京设计院', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('401', '182', null, null, '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('402', '182', null, null, '国贸工程设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('403', '183', null, null, '河南科技大学', '');
INSERT INTO `expert_jobs` VALUES ('404', '183', null, null, '济南汽车制造总厂', '助工');
INSERT INTO `expert_jobs` VALUES ('405', '183', null, null, '武汉大学', '');
INSERT INTO `expert_jobs` VALUES ('406', '183', null, null, '河南工业大学（原郑州粮食学院）', '');
INSERT INTO `expert_jobs` VALUES ('407', '184', null, null, '安徽佳通轮胎', '总助');
INSERT INTO `expert_jobs` VALUES ('408', '184', null, null, ' 蛇口港', '经理');
INSERT INTO `expert_jobs` VALUES ('409', '184', null, null, '深圳赤湾港航股份有限公司', '副总');
INSERT INTO `expert_jobs` VALUES ('410', '185', null, null, '国贸工程设计院', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('411', '185', null, null, '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('412', '185', null, null, '国贸工程设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('413', '185', null, null, '国贸工程设计院', '工程咨询部副部长');
INSERT INTO `expert_jobs` VALUES ('414', '185', null, null, '国贸工程设计院', '工程咨询所所长');
INSERT INTO `expert_jobs` VALUES ('415', '186', null, null, '国家粮食储备局郑州科学研究设计院', '见习');
INSERT INTO `expert_jobs` VALUES ('416', '186', null, null, '国家粮食储备局郑州科学研究设计院', '助工');
INSERT INTO `expert_jobs` VALUES ('417', '186', null, null, '国家粮食储备局郑州科学研究设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('418', '186', null, null, '国家粮食储备局郑州科学研究设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('419', '186', null, null, '中粮工程科技（郑州）有限公司（原国家粮食储备局郑州科学研究设计院）', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('420', '187', null, null, '中交第一航务工程勘察设计院', '副总工 顾问总工/教高');
INSERT INTO `expert_jobs` VALUES ('421', '187', null, null, '中交天津港湾工程设计院', '专家/教高');
INSERT INTO `expert_jobs` VALUES ('422', '188', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('423', '188', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('424', '189', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('425', '189', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('426', '189', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('427', '189', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('428', '189', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('429', '190', null, null, ' 国粮武汉科学研究设计院有限公司　　（国家粮食储备局武汉科学研究设计院）', '工程师、高工、主任工程师、副总工');
INSERT INTO `expert_jobs` VALUES ('430', '190', null, null, '饲料研究室、食品加工工程中心', '');
INSERT INTO `expert_jobs` VALUES ('431', '191', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('432', '191', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('433', '192', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('434', '192', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('435', '192', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('436', '192', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('437', '192', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('438', '193', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('439', '193', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('440', '194', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('441', '194', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('442', '194', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('443', '194', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('444', '194', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('445', '195', null, null, ' 国粮武汉科学研究设计院有限公司　　（国家粮食储备局武汉科学研究设计院）', '工程师、高工、主任工程师、副总工');
INSERT INTO `expert_jobs` VALUES ('446', '195', null, null, '饲料研究室、食品加工工程中心', '');
INSERT INTO `expert_jobs` VALUES ('447', '196', null, null, '四川省粮食学校', '');
INSERT INTO `expert_jobs` VALUES ('448', '196', null, null, '四川省粮食工程设计院', '院长');
INSERT INTO `expert_jobs` VALUES ('449', '197', null, null, '国贸工程设计院', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('450', '197', null, null, '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('451', '197', null, null, '国贸工程设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('452', '198', null, null, '八一农大基础部数学系', '教师/讲师、副教授');
INSERT INTO `expert_jobs` VALUES ('453', '198', null, null, '八一农大经济管理学院 ', '系主任、副院长/教授');
INSERT INTO `expert_jobs` VALUES ('454', '198', null, null, '东北农业大学数学生态', '硕士研究生');
INSERT INTO `expert_jobs` VALUES ('455', '198', null, null, '大连理工大学管理学院管理科学与工程', '博士研究生');
INSERT INTO `expert_jobs` VALUES ('456', '199', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('457', '199', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('458', '200', null, null, '吉林工业大学,农业机械系', '助教');
INSERT INTO `expert_jobs` VALUES ('459', '200', '1992-07-31', '1992-07-31', '吉林工业大学,农业机械系', '讲师');
INSERT INTO `expert_jobs` VALUES ('460', '200', '1998-07-31', '1998-07-31', '吉林大学，生物与农业工程学院', '副教授、系副主任');
INSERT INTO `expert_jobs` VALUES ('461', '200', '2004-12-31', '2004-12-31', '吉林大学，生物与农业工程学院', '教授');
INSERT INTO `expert_jobs` VALUES ('462', '201', null, null, '装甲兵工程学院基础教研室', '讲师');
INSERT INTO `expert_jobs` VALUES ('463', '201', null, null, '北京邮电大学 ', '教授');
INSERT INTO `expert_jobs` VALUES ('464', '201', null, null, '日本东京农工大学', '访问教授');
INSERT INTO `expert_jobs` VALUES ('465', '201', null, null, '中国驻大阪总领事馆/中国驻日本大使馆', '教育一秘');
INSERT INTO `expert_jobs` VALUES ('466', '201', null, null, '日本东京大学', '客座研究员');
INSERT INTO `expert_jobs` VALUES ('467', '202', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('468', '202', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('469', '202', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('470', '202', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('471', '202', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('472', '203', null, null, '郑州粮食学院、粮油储藏专业', '');
INSERT INTO `expert_jobs` VALUES ('473', '203', null, null, ' 南京农业大学、全国植保讲师进修班，进修昆虫学', '');
INSERT INTO `expert_jobs` VALUES ('474', '203', null, null, '，南京财经大学、食品科学与工程学院', '教师');
INSERT INTO `expert_jobs` VALUES ('475', '204', null, null, '河南省粮食厅供应处', '科员');
INSERT INTO `expert_jobs` VALUES ('476', '204', null, null, '河南省粮食储运公司', '科长、副总经理');
INSERT INTO `expert_jobs` VALUES ('477', '204', null, null, '河南省粮油对外贸易总公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('478', '204', null, null, '河南省粮食交易物流市场', '董事长兼总经理');
INSERT INTO `expert_jobs` VALUES ('479', '205', null, null, '山东省科学院', '　科研');
INSERT INTO `expert_jobs` VALUES ('480', '205', null, null, '中国农业大学', '博士研究生');
INSERT INTO `expert_jobs` VALUES ('481', '205', null, null, '中国科学院生态环境研究中心', '博士后');
INSERT INTO `expert_jobs` VALUES ('482', '205', null, null, '华中农业大学', '大学教师');
INSERT INTO `expert_jobs` VALUES ('483', '205', null, null, '国家粮食局科学研究院', '科研');
INSERT INTO `expert_jobs` VALUES ('484', '206', null, null, '北京农业大学经济管理学院读书', '大学本科，学士');
INSERT INTO `expert_jobs` VALUES ('485', '206', null, null, ' 南京农业大学经济管理学院读书', '研究生，博士');
INSERT INTO `expert_jobs` VALUES ('486', '206', null, null, '南京财经大学产业发展研究院', '副院长');
INSERT INTO `expert_jobs` VALUES ('487', '206', null, null, '南京财经大学粮食经济研究院', '副院长、院长');
INSERT INTO `expert_jobs` VALUES ('488', '207', null, null, '商业部粮食储运局', '');
INSERT INTO `expert_jobs` VALUES ('489', '207', null, null, '国家粮食储备局仓储司', '副处长');
INSERT INTO `expert_jobs` VALUES ('490', '207', null, null, '国家粮食局流通与科技发展司', '处长');
INSERT INTO `expert_jobs` VALUES ('491', '207', null, null, '国家粮食局科学研究院', '总工程师');
INSERT INTO `expert_jobs` VALUES ('492', '208', null, null, '国内贸易部科学研究院', '');
INSERT INTO `expert_jobs` VALUES ('493', '208', null, null, '国内贸易部北京设计院', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('494', '208', null, null, '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('495', '208', null, null, '国贸工程设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('496', '209', null, null, '河南科技大学', '');
INSERT INTO `expert_jobs` VALUES ('497', '209', null, null, '济南汽车制造总厂', '助工');
INSERT INTO `expert_jobs` VALUES ('498', '209', null, null, '武汉大学', '');
INSERT INTO `expert_jobs` VALUES ('499', '209', null, null, '河南工业大学（原郑州粮食学院）', '');
INSERT INTO `expert_jobs` VALUES ('500', '210', null, null, '商业部科研院（内贸部北京设计院、国贸工程设计院）', '从事自动化工程设计、计算机应用、科研开发等工作。');
INSERT INTO `expert_jobs` VALUES ('501', '210', null, null, '在德国埃森大学参加测控技术培训', '');
INSERT INTO `expert_jobs` VALUES ('502', '211', null, null, '安徽佳通轮胎', '总助');
INSERT INTO `expert_jobs` VALUES ('503', '211', null, null, ' 蛇口港', '经理');
INSERT INTO `expert_jobs` VALUES ('504', '211', null, null, '深圳赤湾港航股份有限公司', '副总');
INSERT INTO `expert_jobs` VALUES ('505', '212', null, null, '国贸工程设计院', '工程师/所长/总工');
INSERT INTO `expert_jobs` VALUES ('506', '212', null, null, ' ', '');
INSERT INTO `expert_jobs` VALUES ('507', '213', null, null, '国贸工程设计院', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('508', '213', null, null, '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('509', '213', null, null, '国贸工程设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('510', '213', null, null, '国贸工程设计院', '工程咨询部副部长');
INSERT INTO `expert_jobs` VALUES ('511', '213', null, null, '国贸工程设计院', '工程咨询所所长');
INSERT INTO `expert_jobs` VALUES ('512', '214', null, null, ' 国粮武汉科学研究设计院有限公司　　（国家粮食储备局武汉科学研究设计院）', '工程师、高工、主任工程师、副总工');
INSERT INTO `expert_jobs` VALUES ('513', '214', null, null, '饲料研究室、食品加工工程中心', '');
INSERT INTO `expert_jobs` VALUES ('514', '215', null, null, '国家粮食储备局郑州科学研究设计院', '见习');
INSERT INTO `expert_jobs` VALUES ('515', '215', null, null, '国家粮食储备局郑州科学研究设计院', '助工');
INSERT INTO `expert_jobs` VALUES ('516', '215', null, null, '国家粮食储备局郑州科学研究设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('517', '215', null, null, '国家粮食储备局郑州科学研究设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('518', '215', null, null, '中粮工程科技（郑州）有限公司（原国家粮食储备局郑州科学研究设计院）', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('519', '216', null, null, '中交第一航务工程勘察设计院', '副总工 顾问总工/教高');
INSERT INTO `expert_jobs` VALUES ('520', '216', null, null, '中交天津港湾工程设计院', '专家/教高');
INSERT INTO `expert_jobs` VALUES ('521', '217', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('522', '217', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('523', '218', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('524', '218', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('525', '218', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('526', '218', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('527', '218', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('528', '219', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('529', '219', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('530', '220', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('531', '220', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('532', '220', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('533', '220', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('534', '220', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('535', '221', null, null, ' 国粮武汉科学研究设计院有限公司　　（国家粮食储备局武汉科学研究设计院）', '工程师、高工、主任工程师、副总工');
INSERT INTO `expert_jobs` VALUES ('536', '221', null, null, '饲料研究室、食品加工工程中心', '');
INSERT INTO `expert_jobs` VALUES ('537', '222', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('538', '222', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('539', '223', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('540', '223', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('541', '223', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('542', '223', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('543', '223', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('544', '224', null, null, ' 国粮武汉科学研究设计院有限公司　　（国家粮食储备局武汉科学研究设计院）', '工程师、高工、主任工程师、副总工');
INSERT INTO `expert_jobs` VALUES ('545', '224', null, null, '饲料研究室、食品加工工程中心', '');
INSERT INTO `expert_jobs` VALUES ('546', '225', null, null, '四川省粮食学校', '');
INSERT INTO `expert_jobs` VALUES ('547', '225', null, null, '四川省粮食工程设计院', '院长');
INSERT INTO `expert_jobs` VALUES ('548', '226', null, null, '国贸工程设计院', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('549', '226', null, null, '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('550', '226', null, null, '国贸工程设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('551', '227', null, null, '八一农大基础部数学系', '教师/讲师、副教授');
INSERT INTO `expert_jobs` VALUES ('552', '227', null, null, '八一农大经济管理学院 ', '系主任、副院长/教授');
INSERT INTO `expert_jobs` VALUES ('553', '227', null, null, '东北农业大学数学生态', '硕士研究生');
INSERT INTO `expert_jobs` VALUES ('554', '227', null, null, '大连理工大学管理学院管理科学与工程', '博士研究生');
INSERT INTO `expert_jobs` VALUES ('555', '228', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('556', '228', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('557', '229', null, null, '吉林工业大学,农业机械系', '助教');
INSERT INTO `expert_jobs` VALUES ('558', '229', '1992-07-31', '1992-07-31', '吉林工业大学,农业机械系', '讲师');
INSERT INTO `expert_jobs` VALUES ('559', '229', '1998-07-31', '1998-07-31', '吉林大学，生物与农业工程学院', '副教授、系副主任');
INSERT INTO `expert_jobs` VALUES ('560', '229', '2004-12-31', '2004-12-31', '吉林大学，生物与农业工程学院', '教授');
INSERT INTO `expert_jobs` VALUES ('561', '230', null, null, '装甲兵工程学院基础教研室', '讲师');
INSERT INTO `expert_jobs` VALUES ('562', '230', null, null, '北京邮电大学 ', '教授');
INSERT INTO `expert_jobs` VALUES ('563', '230', null, null, '日本东京农工大学', '访问教授');
INSERT INTO `expert_jobs` VALUES ('564', '230', null, null, '中国驻大阪总领事馆/中国驻日本大使馆', '教育一秘');
INSERT INTO `expert_jobs` VALUES ('565', '230', null, null, '日本东京大学', '客座研究员');
INSERT INTO `expert_jobs` VALUES ('566', '231', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('567', '231', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('568', '231', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('569', '231', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('570', '231', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('571', '232', null, null, '郑州粮食学院、粮油储藏专业', '');
INSERT INTO `expert_jobs` VALUES ('572', '232', null, null, ' 南京农业大学、全国植保讲师进修班，进修昆虫学', '');
INSERT INTO `expert_jobs` VALUES ('573', '232', null, null, '，南京财经大学、食品科学与工程学院', '教师');
INSERT INTO `expert_jobs` VALUES ('574', '233', null, null, '河南省粮食厅供应处', '科员');
INSERT INTO `expert_jobs` VALUES ('575', '233', null, null, '河南省粮食储运公司', '科长、副总经理');
INSERT INTO `expert_jobs` VALUES ('576', '233', null, null, '河南省粮油对外贸易总公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('577', '233', null, null, '河南省粮食交易物流市场', '董事长兼总经理');
INSERT INTO `expert_jobs` VALUES ('578', '234', null, null, '山东省科学院', '　科研');
INSERT INTO `expert_jobs` VALUES ('579', '234', null, null, '中国农业大学', '博士研究生');
INSERT INTO `expert_jobs` VALUES ('580', '234', null, null, '中国科学院生态环境研究中心', '博士后');
INSERT INTO `expert_jobs` VALUES ('581', '234', null, null, '华中农业大学', '大学教师');
INSERT INTO `expert_jobs` VALUES ('582', '234', null, null, '国家粮食局科学研究院', '科研');
INSERT INTO `expert_jobs` VALUES ('583', '235', null, null, '北京农业大学经济管理学院读书', '大学本科，学士');
INSERT INTO `expert_jobs` VALUES ('584', '235', null, null, ' 南京农业大学经济管理学院读书', '研究生，博士');
INSERT INTO `expert_jobs` VALUES ('585', '235', null, null, '南京财经大学产业发展研究院', '副院长');
INSERT INTO `expert_jobs` VALUES ('586', '235', null, null, '南京财经大学粮食经济研究院', '副院长、院长');
INSERT INTO `expert_jobs` VALUES ('587', '236', null, null, '商业部粮食储运局', '');
INSERT INTO `expert_jobs` VALUES ('588', '236', null, null, '国家粮食储备局仓储司', '副处长');
INSERT INTO `expert_jobs` VALUES ('589', '236', null, null, '国家粮食局流通与科技发展司', '处长');
INSERT INTO `expert_jobs` VALUES ('590', '236', null, null, '国家粮食局科学研究院', '总工程师');
INSERT INTO `expert_jobs` VALUES ('591', '237', null, null, '国内贸易部科学研究院', '');
INSERT INTO `expert_jobs` VALUES ('592', '237', null, null, '国内贸易部北京设计院', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('593', '237', null, null, '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('594', '237', null, null, '国贸工程设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('595', '238', null, null, '河南科技大学', '');
INSERT INTO `expert_jobs` VALUES ('596', '238', null, null, '济南汽车制造总厂', '助工');
INSERT INTO `expert_jobs` VALUES ('597', '238', null, null, '武汉大学', '');
INSERT INTO `expert_jobs` VALUES ('598', '238', null, null, '河南工业大学（原郑州粮食学院）', '');
INSERT INTO `expert_jobs` VALUES ('599', '239', null, null, '商业部科研院（内贸部北京设计院、国贸工程设计院）', '从事自动化工程设计、计算机应用、科研开发等工作。');
INSERT INTO `expert_jobs` VALUES ('600', '239', null, null, '在德国埃森大学参加测控技术培训', '');
INSERT INTO `expert_jobs` VALUES ('601', '240', null, null, '安徽佳通轮胎', '总助');
INSERT INTO `expert_jobs` VALUES ('602', '240', null, null, ' 蛇口港', '经理');
INSERT INTO `expert_jobs` VALUES ('603', '240', null, null, '深圳赤湾港航股份有限公司', '副总');
INSERT INTO `expert_jobs` VALUES ('604', '241', null, null, '国贸工程设计院', '工程师/所长/总工');
INSERT INTO `expert_jobs` VALUES ('605', '241', null, null, ' ', '');
INSERT INTO `expert_jobs` VALUES ('606', '242', null, null, '国贸工程设计院', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('607', '242', null, null, '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('608', '242', null, null, '国贸工程设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('609', '242', null, null, '国贸工程设计院', '工程咨询部副部长');
INSERT INTO `expert_jobs` VALUES ('610', '242', null, null, '国贸工程设计院', '工程咨询所所长');
INSERT INTO `expert_jobs` VALUES ('611', '243', null, null, ' 国粮武汉科学研究设计院有限公司　　（国家粮食储备局武汉科学研究设计院）', '工程师、高工、主任工程师、副总工');
INSERT INTO `expert_jobs` VALUES ('612', '243', null, null, '饲料研究室、食品加工工程中心', '');
INSERT INTO `expert_jobs` VALUES ('613', '244', null, null, '国家粮食储备局郑州科学研究设计院', '见习');
INSERT INTO `expert_jobs` VALUES ('614', '244', null, null, '国家粮食储备局郑州科学研究设计院', '助工');
INSERT INTO `expert_jobs` VALUES ('615', '244', null, null, '国家粮食储备局郑州科学研究设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('616', '244', null, null, '国家粮食储备局郑州科学研究设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('617', '244', null, null, '中粮工程科技（郑州）有限公司（原国家粮食储备局郑州科学研究设计院）', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('618', '245', null, null, '中交第一航务工程勘察设计院', '副总工 顾问总工/教高');
INSERT INTO `expert_jobs` VALUES ('619', '245', null, null, '中交天津港湾工程设计院', '专家/教高');
INSERT INTO `expert_jobs` VALUES ('620', '246', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('621', '246', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('622', '247', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('623', '247', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('624', '247', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('625', '247', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('626', '247', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('627', '248', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('628', '248', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('629', '248', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('630', '248', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('631', '248', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('632', '249', null, null, ' 国粮武汉科学研究设计院有限公司　　（国家粮食储备局武汉科学研究设计院）', '工程师、高工、主任工程师、副总工');
INSERT INTO `expert_jobs` VALUES ('633', '249', null, null, '饲料研究室、食品加工工程中心', '');
INSERT INTO `expert_jobs` VALUES ('634', '250', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('635', '250', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('636', '251', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('637', '251', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('638', '251', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('639', '251', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('640', '251', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('641', '252', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('642', '252', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('643', '252', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('644', '252', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('645', '252', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('646', '253', null, null, ' 国粮武汉科学研究设计院有限公司　　（国家粮食储备局武汉科学研究设计院）', '工程师、高工、主任工程师、副总工');
INSERT INTO `expert_jobs` VALUES ('647', '253', null, null, '饲料研究室、食品加工工程中心', '');
INSERT INTO `expert_jobs` VALUES ('648', '254', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('649', '254', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('650', '255', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('651', '255', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('652', '255', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('653', '255', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('654', '255', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('655', '256', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('656', '256', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('657', '256', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('658', '256', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('659', '256', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('660', '257', null, null, ' 国粮武汉科学研究设计院有限公司　　（国家粮食储备局武汉科学研究设计院）', '工程师、高工、主任工程师、副总工');
INSERT INTO `expert_jobs` VALUES ('661', '257', null, null, '饲料研究室、食品加工工程中心', '');
INSERT INTO `expert_jobs` VALUES ('662', '258', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('663', '258', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('664', '259', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('665', '259', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('666', '259', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('667', '259', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('668', '259', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('669', '260', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('670', '260', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('671', '260', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('672', '260', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('673', '260', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('674', '261', null, null, ' 国粮武汉科学研究设计院有限公司　　（国家粮食储备局武汉科学研究设计院）', '工程师、高工、主任工程师、副总工');
INSERT INTO `expert_jobs` VALUES ('675', '261', null, null, '饲料研究室、食品加工工程中心', '');
INSERT INTO `expert_jobs` VALUES ('676', '262', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('677', '262', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('678', '262', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('679', '262', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('680', '262', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('681', '263', '1986-06-30', '1986-06-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('682', '263', '1991-10-31', '1991-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('683', '263', '1999-11-30', '1999-11-30', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('684', '263', '2004-11-30', '2004-11-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('685', '263', '2014-04-30', '2014-04-30', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('686', '264', '1986-06-30', '1991-09-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('687', '264', '1991-10-31', '1999-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('688', '264', '1999-11-30', '2004-10-31', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('689', '264', '2004-11-30', '2014-04-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('690', '264', '2014-04-30', '2015-12-31', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('691', '265', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('692', '265', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('693', '266', '1986-06-30', '1991-09-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('694', '266', '1991-10-31', '1999-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('695', '266', '1999-11-30', '2004-10-31', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('696', '266', '2004-11-30', '2014-04-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('697', '266', '2014-04-30', null, '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('698', '267', '1986-06-30', '1991-09-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('699', '267', '1991-10-31', '1999-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('700', '267', '1999-11-30', '2004-10-31', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('701', '267', '2004-11-30', '2014-04-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('702', '267', '2014-04-30', '2015-12-31', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('703', '268', '1986-06-30', '1991-09-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('704', '268', '1991-10-31', '1999-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('705', '268', '1999-11-30', '2004-10-31', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('706', '268', '2004-11-30', '2014-04-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('707', '268', '2014-04-30', '2015-12-31', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('708', '269', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('709', '269', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('710', '270', '1986-06-30', '1991-09-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('711', '270', '1991-10-31', '1999-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('712', '270', '1999-11-30', '2004-10-31', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('713', '270', '2004-11-30', '2014-04-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('714', '270', '2014-04-30', null, '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('715', '271', '1986-06-30', '1991-09-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('716', '271', '1991-10-31', '1999-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('717', '271', '1999-11-30', '2004-10-31', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('718', '271', '2004-11-30', '2014-04-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('719', '271', '2014-04-30', '2015-12-31', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('720', '272', '1986-06-30', '1991-09-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('721', '272', '1991-10-31', '1999-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('722', '272', '1999-11-30', '2004-10-31', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('723', '272', '2004-11-30', '2014-04-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('724', '272', '2014-04-30', '2015-12-31', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('725', '273', null, null, ' 国粮武汉科学研究设计院有限公司　　（国家粮食储备局武汉科学研究设计院）', '工程师、高工、主任工程师、副总工');
INSERT INTO `expert_jobs` VALUES ('726', '273', null, null, '饲料研究室、食品加工工程中心', '');
INSERT INTO `expert_jobs` VALUES ('727', '274', null, null, '深圳天和双力物流自动化设备有限公司', '分公司经理');
INSERT INTO `expert_jobs` VALUES ('728', '274', null, null, '湖南智新科自动化设备有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('729', '275', '1986-06-30', '1991-09-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('730', '275', '1991-10-31', '1999-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('731', '275', '1999-11-30', '2004-10-31', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('732', '275', '2004-11-30', '2014-04-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('733', '275', '2014-04-30', null, '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('734', '276', '1986-06-30', '1991-09-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('735', '276', '1991-10-31', '1999-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('736', '276', '1999-11-30', '2004-10-31', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('737', '276', '2004-11-30', '2014-04-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('738', '276', '2014-04-30', '2015-12-31', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('739', '277', '1986-06-30', '1991-09-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('740', '277', '1991-10-31', '1999-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('741', '277', '1999-11-30', '2004-10-31', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('742', '277', '2004-11-30', '2014-04-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('743', '277', '2014-04-30', '2015-12-31', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('744', '278', null, null, '四川省粮食学校', '');
INSERT INTO `expert_jobs` VALUES ('745', '278', null, null, '四川省粮食工程设计院', '院长');
INSERT INTO `expert_jobs` VALUES ('746', '279', null, null, '国贸工程设计院', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('747', '279', null, null, '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('748', '279', null, null, '国贸工程设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('749', '280', null, null, '八一农大基础部数学系', '教师/讲师、副教授');
INSERT INTO `expert_jobs` VALUES ('750', '280', null, null, '八一农大经济管理学院 ', '系主任、副院长/教授');
INSERT INTO `expert_jobs` VALUES ('751', '280', null, null, '东北农业大学数学生态', '硕士研究生');
INSERT INTO `expert_jobs` VALUES ('752', '280', null, null, '大连理工大学管理学院管理科学与工程', '博士研究生');
INSERT INTO `expert_jobs` VALUES ('753', '281', null, null, '吉林工业大学,农业机械系', '助教');
INSERT INTO `expert_jobs` VALUES ('754', '281', '1992-07-31', '1998-06-30', '吉林工业大学,农业机械系', '讲师');
INSERT INTO `expert_jobs` VALUES ('755', '281', '1998-07-31', null, '吉林大学，生物与农业工程学院', '副教授、系副主任');
INSERT INTO `expert_jobs` VALUES ('756', '281', '2004-12-31', null, '吉林大学，生物与农业工程学院', '教授');
INSERT INTO `expert_jobs` VALUES ('757', '282', null, null, '装甲兵工程学院基础教研室', '讲师');
INSERT INTO `expert_jobs` VALUES ('758', '282', null, null, '北京邮电大学 ', '教授');
INSERT INTO `expert_jobs` VALUES ('759', '282', null, null, '日本东京农工大学', '访问教授');
INSERT INTO `expert_jobs` VALUES ('760', '282', null, null, '中国驻大阪总领事馆/中国驻日本大使馆', '教育一秘');
INSERT INTO `expert_jobs` VALUES ('761', '282', null, null, '日本东京大学', '客座研究员');
INSERT INTO `expert_jobs` VALUES ('762', '283', null, null, '郑州粮食学院、粮油储藏专业', '');
INSERT INTO `expert_jobs` VALUES ('763', '283', null, null, ' 南京农业大学、全国植保讲师进修班，进修昆虫学', '');
INSERT INTO `expert_jobs` VALUES ('764', '283', null, null, '，南京财经大学、食品科学与工程学院', '教师');
INSERT INTO `expert_jobs` VALUES ('765', '284', null, null, '河南省粮食厅供应处', '科员');
INSERT INTO `expert_jobs` VALUES ('766', '284', null, null, '河南省粮食储运公司', '科长、副总经理');
INSERT INTO `expert_jobs` VALUES ('767', '284', null, null, '河南省粮油对外贸易总公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('768', '284', null, null, '河南省粮食交易物流市场', '董事长兼总经理');
INSERT INTO `expert_jobs` VALUES ('769', '285', null, null, '山东省科学院', '　科研');
INSERT INTO `expert_jobs` VALUES ('770', '285', null, null, '中国农业大学', '博士研究生');
INSERT INTO `expert_jobs` VALUES ('771', '285', null, null, '中国科学院生态环境研究中心', '博士后');
INSERT INTO `expert_jobs` VALUES ('772', '285', null, null, '华中农业大学', '大学教师');
INSERT INTO `expert_jobs` VALUES ('773', '285', null, null, '国家粮食局科学研究院', '科研');
INSERT INTO `expert_jobs` VALUES ('774', '286', null, null, '北京农业大学经济管理学院读书', '大学本科，学士');
INSERT INTO `expert_jobs` VALUES ('775', '286', null, null, ' 南京农业大学经济管理学院读书', '研究生，博士');
INSERT INTO `expert_jobs` VALUES ('776', '286', null, null, '南京财经大学产业发展研究院', '副院长');
INSERT INTO `expert_jobs` VALUES ('777', '286', null, null, '南京财经大学粮食经济研究院', '副院长、院长');
INSERT INTO `expert_jobs` VALUES ('778', '287', null, null, '商业部粮食储运局', '');
INSERT INTO `expert_jobs` VALUES ('779', '287', null, null, '国家粮食储备局仓储司', '副处长');
INSERT INTO `expert_jobs` VALUES ('780', '287', null, null, '国家粮食局流通与科技发展司', '处长');
INSERT INTO `expert_jobs` VALUES ('781', '287', null, null, '国家粮食局科学研究院', '总工程师');
INSERT INTO `expert_jobs` VALUES ('782', '288', null, null, '国内贸易部科学研究院', '');
INSERT INTO `expert_jobs` VALUES ('783', '288', null, null, '国内贸易部北京设计院', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('784', '288', null, null, '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('785', '288', null, null, '国贸工程设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('786', '289', null, null, '河南科技大学', '');
INSERT INTO `expert_jobs` VALUES ('787', '289', null, null, '济南汽车制造总厂', '助工');
INSERT INTO `expert_jobs` VALUES ('788', '289', null, null, '武汉大学', '');
INSERT INTO `expert_jobs` VALUES ('789', '289', null, null, '河南工业大学（原郑州粮食学院）', '');
INSERT INTO `expert_jobs` VALUES ('790', '290', null, null, '商业部科研院（内贸部北京设计院、国贸工程设计院）', '从事自动化工程设计、计算机应用、科研开发等工作。');
INSERT INTO `expert_jobs` VALUES ('791', '290', null, null, '在德国埃森大学参加测控技术培训', '');
INSERT INTO `expert_jobs` VALUES ('792', '291', null, null, '安徽佳通轮胎', '总助');
INSERT INTO `expert_jobs` VALUES ('793', '291', null, null, ' 蛇口港', '经理');
INSERT INTO `expert_jobs` VALUES ('794', '291', null, null, '深圳赤湾港航股份有限公司', '副总');
INSERT INTO `expert_jobs` VALUES ('795', '292', null, null, '国贸工程设计院', '工程师/所长/总工');
INSERT INTO `expert_jobs` VALUES ('796', '292', null, null, ' ', '');
INSERT INTO `expert_jobs` VALUES ('797', '293', null, null, '国贸工程设计院', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('798', '293', null, null, '国贸工程设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('799', '293', null, null, '国贸工程设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('800', '293', null, null, '国贸工程设计院', '工程咨询部副部长');
INSERT INTO `expert_jobs` VALUES ('801', '293', null, null, '国贸工程设计院', '工程咨询所所长');
INSERT INTO `expert_jobs` VALUES ('802', '294', null, null, '国家粮食储备局郑州科学研究设计院', '见习');
INSERT INTO `expert_jobs` VALUES ('803', '294', null, null, '国家粮食储备局郑州科学研究设计院', '助工');
INSERT INTO `expert_jobs` VALUES ('804', '294', null, null, '国家粮食储备局郑州科学研究设计院', '工程师');
INSERT INTO `expert_jobs` VALUES ('805', '294', null, null, '国家粮食储备局郑州科学研究设计院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('806', '294', null, null, '中粮工程科技（郑州）有限公司（原国家粮食储备局郑州科学研究设计院）', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('807', '295', null, null, '中交第一航务工程勘察设计院', '副总工 顾问总工/教高');
INSERT INTO `expert_jobs` VALUES ('808', '295', null, null, '中交天津港湾工程设计院', '专家/教高');
INSERT INTO `expert_jobs` VALUES ('809', '296', '1971-09-30', '1996-03-31', '四川省铜梁县粮食局储运股副股长、工业股股长、科技科科长，铜梁县粮油质检站站长。', '1990年6月任经济师');
INSERT INTO `expert_jobs` VALUES ('810', '296', '1996-03-31', '2004-09-30', '重庆市铜梁县粮食局副局长、局长，党委副书记、书记，铜梁县粮油总公司副总经理、总经理。 ', '2003年1月任高级政工师');
INSERT INTO `expert_jobs` VALUES ('811', '296', '2004-09-30', '2008-01-31', '重庆粮油集团有限责任公司董事长。', '');
INSERT INTO `expert_jobs` VALUES ('812', '296', '2008-02-29', null, '重庆粮食集团有限责任公司副总裁、副总经理。', '2013年10月任高级经济师');
INSERT INTO `expert_jobs` VALUES ('813', '297', null, null, '中国储备粮管理总公司仓储管理部', '副部长');
INSERT INTO `expert_jobs` VALUES ('814', '297', null, null, '中国储备粮管理总公司湖北分公司', '副总经理');
INSERT INTO `expert_jobs` VALUES ('815', '297', null, null, '中国储备粮管理总公司湖北分公司业务（仓储）处', '处长');
INSERT INTO `expert_jobs` VALUES ('816', '298', null, null, '河南省开封县杜良乡政府', '科员');
INSERT INTO `expert_jobs` VALUES ('817', '298', null, null, '河南省粮食局储运处 ', '主任科员');
INSERT INTO `expert_jobs` VALUES ('818', '298', null, null, '河南省粮食局流通与科技发展处', '主任科员');
INSERT INTO `expert_jobs` VALUES ('819', '298', null, null, '河南省粮食局流通与科技发展处', '副处长');
INSERT INTO `expert_jobs` VALUES ('820', '299', null, null, '陆军第五十九中心医院', '医师、干事');
INSERT INTO `expert_jobs` VALUES ('821', '299', null, null, '昆明陆军学院成都分院', '正团职主任');
INSERT INTO `expert_jobs` VALUES ('822', '299', null, null, '四川省粮食局', '办公室主任');
INSERT INTO `expert_jobs` VALUES ('823', '299', null, null, '四川省粮食局', '仓储处处长');
INSERT INTO `expert_jobs` VALUES ('824', '300', null, null, '北京市永定门粮食仓库 储运科', '粮食保管员');
INSERT INTO `expert_jobs` VALUES ('825', '300', null, null, '北京市粮食储运公司 保管科 ', '科员');
INSERT INTO `expert_jobs` VALUES ('826', '300', null, null, '北京市西南郊粮食收储库 储运科', '副部长、部长');
INSERT INTO `expert_jobs` VALUES ('827', '300', null, null, '中央党校在职研究生院', '学习');
INSERT INTO `expert_jobs` VALUES ('828', '301', null, null, '石家庄地区、市粮食局', '副处长∕助工');
INSERT INTO `expert_jobs` VALUES ('829', '301', null, null, '河北石家庄国家粮食储备库 ', '主任∕工程师');
INSERT INTO `expert_jobs` VALUES ('830', '301', null, null, '中央储备粮石家庄直属库、辛集直属库', '主任∕高级工程师');
INSERT INTO `expert_jobs` VALUES ('831', '301', null, null, '中央储备粮涿州直属库', '书记∕高级工程师');
INSERT INTO `expert_jobs` VALUES ('832', '302', null, null, '国家粮食储备局成都粮食储藏科学研究所', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('833', '302', null, null, '国家粮食储备局成都粮食储藏科学研究所', '工程师');
INSERT INTO `expert_jobs` VALUES ('834', '302', null, null, '国家粮食储备局成都粮食储藏科学研究所', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('835', '303', null, null, '成都粮食储藏科学研究所', ' 工程师');
INSERT INTO `expert_jobs` VALUES ('836', '303', null, null, '四川工业学院在职研究生进修班学习（机电一体化专业） ', ' 工程师');
INSERT INTO `expert_jobs` VALUES ('837', '303', null, null, '成都粮食储藏科学研究所', '副研究员');
INSERT INTO `expert_jobs` VALUES ('838', '303', null, null, '成都粮食储藏科学研究所', '研究员');
INSERT INTO `expert_jobs` VALUES ('839', '304', null, null, '中储粮成都粮食储藏科学研究所', '');
INSERT INTO `expert_jobs` VALUES ('840', '304', null, null, '中储粮成都粮食储藏科学研究所', '副主任、主任');
INSERT INTO `expert_jobs` VALUES ('841', '304', null, null, '中储粮成都粮食储藏科学研究所', '副所长');
INSERT INTO `expert_jobs` VALUES ('842', '304', null, null, '中储粮成都粮食储藏科学研究所、中储粮粮油质检中心', '副所长、主任');
INSERT INTO `expert_jobs` VALUES ('843', '305', null, null, '国家粮食储备局综合管理司、储运司、仓储司', '副主任科员、主任科员');
INSERT INTO `expert_jobs` VALUES ('844', '305', null, null, '中国储备粮管理总公司业务二部仓储管理处', '处 长');
INSERT INTO `expert_jobs` VALUES ('845', '305', null, null, '中国储备粮管理总公司', '总经理秘书、党组秘书兼综合部总经理办公室主任（处 长）');
INSERT INTO `expert_jobs` VALUES ('846', '305', null, null, '中国储备粮管理总公司综合部', '副部长');
INSERT INTO `expert_jobs` VALUES ('847', '305', null, null, '中国储备粮管理总公司仓储管理部', '副部长');
INSERT INTO `expert_jobs` VALUES ('848', '306', null, null, '南京粮食经济学院', '学生');
INSERT INTO `expert_jobs` VALUES ('849', '306', null, null, '中央储备粮绵阳直属库 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('850', '306', null, null, '中储粮成都粮食储藏科学研究所', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('851', '307', null, null, '黑龙江粮食学校', '助教、讲师、高级讲师');
INSERT INTO `expert_jobs` VALUES ('852', '307', null, null, '黑龙江粮食职业学院', '教研室主任/副教授、教授');
INSERT INTO `expert_jobs` VALUES ('853', '308', null, null, '湖北省荆门县烟垢粮管所', '防化员、检验员、储运组长等');
INSERT INTO `expert_jobs` VALUES ('854', '308', null, null, '荆门市粮食局 ', '科员、市粮油防治检验所副所长、所长/助工、工程师、高级工程师');
INSERT INTO `expert_jobs` VALUES ('855', '308', null, null, '中央储备粮荆门直属库', '副主任/高级工程师');
INSERT INTO `expert_jobs` VALUES ('856', '308', null, null, '湖北中储粮粮油质监中心', '主任兼总工/高级工程师');
INSERT INTO `expert_jobs` VALUES ('857', '309', null, null, '南京经济学院', '');
INSERT INTO `expert_jobs` VALUES ('858', '309', null, null, ' 中储粮成都粮食储藏科学研究所', '粮食储藏');
INSERT INTO `expert_jobs` VALUES ('859', '309', null, null, '国家粮食局建库办（借调）', '粮仓建设');
INSERT INTO `expert_jobs` VALUES ('860', '309', null, null, '中储粮成都粮食储藏科学研究所', '粮食储藏');
INSERT INTO `expert_jobs` VALUES ('861', '310', null, null, '郑州粮食学院学习', '学生');
INSERT INTO `expert_jobs` VALUES ('862', '310', null, null, '河南工业大学工作', '教授');
INSERT INTO `expert_jobs` VALUES ('863', '311', null, null, '辽宁省粮食科学研究所        鞍山油脂试验厂', '技术主管/助理工程师');
INSERT INTO `expert_jobs` VALUES ('864', '311', null, null, '辽宁省粮食科学研究所 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('865', '311', null, null, '辽宁省粮食科学研究所 ', '食品研究室副主任、主任；储藏/工程师');
INSERT INTO `expert_jobs` VALUES ('866', '311', null, null, '辽宁省粮食科学研究所 ', '总工程师；兼储藏研究室主任/高级工程师、教授研究员级高级工程师');
INSERT INTO `expert_jobs` VALUES ('867', '312', null, null, '中粮工程科技（郑州）有限公司', '副总经理/研究员');
INSERT INTO `expert_jobs` VALUES ('868', '313', null, null, '广东省粮油物资建设公司', '科员/助工');
INSERT INTO `expert_jobs` VALUES ('869', '313', null, null, '中央储备粮广东新沙港直属库', '主管、部长/工程师、高工');
INSERT INTO `expert_jobs` VALUES ('870', '313', null, null, '中央储备粮东莞油脂直属库', '科长/高工');
INSERT INTO `expert_jobs` VALUES ('871', '314', null, null, '中储粮成都粮食储藏科学研究所', '工程师');
INSERT INTO `expert_jobs` VALUES ('872', '314', null, null, ' ', '');
INSERT INTO `expert_jobs` VALUES ('873', '315', null, null, '中国科学技术协会', '');
INSERT INTO `expert_jobs` VALUES ('874', '315', null, null, '国家粮食储备局成都粮食储藏科学研究所', '');
INSERT INTO `expert_jobs` VALUES ('875', '315', null, null, '国家粮食储备局成都粮食储藏科学研究所', '副主任');
INSERT INTO `expert_jobs` VALUES ('876', '315', null, null, '国家粮食储备局成都粮食储藏科学研究所', '主任');
INSERT INTO `expert_jobs` VALUES ('877', '315', null, null, '国家粮食储备局成都粮食储藏科学研究所', '所长助理');
INSERT INTO `expert_jobs` VALUES ('878', '316', null, null, '南京无线电机箱二厂', '工人');
INSERT INTO `expert_jobs` VALUES ('879', '316', null, null, '南京工学院（东南大学） ', '学生');
INSERT INTO `expert_jobs` VALUES ('880', '316', null, null, '南京财经大学', '教师/讲师、副教授、教授');
INSERT INTO `expert_jobs` VALUES ('881', '317', null, null, '桓台县粮食局', '会计');
INSERT INTO `expert_jobs` VALUES ('882', '317', null, null, ' 桓台县粮食局劳动服务公司 ', '总经理');
INSERT INTO `expert_jobs` VALUES ('883', '317', null, null, '山东长江粮油仓储机械有限公司 ', '董事长');
INSERT INTO `expert_jobs` VALUES ('884', '317', null, null, '就读于中国人民大学', '工商管理专业');
INSERT INTO `expert_jobs` VALUES ('885', '318', null, null, '粮保器材厂', '购销员');
INSERT INTO `expert_jobs` VALUES ('886', '318', null, null, '台州市鑫良仓储器材有限公司 ', '总经理');
INSERT INTO `expert_jobs` VALUES ('887', '319', null, null, '河南工业大学粮油食品学院', '讲师');
INSERT INTO `expert_jobs` VALUES ('888', '319', null, null, '河南工业大学粮油食品学院', '副教授');
INSERT INTO `expert_jobs` VALUES ('889', '320', null, null, '商业部科学研究院', '机械研究室副主任/高级工程师');
INSERT INTO `expert_jobs` VALUES ('890', '320', null, null, '中谷中央储备粮管理公司 ', '仓储部经理/研究员级高级工程师');
INSERT INTO `expert_jobs` VALUES ('891', '320', null, null, '中谷集团科技总公司', '副总经理/研究员级高级工程师');
INSERT INTO `expert_jobs` VALUES ('892', '320', null, null, '中粮科学研究院', '综合业务部总经理/研究员级高级工程师');
INSERT INTO `expert_jobs` VALUES ('893', '320', null, null, '中粮营养健康研究院', '院长助理/研究员级高级工程师');
INSERT INTO `expert_jobs` VALUES ('894', '321', null, null, '国家粮食储备局成都粮食储藏科学研究所储藏工程中心', '副研究员');
INSERT INTO `expert_jobs` VALUES ('895', '321', null, null, '国家粮食储备局成都粮食储藏科学研究所储藏工程中心', '副主任');
INSERT INTO `expert_jobs` VALUES ('896', '321', null, null, '国家粮食储备局成都粮食储藏科学研究所储藏工程中心', '研究员');
INSERT INTO `expert_jobs` VALUES ('897', '321', null, null, '中储粮成都粮食储藏科学研究所研发中心', '研究员');
INSERT INTO `expert_jobs` VALUES ('898', '322', null, null, '南京化工大学学习', '');
INSERT INTO `expert_jobs` VALUES ('899', '322', null, null, '苏州苏净集团 ', '');
INSERT INTO `expert_jobs` VALUES ('900', '322', null, null, '广州市维通工业气体技术有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('901', '322', null, null, '华南理工大学学习', '');
INSERT INTO `expert_jobs` VALUES ('902', '323', null, null, '郑州粮食学院', '助教');
INSERT INTO `expert_jobs` VALUES ('903', '323', null, null, '郑州粮食学院', '讲师');
INSERT INTO `expert_jobs` VALUES ('904', '323', null, null, '郑州粮食学院、郑州工程学院 ', '副教授');
INSERT INTO `expert_jobs` VALUES ('905', '323', null, null, '河南工业大学', '教授');
INSERT INTO `expert_jobs` VALUES ('906', '324', null, null, '济南汽车制造总厂', '工程师');
INSERT INTO `expert_jobs` VALUES ('907', '324', null, null, '河南工业大学', '教师/副教授、教授');
INSERT INTO `expert_jobs` VALUES ('908', '325', null, null, '国家粮食局科学研究院', '副研究员');
INSERT INTO `expert_jobs` VALUES ('909', '326', null, null, '武汉工业大学', '学生');
INSERT INTO `expert_jobs` VALUES ('910', '326', null, null, '黑龙江粮食学校 ', '教师');
INSERT INTO `expert_jobs` VALUES ('911', '326', null, null, '黑龙江粮食职业学院', '实验室主任/副高');
INSERT INTO `expert_jobs` VALUES ('912', '327', null, null, '黑龙江省粮食科学研究所', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('913', '327', null, null, '黑龙江省粮食科学研究所', '工程师');
INSERT INTO `expert_jobs` VALUES ('914', '327', null, null, '黑龙江省粮食科学研究所', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('915', '327', null, null, '黑龙江省粮食科学研究所', '享受研究员待遇高级工程师');
INSERT INTO `expert_jobs` VALUES ('916', '328', null, null, '郑州粮食学院粮油储藏系', '学生');
INSERT INTO `expert_jobs` VALUES ('917', '328', null, null, '湖北省荆州粮食学校', '教师');
INSERT INTO `expert_jobs` VALUES ('918', '328', null, null, '武汉轻工大学食品学院', '教师');
INSERT INTO `expert_jobs` VALUES ('919', '329', null, null, '国内贸易部成都粮食储藏科学研究所', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('920', '329', null, null, '国家粮食储备局成都粮食储藏科学研究所', '工程师');
INSERT INTO `expert_jobs` VALUES ('921', '329', null, null, '中储粮成都粮食储藏科学研究所', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('922', '330', null, null, '中储粮成都粮食储藏科学研究所', '工程师');
INSERT INTO `expert_jobs` VALUES ('923', '330', null, null, '中储粮成都粮食储藏科学研究所', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('924', '330', null, null, '中储粮成都粮食储藏科学研究所', '副主任/高级工程师');
INSERT INTO `expert_jobs` VALUES ('925', '330', null, null, '中储粮成都粮食储藏科学研究所', '工程总监/高级工程师');
INSERT INTO `expert_jobs` VALUES ('926', '331', null, null, '国家粮食储备局成都粮食储藏科学研究所', '');
INSERT INTO `expert_jobs` VALUES ('927', '331', null, null, '国家粮食储备局成都粮食储藏科学研究所', '副主任');
INSERT INTO `expert_jobs` VALUES ('928', '331', null, null, '国家粮食储备局成都粮食储藏科学研究所', '所长助理');
INSERT INTO `expert_jobs` VALUES ('929', '331', null, null, '国家粮食储备局成都粮食储藏科学研究所', '副所长');
INSERT INTO `expert_jobs` VALUES ('930', '331', null, null, '中储粮成都粮食储藏科学研究所', '所长兼党委书记');
INSERT INTO `expert_jobs` VALUES ('931', '332', null, null, '广东省粮食科学研究所', '——');
INSERT INTO `expert_jobs` VALUES ('932', '332', null, null, '广东省粮食科学研究所', '科室副主任、工程师');
INSERT INTO `expert_jobs` VALUES ('933', '332', null, null, '德庆县', '科技副县长');
INSERT INTO `expert_jobs` VALUES ('934', '332', null, null, '广东省粮食科学研究所', '所长、教授级高工');
INSERT INTO `expert_jobs` VALUES ('935', '332', null, null, '广东省粮食质量安全中心', '主任');
INSERT INTO `expert_jobs` VALUES ('936', '333', null, null, '浙江广华装饰工程有限公司', '经理');
INSERT INTO `expert_jobs` VALUES ('937', '333', null, null, '金华金匠建材科技有限公司 ', '总经理');
INSERT INTO `expert_jobs` VALUES ('938', '334', null, null, '中储粮成都粮食储藏科学研究所', '信息中心主任/研究员');
INSERT INTO `expert_jobs` VALUES ('939', '334', null, null, ' ', '');
INSERT INTO `expert_jobs` VALUES ('940', '335', null, null, '国家粮食储备局成都粮食储藏科学研究所', '');
INSERT INTO `expert_jobs` VALUES ('941', '335', null, null, '国家粮食储备局成都粮食储藏科学研究所', '副主任/助理研究员');
INSERT INTO `expert_jobs` VALUES ('942', '335', null, null, '国家粮食储备局成都粮食储藏科学研究所', '主任/副研究员');
INSERT INTO `expert_jobs` VALUES ('943', '335', null, null, '中储粮成都粮食储藏科学研究所', '主任/研究员');
INSERT INTO `expert_jobs` VALUES ('944', '336', null, null, '河南工业大学', '副教授');
INSERT INTO `expert_jobs` VALUES ('945', '336', null, null, '美国堪萨斯州立大学谷物科学系', '访问学者');
INSERT INTO `expert_jobs` VALUES ('946', '337', null, null, '国家粮食储备局成都粮食储藏科学研究所', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('947', '337', null, null, '国家粮食储备局成都粮食储藏科学研究所', '助理研究员');
INSERT INTO `expert_jobs` VALUES ('948', '337', null, null, '中储粮成都粮食储藏科学研究所', '副主任/助理研究员');
INSERT INTO `expert_jobs` VALUES ('949', '338', null, null, '南京财经大学', '副院长/副教授');
INSERT INTO `expert_jobs` VALUES ('950', '338', null, null, ' ', '');
INSERT INTO `expert_jobs` VALUES ('951', '339', null, null, '华中农业大学', '讲师');
INSERT INTO `expert_jobs` VALUES ('952', '339', null, null, '华中农业大学', '副教授');
INSERT INTO `expert_jobs` VALUES ('953', '339', null, null, '华中农业大学', '教授、博士生导师');
INSERT INTO `expert_jobs` VALUES ('954', '339', null, null, '美国佛罗里达大学', '高级访问学者');
INSERT INTO `expert_jobs` VALUES ('955', '339', null, null, '美国密西根州立大学', '高级访问学者');
INSERT INTO `expert_jobs` VALUES ('956', '340', null, null, '广东省粮食科学研究所', '副所长');
INSERT INTO `expert_jobs` VALUES ('957', '340', null, null, ' ', '');
INSERT INTO `expert_jobs` VALUES ('958', '341', null, null, '郑州粮食学院', '助教/讲师');
INSERT INTO `expert_jobs` VALUES ('959', '341', null, null, '郑州工程学院', '副教授');
INSERT INTO `expert_jobs` VALUES ('960', '341', null, null, '河南省安阳市粮食局', '副局长');
INSERT INTO `expert_jobs` VALUES ('961', '341', null, null, '河南工业大学', '教授');
INSERT INTO `expert_jobs` VALUES ('962', '341', null, null, '国家粮食局科学研究院', '首席科学家/教授');
INSERT INTO `expert_jobs` VALUES ('963', '342', null, null, '广东省粮食科学研究所', '工程师/研究室副主任');
INSERT INTO `expert_jobs` VALUES ('964', '342', null, null, '广东省粮食科学研究所', '高级工程师/研究室主任');
INSERT INTO `expert_jobs` VALUES ('965', '342', null, null, '广东省粮食科学研究所', '教授级高级工程师/技术委员会主任、研究室主任');
INSERT INTO `expert_jobs` VALUES ('966', '343', '2013-07-31', null, '国家粮食局科学研究院', '副研究员');
INSERT INTO `expert_jobs` VALUES ('967', '343', '2000-06-30', '2013-06-30', '军事医学科学院', '助理研究员');
INSERT INTO `expert_jobs` VALUES ('968', '343', '1995-06-30', '1997-06-30', '广东省揭阳市农科所', '助理农艺师');
INSERT INTO `expert_jobs` VALUES ('969', '344', null, null, '农业部植物检疫实验所', '实习研究员');
INSERT INTO `expert_jobs` VALUES ('970', '344', null, null, '农业部植物检疫实验所 ', '助理研究员');
INSERT INTO `expert_jobs` VALUES ('971', '344', null, null, '国家出入境检验检疫局动植物检疫实验所', '室主任，副研究员');
INSERT INTO `expert_jobs` VALUES ('972', '344', null, null, '中国检验检疫科学研究院检测技术与装备研究所', '副所长，研究员');
INSERT INTO `expert_jobs` VALUES ('973', '345', null, null, '郑州粮食学院', '学习');
INSERT INTO `expert_jobs` VALUES ('974', '345', null, null, '郑州粮食学院 ', '助教、讲师');
INSERT INTO `expert_jobs` VALUES ('975', '345', null, null, '郑州工程学院', '室主任/副教授');
INSERT INTO `expert_jobs` VALUES ('976', '345', null, null, '河南工业大学', '系副主任/教授');
INSERT INTO `expert_jobs` VALUES ('977', '346', null, null, '郑州粮食学院', '助教');
INSERT INTO `expert_jobs` VALUES ('978', '346', null, null, ' 郑州粮食学院', '讲师');
INSERT INTO `expert_jobs` VALUES ('979', '346', null, null, '郑州粮食学院', '副教授');
INSERT INTO `expert_jobs` VALUES ('980', '346', null, null, '河南工业大学', '教授');
INSERT INTO `expert_jobs` VALUES ('981', '347', null, null, '中国农业大学学习', '学生');
INSERT INTO `expert_jobs` VALUES ('982', '347', null, null, '青海大学任教', '副教授');
INSERT INTO `expert_jobs` VALUES ('983', '347', null, null, '陕西师范大学学习', '');
INSERT INTO `expert_jobs` VALUES ('984', '347', null, null, '武汉轻工大学任教', '教授');
INSERT INTO `expert_jobs` VALUES ('985', '348', null, null, '北京师范大学生物系就读', '');
INSERT INTO `expert_jobs` VALUES ('986', '348', null, null, '湖南省粮油科学研究设计院', '现任所长/高级工程师');
INSERT INTO `expert_jobs` VALUES ('987', '349', null, null, '郑州工程学院', '副教授');
INSERT INTO `expert_jobs` VALUES ('988', '349', null, null, '浙江大学应用昆虫研究所', '在职博士后');
INSERT INTO `expert_jobs` VALUES ('989', '349', null, null, '美国堪萨斯州立大学', '访问学者');
INSERT INTO `expert_jobs` VALUES ('990', '350', null, null, '成都储藏所中试基地', '副主任、主任/副研究员');
INSERT INTO `expert_jobs` VALUES ('991', '350', null, null, '成都储藏所防治中心 ', '主任/副研究员');
INSERT INTO `expert_jobs` VALUES ('992', '350', null, null, '成都储藏所综合部', '主任/副研究员');
INSERT INTO `expert_jobs` VALUES ('993', '350', null, null, '成都储藏所运营部', '主任/副研究员');
INSERT INTO `expert_jobs` VALUES ('994', '351', null, null, '四川省达州市粮食局', '党组成员、机关党委书记');
INSERT INTO `expert_jobs` VALUES ('995', '351', null, null, '四川省粮食局', '副处长、调研员');
INSERT INTO `expert_jobs` VALUES ('996', '351', null, null, '四川省粮油中心监测站', '代站长');
INSERT INTO `expert_jobs` VALUES ('997', '352', '1993-06-30', '1997-11-30', '成都储藏所防治中心', '研究实习员');
INSERT INTO `expert_jobs` VALUES ('998', '352', '1997-12-31', '2001-11-30', '成都储藏所质检中心', '助理研究员');
INSERT INTO `expert_jobs` VALUES ('999', '352', '2001-12-31', '2014-09-30', '成都储藏所质检中心', '副研究员');
INSERT INTO `expert_jobs` VALUES ('1000', '352', '2014-09-30', null, '中储粮总公司质检中心', '副研／总工');
INSERT INTO `expert_jobs` VALUES ('1001', '353', null, null, '中储粮成都粮食储藏科学研究所', '检测中心副主任/助理研究员');
INSERT INTO `expert_jobs` VALUES ('1002', '354', null, null, '中储粮镇江粮油质检中心 ', '经理');
INSERT INTO `expert_jobs` VALUES ('1003', '354', null, null, '中储粮镇江粮油有限公司 ', '经理');
INSERT INTO `expert_jobs` VALUES ('1004', '354', null, null, '中盛粮油镇江有限公司', '主管');
INSERT INTO `expert_jobs` VALUES ('1005', '354', null, null, '镇江市金香花集团', '车间主任');
INSERT INTO `expert_jobs` VALUES ('1006', '355', null, null, '郑州粮食学院', '学生');
INSERT INTO `expert_jobs` VALUES ('1007', '355', null, null, '郑州粮食学院、郑州工程学院、河南工业大学 ', '教师/讲师、副教授、教授');
INSERT INTO `expert_jobs` VALUES ('1008', '355', null, null, '无锡轻工大学', '攻读在职硕士');
INSERT INTO `expert_jobs` VALUES ('1009', '356', null, null, '中国食品发酵研究院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('1010', '356', null, null, '中国农业大学 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('1011', '356', null, null, '中粮营养健康研究院', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('1012', '357', null, null, '成都粮食储藏科学研究所分析测试中心', '化验员');
INSERT INTO `expert_jobs` VALUES ('1013', '357', null, null, '成都粮食储藏科学研究所仪器开发中心', '技术负责人');
INSERT INTO `expert_jobs` VALUES ('1014', '357', null, null, '四川省粮油中心监测站', '站长助理');
INSERT INTO `expert_jobs` VALUES ('1015', '357', null, null, '四川省粮油中心监测站', '副站长');
INSERT INTO `expert_jobs` VALUES ('1016', '358', null, null, '中国石化石油化工科学研究院', '博士后');
INSERT INTO `expert_jobs` VALUES ('1017', '358', null, null, '瑞典Karlstad大学 ', '博士后');
INSERT INTO `expert_jobs` VALUES ('1018', '358', null, null, '中国石化石油化工科学研究院', '色谱组组长、高级工程师');
INSERT INTO `expert_jobs` VALUES ('1019', '358', null, null, '中粮营养健康研究院', '色谱-质谱组组长，高级工程师,中心技术总监');
INSERT INTO `expert_jobs` VALUES ('1020', '358', null, null, '中粮营养健康研究院', '分析检测副总工程师');
INSERT INTO `expert_jobs` VALUES ('1021', '359', null, null, '东北农业大学食品学院 食品科学与工程专业  大学本科 学士', '学生');
INSERT INTO `expert_jobs` VALUES ('1022', '359', null, null, '东北农业学食品学院 食品加工与安全专业  研究生 硕士', '学生');
INSERT INTO `expert_jobs` VALUES ('1023', '359', null, null, '黑龙江省粮食学校粮油储检教研室       ', '教师');
INSERT INTO `expert_jobs` VALUES ('1024', '359', null, null, '黑龙江广播电视大学（黑龙江粮食职业学院）粮油工程系          ', '教研室主任     副教授');
INSERT INTO `expert_jobs` VALUES ('1025', '360', null, null, '成都粮食储藏科学研究所', '职员');
INSERT INTO `expert_jobs` VALUES ('1026', '360', null, null, ' ', '');
INSERT INTO `expert_jobs` VALUES ('1027', '361', null, null, '国家粮食储备局成都粮食储藏科学研究所', '质量负责人');
INSERT INTO `expert_jobs` VALUES ('1028', '361', null, null, ' 成都中储粮粮油质监有限公司', ' 检验科科长/技术负责人');
INSERT INTO `expert_jobs` VALUES ('1029', '362', null, null, '中储粮成都储藏科学研究所', '副主任/高级工程师');
INSERT INTO `expert_jobs` VALUES ('1030', '362', null, null, ' ', '');
INSERT INTO `expert_jobs` VALUES ('1031', '363', null, null, '辽宁省粮油检验监测所', '副所长/高工');
INSERT INTO `expert_jobs` VALUES ('1032', '363', null, null, '辽宁省粮食科学研究所', '所长/正高');
INSERT INTO `expert_jobs` VALUES ('1033', '364', null, null, '南京粮食经济学院学习', '');
INSERT INTO `expert_jobs` VALUES ('1034', '364', null, null, '南京财经大学（原南京粮食经济学院）', '讲师、副教授、教授');
INSERT INTO `expert_jobs` VALUES ('1035', '364', '1987-03-18', null, '南京大学进修', '');
INSERT INTO `expert_jobs` VALUES ('1036', '364', '1993-03-11', null, '南京化工大学高校教师研究生班进修', '');
INSERT INTO `expert_jobs` VALUES ('1037', '365', null, null, '虎林县面粉厂化验室', '化验员/初级');
INSERT INTO `expert_jobs` VALUES ('1038', '365', null, null, '虎林县宝东粮库化验室 ', '化验员/中级');
INSERT INTO `expert_jobs` VALUES ('1039', '365', null, null, '黑龙江粮食职业学院', '教师/副教授');
INSERT INTO `expert_jobs` VALUES ('1040', '366', null, null, '中国石化石油化工科学研究院', '分析研究室结构分析组组长');
INSERT INTO `expert_jobs` VALUES ('1041', '366', null, null, '中粮营养健康研究院 ', '食品质量与安全中心主任');
INSERT INTO `expert_jobs` VALUES ('1042', '367', null, null, '浙江广华装饰工程有限公司', '经理');
INSERT INTO `expert_jobs` VALUES ('1043', '367', null, null, '金华金匠建材科技有限公司 ', '总经理');
INSERT INTO `expert_jobs` VALUES ('1044', '368', null, null, '广东省粮食科学研究所', '工程师/研究室副主任');
INSERT INTO `expert_jobs` VALUES ('1045', '368', null, null, '广东省粮食科学研究所', '高级工程师/研究室主任');
INSERT INTO `expert_jobs` VALUES ('1046', '368', null, null, '广东省粮食科学研究所', '教授级高级工程师/技术委员会主任、研究室主任');
INSERT INTO `expert_jobs` VALUES ('1047', '369', '1993-06-30', '1997-11-30', '成都储藏所防治中心', '研究实习员');
INSERT INTO `expert_jobs` VALUES ('1048', '369', '1997-12-31', '2001-11-30', '成都储藏所质检中心', '助理研究员');
INSERT INTO `expert_jobs` VALUES ('1049', '369', '2001-12-31', '2014-09-30', '成都储藏所质检中心', '副研究员');
INSERT INTO `expert_jobs` VALUES ('1050', '369', '2014-09-30', null, '中储粮总公司质检中心', '副研／总工');
INSERT INTO `expert_jobs` VALUES ('1051', '370', null, null, '浙江广华装饰工程有限公司', '经理');
INSERT INTO `expert_jobs` VALUES ('1052', '370', null, null, '金华金匠建材科技有限公司 ', '总经理');
INSERT INTO `expert_jobs` VALUES ('1053', '371', null, null, '广东省粮食科学研究所', '工程师/研究室副主任');
INSERT INTO `expert_jobs` VALUES ('1054', '371', null, null, '广东省粮食科学研究所', '高级工程师/研究室主任');
INSERT INTO `expert_jobs` VALUES ('1055', '371', null, null, '广东省粮食科学研究所', '教授级高级工程师/技术委员会主任、研究室主任');
INSERT INTO `expert_jobs` VALUES ('1056', '372', '1993-06-30', '1997-11-30', '成都储藏所防治中心', '研究实习员');
INSERT INTO `expert_jobs` VALUES ('1057', '372', '1997-12-31', '2001-11-30', '成都储藏所质检中心', '助理研究员');
INSERT INTO `expert_jobs` VALUES ('1058', '372', '2001-12-31', '2014-09-30', '成都储藏所质检中心', '副研究员');
INSERT INTO `expert_jobs` VALUES ('1059', '372', '2014-09-30', null, '中储粮总公司质检中心', '副研／总工');
INSERT INTO `expert_jobs` VALUES ('1060', '373', null, null, '浙江广华装饰工程有限公司', '经理');
INSERT INTO `expert_jobs` VALUES ('1061', '373', null, null, '金华金匠建材科技有限公司 ', '总经理');
INSERT INTO `expert_jobs` VALUES ('1062', '374', null, null, '广东省粮食科学研究所', '工程师/研究室副主任');
INSERT INTO `expert_jobs` VALUES ('1063', '374', null, null, '广东省粮食科学研究所', '高级工程师/研究室主任');
INSERT INTO `expert_jobs` VALUES ('1064', '374', null, null, '广东省粮食科学研究所', '教授级高级工程师/技术委员会主任、研究室主任');
INSERT INTO `expert_jobs` VALUES ('1065', '375', '1993-06-30', '1997-11-30', '成都储藏所防治中心', '研究实习员');
INSERT INTO `expert_jobs` VALUES ('1066', '375', '1997-12-31', '2001-11-30', '成都储藏所质检中心', '助理研究员');
INSERT INTO `expert_jobs` VALUES ('1067', '375', '2001-12-31', '2014-09-30', '成都储藏所质检中心', '副研究员');
INSERT INTO `expert_jobs` VALUES ('1068', '375', '2014-09-30', null, '中储粮总公司质检中心', '副研／总工');
INSERT INTO `expert_jobs` VALUES ('1069', '376', null, null, '浙江广华装饰工程有限公司', '经理');
INSERT INTO `expert_jobs` VALUES ('1070', '376', null, null, '金华金匠建材科技有限公司 ', '总经理');
INSERT INTO `expert_jobs` VALUES ('1071', '377', null, null, '广东省粮食科学研究所', '工程师/研究室副主任');
INSERT INTO `expert_jobs` VALUES ('1072', '377', null, null, '广东省粮食科学研究所', '高级工程师/研究室主任');
INSERT INTO `expert_jobs` VALUES ('1073', '377', null, null, '广东省粮食科学研究所', '教授级高级工程师/技术委员会主任、研究室主任');
INSERT INTO `expert_jobs` VALUES ('1074', '378', '1993-06-30', '1997-11-30', '成都储藏所防治中心', '研究实习员');
INSERT INTO `expert_jobs` VALUES ('1075', '378', '1997-12-31', '2001-11-30', '成都储藏所质检中心', '助理研究员');
INSERT INTO `expert_jobs` VALUES ('1076', '378', '2001-12-31', '2014-09-30', '成都储藏所质检中心', '副研究员');
INSERT INTO `expert_jobs` VALUES ('1077', '378', '2014-09-30', null, '中储粮总公司质检中心', '副研／总工');
INSERT INTO `expert_jobs` VALUES ('1078', '379', null, null, '浙江广华装饰工程有限公司', '经理');
INSERT INTO `expert_jobs` VALUES ('1079', '379', null, null, '金华金匠建材科技有限公司 ', '总经理');
INSERT INTO `expert_jobs` VALUES ('1080', '380', null, null, '广东省粮食科学研究所', '工程师/研究室副主任');
INSERT INTO `expert_jobs` VALUES ('1081', '380', null, null, '广东省粮食科学研究所', '高级工程师/研究室主任');
INSERT INTO `expert_jobs` VALUES ('1082', '380', null, null, '广东省粮食科学研究所', '教授级高级工程师/技术委员会主任、研究室主任');
INSERT INTO `expert_jobs` VALUES ('1083', '381', '1993-06-30', '1997-11-30', '成都储藏所防治中心', '研究实习员');
INSERT INTO `expert_jobs` VALUES ('1084', '381', '1997-12-31', '2001-11-30', '成都储藏所质检中心', '助理研究员');
INSERT INTO `expert_jobs` VALUES ('1085', '381', '2001-12-31', '2014-09-30', '成都储藏所质检中心', '副研究员');
INSERT INTO `expert_jobs` VALUES ('1086', '381', '2014-09-30', null, '中储粮总公司质检中心', '副研／总工');
INSERT INTO `expert_jobs` VALUES ('1087', '382', null, null, '丰益（上海）生物技术研发中心有限公司', '部门经理 / 高级研究员');
INSERT INTO `expert_jobs` VALUES ('1088', '382', null, null, '诺维信（中国）投资有限公司 ', '高级应用工程师');
INSERT INTO `expert_jobs` VALUES ('1089', '382', null, null, '丹尼斯克（中国）有限公司\n（隶属杜邦集团）', '应用专家');
INSERT INTO `expert_jobs` VALUES ('1090', '382', null, null, '百事食品（中国）有限公司北京分公司', '研发副经理');
INSERT INTO `expert_jobs` VALUES ('1091', '382', null, null, '中粮秦皇岛鹏泰有限公司', '主任工程师');
INSERT INTO `expert_jobs` VALUES ('1092', '383', null, null, '漳州长泰食品总厂饮料车间车间', '付主任');
INSERT INTO `expert_jobs` VALUES ('1093', '383', null, null, '厦门华顺食品工业有限公司车间主任', '主任');
INSERT INTO `expert_jobs` VALUES ('1094', '383', null, null, '无锡华顺食品有限公司厂长', '厂长');
INSERT INTO `expert_jobs` VALUES ('1095', '383', null, null, '合肥顶点食品有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('1096', '383', null, null, '郑州三全食品股份有限公司', '研发经理');
INSERT INTO `expert_jobs` VALUES ('1097', '384', null, null, '浙江恒天控股集团有限公司', '副总经理');
INSERT INTO `expert_jobs` VALUES ('1098', '384', null, null, ' ', '');
INSERT INTO `expert_jobs` VALUES ('1099', '385', null, null, '华中农业大学食品学院', '讲师');
INSERT INTO `expert_jobs` VALUES ('1100', '385', null, null, '上海交通大学农业与生物学院', '副教授、教授');
INSERT INTO `expert_jobs` VALUES ('1101', '386', null, null, '中国农业大学食品学院', '讲师-副教授');
INSERT INTO `expert_jobs` VALUES ('1102', '386', null, null, '中国农业大学食品学院', '教授');
INSERT INTO `expert_jobs` VALUES ('1103', '386', null, null, '中国农业大学食品学院', '副院长/教授');
INSERT INTO `expert_jobs` VALUES ('1104', '387', null, null, '郑州粮食学院机械系', '教师/讲师');
INSERT INTO `expert_jobs` VALUES ('1105', '387', null, null, '华中科技大学机一系', '读研');
INSERT INTO `expert_jobs` VALUES ('1106', '387', null, null, '郑州粮食学院、河南工业大学', '校科技处处长、科研所所长/教授');
INSERT INTO `expert_jobs` VALUES ('1107', '387', null, null, '河南工业大学', '所长/教授');
INSERT INTO `expert_jobs` VALUES ('1108', '388', null, null, '河南兴泰科技实业有限公司', '总经理');
INSERT INTO `expert_jobs` VALUES ('1109', '388', null, null, '河南省主食产业技术创新战略联盟 ', '秘书长');
INSERT INTO `expert_jobs` VALUES ('1110', '388', null, null, '面制食品国家地方联合工程研究中心', '副主任');
INSERT INTO `expert_jobs` VALUES ('1111', '389', null, null, '武汉粮食工业学院', '本科学习');
INSERT INTO `expert_jobs` VALUES ('1112', '389', null, null, '郑州粮食学院 ', '硕士研究生学习');
INSERT INTO `expert_jobs` VALUES ('1113', '389', null, null, '江南大学', '博士研究生学习');
INSERT INTO `expert_jobs` VALUES ('1114', '389', null, null, '武汉轻工大学食品学院', '副院长/教授');
INSERT INTO `expert_jobs` VALUES ('1115', '390', null, null, '成都锦江宾馆', '面点师');
INSERT INTO `expert_jobs` VALUES ('1116', '390', null, null, '宜昌市商业学校', '教师');
INSERT INTO `expert_jobs` VALUES ('1117', '390', null, null, ' 安琪酵母股份有限公司', '技术总监');
INSERT INTO `expert_jobs` VALUES ('1118', '390', null, null, '宜昌中式面点师职业技能鉴定基地', '考评员');
INSERT INTO `expert_jobs` VALUES ('1119', '391', null, null, '就读于杭州商学院食品工程', '');
INSERT INTO `expert_jobs` VALUES ('1120', '391', null, null, '宜昌食用酵母基地添加剂车间工作', '');
INSERT INTO `expert_jobs` VALUES ('1121', '391', null, null, '安琪酵母股份有限公司', '');
INSERT INTO `expert_jobs` VALUES ('1122', '392', null, null, '河南兴泰科技实业有限公司', '董事长');
INSERT INTO `expert_jobs` VALUES ('1123', '392', null, null, '面制食品国家地方联合工程研究中心 ', '主任');
INSERT INTO `expert_jobs` VALUES ('1124', '392', null, null, '河南省人民政府发展研究中心', '特约研究员');
INSERT INTO `expert_jobs` VALUES ('1125', '392', null, null, '河南省主食产业技术创新战略联盟', '理事长');
INSERT INTO `expert_jobs` VALUES ('1126', '393', null, null, '武汉粮食工业学院', '教师/讲师');
INSERT INTO `expert_jobs` VALUES ('1127', '393', null, null, '郑州粮食学院', '研究生');
INSERT INTO `expert_jobs` VALUES ('1128', '393', null, null, '郑州粮食学院  食品系、科研所', '室主任/高级工程师');
INSERT INTO `expert_jobs` VALUES ('1129', '393', null, null, '河南工业大学（郑州工程学院）', '实验中心主任/教授');
INSERT INTO `expert_jobs` VALUES ('1130', '394', null, null, '国家粮食局科学研究院', '工程师');
INSERT INTO `expert_jobs` VALUES ('1131', '394', null, null, '国家粮食局科学研究院', '副研究员');
INSERT INTO `expert_jobs` VALUES ('1132', '394', null, null, '国家粮食局科学研究院', '研究员');
INSERT INTO `expert_jobs` VALUES ('1133', '395', null, null, '河北省廊坊市廊雪面粉有限责任公司', '研发员');
INSERT INTO `expert_jobs` VALUES ('1134', '395', null, null, '北京市古船食品有限责任公司 ', '专用粉研发主管');
INSERT INTO `expert_jobs` VALUES ('1135', '395', null, null, '北京市稻香村食品有限公司', '技研部主任、传统食品研发中心副主任、创新工作室主任');
INSERT INTO `expert_jobs` VALUES ('1136', '396', null, null, '华中农业大学', '本科学习');
INSERT INTO `expert_jobs` VALUES ('1137', '396', null, null, '中南财经政法大学', '在职MBA学习');
INSERT INTO `expert_jobs` VALUES ('1138', '396', null, null, '中国粮油学会发酵面食分会', '副会长兼秘书长');
INSERT INTO `expert_jobs` VALUES ('1139', '396', null, null, '安琪酵母股份有限公司', '酵母营销中心总经理/高级工程师');
INSERT INTO `expert_jobs` VALUES ('1140', '397', null, null, '华中农业大学', '助教');
INSERT INTO `expert_jobs` VALUES ('1141', '397', null, null, '华中农业大学 ', '讲师');
INSERT INTO `expert_jobs` VALUES ('1142', '397', null, null, '华中农业大学', '副教授');
INSERT INTO `expert_jobs` VALUES ('1143', '397', null, null, '华中农业大学', '教授');
INSERT INTO `expert_jobs` VALUES ('1144', '398', null, null, '黑龙江省农科院育种所品质分析室', '副主任  高级实验师');
INSERT INTO `expert_jobs` VALUES ('1145', '398', null, null, '黑龙江省农科院谷物品质研究中心/农业部谷物及制品质量监督检验测试中心（哈尔滨） ', '副主任/副主任兼质量保证人');
INSERT INTO `expert_jobs` VALUES ('1146', '398', null, null, '黑龙江省农科院农产品质量安全研究所/农业部农产品质量安全风险评估研究室（哈尔滨）/农业部谷物及制品质量监督检验测试中心（哈尔滨）', '所长/主任/常务副主任');
INSERT INTO `expert_jobs` VALUES ('1147', '399', null, null, '西北农林科技大学', '助教');
INSERT INTO `expert_jobs` VALUES ('1148', '399', null, null, '西北农林科技大学', '讲师');
INSERT INTO `expert_jobs` VALUES ('1149', '399', null, null, '西北农林科技大学', '副教授');
INSERT INTO `expert_jobs` VALUES ('1150', '399', null, null, '陕西师范大学', '副教授');
INSERT INTO `expert_jobs` VALUES ('1151', '399', null, null, '陕西师范大学', '教授');
INSERT INTO `expert_jobs` VALUES ('1152', '400', null, null, '金川集团公司', '干部/工程师');
INSERT INTO `expert_jobs` VALUES ('1153', '400', null, null, '中国粮油学会', '编辑/高级工程师');
INSERT INTO `expert_jobs` VALUES ('1154', null, null, null, 'Guelph Food Research Centre, ON, Canada', 'Research Associate');
INSERT INTO `expert_jobs` VALUES ('1155', null, null, null, '中国农业大学 ', '副教授');
INSERT INTO `expert_jobs` VALUES ('1156', null, null, null, 'Guelph Food Research Centre, ON, Canada', 'Research Associate');
INSERT INTO `expert_jobs` VALUES ('1157', null, null, null, '中国农业大学 ', '副教授');
INSERT INTO `expert_jobs` VALUES ('1158', null, null, null, 'Guelph Food Research Centre, ON, Canada', 'Research Associate');
INSERT INTO `expert_jobs` VALUES ('1159', null, null, null, '中国农业大学 ', '副教授');
INSERT INTO `expert_jobs` VALUES ('1160', null, null, null, 'Guelph Food Research Centre, ON, Canada', 'Research Associate');
INSERT INTO `expert_jobs` VALUES ('1161', null, null, null, '中国农业大学 ', '副教授');
INSERT INTO `expert_jobs` VALUES ('1162', '401', null, null, '', '');
INSERT INTO `expert_jobs` VALUES ('1163', '54', '2016-02-02', '2016-02-12', '工作或学习单位', '职务/职称');
INSERT INTO `expert_jobs` VALUES ('1165', '54', '2016-02-10', '2016-03-03', '工作或学习单位1', '职务/职称1');
INSERT INTO `expert_jobs` VALUES ('1167', '54', '2016-01-31', '2016-02-26', '工作或学习单位3', '职务/职称3');
INSERT INTO `expert_jobs` VALUES ('1168', '402', null, null, '', '');
INSERT INTO `expert_jobs` VALUES ('1169', '403', '1986-06-30', '1991-09-30', '国家粮食储备局郑州科学研究设计院 ', '助理工程师');
INSERT INTO `expert_jobs` VALUES ('1170', '403', '1991-10-31', '1999-10-31', '国家粮食储备局郑州科学研究设计院 ', '工程师');
INSERT INTO `expert_jobs` VALUES ('1171', '403', '1999-11-30', '2004-10-31', '国家粮食储备局郑州科学研究设计院 ', '高级工程师');
INSERT INTO `expert_jobs` VALUES ('1172', '403', '2004-11-30', '2014-04-30', '国家粮食储备局郑州科学研究设计院 ', '副院长/研究员');
INSERT INTO `expert_jobs` VALUES ('1173', '403', '2014-04-30', '2015-12-31', '中粮工程科技（郑州）有限公司（原名国家粮食储备局郑州科学研究设计院）', '副总经理/研究员');

-- ----------------------------
-- Table structure for `expert_results`
-- ----------------------------
DROP TABLE IF EXISTS `expert_results`;
CREATE TABLE `expert_results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ExpertID` int(11) DEFAULT NULL COMMENT '专家编号',
  `StartTime` date DEFAULT NULL COMMENT '起时间',
  `EndTime` date DEFAULT NULL COMMENT '止时间',
  `JobName` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '技术工作名称',
  `Role` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '担任角色',
  `Results` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '成果水平',
  `Situation` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '完成情况',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=969 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of expert_results
-- ----------------------------
INSERT INTO `expert_results` VALUES ('52', '53', '2015-12-09', '2015-12-09', '', '', '', '');
INSERT INTO `expert_results` VALUES ('53', '54', '2015-12-28', '2016-01-27', '', '', '', '完成情况');
INSERT INTO `expert_results` VALUES ('54', '56', '2006-10-01', '2008-06-30', '粮油食品中赭曲霉毒素A高效液相色谱检测方法的研究', '主持', '国内领先', '中国粮油学会科学技术奖二等奖');
INSERT INTO `expert_results` VALUES ('55', '56', '2009-04-01', '2010-02-01', '《食品中酸（碱）性橙、苏丹红有害色素检测方法的研究》', '主持', '一般', '');
INSERT INTO `expert_results` VALUES ('56', '56', '2013-10-01', '2015-12-01', '《谷物及制品中脱氧雪腐镰刀菌烯醇及其衍生物测定方法的研究》', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('62', '57', '2009-01-01', '2011-12-01', '国家科技支撑计划：储备公益行业专项：粮减损新技术研究与示范（2009BADA0B）', '项目执行人', '国内领先', '结题验收');
INSERT INTO `expert_results` VALUES ('63', '57', '2013-01-01', '2015-12-01', '粮食行业专项：粮食中真菌毒素脱除与卫生污染物监控技术研究（201313007）', '项目执行人', '国际领先', null);
INSERT INTO `expert_results` VALUES ('64', '57', '2015-01-01', '2017-12-01', '科技支撑计划：玉米及其加工副产物中ZEN和DON削减技术及示范（2015BAK43B00）', '项目负责人', '国际领先', null);
INSERT INTO `expert_results` VALUES ('65', '57', '2013-01-01', '2017-12-01', '“973”项目：主要粮油产品贮藏期真菌毒素形成机理及去除基础（2013CB127805）', '项目主要设计者和参加人', '国际领先', null);
INSERT INTO `expert_results` VALUES ('66', '57', '2012-01-01', '2015-12-01', '“863”项目：粮食产后生物性危害物快速检验监测技术（2012AA101609）', '子课题负责人', '国内领先', null);
INSERT INTO `expert_results` VALUES ('67', '55', '2013-10-01', '2017-10-01', '国家自然基金面上项目““小麦受蛀蚀性害虫侵害后品质变化机理及危害度预测研究” 31371852', '', '', '在研');
INSERT INTO `expert_results` VALUES ('68', '55', '2012-10-01', null, '863项目子课题“小麦储藏物流微环境多元参数优化与综合控制技术研究(2012AA101705-2)', '', '', '在研');
INSERT INTO `expert_results` VALUES ('69', '58', '2009-01-01', '2012-06-01', '氧化还原蛋白质的直接电化学及生物传感研究', '', '省厅级', '完成');
INSERT INTO `expert_results` VALUES ('70', '58', '2008-12-01', null, '基于氧化还原蛋白质直接电化学的生物传感器研究', '', '市局级', '');
INSERT INTO `expert_results` VALUES ('71', '59', '2007-03-01', '2009-03-01', '课题《佳木斯地区储粮害虫区系调查》黑龙江省教育厅应用研究项目', '主持', '一般水平', '');
INSERT INTO `expert_results` VALUES ('72', '59', '2012-12-01', null, '课题《粮食产业链高端技能型人才培养模式的研究》黑龙江省教育厅2012年黑龙江省高等教育教学改革项目', '参加', '一般水平', '');
INSERT INTO `expert_results` VALUES ('73', '60', '2006-01-01', '2013-01-01', '淀粉衍生化关键技术及产业化', '', '国际领先', '获山东省科技进步奖一等奖');
INSERT INTO `expert_results` VALUES ('74', '60', '2006-01-01', null, '高水溶性麦芽糖基β-环糊精的酶法合成及应用研究', '', '国际领先', '');
INSERT INTO `expert_results` VALUES ('75', '60', '2010-01-01', null, '高水溶性麦芽糖基β-环糊精的产业化关键技术', '', '国际先进', '');
INSERT INTO `expert_results` VALUES ('76', '100', null, '2018-12-01', '基于耗散粒子动力学的淀粉基胶黏剂失稳机制研究', '主持', '国内领先', '');
INSERT INTO `expert_results` VALUES ('77', '100', null, '2017-06-01', '基于代谢组学的菊苣多糖降脂机制及防治脂肪肝的研究', '参加，第二', '省部先进', '');
INSERT INTO `expert_results` VALUES ('78', '100', null, '2015-12-01', '基于核生长动力学的纳米硒-多糖复合物制备过程研究', '参加，第三', '国内领先', '');
INSERT INTO `expert_results` VALUES ('79', '102', '2011-01-01', '2016-01-08', '食物成分分析技术及标准', '主持', '国家标准', '在研');
INSERT INTO `expert_results` VALUES ('80', '102', '2012-01-01', '2015-01-01', '功能食品资源优化及评价共性技术', '课题负责人', '', null);
INSERT INTO `expert_results` VALUES ('81', '102', '2012-01-01', '2014-01-01', '控制微量营养素缺乏关键技术', '任务负责人', '', null);
INSERT INTO `expert_results` VALUES ('82', '102', '2014-01-01', '2016-01-08', '转基因食品营养与健康评价', '任务负责人', '', null);
INSERT INTO `expert_results` VALUES ('83', '109', '2012-01-01', '2013-12-01', '北京市重大科技项目“粮油原料中主要真菌毒素检测及控制技术研究及应用示范”', '', '国内领先', '荣获2014年度中国粮油学会科学技术进步二等奖');
INSERT INTO `expert_results` VALUES ('84', '111', '2011-01-01', '2013-01-01', '首都粮食应急保障关键技术研究与示范 ', '应急储备成品粮出入库技术及设备研发部分', '', null);
INSERT INTO `expert_results` VALUES ('85', '111', '2006-01-01', '2010-01-01', '储粮粮堆温度变化规律与温度传感器布置模型研究', '主要完成人', '中国粮油学会科学技术一等奖', null);
INSERT INTO `expert_results` VALUES ('86', '111', '2004-01-01', '2010-01-01', '国家粮食局标准质量中心信息系统建设', '主要完成人之一', '中国粮油学会科学技术三等奖', null);
INSERT INTO `expert_results` VALUES ('87', '113', '2011-01-01', '2013-01-01', '首都粮食应急保障关键技术研究与示范 ', '应急储备成品粮出入库技术及设备研发部分', '', null);
INSERT INTO `expert_results` VALUES ('88', '112', '2011-01-01', '2013-01-01', '首都粮食应急保障关键技术研究与示范 ', '应急储备成品粮出入库技术及设备研发部分', '', '');
INSERT INTO `expert_results` VALUES ('89', '113', '2006-01-01', '2010-01-01', '储粮粮堆温度变化规律与温度传感器布置模型研究', '主要完成人', '中国粮油学会科学技术一等奖', null);
INSERT INTO `expert_results` VALUES ('90', '113', '2004-01-01', '2010-01-01', '国家粮食局标准质量中心信息系统建设', '主要完成人之一', '中国粮油学会科学技术三等奖', null);
INSERT INTO `expert_results` VALUES ('91', '112', '2006-01-01', '2010-01-01', '储粮粮堆温度变化规律与温度传感器布置模型研究', '主要完成人', '中国粮油学会科学技术一等奖', '');
INSERT INTO `expert_results` VALUES ('92', '112', '2004-01-01', '2010-01-01', '国家粮食局标准质量中心信息系统建设', '主要完成人之一', '中国粮油学会科学技术三等奖', '');
INSERT INTO `expert_results` VALUES ('93', '114', '2007-01-01', '2010-01-01', '粮食宏观调控信息保障关键技术研究与示范', '参加', '国内领先', '十一五国家科技支撑计划重点项目');
INSERT INTO `expert_results` VALUES ('94', '114', '2008-01-01', '2011-12-01', '全球粮食遥感估产与增值服务示范应用项目', '主持', '国内领先', '国家卫星应用高技术产业化项目');
INSERT INTO `expert_results` VALUES ('95', '114', '2010-01-01', '2011-01-01', '大宗商品电子商务平台信息系统建设', '主持', '国内领先', '2010年度河南省软件和信息服务业典型解决方案');
INSERT INTO `expert_results` VALUES ('96', '114', '2011-01-01', '2012-01-01', '粮食全程电子商务及其精准信息服务技术研究开发与示范应用', '主持', '国内领先', '国家科技支撑');
INSERT INTO `expert_results` VALUES ('97', '114', '2011-01-01', '2014-01-01', '中储粮粮情测控远程监管平台', '主持', '国内领先', '中国粮油学会科技进步二等奖');
INSERT INTO `expert_results` VALUES ('98', '115', '2014-01-02', '2016-01-01', '智能化粮食储藏数量传感设备研发', '主持', '', '专利');
INSERT INTO `expert_results` VALUES ('99', '115', '2013-01-03', '2015-01-08', '粮食数量安全预警监控应急技术与装备', '参加', '', null);
INSERT INTO `expert_results` VALUES ('100', '115', '2013-01-03', '2015-01-22', '粮食储备数量监测技术及设备研究开发', '参加', '', null);
INSERT INTO `expert_results` VALUES ('101', '115', '2012-01-05', '2014-01-08', '粮棉仓储特征监测安全与质量管理关键技术及系统应用示范', '参加', '', null);
INSERT INTO `expert_results` VALUES ('102', '115', '2008-01-02', '2010-12-03', '粮食宏观调控信息采集与价格预测技术', '参加', '', null);
INSERT INTO `expert_results` VALUES ('103', '117', '1981-01-07', '2005-01-05', '合成法甘露醇', '第一负责人', '世界领先水平', '产量占世界60%技术领先');
INSERT INTO `expert_results` VALUES ('104', '117', '1997-01-24', '2003-01-15', '结晶山梨醇', '第一负责人', '国际先进水平', '产量世界领先');
INSERT INTO `expert_results` VALUES ('105', '117', '1981-01-14', '2014-01-15', '模拟流动床', '主要负责人', '国际先进水平', '国内市场领先');
INSERT INTO `expert_results` VALUES ('106', '119', '1995-01-11', '1997-01-09', 'GOLD ARROW项目', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('107', '119', '2004-01-08', '2005-01-06', '胶州海北粮南运项目', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('108', '119', '2002-01-02', '2015-01-14', '进口大豆全程物流服务项目', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('109', '119', '2009-12-30', '2015-01-28', '麻涌港进口粮食国家指定口岸码头', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('110', '121', '2013-01-01', '2015-12-01', '食用植物油适度和稳态化加工工艺研究与关键装备开发/201313012-03', '参加', '待鉴定', '进行中');
INSERT INTO `expert_results` VALUES ('111', '122', '2010-06-01', '2012-07-01', '高甾醇玉米油工业化生产技术研究及应用', '参加', '国际先进', '粮油学会一等奖、山东省二等奖、滨州市一等奖');
INSERT INTO `expert_results` VALUES ('112', '122', '2011-06-01', '2013-10-01', '高品质玉米油生产关键技术创新集成及产业化', '参加', '国际先进', '粮油学会一等奖、山东省二等奖、滨州市一等奖');
INSERT INTO `expert_results` VALUES ('113', '122', '2011-01-01', '2012-12-01', '零反式酸玉米油工业化生产技术研究及应用', '参加', '国际先进', '粮油学会一等奖、山东省二等奖、滨州市一等奖');
INSERT INTO `expert_results` VALUES ('114', '123', '2003-01-01', '2011-01-31', '猪饲料套餐研究', '主持', '国内领先', '专利8项，论文6篇');
INSERT INTO `expert_results` VALUES ('115', '123', '2012-01-01', '2016-01-12', '饲料技术推广', '主持', '国际领先', '讲座500场，论文12篇，翻译文章120余篇');
INSERT INTO `expert_results` VALUES ('116', '124', '1988-07-01', '2002-09-01', '生产技术部经理', '主要骨干', '开展多次技改', '国内先进');
INSERT INTO `expert_results` VALUES ('117', '124', '2002-09-01', '2005-11-01', '兼任工厂技术中心总经理（省级）', '主持', '获得二项专利', '国内领先');
INSERT INTO `expert_results` VALUES ('118', '124', '2005-11-01', '2016-01-12', '兼任生产管理部经理', '主持', '开展多次技改', '国内先进');
INSERT INTO `expert_results` VALUES ('119', '126', '1975-01-09', '1977-01-05', '省项目喷风碾米机', '设计', '', '江苏省定型');
INSERT INTO `expert_results` VALUES ('120', '126', '1979-01-18', '1999-01-13', '饲料工程设计，国家攻关和部级科研项目：配合饲料工艺、设备、营养等的研究', '参与、主持、组织', '国内领先', '鉴定，转化为现实生产力、获国家、部奖');
INSERT INTO `expert_results` VALUES ('121', '126', '1997-01-08', '2003-01-08', '国家级科技项目 糙米流通综合示范工程，早稻品质改良科技产业工程', '主持、参与、组织 ', '国内领先', '鉴定验收，成果已转化');
INSERT INTO `expert_results` VALUES ('122', '129', null, null, '', '', '', '');
INSERT INTO `expert_results` VALUES ('123', '130', null, null, '', '', '', '');
INSERT INTO `expert_results` VALUES ('124', '131', '2016-01-29', '2016-02-05', '', '', '', '');
INSERT INTO `expert_results` VALUES ('125', '131', '2016-01-19', '2016-02-06', null, '', '', '');
INSERT INTO `expert_results` VALUES ('126', '132', null, null, '', '', '', '');
INSERT INTO `expert_results` VALUES ('127', '133', null, null, '', '', '', '');
INSERT INTO `expert_results` VALUES ('128', '149', null, null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('129', '149', null, null, '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('130', '149', null, null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '完成情况3');
INSERT INTO `expert_results` VALUES ('131', '149', null, null, '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('132', '149', null, null, '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('133', '150', null, null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('134', '150', null, null, '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('135', '150', null, null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '完成情况3');
INSERT INTO `expert_results` VALUES ('136', '150', null, null, '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('137', '150', null, null, '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('138', '151', null, null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('139', '151', null, null, '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('140', '151', null, null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '完成情况3');
INSERT INTO `expert_results` VALUES ('141', '151', null, null, '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('142', '151', null, null, '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('143', '152', null, null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('144', '152', null, null, '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('145', '152', null, null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '完成情况3');
INSERT INTO `expert_results` VALUES ('146', '152', null, null, '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('147', '152', null, null, '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('148', '153', null, null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('149', '153', null, null, '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('150', '153', null, null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '完成情况3');
INSERT INTO `expert_results` VALUES ('151', '153', null, null, '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('152', '153', null, null, '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('153', '154', null, null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('154', '154', null, null, '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('155', '154', null, null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '完成情况3');
INSERT INTO `expert_results` VALUES ('156', '154', null, null, '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('157', '154', null, null, '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('158', '155', null, null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('159', '155', null, null, '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('160', '155', null, null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '完成情况3');
INSERT INTO `expert_results` VALUES ('161', '155', null, null, '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('162', '155', null, null, '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('163', '156', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('164', '156', null, null, '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('165', '156', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '完成情况3');
INSERT INTO `expert_results` VALUES ('166', '156', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('167', '156', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('168', '157', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('169', '157', null, null, '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('170', '157', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '完成情况3');
INSERT INTO `expert_results` VALUES ('171', '157', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('172', '157', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('173', '158', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('174', '158', null, null, '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('175', '158', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '完成情况3');
INSERT INTO `expert_results` VALUES ('176', '158', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('177', '158', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('178', '159', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('179', '159', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('180', '159', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('181', '159', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('182', '159', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('183', '160', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('184', '160', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('185', '161', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('186', '161', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('187', '162', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('188', '162', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('189', '162', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('190', '162', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('191', '162', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('192', '163', '2010-01-01', null, '“粮油仓库工程验收规程(LS/T 8008-2010)”（国家粮食局专项，项目负责人）', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('193', '163', '2000-01-01', null, '国债粮库湖北省粮库项目53个项目0．5-3亿斤规模工程设计', '技术负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('194', '163', '2010-01-01', null, '中粮沿江大区黄冈、黄石饲料项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('195', '163', '2012-01-01', null, '中粮沿江大区荆州饲料工程总承包项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('196', '164', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('197', '164', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('198', '165', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('199', '165', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('200', '165', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('201', '165', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('202', '165', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('203', '166', '2010-01-01', null, '“粮油仓库工程验收规程(LS/T 8008-2010)”（国家粮食局专项，项目负责人）', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('204', '166', '2000-01-01', null, '国债粮库湖北省粮库项目53个项目0．5-3亿斤规模工程设计', '技术负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('205', '166', '2010-01-01', null, '中粮沿江大区黄冈、黄石饲料项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('206', '166', '2012-01-01', null, '中粮沿江大区荆州饲料工程总承包项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('207', '167', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('208', '167', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('209', '168', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('210', '168', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('211', '168', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('212', '168', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('213', '168', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('214', '170', '2012-01-01', null, '国家粮食局《修复仓储设施实施方案（2013-2017）》', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('215', '170', '2013-01-01', null, '《“粮安工程”建设规划》重大问题研究—仓储设施建设规模研究、', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('216', '170', '2013-01-01', null, '《“粮安工程”建设规划》重大问题研究—物流设施建设规模研究', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('217', '170', null, null, '《福建粮食现代物流设施建设规划》、《新疆维吾尔自治区粮食现代物流设施“十一五”及中长期建设规划》、《安徽粮食现代物流发展规划》\\《江苏省仓储物流设施建设规划（2015—2020）》', '主要完成人和项目负责人', '省级', '完成');
INSERT INTO `expert_results` VALUES ('218', '170', null, null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》、《中储粮油脂有限公司油菜籽产业发展规划》、《中国华粮物流集团公司“十二五”粮食物流发展规划》、洋口、枣庄、天津临港、盘锦临港、广元、新疆米业集团、万年国米、贵州、徐州、城陵矶等产业园区规划、《成都粮食现代物流发展规划》、《资阳粮食现代物流发展规划》、《苏州市粮食收储供应安全保障规划》', '项目负责人', '省级或市级', '完成');
INSERT INTO `expert_results` VALUES ('219', '172', '2012-01-01', null, '国家粮食局《修复仓储设施实施方案（2013-2017）》', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('220', '172', '2013-01-01', null, '《“粮安工程”建设规划》重大问题研究—仓储设施建设规模研究、', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('221', '172', '2013-01-01', null, '《“粮安工程”建设规划》重大问题研究—物流设施建设规模研究', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('222', '172', null, null, '《福建粮食现代物流设施建设规划》、《新疆维吾尔自治区粮食现代物流设施“十一五”及中长期建设规划》、《安徽粮食现代物流发展规划》\\《江苏省仓储物流设施建设规划（2015—2020）》', '主要完成人和项目负责人', '省级', '完成');
INSERT INTO `expert_results` VALUES ('223', '172', null, null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》、《中储粮油脂有限公司油菜籽产业发展规划》、《中国华粮物流集团公司“十二五”粮食物流发展规划》、洋口、枣庄、天津临港、盘锦临港、广元、新疆米业集团、万年国米、贵州、徐州、城陵矶等产业园区规划、《成都粮食现代物流发展规划》、《资阳粮食现代物流发展规划》、《苏州市粮食收储供应安全保障规划》', '项目负责人', '省级或市级', '完成');
INSERT INTO `expert_results` VALUES ('224', '173', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('225', '173', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('226', '174', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('227', '174', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('228', '174', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('229', '174', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('230', '174', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('231', '176', '2012-01-01', null, '国家粮食局《修复仓储设施实施方案（2013-2017）》', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('232', '176', '2013-01-01', null, '《“粮安工程”建设规划》重大问题研究—仓储设施建设规模研究、', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('233', '176', '2013-01-01', null, '《“粮安工程”建设规划》重大问题研究—物流设施建设规模研究', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('234', '176', null, null, '《福建粮食现代物流设施建设规划》、《新疆维吾尔自治区粮食现代物流设施“十一五”及中长期建设规划》、《安徽粮食现代物流发展规划》\\《江苏省仓储物流设施建设规划（2015—2020）》', '主要完成人和项目负责人', '省级', '完成');
INSERT INTO `expert_results` VALUES ('235', '176', null, null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》、《中储粮油脂有限公司油菜籽产业发展规划》、《中国华粮物流集团公司“十二五”粮食物流发展规划》、洋口、枣庄、天津临港、盘锦临港、广元、新疆米业集团、万年国米、贵州、徐州、城陵矶等产业园区规划、《成都粮食现代物流发展规划》、《资阳粮食现代物流发展规划》、《苏州市粮食收储供应安全保障规划》', '项目负责人', '省级或市级', '完成');
INSERT INTO `expert_results` VALUES ('236', '177', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('237', '177', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('238', '178', null, null, '低温真空干燥条件下粮食介电特性及水分检测和控制', '主持', '国内领先', '专利');
INSERT INTO `expert_results` VALUES ('239', '178', null, null, '粮食连续干燥数控技术及分布式智能测控系统', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('240', '178', null, null, '适于不同区域农户小型储粮设施研究与示范推广', '主持', '国内领先', '');
INSERT INTO `expert_results` VALUES ('241', '178', null, null, '粮食干燥控速模型及智能系统的研究', '主持', '国际领先', '专利');
INSERT INTO `expert_results` VALUES ('242', '179', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '', '');
INSERT INTO `expert_results` VALUES ('243', '179', null, null, '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '', '');
INSERT INTO `expert_results` VALUES ('244', '179', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '', '');
INSERT INTO `expert_results` VALUES ('245', '179', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '', '');
INSERT INTO `expert_results` VALUES ('246', '179', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '', '');
INSERT INTO `expert_results` VALUES ('247', '182', '1996-01-01', null, '辛集黑马面粉厂', '工艺设计人', '国内先进', '全国第十一届优秀工程设计铜质奖');
INSERT INTO `expert_results` VALUES ('248', '182', '1998-01-01', null, '大连南关岭国家粮食储备库立筒仓项目', '专业负责人 工艺设计人', '国内先进', '全国第十一届优秀工程设计银质奖');
INSERT INTO `expert_results` VALUES ('249', '182', '2008-01-01', null, '中储粮三河粮食物流加工项目（年生产大米30万吨）', '项目负责人 工艺设计人', '国内先进', '投产');
INSERT INTO `expert_results` VALUES ('250', '182', null, null, '中央储备粮唐山直属库油脂油料仓储及加工项目可行性研究报告', '参加', '国内先进', '2012年度全国优秀工程咨询成果二等奖');
INSERT INTO `expert_results` VALUES ('251', '183', null, null, '国家“十一五“科技支撑计划课题、粮食流通追踪技术设备与应用示范（2008BADA8B03）', '子课题负责人', '', '');
INSERT INTO `expert_results` VALUES ('252', '183', null, null, '国家自然科学基金项目，电磁波探测粮仓储粮水份技术的研究（60940017）', '', '', '');
INSERT INTO `expert_results` VALUES ('253', '183', null, null, '河南省科技攻关，基于预测模型和无线传输网络的粮库综合监控管理系统', '负责人', '', '');
INSERT INTO `expert_results` VALUES ('254', '183', null, null, '河南省自然科学计划项目，基于模糊理论的储粮昆虫模式识别研究', '负责人', '', '');
INSERT INTO `expert_results` VALUES ('255', '183', null, null, '河南省科技攻关，储粮害虫防治专家系统的研究与设计', '负责人', '', '');
INSERT INTO `expert_results` VALUES ('256', '184', null, null, '胶州海北粮南运项目', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('257', '184', null, null, '进口大豆全程物流服务项目', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('258', '184', null, null, '麻涌港进口粮食国家指定口岸码头', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('259', '185', null, null, '国家发改委“北粮南运”铁路散粮运输线路规划方案', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('260', '185', null, null, '福建粮食现代物流设施建设规划', '主持', '省（部）先进', '获2007年度北京市优秀工程咨询成果一等奖');
INSERT INTO `expert_results` VALUES ('261', '185', '2008-01-01', null, '黑龙江稻谷和玉米外运相关问题研究', '主持', '省（部）先进', '');
INSERT INTO `expert_results` VALUES ('262', '185', null, null, '粮食工程建设标准体系', '第二起草人', '省（部）先进', '');
INSERT INTO `expert_results` VALUES ('263', '185', null, null, '天津临港产业区轻工及粮油食品产业园区总体规划', '主持', '省（部）先进', '');
INSERT INTO `expert_results` VALUES ('264', '186', null, null, '浅圆仓移动式螺旋清仓机', '技术骨干', '在2003年国储库填平补齐项目建设中广泛应用，技术国内领先。', '已广泛应用国储库');
INSERT INTO `expert_results` VALUES ('265', '186', null, null, '粮食柔性集装单元化储运技术的研究开发', '专业负责人', '在国内较早开展粮食集装单元化储运技术研究，技术处于国内领先地位。', '已验收并有应用');
INSERT INTO `expert_results` VALUES ('266', '186', null, null, '糙米集装单元化储运技术的研究开发', '专业负责人', '属于国内较早开展糙米集装单元化储运技术研究，技术国内领先。', '已验收');
INSERT INTO `expert_results` VALUES ('267', '186', null, null, '东北粮食外运发展战略研究', '技术骨干', '国家粮食局组织研究项目，国内领先', '已验收');
INSERT INTO `expert_results` VALUES ('268', '186', null, null, '国家标准《粮食集装袋》', '负责人', '国家标准', '通过评审，待颁布');
INSERT INTO `expert_results` VALUES ('269', '187', '2008-01-01', null, '中粮佳悦天津临港粮油码头工程  设计', ' 主持（专业主管总工）', '    国内先进水平', '已投产，运行良好。');
INSERT INTO `expert_results` VALUES ('270', '187', '2010-01-01', null, ' 天津临港港务公司2#、3#粮油码头工程', ' 主持（专业主管总工）', '', '即将投产!');
INSERT INTO `expert_results` VALUES ('271', '187', '1988-01-01', null, '秦皇岛港丙丁散粮码头成套系统设备引进 ', ' 参加（设备负责人）', '    国际先进水平', '运行良好。');
INSERT INTO `expert_results` VALUES ('272', '187', '2013-01-01', null, '宏发韦立 印尼 氧化铝厂 码头工程 设计', ' 指导专家', '', '实施中。');
INSERT INTO `expert_results` VALUES ('273', '188', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('274', '188', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('275', '189', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('276', '189', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('277', '189', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('278', '189', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('279', '189', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('280', '190', '2010-01-01', null, '“粮油仓库工程验收规程(LS/T 8008-2010)”（国家粮食局专项，项目负责人）', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('281', '190', '2000-01-01', null, '国债粮库湖北省粮库项目53个项目0．5-3亿斤规模工程设计', '技术负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('282', '190', '2010-01-01', null, '中粮沿江大区黄冈、黄石饲料项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('283', '190', '2012-01-01', null, '中粮沿江大区荆州饲料工程总承包项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('284', '191', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('285', '191', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('286', '192', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('287', '192', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('288', '192', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('289', '192', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('290', '192', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('291', '193', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('292', '193', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('293', '194', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('294', '194', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('295', '194', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('296', '194', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('297', '194', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('298', '195', '2010-01-01', null, '“粮油仓库工程验收规程(LS/T 8008-2010)”（国家粮食局专项，项目负责人）', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('299', '195', '2000-01-01', null, '国债粮库湖北省粮库项目53个项目0．5-3亿斤规模工程设计', '技术负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('300', '195', '2010-01-01', null, '中粮沿江大区黄冈、黄石饲料项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('301', '195', '2012-01-01', null, '中粮沿江大区荆州饲料工程总承包项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('302', '197', '2012-01-01', null, '国家粮食局《修复仓储设施实施方案（2013-2017）》', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('303', '197', '2013-01-01', null, '《“粮安工程”建设规划》重大问题研究—仓储设施建设规模研究、', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('304', '197', '2013-01-01', null, '《“粮安工程”建设规划》重大问题研究—物流设施建设规模研究', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('305', '197', null, null, '《福建粮食现代物流设施建设规划》、《新疆维吾尔自治区粮食现代物流设施“十一五”及中长期建设规划》、《安徽粮食现代物流发展规划》\\《江苏省仓储物流设施建设规划（2015—2020）》', '主要完成人和项目负责人', '省级', '完成');
INSERT INTO `expert_results` VALUES ('306', '197', null, null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》、《中储粮油脂有限公司油菜籽产业发展规划》、《中国华粮物流集团公司“十二五”粮食物流发展规划》、洋口、枣庄、天津临港、盘锦临港、广元、新疆米业集团、万年国米、贵州、徐州、城陵矶等产业园区规划、《成都粮食现代物流发展规划》、《资阳粮食现代物流发展规划》、《苏州市粮食收储供应安全保障规划》', '项目负责人', '省级或市级', '完成');
INSERT INTO `expert_results` VALUES ('307', '198', null, null, '国家社科基金一般项目《发展农业循环经济的机制与对策研究——基于农产品供应链集成机制的视角》（08BJY067）', '主持', '“良好”国内领先', '黑龙江省第十五届社会科学优秀成果奖，获专著类三等奖');
INSERT INTO `expert_results` VALUES ('308', '198', null, null, '黑龙江省发改委作《黑龙江省粮食物流规划（2009-2015）》', '主持', '通过鉴定，国内领先', '');
INSERT INTO `expert_results` VALUES ('309', '198', null, null, '《大庆市粮食现代物流规划（2009-2015）》', '主持', '通过鉴定，国内领先', '');
INSERT INTO `expert_results` VALUES ('310', '198', null, null, '国家粮食局制定国家粮食行业“十二五”规划之农垦总局单列规划——《黑龙江垦区粮食行业“十二五”规划（2011-2015）》', '主持', '通过鉴定，国内领先', '');
INSERT INTO `expert_results` VALUES ('311', '199', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('312', '199', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('313', '200', null, null, '低温真空干燥条件下粮食介电特性及水分检测和控制', '主持', '国内领先', '专利');
INSERT INTO `expert_results` VALUES ('314', '200', null, null, '粮食连续干燥数控技术及分布式智能测控系统', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('315', '200', null, null, '适于不同区域农户小型储粮设施研究与示范推广', '主持', '国内领先', '');
INSERT INTO `expert_results` VALUES ('316', '200', null, null, '粮食干燥控速模型及智能系统的研究', '主持', '国际领先', '专利');
INSERT INTO `expert_results` VALUES ('317', '201', null, null, '计算机集成控制柔性运输包裹分拣演示系统', '负责人', '国内领先', '良好');
INSERT INTO `expert_results` VALUES ('318', '201', null, null, '北京国际邮件处理中心邮件分拣计算机网络管理控制系统', '负责人', '国内先进', '良好');
INSERT INTO `expert_results` VALUES ('319', '201', null, null, '沈阳图书配送中心计算机网络管理控制系统', '负责人', '国内先进', '良好');
INSERT INTO `expert_results` VALUES ('320', '201', null, null, '刊捆分拣机全自动条码识别系统', '负责人', '国内先进', '良好');
INSERT INTO `expert_results` VALUES ('321', '201', null, null, '全国留学生信息管理系统', '负责人', '国内先进', '良好');
INSERT INTO `expert_results` VALUES ('322', '202', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '', '');
INSERT INTO `expert_results` VALUES ('323', '202', null, null, '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '', '');
INSERT INTO `expert_results` VALUES ('324', '202', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '', '');
INSERT INTO `expert_results` VALUES ('325', '202', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '', '');
INSERT INTO `expert_results` VALUES ('326', '202', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '', '');
INSERT INTO `expert_results` VALUES ('327', '203', null, null, '“十一五”国家科技支撑计划子课题《绿色储粮新技术优化集成示范》\n', '主持', '', '');
INSERT INTO `expert_results` VALUES ('328', '203', null, null, '国家科技支撑计划子课题《储粮生物挥发物质与储藏品质判定\n新方法及快速检测技术开发研究》\n', '主持', '', '');
INSERT INTO `expert_results` VALUES ('329', '206', null, null, '国家软科学研究计划项目，促进我国粮食流通产业现代化的技术政策研究，项目批准号：2009GXS5B092', '', '', '完成');
INSERT INTO `expert_results` VALUES ('330', '206', null, null, '国家粮食局软科学研究课题，中国粮食安全的现状、挑战与对策研究', '', '', '完成');
INSERT INTO `expert_results` VALUES ('331', '206', null, null, '国家粮食局软科学研究课题，外资进入对我国粮食安全的影响及对策研究', '', '', '完成');
INSERT INTO `expert_results` VALUES ('332', '208', '1996-01-01', null, '辛集黑马面粉厂', '工艺设计人', '国内先进', '全国第十一届优秀工程设计铜质奖');
INSERT INTO `expert_results` VALUES ('333', '208', '1998-01-01', null, '大连南关岭国家粮食储备库立筒仓项目', '专业负责人 工艺设计人', '国内先进', '全国第十一届优秀工程设计银质奖');
INSERT INTO `expert_results` VALUES ('334', '208', '2008-01-01', null, '中储粮三河粮食物流加工项目（年生产大米30万吨）', '项目负责人 工艺设计人', '国内先进', '投产');
INSERT INTO `expert_results` VALUES ('335', '208', null, null, '中央储备粮唐山直属库油脂油料仓储及加工项目可行性研究报告', '参加', '国内先进', '2012年度全国优秀工程咨询成果二等奖');
INSERT INTO `expert_results` VALUES ('336', '209', null, null, '国家“十一五“科技支撑计划课题、粮食流通追踪技术设备与应用示范（2008BADA8B03）', '子课题负责人', '', '');
INSERT INTO `expert_results` VALUES ('337', '209', null, null, '国家自然科学基金项目，电磁波探测粮仓储粮水份技术的研究（60940017）', '', '', '');
INSERT INTO `expert_results` VALUES ('338', '209', null, null, '河南省科技攻关，基于预测模型和无线传输网络的粮库综合监控管理系统', '负责人', '', '');
INSERT INTO `expert_results` VALUES ('339', '209', null, null, '河南省自然科学计划项目，基于模糊理论的储粮昆虫模式识别研究', '负责人', '', '');
INSERT INTO `expert_results` VALUES ('340', '209', null, null, '河南省科技攻关，储粮害虫防治专家系统的研究与设计', '负责人', '', '');
INSERT INTO `expert_results` VALUES ('341', '210', '2006-01-01', null, '承担十一五科技支撑计划绿色储粮技术之：\n大米保鲜项目\n---温湿度测控设备开发及软件控制集成应用\n粮食收购品质检测\n---一体化快速检测设备开发\n---吹泡示功仪机电一体化设计及数据分析软件开发\n    ---物性仪机电一体化设计及数据分析软件开发\n', '', '', '');
INSERT INTO `expert_results` VALUES ('342', '211', null, null, '胶州海北粮南运项目', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('343', '211', null, null, '进口大豆全程物流服务项目', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('344', '211', null, null, '麻涌港进口粮食国家指定口岸码头', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('345', '212', null, null, '湖南金霞粮食物流园区项目', '项目负责人', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('346', '212', null, null, '中储粮唐山直属库仓储物流设施项目36万吨浅圆仓', '项目负责人', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('347', '213', null, null, '国家发改委“北粮南运”铁路散粮运输线路规划方案', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('348', '213', null, null, '福建粮食现代物流设施建设规划', '主持', '省（部）先进', '获2007年度北京市优秀工程咨询成果一等奖');
INSERT INTO `expert_results` VALUES ('349', '213', '2008-01-01', null, '黑龙江稻谷和玉米外运相关问题研究', '主持', '省（部）先进', '');
INSERT INTO `expert_results` VALUES ('350', '213', null, null, '粮食工程建设标准体系', '第二起草人', '省（部）先进', '');
INSERT INTO `expert_results` VALUES ('351', '213', null, null, '天津临港产业区轻工及粮油食品产业园区总体规划', '主持', '省（部）先进', '');
INSERT INTO `expert_results` VALUES ('352', '214', '2010-01-01', null, '“粮油仓库工程验收规程(LS/T 8008-2010)”（国家粮食局专项，项目负责人）', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('353', '214', '2000-01-01', null, '国债粮库湖北省粮库项目53个项目0．5-3亿斤规模工程设计', '技术负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('354', '214', '2010-01-01', null, '中粮沿江大区黄冈、黄石饲料项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('355', '214', '2012-01-01', null, '中粮沿江大区荆州饲料工程总承包项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('356', '215', null, null, '浅圆仓移动式螺旋清仓机', '技术骨干', '在2003年国储库填平补齐项目建设中广泛应用，技术国内领先。', '已广泛应用国储库');
INSERT INTO `expert_results` VALUES ('357', '215', null, null, '粮食柔性集装单元化储运技术的研究开发', '专业负责人', '在国内较早开展粮食集装单元化储运技术研究，技术处于国内领先地位。', '已验收并有应用');
INSERT INTO `expert_results` VALUES ('358', '215', null, null, '糙米集装单元化储运技术的研究开发', '专业负责人', '属于国内较早开展糙米集装单元化储运技术研究，技术国内领先。', '已验收');
INSERT INTO `expert_results` VALUES ('359', '215', null, null, '东北粮食外运发展战略研究', '技术骨干', '国家粮食局组织研究项目，国内领先', '已验收');
INSERT INTO `expert_results` VALUES ('360', '215', null, null, '国家标准《粮食集装袋》', '负责人', '国家标准', '通过评审，待颁布');
INSERT INTO `expert_results` VALUES ('361', '216', '2008-01-01', null, '中粮佳悦天津临港粮油码头工程  设计', ' 主持（专业主管总工）', '    国内先进水平', '已投产，运行良好。');
INSERT INTO `expert_results` VALUES ('362', '216', '2010-01-01', null, ' 天津临港港务公司2#、3#粮油码头工程', ' 主持（专业主管总工）', '', '即将投产!');
INSERT INTO `expert_results` VALUES ('363', '216', '1988-01-01', null, '秦皇岛港丙丁散粮码头成套系统设备引进 ', ' 参加（设备负责人）', '    国际先进水平', '运行良好。');
INSERT INTO `expert_results` VALUES ('364', '216', '2013-01-01', null, '宏发韦立 印尼 氧化铝厂 码头工程 设计', ' 指导专家', '', '实施中。');
INSERT INTO `expert_results` VALUES ('365', '217', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('366', '217', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('367', '218', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('368', '218', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('369', '218', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('370', '218', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('371', '218', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('372', '219', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('373', '219', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('374', '220', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('375', '220', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('376', '220', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('377', '220', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('378', '220', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('379', '221', '2010-01-01', null, '“粮油仓库工程验收规程(LS/T 8008-2010)”（国家粮食局专项，项目负责人）', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('380', '221', '2000-01-01', null, '国债粮库湖北省粮库项目53个项目0．5-3亿斤规模工程设计', '技术负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('381', '221', '2010-01-01', null, '中粮沿江大区黄冈、黄石饲料项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('382', '221', '2012-01-01', null, '中粮沿江大区荆州饲料工程总承包项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('383', '222', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('384', '222', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('385', '223', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('386', '223', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('387', '223', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('388', '223', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('389', '223', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('390', '224', '2010-01-01', null, '“粮油仓库工程验收规程(LS/T 8008-2010)”（国家粮食局专项，项目负责人）', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('391', '224', '2000-01-01', null, '国债粮库湖北省粮库项目53个项目0．5-3亿斤规模工程设计', '技术负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('392', '224', '2010-01-01', null, '中粮沿江大区黄冈、黄石饲料项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('393', '224', '2012-01-01', null, '中粮沿江大区荆州饲料工程总承包项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('394', '226', '2012-01-01', null, '国家粮食局《修复仓储设施实施方案（2013-2017）》', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('395', '226', '2013-01-01', null, '《“粮安工程”建设规划》重大问题研究—仓储设施建设规模研究、', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('396', '226', '2013-01-01', null, '《“粮安工程”建设规划》重大问题研究—物流设施建设规模研究', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('397', '226', null, null, '《福建粮食现代物流设施建设规划》、《新疆维吾尔自治区粮食现代物流设施“十一五”及中长期建设规划》、《安徽粮食现代物流发展规划》\\《江苏省仓储物流设施建设规划（2015—2020）》', '主要完成人和项目负责人', '省级', '完成');
INSERT INTO `expert_results` VALUES ('398', '226', null, null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》、《中储粮油脂有限公司油菜籽产业发展规划》、《中国华粮物流集团公司“十二五”粮食物流发展规划》、洋口、枣庄、天津临港、盘锦临港、广元、新疆米业集团、万年国米、贵州、徐州、城陵矶等产业园区规划、《成都粮食现代物流发展规划》、《资阳粮食现代物流发展规划》、《苏州市粮食收储供应安全保障规划》', '项目负责人', '省级或市级', '完成');
INSERT INTO `expert_results` VALUES ('399', '227', null, null, '国家社科基金一般项目《发展农业循环经济的机制与对策研究——基于农产品供应链集成机制的视角》（08BJY067）', '主持', '“良好”国内领先', '黑龙江省第十五届社会科学优秀成果奖，获专著类三等奖');
INSERT INTO `expert_results` VALUES ('400', '227', null, null, '黑龙江省发改委作《黑龙江省粮食物流规划（2009-2015）》', '主持', '通过鉴定，国内领先', '');
INSERT INTO `expert_results` VALUES ('401', '227', null, null, '《大庆市粮食现代物流规划（2009-2015）》', '主持', '通过鉴定，国内领先', '');
INSERT INTO `expert_results` VALUES ('402', '227', null, null, '国家粮食局制定国家粮食行业“十二五”规划之农垦总局单列规划——《黑龙江垦区粮食行业“十二五”规划（2011-2015）》', '主持', '通过鉴定，国内领先', '');
INSERT INTO `expert_results` VALUES ('403', '228', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('404', '228', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('405', '229', null, null, '低温真空干燥条件下粮食介电特性及水分检测和控制', '主持', '国内领先', '专利');
INSERT INTO `expert_results` VALUES ('406', '229', null, null, '粮食连续干燥数控技术及分布式智能测控系统', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('407', '229', null, null, '适于不同区域农户小型储粮设施研究与示范推广', '主持', '国内领先', '');
INSERT INTO `expert_results` VALUES ('408', '229', null, null, '粮食干燥控速模型及智能系统的研究', '主持', '国际领先', '专利');
INSERT INTO `expert_results` VALUES ('409', '230', null, null, '计算机集成控制柔性运输包裹分拣演示系统', '负责人', '国内领先', '良好');
INSERT INTO `expert_results` VALUES ('410', '230', null, null, '北京国际邮件处理中心邮件分拣计算机网络管理控制系统', '负责人', '国内先进', '良好');
INSERT INTO `expert_results` VALUES ('411', '230', null, null, '沈阳图书配送中心计算机网络管理控制系统', '负责人', '国内先进', '良好');
INSERT INTO `expert_results` VALUES ('412', '230', null, null, '刊捆分拣机全自动条码识别系统', '负责人', '国内先进', '良好');
INSERT INTO `expert_results` VALUES ('413', '230', null, null, '全国留学生信息管理系统', '负责人', '国内先进', '良好');
INSERT INTO `expert_results` VALUES ('414', '231', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '', '');
INSERT INTO `expert_results` VALUES ('415', '231', null, null, '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '', '');
INSERT INTO `expert_results` VALUES ('416', '231', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '', '');
INSERT INTO `expert_results` VALUES ('417', '231', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '', '');
INSERT INTO `expert_results` VALUES ('418', '231', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '', '');
INSERT INTO `expert_results` VALUES ('419', '232', null, null, '“十一五”国家科技支撑计划子课题《绿色储粮新技术优化集成示范》\n', '主持', '', '');
INSERT INTO `expert_results` VALUES ('420', '232', null, null, '国家科技支撑计划子课题《储粮生物挥发物质与储藏品质判定\n新方法及快速检测技术开发研究》\n', '主持', '', '');
INSERT INTO `expert_results` VALUES ('421', '235', null, null, '国家软科学研究计划项目，促进我国粮食流通产业现代化的技术政策研究，项目批准号：2009GXS5B092', '', '', '完成');
INSERT INTO `expert_results` VALUES ('422', '235', null, null, '国家粮食局软科学研究课题，中国粮食安全的现状、挑战与对策研究', '', '', '完成');
INSERT INTO `expert_results` VALUES ('423', '235', null, null, '国家粮食局软科学研究课题，外资进入对我国粮食安全的影响及对策研究', '', '', '完成');
INSERT INTO `expert_results` VALUES ('424', '237', '1996-01-01', null, '辛集黑马面粉厂', '工艺设计人', '国内先进', '全国第十一届优秀工程设计铜质奖');
INSERT INTO `expert_results` VALUES ('425', '237', '1998-01-01', null, '大连南关岭国家粮食储备库立筒仓项目', '专业负责人 工艺设计人', '国内先进', '全国第十一届优秀工程设计银质奖');
INSERT INTO `expert_results` VALUES ('426', '237', '2008-01-01', null, '中储粮三河粮食物流加工项目（年生产大米30万吨）', '项目负责人 工艺设计人', '国内先进', '投产');
INSERT INTO `expert_results` VALUES ('427', '237', null, null, '中央储备粮唐山直属库油脂油料仓储及加工项目可行性研究报告', '参加', '国内先进', '2012年度全国优秀工程咨询成果二等奖');
INSERT INTO `expert_results` VALUES ('428', '238', null, null, '国家“十一五“科技支撑计划课题、粮食流通追踪技术设备与应用示范（2008BADA8B03）', '子课题负责人', '', '');
INSERT INTO `expert_results` VALUES ('429', '238', null, null, '国家自然科学基金项目，电磁波探测粮仓储粮水份技术的研究（60940017）', '', '', '');
INSERT INTO `expert_results` VALUES ('430', '238', null, null, '河南省科技攻关，基于预测模型和无线传输网络的粮库综合监控管理系统', '负责人', '', '');
INSERT INTO `expert_results` VALUES ('431', '238', null, null, '河南省自然科学计划项目，基于模糊理论的储粮昆虫模式识别研究', '负责人', '', '');
INSERT INTO `expert_results` VALUES ('432', '238', null, null, '河南省科技攻关，储粮害虫防治专家系统的研究与设计', '负责人', '', '');
INSERT INTO `expert_results` VALUES ('433', '239', '2006-01-01', null, '承担十一五科技支撑计划绿色储粮技术之：\n大米保鲜项目\n---温湿度测控设备开发及软件控制集成应用\n粮食收购品质检测\n---一体化快速检测设备开发\n---吹泡示功仪机电一体化设计及数据分析软件开发\n    ---物性仪机电一体化设计及数据分析软件开发\n', '', '', '');
INSERT INTO `expert_results` VALUES ('434', '240', null, null, '胶州海北粮南运项目', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('435', '240', null, null, '进口大豆全程物流服务项目', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('436', '240', null, null, '麻涌港进口粮食国家指定口岸码头', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('437', '241', null, null, '湖南金霞粮食物流园区项目', '项目负责人', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('438', '241', null, null, '中储粮唐山直属库仓储物流设施项目36万吨浅圆仓', '项目负责人', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('439', '242', null, null, '国家发改委“北粮南运”铁路散粮运输线路规划方案', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('440', '242', null, null, '福建粮食现代物流设施建设规划', '主持', '省（部）先进', '获2007年度北京市优秀工程咨询成果一等奖');
INSERT INTO `expert_results` VALUES ('441', '242', '2008-01-01', null, '黑龙江稻谷和玉米外运相关问题研究', '主持', '省（部）先进', '');
INSERT INTO `expert_results` VALUES ('442', '242', null, null, '粮食工程建设标准体系', '第二起草人', '省（部）先进', '');
INSERT INTO `expert_results` VALUES ('443', '242', null, null, '天津临港产业区轻工及粮油食品产业园区总体规划', '主持', '省（部）先进', '');
INSERT INTO `expert_results` VALUES ('444', '243', '2010-01-01', null, '“粮油仓库工程验收规程(LS/T 8008-2010)”（国家粮食局专项，项目负责人）', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('445', '243', '2000-01-01', null, '国债粮库湖北省粮库项目53个项目0．5-3亿斤规模工程设计', '技术负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('446', '243', '2010-01-01', null, '中粮沿江大区黄冈、黄石饲料项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('447', '243', '2012-01-01', null, '中粮沿江大区荆州饲料工程总承包项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('448', '244', null, null, '浅圆仓移动式螺旋清仓机', '技术骨干', '在2003年国储库填平补齐项目建设中广泛应用，技术国内领先。', '已广泛应用国储库');
INSERT INTO `expert_results` VALUES ('449', '244', null, null, '粮食柔性集装单元化储运技术的研究开发', '专业负责人', '在国内较早开展粮食集装单元化储运技术研究，技术处于国内领先地位。', '已验收并有应用');
INSERT INTO `expert_results` VALUES ('450', '244', null, null, '糙米集装单元化储运技术的研究开发', '专业负责人', '属于国内较早开展糙米集装单元化储运技术研究，技术国内领先。', '已验收');
INSERT INTO `expert_results` VALUES ('451', '244', null, null, '东北粮食外运发展战略研究', '技术骨干', '国家粮食局组织研究项目，国内领先', '已验收');
INSERT INTO `expert_results` VALUES ('452', '244', null, null, '国家标准《粮食集装袋》', '负责人', '国家标准', '通过评审，待颁布');
INSERT INTO `expert_results` VALUES ('453', '245', '2008-01-01', null, '中粮佳悦天津临港粮油码头工程  设计', ' 主持（专业主管总工）', '    国内先进水平', '已投产，运行良好。');
INSERT INTO `expert_results` VALUES ('454', '245', '2010-01-01', null, ' 天津临港港务公司2#、3#粮油码头工程', ' 主持（专业主管总工）', '', '即将投产!');
INSERT INTO `expert_results` VALUES ('455', '245', '1988-01-01', null, '秦皇岛港丙丁散粮码头成套系统设备引进 ', ' 参加（设备负责人）', '    国际先进水平', '运行良好。');
INSERT INTO `expert_results` VALUES ('456', '245', '2013-01-01', null, '宏发韦立 印尼 氧化铝厂 码头工程 设计', ' 指导专家', '', '实施中。');
INSERT INTO `expert_results` VALUES ('457', '246', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('458', '246', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('459', '247', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('460', '247', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('461', '247', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('462', '247', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('463', '247', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('464', '248', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('465', '248', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('466', '248', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('467', '248', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('468', '248', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('469', '249', '2010-01-01', null, '“粮油仓库工程验收规程(LS/T 8008-2010)”（国家粮食局专项，项目负责人）', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('470', '249', '2000-01-01', null, '国债粮库湖北省粮库项目53个项目0．5-3亿斤规模工程设计', '技术负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('471', '249', '2010-01-01', null, '中粮沿江大区黄冈、黄石饲料项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('472', '249', '2012-01-01', null, '中粮沿江大区荆州饲料工程总承包项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('473', '250', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('474', '250', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('475', '251', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('476', '251', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('477', '251', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('478', '251', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('479', '251', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('480', '252', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('481', '252', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('482', '252', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('483', '252', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('484', '252', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('485', '253', '2010-01-01', null, '“粮油仓库工程验收规程(LS/T 8008-2010)”（国家粮食局专项，项目负责人）', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('486', '253', '2000-01-01', null, '国债粮库湖北省粮库项目53个项目0．5-3亿斤规模工程设计', '技术负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('487', '253', '2010-01-01', null, '中粮沿江大区黄冈、黄石饲料项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('488', '253', '2012-01-01', null, '中粮沿江大区荆州饲料工程总承包项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('489', '254', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('490', '254', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('491', '255', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('492', '255', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('493', '255', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('494', '255', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('495', '255', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('496', '256', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('497', '256', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('498', '256', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('499', '256', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('500', '256', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('501', '257', '2010-01-01', null, '“粮油仓库工程验收规程(LS/T 8008-2010)”（国家粮食局专项，项目负责人）', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('502', '257', '2000-01-01', null, '国债粮库湖北省粮库项目53个项目0．5-3亿斤规模工程设计', '技术负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('503', '257', '2010-01-01', null, '中粮沿江大区黄冈、黄石饲料项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('504', '257', '2012-01-01', null, '中粮沿江大区荆州饲料工程总承包项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('505', '258', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('506', '258', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('507', '259', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('508', '259', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('509', '259', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('510', '259', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('511', '259', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('512', '260', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('513', '260', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('514', '260', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('515', '260', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('516', '260', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('517', '261', '2010-01-01', null, '“粮油仓库工程验收规程(LS/T 8008-2010)”（国家粮食局专项，项目负责人）', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('518', '261', '2000-01-01', null, '国债粮库湖北省粮库项目53个项目0．5-3亿斤规模工程设计', '技术负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('519', '261', '2010-01-01', null, '中粮沿江大区黄冈、黄石饲料项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('520', '261', '2012-01-01', null, '中粮沿江大区荆州饲料工程总承包项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('521', '262', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('522', '262', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('523', '262', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('524', '262', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('525', '262', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('526', '263', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('527', '263', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('528', '263', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('529', '263', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('530', '263', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('531', '264', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('532', '264', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('533', '264', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('534', '264', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('535', '264', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('536', '265', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('537', '265', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('538', '266', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('539', '266', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('540', '266', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('541', '266', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('542', '266', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('543', '267', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('544', '267', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('545', '267', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('546', '267', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('547', '267', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('548', '268', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('549', '268', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('550', '268', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('551', '268', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('552', '268', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('553', '269', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('554', '269', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('555', '270', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('556', '270', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('557', '270', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('558', '270', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('559', '270', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('560', '271', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('561', '271', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('562', '271', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('563', '271', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('564', '271', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('565', '272', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('566', '272', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('567', '272', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('568', '272', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('569', '272', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('570', '273', '2010-01-01', null, '“粮油仓库工程验收规程(LS/T 8008-2010)”（国家粮食局专项，项目负责人）', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('571', '273', '2000-01-01', null, '国债粮库湖北省粮库项目53个项目0．5-3亿斤规模工程设计', '技术负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('572', '273', '2010-01-01', null, '中粮沿江大区黄冈、黄石饲料项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('573', '273', '2012-01-01', null, '中粮沿江大区荆州饲料工程总承包项目', '项目负责人', '', '完成');
INSERT INTO `expert_results` VALUES ('574', '274', '2011-01-01', null, '中储粮岳阳储备库粮食烘干生产线', '参加', '国内先进', '');
INSERT INTO `expert_results` VALUES ('575', '274', '2013-01-01', null, '陕西西风酒厂粮食酿造自动化生产线', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('576', '275', '2006-01-01', null, '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('577', '275', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('578', '275', '2006-01-01', null, '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('579', '275', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('580', '275', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('581', '276', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('582', '276', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('583', '276', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('584', '276', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('585', '276', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('586', '277', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('587', '277', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('588', '277', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('589', '277', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('590', '277', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');
INSERT INTO `expert_results` VALUES ('591', '279', '2012-01-01', null, '国家粮食局《修复仓储设施实施方案（2013-2017）》', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('592', '279', '2013-01-01', null, '《“粮安工程”建设规划》重大问题研究—仓储设施建设规模研究、', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('593', '279', '2013-01-01', null, '《“粮安工程”建设规划》重大问题研究—物流设施建设规模研究', '主要完成人', '国家级', '完成');
INSERT INTO `expert_results` VALUES ('594', '279', null, null, '《福建粮食现代物流设施建设规划》、《新疆维吾尔自治区粮食现代物流设施“十一五”及中长期建设规划》、《安徽粮食现代物流发展规划》\\《江苏省仓储物流设施建设规划（2015—2020）》', '主要完成人和项目负责人', '省级', '完成');
INSERT INTO `expert_results` VALUES ('595', '279', null, null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》、《中储粮油脂有限公司油菜籽产业发展规划》、《中国华粮物流集团公司“十二五”粮食物流发展规划》、洋口、枣庄、天津临港、盘锦临港、广元、新疆米业集团、万年国米、贵州、徐州、城陵矶等产业园区规划、《成都粮食现代物流发展规划》、《资阳粮食现代物流发展规划》、《苏州市粮食收储供应安全保障规划》', '项目负责人', '省级或市级', '完成');
INSERT INTO `expert_results` VALUES ('596', '280', null, null, '国家社科基金一般项目《发展农业循环经济的机制与对策研究——基于农产品供应链集成机制的视角》（08BJY067）', '主持', '“良好”国内领先', '黑龙江省第十五届社会科学优秀成果奖，获专著类三等奖');
INSERT INTO `expert_results` VALUES ('597', '280', null, null, '黑龙江省发改委作《黑龙江省粮食物流规划（2009-2015）》', '主持', '通过鉴定，国内领先', '');
INSERT INTO `expert_results` VALUES ('598', '280', null, null, '《大庆市粮食现代物流规划（2009-2015）》', '主持', '通过鉴定，国内领先', '');
INSERT INTO `expert_results` VALUES ('599', '280', null, null, '国家粮食局制定国家粮食行业“十二五”规划之农垦总局单列规划——《黑龙江垦区粮食行业“十二五”规划（2011-2015）》', '主持', '通过鉴定，国内领先', '');
INSERT INTO `expert_results` VALUES ('600', '281', null, null, '低温真空干燥条件下粮食介电特性及水分检测和控制', '主持', '国内领先', '专利');
INSERT INTO `expert_results` VALUES ('601', '281', null, null, '粮食连续干燥数控技术及分布式智能测控系统', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('602', '281', null, null, '适于不同区域农户小型储粮设施研究与示范推广', '主持', '国内领先', '');
INSERT INTO `expert_results` VALUES ('603', '281', null, null, '粮食干燥控速模型及智能系统的研究', '主持', '国际领先', '专利');
INSERT INTO `expert_results` VALUES ('604', '282', null, null, '计算机集成控制柔性运输包裹分拣演示系统', '负责人', '国内领先', '良好');
INSERT INTO `expert_results` VALUES ('605', '282', null, null, '北京国际邮件处理中心邮件分拣计算机网络管理控制系统', '负责人', '国内先进', '良好');
INSERT INTO `expert_results` VALUES ('606', '282', null, null, '沈阳图书配送中心计算机网络管理控制系统', '负责人', '国内先进', '良好');
INSERT INTO `expert_results` VALUES ('607', '282', null, null, '刊捆分拣机全自动条码识别系统', '负责人', '国内先进', '良好');
INSERT INTO `expert_results` VALUES ('608', '282', null, null, '全国留学生信息管理系统', '负责人', '国内先进', '良好');
INSERT INTO `expert_results` VALUES ('609', '283', null, null, '“十一五”国家科技支撑计划子课题《绿色储粮新技术优化集成示范》\n', '主持', '', '');
INSERT INTO `expert_results` VALUES ('610', '283', null, null, '国家科技支撑计划子课题《储粮生物挥发物质与储藏品质判定\n新方法及快速检测技术开发研究》\n', '主持', '', '');
INSERT INTO `expert_results` VALUES ('611', '286', null, null, '国家软科学研究计划项目，促进我国粮食流通产业现代化的技术政策研究，项目批准号：2009GXS5B092', '', '', '完成');
INSERT INTO `expert_results` VALUES ('612', '286', null, null, '国家粮食局软科学研究课题，中国粮食安全的现状、挑战与对策研究', '', '', '完成');
INSERT INTO `expert_results` VALUES ('613', '286', null, null, '国家粮食局软科学研究课题，外资进入对我国粮食安全的影响及对策研究', '', '', '完成');
INSERT INTO `expert_results` VALUES ('614', '288', '1996-01-01', null, '辛集黑马面粉厂', '工艺设计人', '国内先进', '全国第十一届优秀工程设计铜质奖');
INSERT INTO `expert_results` VALUES ('615', '288', '1998-01-01', null, '大连南关岭国家粮食储备库立筒仓项目', '专业负责人 工艺设计人', '国内先进', '全国第十一届优秀工程设计银质奖');
INSERT INTO `expert_results` VALUES ('616', '288', '2008-01-01', null, '中储粮三河粮食物流加工项目（年生产大米30万吨）', '项目负责人 工艺设计人', '国内先进', '投产');
INSERT INTO `expert_results` VALUES ('617', '288', null, null, '中央储备粮唐山直属库油脂油料仓储及加工项目可行性研究报告', '参加', '国内先进', '2012年度全国优秀工程咨询成果二等奖');
INSERT INTO `expert_results` VALUES ('618', '289', null, null, '国家“十一五“科技支撑计划课题、粮食流通追踪技术设备与应用示范（2008BADA8B03）', '子课题负责人', '', '');
INSERT INTO `expert_results` VALUES ('619', '289', null, null, '国家自然科学基金项目，电磁波探测粮仓储粮水份技术的研究（60940017）', '', '', '');
INSERT INTO `expert_results` VALUES ('620', '289', null, null, '河南省科技攻关，基于预测模型和无线传输网络的粮库综合监控管理系统', '负责人', '', '');
INSERT INTO `expert_results` VALUES ('621', '289', null, null, '河南省自然科学计划项目，基于模糊理论的储粮昆虫模式识别研究', '负责人', '', '');
INSERT INTO `expert_results` VALUES ('622', '289', null, null, '河南省科技攻关，储粮害虫防治专家系统的研究与设计', '负责人', '', '');
INSERT INTO `expert_results` VALUES ('623', '290', '2006-01-01', null, '承担十一五科技支撑计划绿色储粮技术之：\n大米保鲜项目\n---温湿度测控设备开发及软件控制集成应用\n粮食收购品质检测\n---一体化快速检测设备开发\n---吹泡示功仪机电一体化设计及数据分析软件开发\n    ---物性仪机电一体化设计及数据分析软件开发\n', '', '', '');
INSERT INTO `expert_results` VALUES ('624', '291', null, null, '胶州海北粮南运项目', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('625', '291', null, null, '进口大豆全程物流服务项目', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('626', '291', null, null, '麻涌港进口粮食国家指定口岸码头', '主持', '全国领先', '效益显著');
INSERT INTO `expert_results` VALUES ('627', '292', null, null, '湖南金霞粮食物流园区项目', '项目负责人', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('628', '292', null, null, '中储粮唐山直属库仓储物流设施项目36万吨浅圆仓', '项目负责人', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('629', '293', null, null, '国家发改委“北粮南运”铁路散粮运输线路规划方案', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('630', '293', null, null, '福建粮食现代物流设施建设规划', '主持', '省（部）先进', '获2007年度北京市优秀工程咨询成果一等奖');
INSERT INTO `expert_results` VALUES ('631', '293', '2008-01-01', null, '黑龙江稻谷和玉米外运相关问题研究', '主持', '省（部）先进', '');
INSERT INTO `expert_results` VALUES ('632', '293', null, null, '粮食工程建设标准体系', '第二起草人', '省（部）先进', '');
INSERT INTO `expert_results` VALUES ('633', '293', null, null, '天津临港产业区轻工及粮油食品产业园区总体规划', '主持', '省（部）先进', '');
INSERT INTO `expert_results` VALUES ('634', '294', null, null, '浅圆仓移动式螺旋清仓机', '技术骨干', '在2003年国储库填平补齐项目建设中广泛应用，技术国内领先。', '已广泛应用国储库');
INSERT INTO `expert_results` VALUES ('635', '294', null, null, '粮食柔性集装单元化储运技术的研究开发', '专业负责人', '在国内较早开展粮食集装单元化储运技术研究，技术处于国内领先地位。', '已验收并有应用');
INSERT INTO `expert_results` VALUES ('636', '294', null, null, '糙米集装单元化储运技术的研究开发', '专业负责人', '属于国内较早开展糙米集装单元化储运技术研究，技术国内领先。', '已验收');
INSERT INTO `expert_results` VALUES ('637', '294', null, null, '东北粮食外运发展战略研究', '技术骨干', '国家粮食局组织研究项目，国内领先', '已验收');
INSERT INTO `expert_results` VALUES ('638', '294', null, null, '国家标准《粮食集装袋》', '负责人', '国家标准', '通过评审，待颁布');
INSERT INTO `expert_results` VALUES ('639', '295', '2008-01-01', null, '中粮佳悦天津临港粮油码头工程  设计', ' 主持（专业主管总工）', '    国内先进水平', '已投产，运行良好。');
INSERT INTO `expert_results` VALUES ('640', '295', '2010-01-01', null, ' 天津临港港务公司2#、3#粮油码头工程', ' 主持（专业主管总工）', '', '即将投产!');
INSERT INTO `expert_results` VALUES ('641', '295', '1988-01-01', null, '秦皇岛港丙丁散粮码头成套系统设备引进 ', ' 参加（设备负责人）', '    国际先进水平', '运行良好。');
INSERT INTO `expert_results` VALUES ('642', '295', '2013-01-01', null, '宏发韦立 印尼 氧化铝厂 码头工程 设计', ' 指导专家', '', '实施中。');
INSERT INTO `expert_results` VALUES ('643', '296', '1983-01-01', null, '《黄曲霉毒素解毒剂》', '参加主研', '国内先进水平', '四川省      政府奖励');
INSERT INTO `expert_results` VALUES ('644', '296', null, null, '《开发人力资源 构建学习型企业》', '主持', '省（部）先进', '重庆市企业家协会奖励');
INSERT INTO `expert_results` VALUES ('645', '296', null, null, '《中央储备粮安全储藏技术示范》', '参加主研', '国际先进水平', '中国粮油学会奖励');
INSERT INTO `expert_results` VALUES ('646', '296', null, null, '《国家粮库害虫害螨无公害控制研究》', '参加主研', '省（部）先进', '重庆市      政府奖励');
INSERT INTO `expert_results` VALUES ('647', '297', null, null, '散装稻谷储藏品质变化规律的研究', '主持', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('648', '297', null, null, '陷阱测虫器与扦样器对高大平房仓储粮害虫调查结果的比较', '主持', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('649', '297', null, null, '折线型层架平房仓不同部位温度变化研究', '主持', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('650', '297', null, null, '高大平房仓害虫发生及检查技术研究', '主持', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('651', '297', null, null, '国家粮库高大房式仓害虫发生、监测及无害化防治技术研究', '主持', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('652', '300', '2013-01-01', null, '粮食公益专项：北京储粮通风系统效能评价及节能减损技术研究 ', '参加', '国内领先', '进行中');
INSERT INTO `expert_results` VALUES ('653', '300', '2013-01-01', null, '粮食公益专项：储粮安全防护技术研究', '参加', '国内领先', '进行中');
INSERT INTO `expert_results` VALUES ('654', '300', '2008-01-01', null, '“十一五”国家科技支撑计划项目课题，绿色储粮防护剂惰性粉杀虫剂的研究与开发', '参加', '国内领先', '');
INSERT INTO `expert_results` VALUES ('655', '300', '2009-01-01', null, '北京市科委项目：北京粮油食品产业研发基地建设，惰性粉储粮杀虫技术开发与示范', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('656', '301', null, null, '玉米机械通风降水技术的研究', '参加', '国内先进', '获商业部科技进步奖');
INSERT INTO `expert_results` VALUES ('657', '301', null, null, '固定地槽设计方案优化研究', '参加', '国内先进', '获石家庄地区科技进步奖');
INSERT INTO `expert_results` VALUES ('658', '301', null, null, '排风扇通风降水技术的研究', '参加', '国内先进', '获石家庄地区科技进步奖');
INSERT INTO `expert_results` VALUES ('659', '301', null, null, '玉米粮层阻力实验研究', '参加', '国内先进', '获石家庄地区科技进步奖');
INSERT INTO `expert_results` VALUES ('660', '302', null, null, '粮食中麦角甾醇含量的调查研究', '参加', '国内领先', '中国粮油学会科技二等奖');
INSERT INTO `expert_results` VALUES ('661', '302', '2003-01-01', null, '粮食储藏及检测关键技术研究与设备开发', '参加', '国内领先', '');
INSERT INTO `expert_results` VALUES ('662', '302', null, null, '不同储粮生态区域粮食储备配套技术优化研究与示范', '参加', '国内领先', '');
INSERT INTO `expert_results` VALUES ('663', '302', null, null, '气调储粮工程关键技术与装备的研究开发', '参加', '国内领先', '中国粮油学会科技二等奖');
INSERT INTO `expert_results` VALUES ('664', '303', '2007-01-01', null, '“现代控温气调储粮技术扩大应用”项目', '参加', '国际先进', '中国粮油学会科学技术奖一等奖');
INSERT INTO `expert_results` VALUES ('665', '303', '2006-01-01', null, '“十一五”科技支撑项目子课题 “大米储存保鲜工艺技术和设备研究开发”', '子课题负责人', '国内先进', '获得专利5项。');
INSERT INTO `expert_results` VALUES ('666', '303', '2002-01-01', null, '科研院所技术开发专项项目——新型粮食就仓干燥技术及装备研究', '参加', '国内先进', '中国粮油学会科学技术奖二等奖');
INSERT INTO `expert_results` VALUES ('667', '303', '2013-01-01', null, '智能化粮库关键技术研发及集成应用示范', '总体方案设计，智能通风、智能气调技术负责人', '国内先进', '中国粮油学会科学技术奖一等奖');
INSERT INTO `expert_results` VALUES ('668', '304', null, null, '粮油仓储及加工标准体系', '主持', '国内领先', '《粮油储藏技术规范》等系列重要标准');
INSERT INTO `expert_results` VALUES ('669', '304', null, null, '三大平原农户储粮减损技术集成与示范', '主持', '国内领先', '成果得到推广应用');
INSERT INTO `expert_results` VALUES ('670', '304', null, null, '粮食主产区产后减损技术集成与示范', '主持', '国内领先', '在研');
INSERT INTO `expert_results` VALUES ('671', '304', null, null, '我国储粮害虫微生物污染物调查监测预报', '参与', '国内领先', '中国粮油学会一等奖');
INSERT INTO `expert_results` VALUES ('672', '305', null, null, '技术工作名称', '担任角色', '成果水平', '完成情况');
INSERT INTO `expert_results` VALUES ('673', '305', '2008-01-01', null, '“十一五”科技支撑计划课题“绿色储粮新技术优化集成示范” ', '课题负责人，主持课题的开展，验收等工作', '国内领先', '已顺利完成');
INSERT INTO `expert_results` VALUES ('674', '305', '2008-01-01', null, '现代控温气调储粮技术研发与示范', '项目负责人、主持项目立项、实施、验收等工作。', '国内领先', '已顺利完成');
INSERT INTO `expert_results` VALUES ('675', '305', '2008-01-01', null, '粮食烘干设施节能减排技术改造示范', '项目负责人，主持项目立项、实施，验收等工作。', '国内领先', '成功实现降低粮食干燥单位能耗5%的目标，获得国家专利1项。 ');
INSERT INTO `expert_results` VALUES ('676', '306', '2009-01-01', null, '稻谷两步干燥设备集成及应用示范', '主持', '国内领先', '粮堆专用下管器ZL201020538291.7');
INSERT INTO `expert_results` VALUES ('677', '306', '2004-01-01', null, '偏高水分玉米、稻谷保质储藏技术研究与开发', '参加', '国内领先', '');
INSERT INTO `expert_results` VALUES ('678', '306', '2000-01-01', null, '气调储粮工程关键技术与装备的研究开发——CO2气调仓试点项目', '参加', '国际先进', '中国粮油学会科技奖二等奖');
INSERT INTO `expert_results` VALUES ('679', '306', '2003-01-01', null, '粮食就仓干燥工程', '参加', '国内领先', '移动式空气源热泵空调装置ZL200620035852.5');
INSERT INTO `expert_results` VALUES ('680', '307', null, null, '不同温度、水分的大米安全储藏期限研究，省级科研课题', '主持', '一般水平', '');
INSERT INTO `expert_results` VALUES ('681', '308', '2008-01-01', null, '中储粮企业标准《稻谷控温储粮技术规程》', '主要起草人', '国内领先', '已由中储粮总公司发布实施');
INSERT INTO `expert_results` VALUES ('682', '308', '2008-01-01', null, '全国粮食行业标准《粮油储藏技术规范》', ' 参与起草', '国际先进', '现已上升到国家标准');
INSERT INTO `expert_results` VALUES ('683', '308', '2014-01-01', null, '中储粮企业标准《露天储粮操作规程》', ' 参与起草', '国内领先', '已由中储粮总公司发布实施');
INSERT INTO `expert_results` VALUES ('684', '308', '2013-01-01', null, '中储粮企业标准《氮气气调智能化操作规程》', ' 参与起草', '国内领先', '已由中储粮总公司发布实施');
INSERT INTO `expert_results` VALUES ('685', '309', null, null, '农业转化资金项目\n“谷物脂肪酸值测定仪的中试生产”\n', '负责', '国内领先', '实用新型专利“一种自动光度滴定仪” 专利号200920243567.6');
INSERT INTO `expert_results` VALUES ('686', '309', null, null, '中央转制科研院所项目“谷物及淀粉粘度检测技术与仪器的研究开发”', '负责', '国内先进', '');
INSERT INTO `expert_results` VALUES ('687', '309', null, null, '“十五”科技攻关\n“粮食杂质检测仪和粮食多功能滴定仪的开发”\n', '主要参与', '先进', '');
INSERT INTO `expert_results` VALUES ('688', '309', null, null, '农业转化资金项目\n“粮食多功能滴定仪的中试生产”\n', '负责', '国际领先', '外观专利“自动脂肪酸值测定仪” 专利号200930112161.X');
INSERT INTO `expert_results` VALUES ('689', '310', null, null, '移动式循环谷物烘干机研究与应用', '第二', '国内先进', '通过省级鉴定');
INSERT INTO `expert_results` VALUES ('690', '310', null, null, '低水分粮调质通风技术研究', '第一', '国内领先', '通过省级鉴定');
INSERT INTO `expert_results` VALUES ('691', '310', null, null, 'CTCD系列粮食筒仓多功能通风熏蒸减压装置', '第二', '国内领先', '通过省级鉴定');
INSERT INTO `expert_results` VALUES ('692', '310', null, null, 'CTHC系列磷化氢环流熏蒸仓外投药器', '第一', '国内领先', '通过省级鉴定');
INSERT INTO `expert_results` VALUES ('693', '311', null, null, '“十五”国家科技攻关计划重点项目《不同储粮生态区域粮食储备配套技术优化研究与示范》子课题', '东北冷湿区技术负责人', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('694', '311', null, null, '国家发改委2003年高技术产业化现代农业专项“粮食储运新技术与设备优化集成示范”项目', '项目专家组成员、东北地区技术负责人', '国内领先', '完成，获发明专利1项');
INSERT INTO `expert_results` VALUES ('695', '311', null, null, '“十五”国家科技攻关“粮食丰产科技工程”重大专项《偏高水分玉米、稻谷保质储藏技术研究与开发》子课题', '东北平原子课题负责人', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('696', '311', null, null, '“十一五”国家科技支撑计划项目《绿色储粮新技术集成示范》课题', '子课题负责人', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('697', '313', null, null, '浅圆仓建设与应用', '主要参与', '参与审图、监工、投产方案制定、保管技术应用、储备粮管理、新仓应用总结', '出色完成');
INSERT INTO `expert_results` VALUES ('698', '313', null, null, '智能化粮库建设', '主持开展', '指导完成方案优化、提升使用性', '出色完成');
INSERT INTO `expert_results` VALUES ('699', '314', null, null, '粮情检测数据分析系统应用研发', '参与', '国内领先', '正在进行');
INSERT INTO `expert_results` VALUES ('700', '315', null, null, '技术工作名称', '担任角色', '成果水平', '完成情况');
INSERT INTO `expert_results` VALUES ('701', '315', '2003-01-01', null, '谷物脂肪酸值仪的研发，研发出第一代脂肪酸质仪样机', '主持', '国内领先', '已在国内公开销售');
INSERT INTO `expert_results` VALUES ('702', '315', '2004-01-01', null, '小麦粉品质测定仪器电子粉质仪的研发', '主持', '国内领先', '已在国内公开销售');
INSERT INTO `expert_results` VALUES ('703', '315', '2007-01-01', null, '现代气调控温储粮技术扩大应用', '主持', '国内领先', '2013年度中国粮油学会科学技术奖一等奖');
INSERT INTO `expert_results` VALUES ('704', '315', '2012-01-01', null, '智能化粮库关键技术研发及集成应用示范', '参与', '国内领先', '2014年度中国粮油学会科学技术奖一等奖');
INSERT INTO `expert_results` VALUES ('705', '316', null, null, '国家自然科学基金项目面上项目<基于损伤力学的稻谷干燥品质的模拟和控制机理研究>(31271970)', '主持', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('706', '316', null, null, '中华人民共和国粮食行业标准LS/T 1202-2002《储粮机械通风技术规程》', '主持', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('707', '316', null, null, '国家“十一五”科技支撑计划项目子课题〈新型储粮通风系统的研究开发〉', '主持', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('708', '316', null, null, '2014年度国家粮食局公益性行业科研专项《粮食干燥节能综合技术》（201413006）', '主持', '', '在研');
INSERT INTO `expert_results` VALUES ('709', '317', null, null, '自动装车、码垛机', '主要研发人员', '成功研发出自动装车、码垛机。', '');
INSERT INTO `expert_results` VALUES ('710', '317', null, null, '屋面降温隔热菱镁制品', '设计人', '屋面降温隔热菱镁制品专利设计', '');
INSERT INTO `expert_results` VALUES ('711', '317', null, null, '粮仓密闭保温门', '设计人', '粮仓密闭保温门专利设计', '');
INSERT INTO `expert_results` VALUES ('712', '317', null, null, '粮仓密封窗', '设计人', '粮仓密封窗设计', '');
INSERT INTO `expert_results` VALUES ('713', '317', null, null, '基于菱镁制品降温隔热的屋面', '设计人', '基于菱镁制品降温隔热的屋面专利设计', '');
INSERT INTO `expert_results` VALUES ('714', '318', null, null, '临安市粮食收储有限公司通风及环流熏蒸', '项目经理', '', '无不良反应');
INSERT INTO `expert_results` VALUES ('715', '318', null, null, '苍南县粮食收储有限公司机械设备', '项目经理', '', '无不良反应');
INSERT INTO `expert_results` VALUES ('716', '318', null, null, '上杭县粮食收储有限公司', '项目经理', '', '无不良反应');
INSERT INTO `expert_results` VALUES ('717', '318', null, null, '中储粮分公司粮面隔热太空棉', '项目经理', '', '无不良反应');
INSERT INTO `expert_results` VALUES ('718', '319', null, null, '大枣功能性多糖研究', '主持', 'ⅲ', '论文及专利');
INSERT INTO `expert_results` VALUES ('719', '319', null, null, '基于分子机制的食物蛋白质酶解改性机理研究', '参加', '国家自然基金', '论文');
INSERT INTO `expert_results` VALUES ('720', '319', null, null, '纳米结构掺硼金刚石电极的制备及其在有机磷农药残留现场检测中的应用研究', '参加', '国家自然基金', '论文');
INSERT INTO `expert_results` VALUES ('721', '319', null, null, '真菌毒素快速检测纳米金试纸条的研制', '参加', 'ⅲ', '鉴定');
INSERT INTO `expert_results` VALUES ('722', '320', '1997-01-01', null, '中澳两国政府合作项目—中国谷物就仓干燥', '中方技术协调人', '国际先进', '');
INSERT INTO `expert_results` VALUES ('723', '320', '2001-01-01', null, '《粮食烘干机操作技术规程》行业标准', '起草人之一', '国内领先', '');
INSERT INTO `expert_results` VALUES ('724', '320', '2002-01-01', null, '国家农业科技成果转化资金项目—低温储粮综合技术中试', '主持人', '国内先进', '2项专利');
INSERT INTO `expert_results` VALUES ('725', '320', null, null, '中储粮总公司合作项目—储粮保水-机械通风自动控制技术研究', '主持人', '国际首创', '2项专利');
INSERT INTO `expert_results` VALUES ('726', '320', null, null, '北京市科技计划重大项目—农产品加工与食品制造关键技术研究与示范', '主要参与人', '国内先进', '8项专利');
INSERT INTO `expert_results` VALUES ('727', '321', '2002-01-01', null, '科技部科研院所技术开发研究专项“新型粮食就仓干燥技术与装备的研究开发”', '主持', '国内领先', '2006年获中国粮油学会科学技术奖二等奖');
INSERT INTO `expert_results` VALUES ('728', '321', '2001-01-01', null, '“十五”科技攻关“气调储粮工程关键技术与装备的研究开发”（2001BA512B03）', '参加', '国内领先', '2006年获中国粮油学会科学技术奖二等奖');
INSERT INTO `expert_results` VALUES ('729', '321', '2004-01-01', null, '“十五”攻关计划，“稻谷高效干燥与玉米储运减损增效技术开发与示范”课题（2004BA520A18）', '主持子课题研究', '国内领先', '获2009年国家科学进步二等奖');
INSERT INTO `expert_results` VALUES ('730', '321', '2009-01-01', null, '“十一五”科技支撑计划，“稻谷收获集约化干燥技术和设备研发与示范”课题（2009BADA0B03）。', '主持', '国内领先', '获1项发明专利4项实用新型专利');
INSERT INTO `expert_results` VALUES ('731', '323', null, null, '“粮食丰产科技工程”（产后领域）子课题“华北平原小麦产区农户储藏减损技术集成与示范”（2004BA520A17-02）', '主持', '国内领先', '中国粮油学会一等奖,获1项专利');
INSERT INTO `expert_results` VALUES ('732', '323', null, null, '“十一五”“粮食丰产科技工程”子课题“华北平原农户储粮减损技术集成与示范”（2006BAD02A17-2）', '主持', '国内领先', '科技部验收，获2项专利');
INSERT INTO `expert_results` VALUES ('733', '323', null, null, '国家软科学研究计划重大项目“全国粮食产后损失现状及对策研究”（2007GXS1B009）', '项目专职学术秘书', '国内领先', '科技部验收');
INSERT INTO `expert_results` VALUES ('734', '323', null, null, '公益性行业（农业）科研专项经费项目“适于不同区域农户小型贮粮设施研究与示范推广”（201003077）', '子课题主持', '国内领先', '科技部验收');
INSERT INTO `expert_results` VALUES ('735', '324', null, null, '国家“十一五”科技支撑计划：网络化多功能粮情监控集成技术和系统研究开发', '第3名', '国际先进', '河南省科技进步一等奖，中国粮油学会一等奖');
INSERT INTO `expert_results` VALUES ('736', '324', null, null, '粮食公益性行业科研专项：小麦粮堆害虫与霉菌检测传感器研究', '主持', '国内领先', '已结项');
INSERT INTO `expert_results` VALUES ('737', '324', null, null, '国家标准：《粮油储藏　粮情测控系统　第1部分：通则》', '主持', '国内领先', '已发布');
INSERT INTO `expert_results` VALUES ('738', '324', null, null, '国家863子课题：仓储霉菌在线监测技术研发和霉变指标判定', '主持', '国内领先', '在研');
INSERT INTO `expert_results` VALUES ('739', '325', null, null, '研发出基于横向通风的粮食储藏“四合一”升级新技术', '技术骨干', '国际领先', '通过国家粮食局组织的专家评审');
INSERT INTO `expert_results` VALUES ('740', '325', null, null, '储粮机械通风工艺技术参数控制模型及效能评价研究', '技术骨干', '国际先进', '正在执行');
INSERT INTO `expert_results` VALUES ('741', '325', null, null, '粮食力学特性参数与水分关系的测定研究', '项目负责人', '国内领先', '正在执行');
INSERT INTO `expert_results` VALUES ('742', '325', null, null, '吉林地区种粮大户玉米储藏设施研究及应用示范', '项目负责人', '国内领先', '正在执行');
INSERT INTO `expert_results` VALUES ('743', '326', null, null, '《石墨炉原子吸收法测定粮食中微量镉的研究》黑龙江省教育厅高职高专课题', '主持', '一般水平', '');
INSERT INTO `expert_results` VALUES ('744', '326', null, null, '《热喷秸秆与颗粒饲料的设备与工艺研究》黑龙江省教育厅高职高专课题', '参与', '一般水平', '');
INSERT INTO `expert_results` VALUES ('745', '327', null, null, 'FZX防破碎自流式卸料器的研究', '主持', '国内领先', '已鉴定');
INSERT INTO `expert_results` VALUES ('746', '327', null, null, '国储库建设项目烘干机成套设备竞标工作', '主设', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('747', '327', null, null, '粮食通风干燥技术与设备', '参加', '国内领先', '已鉴定');
INSERT INTO `expert_results` VALUES ('748', '327', null, null, '农户科学储粮专项储粮仓仓型设计', '主设', '国内先进', '获实用新型专利');
INSERT INTO `expert_results` VALUES ('749', '328', null, null, '国家农业综合开发办公室“仙桃市210吨鹅肥肝加工扩建项目”', '参加，排名第二', '国内领先', '');
INSERT INTO `expert_results` VALUES ('750', '328', null, null, '克明面业股份公司“挂面流通中储藏保鲜技术”', '主持，排名第一', '国内领先', '');
INSERT INTO `expert_results` VALUES ('751', '328', null, null, '湖北省优质稻储藏技术研究', '参加，排名第二', '国内领先', '');
INSERT INTO `expert_results` VALUES ('752', '328', null, null, '储粮机械通风工艺技术参数控制模型及效能评价研究——华中储粮通风系统效能评价技术研究', '主持，排名第一', '', '');
INSERT INTO `expert_results` VALUES ('753', '329', '1999-01-01', null, '“储粮昆虫及螨类识别与防治专家咨询系统(GPIC)”的研究与开发', '参加', '国内领先', '获得国家粮食储备局科技进步三等奖');
INSERT INTO `expert_results` VALUES ('754', '329', null, '2006-01-01', '减少三大粮食作物农户储粮损失技术集成与示范', '参加', '国内领先', '中国粮油学会2007年度“科技进步一等奖”');
INSERT INTO `expert_results` VALUES ('755', '330', null, null, '科技部社会公益专项“我国储粮害虫、微生物、污染物调查监测预报及防治”', '参加', '国内领先', '中国粮油学会科学技术奖一等奖');
INSERT INTO `expert_results` VALUES ('756', '330', null, null, '国家发改委项目“粮食储运新技术及设备优化集成示范”', '参加', '国内领先', '');
INSERT INTO `expert_results` VALUES ('757', '330', null, null, '十一五国家科技支撑计划“网络化多功能粮情监控集成技术和系统研究开发”', '参加', '国内领先', '中国粮油学会科学技术奖一等奖');
INSERT INTO `expert_results` VALUES ('758', '331', null, null, '二氧化碳气调储粮项目', '主持', '国内领先', '2005年度中国粮油学会科学技术奖二等奖');
INSERT INTO `expert_results` VALUES ('759', '331', '2003-01-01', null, '我国储粮害虫微生物污染物调查监测预报防治', '主持', '国内领先', '2008年中国粮油科技进步一等奖');
INSERT INTO `expert_results` VALUES ('760', '331', null, null, '储粮害虫防治新技术开发基地示范', '主持', '国内领先', '通过验收');
INSERT INTO `expert_results` VALUES ('761', '331', '2010-01-01', null, '粮食储备“四合一”新技术研究开发与集成创新成果', '参与', '国内领先', '2010年度国家科技进步一等奖');
INSERT INTO `expert_results` VALUES ('762', '332', '2010-01-01', null, '增城丝苗米精加工品质控制关键技术与产业化研究', '项目主持', '国内领先', '已结题，获专利授权1项。');
INSERT INTO `expert_results` VALUES ('763', '332', '2010-01-01', null, '广东省泰稷稻米加工农业科技创新中心', '项目主持', '国内领先', '已结题');
INSERT INTO `expert_results` VALUES ('764', '332', '2009-01-01', null, '南方米粉制品品质改良及安全生产关键技术研究 ', '项目主持', '国内领先', '已结题，获专利授权2项，中国粮油学会科技进步二等奖。');
INSERT INTO `expert_results` VALUES ('765', '332', '2009-01-01', null, '广东省优质稻米标准技术成果的开发应用', '项目主持', '国内领先', '已结题');
INSERT INTO `expert_results` VALUES ('766', '332', '2007-01-01', null, '广东省水稻产业化关键技术研究与示范', '项目主持', '国内领先', '已结题');
INSERT INTO `expert_results` VALUES ('767', '333', '0014-01-01', null, '外墙涂料喷涂自动化', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('768', '334', null, null, '国家基础平台项目，研究建立我国《粮油仓储技术标准体系》', '第二负责人', '国内首次', '建立了我国《粮油仓储技术标准体系》');
INSERT INTO `expert_results` VALUES ('769', '334', null, null, '国家科技基础条件平台工作项目:重大粮油仓储基础标准研究，课题二：重要粮油仓储标准研究与制定', '总项目第二负责人；\n课题一负责人', '国内首次', '完成《粮油储藏技术规范》、《粮油仓储规范化管理水平评定体系》等重要行业标准的制（修）订]已发布实施');
INSERT INTO `expert_results` VALUES ('770', '334', null, null, '国家粮食储备四合一技术研究', '主要参加人员', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('771', '334', null, null, '国标制定：粮油储藏技术规范', '第一起草人', '国内首次', '已发布实施');
INSERT INTO `expert_results` VALUES ('772', '335', '2008-01-01', null, '氮气气调储粮技术应用工程', '参加', '国内领先', '2013年中国粮油科技进步一等奖');
INSERT INTO `expert_results` VALUES ('773', '335', '2003-01-01', null, '我国储粮害虫微生物污染物调查监测预报防治', '参加', '国内领先', '2008年中国粮油科技进步一等奖');
INSERT INTO `expert_results` VALUES ('774', '335', '2005-01-01', null, '减少三大粮食作物农户储粮损失技术集成与示范', '参加', '国内领先', '2007年中国粮油科技进步一等奖');
INSERT INTO `expert_results` VALUES ('775', '335', '2005-01-01', null, '农业部农药登记药效试验-卫生杀虫剂', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('776', '337', '2008-01-01', null, '现代氮气气调控温储粮技术应用工程项目', '参加', '国内领先', '2013年中国粮油学会科学技术奖一等奖');
INSERT INTO `expert_results` VALUES ('777', '337', '2005-01-01', null, '粮食仓储行业淘汰甲基溴国际援助项目（调研、教材编制、库存甲基溴处理、监督管理等子项目）', '主要参与', '国内领先', '2007年中国粮油科技进步一等奖');
INSERT INTO `expert_results` VALUES ('778', '337', '2003-01-01', null, '我国储粮害虫微生物污染物调查监测预报防治', '参加', '国内领先', '2008年中国粮油学会科学技术奖一等奖');
INSERT INTO `expert_results` VALUES ('779', '338', null, null, '储粮有害生物绿色防控技术研发与推广应用', '主持', '国内先进', '已结题');
INSERT INTO `expert_results` VALUES ('780', '338', null, null, '转基因粮食快速检测技术研究与开发', '主持', '国内先进', '已结题');
INSERT INTO `expert_results` VALUES ('781', '338', null, null, '稻谷储藏品质特性参数数字化模拟技术研究与应用', '参加', '', '');
INSERT INTO `expert_results` VALUES ('782', '339', null, null, '技术工作名称', '担任角色', '成果水平', '完成情况');
INSERT INTO `expert_results` VALUES ('783', '339', null, null, '储藏物昆虫生物学及生物防治研究', '参加', '国内领先', '湖北省科技进步三等奖');
INSERT INTO `expert_results` VALUES ('784', '339', null, null, '新型生物农药蛇床子素创制及其控制储粮/蔬菜病虫害应用', '参加', '国际先进', '湖北省科技进步三等奖');
INSERT INTO `expert_results` VALUES ('785', '340', null, null, '微胶囊谷物保护剂“储粮安”的研制及药效试验', '参加', '该产品属国内首家研制，已申报发明专利，总体水平处于国内先进水平。', '项目于1999年10月通过鉴定');
INSERT INTO `expert_results` VALUES ('786', '340', null, null, '农村储粮防虫、防鼠关键技术研究与示范', '参加', '获得实用新型专利1项，制定技术标准4项', '项目于2010年10月通过国家科技部验收');
INSERT INTO `expert_results` VALUES ('787', '340', null, null, '国家储备大米气调储藏关键技术研究与应用示范', '参加', '专家组意见：该项目解决的技术关键问题清晰，技术路线科学合理', '项目于2012年1月通过验收');
INSERT INTO `expert_results` VALUES ('788', '341', null, null, '中澳储粮害虫磷化氢抗性研究和治理', '参与/项目技术负责人', '国际先进', '通过中国国家粮食局和澳大利亚国际农业研究中心的联合验收');
INSERT INTO `expert_results` VALUES ('789', '341', null, null, '食品级硅藻土和食品级惰性粉物理防治储粮害虫新技术研发和示范', '项目负责人', '国际领先', '通过中国国家粮食局和科技部的验收');
INSERT INTO `expert_results` VALUES ('790', '341', null, null, '研发出基于膜分离制氮充环新工艺的氮气气调储粮新技术', '项目负责人', '国际领先', '通过中储粮总公司和国家粮食局和科技部的验收');
INSERT INTO `expert_results` VALUES ('791', '341', null, null, '研发出基于横向通风的粮食储藏“四合一”升级新技术', '项目负责人', '国际领先', '通过国家粮食局组织的专家评审');
INSERT INTO `expert_results` VALUES ('792', '342', null, null, '国家科技支撑项目：储粮粮情关键因子调控及害虫生物防治技术的研究与示范', '子课题主持', '国内领先', '完成,发明专利1项');
INSERT INTO `expert_results` VALUES ('793', '342', null, null, '广东省科技计划项目：国家储备粮控温储藏保鲜关键计划研究与示范', '主持', '国内先进', '已完成并通过项目验收');
INSERT INTO `expert_results` VALUES ('794', '342', null, null, '广东省科技计划项目：国家储备大米气调储藏关键技术研究与应用示范', '主持', '国内先进', '已完成并通过项目验收');
INSERT INTO `expert_results` VALUES ('795', '343', null, null, '传染病核酸诊断试剂的研制', '独立', '国际先进', '6个诊断试剂盒已注册申药证书');
INSERT INTO `expert_results` VALUES ('796', '343', null, null, '国家自然科学基金面上项目“西方马脑炎在我国传播循环的实验研究”', '主持', '国际先进', 'SCI论文1篇');
INSERT INTO `expert_results` VALUES ('797', '343', null, null, '“重要病媒生物抗性基因特异性快速检测试剂盒的研制”', '独立', '国际先进', '专利1项，SCI论文1篇');
INSERT INTO `expert_results` VALUES ('798', '343', null, null, '传入性新发传染病的媒介生物研究。', '独立', '国际先进', 'SCI论文2篇');
INSERT INTO `expert_results` VALUES ('799', '344', null, null, '科研院所技术开发研究专项“磷化氢低温减压气调熏蒸装备及配套技术研究”', '主持', '国内先进', '发明专利《一种熏蒸剂及其制备方法和应用》');
INSERT INTO `expert_results` VALUES ('800', '344', null, null, '重大仪器研发专项“检验检疫领域应用研究项目”', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('801', '344', null, null, '公益专项“简易熏蒸库建筑及检测技术规范”', '主持', '国内领先', '国标《溴甲烷简易熏蒸库建筑及检测技术规范》');
INSERT INTO `expert_results` VALUES ('802', '345', null, null, '500亿斤中央直属储备粮库储粮工艺设计', '主持环流熏蒸系统设计', '国际先进', '完成并实施');
INSERT INTO `expert_results` VALUES ('803', '345', null, null, '“十五”国家重大科技专项“食品安全关键技术应用的综合示范”', '子课题主持', '国内领先', '验收');
INSERT INTO `expert_results` VALUES ('804', '345', null, null, '高大平房仓磷化氢间歇施药环流熏蒸杀虫技术研究', '主持', '国内领先', '鉴定');
INSERT INTO `expert_results` VALUES ('805', '345', null, null, 'GB/T 22498-2008 粮油储藏 防护剂使用准则', '主持', '国家标准', '颁布');
INSERT INTO `expert_results` VALUES ('806', '346', null, null, '稻谷、小麦、玉米保质储藏与虫霉监测新技术的研究与开发', '主持人', '国内领先', '获专利及奖励');
INSERT INTO `expert_results` VALUES ('807', '347', null, null, '国家支撑计划', '子课题主持', '达到国内先进水平', '');
INSERT INTO `expert_results` VALUES ('808', '347', null, null, '国家支撑计划', '子子课题主持', '', '');
INSERT INTO `expert_results` VALUES ('809', '347', null, null, '国家公益项目', '子子课题主持', '', '');
INSERT INTO `expert_results` VALUES ('810', '347', null, null, '储粮害虫教学', '主讲', '', '');
INSERT INTO `expert_results` VALUES ('811', '348', '2006-01-01', null, '“十一五”科技支撑（攻关）计划“粮食丰产科技工程” 子课题“农村储粮防虫防鼠关键技术研究与示范”', '参与', '国内领先', '申请专利2个，发表论文3篇');
INSERT INTO `expert_results` VALUES ('812', '348', '2006-01-01', null, '“十一五”科技支撑（攻关）计划“粮食丰产科技工程” 子课题“长江中下游平原农户储粮减损技术集成与示范', '参与', '国内领先', '申请专利2个，发表论文3篇');
INSERT INTO `expert_results` VALUES ('813', '349', null, null, '粮库储粮害虫监测技术研究与示范', '主要参加人', '国际先进', '国家科技部验收');
INSERT INTO `expert_results` VALUES ('814', '349', null, null, '农村储粮防虫、防鼠关键技术研究与示范', '主要参加人', '国内领先', '国家科技部验收');
INSERT INTO `expert_results` VALUES ('815', '349', null, null, '嗜虫书虱PBAN类似基因及其对信息素合成的调控', '项目负责人', '国家自然基金项目', '国家基金委验收');
INSERT INTO `expert_results` VALUES ('816', '350', null, null, '中国储粮害虫资源库及信息查询系统', '项目负责人', '', '通过验收');
INSERT INTO `expert_results` VALUES ('817', '350', null, null, '我国储粮害虫、微生物、污染物调查监测预报及防治', '主研', '国内领先', '通过验收');
INSERT INTO `expert_results` VALUES ('818', '351', null, null, '全国粮食行业公益性项目储备粮库物联网示范', '项目负责人', '', '');
INSERT INTO `expert_results` VALUES ('819', '351', null, null, '四川省粮食丰产工程领导小组办公室', '工作人员', '', '');
INSERT INTO `expert_results` VALUES ('820', '352', null, null, '粮食安全储存主要指标与标准研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('821', '352', null, null, '储粮有害物质快速测定技术研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('822', '352', null, null, '粮食中麦角甾醇含量检测技术体系建立与研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('823', '352', null, null, '小麦新陈快速鉴别方法的研究', '主持', '国内领先', '申报专利');
INSERT INTO `expert_results` VALUES ('824', '353', null, null, '国家标准修订', '主要研究人员', ' GB/T22515-2008粮油名词术语粮食、油料及其加工产品', '标准发布');
INSERT INTO `expert_results` VALUES ('825', '353', null, null, '国家标准修订', '主要研究人员', 'GB/T 25221-2010 粮油检验 粮食中麦角甾醇的测定 正相高效液相色谱法', '标准发布');
INSERT INTO `expert_results` VALUES ('826', '353', null, null, '国家标准修订', '主要研究人员', 'GB/T5508-2011粮油检验粉类粮食含砂量测定', '标准发布');
INSERT INTO `expert_results` VALUES ('827', '353', null, null, '国家标准修订', '主要研究人员', ' GB/T5510-2011粮油检验粮食、油料脂肪酸值测定', '标准发布');
INSERT INTO `expert_results` VALUES ('828', '354', null, null, '组建“江苏省研究生工作站”', '   参与', '      省内领先', '   通过验收');
INSERT INTO `expert_results` VALUES ('829', '354', null, null, '组建“镇江市粮油工程技术中心”', '   主持', '      省内领先', '   通过验收');
INSERT INTO `expert_results` VALUES ('830', '355', null, null, '863项目子课题“小麦储藏物流微环境多元参数优化与综合控制技术研究(2012AA101705-2)', '第二主持', '', '在研');
INSERT INTO `expert_results` VALUES ('831', '355', null, null, '国家十一五科技支撑：大米储藏保鲜品质指标与评价方法研究2006BAD08B04-3', '主持', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('832', '355', null, null, '国家十五科技攻关新粮（稻谷和玉米）快速判别技术研究与仪器开发2004BA523A07', '主持', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('833', '355', null, null, '国家标准：粮食、油料的色泽、气味、口味鉴定GBT 5492-2008', '主持', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('834', '355', null, null, '国家质量技术监督局项目：稻谷新鲜度的判定方法的标准制定，2002年通过国家粮食局组织的验收。', '主持', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('835', '356', '2002-01-01', null, '横向课题“降血脂功能红曲的研究与开发”', '主持', '国际先进、国内领先', '成果转让');
INSERT INTO `expert_results` VALUES ('836', '356', '2007-01-01', null, '北京市科委重大项目“延庆县葡萄酒庄园产业化示范工程—葡萄酒庄园发展模式及关键技术研究”', '参加', '国际先进、国内领先', '1篇专利');
INSERT INTO `expert_results` VALUES ('837', '356', '2012-01-01', null, '北京市科技计划课题“粮油原料中主要真菌毒素检测及控制技术研究及应用示范”', '参加', '国内先进', '3篇专利；\n2014年度中国粮油学会科学技术二等奖');
INSERT INTO `expert_results` VALUES ('838', '356', '2012-01-01', null, '中粮集团科技项目“食品沙门氏菌和金黄色葡萄球菌检测及污染分析的研究”', '主持', '国内领先', '7篇专利');
INSERT INTO `expert_results` VALUES ('839', '356', '2012-01-01', null, '国家科技支撑计划“粮油作物中产毒真菌和真菌毒素检测控制技术及装置研究”', '主持', '国内先进', '2篇专利（申请中）');
INSERT INTO `expert_results` VALUES ('840', '357', '2003-01-01', null, '《谷物脂肪酸值测定仪研制》', '主研', '国内领先', '获奖科技进步三等奖/专利');
INSERT INTO `expert_results` VALUES ('841', '357', '2004-01-01', null, '国家标准《玉米储存品质判定规则》', '主要起草人', '国内领先', '/');
INSERT INTO `expert_results` VALUES ('842', '357', '2006-01-01', null, '国家标准《大米 稻谷和糙米潜在出米率的测定》', '主要起草人', '国内领先', '/');
INSERT INTO `expert_results` VALUES ('843', '357', '2006-01-01', null, '国家标准《小麦》GB1351-2009', '主要起草人', '国内领先', '/');
INSERT INTO `expert_results` VALUES ('844', '358', null, null, '茶叶中农药残留分析方法研究及技术推广', '项目主持人', '在中粮集团业务单元推广使用', '完成');
INSERT INTO `expert_results` VALUES ('845', '358', null, null, '牛奶中酵母葡聚糖的分析技术开发', '项目主持人', '在中粮集团业务单元推广使用', '完成');
INSERT INTO `expert_results` VALUES ('846', '358', null, null, '葡萄酒质量控制技术研究', '项目主持人', '正在中粮集团业务单元推广使用', '完成');
INSERT INTO `expert_results` VALUES ('847', '359', null, null, '《粮油专业过程式多元化学习评价体系的研究》黑龙江省高等教育教学改革项目', '主持', '一般水平', '');
INSERT INTO `expert_results` VALUES ('848', '359', null, null, '《利用米饭质构特性评价大米食用品质的方法研究》黑龙江省教育厅高职高专课题', '主持', '一般水平', '');
INSERT INTO `expert_results` VALUES ('849', '359', null, null, '《利用生物技术制备大豆活性纤维的研究》黑龙江省科技厅项目', '参与', '省先进', '');
INSERT INTO `expert_results` VALUES ('850', '359', null, null, '《把价值观教育渗透到学生的学习生涯中的研究与实验》全国教育科学“十一五”规划课题教育部重点课题', '参与', '国内先进', '');
INSERT INTO `expert_results` VALUES ('851', '360', '2007-01-01', null, '国家农转资金项目--《粮食多功能滴定仪的中试生产》', '项目负责人,主持完成了粮食多功能滴定仪的中试生产项目', '国内领先', '已通过验收，已上市销售,提高了仪器的稳定性和测定数据的准确性，提高仪器的精度、抗干扰能力。');
INSERT INTO `expert_results` VALUES ('852', '360', '2007-01-01', null, '小麦粉品质测定仪器--电子拉伸仪的开发', '参加完成了面团电子拉伸仪开发，主要负责测量软件和电控系统的具体实施。', '国内先进', '已通过验收，目前已上市销售；获得专利一项。');
INSERT INTO `expert_results` VALUES ('853', '360', '2010-01-01', null, '科研院所专项资金项目——谷物及淀粉粘度检测技术与仪器的研究开发', '独立完成了该项目的申报工作，主要负责制定了具体实施方案，并独立完成了粘度测量软件的设计和编写。', '国内领先', '已完成，准备验收。');
INSERT INTO `expert_results` VALUES ('854', '362', '2004-01-01', null, '粮食杂质检测及自动滴定技术研究与开发', '主持', '国际先进', '获两项实用新型专利');
INSERT INTO `expert_results` VALUES ('855', '362', '2006-01-01', null, '成品粮品质快速测定技术与仪器研究与开发', '参加', '国内先进', '获一项实用新型专利');
INSERT INTO `expert_results` VALUES ('856', '362', '2007-01-01', null, '粮食多功能滴定仪的中试生产', '主持', '国际先进', '获一项实用新型专利');
INSERT INTO `expert_results` VALUES ('857', '362', '2011-01-01', null, '检测稻谷整精米用实验室小型碾米机的开发', '主持', '国际领先', '获两项实用新型专利');
INSERT INTO `expert_results` VALUES ('858', '363', null, null, '高粱国家标准', '主要起草人', '国内领先', '颁布施行');
INSERT INTO `expert_results` VALUES ('859', '363', null, null, '原产地域产品 盘锦大米', '主要起草人', '国内领先', '颁布施行');
INSERT INTO `expert_results` VALUES ('860', '363', null, null, '玉米储存品质判定规则', '主要起草人', '国内领先', '颁布施行');
INSERT INTO `expert_results` VALUES ('861', '363', null, null, '东北平原农户储粮减损技术集成与示范', '主持', '国内领先', '通过验收');
INSERT INTO `expert_results` VALUES ('862', '364', null, null, '“大豆”等20余项国家标准制修订', '主持', '国内领先', '发布实施');
INSERT INTO `expert_results` VALUES ('863', '364', null, null, '国家科技支撑计划子课题大豆油料油品绿色安全生产、储藏品质安全控制及监测关键技术示范研究', '主持', '国内领先', '通过验收');
INSERT INTO `expert_results` VALUES ('864', '364', null, null, '粮食行业公益性专项“粮油真实性表征技术研究”', '主持', '', '进行中');
INSERT INTO `expert_results` VALUES ('865', '364', null, null, '国家科技支撑计划课题“粮油收购数字化质量安全检测技术研究”', '主持', '', '进行中');
INSERT INTO `expert_results` VALUES ('866', '366', null, null, '科技部十二五科技支撑“粮油中有毒有害物质检测、控制及安全性评价研究”', '项目参与', '国内领先', '研制了粮油中黄曲霉毒素降解菌株');
INSERT INTO `expert_results` VALUES ('867', '366', null, null, '中粮饲料主要原料近红外光谱检测模型构建', '项目主持人', '国内领先', '建立了10种不同原料的近红外快速检测理化指标模型');
INSERT INTO `expert_results` VALUES ('868', '367', '0014-01-01', null, '外墙涂料喷涂自动化', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('869', '368', null, null, '国家科技支撑项目：储粮粮情关键因子调控及害虫生物防治技术的研究与示范', '子课题主持', '国内领先', '完成,发明专利1项');
INSERT INTO `expert_results` VALUES ('870', '368', null, null, '广东省科技计划项目：国家储备粮控温储藏保鲜关键计划研究与示范', '主持', '国内先进', '已完成并通过项目验收');
INSERT INTO `expert_results` VALUES ('871', '368', null, null, '广东省科技计划项目：国家储备大米气调储藏关键技术研究与应用示范', '主持', '国内先进', '已完成并通过项目验收');
INSERT INTO `expert_results` VALUES ('872', '369', null, null, '粮食安全储存主要指标与标准研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('873', '369', null, null, '储粮有害物质快速测定技术研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('874', '369', null, null, '粮食中麦角甾醇含量检测技术体系建立与研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('875', '369', null, null, '小麦新陈快速鉴别方法的研究', '主持', '国内领先', '申报专利');
INSERT INTO `expert_results` VALUES ('876', '370', '0014-01-01', null, '外墙涂料喷涂自动化', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('877', '371', null, null, '国家科技支撑项目：储粮粮情关键因子调控及害虫生物防治技术的研究与示范', '子课题主持', '国内领先', '完成,发明专利1项');
INSERT INTO `expert_results` VALUES ('878', '371', null, null, '广东省科技计划项目：国家储备粮控温储藏保鲜关键计划研究与示范', '主持', '国内先进', '已完成并通过项目验收');
INSERT INTO `expert_results` VALUES ('879', '371', null, null, '广东省科技计划项目：国家储备大米气调储藏关键技术研究与应用示范', '主持', '国内先进', '已完成并通过项目验收');
INSERT INTO `expert_results` VALUES ('880', '372', null, null, '粮食安全储存主要指标与标准研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('881', '372', null, null, '储粮有害物质快速测定技术研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('882', '372', null, null, '粮食中麦角甾醇含量检测技术体系建立与研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('883', '372', null, null, '小麦新陈快速鉴别方法的研究', '主持', '国内领先', '申报专利');
INSERT INTO `expert_results` VALUES ('884', '373', '0014-01-01', null, '外墙涂料喷涂自动化', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('885', '374', null, null, '国家科技支撑项目：储粮粮情关键因子调控及害虫生物防治技术的研究与示范', '子课题主持', '国内领先', '完成,发明专利1项');
INSERT INTO `expert_results` VALUES ('886', '374', null, null, '广东省科技计划项目：国家储备粮控温储藏保鲜关键计划研究与示范', '主持', '国内先进', '已完成并通过项目验收');
INSERT INTO `expert_results` VALUES ('887', '374', null, null, '广东省科技计划项目：国家储备大米气调储藏关键技术研究与应用示范', '主持', '国内先进', '已完成并通过项目验收');
INSERT INTO `expert_results` VALUES ('888', '375', null, null, '粮食安全储存主要指标与标准研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('889', '375', null, null, '储粮有害物质快速测定技术研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('890', '375', null, null, '粮食中麦角甾醇含量检测技术体系建立与研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('891', '375', null, null, '小麦新陈快速鉴别方法的研究', '主持', '国内领先', '申报专利');
INSERT INTO `expert_results` VALUES ('892', '376', '0014-01-01', null, '外墙涂料喷涂自动化', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('893', '377', null, null, '国家科技支撑项目：储粮粮情关键因子调控及害虫生物防治技术的研究与示范', '子课题主持', '国内领先', '完成,发明专利1项');
INSERT INTO `expert_results` VALUES ('894', '377', null, null, '广东省科技计划项目：国家储备粮控温储藏保鲜关键计划研究与示范', '主持', '国内先进', '已完成并通过项目验收');
INSERT INTO `expert_results` VALUES ('895', '377', null, null, '广东省科技计划项目：国家储备大米气调储藏关键技术研究与应用示范', '主持', '国内先进', '已完成并通过项目验收');
INSERT INTO `expert_results` VALUES ('896', '378', null, null, '粮食安全储存主要指标与标准研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('897', '378', null, null, '储粮有害物质快速测定技术研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('898', '378', null, null, '粮食中麦角甾醇含量检测技术体系建立与研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('899', '378', null, null, '小麦新陈快速鉴别方法的研究', '主持', '国内领先', '申报专利');
INSERT INTO `expert_results` VALUES ('900', '379', '0014-01-01', null, '外墙涂料喷涂自动化', '主持', '国内先进', '');
INSERT INTO `expert_results` VALUES ('901', '380', null, null, '国家科技支撑项目：储粮粮情关键因子调控及害虫生物防治技术的研究与示范', '子课题主持', '国内领先', '完成,发明专利1项');
INSERT INTO `expert_results` VALUES ('902', '380', null, null, '广东省科技计划项目：国家储备粮控温储藏保鲜关键计划研究与示范', '主持', '国内先进', '已完成并通过项目验收');
INSERT INTO `expert_results` VALUES ('903', '380', null, null, '广东省科技计划项目：国家储备大米气调储藏关键技术研究与应用示范', '主持', '国内先进', '已完成并通过项目验收');
INSERT INTO `expert_results` VALUES ('904', '381', null, null, '粮食安全储存主要指标与标准研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('905', '381', null, null, '储粮有害物质快速测定技术研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('906', '381', null, null, '粮食中麦角甾醇含量检测技术体系建立与研究', '主持', '国内领先', '形成标准');
INSERT INTO `expert_results` VALUES ('907', '381', null, null, '小麦新陈快速鉴别方法的研究', '主持', '国内领先', '申报专利');
INSERT INTO `expert_results` VALUES ('908', '382', null, null, '技术工作名称', '担任角色', '成果水平', '完成情况');
INSERT INTO `expert_results` VALUES ('909', '383', null, null, '技术工作名称', '担任角色', '成果水平', '完成情况');
INSERT INTO `expert_results` VALUES ('910', '385', null, null, '食用植物性产品快速检测技术', '主持', '国内领先', '国家标准1项');
INSERT INTO `expert_results` VALUES ('911', '385', null, null, '进出口食用农产品中溴螨酯、双草醚残留的测定', '主持', '国际领先', '授权专利1项');
INSERT INTO `expert_results` VALUES ('912', '385', null, null, '甘薯、大蒜系列产品研发', '主持', '国内领先', '授权专利6项');
INSERT INTO `expert_results` VALUES ('913', '385', null, null, '油条中PAHs的来源、迁移与高温生成机理', '主持', '国际领先', '国际埃尼奖提名');
INSERT INTO `expert_results` VALUES ('914', '386', null, null, '长江学者特聘教授', '主持', '', '进行');
INSERT INTO `expert_results` VALUES ('915', '386', null, null, '木质纤维素生产功能糖产品及其综合利用', '主持', '国际先进', '专利、论文');
INSERT INTO `expert_results` VALUES ('916', '386', null, null, '玉米芯高效转化功能性糖技术应用示范', '主持', '国际先进', '专利、论文、工艺路线');
INSERT INTO `expert_results` VALUES ('917', '386', null, null, '利用纤维质材料发酵生产乳酸的放大基础研究', '主持', '国内领先', '专利、论文');
INSERT INTO `expert_results` VALUES ('918', '387', null, null, 'MTX-250型馒头自动生产线', '主持人', '国内领先', '河南省科技进步二等奖');
INSERT INTO `expert_results` VALUES ('919', '387', null, null, '小麦大面积高产综合配套技术开发与示范', '主持人', '国内先进', '河南省科技进步奖一等奖');
INSERT INTO `expert_results` VALUES ('920', '387', null, null, 'GSX-50型谷物食品生产线', '主持人', '国内先进', '河南省科技进步奖二等奖');
INSERT INTO `expert_results` VALUES ('921', '387', null, null, '馒头连续流加发酵及醒蒸一体化技术开发推广与示范', '主持人', '国内领先', '国家发明专利');
INSERT INTO `expert_results` VALUES ('922', '388', '2004-01-01', null, '面制品工艺技术开发', '主持', '国内领先', '郑州市科学技术进步奖');
INSERT INTO `expert_results` VALUES ('923', '388', '2004-01-01', null, '面制品保鲜工艺技术研发', '主持', '国际领先', '中国粮油科技进步奖；保鲜工艺技术被鉴定为“国家领先\"水平');
INSERT INTO `expert_results` VALUES ('924', '388', '2005-01-01', null, '《小麦粉馒头》国家标准起草', '参与', '国内领先', '');
INSERT INTO `expert_results` VALUES ('925', '388', '2010-01-01', null, '国家《粮食加工业发展规划》起草', '参与', '首次明确“主食”的定义', '');
INSERT INTO `expert_results` VALUES ('926', '389', null, null, '羟丙基糯米淀粉制备及其在速冻汤圆中的应用研究', '主持', '国内领先', '河南省工业和信息化科技成果二等奖');
INSERT INTO `expert_results` VALUES ('927', '389', null, null, '糯米粉增值技术研究', '主持', '国内领先', '河南省科技进步三等奖');
INSERT INTO `expert_results` VALUES ('928', '389', null, null, '国产大麦麦精和皮渣膳食纤维生产技术的研究与开发', '主持', '国际先进', '专利：“国产大麦原料通过预处理提高麦精品质的方法”, 专利号：ZL200810024035.8');
INSERT INTO `expert_results` VALUES ('929', '389', null, null, '利用小麦麸高效生产功能性食品的关键技术研究', '参加', '国内领先', '湖北省科技进步二等奖');
INSERT INTO `expert_results` VALUES ('930', '392', '2014-01-01', null, '连续换向均质化鲜面带成型工艺及装备研究', '主持', '国际领先', '荣获国家专利8项');
INSERT INTO `expert_results` VALUES ('931', '392', '2011-01-01', null, 'DFD-V智能化仿生馒头生产线项目', '主持', '国际领先', '获国家专利13项，该生产线被鉴定为“国际领先水平');
INSERT INTO `expert_results` VALUES ('932', '392', '2012-01-01', null, '年产500套智能化馒头生产线加工基地及其应用示范项目', '主持', '国内领先', '获国家专利7项');
INSERT INTO `expert_results` VALUES ('933', '392', '2013-01-01', null, '面制主食加工技术示范推广', '主持', '国内领先', '');
INSERT INTO `expert_results` VALUES ('934', '393', null, null, '河南省攻关项目“新型面制主食—蒸烤馒头的开发”', '主持人', '国内领先', '通过鉴定');
INSERT INTO `expert_results` VALUES ('935', '393', null, null, '河南省重点攻关项目“面食风味发酵剂的开发与应用”', '主持人', '', '');
INSERT INTO `expert_results` VALUES ('936', '394', null, null, '“十一五”农产品物流包装与标准化', '项目主持人', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('937', '394', null, null, '国家自然科学基金项目：小麦储存过程中的变化研究', '项目主持人', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('938', '394', null, null, '973前期研究专项：国库储备粮品质劣变研究', '项目主持人', '国内领先', '获得“中国粮油学会科学技术奖”二等奖');
INSERT INTO `expert_results` VALUES ('939', '394', null, null, '面粉加工品质的评定方法与品质改良', '项目主持人', '国内领先', '完成');
INSERT INTO `expert_results` VALUES ('940', '395', '2006-01-01', null, '新北京特产——京八件研发产销项目', '项目主管', '国内领先', '获得北京市工业促进局认可，并获得经费200万');
INSERT INTO `expert_results` VALUES ('941', '395', '2007-01-01', null, '奥运食品产品开发项目', '项目副主管', '国内领先', '北京市商务局认可，并获得经费100万');
INSERT INTO `expert_results` VALUES ('942', '395', '2008-01-01', null, '传统热食点心的研发及产销项目', '项目主管', '国内领先', '获得北京市工业促进局认可，并获得经费120万');
INSERT INTO `expert_results` VALUES ('943', '395', '0009-01-01', null, '二十四节气新产品研发项目', '项目主管', '国内领先', '获得北京市商务局认可，并获得经费50万');
INSERT INTO `expert_results` VALUES ('944', '397', null, null, '鱼米复合制品生产技术研究', '排名第1', '国际先进', '通过成果鉴定');
INSERT INTO `expert_results` VALUES ('945', '397', null, null, '粮食储藏害虫和霉菌的微波防治技术研究', '排名第2', '国际先进', '通过成果鉴定');
INSERT INTO `expert_results` VALUES ('946', '397', null, null, '米饭的品质评价与智能电饭煲的研发', '排名第2', '国际先进', '通过成果鉴定');
INSERT INTO `expert_results` VALUES ('947', '397', null, null, '传统米发糕的现代加工技术', '排名第2', '国际先进', '通过成果鉴定');
INSERT INTO `expert_results` VALUES ('948', '398', null, null, '国家自然基金资助项目《小麦蒸煮品质特性及鉴定方法研究》', '主持人', '国内领先', '已发表文章');
INSERT INTO `expert_results` VALUES ('949', '398', null, null, '近红外光谱技术在作物品质分析中的应用研究', '副主持人', '国内领先', '中国农科院科技进步二等奖；');
INSERT INTO `expert_results` VALUES ('950', '398', null, null, '国家现代农业产业技术体系子课题—“优质麦品质检测及监控技术体系研究”，主持人', '主持人', '', '进行中');
INSERT INTO `expert_results` VALUES ('951', '398', null, null, '无公害农产品质量安全监测项目，主要负责人', '主持人', '', '进行中');
INSERT INTO `expert_results` VALUES ('952', '399', null, null, '三麦新型加工关键技术研究及系列面制品开发与示范', '主持', '国内先进', '正在进行');
INSERT INTO `expert_results` VALUES ('953', '399', null, null, '农业部燕麦荞麦产业技术体系', '主持', '国内先进', '正在进行');
INSERT INTO `expert_results` VALUES ('954', '399', null, null, '燕麦食品产业化关键技术研究与示范', '主持', '国际先进', '成果已鉴定');
INSERT INTO `expert_results` VALUES ('955', '399', null, null, '谷蛋白溶涨指数遗传变异及与品质关系', '主持', '国际先进', '成果已鉴定');
INSERT INTO `expert_results` VALUES ('956', '400', '2002-01-01', null, '学会学术交流', '学会主办的大型学术会议的组织接待工作、展览等会务，负责大会论文集的编辑出版工作', '', '出版会议论文集10多册，接待会议代表3000多人次');
INSERT INTO `expert_results` VALUES ('957', null, null, null, '国家“十一五”：食品物性修饰与油脂加工新技术开发研究', '主持', '国际领先', '完成');
INSERT INTO `expert_results` VALUES ('958', null, null, null, '国家“十一五”：食品物性修饰与油脂加工新技术开发研究', '主持', '国际领先', '完成');
INSERT INTO `expert_results` VALUES ('959', null, null, null, '国家“十一五”：食品物性修饰与油脂加工新技术开发研究', '主持', '国际领先', '完成');
INSERT INTO `expert_results` VALUES ('960', null, null, null, '国家“十一五”：食品物性修饰与油脂加工新技术开发研究', '主持', '国际领先', '完成');
INSERT INTO `expert_results` VALUES ('961', '401', null, null, '', '', '', '');
INSERT INTO `expert_results` VALUES ('962', '54', '2016-02-23', '2016-03-11', '技术工作名称1', '', '', '');
INSERT INTO `expert_results` VALUES ('963', '402', null, null, '', '', '', '');
INSERT INTO `expert_results` VALUES ('964', '403', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮食干燥新技术装备和设施研究开发与示范》，', '课题主持人', '成果水平1', '完成情况1');
INSERT INTO `expert_results` VALUES ('965', '403', '2007-01-01', '2009-01-01', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准', '', '成果水平2', '完成情况2');
INSERT INTO `expert_results` VALUES ('966', '403', '2006-01-01', '2016-01-01', '“十一五”科技支撑计划《粮库物流装备、粮食运输技术研究及产业化示范》', '课题主要参加人', '成果水平3', '');
INSERT INTO `expert_results` VALUES ('967', '403', '2007-01-01', '2009-01-01', '科技部农转资金项目《移动式清仓机》', '项目主持人', '成果水平4', '完成情况4');
INSERT INTO `expert_results` VALUES ('968', '403', '2003-01-01', '2005-01-01', '发改委高新技术产业化专项《粮食储运新技术与设备集成》', '项目主持人', '成果水平5', '完成情况5');

-- ----------------------------
-- Table structure for `expert_winners`
-- ----------------------------
DROP TABLE IF EXISTS `expert_winners`;
CREATE TABLE `expert_winners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL COMMENT '时间',
  `Title` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '获奖项目名称',
  `Level` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '奖励名称及等级',
  `Ranking` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '排名',
  `Contribute` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '贡献',
  `ExpertID` int(11) DEFAULT NULL COMMENT '专家ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=599 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of expert_winners
-- ----------------------------
INSERT INTO `expert_winners` VALUES ('57', '2015-12-08', '', '', '', '', '53');
INSERT INTO `expert_winners` VALUES ('58', '2016-01-12', '434', '', '', '', '54');
INSERT INTO `expert_winners` VALUES ('59', '2011-01-01', '中国粮油学会科学技术奖', '二等奖', '第一人', '', '56');
INSERT INTO `expert_winners` VALUES ('60', '2012-01-01', '利用PCR方法鉴别黄曲霉毒素产毒菌株', '“第十四届国际谷物科技与面包大会暨国际油料与油脂科技发展论坛”大会青年科学家研究奖（2012）。', '第一', '开辟了粮油食品中产毒真菌的分子鉴别技术', '57');
INSERT INTO `expert_winners` VALUES ('61', '2012-01-01', '粮食中真菌毒素的控制策略', '全国博士后学术论坛——“生物产业发展与文化•民生”学术论坛二等奖', '第二', '提出了真菌毒素污染粮食的安全合理利用技术技术体系', '57');
INSERT INTO `expert_winners` VALUES ('62', '2008-01-01', '新玉米快速判别技术研究与仪器开发', '获河南省教育厅科技成果一等奖', '第2', '', '55');
INSERT INTO `expert_winners` VALUES ('63', '2008-01-01', '储存玉米膜脂过氧化指标的研究', '获河南省教育厅优秀论文一等奖', '第1', '', '55');
INSERT INTO `expert_winners` VALUES ('64', '2014-01-01', '新型淀粉衍生物的创制与传统淀粉衍生物的绿色制造', '国家技术发明二等奖', '5', '', '60');
INSERT INTO `expert_winners` VALUES ('65', '2013-01-01', '淀粉衍生化关键技术及产业化', '山东省科学技术进步奖一等奖', '2', '', '60');
INSERT INTO `expert_winners` VALUES ('66', '2013-01-01', '变性淀粉高效生产关键技术及产业化', '全国商业科技进步奖一等奖', '1', '', '60');
INSERT INTO `expert_winners` VALUES ('67', '2011-01-01', '高水溶性麦芽糖基β-环糊精的酶法合成及应用研究', '山东省科学技术进步奖三等奖', '1', '', '60');
INSERT INTO `expert_winners` VALUES ('68', '2014-01-01', '高水溶性麦芽糖基β-环糊精的酶法合成及应用研究', '中国轻工业联合会科技进步奖三等奖', '1', '', '60');
INSERT INTO `expert_winners` VALUES ('69', '2014-01-01', '环境友好型木材用淀粉胶粘剂制备关键技术', '教育部技术发明二等奖', '5/5', '参加', '100');
INSERT INTO `expert_winners` VALUES ('70', '2010-01-01', '中华医学科技奖', '二等奖', '2', '主研', '102');
INSERT INTO `expert_winners` VALUES ('71', '2007-01-01', '中华预防医学科技奖', '二等奖', '2', '主研', '102');
INSERT INTO `expert_winners` VALUES ('72', '2004-01-01', '中华医学科技奖', '二等奖', '2', '主研', '102');
INSERT INTO `expert_winners` VALUES ('73', '2014-01-01', '粮油原料中主要真菌毒素检测及控制技术研究及应用示范', '荣获2014年度中国粮油学会科学技术进步二等奖', '1', '项目实施方案的制定以及项目的组织方案', '109');
INSERT INTO `expert_winners` VALUES ('74', '2012-01-01', '网络化多功能粮情检测系统研究开发与应用示范', '中国粮油学会科学技术一等奖', '11', '储粮粮堆温度变化规律与温度传感器布置模型研究部分主要完成人', '111');
INSERT INTO `expert_winners` VALUES ('75', '2012-01-01', '国家粮食局标准质量中心信息系统', '中国粮油学会科学技术三等奖', '3', '系统主要完成人之一', '111');
INSERT INTO `expert_winners` VALUES ('76', '2012-01-01', '网络化多功能粮情检测系统研究开发与应用示范', '中国粮油学会科学技术一等奖', '11', '储粮粮堆温度变化规律与温度传感器布置模型研究部分主要完成人', '113');
INSERT INTO `expert_winners` VALUES ('77', '2012-01-01', '国家粮食局标准质量中心信息系统', '中国粮油学会科学技术三等奖', '3', '系统主要完成人之一', '113');
INSERT INTO `expert_winners` VALUES ('78', '2012-01-01', '网络化多功能粮情检测系统研究开发与应用示范', '中国粮油学会科学技术一等奖', '11', '储粮粮堆温度变化规律与温度传感器布置模型研究部分主要完成人', '112');
INSERT INTO `expert_winners` VALUES ('79', '2012-01-01', '国家粮食局标准质量中心信息系统', '中国粮油学会科学技术三等奖', '3', '系统主要完成人之一', '112');
INSERT INTO `expert_winners` VALUES ('80', '2012-01-05', '中储粮粮情测控远程监管平台', '中国商业联合会科学技术奖 二等奖', '二等', '主要', '114');
INSERT INTO `expert_winners` VALUES ('81', '2012-01-05', '全球粮食遥感估产与增值服务示范应用', '中国商业联合会科学技术奖 二等奖', '二等', '主要', '114');
INSERT INTO `expert_winners` VALUES ('82', '2012-01-04', '中储粮粮情测控远程监管平台', '中国粮油学会科学技术奖 二等奖', '二等', '主要', '114');
INSERT INTO `expert_winners` VALUES ('83', '2014-01-08', '中储粮云计算平台粮油大数据中心', '中国粮油学会科学技术奖 二等奖', '二等', '主要', '114');
INSERT INTO `expert_winners` VALUES ('84', '1981-01-07', '“木薯片酶化、氢化制山梨醇”', '自治区科技进步一等奖', '2', '主要', '117');
INSERT INTO `expert_winners` VALUES ('85', '1998-01-23', '“新工艺合成甘露醇山梨醇”', '自治区科技进步二等奖', '1', '主要', '117');
INSERT INTO `expert_winners` VALUES ('86', '1999-01-20', '“结晶山梨醇”', '自治区科技进步三等奖', '1', '主要', '117');
INSERT INTO `expert_winners` VALUES ('87', '1995-12-14', '卫星氏油脂浸出器研制', '湖北省科技进步三等奖', '4', '', '120');
INSERT INTO `expert_winners` VALUES ('88', '1999-11-09', '高含油油料膨化机研制', '国家粮食储备局科技进步三等奖', '1', '', '120');
INSERT INTO `expert_winners` VALUES ('89', '2004-01-01', '果蔬面条的研制', '湖北省科技进步三等奖', '4', '', '120');
INSERT INTO `expert_winners` VALUES ('90', '2004-12-01', '微生物油脂加工技术及产业化', '湖北省科技进步一等奖', '8', '', '120');
INSERT INTO `expert_winners` VALUES ('91', '1992-01-02', '大豆膨化浸出新工艺研究', '国内贸易部科技进步二等奖', '本单位 第三', '', '121');
INSERT INTO `expert_winners` VALUES ('92', '2013-01-03', '多肽加工的增值转化关键技术研究与产业化', '湖北省科技进步一等奖', '本单位 第八', '', '121');
INSERT INTO `expert_winners` VALUES ('93', '2012-10-01', '高甾醇玉米油工业化生产技术研究及应用', '粮油学会一等奖、山东省二等奖、滨州市一等奖', '15', '检测检验', '122');
INSERT INTO `expert_winners` VALUES ('94', '2013-04-01', '零反式酸玉米油工业化生产技术研究及应用', '粮油学会一等奖、山东省二等奖、滨州市一等奖', '6', '检测检验', '122');
INSERT INTO `expert_winners` VALUES ('95', '2013-10-01', '高品质玉米油生产关键技术创新集成及产业化', '粮油学会一等奖、山东省二等奖、滨州市一等奖', '5', '检测检验', '122');
INSERT INTO `expert_winners` VALUES ('96', '2014-01-08', '2014年度中国畜牧行业十大人物', '中国畜牧行业前10位优秀人物', '7', '大', '123');
INSERT INTO `expert_winners` VALUES ('97', '2013-01-09', '打造为幸福而存的饲料企业竞争力量', '特等奖', '1', '大', '123');
INSERT INTO `expert_winners` VALUES ('98', '1991-01-03', '配合饲料厂操作规程', '商业部科技进步三等奖', '第一', '主持', '126');
INSERT INTO `expert_winners` VALUES ('99', '1996-01-10', '家蚕人工饲料研究开发', '内贸部科技进步二等奖', '第一', '主持', '126');
INSERT INTO `expert_winners` VALUES ('100', '1997-01-01', '特种饲料加工技术研究', '国家科技进步三等奖', '第一', '主持', '126');
INSERT INTO `expert_winners` VALUES ('101', null, '', '', '', '', '130');
INSERT INTO `expert_winners` VALUES ('102', null, '', '', '', '', '131');
INSERT INTO `expert_winners` VALUES ('103', null, '', '', '', '', '132');
INSERT INTO `expert_winners` VALUES ('104', null, '', '', '', '', '133');
INSERT INTO `expert_winners` VALUES ('105', null, '获奖项目名称1', null, '国家科学技术进步一等奖', null, '153');
INSERT INTO `expert_winners` VALUES ('106', null, '获奖项目名称2', null, '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', null, '153');
INSERT INTO `expert_winners` VALUES ('107', null, '获奖项目名称3', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', null, '153');
INSERT INTO `expert_winners` VALUES ('108', null, '获奖项目名称4', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', null, '153');
INSERT INTO `expert_winners` VALUES ('109', null, '获奖项目名称5', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', null, '153');
INSERT INTO `expert_winners` VALUES ('110', null, '获奖项目名称1', null, '国家科学技术进步一等奖', null, '154');
INSERT INTO `expert_winners` VALUES ('111', null, '获奖项目名称2', null, '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', null, '154');
INSERT INTO `expert_winners` VALUES ('112', null, '获奖项目名称3', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', null, '154');
INSERT INTO `expert_winners` VALUES ('113', null, '获奖项目名称4', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', null, '154');
INSERT INTO `expert_winners` VALUES ('114', null, '获奖项目名称5', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', null, '154');
INSERT INTO `expert_winners` VALUES ('115', null, '获奖项目名称1', null, '国家科学技术进步一等奖', null, '155');
INSERT INTO `expert_winners` VALUES ('116', null, '获奖项目名称2', null, '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', null, '155');
INSERT INTO `expert_winners` VALUES ('117', null, '获奖项目名称3', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', null, '155');
INSERT INTO `expert_winners` VALUES ('118', null, '获奖项目名称4', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', null, '155');
INSERT INTO `expert_winners` VALUES ('119', null, '获奖项目名称5', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', null, '155');
INSERT INTO `expert_winners` VALUES ('120', null, '获奖项目名称1', null, '国家科学技术进步一等奖', null, '156');
INSERT INTO `expert_winners` VALUES ('121', null, '获奖项目名称2', null, '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', null, '156');
INSERT INTO `expert_winners` VALUES ('122', null, '获奖项目名称3', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', null, '156');
INSERT INTO `expert_winners` VALUES ('123', null, '获奖项目名称4', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', null, '156');
INSERT INTO `expert_winners` VALUES ('124', null, '获奖项目名称5', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', null, '156');
INSERT INTO `expert_winners` VALUES ('125', null, '获奖项目名称1', null, '国家科学技术进步一等奖', null, '157');
INSERT INTO `expert_winners` VALUES ('126', null, '获奖项目名称2', null, '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', null, '157');
INSERT INTO `expert_winners` VALUES ('127', null, '获奖项目名称3', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', null, '157');
INSERT INTO `expert_winners` VALUES ('128', null, '获奖项目名称4', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', null, '157');
INSERT INTO `expert_winners` VALUES ('129', null, '获奖项目名称5', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', null, '157');
INSERT INTO `expert_winners` VALUES ('130', '2010-01-01', '获奖项目名称1', null, '国家科学技术进步一等奖', null, '158');
INSERT INTO `expert_winners` VALUES ('131', '2009-01-01', '获奖项目名称2', null, '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', null, '158');
INSERT INTO `expert_winners` VALUES ('132', '2005-01-01', '获奖项目名称3', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', null, '158');
INSERT INTO `expert_winners` VALUES ('133', '2005-01-01', '获奖项目名称4', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', null, '158');
INSERT INTO `expert_winners` VALUES ('134', '2006-01-01', '获奖项目名称5', null, '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', null, '158');
INSERT INTO `expert_winners` VALUES ('135', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '159');
INSERT INTO `expert_winners` VALUES ('136', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '159');
INSERT INTO `expert_winners` VALUES ('137', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '159');
INSERT INTO `expert_winners` VALUES ('138', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '159');
INSERT INTO `expert_winners` VALUES ('139', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '159');
INSERT INTO `expert_winners` VALUES ('140', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '162');
INSERT INTO `expert_winners` VALUES ('141', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '162');
INSERT INTO `expert_winners` VALUES ('142', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '162');
INSERT INTO `expert_winners` VALUES ('143', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '162');
INSERT INTO `expert_winners` VALUES ('144', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '162');
INSERT INTO `expert_winners` VALUES ('145', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '165');
INSERT INTO `expert_winners` VALUES ('146', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '165');
INSERT INTO `expert_winners` VALUES ('147', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '165');
INSERT INTO `expert_winners` VALUES ('148', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '165');
INSERT INTO `expert_winners` VALUES ('149', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '165');
INSERT INTO `expert_winners` VALUES ('150', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '168');
INSERT INTO `expert_winners` VALUES ('151', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '168');
INSERT INTO `expert_winners` VALUES ('152', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '168');
INSERT INTO `expert_winners` VALUES ('153', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '168');
INSERT INTO `expert_winners` VALUES ('154', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '168');
INSERT INTO `expert_winners` VALUES ('155', null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》', '1900', '全国优秀工程咨询成果三等奖', '主要完成人', '170');
INSERT INTO `expert_winners` VALUES ('156', null, '《福建粮食现代物流设施建设规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '170');
INSERT INTO `expert_winners` VALUES ('157', null, '《新疆维吾尔自治区粮食现代物流设施“十一五”及中长期建设规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '170');
INSERT INTO `expert_winners` VALUES ('158', null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '170');
INSERT INTO `expert_winners` VALUES ('159', null, '《贵州西南粮食现代物流生态产业园总体规划》', '1900', '北京优秀工程咨询成果二等奖', '主要完成人', '170');
INSERT INTO `expert_winners` VALUES ('160', null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》', '1900', '全国优秀工程咨询成果三等奖', '主要完成人', '172');
INSERT INTO `expert_winners` VALUES ('161', null, '《福建粮食现代物流设施建设规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '172');
INSERT INTO `expert_winners` VALUES ('162', null, '《新疆维吾尔自治区粮食现代物流设施“十一五”及中长期建设规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '172');
INSERT INTO `expert_winners` VALUES ('163', null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '172');
INSERT INTO `expert_winners` VALUES ('164', null, '《贵州西南粮食现代物流生态产业园总体规划》', '1900', '北京优秀工程咨询成果二等奖', '主要完成人', '172');
INSERT INTO `expert_winners` VALUES ('165', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '174');
INSERT INTO `expert_winners` VALUES ('166', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '174');
INSERT INTO `expert_winners` VALUES ('167', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '174');
INSERT INTO `expert_winners` VALUES ('168', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '174');
INSERT INTO `expert_winners` VALUES ('169', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '174');
INSERT INTO `expert_winners` VALUES ('170', null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》', '1900', '全国优秀工程咨询成果三等奖', '主要完成人', '176');
INSERT INTO `expert_winners` VALUES ('171', null, '《福建粮食现代物流设施建设规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '176');
INSERT INTO `expert_winners` VALUES ('172', null, '《新疆维吾尔自治区粮食现代物流设施“十一五”及中长期建设规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '176');
INSERT INTO `expert_winners` VALUES ('173', null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '176');
INSERT INTO `expert_winners` VALUES ('174', null, '《贵州西南粮食现代物流生态产业园总体规划》', '1900', '北京优秀工程咨询成果二等奖', '主要完成人', '176');
INSERT INTO `expert_winners` VALUES ('175', null, '粮食及副产物精准组合干燥技术与装备集成', '1900', '中国粮油学会科学技术奖、二等奖', '技术创新', '178');
INSERT INTO `expert_winners` VALUES ('176', null, '“粮食及副产物精准组合干燥技术与装备集成”', '', '科技进步二等奖', '', '180');
INSERT INTO `expert_winners` VALUES ('177', null, '“饲用抗生素及其替代产品开发利用关键技术” ', '', '第七届大北农科技一等奖', '', '180');
INSERT INTO `expert_winners` VALUES ('178', '2004-01-01', '辛集黑马面粉厂', '三', '全国第十一届优秀工程设计铜质奖', '工艺设计', '182');
INSERT INTO `expert_winners` VALUES ('179', '2004-01-01', '大连南关岭国家粮食储备库立筒仓项目', '四', '全国第十一届优秀工程设计银质奖', '工艺设计', '182');
INSERT INTO `expert_winners` VALUES ('180', '2007-01-01', '福建粮食现代物流设施建设规划', '', '2007年度北京市优秀工程咨询成果一等奖', '主要参加人', '182');
INSERT INTO `expert_winners` VALUES ('181', '2011-01-01', '中央储备粮唐山直属库油脂油料仓储及加工项目可行性研究报告', '', '2011年度北京市优秀工程咨询成果二等奖', '主要参加人', '182');
INSERT INTO `expert_winners` VALUES ('182', '2012-01-01', '中央储备粮唐山直属库油脂油料仓储及加工项目可行性研究报告', '', '2012年度全国优秀工程咨询成果二等奖', '主要参加人', '182');
INSERT INTO `expert_winners` VALUES ('183', null, '谷物害虫实时监测与分类识别系统', '', '河南省科技进步三等奖', '', '183');
INSERT INTO `expert_winners` VALUES ('184', null, '粮情测控开放式软件平台', '', '河南省省软件创新大赛铜奖', '', '183');
INSERT INTO `expert_winners` VALUES ('185', '2007-01-01', '福建粮食现代物流设施建设规划', '第一', '北京市优秀工程咨询成果一等奖', '', '185');
INSERT INTO `expert_winners` VALUES ('186', '2009-01-01', '安徽粮食物流发展规划', '第一', '北京市优秀工程咨询成果三等奖', '', '185');
INSERT INTO `expert_winners` VALUES ('187', '2010-01-01', '北京炼焦化学厂能源研发科技中心项目', '第一', '北京市优秀工程咨询成果二等奖', '', '185');
INSERT INTO `expert_winners` VALUES ('188', '2011-01-01', '福州海峡（松下港）粮食产业集群暨物流园区发展规划', '第一', '北京市2011年优秀咨询成果一等奖，2012年全国优秀工程咨询成果三等奖', '', '185');
INSERT INTO `expert_winners` VALUES ('189', '2012-01-01', '贵州西南现代粮食生态产业物流中心总体规划', '第二', '北京市2012年优秀咨询成果二等奖，2014年全国优秀工程咨询成果三等奖', '', '185');
INSERT INTO `expert_winners` VALUES ('190', '2000-01-01', '我国散粮码头装卸工艺研究', '', '全国优秀学术成果 一等奖', '', '187');
INSERT INTO `expert_winners` VALUES ('191', '1996-01-01', '大连港散粮进口泊位工艺分析', '', '中国综合运输体系发展全书', '', '187');
INSERT INTO `expert_winners` VALUES ('192', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '189');
INSERT INTO `expert_winners` VALUES ('193', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '189');
INSERT INTO `expert_winners` VALUES ('194', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '189');
INSERT INTO `expert_winners` VALUES ('195', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '189');
INSERT INTO `expert_winners` VALUES ('196', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '189');
INSERT INTO `expert_winners` VALUES ('197', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '192');
INSERT INTO `expert_winners` VALUES ('198', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '192');
INSERT INTO `expert_winners` VALUES ('199', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '192');
INSERT INTO `expert_winners` VALUES ('200', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '192');
INSERT INTO `expert_winners` VALUES ('201', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '192');
INSERT INTO `expert_winners` VALUES ('202', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '194');
INSERT INTO `expert_winners` VALUES ('203', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '194');
INSERT INTO `expert_winners` VALUES ('204', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '194');
INSERT INTO `expert_winners` VALUES ('205', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '194');
INSERT INTO `expert_winners` VALUES ('206', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '194');
INSERT INTO `expert_winners` VALUES ('207', null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》', '1900', '全国优秀工程咨询成果三等奖', '主要完成人', '197');
INSERT INTO `expert_winners` VALUES ('208', null, '《福建粮食现代物流设施建设规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '197');
INSERT INTO `expert_winners` VALUES ('209', null, '《新疆维吾尔自治区粮食现代物流设施“十一五”及中长期建设规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '197');
INSERT INTO `expert_winners` VALUES ('210', null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '197');
INSERT INTO `expert_winners` VALUES ('211', null, '《贵州西南粮食现代物流生态产业园总体规划》', '1900', '北京优秀工程咨询成果二等奖', '主要完成人', '197');
INSERT INTO `expert_winners` VALUES ('212', null, '黑龙江农垦总局科技攻关课题《基于粮食供应链集成机制的垦区循环经济组织及运作研究》（HNKXIV-12-05a）', '1900', '获得黑龙江省农垦总局科学技术进步奖一等奖，证书号130115-01', '首要', '198');
INSERT INTO `expert_winners` VALUES ('213', null, '黑龙江省社会科学基金项目《黑龙江省大宗农产品供应链管理研究》，（03B028）', '1900', '获2009年度中国粮油学会科学技术奖三等奖，（获奖证书编号：lg-cg-2009-316）', '首要', '198');
INSERT INTO `expert_winners` VALUES ('214', null, '农产品供应链发展循环经济的推进机制研究[J]. 中国流通经济.2008,(10)', '1900', '大庆市第十四次社会科学优秀科研成果评奖,获论文类 一等奖', '首要', '198');
INSERT INTO `expert_winners` VALUES ('215', null, '专著《集成化大宗农产品供应链模型及其应用》', '1900', '黑龙江省第十三届社会科学优秀科研成果评奖中，获专著佳作奖（编号：13321）', '首要', '198');
INSERT INTO `expert_winners` VALUES ('216', null, '粮食及副产物精准组合干燥技术与装备集成', '1900', '中国粮油学会科学技术奖、二等奖', '技术创新', '200');
INSERT INTO `expert_winners` VALUES ('217', null, '带式高速包刷分拣机', '1900', '机械工业联合会、机械工业学会科技进步二等奖', '网络控制', '201');
INSERT INTO `expert_winners` VALUES ('218', null, '智能型总线式报刊分发数据显示系统', '1900', '第十四届（2003年）全国发明展览会银奖', '系统控制', '201');
INSERT INTO `expert_winners` VALUES ('219', null, '具有柔性变址功能的分拣机网络管理控制系统', '1900', '中国物流与采购联合会科技发明三等奖', '总体设计', '201');
INSERT INTO `expert_winners` VALUES ('220', null, '劳动模范', '', '河南省粮食行业', '', '204');
INSERT INTO `expert_winners` VALUES ('221', null, '2004年度粮食工作优秀调研报告二等奖', '', '国家粮食局授予', '', '204');
INSERT INTO `expert_winners` VALUES ('222', null, '大型立筒仓长期储粮综合性能实验研究', '', '河南省科技进步二等奖', '', '204');
INSERT INTO `expert_winners` VALUES ('223', null, '“粮食及副产物精准组合干燥技术与装备集成”', '', '科技进步二等奖', '', '205');
INSERT INTO `expert_winners` VALUES ('224', null, '“饲用抗生素及其替代产品开发利用关键技术” ', '', '第七届大北农科技一等奖', '', '205');
INSERT INTO `expert_winners` VALUES ('225', null, '中国粮食安全的现状、挑战与对策研究（研究报告）', '', '国家粮食局优秀软科学研究成果二等奖', '', '206');
INSERT INTO `expert_winners` VALUES ('226', '2004-01-01', '辛集黑马面粉厂', '三', '全国第十一届优秀工程设计铜质奖', '工艺设计', '208');
INSERT INTO `expert_winners` VALUES ('227', '2004-01-01', '大连南关岭国家粮食储备库立筒仓项目', '四', '全国第十一届优秀工程设计银质奖', '工艺设计', '208');
INSERT INTO `expert_winners` VALUES ('228', '2007-01-01', '福建粮食现代物流设施建设规划', '', '2007年度北京市优秀工程咨询成果一等奖', '主要参加人', '208');
INSERT INTO `expert_winners` VALUES ('229', '2011-01-01', '中央储备粮唐山直属库油脂油料仓储及加工项目可行性研究报告', '', '2011年度北京市优秀工程咨询成果二等奖', '主要参加人', '208');
INSERT INTO `expert_winners` VALUES ('230', '2012-01-01', '中央储备粮唐山直属库油脂油料仓储及加工项目可行性研究报告', '', '2012年度全国优秀工程咨询成果二等奖', '主要参加人', '208');
INSERT INTO `expert_winners` VALUES ('231', null, '谷物害虫实时监测与分类识别系统', '', '河南省科技进步三等奖', '', '209');
INSERT INTO `expert_winners` VALUES ('232', null, '粮情测控开放式软件平台', '', '河南省省软件创新大赛铜奖', '', '209');
INSERT INTO `expert_winners` VALUES ('233', '2007-01-01', '获国务院行业科技专家特殊津贴', '', '', '', '210');
INSERT INTO `expert_winners` VALUES ('234', null, '《中央储备粮唐山直属库油脂油料仓储物流加工项目》', '', '', '', '212');
INSERT INTO `expert_winners` VALUES ('235', '2007-01-01', '福建粮食现代物流设施建设规划', '第一', '北京市优秀工程咨询成果一等奖', '', '213');
INSERT INTO `expert_winners` VALUES ('236', '2009-01-01', '安徽粮食物流发展规划', '第一', '北京市优秀工程咨询成果三等奖', '', '213');
INSERT INTO `expert_winners` VALUES ('237', '2010-01-01', '北京炼焦化学厂能源研发科技中心项目', '第一', '北京市优秀工程咨询成果二等奖', '', '213');
INSERT INTO `expert_winners` VALUES ('238', '2011-01-01', '福州海峡（松下港）粮食产业集群暨物流园区发展规划', '第一', '北京市2011年优秀咨询成果一等奖，2012年全国优秀工程咨询成果三等奖', '', '213');
INSERT INTO `expert_winners` VALUES ('239', '2012-01-01', '贵州西南现代粮食生态产业物流中心总体规划', '第二', '北京市2012年优秀咨询成果二等奖，2014年全国优秀工程咨询成果三等奖', '', '213');
INSERT INTO `expert_winners` VALUES ('240', '2000-01-01', '我国散粮码头装卸工艺研究', '', '全国优秀学术成果 一等奖', '', '216');
INSERT INTO `expert_winners` VALUES ('241', '1996-01-01', '大连港散粮进口泊位工艺分析', '', '中国综合运输体系发展全书', '', '216');
INSERT INTO `expert_winners` VALUES ('242', null, '543', '543', '', '', '214');
INSERT INTO `expert_winners` VALUES ('243', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '218');
INSERT INTO `expert_winners` VALUES ('244', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '218');
INSERT INTO `expert_winners` VALUES ('245', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '218');
INSERT INTO `expert_winners` VALUES ('246', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '218');
INSERT INTO `expert_winners` VALUES ('247', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '218');
INSERT INTO `expert_winners` VALUES ('248', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '220');
INSERT INTO `expert_winners` VALUES ('249', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '220');
INSERT INTO `expert_winners` VALUES ('250', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '220');
INSERT INTO `expert_winners` VALUES ('251', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '220');
INSERT INTO `expert_winners` VALUES ('252', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '220');
INSERT INTO `expert_winners` VALUES ('253', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '223');
INSERT INTO `expert_winners` VALUES ('254', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '223');
INSERT INTO `expert_winners` VALUES ('255', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '223');
INSERT INTO `expert_winners` VALUES ('256', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '223');
INSERT INTO `expert_winners` VALUES ('257', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '223');
INSERT INTO `expert_winners` VALUES ('258', null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》', '1900', '全国优秀工程咨询成果三等奖', '主要完成人', '226');
INSERT INTO `expert_winners` VALUES ('259', null, '《福建粮食现代物流设施建设规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '226');
INSERT INTO `expert_winners` VALUES ('260', null, '《新疆维吾尔自治区粮食现代物流设施“十一五”及中长期建设规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '226');
INSERT INTO `expert_winners` VALUES ('261', null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '226');
INSERT INTO `expert_winners` VALUES ('262', null, '《贵州西南粮食现代物流生态产业园总体规划》', '1900', '北京优秀工程咨询成果二等奖', '主要完成人', '226');
INSERT INTO `expert_winners` VALUES ('263', null, '黑龙江农垦总局科技攻关课题《基于粮食供应链集成机制的垦区循环经济组织及运作研究》（HNKXIV-12-05a）', '1900', '获得黑龙江省农垦总局科学技术进步奖一等奖，证书号130115-01', '首要', '227');
INSERT INTO `expert_winners` VALUES ('264', null, '黑龙江省社会科学基金项目《黑龙江省大宗农产品供应链管理研究》，（03B028）', '1900', '获2009年度中国粮油学会科学技术奖三等奖，（获奖证书编号：lg-cg-2009-316）', '首要', '227');
INSERT INTO `expert_winners` VALUES ('265', null, '农产品供应链发展循环经济的推进机制研究[J]. 中国流通经济.2008,(10)', '1900', '大庆市第十四次社会科学优秀科研成果评奖,获论文类 一等奖', '首要', '227');
INSERT INTO `expert_winners` VALUES ('266', null, '专著《集成化大宗农产品供应链模型及其应用》', '1900', '黑龙江省第十三届社会科学优秀科研成果评奖中，获专著佳作奖（编号：13321）', '首要', '227');
INSERT INTO `expert_winners` VALUES ('267', null, '粮食及副产物精准组合干燥技术与装备集成', '1900', '中国粮油学会科学技术奖、二等奖', '技术创新', '229');
INSERT INTO `expert_winners` VALUES ('268', null, '带式高速包刷分拣机', '1900', '机械工业联合会、机械工业学会科技进步二等奖', '网络控制', '230');
INSERT INTO `expert_winners` VALUES ('269', null, '智能型总线式报刊分发数据显示系统', '1900', '第十四届（2003年）全国发明展览会银奖', '系统控制', '230');
INSERT INTO `expert_winners` VALUES ('270', null, '具有柔性变址功能的分拣机网络管理控制系统', '1900', '中国物流与采购联合会科技发明三等奖', '总体设计', '230');
INSERT INTO `expert_winners` VALUES ('271', null, '劳动模范', '', '河南省粮食行业', '', '233');
INSERT INTO `expert_winners` VALUES ('272', null, '2004年度粮食工作优秀调研报告二等奖', '', '国家粮食局授予', '', '233');
INSERT INTO `expert_winners` VALUES ('273', null, '大型立筒仓长期储粮综合性能实验研究', '', '河南省科技进步二等奖', '', '233');
INSERT INTO `expert_winners` VALUES ('274', null, '“粮食及副产物精准组合干燥技术与装备集成”', '', '科技进步二等奖', '', '234');
INSERT INTO `expert_winners` VALUES ('275', null, '“饲用抗生素及其替代产品开发利用关键技术” ', '', '第七届大北农科技一等奖', '', '234');
INSERT INTO `expert_winners` VALUES ('276', null, '中国粮食安全的现状、挑战与对策研究（研究报告）', '', '国家粮食局优秀软科学研究成果二等奖', '', '235');
INSERT INTO `expert_winners` VALUES ('277', '2004-01-01', '辛集黑马面粉厂', '三', '全国第十一届优秀工程设计铜质奖', '工艺设计', '237');
INSERT INTO `expert_winners` VALUES ('278', '2004-01-01', '大连南关岭国家粮食储备库立筒仓项目', '四', '全国第十一届优秀工程设计银质奖', '工艺设计', '237');
INSERT INTO `expert_winners` VALUES ('279', '2007-01-01', '福建粮食现代物流设施建设规划', '', '2007年度北京市优秀工程咨询成果一等奖', '主要参加人', '237');
INSERT INTO `expert_winners` VALUES ('280', '2011-01-01', '中央储备粮唐山直属库油脂油料仓储及加工项目可行性研究报告', '', '2011年度北京市优秀工程咨询成果二等奖', '主要参加人', '237');
INSERT INTO `expert_winners` VALUES ('281', '2012-01-01', '中央储备粮唐山直属库油脂油料仓储及加工项目可行性研究报告', '', '2012年度全国优秀工程咨询成果二等奖', '主要参加人', '237');
INSERT INTO `expert_winners` VALUES ('282', null, '谷物害虫实时监测与分类识别系统', '', '河南省科技进步三等奖', '', '238');
INSERT INTO `expert_winners` VALUES ('283', null, '粮情测控开放式软件平台', '', '河南省省软件创新大赛铜奖', '', '238');
INSERT INTO `expert_winners` VALUES ('284', '2007-01-01', '获国务院行业科技专家特殊津贴', '', '', '', '239');
INSERT INTO `expert_winners` VALUES ('285', null, '《中央储备粮唐山直属库油脂油料仓储物流加工项目》', '', '', '', '241');
INSERT INTO `expert_winners` VALUES ('286', '2007-01-01', '福建粮食现代物流设施建设规划', '第一', '北京市优秀工程咨询成果一等奖', '', '242');
INSERT INTO `expert_winners` VALUES ('287', '2009-01-01', '安徽粮食物流发展规划', '第一', '北京市优秀工程咨询成果三等奖', '', '242');
INSERT INTO `expert_winners` VALUES ('288', '2010-01-01', '北京炼焦化学厂能源研发科技中心项目', '第一', '北京市优秀工程咨询成果二等奖', '', '242');
INSERT INTO `expert_winners` VALUES ('289', '2011-01-01', '福州海峡（松下港）粮食产业集群暨物流园区发展规划', '第一', '北京市2011年优秀咨询成果一等奖，2012年全国优秀工程咨询成果三等奖', '', '242');
INSERT INTO `expert_winners` VALUES ('290', '2012-01-01', '贵州西南现代粮食生态产业物流中心总体规划', '第二', '北京市2012年优秀咨询成果二等奖，2014年全国优秀工程咨询成果三等奖', '', '242');
INSERT INTO `expert_winners` VALUES ('291', '2000-01-01', '我国散粮码头装卸工艺研究', '', '全国优秀学术成果 一等奖', '', '245');
INSERT INTO `expert_winners` VALUES ('292', '1996-01-01', '大连港散粮进口泊位工艺分析', '', '中国综合运输体系发展全书', '', '245');
INSERT INTO `expert_winners` VALUES ('293', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '247');
INSERT INTO `expert_winners` VALUES ('294', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '247');
INSERT INTO `expert_winners` VALUES ('295', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '247');
INSERT INTO `expert_winners` VALUES ('296', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '247');
INSERT INTO `expert_winners` VALUES ('297', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '247');
INSERT INTO `expert_winners` VALUES ('298', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '248');
INSERT INTO `expert_winners` VALUES ('299', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '248');
INSERT INTO `expert_winners` VALUES ('300', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '248');
INSERT INTO `expert_winners` VALUES ('301', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '248');
INSERT INTO `expert_winners` VALUES ('302', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '248');
INSERT INTO `expert_winners` VALUES ('303', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '251');
INSERT INTO `expert_winners` VALUES ('304', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '251');
INSERT INTO `expert_winners` VALUES ('305', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '251');
INSERT INTO `expert_winners` VALUES ('306', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '251');
INSERT INTO `expert_winners` VALUES ('307', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '251');
INSERT INTO `expert_winners` VALUES ('308', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '252');
INSERT INTO `expert_winners` VALUES ('309', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '252');
INSERT INTO `expert_winners` VALUES ('310', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '252');
INSERT INTO `expert_winners` VALUES ('311', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '252');
INSERT INTO `expert_winners` VALUES ('312', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '252');
INSERT INTO `expert_winners` VALUES ('313', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '255');
INSERT INTO `expert_winners` VALUES ('314', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '255');
INSERT INTO `expert_winners` VALUES ('315', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '255');
INSERT INTO `expert_winners` VALUES ('316', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '255');
INSERT INTO `expert_winners` VALUES ('317', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '255');
INSERT INTO `expert_winners` VALUES ('318', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '256');
INSERT INTO `expert_winners` VALUES ('319', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '256');
INSERT INTO `expert_winners` VALUES ('320', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '256');
INSERT INTO `expert_winners` VALUES ('321', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '256');
INSERT INTO `expert_winners` VALUES ('322', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '256');
INSERT INTO `expert_winners` VALUES ('323', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '259');
INSERT INTO `expert_winners` VALUES ('324', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '259');
INSERT INTO `expert_winners` VALUES ('325', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '259');
INSERT INTO `expert_winners` VALUES ('326', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '259');
INSERT INTO `expert_winners` VALUES ('327', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '259');
INSERT INTO `expert_winners` VALUES ('328', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '260');
INSERT INTO `expert_winners` VALUES ('329', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '260');
INSERT INTO `expert_winners` VALUES ('330', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '260');
INSERT INTO `expert_winners` VALUES ('331', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '260');
INSERT INTO `expert_winners` VALUES ('332', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '260');
INSERT INTO `expert_winners` VALUES ('333', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '262');
INSERT INTO `expert_winners` VALUES ('334', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '262');
INSERT INTO `expert_winners` VALUES ('335', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '262');
INSERT INTO `expert_winners` VALUES ('336', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '262');
INSERT INTO `expert_winners` VALUES ('337', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '262');
INSERT INTO `expert_winners` VALUES ('338', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '263');
INSERT INTO `expert_winners` VALUES ('339', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '263');
INSERT INTO `expert_winners` VALUES ('340', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '263');
INSERT INTO `expert_winners` VALUES ('341', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '263');
INSERT INTO `expert_winners` VALUES ('342', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '263');
INSERT INTO `expert_winners` VALUES ('343', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '264');
INSERT INTO `expert_winners` VALUES ('344', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '264');
INSERT INTO `expert_winners` VALUES ('345', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '264');
INSERT INTO `expert_winners` VALUES ('346', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '264');
INSERT INTO `expert_winners` VALUES ('347', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '264');
INSERT INTO `expert_winners` VALUES ('348', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '266');
INSERT INTO `expert_winners` VALUES ('349', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '266');
INSERT INTO `expert_winners` VALUES ('350', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '266');
INSERT INTO `expert_winners` VALUES ('351', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '266');
INSERT INTO `expert_winners` VALUES ('352', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '266');
INSERT INTO `expert_winners` VALUES ('353', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '267');
INSERT INTO `expert_winners` VALUES ('354', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '267');
INSERT INTO `expert_winners` VALUES ('355', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '267');
INSERT INTO `expert_winners` VALUES ('356', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '267');
INSERT INTO `expert_winners` VALUES ('357', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '267');
INSERT INTO `expert_winners` VALUES ('358', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '268');
INSERT INTO `expert_winners` VALUES ('359', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '268');
INSERT INTO `expert_winners` VALUES ('360', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '268');
INSERT INTO `expert_winners` VALUES ('361', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '268');
INSERT INTO `expert_winners` VALUES ('362', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '268');
INSERT INTO `expert_winners` VALUES ('363', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '270');
INSERT INTO `expert_winners` VALUES ('364', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '270');
INSERT INTO `expert_winners` VALUES ('365', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '270');
INSERT INTO `expert_winners` VALUES ('366', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '270');
INSERT INTO `expert_winners` VALUES ('367', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '270');
INSERT INTO `expert_winners` VALUES ('368', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '271');
INSERT INTO `expert_winners` VALUES ('369', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '271');
INSERT INTO `expert_winners` VALUES ('370', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '271');
INSERT INTO `expert_winners` VALUES ('371', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '271');
INSERT INTO `expert_winners` VALUES ('372', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '271');
INSERT INTO `expert_winners` VALUES ('373', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '272');
INSERT INTO `expert_winners` VALUES ('374', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '272');
INSERT INTO `expert_winners` VALUES ('375', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '272');
INSERT INTO `expert_winners` VALUES ('376', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '272');
INSERT INTO `expert_winners` VALUES ('377', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '272');
INSERT INTO `expert_winners` VALUES ('378', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '275');
INSERT INTO `expert_winners` VALUES ('379', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '275');
INSERT INTO `expert_winners` VALUES ('380', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '275');
INSERT INTO `expert_winners` VALUES ('381', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '275');
INSERT INTO `expert_winners` VALUES ('382', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '275');
INSERT INTO `expert_winners` VALUES ('383', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '276');
INSERT INTO `expert_winners` VALUES ('384', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '276');
INSERT INTO `expert_winners` VALUES ('385', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '276');
INSERT INTO `expert_winners` VALUES ('386', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '276');
INSERT INTO `expert_winners` VALUES ('387', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '276');
INSERT INTO `expert_winners` VALUES ('388', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '277');
INSERT INTO `expert_winners` VALUES ('389', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '277');
INSERT INTO `expert_winners` VALUES ('390', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '277');
INSERT INTO `expert_winners` VALUES ('391', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '277');
INSERT INTO `expert_winners` VALUES ('392', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '277');
INSERT INTO `expert_winners` VALUES ('393', null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》', '1900', '全国优秀工程咨询成果三等奖', '主要完成人', '279');
INSERT INTO `expert_winners` VALUES ('394', null, '《福建粮食现代物流设施建设规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '279');
INSERT INTO `expert_winners` VALUES ('395', null, '《新疆维吾尔自治区粮食现代物流设施“十一五”及中长期建设规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '279');
INSERT INTO `expert_winners` VALUES ('396', null, '《福州海峡（松下港）粮食产业集群暨物流园区发展规划》', '1900', '北京优秀工程咨询成果一等奖', '主要完成人', '279');
INSERT INTO `expert_winners` VALUES ('397', null, '《贵州西南粮食现代物流生态产业园总体规划》', '1900', '北京优秀工程咨询成果二等奖', '主要完成人', '279');
INSERT INTO `expert_winners` VALUES ('398', null, '黑龙江农垦总局科技攻关课题《基于粮食供应链集成机制的垦区循环经济组织及运作研究》（HNKXIV-12-05a）', '1900', '获得黑龙江省农垦总局科学技术进步奖一等奖，证书号130115-01', '首要', '280');
INSERT INTO `expert_winners` VALUES ('399', null, '黑龙江省社会科学基金项目《黑龙江省大宗农产品供应链管理研究》，（03B028）', '1900', '获2009年度中国粮油学会科学技术奖三等奖，（获奖证书编号：lg-cg-2009-316）', '首要', '280');
INSERT INTO `expert_winners` VALUES ('400', null, '农产品供应链发展循环经济的推进机制研究[J]. 中国流通经济.2008,(10)', '1900', '大庆市第十四次社会科学优秀科研成果评奖,获论文类 一等奖', '首要', '280');
INSERT INTO `expert_winners` VALUES ('401', null, '专著《集成化大宗农产品供应链模型及其应用》', '1900', '黑龙江省第十三届社会科学优秀科研成果评奖中，获专著佳作奖（编号：13321）', '首要', '280');
INSERT INTO `expert_winners` VALUES ('402', null, '粮食及副产物精准组合干燥技术与装备集成', '1900', '中国粮油学会科学技术奖、二等奖', '技术创新', '281');
INSERT INTO `expert_winners` VALUES ('403', null, '带式高速包刷分拣机', '1900', '机械工业联合会、机械工业学会科技进步二等奖', '网络控制', '282');
INSERT INTO `expert_winners` VALUES ('404', null, '智能型总线式报刊分发数据显示系统', '1900', '第十四届（2003年）全国发明展览会银奖', '系统控制', '282');
INSERT INTO `expert_winners` VALUES ('405', null, '具有柔性变址功能的分拣机网络管理控制系统', '1900', '中国物流与采购联合会科技发明三等奖', '总体设计', '282');
INSERT INTO `expert_winners` VALUES ('406', null, '劳动模范', '', '河南省粮食行业', '', '284');
INSERT INTO `expert_winners` VALUES ('407', null, '2004年度粮食工作优秀调研报告二等奖', '', '国家粮食局授予', '', '284');
INSERT INTO `expert_winners` VALUES ('408', null, '大型立筒仓长期储粮综合性能实验研究', '', '河南省科技进步二等奖', '', '284');
INSERT INTO `expert_winners` VALUES ('409', null, '“粮食及副产物精准组合干燥技术与装备集成”', '', '科技进步二等奖', '', '285');
INSERT INTO `expert_winners` VALUES ('410', null, '“饲用抗生素及其替代产品开发利用关键技术” ', '', '第七届大北农科技一等奖', '', '285');
INSERT INTO `expert_winners` VALUES ('411', null, '中国粮食安全的现状、挑战与对策研究（研究报告）', '', '国家粮食局优秀软科学研究成果二等奖', '', '286');
INSERT INTO `expert_winners` VALUES ('412', '2004-01-01', '辛集黑马面粉厂', '三', '全国第十一届优秀工程设计铜质奖', '工艺设计', '288');
INSERT INTO `expert_winners` VALUES ('413', '2004-01-01', '大连南关岭国家粮食储备库立筒仓项目', '四', '全国第十一届优秀工程设计银质奖', '工艺设计', '288');
INSERT INTO `expert_winners` VALUES ('414', '2007-01-01', '福建粮食现代物流设施建设规划', '', '2007年度北京市优秀工程咨询成果一等奖', '主要参加人', '288');
INSERT INTO `expert_winners` VALUES ('415', '2011-01-01', '中央储备粮唐山直属库油脂油料仓储及加工项目可行性研究报告', '', '2011年度北京市优秀工程咨询成果二等奖', '主要参加人', '288');
INSERT INTO `expert_winners` VALUES ('416', '2012-01-01', '中央储备粮唐山直属库油脂油料仓储及加工项目可行性研究报告', '', '2012年度全国优秀工程咨询成果二等奖', '主要参加人', '288');
INSERT INTO `expert_winners` VALUES ('417', null, '谷物害虫实时监测与分类识别系统', '', '河南省科技进步三等奖', '', '289');
INSERT INTO `expert_winners` VALUES ('418', null, '粮情测控开放式软件平台', '', '河南省省软件创新大赛铜奖', '', '289');
INSERT INTO `expert_winners` VALUES ('419', '2007-01-01', '获国务院行业科技专家特殊津贴', '', '', '', '290');
INSERT INTO `expert_winners` VALUES ('420', null, '《中央储备粮唐山直属库油脂油料仓储物流加工项目》', '', '', '', '292');
INSERT INTO `expert_winners` VALUES ('421', '2007-01-01', '福建粮食现代物流设施建设规划', '第一', '北京市优秀工程咨询成果一等奖', '', '293');
INSERT INTO `expert_winners` VALUES ('422', '2009-01-01', '安徽粮食物流发展规划', '第一', '北京市优秀工程咨询成果三等奖', '', '293');
INSERT INTO `expert_winners` VALUES ('423', '2010-01-01', '北京炼焦化学厂能源研发科技中心项目', '第一', '北京市优秀工程咨询成果二等奖', '', '293');
INSERT INTO `expert_winners` VALUES ('424', '2011-01-01', '福州海峡（松下港）粮食产业集群暨物流园区发展规划', '第一', '北京市2011年优秀咨询成果一等奖，2012年全国优秀工程咨询成果三等奖', '', '293');
INSERT INTO `expert_winners` VALUES ('425', '2012-01-01', '贵州西南现代粮食生态产业物流中心总体规划', '第二', '北京市2012年优秀咨询成果二等奖，2014年全国优秀工程咨询成果三等奖', '', '293');
INSERT INTO `expert_winners` VALUES ('426', '2000-01-01', '我国散粮码头装卸工艺研究', '', '全国优秀学术成果 一等奖', '', '295');
INSERT INTO `expert_winners` VALUES ('427', '1996-01-01', '大连港散粮进口泊位工艺分析', '', '中国综合运输体系发展全书', '', '295');
INSERT INTO `expert_winners` VALUES ('428', '1983-01-01', '《黄曲霉毒素解毒剂》', '第4名', '重庆市政府2等奖，四川省政府3等奖', '', '296');
INSERT INTO `expert_winners` VALUES ('429', null, '《开发人力资源 构建学习型企业》', '第1名', '重庆市企业家协会2等奖', '', '296');
INSERT INTO `expert_winners` VALUES ('430', null, '《中央储备粮安全储藏技术示范》', '第8名', '中国粮油学会科学技术一等奖', '', '296');
INSERT INTO `expert_winners` VALUES ('431', null, '《国家粮库害虫害螨无公害控制研究》', '第5名', '重庆市政府三等奖', '', '296');
INSERT INTO `expert_winners` VALUES ('432', null, '储粮无公害防霉防潮技术应用研发', '1900', '北京粮食集团有限责任公司2014年度新技术成果二等奖', '主持', '300');
INSERT INTO `expert_winners` VALUES ('433', null, '装粮高度8米的超高大平房仓安全储粮综合技术', '1900', '北京粮食集团有限责任公司2013年度新技术成果一等奖', '主持', '300');
INSERT INTO `expert_winners` VALUES ('434', null, '8米装粮线高大平房仓储粮害虫综合防治技术', '1900', '北京粮食集团有限责任公司2012年度新技术成果一等奖', '主持', '300');
INSERT INTO `expert_winners` VALUES ('435', null, '惰性粉防治储粮虫害技术实仓应用', '1900', '北京粮食集团有限责任公司2010年度新技术成果一等奖', '主持', '300');
INSERT INTO `expert_winners` VALUES ('436', null, '玉米机械通风降水技术的研究', '1900', '获商业部科技进步三等奖', '主创之一', '301');
INSERT INTO `expert_winners` VALUES ('437', null, '固定地槽设计方案优化研究', '1900', '获石家庄地区科技进步二等奖', '主创之一', '301');
INSERT INTO `expert_winners` VALUES ('438', null, '排风扇通风降水技术的研究', '1900', '获石家庄地区科技进步二等奖', '主创之一', '301');
INSERT INTO `expert_winners` VALUES ('439', null, '玉米粮层阻力实验研究', '1900', '获石家庄地区科技进步二等奖', '主创之一', '301');
INSERT INTO `expert_winners` VALUES ('440', null, 'CO2气调储粮工程关键技术与装备的研究开发', '1900', '中国粮油学会科学技术奖二等奖', '', '302');
INSERT INTO `expert_winners` VALUES ('441', '2013-01-01', '氮气气调储粮技术应用工程', '1900', '中国粮油学会科学技术奖       一等奖', '负责总体方案编写，参与工程建设及应用试验。', '303');
INSERT INTO `expert_winners` VALUES ('442', '2008-01-01', '我国储粮害虫微生物污染物调查监测预报防治', '1900', '中国粮油学会科学技术奖       一等奖', '负责微生物部分的相关工作。', '303');
INSERT INTO `expert_winners` VALUES ('443', '2005-01-01', '新型就仓干燥技术及装备的研究开发', '1900', '中国粮油学会科学技术奖       二等奖', '负责实仓试验，提出干燥工艺及参数。', '303');
INSERT INTO `expert_winners` VALUES ('444', '2005-01-01', '粮食喷洒施药技术及装置', '1900', '中国粮油学会科学技术奖       三等奖', '课题负责人。', '303');
INSERT INTO `expert_winners` VALUES ('445', null, '二氧化碳气调储粮工程关键技术与装备的研究开发', '1900', '中国粮油学会科学技术二等奖', '主要参与', '304');
INSERT INTO `expert_winners` VALUES ('446', null, '减少三大粮食作物农户储粮损失技术集成与示范', '1900', '中国粮油学会科学技术一等奖', '主持', '304');
INSERT INTO `expert_winners` VALUES ('447', null, '我国储粮害虫微生物污染物调查监测预报防治', '1900', '中国粮油学会科学技术一等奖', '主要参与', '304');
INSERT INTO `expert_winners` VALUES ('448', null, '关于粮油仓储规范化管理的研究', '1900', '国家粮食局软科学研究成果奖三等奖', '参与', '304');
INSERT INTO `expert_winners` VALUES ('449', null, '获奖项目名称', '排名', '奖励名称及等级', '贡献', '305');
INSERT INTO `expert_winners` VALUES ('450', '2010-01-01', '粮食储备“四合一”新技术研究开发与集成创新”项目', '项目主要完成人', '国家科学技术进步奖一等奖', '实现储粮“四合一”新技术研究开发与集成创新', '305');
INSERT INTO `expert_winners` VALUES ('451', '2011-01-01', '“国家粮食储备新技术研究开发与集成示范”项目', '项目主要完成人', '中国粮油学会科技进步特等奖', '实现储粮新技术研究开发与集成示范', '305');
INSERT INTO `expert_winners` VALUES ('452', '2013-01-01', '氮气气调储粮技术应用工程', '第二名', '中国粮油科学技术奖一等奖', '推进氮气气调储粮技术应用', '305');
INSERT INTO `expert_winners` VALUES ('453', '2010-01-01', '《平房仓粮面冷气囊密闭压盖动态隔热控温储粮技术研究》', '第一作者', '湖北省自然科学优秀学术论文三等奖', '主持人', '308');
INSERT INTO `expert_winners` VALUES ('454', null, '《高大平房仓磷化氢熏蒸后残留量变化研究》', '第一作者', '湖北省第十五届自然科学优秀学术论文三等奖', '主持人', '308');
INSERT INTO `expert_winners` VALUES ('455', null, '稻谷在储干燥试验', '1900', '中国粮油学会第五届优秀论文三等奖', '主要参与人员', '309');
INSERT INTO `expert_winners` VALUES ('456', null, '移动式循环谷物烘干机研究与应用', '第二', '周口讥科学技术进步二等奖', '结构设计', '310');
INSERT INTO `expert_winners` VALUES ('457', null, '中央储备粮安全储藏技术示范', '第11名', '中国粮油学会科学技术奖  一等奖', '', '311');
INSERT INTO `expert_winners` VALUES ('458', null, '大型仓储库粮食保鲜、监测技术研究——粮食烘干过程控制系统', '第6名', '中国粮油学会科学技术奖  二等奖', '', '311');
INSERT INTO `expert_winners` VALUES ('459', null, '东北冷湿区粮食储藏保鲜技术优化组合', '第3名', '中国粮油学会科学技术奖  三等奖', '', '311');
INSERT INTO `expert_winners` VALUES ('460', null, '偏高水分粮食安全储藏技术的研究开发', '第5名', '中国粮油学会科学技术奖  三等奖', '', '311');
INSERT INTO `expert_winners` VALUES ('461', null, '年度评优', '', '广州分公司先进工作者', '', '313');
INSERT INTO `expert_winners` VALUES ('462', null, '特殊贡献奖', '第一', '广东新沙港直属库特殊贡献奖', '完成测温系统防腐蚀功能研究与改造', '313');
INSERT INTO `expert_winners` VALUES ('463', null, '总公司评优', '', '优秀科技工作者', '', '313');
INSERT INTO `expert_winners` VALUES ('464', null, '浅圆仓布料器研发', '第二', '广州分公司科技项目评选一等奖', '产品的生产制造与改进方案及实施', '313');
INSERT INTO `expert_winners` VALUES ('465', null, '《CO2对主要粮食霉菌控制效果的研究》', '第六', '1991年商业部一等奖，1992年国家科委三等奖', '参与', '315');
INSERT INTO `expert_winners` VALUES ('466', null, '《谷物保护剂 “保粮磷”的研制及生产性中试》', '第三', '1994年国内贸易部三等奖', '参与', '315');
INSERT INTO `expert_winners` VALUES ('467', null, '现代气调控温储粮技术扩大应用', '第六', '2013年中国粮油学会科学技术一等奖', '主持', '315');
INSERT INTO `expert_winners` VALUES ('468', null, '国家粮食储备新技术研究开发与集成创新', '第17', '中国粮油学会科学技术奖特等奖', '', '316');
INSERT INTO `expert_winners` VALUES ('469', null, '粮食绿色储运保鲜新技术研究开发', '第2', '中国粮油学会科学技术奖三等奖', '', '316');
INSERT INTO `expert_winners` VALUES ('470', null, '以粮油为主要特色的食品科学与工程专业建设探索与实践', '第1', '江苏省高等教育教学成果2等奖', '', '316');
INSERT INTO `expert_winners` VALUES ('471', null, '获奖项目名称', '排名', '奖励名称及等级', '贡献', '317');
INSERT INTO `expert_winners` VALUES ('472', null, '第四届全国粮食行业优秀创业企业家', '', '', '', '317');
INSERT INTO `expert_winners` VALUES ('473', null, '中国粮油学会第七届理事会理事', '', '', '', '317');
INSERT INTO `expert_winners` VALUES ('474', null, '人民检察院特约检察员', '', '', '', '317');
INSERT INTO `expert_winners` VALUES ('475', null, '山东省新长征突击手', '', '', '', '317');
INSERT INTO `expert_winners` VALUES ('476', '2014-01-01', '仓储设施、设备', '', '中国政府采购网优秀供应商', '', '318');
INSERT INTO `expert_winners` VALUES ('477', '2014-01-01', '仓储设施、设备', '', 'AA‘守合同重信用’单位', '', '318');
INSERT INTO `expert_winners` VALUES ('478', '2010-01-01', '仓储设施、设备', '', '中国粮油学会理事会理事', '', '318');
INSERT INTO `expert_winners` VALUES ('479', '2011-01-01', '仓储设施、设备', '', '中国粮油学会团体会员', '', '318');
INSERT INTO `expert_winners` VALUES ('480', null, '粮油原料中主要真菌毒素检测及控制技术研究和应用示范', '1900', '中国粮油学会科学技术奖，二等', '组织与应用示范', '320');
INSERT INTO `expert_winners` VALUES ('481', '2006-01-01', '“气调储粮工程关键技术与装备的研究开发”（2001BA512B03）', '1900', '中国粮油学会科学技术奖二等奖', '主要完成人', '321');
INSERT INTO `expert_winners` VALUES ('482', '2009-01-01', '“稻谷高效干燥与玉米储运减损增效技术开发与示范”（2004BA520A18）', '1900', '国家科学进步二等奖', '子课题负责人', '321');
INSERT INTO `expert_winners` VALUES ('483', null, '减少三大粮食作物农户储粮损失技术集成与示范', '1900', '中国粮油学会科技奖一等', '主要研究', '323');
INSERT INTO `expert_winners` VALUES ('484', null, '国家粮食储备新技术研究开发与集成创新', '1900', '中国粮油学会特等奖', '参与研究', '323');
INSERT INTO `expert_winners` VALUES ('485', null, '华北平原小麦产区农户储粮减损技术集成与示范', '1900', '河南省人民政府科技奖三等', '主持', '323');
INSERT INTO `expert_winners` VALUES ('486', null, '小麦质量监控关键技术研究与示范', '1900', '河南省教育厅科技奖一等', '主要研究', '323');
INSERT INTO `expert_winners` VALUES ('487', null, '网络化多功能粮情监控系统研究开发与应用示范', '第6', '中国粮油学会科技进步一等奖', '', '324');
INSERT INTO `expert_winners` VALUES ('488', null, '中央储备粮粮情测控开放式软件平台研究开发', '第2', '河南省科技进步二等奖', '', '324');
INSERT INTO `expert_winners` VALUES ('489', null, '基于现场总线结构的储备库粮情检测系统', '第2', '河南省科技进步三等奖', '', '324');
INSERT INTO `expert_winners` VALUES ('490', null, '于SMS技术的粮食流通管理信息系统', '第2', '中国粮油学会科技进步三等奖', '', '324');
INSERT INTO `expert_winners` VALUES ('491', null, '粮食通风干燥技术与设备', '1900', '黑龙江省科技进步三等奖', '参加', '327');
INSERT INTO `expert_winners` VALUES ('492', null, '粮食喷洒施药技术及装置的研制', '1900', '三等奖', '主研', '330');
INSERT INTO `expert_winners` VALUES ('493', null, '中国粮油学会', '1900', '中国粮油学会一等奖', '主研', '330');
INSERT INTO `expert_winners` VALUES ('494', null, '我国储粮害虫微生物污染物调查监测预报防治', '第一', '2008年中国粮油学会科学技术一等奖', '主持', '331');
INSERT INTO `expert_winners` VALUES ('495', '2010-01-01', '粮食储备“四合一”新技术研究开发与集成创新成果', '第六', '2010年度国家科技进步一等奖', '参与', '331');
INSERT INTO `expert_winners` VALUES ('496', null, '获奖项目名称', '排名', '奖励名称及等级', '贡献', '332');
INSERT INTO `expert_winners` VALUES ('497', null, '南方米粉品质改良及安全生产综合技术', '第一', '中国粮油学会科学技术二等奖', '项目主持', '332');
INSERT INTO `expert_winners` VALUES ('498', null, '米粉品质改良综合技术', '第一', '中国轻工业联合会科学技术发明奖', '项目主持', '332');
INSERT INTO `expert_winners` VALUES ('499', null, '《广东省优质籼稻谷》标准', '第三', '广东省轻工业协会科学技术进步二等奖', '主要完成', '332');
INSERT INTO `expert_winners` VALUES ('500', null, '微胶囊谷物保护剂“储粮安”', '第四', '中国粮油学会科学技术三等奖', '主要完成', '332');
INSERT INTO `expert_winners` VALUES ('501', null, '粮食储备四合一新技术研究开发与集成创新', '1900', '国家科技进步奖/一等奖', '主研人员', '334');
INSERT INTO `expert_winners` VALUES ('502', '2007-01-01', '减少三大粮食作物农户储粮损失技术集成与示范', '1900', '2007年中国粮油科技进步一等奖', '参与', '335');
INSERT INTO `expert_winners` VALUES ('503', '2005-01-01', '《中国储粮害虫资源库及信息查询系统》', '1900', '2013年中国粮油科技进步三等奖', '主要参与', '337');
INSERT INTO `expert_winners` VALUES ('504', '2008-01-01', '我国储粮害虫微生物污染物调查监测预报防治', '1900', '2008年中国粮油科技进步一等奖', '主要参与', '337');
INSERT INTO `expert_winners` VALUES ('505', '2013-01-01', '粮食绿色储运保鲜新技术研究开发', '1900', '中国粮油学会科学技术奖三等奖', '', '338');
INSERT INTO `expert_winners` VALUES ('506', null, '获奖项目名称', '排名', '奖励名称及等级', '贡献', '339');
INSERT INTO `expert_winners` VALUES ('507', null, '储藏物昆虫生物学及生物防治研究', '1900', '湖北省科技进步三等奖', '', '339');
INSERT INTO `expert_winners` VALUES ('508', null, '新型生物农药蛇床子素创制及其控制储粮/蔬菜病虫害应用', '1900', '湖北省科技进步三等奖', '', '339');
INSERT INTO `expert_winners` VALUES ('509', null, '微胶囊谷物保护剂“储粮安”', '1900', '中国粮油学会科技进步三等奖', '', '340');
INSERT INTO `expert_winners` VALUES ('510', null, '蛇床子素粉剂对储粮害虫的防治效果', '1900', '中国粮油学会第六届论坛优秀论文奖', '', '340');
INSERT INTO `expert_winners` VALUES ('511', '2010-01-01', '粮食储备“四合一”新技术研究开发与集成创新', '1900', '国家科学技术进步奖～一等奖', '主要承担人', '341');
INSERT INTO `expert_winners` VALUES ('512', null, '国家粮食储备技术研究开发与集成创新', '1900', '中国粮油学会科学技术进步奖～特等奖', '主要承担人', '341');
INSERT INTO `expert_winners` VALUES ('513', null, '我国储粮害虫微生物污染物监测预防防治', '1900', '中国粮油学会科学技术进步奖～一等奖', '主要承担人', '341');
INSERT INTO `expert_winners` VALUES ('514', null, '中央储备粮情测控开放式软件平台研究开发', '1900', '河南省人民政府科技进步奖～二等奖', '主要承担人', '341');
INSERT INTO `expert_winners` VALUES ('515', null, '中央储备粮安全储藏技术示范研究', '1900', '中国粮油学会科学技术进步奖～一等奖', '主要承担人', '341');
INSERT INTO `expert_winners` VALUES ('516', null, '微胶囊谷物保护剂“储粮安”', '1900', '中国粮油学会科技三等奖', '参与', '342');
INSERT INTO `expert_winners` VALUES ('517', null, '主要储粮害虫对磷化氢抗性及对策研究', '1900', '国内贸易部科技进步奖二等奖', '参与', '342');
INSERT INTO `expert_winners` VALUES ('518', null, '全国粮油优秀工作者', '', '中国粮油学会', '', '342');
INSERT INTO `expert_winners` VALUES ('519', '2000-01-01', '移动式微电脑程控环流熏蒸机研制和应用', '1900', '河南省“星火”科技二等奖', '主要完成人', '345');
INSERT INTO `expert_winners` VALUES ('520', '2002-01-01', '高大平房仓磷化氢间歇施药环流熏蒸杀虫技术研究', '1900', '河南省科技进步三等奖', '负责人', '345');
INSERT INTO `expert_winners` VALUES ('521', '2010-01-01', '国家粮食储备新技术研究开发与集成创新', '1900', '中国粮油学会科学技术特等奖', '主要完成人', '345');
INSERT INTO `expert_winners` VALUES ('522', '2013-01-01', '华北平原小麦产区农户储粮减损技术集成与示范', '1900', '河南省科技进步三等奖', '主要完成人', '345');
INSERT INTO `expert_winners` VALUES ('523', null, '小麦加工与流通过程食品安全关键技术研究与示范', '1900', '河南省科技进步二等奖', '微生物防控', '346');
INSERT INTO `expert_winners` VALUES ('524', null, '小麦加工及转化新技术研究与应用', '1900', '河南省科技进步一等奖', '微生物防控', '346');
INSERT INTO `expert_winners` VALUES ('525', null, '国家粮食储备新技术研究开发与集成创新', '1900', '中国粮油学会特等奖', '微生物防控', '346');
INSERT INTO `expert_winners` VALUES ('526', null, '储粮微生物活性快速检测技术研究与开发', '1900', '中国粮油学会二等奖', '微生物防控', '346');
INSERT INTO `expert_winners` VALUES ('527', null, '南方蔬菜清洁关键技术', '第15', '国家科技进步二等奖', '第15 ', '349');
INSERT INTO `expert_winners` VALUES ('528', '1994-01-01', '主要储粮害虫对磷化氢抗性及对策研究', '1900', '国内贸易部科技进步二等奖', '主研', '350');
INSERT INTO `expert_winners` VALUES ('529', '2005-01-01', '中国储粮害虫资源库及信息查询系统', '1900', '中国粮油学会科学技术三等奖', '主持', '350');
INSERT INTO `expert_winners` VALUES ('530', '2008-01-01', '我国储粮害虫微生物污染物调查监测预报防治', '1900', '中国粮油学会科学技术一等奖', '主研', '350');
INSERT INTO `expert_winners` VALUES ('531', '2010-01-01', '《储粮化学药剂管理和使用规范》标准研究与制定', '1900', '中国粮油学会科学技术三等奖', '主研', '350');
INSERT INTO `expert_winners` VALUES ('532', null, '粮油原料中主要真菌毒素检测及控制技术研究和应用示范', '1900', '2014年度中国粮油学会科学技术奖/二等奖', '项目第一完成人员', '356');
INSERT INTO `expert_winners` VALUES ('533', null, '降低催化裂化汽油硫含量助剂的开发与工业应用', '1900', '中国石油化工集团公司科技进步三等奖', '开发其中分析方法并参加硫化物分布规律研究', '358');
INSERT INTO `expert_winners` VALUES ('534', null, '清洁燃料与煤液化油配套分析技术研究', '1900', '中国石油化工集团公司科技进步三等奖', '参与其中分析方法开发', '358');
INSERT INTO `expert_winners` VALUES ('535', null, '石油加工过程中的脱硫', '1900', '中国石油化工集团公司科技进步三等奖', '从事其中硫化物规律研究', '358');
INSERT INTO `expert_winners` VALUES ('536', null, '酒类色谱分析应用集成技术', '1900', '中国分析测试协会科学技术三等奖', '从事葡萄酒及黄酒分析方法开发', '358');
INSERT INTO `expert_winners` VALUES ('537', '2013-01-01', '辽宁农村储粮装备技术及绿色储粮示范', '1900', '辽宁省科学技术奖 三等', '', '363');
INSERT INTO `expert_winners` VALUES ('538', '2013-01-01', '玉米烘干机系统节能减排技术集成与创新', '1900', '辽宁农业科技贡献奖 一等', '', '363');
INSERT INTO `expert_winners` VALUES ('539', null, '特种油脂与检验方法标准研究制定', '1900', '中国粮油学会中国粮油学会科学技术二等奖', '', '364');
INSERT INTO `expert_winners` VALUES ('540', null, '微胶囊谷物保护剂“储粮安”', '1900', '中国粮油学会科技三等奖', '参与', '368');
INSERT INTO `expert_winners` VALUES ('541', null, '主要储粮害虫对磷化氢抗性及对策研究', '1900', '国内贸易部科技进步奖二等奖', '参与', '368');
INSERT INTO `expert_winners` VALUES ('542', null, '全国粮油优秀工作者', '', '中国粮油学会', '', '368');
INSERT INTO `expert_winners` VALUES ('543', null, '微胶囊谷物保护剂“储粮安”', '1900', '中国粮油学会科技三等奖', '参与', '371');
INSERT INTO `expert_winners` VALUES ('544', null, '主要储粮害虫对磷化氢抗性及对策研究', '1900', '国内贸易部科技进步奖二等奖', '参与', '371');
INSERT INTO `expert_winners` VALUES ('545', null, '全国粮油优秀工作者', '', '中国粮油学会', '', '371');
INSERT INTO `expert_winners` VALUES ('546', null, '微胶囊谷物保护剂“储粮安”', '1900', '中国粮油学会科技三等奖', '参与', '374');
INSERT INTO `expert_winners` VALUES ('547', null, '主要储粮害虫对磷化氢抗性及对策研究', '1900', '国内贸易部科技进步奖二等奖', '参与', '374');
INSERT INTO `expert_winners` VALUES ('548', null, '全国粮油优秀工作者', '', '中国粮油学会', '', '374');
INSERT INTO `expert_winners` VALUES ('549', null, '微胶囊谷物保护剂“储粮安”', '1900', '中国粮油学会科技三等奖', '参与', '377');
INSERT INTO `expert_winners` VALUES ('550', null, '主要储粮害虫对磷化氢抗性及对策研究', '1900', '国内贸易部科技进步奖二等奖', '参与', '377');
INSERT INTO `expert_winners` VALUES ('551', null, '全国粮油优秀工作者', '', '中国粮油学会', '', '377');
INSERT INTO `expert_winners` VALUES ('552', null, '微胶囊谷物保护剂“储粮安”', '1900', '中国粮油学会科技三等奖', '参与', '380');
INSERT INTO `expert_winners` VALUES ('553', null, '主要储粮害虫对磷化氢抗性及对策研究', '1900', '国内贸易部科技进步奖二等奖', '参与', '380');
INSERT INTO `expert_winners` VALUES ('554', null, '全国粮油优秀工作者', '', '中国粮油学会', '', '380');
INSERT INTO `expert_winners` VALUES ('555', null, '获奖项目名称', '排名', '奖励名称及等级', '贡献', '382');
INSERT INTO `expert_winners` VALUES ('556', null, '获奖项目名称', '排名', '奖励名称及等级', '贡献', '383');
INSERT INTO `expert_winners` VALUES ('557', null, '大型高效粮食清理装备关键技术研究与集成创新', '第七', '中国粮油学会科学技术奖一等奖', '重要', '384');
INSERT INTO `expert_winners` VALUES ('558', null, 'FDSW45X80小麦打刷组合机', '第三', '开封市科学技术奖三等奖', '重要', '384');
INSERT INTO `expert_winners` VALUES ('559', null, '风味化合物及RI指数查询系统研究', '1900', '上海交大晨星学者SMC奖  ', '食品质量与安全', '385');
INSERT INTO `expert_winners` VALUES ('560', null, 'Liquid-liquid extraction of polycyclic aromatic hydrocarbons in four different edible oils from China. ', '1900', '国际埃尼奖提名', 'Promote research on the environment and help the new generations of researchers to emerge', '385');
INSERT INTO `expert_winners` VALUES ('561', null, 'Research on Fatty acids & Flavors', '1900', '德国汉诺威大学“Certificate of Appreciation”', 'Significant contribution to the Institute of Food Chemistry ', '385');
INSERT INTO `expert_winners` VALUES ('562', null, 'In recognition of engagement with our Society’s mission of service\nto the global community of chemists', '1900', '美国化学会“Cetificate of Membership Award”', 'ACS Reviewer', '385');
INSERT INTO `expert_winners` VALUES ('563', null, '玉米芯酶法制备低聚木糖 ', '1900', '国家技术发明二等奖', '关键技术', '386');
INSERT INTO `expert_winners` VALUES ('564', null, '中国青年科技奖', '1900', '中国青年科技奖', '优秀人才', '386');
INSERT INTO `expert_winners` VALUES ('565', null, '光华工程科技奖', '1900', '光华工程科技奖/青年奖', '优秀人才', '386');
INSERT INTO `expert_winners` VALUES ('566', null, '嗜热真菌耐热木聚糖酶的高产菌株选育、研发和应用', '1900', '教育部科技进步二等奖', '技术负责人', '386');
INSERT INTO `expert_winners` VALUES ('567', null, 'MTX-250型馒头自动生产线', '第一', '河南省科技进步二等奖', '主持人', '387');
INSERT INTO `expert_winners` VALUES ('568', null, '小麦大面积高产综合配套技术开发与示范；小麦储藏加工技术研究与设备的开发', '第一', '河南省科技进步奖一等奖', '专题主持人', '387');
INSERT INTO `expert_winners` VALUES ('569', null, 'GSX-50型谷物食品生产线', '第一', '河南省科技进步二等奖', '主持人', '387');
INSERT INTO `expert_winners` VALUES ('570', null, '馒头连续流加发酵及醒蒸一体化技术开发', '第一', '国家发明专利', '专利权人', '387');
INSERT INTO `expert_winners` VALUES ('571', null, '亲水性水分散型单甘酯的开发', '三等奖', '郑州市科学技术进步奖', '开发乳化剂高技术产品', '388');
INSERT INTO `expert_winners` VALUES ('572', null, '生物酶符合乳化剂的开发', '一等奖', '郑州市科学技术进步奖', '开发乳化剂高技术产品', '388');
INSERT INTO `expert_winners` VALUES ('573', null, '面制食品工艺技术开发及应用', '一等奖', '中国粮油科技进步奖', '开发面制食品新工艺新技术', '388');
INSERT INTO `expert_winners` VALUES ('574', null, '糯米粉综合利用增值技术', '1900', '河南省科技进步三等奖', '', '389');
INSERT INTO `expert_winners` VALUES ('575', null, '羟丙基糯米淀粉制备工艺及其在速冻汤圆中的应用', '1900', '河南省工业和信息化科技成果二等奖', '', '389');
INSERT INTO `expert_winners` VALUES ('576', null, '“抗震救灾先进个人”', '', '宜昌市', '', '390');
INSERT INTO `expert_winners` VALUES ('577', '2012-01-01', '科技型中小企业技术创新基金项目', '贡献奖', '河南省轻工业科学技术进步奖', '研发面制食品新工艺、新技术', '392');
INSERT INTO `expert_winners` VALUES ('578', '2012-01-01', '河南省高新技术产业化重点项目', '三等奖', '河南省科学技术进步奖', '研发面制食品新产品', '392');
INSERT INTO `expert_winners` VALUES ('579', '2014-01-01', '河南省重大产业技术开发项目', '一等奖', '河南省科学技术进步奖', '研发面制食品加工智能化装备', '392');
INSERT INTO `expert_winners` VALUES ('580', null, '糙米集装储运减损技术和设备研发与示范', '1900', '中国粮油学会科学技术奖二等奖', '提出糙米储存品质评价体系', '394');
INSERT INTO `expert_winners` VALUES ('581', null, '我国粮油储藏加工重要科技基础标准研究', '1900', '中国粮油学会科学技术奖三等', '主持完成主要面制食品品质评价标准', '394');
INSERT INTO `expert_winners` VALUES ('582', null, '谷物储存品质判定规则的研制', '1900', '中国标准创新贡献奖二等奖', '主持完成小麦储存品质判定规则', '394');
INSERT INTO `expert_winners` VALUES ('583', null, '大宗淡水养殖水产品精制加工技术研究与产业化', '排名第2', '中国商业联合会科学技术奖/全国商业科技进步奖特等奖', '淡水鱼加工与保鲜技术创新', '397');
INSERT INTO `expert_winners` VALUES ('584', null, '淡水鱼精深加工关键技术研究及产业化示范', '排名第一', '2010年度湖北省科技进步奖二等奖', '淡水鱼加工保鲜技术与产品创新', '397');
INSERT INTO `expert_winners` VALUES ('585', null, '《粳稻品种图鉴》', '1900', '获黑龙江省农委科学技术二等奖', '', '398');
INSERT INTO `expert_winners` VALUES ('586', null, '谷物籽粒粗淀粉测定法标准化研究”', '1900', '黑龙江省政府科技进步三等奖', '', '398');
INSERT INTO `expert_winners` VALUES ('587', null, '黑龙江省春小麦面条品质鉴定方法的研究”', '1900', '黑龙江省农科院科学技术三等奖', '', '398');
INSERT INTO `expert_winners` VALUES ('588', null, '4. 非膨化型组织化植物蛋白加工的切割装置', '1900', '实用新型专利 ZL2008 2 0091308.1', '', '398');
INSERT INTO `expert_winners` VALUES ('589', null, '小麦籽粒质量分析及利用技术研究', '7/9', '二等奖/省部级', '关键技术攻关', '399');
INSERT INTO `expert_winners` VALUES ('590', null, '吉林西部燕麦种植模式、水肥生理及加工利用技术理论基础研究', '4/10', '一等奖/省部级', '燕麦加工技术', '399');
INSERT INTO `expert_winners` VALUES ('591', null, '馒头工业化关键技术及装备开发', '2/9', '二等奖', '产品关键技术控制及品质管理', '399');
INSERT INTO `expert_winners` VALUES ('592', null, '', '', '', '', '401');
INSERT INTO `expert_winners` VALUES ('593', null, '', '', '', '', '402');
INSERT INTO `expert_winners` VALUES ('594', '2010-01-01', '获奖项目名称1', '一等奖', '国家科学技术进步一等奖', '贡献1', '403');
INSERT INTO `expert_winners` VALUES ('595', '2009-01-01', '获奖项目名称2', '二等奖', '中国粮油学会科技进步特等奖（证书号：ly-cg-2009-001)', '贡献2', '403');
INSERT INTO `expert_winners` VALUES ('596', '2005-01-01', '获奖项目名称3', '一等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-322)', '贡献3', '403');
INSERT INTO `expert_winners` VALUES ('597', '2005-01-01', '获奖项目名称4', '三等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2005-309)', '贡献4', '403');
INSERT INTO `expert_winners` VALUES ('598', '2006-01-01', '获奖项目名称5', '特等奖', '中国粮油学会科学技术三等奖（证书号：ly-cg-2006-310)', '贡献5', '403');

-- ----------------------------
-- Table structure for `expert_writings`
-- ----------------------------
DROP TABLE IF EXISTS `expert_writings`;
CREATE TABLE `expert_writings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ExpertID` int(11) DEFAULT NULL COMMENT '专家编号',
  `Writings` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '论文/著作名称',
  `Identity` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '作者身份',
  `Publishers` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '发表期刊/出版社',
  `Date` date DEFAULT NULL COMMENT '出版时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=789 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of expert_writings
-- ----------------------------
INSERT INTO `expert_writings` VALUES ('53', '53', '', '', '', '2015-12-09');
INSERT INTO `expert_writings` VALUES ('55', '57', 'Degradation of Ocharatoxin A by Bacillus amyloquefaciens ASAG1 ', '通讯作者', 'Food and Additives & Contaminants: Part A(SCI)', '2014-01-01');
INSERT INTO `expert_writings` VALUES ('56', '57', 'A simple and efficient strategy for the synthesis of achemically tailored g-C3N4 material†', '参与作者', 'Journal of', '2014-01-01');
INSERT INTO `expert_writings` VALUES ('57', '57', '利用PCR-RFLP方法鉴别黄曲霉毒素产毒菌株', '通讯作者', '中国农业科学', '2014-01-01');
INSERT INTO `expert_writings` VALUES ('58', '57', '转基因水稻Bt63外源基因含量分析', '第一作者', '中国粮油学报', '2013-01-01');
INSERT INTO `expert_writings` VALUES ('59', '57', '利用生物技术消减、防控粮食及其制品中的真菌毒素', '第一作者', '中国粮油学报', '2009-01-01');
INSERT INTO `expert_writings` VALUES ('60', '58', '纳米氧化铁修饰玻碳电极测定痕量镉离子', '第一作者', '分析测试学报/《分析测试学报》编辑部', '2012-02-01');
INSERT INTO `expert_writings` VALUES ('61', '58', '常见阴离子对镉离子电化学检测的影响', '第一作者', '环境化学/科学出版社', '2012-06-01');
INSERT INTO `expert_writings` VALUES ('62', '58', '乙二胺四乙酸修饰碳糊电极测定镉离子含量', '第一作者', '粮食科技与经济/粮食科技与经济杂志社', '2014-06-01');
INSERT INTO `expert_writings` VALUES ('63', '58', '地沟油检测指标及方法研究现状与展望', '第一作者', '食品与机械/《食品与机械》编辑部', '2014-09-01');
INSERT INTO `expert_writings` VALUES ('64', '55', '英汉粮油食品词汇', '第2', '化学工业出版社', '2008-01-02');
INSERT INTO `expert_writings` VALUES ('65', '55', '英汉粮油食品词汇', '副主编', '中国轻工业出版社', '2007-01-10');
INSERT INTO `expert_writings` VALUES ('66', '60', 'Effect of cross-linked acetylated starch content on the structure and stability of set yoghurt', '1/5，通讯作者', 'Food Hydrocolloids', '2014-03-01');
INSERT INTO `expert_writings` VALUES ('67', '60', 'The interaction between casein and  hydroxypropyl  distarch phosphate (HPDSP) in yoghurt system', '1/5，通讯作者', 'Food Hydrocolloids', '2014-06-01');
INSERT INTO `expert_writings` VALUES ('68', '60', 'Influence of acetylated potato starch on the properties of dumpling Wrapper', '通讯作者', 'Industrial Crops and Products', '2014-05-01');
INSERT INTO `expert_writings` VALUES ('69', '60', 'Microstructure and rheology of apple jam as influenced by cross-linked acetylated starch', '通讯作者', 'Starch/Stärke ', '2014-08-01');
INSERT INTO `expert_writings` VALUES ('70', '60', 'Research on the water-holding capacity of pork sausage with acetate cassava starch', '通讯作者', 'Starch/Stärke ', '2014-09-01');
INSERT INTO `expert_writings` VALUES ('71', '100', 'Bonding strength and water resistance of starch-based wood adhesive improved by silica nanoparticles', '第一', 'Carbohydrate Polymers,Elsevier', '2011-08-01');
INSERT INTO `expert_writings` VALUES ('72', '100', 'Preparation, characterization and properties of starch-based wood adhesive', '第一', 'Carbohydrate Polymers,Elsevier', '2012-04-01');
INSERT INTO `expert_writings` VALUES ('73', '100', 'Effects of urea on freeze–thaw stability of starch-based wood adhesive', '第一', 'Carbohydrate Polymers,Elsevier', '2013-06-01');
INSERT INTO `expert_writings` VALUES ('74', '100', 'Effects of emulsifier on the bonding performance and freeze–thaw stability of starch-based wood adhesive', '第一', 'Cellulose，Springer', '2013-10-01');
INSERT INTO `expert_writings` VALUES ('75', '100', '微波协同酶法提取蛹虫草基质多糖工艺的优化研究', '第一', '食品工业科技，食品工业科技杂志社', '2014-06-01');
INSERT INTO `expert_writings` VALUES ('76', '111', '平房仓粮堆温度的时空分布的基本统计特征分析', '第二作者', '粮食储藏', '2010-04-01');
INSERT INTO `expert_writings` VALUES ('77', '111', '粮食储藏中粮堆温度与大气温度之关系', '第一作者', '粮油食品科技', '2002-06-01');
INSERT INTO `expert_writings` VALUES ('78', '111', '储粮新技术教程（第四章 粮情测控软件系统）', '参与', '中国经济出版社', '2001-01-01');
INSERT INTO `expert_writings` VALUES ('79', '111', '粮库信息化建设与管理实务', '参与', '百家出版社', '2006-01-01');
INSERT INTO `expert_writings` VALUES ('80', '113', '平房仓粮堆温度的时空分布的基本统计特征分析', '第二作者', '粮食储藏', '2010-04-01');
INSERT INTO `expert_writings` VALUES ('81', '113', '粮食储藏中粮堆温度与大气温度之关系', '第一作者', '粮油食品科技', '2002-06-01');
INSERT INTO `expert_writings` VALUES ('82', '112', '平房仓粮堆温度的时空分布的基本统计特征分析', '第二作者', '粮食储藏', '2010-04-01');
INSERT INTO `expert_writings` VALUES ('83', '113', '储粮新技术教程（第四章 粮情测控软件系统）', '参与', '中国经济出版社', '2001-01-01');
INSERT INTO `expert_writings` VALUES ('84', '112', '粮食储藏中粮堆温度与大气温度之关系', '第一作者', '粮油食品科技', '2002-06-01');
INSERT INTO `expert_writings` VALUES ('85', '113', '粮库信息化建设与管理实务', '参与', '百家出版社', '2006-01-01');
INSERT INTO `expert_writings` VALUES ('86', '112', '储粮新技术教程（第四章 粮情测控软件系统）', '参与', '中国经济出版社', '2001-01-01');
INSERT INTO `expert_writings` VALUES ('87', '112', '粮库信息化建设与管理实务', '参与', '百家出版社', '2006-01-01');
INSERT INTO `expert_writings` VALUES ('88', '114', '基于中储粮安全内网的粮情测控', '第二作者', '河南工业大学学报', '2014-01-09');
INSERT INTO `expert_writings` VALUES ('89', '117', '糖醇生产技术与应用 ', '主编', '中国轻工业出版社', '2007-12-11');
INSERT INTO `expert_writings` VALUES ('90', '117', '木薯的工业开发利用', '主编', '科技普及出版社', '1985-01-14');
INSERT INTO `expert_writings` VALUES ('91', '117', '木薯淀粉生产技术', '副主编', '广西人民出版社', '1985-01-23');
INSERT INTO `expert_writings` VALUES ('92', '117', '生物质能源沼气发电', '副主编', '中国轻工业出版', '2008-01-16');
INSERT INTO `expert_writings` VALUES ('93', '119', '北粮南运对接的发展与趋势', '本人', '中国粮油学会学报', '2006-01-11');
INSERT INTO `expert_writings` VALUES ('94', '119', '港口企业要警惕经营中的不必要风险', '本人', '中国港口协会', '2008-01-09');
INSERT INTO `expert_writings` VALUES ('95', '120', '油脂资源综合利用', '主编', '湖北科技出版社', '2001-01-11');
INSERT INTO `expert_writings` VALUES ('96', '121', '《油脂精炼与加工工艺学》第二版', ' 副主编', '化学工业出版社', '2013-07-16');
INSERT INTO `expert_writings` VALUES ('97', '121', '《油脂工厂设计手册》', '参编', '湖北科学技术出版社', '2012-08-01');
INSERT INTO `expert_writings` VALUES ('98', '121', '《油料加工工艺学》', '副主编', '郑州大学出版社', '2011-09-01');
INSERT INTO `expert_writings` VALUES ('99', '121', '《制油工》技师 高级技师 ', '参编', '中国轻工出版社', '2011-01-01');
INSERT INTO `expert_writings` VALUES ('100', '121', '《制油工》初级 中级  高级', '参编', '中国轻工出版社', '2007-01-01');
INSERT INTO `expert_writings` VALUES ('101', '123', '来自饲料生产第一线的技术问答', '第一', '中国农业科学技术出版社', '2013-01-09');
INSERT INTO `expert_writings` VALUES ('102', '123', '养猪场生产管理与饲料加工技术问答', '第一', '中国农业科学技术出版社', '2013-01-09');
INSERT INTO `expert_writings` VALUES ('103', '124', '磨粉机喂料系统控制部分的改造', '解松嵩', '粮食与饲料工业', '1999-10-01');
INSERT INTO `expert_writings` VALUES ('104', '124', '强化营养 开发保健面粉', '解松嵩', '西部粮油科技', '2000-05-01');
INSERT INTO `expert_writings` VALUES ('105', '126', '饲料厂工程设计规范', '2', '农业部、商业部', '1993-01-07');
INSERT INTO `expert_writings` VALUES ('106', '126', '中国粮油食品加工现状及发展', '1', '粮食与食品工业', '1999-01-07');
INSERT INTO `expert_writings` VALUES ('107', '126', '世纪之交中国粮食工业面临大发展机遇与挑战', '1', '中国商办工业', '2000-01-05');
INSERT INTO `expert_writings` VALUES ('108', '126', 'Soybean-Meal; Boasting Flow-', '3', 'Feed-Management', '1987-01-20');
INSERT INTO `expert_writings` VALUES ('109', '130', '', '', '', null);
INSERT INTO `expert_writings` VALUES ('110', '131', '', '', '', null);
INSERT INTO `expert_writings` VALUES ('111', '132', '', '', '', null);
INSERT INTO `expert_writings` VALUES ('112', '133', '', '', '', null);
INSERT INTO `expert_writings` VALUES ('113', '149', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', null);
INSERT INTO `expert_writings` VALUES ('114', '149', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', null);
INSERT INTO `expert_writings` VALUES ('115', '149', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', null);
INSERT INTO `expert_writings` VALUES ('116', '149', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('117', '150', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', null);
INSERT INTO `expert_writings` VALUES ('118', '150', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', null);
INSERT INTO `expert_writings` VALUES ('119', '150', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', null);
INSERT INTO `expert_writings` VALUES ('120', '150', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('121', '151', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', null);
INSERT INTO `expert_writings` VALUES ('122', '151', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', null);
INSERT INTO `expert_writings` VALUES ('123', '151', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', null);
INSERT INTO `expert_writings` VALUES ('124', '151', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('125', '152', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', null);
INSERT INTO `expert_writings` VALUES ('126', '152', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', null);
INSERT INTO `expert_writings` VALUES ('127', '152', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', null);
INSERT INTO `expert_writings` VALUES ('128', '152', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('129', '153', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', null);
INSERT INTO `expert_writings` VALUES ('130', '153', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', null);
INSERT INTO `expert_writings` VALUES ('131', '153', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', null);
INSERT INTO `expert_writings` VALUES ('132', '153', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('133', '154', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', null);
INSERT INTO `expert_writings` VALUES ('134', '154', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', null);
INSERT INTO `expert_writings` VALUES ('135', '154', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', null);
INSERT INTO `expert_writings` VALUES ('136', '154', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('137', '155', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', null);
INSERT INTO `expert_writings` VALUES ('138', '155', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', null);
INSERT INTO `expert_writings` VALUES ('139', '155', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', null);
INSERT INTO `expert_writings` VALUES ('140', '155', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('141', '156', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('142', '156', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('143', '156', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('144', '156', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('145', '157', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('146', '157', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('147', '157', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('148', '157', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('149', '158', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('150', '158', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('151', '158', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('152', '158', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('153', '159', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('154', '159', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('155', '159', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('156', '159', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('157', '162', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('158', '162', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('159', '162', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('160', '162', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('161', '165', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('162', '165', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('163', '165', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('164', '165', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('165', '168', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('166', '168', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('167', '168', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('168', '168', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('169', '174', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('170', '174', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('171', '174', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('172', '174', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('173', '178', 'Model Predictive Control of the Grain Drying Process', '通讯作者', 'Mathematical Problems in Engineering', null);
INSERT INTO `expert_writings` VALUES ('174', '178', 'Internal Stress Analysis on Corn Grain During Vacuum Drying', '通讯作者', 'SENSOR LETTERS', null);
INSERT INTO `expert_writings` VALUES ('175', '178', 'arameters Online Detection and Model Predictive Control during the Grain Drying Process', '通讯作者', 'Mathematical Problems in Engineering', null);
INSERT INTO `expert_writings` VALUES ('176', '178', '真空干燥条件下的玉米介电特性', '通讯作者', '吉林大学学报（工学版）', null);
INSERT INTO `expert_writings` VALUES ('177', '179', '《优化我国粮食大流通运输方案初探》', '', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('178', '179', '《我国粮食物流现状及前景展望》', '', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('179', '179', '《集装箱散粮运输技术现状及发展趋势》', '', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('180', '179', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '', '', null);
INSERT INTO `expert_writings` VALUES ('181', '182', '《昆明市粮油购销有限责任公司粮库迁建项目应用钢结构平房仓及浅层地能低温储量技术可行性论证报告》', '项目负责人', '', '2007-01-01');
INSERT INTO `expert_writings` VALUES ('182', '183', '储粮熏蒸专家系统的知识表示与知识库的建立', '', '河南工业大学学报(自然科学版), 2009,30(3):79-82', null);
INSERT INTO `expert_writings` VALUES ('183', '183', '混合蚁群优化在粮食紧急调运问题中的应用', '', '计算机工程与应用', null);
INSERT INTO `expert_writings` VALUES ('184', '183', '基于GIS的粮食配送决策支持系统分析与设计', '', '计算机工程与应用', null);
INSERT INTO `expert_writings` VALUES ('185', '183', '基于属性降维的粮库害虫检测与识别', '', '微电子学与计算机', null);
INSERT INTO `expert_writings` VALUES ('186', '184', '港口企业要警惕经营中的不必要风险', '本人', '中国港口协会', null);
INSERT INTO `expert_writings` VALUES ('187', '185', '京津冀地区全谷物食品市场调研报告', '第一作者', '《粮食与饲料工业》', '2012-01-01');
INSERT INTO `expert_writings` VALUES ('188', '185', '省级粮食现代物流规划编制心得', '第一作者', '《粮食与饲料工业》', '2009-01-01');
INSERT INTO `expert_writings` VALUES ('189', '185', '“北粮南运”存在的问题及对策', '第一作者', '《粮油食品科技》', '2010-01-01');
INSERT INTO `expert_writings` VALUES ('190', '185', '2010-2011年粮油科学与技术学科发展报告', '参加编写', '中国科学技术出版社', null);
INSERT INTO `expert_writings` VALUES ('191', '186', '2012-2015年', '', '863攻关计划', null);
INSERT INTO `expert_writings` VALUES ('192', '186', '2013-2015年', '', '2013年度粮食公益性科研专项', null);
INSERT INTO `expert_writings` VALUES ('193', '186', '2014-2016年', '', '2014年度粮食公益性科研专项', null);
INSERT INTO `expert_writings` VALUES ('194', '186', '论文/著作名称', '作者身份', '发表期刊/出版社', null);
INSERT INTO `expert_writings` VALUES ('195', '187', '国外散粮装船机及装船码头工艺布置', '作者', '港工技术', '1995-01-01');
INSERT INTO `expert_writings` VALUES ('196', '187', '大连港散粮进口泊位工艺分析', '作者', '      港工技术', '1994-01-01');
INSERT INTO `expert_writings` VALUES ('197', '187', '我国散粮码头装卸工艺研究', '作者 ', '      水运工程', '1998-01-01');
INSERT INTO `expert_writings` VALUES ('198', '187', '我国集装箱码头装卸工艺模式 及    粮食集装箱运输方案设想', '作者', '国家粮食局：现代物流方式优化选择 论文集', null);
INSERT INTO `expert_writings` VALUES ('199', '189', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('200', '189', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('201', '189', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('202', '189', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('203', '192', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('204', '192', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('205', '192', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('206', '192', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('207', '194', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('208', '194', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('209', '194', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('210', '194', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('211', '198', '发展农业循环经济的机制与对策研究', '冷志杰，于晓秋. 等著', '/ 科学出版社', null);
INSERT INTO `expert_writings` VALUES ('212', '198', '大宗农产品供应链四维网络模型及应用', '冷志杰, 唐焕文', '系统工程理论与实践/', null);
INSERT INTO `expert_writings` VALUES ('213', '198', 'Supplier pricing based on threshold Cointegration in Agri Supply Chain', 'Leng Zhijie and Tang Huanwen', 'Journal of Harbin Institute of Technology (New Series )', null);
INSERT INTO `expert_writings` VALUES ('214', '198', 'The Cooperative Conditions of the Two-Stage Grain Supply chain with Grower and Processor Joint Building Inventory supported by Government', 'Zhijie Leng and Xinli Wang', 'ICIC Express Letters --- An International Journal of Research and Surveys', null);
INSERT INTO `expert_writings` VALUES ('215', '200', 'Model Predictive Control of the Grain Drying Process', '通讯作者', 'Mathematical Problems in Engineering', null);
INSERT INTO `expert_writings` VALUES ('216', '200', 'Internal Stress Analysis on Corn Grain During Vacuum Drying', '通讯作者', 'SENSOR LETTERS', null);
INSERT INTO `expert_writings` VALUES ('217', '200', 'arameters Online Detection and Model Predictive Control during the Grain Drying Process', '通讯作者', 'Mathematical Problems in Engineering', null);
INSERT INTO `expert_writings` VALUES ('218', '200', '真空干燥条件下的玉米介电特性', '通讯作者', '吉林大学学报（工学版）', null);
INSERT INTO `expert_writings` VALUES ('219', '201', '邮政综合计算机网', '第二作者', '北京邮电大学出版社', null);
INSERT INTO `expert_writings` VALUES ('220', '201', '射频识别（RFID）系统设计、仿真与应用.', '第一作者', '人民邮电出版社', null);
INSERT INTO `expert_writings` VALUES ('221', '201', 'Model Analysis and Computer Simulation Study for Feeders of the High-Speed Package', '第一作者', 'Automation and Logistics.2007 IEEE International Conference on ', null);
INSERT INTO `expert_writings` VALUES ('222', '201', '一种基于移动机器人的配送中心柔性拣选系统', '第一作者', '物流技术', null);
INSERT INTO `expert_writings` VALUES ('223', '202', '《优化我国粮食大流通运输方案初探》', '', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('224', '202', '《我国粮食物流现状及前景展望》', '', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('225', '202', '《集装箱散粮运输技术现状及发展趋势》', '', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('226', '202', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '', '', null);
INSERT INTO `expert_writings` VALUES ('227', '203', '品中反式脂肪酸的检测', '', '食品科学', null);
INSERT INTO `expert_writings` VALUES ('228', '203', '谷物碾磨制品—脂肪酸值的测定—修改采用ISO7305: 1998的探讨', '', '      粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('229', '203', '中国储粮生态系统进展', '', '      粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('230', '203', '储藏有效积温与小麦游离脂肪酸值上升速度关系研究', '', '      粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('231', '204', '加速发展现代粮食物流培育粮食行业新的经济增长点', '参与', '《河南粮食经济》', null);
INSERT INTO `expert_writings` VALUES ('232', '204', '从散粮运输看黄淮海现代物流的发展', '主持', '《中国粮食经济》', null);
INSERT INTO `expert_writings` VALUES ('233', '206', '“新苏南发展模式\"的演进历程与路径分析', '', '中国农村经济', null);
INSERT INTO `expert_writings` VALUES ('234', '206', '粮食供求紧平衡的一般分析及其测度指标体系的构建', '', '南京财经大学学报', null);
INSERT INTO `expert_writings` VALUES ('235', '206', '从垄断到竞争性垄断:网络经济下市场结构演进的静态博弈分析', '', '江苏社会科学', null);
INSERT INTO `expert_writings` VALUES ('236', '206', '粮食流通体制改革的“嘉定模式”', '', '中国农业出版社', null);
INSERT INTO `expert_writings` VALUES ('237', '208', '《昆明市粮油购销有限责任公司粮库迁建项目应用钢结构平房仓及浅层地能低温储量技术可行性论证报告》', '项目负责人', '', '2007-01-01');
INSERT INTO `expert_writings` VALUES ('238', '209', '储粮熏蒸专家系统的知识表示与知识库的建立', '', '河南工业大学学报(自然科学版), 2009,30(3):79-82', null);
INSERT INTO `expert_writings` VALUES ('239', '209', '混合蚁群优化在粮食紧急调运问题中的应用', '', '计算机工程与应用', null);
INSERT INTO `expert_writings` VALUES ('240', '209', '基于GIS的粮食配送决策支持系统分析与设计', '', '计算机工程与应用', null);
INSERT INTO `expert_writings` VALUES ('241', '209', '基于属性降维的粮库害虫检测与识别', '', '微电子学与计算机', null);
INSERT INTO `expert_writings` VALUES ('242', '210', '分布式自动控制技术在粮库中的应用', '', '', null);
INSERT INTO `expert_writings` VALUES ('243', '210', 'IC智能卡（RFID）物流信息采集系统在粮库中的应用', '', '', null);
INSERT INTO `expert_writings` VALUES ('244', '210', '电子式粉质仪数据处理软件著作权', '', '', null);
INSERT INTO `expert_writings` VALUES ('245', '210', '电子式拉伸仪数据处理软件著作权', '', '', null);
INSERT INTO `expert_writings` VALUES ('246', '211', '港口企业要警惕经营中的不必要风险', '本人', '中国港口协会', null);
INSERT INTO `expert_writings` VALUES ('247', '212', '《绿色生态低碳储粮新技术》', '参编', '中国科学技术出版社', null);
INSERT INTO `expert_writings` VALUES ('248', '213', '京津冀地区全谷物食品市场调研报告', '第一作者', '《粮食与饲料工业》', '2012-01-01');
INSERT INTO `expert_writings` VALUES ('249', '213', '省级粮食现代物流规划编制心得', '第一作者', '《粮食与饲料工业》', '2009-01-01');
INSERT INTO `expert_writings` VALUES ('250', '213', '“北粮南运”存在的问题及对策', '第一作者', '《粮油食品科技》', '2010-01-01');
INSERT INTO `expert_writings` VALUES ('251', '213', '2010-2011年粮油科学与技术学科发展报告', '参加编写', '中国科学技术出版社', null);
INSERT INTO `expert_writings` VALUES ('252', '215', '2012-2015年', '', '863攻关计划', null);
INSERT INTO `expert_writings` VALUES ('253', '215', '2013-2015年', '', '2013年度粮食公益性科研专项', null);
INSERT INTO `expert_writings` VALUES ('254', '215', '2014-2016年', '', '2014年度粮食公益性科研专项', null);
INSERT INTO `expert_writings` VALUES ('255', '215', '论文/著作名称', '作者身份', '发表期刊/出版社', null);
INSERT INTO `expert_writings` VALUES ('256', '216', '国外散粮装船机及装船码头工艺布置', '作者', '港工技术', '1995-01-01');
INSERT INTO `expert_writings` VALUES ('257', '216', '大连港散粮进口泊位工艺分析', '作者', '      港工技术', '1994-01-01');
INSERT INTO `expert_writings` VALUES ('258', '216', '我国散粮码头装卸工艺研究', '作者 ', '      水运工程', '1998-01-01');
INSERT INTO `expert_writings` VALUES ('259', '216', '我国集装箱码头装卸工艺模式 及    粮食集装箱运输方案设想', '作者', '国家粮食局：现代物流方式优化选择 论文集', null);
INSERT INTO `expert_writings` VALUES ('260', '214', '343', '543543', '543', null);
INSERT INTO `expert_writings` VALUES ('261', '218', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('262', '218', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('263', '218', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('264', '218', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('265', '220', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('266', '220', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('267', '220', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('268', '220', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('269', '223', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('270', '223', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('271', '223', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('272', '223', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('273', '227', '发展农业循环经济的机制与对策研究', '冷志杰，于晓秋. 等著', '/ 科学出版社', null);
INSERT INTO `expert_writings` VALUES ('274', '227', '大宗农产品供应链四维网络模型及应用', '冷志杰, 唐焕文', '系统工程理论与实践/', null);
INSERT INTO `expert_writings` VALUES ('275', '227', 'Supplier pricing based on threshold Cointegration in Agri Supply Chain', 'Leng Zhijie and Tang Huanwen', 'Journal of Harbin Institute of Technology (New Series )', null);
INSERT INTO `expert_writings` VALUES ('276', '227', 'The Cooperative Conditions of the Two-Stage Grain Supply chain with Grower and Processor Joint Building Inventory supported by Government', 'Zhijie Leng and Xinli Wang', 'ICIC Express Letters --- An International Journal of Research and Surveys', null);
INSERT INTO `expert_writings` VALUES ('277', '229', 'Model Predictive Control of the Grain Drying Process', '通讯作者', 'Mathematical Problems in Engineering', null);
INSERT INTO `expert_writings` VALUES ('278', '229', 'Internal Stress Analysis on Corn Grain During Vacuum Drying', '通讯作者', 'SENSOR LETTERS', null);
INSERT INTO `expert_writings` VALUES ('279', '229', 'arameters Online Detection and Model Predictive Control during the Grain Drying Process', '通讯作者', 'Mathematical Problems in Engineering', null);
INSERT INTO `expert_writings` VALUES ('280', '229', '真空干燥条件下的玉米介电特性', '通讯作者', '吉林大学学报（工学版）', null);
INSERT INTO `expert_writings` VALUES ('281', '230', '邮政综合计算机网', '第二作者', '北京邮电大学出版社', null);
INSERT INTO `expert_writings` VALUES ('282', '230', '射频识别（RFID）系统设计、仿真与应用.', '第一作者', '人民邮电出版社', null);
INSERT INTO `expert_writings` VALUES ('283', '230', 'Model Analysis and Computer Simulation Study for Feeders of the High-Speed Package', '第一作者', 'Automation and Logistics.2007 IEEE International Conference on ', null);
INSERT INTO `expert_writings` VALUES ('284', '230', '一种基于移动机器人的配送中心柔性拣选系统', '第一作者', '物流技术', null);
INSERT INTO `expert_writings` VALUES ('285', '231', '《优化我国粮食大流通运输方案初探》', '', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('286', '231', '《我国粮食物流现状及前景展望》', '', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('287', '231', '《集装箱散粮运输技术现状及发展趋势》', '', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('288', '231', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '', '', null);
INSERT INTO `expert_writings` VALUES ('289', '232', '品中反式脂肪酸的检测', '', '食品科学', null);
INSERT INTO `expert_writings` VALUES ('290', '232', '谷物碾磨制品—脂肪酸值的测定—修改采用ISO7305: 1998的探讨', '', '      粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('291', '232', '中国储粮生态系统进展', '', '      粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('292', '232', '储藏有效积温与小麦游离脂肪酸值上升速度关系研究', '', '      粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('293', '233', '加速发展现代粮食物流培育粮食行业新的经济增长点', '参与', '《河南粮食经济》', null);
INSERT INTO `expert_writings` VALUES ('294', '233', '从散粮运输看黄淮海现代物流的发展', '主持', '《中国粮食经济》', null);
INSERT INTO `expert_writings` VALUES ('295', '235', '“新苏南发展模式\"的演进历程与路径分析', '', '中国农村经济', null);
INSERT INTO `expert_writings` VALUES ('296', '235', '粮食供求紧平衡的一般分析及其测度指标体系的构建', '', '南京财经大学学报', null);
INSERT INTO `expert_writings` VALUES ('297', '235', '从垄断到竞争性垄断:网络经济下市场结构演进的静态博弈分析', '', '江苏社会科学', null);
INSERT INTO `expert_writings` VALUES ('298', '235', '粮食流通体制改革的“嘉定模式”', '', '中国农业出版社', null);
INSERT INTO `expert_writings` VALUES ('299', '237', '《昆明市粮油购销有限责任公司粮库迁建项目应用钢结构平房仓及浅层地能低温储量技术可行性论证报告》', '项目负责人', '', '2007-01-01');
INSERT INTO `expert_writings` VALUES ('300', '238', '储粮熏蒸专家系统的知识表示与知识库的建立', '', '河南工业大学学报(自然科学版), 2009,30(3):79-82', null);
INSERT INTO `expert_writings` VALUES ('301', '238', '混合蚁群优化在粮食紧急调运问题中的应用', '', '计算机工程与应用', null);
INSERT INTO `expert_writings` VALUES ('302', '238', '基于GIS的粮食配送决策支持系统分析与设计', '', '计算机工程与应用', null);
INSERT INTO `expert_writings` VALUES ('303', '238', '基于属性降维的粮库害虫检测与识别', '', '微电子学与计算机', null);
INSERT INTO `expert_writings` VALUES ('304', '239', '分布式自动控制技术在粮库中的应用', '', '', null);
INSERT INTO `expert_writings` VALUES ('305', '239', 'IC智能卡（RFID）物流信息采集系统在粮库中的应用', '', '', null);
INSERT INTO `expert_writings` VALUES ('306', '239', '电子式粉质仪数据处理软件著作权', '', '', null);
INSERT INTO `expert_writings` VALUES ('307', '239', '电子式拉伸仪数据处理软件著作权', '', '', null);
INSERT INTO `expert_writings` VALUES ('308', '240', '港口企业要警惕经营中的不必要风险', '本人', '中国港口协会', null);
INSERT INTO `expert_writings` VALUES ('309', '241', '《绿色生态低碳储粮新技术》', '参编', '中国科学技术出版社', null);
INSERT INTO `expert_writings` VALUES ('310', '242', '京津冀地区全谷物食品市场调研报告', '第一作者', '《粮食与饲料工业》', '2012-01-01');
INSERT INTO `expert_writings` VALUES ('311', '242', '省级粮食现代物流规划编制心得', '第一作者', '《粮食与饲料工业》', '2009-01-01');
INSERT INTO `expert_writings` VALUES ('312', '242', '“北粮南运”存在的问题及对策', '第一作者', '《粮油食品科技》', '2010-01-01');
INSERT INTO `expert_writings` VALUES ('313', '242', '2010-2011年粮油科学与技术学科发展报告', '参加编写', '中国科学技术出版社', null);
INSERT INTO `expert_writings` VALUES ('314', '244', '2012-2015年', '', '863攻关计划', null);
INSERT INTO `expert_writings` VALUES ('315', '244', '2013-2015年', '', '2013年度粮食公益性科研专项', null);
INSERT INTO `expert_writings` VALUES ('316', '244', '2014-2016年', '', '2014年度粮食公益性科研专项', null);
INSERT INTO `expert_writings` VALUES ('317', '244', '论文/著作名称', '作者身份', '发表期刊/出版社', null);
INSERT INTO `expert_writings` VALUES ('318', '245', '国外散粮装船机及装船码头工艺布置', '作者', '港工技术', '1995-01-01');
INSERT INTO `expert_writings` VALUES ('319', '245', '大连港散粮进口泊位工艺分析', '作者', '      港工技术', '1994-01-01');
INSERT INTO `expert_writings` VALUES ('320', '245', '我国散粮码头装卸工艺研究', '作者 ', '      水运工程', '1998-01-01');
INSERT INTO `expert_writings` VALUES ('321', '245', '我国集装箱码头装卸工艺模式 及    粮食集装箱运输方案设想', '作者', '国家粮食局：现代物流方式优化选择 论文集', null);
INSERT INTO `expert_writings` VALUES ('322', '247', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('323', '247', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('324', '247', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('325', '247', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('326', '248', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('327', '248', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('328', '248', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('329', '248', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('330', '251', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('331', '251', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('332', '251', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('333', '251', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('334', '252', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('335', '252', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('336', '252', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('337', '252', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('338', '255', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('339', '255', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('340', '255', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('341', '255', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('342', '256', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('343', '256', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('344', '256', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('345', '256', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('346', '259', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('347', '259', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('348', '259', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('349', '259', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('350', '260', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('351', '260', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('352', '260', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('353', '260', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('354', '262', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('355', '262', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('356', '262', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('357', '262', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('358', '263', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('359', '263', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('360', '263', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('361', '263', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('362', '264', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('363', '264', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('364', '264', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('365', '264', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('366', '266', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('367', '266', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('368', '266', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('369', '266', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('370', '267', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('371', '267', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('372', '267', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('373', '267', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('374', '268', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('375', '268', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('376', '268', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('377', '268', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('378', '270', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('379', '270', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('380', '270', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('381', '270', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('382', '271', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('383', '271', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('384', '271', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('385', '271', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('386', '272', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('387', '272', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('388', '272', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('389', '272', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('390', '275', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('391', '275', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('392', '275', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('393', '275', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('394', '276', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('395', '276', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('396', '276', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('397', '276', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('398', '277', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('399', '277', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('400', '277', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('401', '277', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);
INSERT INTO `expert_writings` VALUES ('402', '280', '发展农业循环经济的机制与对策研究', '冷志杰，于晓秋. 等著', '/ 科学出版社', null);
INSERT INTO `expert_writings` VALUES ('403', '280', '大宗农产品供应链四维网络模型及应用', '冷志杰, 唐焕文', '系统工程理论与实践/', null);
INSERT INTO `expert_writings` VALUES ('404', '280', 'Supplier pricing based on threshold Cointegration in Agri Supply Chain', 'Leng Zhijie and Tang Huanwen', 'Journal of Harbin Institute of Technology (New Series )', null);
INSERT INTO `expert_writings` VALUES ('405', '280', 'The Cooperative Conditions of the Two-Stage Grain Supply chain with Grower and Processor Joint Building Inventory supported by Government', 'Zhijie Leng and Xinli Wang', 'ICIC Express Letters --- An International Journal of Research and Surveys', null);
INSERT INTO `expert_writings` VALUES ('406', '281', 'Model Predictive Control of the Grain Drying Process', '通讯作者', 'Mathematical Problems in Engineering', null);
INSERT INTO `expert_writings` VALUES ('407', '281', 'Internal Stress Analysis on Corn Grain During Vacuum Drying', '通讯作者', 'SENSOR LETTERS', null);
INSERT INTO `expert_writings` VALUES ('408', '281', 'arameters Online Detection and Model Predictive Control during the Grain Drying Process', '通讯作者', 'Mathematical Problems in Engineering', null);
INSERT INTO `expert_writings` VALUES ('409', '281', '真空干燥条件下的玉米介电特性', '通讯作者', '吉林大学学报（工学版）', null);
INSERT INTO `expert_writings` VALUES ('410', '282', '邮政综合计算机网', '第二作者', '北京邮电大学出版社', null);
INSERT INTO `expert_writings` VALUES ('411', '282', '射频识别（RFID）系统设计、仿真与应用.', '第一作者', '人民邮电出版社', null);
INSERT INTO `expert_writings` VALUES ('412', '282', 'Model Analysis and Computer Simulation Study for Feeders of the High-Speed Package', '第一作者', 'Automation and Logistics.2007 IEEE International Conference on ', null);
INSERT INTO `expert_writings` VALUES ('413', '282', '一种基于移动机器人的配送中心柔性拣选系统', '第一作者', '物流技术', null);
INSERT INTO `expert_writings` VALUES ('414', '283', '品中反式脂肪酸的检测', '', '食品科学', null);
INSERT INTO `expert_writings` VALUES ('415', '283', '谷物碾磨制品—脂肪酸值的测定—修改采用ISO7305: 1998的探讨', '', '      粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('416', '283', '中国储粮生态系统进展', '', '      粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('417', '283', '储藏有效积温与小麦游离脂肪酸值上升速度关系研究', '', '      粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('418', '284', '加速发展现代粮食物流培育粮食行业新的经济增长点', '参与', '《河南粮食经济》', null);
INSERT INTO `expert_writings` VALUES ('419', '284', '从散粮运输看黄淮海现代物流的发展', '主持', '《中国粮食经济》', null);
INSERT INTO `expert_writings` VALUES ('420', '286', '“新苏南发展模式\"的演进历程与路径分析', '', '中国农村经济', null);
INSERT INTO `expert_writings` VALUES ('421', '286', '粮食供求紧平衡的一般分析及其测度指标体系的构建', '', '南京财经大学学报', null);
INSERT INTO `expert_writings` VALUES ('422', '286', '从垄断到竞争性垄断:网络经济下市场结构演进的静态博弈分析', '', '江苏社会科学', null);
INSERT INTO `expert_writings` VALUES ('423', '286', '粮食流通体制改革的“嘉定模式”', '', '中国农业出版社', null);
INSERT INTO `expert_writings` VALUES ('424', '288', '《昆明市粮油购销有限责任公司粮库迁建项目应用钢结构平房仓及浅层地能低温储量技术可行性论证报告》', '项目负责人', '', '2007-01-01');
INSERT INTO `expert_writings` VALUES ('425', '289', '储粮熏蒸专家系统的知识表示与知识库的建立', '', '河南工业大学学报(自然科学版), 2009,30(3):79-82', null);
INSERT INTO `expert_writings` VALUES ('426', '289', '混合蚁群优化在粮食紧急调运问题中的应用', '', '计算机工程与应用', null);
INSERT INTO `expert_writings` VALUES ('427', '289', '基于GIS的粮食配送决策支持系统分析与设计', '', '计算机工程与应用', null);
INSERT INTO `expert_writings` VALUES ('428', '289', '基于属性降维的粮库害虫检测与识别', '', '微电子学与计算机', null);
INSERT INTO `expert_writings` VALUES ('429', '290', '分布式自动控制技术在粮库中的应用', '', '', null);
INSERT INTO `expert_writings` VALUES ('430', '290', 'IC智能卡（RFID）物流信息采集系统在粮库中的应用', '', '', null);
INSERT INTO `expert_writings` VALUES ('431', '290', '电子式粉质仪数据处理软件著作权', '', '', null);
INSERT INTO `expert_writings` VALUES ('432', '290', '电子式拉伸仪数据处理软件著作权', '', '', null);
INSERT INTO `expert_writings` VALUES ('433', '291', '港口企业要警惕经营中的不必要风险', '本人', '中国港口协会', null);
INSERT INTO `expert_writings` VALUES ('434', '292', '《绿色生态低碳储粮新技术》', '参编', '中国科学技术出版社', null);
INSERT INTO `expert_writings` VALUES ('435', '293', '京津冀地区全谷物食品市场调研报告', '第一作者', '《粮食与饲料工业》', '2012-01-01');
INSERT INTO `expert_writings` VALUES ('436', '293', '省级粮食现代物流规划编制心得', '第一作者', '《粮食与饲料工业》', '2009-01-01');
INSERT INTO `expert_writings` VALUES ('437', '293', '“北粮南运”存在的问题及对策', '第一作者', '《粮油食品科技》', '2010-01-01');
INSERT INTO `expert_writings` VALUES ('438', '293', '2010-2011年粮油科学与技术学科发展报告', '参加编写', '中国科学技术出版社', null);
INSERT INTO `expert_writings` VALUES ('439', '294', '2012-2015年', '', '863攻关计划', null);
INSERT INTO `expert_writings` VALUES ('440', '294', '2013-2015年', '', '2013年度粮食公益性科研专项', null);
INSERT INTO `expert_writings` VALUES ('441', '294', '2014-2016年', '', '2014年度粮食公益性科研专项', null);
INSERT INTO `expert_writings` VALUES ('442', '294', '论文/著作名称', '作者身份', '发表期刊/出版社', null);
INSERT INTO `expert_writings` VALUES ('443', '295', '国外散粮装船机及装船码头工艺布置', '作者', '港工技术', '1995-01-01');
INSERT INTO `expert_writings` VALUES ('444', '295', '大连港散粮进口泊位工艺分析', '作者', '      港工技术', '1994-01-01');
INSERT INTO `expert_writings` VALUES ('445', '295', '我国散粮码头装卸工艺研究', '作者 ', '      水运工程', '1998-01-01');
INSERT INTO `expert_writings` VALUES ('446', '295', '我国集装箱码头装卸工艺模式 及    粮食集装箱运输方案设想', '作者', '国家粮食局：现代物流方式优化选择 论文集', null);
INSERT INTO `expert_writings` VALUES ('447', '296', '膜下环流熏蒸对抗性害虫的防治效果', '第1作者', '《中国粮食经济》', '2001-01-01');
INSERT INTO `expert_writings` VALUES ('448', '296', '运用低温储粮技术提高仓储效益', '第3作者', '《粮食储藏》', '2002-01-01');
INSERT INTO `expert_writings` VALUES ('449', '296', '储粮工艺优化集成 节能减排模式创新', '第1作者', '《粮食储藏》', '2011-01-01');
INSERT INTO `expert_writings` VALUES ('450', '296', '粮油储藏技术规范', '第16作者', 'GB/T 29890-2013', '2013-01-01');
INSERT INTO `expert_writings` VALUES ('451', '297', '粮食与种子贮藏', '合著', '金盾出版社', '2010-01-01');
INSERT INTO `expert_writings` VALUES ('452', '297', '低温储藏与控温技术', '主审', '中国国际文化出版社', null);
INSERT INTO `expert_writings` VALUES ('453', '297', '粮食储藏技术实用操作丛书（包括：氮气气调储粮技术实用操作手册、磷化氢膜下环流熏蒸技术实用操作手册、膜下环流通风技术实用操作手册、粮食出入库技术实用操作手册）', '编委会副主任', '四川科学技术出版社', null);
INSERT INTO `expert_writings` VALUES ('454', '297', '中温高湿储粮区绿色储粮技术优化集成应用实践', '第一作者', '粮食储藏', '2009-01-01');
INSERT INTO `expert_writings` VALUES ('455', '298', '聚集优质产业资源  发展粮食循环经济', '起草人', '河南日报', null);
INSERT INTO `expert_writings` VALUES ('456', '298', '第四储粮生态区玉米储藏特点及问题研究', '主要参与人', '粮油仓储科技通讯', null);
INSERT INTO `expert_writings` VALUES ('457', '298', '地下仓--绿色储粮的好仓型', '起草人', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('458', '300', '空仓内干法喷施食品级惰性粉杀虫效果评价', '第四作者', '粮油食品科技', null);
INSERT INTO `expert_writings` VALUES ('459', '300', '超高大平房仓环流熏蒸技术应用效果测试', '第一作者', '中国粮油学会“第二届绿色储粮与节能减排研讨会”论文集', null);
INSERT INTO `expert_writings` VALUES ('460', '300', '惰性粉防治储粮害虫技术实仓应用试验', '第一作者', '全国“粮油仓储节能减排专题技术会议\" 论文集', null);
INSERT INTO `expert_writings` VALUES ('461', '300', '惰性粉防护与准低温储藏综合技术应用试验', '第一作者', '中国粮油学会“第二届粮食储藏技术创新与仓储精细化管理研讨会”论文集', null);
INSERT INTO `expert_writings` VALUES ('462', '301', '粮油购销企业的管理', '干部', '河北科学技术出版社', null);
INSERT INTO `expert_writings` VALUES ('463', '301', '粮油保管员', '教授', '中国轻工业出版社', null);
INSERT INTO `expert_writings` VALUES ('464', '301', '粮油保管员职业技能鉴定手册', '教授', '中国轻工业出版社', null);
INSERT INTO `expert_writings` VALUES ('465', '302', '《粮食储藏学科发展报告（2010）》', '执笔', '中国科学技术出版社出版', '2010-01-01');
INSERT INTO `expert_writings` VALUES ('466', '302', '《粮油储藏专题报告（2009－2020年）》', '执笔', '', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('467', '302', '《粮食大辞典》', '参与', '中国物资出版社出版', '2007-01-01');
INSERT INTO `expert_writings` VALUES ('468', '302', '《“十一五”粮食科技发展指导意见（规划）》', '参与', '', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('469', '303', '《热泵技术在粮食整仓干燥中的应用》', '第一作者', '《粮食储藏》', '2006-01-01');
INSERT INTO `expert_writings` VALUES ('470', '303', '《稻谷真菌毒素污染调查分析》', '第一作者', '《粮食储藏》', '2004-01-01');
INSERT INTO `expert_writings` VALUES ('471', '303', '《中国气调储粮技术研究和应用进展》', '第一作者', '国际储藏物气调与熏蒸大会论文集', null);
INSERT INTO `expert_writings` VALUES ('472', '303', '《在贮稻谷整仓通风调质试验验究》', '第一作者', '中国粮油学会学术年会论文集', null);
INSERT INTO `expert_writings` VALUES ('473', '304', '我国粮食储藏现状与未来发展趋势', '第一作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('474', '304', '我国粮食储藏战略研究', '第一作者', '粮油仓储科技通讯', null);
INSERT INTO `expert_writings` VALUES ('475', '304', '我国农户储粮损失抽样调查方法的研究', '第一作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('476', '304', '粮油储藏重要标准理解与实施', '主编，第3', '四川科技出版社', null);
INSERT INTO `expert_writings` VALUES ('477', '305', '论文/著作名称', '作者身份', '发表期刊/出版社', null);
INSERT INTO `expert_writings` VALUES ('478', '305', '储粮磷化氢熏蒸技术区域优化', '编委会副主任', ' 中国农业科学技术出版社', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('479', '305', '粮食干燥系统节能减排技术研究与应用', '第二作者', '粮油食品科技', '2010-01-01');
INSERT INTO `expert_writings` VALUES ('480', '306', '大米低温储藏品质变化规律研究', '第2作者', '《粮食储藏》', '2010-01-01');
INSERT INTO `expert_writings` VALUES ('481', '306', '高水分稻谷“不落地”就仓干燥试验', '第1作者', '《粮食储藏》', '2009-01-01');
INSERT INTO `expert_writings` VALUES ('482', '306', '小麦整仓通风调质试验的探讨', '第1作者', '《粮食储藏》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('483', '306', '氮气储粮应用实践', '编委会', '四川科学技术出版社', null);
INSERT INTO `expert_writings` VALUES ('484', '307', '东北地区以轴流风机取代离心风机通风降温试验', '第一作者', '粮食加工', null);
INSERT INTO `expert_writings` VALUES ('485', '307', '粮油储藏技术', '第二主编', '科学出版社', null);
INSERT INTO `expert_writings` VALUES ('486', '307', '粮食储藏学', '第二主编', '科学出版社', null);
INSERT INTO `expert_writings` VALUES ('487', '307', '时间', '奖励名称及等级', '', null);
INSERT INTO `expert_writings` VALUES ('488', '308', '《散装稻谷储藏品质变化规律的研究》', '第一作者', '《粮食储藏》', '2002-01-01');
INSERT INTO `expert_writings` VALUES ('489', '308', '《平房仓粮面冷气囊密闭压盖动态隔热控温储粮技术研究》', '第一作者', '《粮食储藏》', '2009-01-01');
INSERT INTO `expert_writings` VALUES ('490', '308', '中储粮总公司《粮食出入库技术操作手册》', '执行主编', '四川出版社', '2015-01-01');
INSERT INTO `expert_writings` VALUES ('491', '309', '粮食储藏技术使用操作丛书', '编委', '四川科学技术出版社', '2014-01-01');
INSERT INTO `expert_writings` VALUES ('492', '309', 'JZSG—‖型脂肪酸值测定仪的研究开发', '第一作者', '《粮食储藏》杂志', '2011-01-01');
INSERT INTO `expert_writings` VALUES ('493', '309', '实验用小型碾米机研制开发', '第一作者', '《粮食储藏》杂志', '2012-01-01');
INSERT INTO `expert_writings` VALUES ('494', '309', '影响脂肪酸值测定仪测试稳定性的条件研究', '第一作者', '《粮食储藏》杂志', '2012-01-01');
INSERT INTO `expert_writings` VALUES ('495', '310', '中央储备粮油储藏技术知识问答', '主编', '辽宁科学技术出版社', null);
INSERT INTO `expert_writings` VALUES ('496', '310', '粮食仓储机械设备使用与管理', '参编', '中国财政经济出版社', null);
INSERT INTO `expert_writings` VALUES ('497', '310', 'GB/T  25229－2010  粮油储藏——平房仓气密性要求', '第一', '中国标准出版社', null);
INSERT INTO `expert_writings` VALUES ('498', '310', '粮油储藏学', '参编', '中国财政经济出版社', null);
INSERT INTO `expert_writings` VALUES ('499', '311', '膜下环流通风技术实用操作手册', '执行主编', '四川科技出版社', null);
INSERT INTO `expert_writings` VALUES ('500', '311', '粮油保管员（初级 中级 高级）', '编委会成员', '中国轻工业出版社', null);
INSERT INTO `expert_writings` VALUES ('501', '311', '粮油保管员职业技能操作考试指导手册', '编委会成员', '中国劳动社会保障出版社', null);
INSERT INTO `expert_writings` VALUES ('502', '311', '东北地区大豆保水储藏技术生产性试验报告', '第一作者', '《粮食储藏》', null);
INSERT INTO `expert_writings` VALUES ('503', '312', '2009年', '国家科技进步二等奖', '', null);
INSERT INTO `expert_writings` VALUES ('504', '312', '2010年', '中国粮油学会科学技术特等奖', '', null);
INSERT INTO `expert_writings` VALUES ('505', '312', '2000年', '国家粮食储备局科技进步二等奖', '', null);
INSERT INTO `expert_writings` VALUES ('506', '312', '2013年', '中国粮油学会科学技术三等奖', '', null);
INSERT INTO `expert_writings` VALUES ('507', '313', '《华南地区高浓度磷化氢抑菌储藏玉米试验》', '第一作者', '《第8届国际储藏物气调与熏蒸大会论文集》', null);
INSERT INTO `expert_writings` VALUES ('508', '313', '《华南地区浅圆仓控温气调储粮技术应用新思路》', '第一作者', '《粮食流通技术》', null);
INSERT INTO `expert_writings` VALUES ('509', '314', 'Lox酶缺失大豆新品种耐储藏特性的研究 ', '第二作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('510', '314', '酶缺失稻谷新品种储藏特性研究', '第二作者', '河南工业大学学报', null);
INSERT INTO `expert_writings` VALUES ('511', '314', '棕榈硬脂与豆油酯-酯交换制备起酥油的研究', '第三作者', '粮油仓储科技通讯', null);
INSERT INTO `expert_writings` VALUES ('512', '315', 'Proceedings of the 8th International conference on controlled atmosphere and fumigation in stored products', '第三主编', '四川出版集团四川科学技术出版社', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('513', '315', '国际储藏物气调与熏蒸研究进展', '第二作者', '《粮食储藏》', null);
INSERT INTO `expert_writings` VALUES ('514', '315', '氮气气调储粮效果与仓房气密性的关系研究', '第一作者', '《粮食储藏》', null);
INSERT INTO `expert_writings` VALUES ('515', '315', '《2010-2011粮油科学与技术学科发展报告》P49-59', '合著', '中国科学技术出版社', null);
INSERT INTO `expert_writings` VALUES ('516', '316', '空气温度和湿度对稻谷增湿效果的影响', '第1', '食品科学', null);
INSERT INTO `expert_writings` VALUES ('517', '316', '油菜籽热风干燥后储藏品质的研究', '第1', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('518', '316', '稻谷热湿梯度场物理参数及裂纹机理的研究进展', '第1', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('519', '316', '间歇干燥及缓苏对高水分稻谷干燥品质的影响', '第1', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('520', '317', '论文/著作名称', '作者身份', '发表期刊/出版社', null);
INSERT INTO `expert_writings` VALUES ('521', '317', '新型菱镁建材在低温储粮技术中的应用', '杨长海', '第2届粮食储藏技术与管理论坛文集', null);
INSERT INTO `expert_writings` VALUES ('522', '319', 'Optimization of ultrasonic extraction of\npolysaccharides from Ziziphus jujuba Mill. by\nresponse surface methodology', '第一，通讯', ' Chemistry Central Journal', null);
INSERT INTO `expert_writings` VALUES ('523', '319', 'Study on the interactions between ginsenosides and lysozyme under acidic condition by ESI-MS and molecular docking', '第一，通讯', 'Spectrochimica acta A: Molecular and biomolecular spectroscopy', null);
INSERT INTO `expert_writings` VALUES ('524', '319', '硬麦八号主要组成部位四种主要蛋白质和营养矿物元素含量分析', '第一，通讯', '粮食与饲料工业', null);
INSERT INTO `expert_writings` VALUES ('525', '319', '离子对色谱法分离氨基酸的研究', '第一，通讯', '河南工业大学学报', null);
INSERT INTO `expert_writings` VALUES ('526', '320', 'Field tests and preliminary assessment on maize dryers in China', '第一作者', '《第七届国际储藏物保护大会论文集》', null);
INSERT INTO `expert_writings` VALUES ('527', '320', 'Grain dryers in China', '独著', '中国粮油学报英文专刊', '1999-01-01');
INSERT INTO `expert_writings` VALUES ('528', '320', 'Measures for minimizing maize breakage during drying and handling', '独著', '《2004年上海国际粮油食品安全会议论文集》', '2004-01-01');
INSERT INTO `expert_writings` VALUES ('529', '320', '谷物冷却机性能初步分析', '第一作者', '粮油食品科技', '2004-01-01');
INSERT INTO `expert_writings` VALUES ('530', '321', '粮食大辞典', '合著，撰稿人', '中国物资出版社', null);
INSERT INTO `expert_writings` VALUES ('531', '321', '高水分粮食解吸试验', '第一作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('532', '321', '通风干燥过程中的粮食水分转移规律研究', '第一作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('533', '321', '玉米平衡水分测定及等温线方程确定', '第一作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('534', '323', '《粮食仓储设备与工艺》（ISBN 7-5005-5945-3/TS•0109）', '主编', '中国财经出版社', null);
INSERT INTO `expert_writings` VALUES ('535', '323', '《粮食储运安全与技术管理》（ISBN 7-5025-6789-5/TS•264）', '主编', '化工出版社', null);
INSERT INTO `expert_writings` VALUES ('536', '323', '储藏微环境下小麦胚细胞超微结构变化及衰老机制研究 ', '第一作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('537', '323', '储藏微环境对小麦蛋白质含量变化规律的影响', '第一作者', '现代食品科技', null);
INSERT INTO `expert_writings` VALUES ('538', '324', 'WebGL技术在粮温监控中的应用', '1900', '河南工业大学学报(自然科学版) ', null);
INSERT INTO `expert_writings` VALUES ('539', '324', '粒子群算法求解粮堆温度模型参数优化问题  ', '1900', '计算机工程与应用 ', null);
INSERT INTO `expert_writings` VALUES ('540', '324', '基于声音的储粮害虫检测系统设计', '1900', '河南工业大学学报(自然科学版) ', null);
INSERT INTO `expert_writings` VALUES ('541', '324', '基于GIS的粮食配送决策支持系统分析与设计', '1900', '计算机应用研究', null);
INSERT INTO `expert_writings` VALUES ('542', '325', 'High-performance liquid chromatographic method for determination of amino acids by precolumn derivatization with 4-chloro-3,5-dinitrobenzotrifluoride', '石天玉，1', 'Analytica Chimica Acta', null);
INSERT INTO `expert_writings` VALUES ('543', '325', 'Preparation and characterization of the nano-sized calcium carbonate as controlled release pesticide carrier for validamycin against Rhizoctonia solani', '石天玉, 2', 'Microchimica Acta', null);
INSERT INTO `expert_writings` VALUES ('544', '325', 'Release kinetics of tebuconazole from porous hollow silica nanospheres prepared by miniemulsion method', '石天玉，2', 'Microporous and Mesoporous Materials\n', null);
INSERT INTO `expert_writings` VALUES ('545', '325', '组挂式粮食干燥仓处理高水分玉米工艺试验', '石天玉，1', '粮油食品科技', null);
INSERT INTO `expert_writings` VALUES ('546', '326', '时间', '奖励名称及等级', '', null);
INSERT INTO `expert_writings` VALUES ('547', '327', '计算机控制系统在烘干生产中的应用', '第一作者', '黑龙江粮食', null);
INSERT INTO `expert_writings` VALUES ('548', '327', '粮食干燥技术培训教材', '主编、主讲', '黑龙江省粮食局烘干技术培训班', null);
INSERT INTO `expert_writings` VALUES ('549', '327', '转变传统储粮观念、实施农户科学储粮', '撰稿', '黑龙江粮食', null);
INSERT INTO `expert_writings` VALUES ('550', '328', '面粉厂小麦储藏技术', '第一', '粮油加工', null);
INSERT INTO `expert_writings` VALUES ('551', '328', '稻谷控温储藏技术体系的构成与发展趋势 ', '第一', '粮食加工', null);
INSERT INTO `expert_writings` VALUES ('552', '328', '大米加工厂稻谷储藏技术 ', '第一', '粮食加工', null);
INSERT INTO `expert_writings` VALUES ('553', '328', '粮油贮藏保管技术', '第一', '湖北科学技术出版社 ', null);
INSERT INTO `expert_writings` VALUES ('554', '329', '时间', '奖励名称及等级', '', null);
INSERT INTO `expert_writings` VALUES ('555', '329', '1995年', '获内贸部科技进步三等奖', '', null);
INSERT INTO `expert_writings` VALUES ('556', '329', '2000年', '获得国家粮食储备局科技进步三等奖', '', null);
INSERT INTO `expert_writings` VALUES ('557', '329', '2008-01-01', '中国粮油学会2007年度“科技进步一等奖”', '', null);
INSERT INTO `expert_writings` VALUES ('558', '330', '西安地区智能通风冬季降温试验研究', '第二作者', '《粮食储藏》2006年第5期', null);
INSERT INTO `expert_writings` VALUES ('559', '330', '高水分稻谷仓内干燥集成技术研究', '第一作者', '《粮食储藏》2008年第2期', null);
INSERT INTO `expert_writings` VALUES ('560', '331', '小麦新陈快速鉴别的研究', '第二作者', '《粮食储藏》', null);
INSERT INTO `expert_writings` VALUES ('561', '331', '我国粮食储藏的现状与未来发展趋势', '第二作者', '《粮油仓储科技通讯》', null);
INSERT INTO `expert_writings` VALUES ('562', '331', '国际储藏物气调与熏蒸研究进展', '第一作者', '《粮食储藏》', null);
INSERT INTO `expert_writings` VALUES ('563', '331', '时间', '奖励名称及等级', '', null);
INSERT INTO `expert_writings` VALUES ('564', '332', '论文/著作名称', '作者身份', '发表期刊/出版社', null);
INSERT INTO `expert_writings` VALUES ('565', '332', '稻谷储存时间对米排粉碎粉率和柔韧性的影响', '第一作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('566', '332', '南方米粉生产过程中HACCP安全体系的构建研究', '第一作者', '粮食加工', null);
INSERT INTO `expert_writings` VALUES ('567', '332', '利用气相色谱-质谱检测面制品中甲醛和雕白块', '第一作者', '食品科技', null);
INSERT INTO `expert_writings` VALUES ('568', '334', '国外绿色储粮技术研究进展', '第一作者', '国家粮食局首届粮食储藏管理论坛论文集', null);
INSERT INTO `expert_writings` VALUES ('569', '334', 'GBT 29890-2013 粮油储藏技术规范', '第一作者', '标准出版社', null);
INSERT INTO `expert_writings` VALUES ('570', '334', '粮油储藏重要标准理解与实施', '合著，主要作者、总纂', '四川科技出版社', null);
INSERT INTO `expert_writings` VALUES ('571', '334', '中国不同储粮生态区域储粮工艺研究', '合著，主要作者', '四川科技出版社', null);
INSERT INTO `expert_writings` VALUES ('572', '335', '硫酰氟熏蒸稻谷实仓示范试验研究', '第一作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('573', '335', '粮食仓储行业HACCP研究应用', '第一作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('574', '335', '中国储粮昆虫2005年最新名录', '第一作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('575', '335', '时间', '奖励名称及等级', '', null);
INSERT INTO `expert_writings` VALUES ('576', '336', 'Fumigant toxicity of Ailanthus altissima Swingle, Atractylodes lancea (Thunb.) DC. and Elsholtzia stauntonii Benth extracts on three major stored-grain insects', '第一', 'Industrial Crops and Products', null);
INSERT INTO `expert_writings` VALUES ('577', '336', 'Fumigant activity of Elsholtzia stauntonii extract against Lasioderma serricorne', '第一', 'South African Journal of Science', null);
INSERT INTO `expert_writings` VALUES ('578', '336', 'Repellent and fumigant activity of Alpinia officinarum rhizome extract against Tribolium castaneum (Herbst)', '第一', 'African Journal of Microbiology Research', null);
INSERT INTO `expert_writings` VALUES ('579', '336', 'α-蒎烯对杂拟谷盗成虫的控制作用', '第一', ' 中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('580', '337', '《保护臭氧  绿色储粮》', '第一作者', '中国环境科学出版社', null);
INSERT INTO `expert_writings` VALUES ('581', '337', '《氮气气调应用实践》', '编委', '四川科学技术出版社', null);
INSERT INTO `expert_writings` VALUES ('582', '337', '2014学科发展报告《粮食储藏学科的现状与发展》', '执笔', '', '2014-01-01');
INSERT INTO `expert_writings` VALUES ('583', '337', '《粮食出入库技术实用操作手册》', '执行副主编', '四川科学技术出版社', null);
INSERT INTO `expert_writings` VALUES ('584', '338', 'Molecular Characterization of Two Nicotinic Acetylcholine Receptor Subunits from Liposcelis bostrychophila Badonnel (Psocoptera: Liposcelididae)', '第一作者', 'Archives of Insect Biochemistry and Physiology', null);
INSERT INTO `expert_writings` VALUES ('585', '338', 'Molecular characterization of two novel deltamethrin-inducible P 450 genes from Liposcelis bostrychophila Badonnel (Psocoptera: Liposcelididae)', '第二作者', 'Archives of Insect Biochemistry and Physiology', null);
INSERT INTO `expert_writings` VALUES ('586', '338', 'Transcription and induction profiles of three novel P450 genes in Liposcelis bostrychophila (Psocoptera: Liposcelididae)', '第二作者', ' Journal of economic entomology', null);
INSERT INTO `expert_writings` VALUES ('587', '338', '嗜虫书虱β-actin基因克隆及定量 PCR方法的建立', '第一作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('588', '339', '2007-2009', '', '国内领先', null);
INSERT INTO `expert_writings` VALUES ('589', '339', '2006-2011', '', '国际先进', null);
INSERT INTO `expert_writings` VALUES ('590', '339', '论文/著作名称', '作者身份', '发表期刊/出版社', null);
INSERT INTO `expert_writings` VALUES ('591', '339', 'Transcript analysis and expression profiling of three heat shock protein 70 genes in the ectoparasitoid Habrobracon hebetor (Hymenoptera: Braconidae). ', '通讯作者', 'Insect Science', null);
INSERT INTO `expert_writings` VALUES ('592', '340', '《建设广东省粮食质量安全监测体系若干问题研究》', '第一作者', '《粮油仓储科技通讯》', null);
INSERT INTO `expert_writings` VALUES ('593', '340', '《仓库鼠类防治技术应用研究》', '第一作者', '植保科技创新与现代农业建设', null);
INSERT INTO `expert_writings` VALUES ('594', '341', '不同的恒定PH3浓度下嗜虫书虱抗性品系的种群灭绝时间', '曹阳，郭忠建等', '郑州工程学院学报', '2003-01-01');
INSERT INTO `expert_writings` VALUES ('595', '341', ' 基于两维图论聚类分析的中国储粮区域划分', '曹阳，卞科等', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('596', '341', '惰性粉杀虫剂对黄粉虫成虫的物理伤害症状研究', '郎涛，曹阳等', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('597', '341', '2%和5%低氧处理赤拟谷盗不同虫态乳酸测定研究', '周思旭，曹阳等', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('598', '342', 'Study on the Insecticidal Activity Compounds of the Essential Oil from Allium sativum against Stored Grain Pests', '1900', '2011 AACCI', null);
INSERT INTO `expert_writings` VALUES ('599', '342', 'Study on the insecticidal activity compounds of the essential oil from Syzygium aromaticum against stored grain insect pests', '1900', 'Proceedings of the 10th IWCSPP ', null);
INSERT INTO `expert_writings` VALUES ('600', '342', '蛇床子素粉剂对储粮害虫的防治效果', '1900', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('601', '342', '时间', '奖励名称及等级', '', null);
INSERT INTO `expert_writings` VALUES ('602', '343', 'Vector competence of five common mosquito species in the people’s republic of China for western equine encephalitis virus.', '第一作者', 'Vector-borne Zoonto Dis. 12(7):605-608.', null);
INSERT INTO `expert_writings` VALUES ('603', '343', 'Biting Activity and Host Attractancy of Mosquitoes (Diptera: Culicidae) in Manzhouli, China.', '第一作者', 'J Med Entom. 49(6): 1283-1288.', null);
INSERT INTO `expert_writings` VALUES ('604', '343', 'Detection and widespread distribution of sodium channel alleles characteristic of insecticide resistance in Culex pipiens complex mosquitoes in China.', '第一作者', 'Medical and Veterinary Entomology. 26(2):228-232.', null);
INSERT INTO `expert_writings` VALUES ('605', '343', 'Dissemination of western equine encephalomyelitis virus in the potential vector, Culex pipiens pallens', '第一作者', 'Vector Ecology 35 (2): 313－317.', null);
INSERT INTO `expert_writings` VALUES ('606', '344', 'Low temperature phosphine fumigation for postharvest control of Liriomyza huidobrensis Blanchard (Diptera: Agromyzidae) on carnation', '通讯作者', 'Postharvest Biology and Technology', null);
INSERT INTO `expert_writings` VALUES ('607', '344', 'Toxicity of Phosphine Fumigation Against Bactrocera tau at Low Temperture', '通讯作者', 'Journal of Economic Entomology', null);
INSERT INTO `expert_writings` VALUES ('608', '344', 'Phytosanitary Irradiation of Peach Moth（Lepidoptera:Carposinidae）in Apple Fruits', '通讯作者', 'Radiation Physics and Chemistry', null);
INSERT INTO `expert_writings` VALUES ('609', '344', 'Design and Experiment of Fumigant Gas Trace Detection System Based on Photoionization', '通讯作者', 'Advanced Materials Research', null);
INSERT INTO `expert_writings` VALUES ('610', '345', '《中国储粮昆虫图鉴》', '主编', '中国农业科技出版社', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('611', '345', '《粮食储运安全与技术管理》', '副主编', '化学工业出版社', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('612', '345', '《河南昆虫志•鞘翅目（一）》', '副主编', '河南科学技术出版社', '1999-01-01');
INSERT INTO `expert_writings` VALUES ('613', '345', '中国储粮虱啮属昆虫两新记录及两已知种补记', '第一作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('614', '346', 'Prevention of toxigenic fungal growth in stored grains by carbon dioxide detection', '通讯作者', 'Food Additives & Contaminants: Part A, ', null);
INSERT INTO `expert_writings` VALUES ('615', '346', 'A site-directed CO2 detection method for monitoring the spoilage of\nstored grains by insects and fungi in Chinese horizontal warehouses', '通讯作者', 'Journal of Stored Products Research', null);
INSERT INTO `expert_writings` VALUES ('616', '346', 'A rapid detection method for microbial spoilage of agro-products\nbased on catalase activity', '通讯作者', 'Food Control', null);
INSERT INTO `expert_writings` VALUES ('617', '346', '储粮早期霉变监测方法测试研究', '1900', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('618', '347', '天然除虫菊素对三种储粮害虫的触杀毒力测定', '通讯作者', '武汉轻工大学学报', null);
INSERT INTO `expert_writings` VALUES ('619', '347', '新型储粮防虫器具的驱虫效果研究', '通讯作者', '  武汉轻工大学学报', null);
INSERT INTO `expert_writings` VALUES ('620', '347', '两种昆虫生长调节剂对赤拟谷盗的控制效果', '通讯作者', '  中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('621', '347', '农业昆虫学', '参编', '世界图书出版公司', null);
INSERT INTO `expert_writings` VALUES ('622', '348', '掌叶苹婆种子提取物对3种主要储粮害虫的毒力测定', '第一作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('623', '348', '湖南农户储粮综合技术核心示范基地储粮现状调查', '第一作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('624', '349', '小麦粉中虫卵的快速检测技术的研究与比较', '通讯作者', '中国粮油\n学报\n', null);
INSERT INTO `expert_writings` VALUES ('625', '349', 'Comparison of Pyrethroid Resistance in Adults and (*)\nLarvae of Culex pipiens pallens (Diptera: Culicidae) From Four Field Populations in China\n', '第二作者', 'Journal of\nEconomic Entomology\n', null);
INSERT INTO `expert_writings` VALUES ('626', '349', '不同光波长与光强度对赤拟谷盗趋光性影响的初步研究', '第二作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('627', '350', '我国主要储粮害虫抗性调查研究', '第2作者', '《粮食储藏》', '2004-01-01');
INSERT INTO `expert_writings` VALUES ('628', '350', '中国粮食仓储行业淘汰甲基溴行动', '第1作者', '《粮食储藏》', '2007-01-01');
INSERT INTO `expert_writings` VALUES ('629', '350', '我国粮食储藏技术战略研究', '第3作者', '《粮油食品科技》', '2007-01-01');
INSERT INTO `expert_writings` VALUES ('630', '350', 'Advancement of fumigation technologies on grain storage in China', '第1作者', 'CAF2008', null);
INSERT INTO `expert_writings` VALUES ('631', '352', '稻谷储藏安全水分研究', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('632', '352', 'DON净化柱——高效液相色谱法检测粮谷中呕吐毒素', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('633', '352', '储粮真菌危害早期检测技术初步探索', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('634', '352', '玉米赤霉烯酮液相色谱法检测', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('635', '353', '高效液相色谱法测定防霉剂中丙酸含量的研究', '第一作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('636', '353', '氨基酸自动分析仪快速分析方法的研究 ', '第一作者', '化学研究与应用 ', null);
INSERT INTO `expert_writings` VALUES ('637', '353', 'L8900氨基酸分析仪快速测定小麦中赖氨酸方法的研究 ', '第二作者', '粮油仓储科技通讯 ', null);
INSERT INTO `expert_writings` VALUES ('638', '353', 'L8900氨基酸分析仪快速测定饲料中赖氨酸的方法研究 ', '第一作者', '饲料研究 ', null);
INSERT INTO `expert_writings` VALUES ('639', '354', '《油脂工业食用磷酸检测原理浅析》', '', '粮油食品科技 ', '2011-01-01');
INSERT INTO `expert_writings` VALUES ('640', '354', '《大豆安全储藏研究进展》 ', '', '安徽农业科学', '2013-01-01');
INSERT INTO `expert_writings` VALUES ('641', '354', '《酶法水解花生蛋白及产物抗氧化活性的研究》', '', '粮油加工     ', '2014-01-01');
INSERT INTO `expert_writings` VALUES ('642', '354', '《多不饱和脂肪酸在癌症发生中的作用机制研究进展》', '', '中国油脂', '2014-01-01');
INSERT INTO `expert_writings` VALUES ('643', '355', '论文/著作名称', '作者身份', '发表期刊/出版社', null);
INSERT INTO `expert_writings` VALUES ('644', '355', '英汉粮油食品词汇', '第2', '化学工业出版社', null);
INSERT INTO `expert_writings` VALUES ('645', '355', '粮油质量检验员', '副主编', '中国轻工业出版社', null);
INSERT INTO `expert_writings` VALUES ('646', '355', '粮油储藏学', '第4', '中国轻工业出版社', null);
INSERT INTO `expert_writings` VALUES ('647', '356', '3种食源性致病菌多重PCR检测体系的建立', '通讯作者', '食品科技', null);
INSERT INTO `expert_writings` VALUES ('648', '356', '二重PCR法快速检测3种食源性致病菌', '第三作者', '食品质量与安全学报', null);
INSERT INTO `expert_writings` VALUES ('649', '356', 'Trehalose protects wine yeast against oxidation under thermal stress.', '第一作者', 'World Journal of Microbiology and Biotechnology', null);
INSERT INTO `expert_writings` VALUES ('650', '356', 'Physiological response of different wine yeasts to osmotic stress. ', '第一作者', 'American journal of enology and viticulture, ', null);
INSERT INTO `expert_writings` VALUES ('651', '357', '玉米水分测定方法的比较', '第二作者', '《粮食储藏》', '2003-01-01');
INSERT INTO `expert_writings` VALUES ('652', '357', '影响脂肪酸值测定因素探讨', '第一作者', '《粮食储藏》', '2004-01-01');
INSERT INTO `expert_writings` VALUES ('653', '357', '胶体金免疫层析发快速测定玉米和小麦中玉米赤霉烯酮', '第三作者', '《粮油食品科技》', '2011-01-01');
INSERT INTO `expert_writings` VALUES ('654', '358', '气相色谱在石油化工中的应用', '参与编写其中两章', '化学工业出版社', null);
INSERT INTO `expert_writings` VALUES ('655', '358', '气相色谱仪器系统', '参与编写其中一章', '化学工业出版社', null);
INSERT INTO `expert_writings` VALUES ('656', '358', '石油加工过程中的脱硫', '参与编写其中一章', '中国石化出版社', null);
INSERT INTO `expert_writings` VALUES ('657', '359', '大豆低聚糖粉中棉子糖和水苏糖的测定方法研究', '第一作者', '大豆科技 ', null);
INSERT INTO `expert_writings` VALUES ('658', '359', '高效液相色谱法测定大豆低聚糖中的棉籽糖和水苏糖', '第一作者', '现代食品科技 ', null);
INSERT INTO `expert_writings` VALUES ('659', '359', '《仓储管理实物》', '副主编', '中国财富出版社', null);
INSERT INTO `expert_writings` VALUES ('660', '359', '《粮油食品加工及检验》', '参编', '中国林业出版社 ', null);
INSERT INTO `expert_writings` VALUES ('661', '360', '光度滴定仪法测定稻米脂肪酸值的研究', '合著第一作者', '《粮食储藏》2009年06期', null);
INSERT INTO `expert_writings` VALUES ('662', '360', '基于嵌入式机器视觉的粮油滴定分析仪研究', '合著第一作者', '《粮食储藏》2010年05期', null);
INSERT INTO `expert_writings` VALUES ('663', '360', 'JDDY型粮油滴定分析仪在稻谷玉米脂肪酸值测定中的应用', '合著第二作者', '《粮食储藏》2012年02期', null);
INSERT INTO `expert_writings` VALUES ('664', '361', '稻谷不完善粒检测方法探讨', '合著第一作者', '《粮油仓储科技通讯》2013年第3期', null);
INSERT INTO `expert_writings` VALUES ('665', '361', '时间', '奖励名称及等级', '', null);
INSERT INTO `expert_writings` VALUES ('666', '361', '2006-06-01', '中国粮油学会第五届（中储粮杯）优秀论文三等奖', '', null);
INSERT INTO `expert_writings` VALUES ('667', '361', '2014-12-02', '一等奖', '', null);
INSERT INTO `expert_writings` VALUES ('668', '362', '面包质构特性测定方法的研究（Ⅰ）--面包样品制作与质构测试方法探讨', '合著第二作者', '《粮食储藏》', '2010-01-01');
INSERT INTO `expert_writings` VALUES ('669', '362', '米质判定器在粮食感官检验方面的应用', '合著第一作者', '《粮食储藏》', '2006-01-01');
INSERT INTO `expert_writings` VALUES ('670', '362', '影响面团拉伸仪性能因素的分析', '合著第二作者', '《粮食储藏》', '2009-01-01');
INSERT INTO `expert_writings` VALUES ('671', '362', '光度滴定仪法测定稻米脂肪酸值的研究', '合著第三作者', '《粮食储藏》', '2009-01-01');
INSERT INTO `expert_writings` VALUES ('672', '363', '《粮食质量检验手册》', '主编', '辽宁科技出版社', null);
INSERT INTO `expert_writings` VALUES ('673', '363', '《全国粮油检验人员培训教材》（1—3册）', '编委', '国家粮食储备局', null);
INSERT INTO `expert_writings` VALUES ('674', '363', '东北地区农户粮食产后减损技术与发展趋势分析', '第一作者', '中国科技成果.17期', null);
INSERT INTO `expert_writings` VALUES ('675', '363', '粮食干燥系统节能减排技术研究与应用', '第一作者', '粮油食品科技.4期', null);
INSERT INTO `expert_writings` VALUES ('676', '364', '粮油质量检验员培训教程', '主编', '中国轻工业出版社', null);
INSERT INTO `expert_writings` VALUES ('677', '364', '模拟油罐储藏大豆油氧化稳定性研究 ', '第一作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('678', '364', '小麦粉储藏期间水分变化规律的探讨 ', '第一作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('679', '364', '提取条件对小麦麸皮阿拉伯木聚糖相对分子质量分布的影响', '第一作者', '食品科学', null);
INSERT INTO `expert_writings` VALUES ('680', '365', '时间', '奖励名称及等级', '', null);
INSERT INTO `expert_writings` VALUES ('681', '365', '2010-05-01', '第二届全国粮食行业职业技能竞赛 粮油质检机构组 滕娇琴 获二等奖', '', null);
INSERT INTO `expert_writings` VALUES ('682', '365', '2012-09-01', '全国粮食行业技能人才培育突出贡献奖个人', '', null);
INSERT INTO `expert_writings` VALUES ('683', '366', '时间', '奖励名称及等级', '', null);
INSERT INTO `expert_writings` VALUES ('684', '368', 'Study on the Insecticidal Activity Compounds of the Essential Oil from Allium sativum against Stored Grain Pests', '1900', '2011 AACCI', null);
INSERT INTO `expert_writings` VALUES ('685', '368', 'Study on the insecticidal activity compounds of the essential oil from Syzygium aromaticum against stored grain insect pests', '1900', 'Proceedings of the 10th IWCSPP ', null);
INSERT INTO `expert_writings` VALUES ('686', '368', '蛇床子素粉剂对储粮害虫的防治效果', '1900', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('687', '368', '时间', '奖励名称及等级', '', null);
INSERT INTO `expert_writings` VALUES ('688', '369', '稻谷储藏安全水分研究', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('689', '369', 'DON净化柱——高效液相色谱法检测粮谷中呕吐毒素', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('690', '369', '储粮真菌危害早期检测技术初步探索', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('691', '369', '玉米赤霉烯酮液相色谱法检测', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('692', '371', 'Study on the Insecticidal Activity Compounds of the Essential Oil from Allium sativum against Stored Grain Pests', '1900', '2011 AACCI', null);
INSERT INTO `expert_writings` VALUES ('693', '371', 'Study on the insecticidal activity compounds of the essential oil from Syzygium aromaticum against stored grain insect pests', '1900', 'Proceedings of the 10th IWCSPP ', null);
INSERT INTO `expert_writings` VALUES ('694', '371', '蛇床子素粉剂对储粮害虫的防治效果', '1900', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('695', '371', '时间', '奖励名称及等级', '', null);
INSERT INTO `expert_writings` VALUES ('696', '372', '稻谷储藏安全水分研究', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('697', '372', 'DON净化柱——高效液相色谱法检测粮谷中呕吐毒素', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('698', '372', '储粮真菌危害早期检测技术初步探索', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('699', '372', '玉米赤霉烯酮液相色谱法检测', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('700', '374', 'Study on the Insecticidal Activity Compounds of the Essential Oil from Allium sativum against Stored Grain Pests', '1900', '2011 AACCI', null);
INSERT INTO `expert_writings` VALUES ('701', '374', 'Study on the insecticidal activity compounds of the essential oil from Syzygium aromaticum against stored grain insect pests', '1900', 'Proceedings of the 10th IWCSPP ', null);
INSERT INTO `expert_writings` VALUES ('702', '374', '蛇床子素粉剂对储粮害虫的防治效果', '1900', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('703', '374', '时间', '奖励名称及等级', '', null);
INSERT INTO `expert_writings` VALUES ('704', '375', '稻谷储藏安全水分研究', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('705', '375', 'DON净化柱——高效液相色谱法检测粮谷中呕吐毒素', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('706', '375', '储粮真菌危害早期检测技术初步探索', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('707', '375', '玉米赤霉烯酮液相色谱法检测', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('708', '377', 'Study on the Insecticidal Activity Compounds of the Essential Oil from Allium sativum against Stored Grain Pests', '1900', '2011 AACCI', null);
INSERT INTO `expert_writings` VALUES ('709', '377', 'Study on the insecticidal activity compounds of the essential oil from Syzygium aromaticum against stored grain insect pests', '1900', 'Proceedings of the 10th IWCSPP ', null);
INSERT INTO `expert_writings` VALUES ('710', '377', '蛇床子素粉剂对储粮害虫的防治效果', '1900', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('711', '377', '时间', '奖励名称及等级', '', null);
INSERT INTO `expert_writings` VALUES ('712', '378', '稻谷储藏安全水分研究', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('713', '378', 'DON净化柱——高效液相色谱法检测粮谷中呕吐毒素', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('714', '378', '储粮真菌危害早期检测技术初步探索', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('715', '378', '玉米赤霉烯酮液相色谱法检测', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('716', '380', 'Study on the Insecticidal Activity Compounds of the Essential Oil from Allium sativum against Stored Grain Pests', '1900', '2011 AACCI', null);
INSERT INTO `expert_writings` VALUES ('717', '380', 'Study on the insecticidal activity compounds of the essential oil from Syzygium aromaticum against stored grain insect pests', '1900', 'Proceedings of the 10th IWCSPP ', null);
INSERT INTO `expert_writings` VALUES ('718', '380', '蛇床子素粉剂对储粮害虫的防治效果', '1900', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('719', '380', '时间', '奖励名称及等级', '', null);
INSERT INTO `expert_writings` VALUES ('720', '381', '稻谷储藏安全水分研究', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('721', '381', 'DON净化柱——高效液相色谱法检测粮谷中呕吐毒素', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('722', '381', '储粮真菌危害早期检测技术初步探索', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('723', '381', '玉米赤霉烯酮液相色谱法检测', '第１作者', '粮食储藏', null);
INSERT INTO `expert_writings` VALUES ('724', '382', '论文/著作名称', '作者身份', '发表期刊/出版社', null);
INSERT INTO `expert_writings` VALUES ('725', '383', '论文/著作名称', '作者身份', '发表期刊/出版社', null);
INSERT INTO `expert_writings` VALUES ('726', '384', ' 拉面专用粉的研究', '第一作者', '现代面粉工业', null);
INSERT INTO `expert_writings` VALUES ('727', '384', '麻花专用粉的研究开发', '第一作者', '现代面粉工业', null);
INSERT INTO `expert_writings` VALUES ('728', '384', '糊粉层细粉含量对面团特性和馒头品质的影响', '第一作者', '现代面粉工业', null);
INSERT INTO `expert_writings` VALUES ('729', '385', 'Chemical compositions of the volatile extracts from seeds of Dendranthema nankingense and Borago officinalis.', '第一兼通讯作者', 'Journal of Food and Drug Analysis', null);
INSERT INTO `expert_writings` VALUES ('730', '385', 'Effect of refining on the lignan content and oxidative stability of oil pressed from roasted sesame seed.', '第一兼通讯作者', 'International Journal of Food Science and Technology', null);
INSERT INTO `expert_writings` VALUES ('731', '385', 'Liquid-liquid extraction of polycyclic aromatic hydrocarbons in four different edible oils from China. ', '第一兼通讯作者', 'Food Chemistry ', null);
INSERT INTO `expert_writings` VALUES ('732', '385', '专著： 功能性油脂', '主编', '北京：中国轻工业出版社', '2001-01-01');
INSERT INTO `expert_writings` VALUES ('733', '386', 'Structural insights into the substrate specificity and transglycosylation activity of a fungal glycoside hydrolase family 5 beta-mannosidase', '通讯作者', 'Acta Crystallographica Section D-Biological Crystallography', null);
INSERT INTO `expert_writings` VALUES ('734', '386', 'Biotechnological potential of microbial alpha-galactosidases', '通讯作者', 'Critical Reviews in Biotechnology', null);
INSERT INTO `expert_writings` VALUES ('735', '386', 'Characterisation of a thermostable xylanase from Chaetomium sp. and its application in Chinese steamed bread', '通讯作者', 'Food Chemistry', null);
INSERT INTO `expert_writings` VALUES ('736', '386', 'Gene cloning, functional expression and characterization of a novel glycogen branching enzyme from Rhizomucor miehei and its application in wheat breadmaking', '通讯作者', 'Food Chemistry', null);
INSERT INTO `expert_writings` VALUES ('737', '387', '工业化生产馒头的开发研究', '独著', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('738', '387', '主食工程中太阳能集热系统应用技术', '第一作者', '     粮食加工', null);
INSERT INTO `expert_writings` VALUES ('739', '387', '我国发酵面食机械装备的发展与对策', '独著', '     食品科技', null);
INSERT INTO `expert_writings` VALUES ('740', '387', '加快主食面制品工业的发展促进小麦加工转化', '独著', '     食品科技', null);
INSERT INTO `expert_writings` VALUES ('741', '388', '基于模糊聚类分析的中国主食馒头分类研究', '河南省面制食品工程研究中心副主任', '中国粮油学报', '2009-01-01');
INSERT INTO `expert_writings` VALUES ('742', '388', '以科技创新推动主食馒头产业化', '面制食品国家地方联合工程研究中心副主任', '农产品加工', '2013-01-01');
INSERT INTO `expert_writings` VALUES ('743', '389', '臭氧处理对糯米品质的影响及其机理', '通讯作者', '食品科学', null);
INSERT INTO `expert_writings` VALUES ('744', '389', '稀碱法分离工艺对糯米中蛋白质提取率的影响', '通讯作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('745', '389', '粮油副产品开发技术', '主编', '湖北科技出版社', null);
INSERT INTO `expert_writings` VALUES ('746', '389', '液体大麦精在面包烘焙中的应用', '通讯作者', '中国粮油学报，', null);
INSERT INTO `expert_writings` VALUES ('747', '392', '中国食品工业亟需科技创新', '河南省面制食品工程研究中心主任', '中国粮油学报', '2007-01-01');
INSERT INTO `expert_writings` VALUES ('748', '392', '中国小麦产业链问题解析', '河南省面制食品工程研究中心主任', '中国粮油学报', '2007-01-01');
INSERT INTO `expert_writings` VALUES ('749', '392', '关于我国食品工业发展的若干思考', '面制食品国家地方联合工程研究中心主任', '中国粮油学报', '2013-01-01');
INSERT INTO `expert_writings` VALUES ('750', '392', '农业资源开发在城镇化建设中的作用', '面制食品国家地方联合工程研究中心主任', '农业工程技术（农产品加工业）', '2013-01-01');
INSERT INTO `expert_writings` VALUES ('751', '393', '馒头生产技术', '第一作者，主编', '化学工业出版社', null);
INSERT INTO `expert_writings` VALUES ('752', '393', '食品分析与实验', '第一作者，主编', '化学工业出版社', null);
INSERT INTO `expert_writings` VALUES ('753', '394', '我国小麦硬度状况及硬度分类研究', '第一作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('754', '394', '糯小麦粉配粉理化特性及其对馒头影响', '通讯作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('755', '394', '利用物性测试仪分析小麦粉馒头品质', '第一作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('756', '394', '利用PCR技术鉴别普通小麦Glu-1位点的某些等位基因', '第一作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('757', '395', '假日文化回归——传统烘焙食品的发展契机', '唯一署名', '《 聪慧食品工业网》', null);
INSERT INTO `expert_writings` VALUES ('758', '395', '\n用奥运标准提升质量管控水平 ', '唯一署名', '《中国粮油学会发酵面食分会会刊》', null);
INSERT INTO `expert_writings` VALUES ('759', '395', '食品配料在线采购将推动烘焙行业健康发展', '唯一署名', '《包谷时代》', null);
INSERT INTO `expert_writings` VALUES ('760', '395', '新型食品配料在焙烤产品中的应用', '第一署名', '《包谷时代》', null);
INSERT INTO `expert_writings` VALUES ('761', '397', '厌氧胁迫对发芽糙米中γ-氨基丁酸含量变化的影响', '通讯作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('762', '397', '储藏期对发芽糙米富集γ-氨基丁酸的影响', '通讯作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('763', '397', '糙米发芽过程中内源酶活性及主要成分的变化', '通讯作者', '食品科学', null);
INSERT INTO `expert_writings` VALUES ('764', '397', '发芽条件对发芽糙米中γ-氨基丁酸积累量的影响', '通讯作者', '农业工程学报', null);
INSERT INTO `expert_writings` VALUES ('765', '398', '馒头的实验室制作及品尝评价新方法', '第一作者', '中国粮油学报', null);
INSERT INTO `expert_writings` VALUES ('766', '398', '《粳稻品种图鉴》', '副主编', '中国轻工业出版社', null);
INSERT INTO `expert_writings` VALUES ('767', '398', '《农产品质量安全检测手册》', '参编', '中国标准出版社', null);
INSERT INTO `expert_writings` VALUES ('768', '398', '国家标准：GB/T 17320《专用小麦品种品质》', '第一起草人', '国家标准出版社', null);
INSERT INTO `expert_writings` VALUES ('769', '399', 'Chemical composition and sensory characteristics of oat flakes: a comparative study of naked oat flakes from China and hulled oat flakes from western countries', '第一作者/通讯作者', ' Journal of Cereal Science', null);
INSERT INTO `expert_writings` VALUES ('770', '399', 'Physicochemical properties and regulatory effects on db/db diabetic mice of beta-glucans extracted from oat, wheat and barley', '通讯作者', 'Food Hydrocolloids', null);
INSERT INTO `expert_writings` VALUES ('771', '399', 'Oat β-glucan increased ATPases activity and Energy in small intestine of rats. ', '通讯作者', 'Journal of Agriculture Food Chemistry', null);
INSERT INTO `expert_writings` VALUES ('772', '399', '燕麦品质与加工', '主编', '科学出版社', null);
INSERT INTO `expert_writings` VALUES ('773', '400', '2002年中国粮油食品工业的现状及2003年展望', '', ' 《粮食与食品工业》2003年第1期', null);
INSERT INTO `expert_writings` VALUES ('774', '400', '2002年《中国粮油学报》学术论文的评述', '', '《中国粮油学报》2003年第6期', null);
INSERT INTO `expert_writings` VALUES ('775', '400', '中国的小麦生产与面粉及面制品工业', '', '《粮油食品科技》     2004年第12期', null);
INSERT INTO `expert_writings` VALUES ('776', '400', '2004-2005年我国粮油市场供需情况', '', ' 《江西食品工业》2005年第2期', null);
INSERT INTO `expert_writings` VALUES ('777', null, 'Lu, Z.-H., Sasaki, T., Li, Y.-Y., Yoshihashi, T., Li, L.-T., and Kohyama, K. Effect of amylose content and rice type on dynamic viscoelasticity of a composite rice starch gel. 23: 1712-1719.', '独立', 'Food Hydrocolloids', null);
INSERT INTO `expert_writings` VALUES ('778', null, 'Lu, Z.-H., Sasaki, T., Li, Y.-Y., Yoshihashi, T., Li, L.-T., and Kohyama, K. Effect of amylose content and rice type on dynamic viscoelasticity of a composite rice starch gel. 23: 1712-1719.', '独立', 'Food Hydrocolloids', null);
INSERT INTO `expert_writings` VALUES ('779', null, 'Lu, Z.-H., Sasaki, T., Li, Y.-Y., Yoshihashi, T., Li, L.-T., and Kohyama, K. Effect of amylose content and rice type on dynamic viscoelasticity of a composite rice starch gel. 23: 1712-1719.', '独立', 'Food Hydrocolloids', null);
INSERT INTO `expert_writings` VALUES ('780', null, 'Lu, Z.-H., Sasaki, T., Li, Y.-Y., Yoshihashi, T., Li, L.-T., and Kohyama, K. Effect of amylose content and rice type on dynamic viscoelasticity of a composite rice starch gel. 23: 1712-1719.', '独立', 'Food Hydrocolloids', null);
INSERT INTO `expert_writings` VALUES ('781', '401', '', '', '', null);
INSERT INTO `expert_writings` VALUES ('783', '54', '434', '434', '434', '2016-02-25');
INSERT INTO `expert_writings` VALUES ('784', '402', '', '', '', null);
INSERT INTO `expert_writings` VALUES ('785', '403', '《优化我国粮食大流通运输方案初探》', '作者身份1', '《物流科技》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('786', '403', '《我国粮食物流现状及前景展望》', '作者身份2', '《粮食流通技术》', '2005-01-01');
INSERT INTO `expert_writings` VALUES ('787', '403', '《集装箱散粮运输技术现状及发展趋势》', '作者身份3', '《粮油食品科技》', '2008-01-01');
INSERT INTO `expert_writings` VALUES ('788', '403', '编制《粮油工业用图形符合、代号、仓储工业》、《粮油机械 清仓机》、《散粮汽车配置标准》国家标准（报批）', '作者身份4', '', null);

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NewsTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '新闻标题',
  `NewsContent` longtext CHARACTER SET utf8 COMMENT '新闻内容',
  `NewsType` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '新闻类型',
  `NewsDate` date DEFAULT NULL COMMENT '发表时间',
  `NewsMan` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '发表人',
  `status` int(1) DEFAULT NULL COMMENT '状态（0取消 1发布）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('18', '关于组织申报和推荐2015年度中国粮油学会', '<p class=\"MsoBodyText\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">各省、自治区、直辖市及新疆生产建设兵团粮食局、粮油学会，各所属专业分会，各会员及有关单位：</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">中国粮油学会科学技术奖（以下简称粮油科技奖）是经国家奖励工作办公室批准，面向全国粮食行业的科学技术奖，同时接受国家粮食局的指导，每年评选、表彰一次。为继续表彰和鼓励在粮食领域科学研究、技术创新、成果推广、高新技术产业化中做出突出贡献，取得杰出成就的个人和集体，中国粮油学会（以下简称粮油学会）现组织申报2015年度中国粮油学会科学技术奖。获奖项目由粮油学会授予获奖证书，并择优推荐给国家粮食局和中国科协申报国家科学技术奖。具体事项通知如下：</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p class=\"MsoBodyTextIndent\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">一、</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">推荐要求</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">（一）推荐范围</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">1.&nbsp;基础研究和应用研究；</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">2.&nbsp;粮油科技发明创新；</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">3.&nbsp;先进科技成果推广应用及产业化；</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">4.&nbsp;粮油重大工程组织实施；</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">5.&nbsp;技术标准研究与制定。</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">注：技术开发类项目要求推广应用一年以上</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">（二）</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">自选课题完成的成果，由其法人单位负责推荐</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">。</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">（三）</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">按照有关部门（单位）的计划完成的成果，应由制定计划的部门（单位）推荐，或经该部门（单位）同意后，由成果完成单位推荐。</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">（四）</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">两个或两个以上单位共同完成的成果，应由主要完成单位推荐。</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">（五）2014年度粮油科技奖未能通过评审的项目，如研究工作又获得新的实质性进展并符合2015年度科技奖申报条件，可以按照规定的程序重新推荐。</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p class=\"MsoBodyTextIndent\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">二、推荐单位</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">（一）省、自治区、直辖市粮食行政主管部门；</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">（二）粮油学会所属专业分会；</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">（三）省、自治区、直辖市粮油学会；</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">（四）高等院校；</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">（五）科研院所；</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">（六）大中型企业。</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">各推荐单位要严格按照粮油科技奖励工作的有关规定，认真做好2015年度粮油科技奖励推荐项目、人员的遴选和推荐材料的审核把关工作。行政管理人员、政府官员或企业负责人作为完成人的，必须有发现或技术研发成果的确凿证明，推荐人选的排序必须和发现、发明成果或技术鉴定文件中的排序一致。要确保推荐材料真实可靠，为粮油科技奖的评审奠定基础。</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p class=\"MsoBodyTextIndent\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">三</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">、推荐材料</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">1.《2015年度</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">中国粮油学会科学技术奖推荐项目（人）汇总表</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">》原件1份,须加盖推荐单位章。</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">2.《</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">中国粮油学会科学技术奖励推荐书</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">》及相关附件材料3份，含1份原件，推荐书和附件材料须装订成册。</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">以上所有材料（包括相关附件材料）的电子版必须刻录光盘随书面材料一同报送。相关</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">表</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">格可</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">从学会网站下载</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">。</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p class=\"MsoBodyTextIndent\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">四</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">、</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">推荐</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">时间</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">请各有关单位认真组织申报和推荐工作，并</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">于20</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">15</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">年</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">6</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">月</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">30</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">日前（以寄出邮戳为准）将推荐材料寄（送）交</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">中国粮油学会</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">奖励工作办公室，逾期不予受理。</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p class=\"MsoBodyTextIndent\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">五</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">、</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">联系方式</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">中国粮油学会科学技术</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">奖励工作办公室</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">：</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">联系人：</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">杨晓静&nbsp;&nbsp;张勇</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">电</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">&nbsp;&nbsp;</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">话：</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">010-68357512</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">传</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">&nbsp;&nbsp;</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">真</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">：010-68357511</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:-67.7pt;margin-left:98.9pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">通讯</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">地址：</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">北京市西城区百万庄大街11号粮科大厦中国粮油学会（100037）</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">E-mail：</span><span><a href=\"mailto:jiangliban@126.com\"><span style=\"color:#000000;font-family:仿宋;font-size:15pt;text-decoration:underline;\" class=\"16\">jiangliban@126.com</span></a></span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<p style=\"text-indent:31.2pt;\" class=\"MsoNormal\">\n	<span style=\"color:#000000;font-family:仿宋;font-size:15pt;\">网址：http://www.ccoaonline.com</span><span style=\"color:#000000;font-family:仿宋;font-size:15pt;\"></span>\n</p>\n<!--EndFragment-->', null, '2016-01-12', null, '1');

-- ----------------------------
-- Table structure for `project`
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyID` int(11) DEFAULT NULL COMMENT '申报公司',
  `ProjectCN` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '项目中文名称',
  `ProjectEN` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '项目英文名称',
  `Category` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '评奖类别(取数据字典)',
  `Group` varbinary(50) DEFAULT NULL COMMENT '专业专家评审组',
  `GroupExpertIDs` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '发送专业评审时设置的该专家组所有的专家编号，以删除组员使用',
  `StartTime` date DEFAULT NULL COMMENT '起时间',
  `EndTime` date DEFAULT NULL COMMENT '止时间',
  `FromTask` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '任务来源',
  `FromOther` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '任务来源其他',
  `PlanFund` longtext CHARACTER SET utf8 COMMENT '计划（基金）/名称/编号',
  `Secret` int(1) DEFAULT NULL COMMENT '是否保密',
  `SecretTime` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '保密期限',
  `RecommendCompany` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '推荐单位',
  `Fundamentals` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '基本情况页盖章回传',
  `Introduction` longtext CHARACTER SET utf8 COMMENT '项目简介',
  `Content` longtext CHARACTER SET utf8 COMMENT '项目详细内容 --立项背景',
  `Content1` longtext CHARACTER SET utf8 COMMENT '项目详细内容--发现/发明及创新点',
  `Content2` longtext CHARACTER SET utf8 COMMENT '项目详细内容--保密要点',
  `Content3` longtext CHARACTER SET utf8 COMMENT '项目详细内容--与当前国内外同类研究、同类技术的综合比较',
  `Content4` longtext CHARACTER SET utf8 COMMENT '项目详细内容--详细科学技术内容',
  `AppSituation` longtext CHARACTER SET utf8 COMMENT '应用情况',
  `TotalFund` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '项目总投资金',
  `Payback` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '回收期',
  `Calculations` longtext CHARACTER SET utf8 COMMENT '项目计算依据',
  `Social` longtext CHARACTER SET utf8 COMMENT '社会效益',
  `Recommended` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '推荐单位意见回传',
  `ApplyYear` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '申报年度',
  `Note` longtext CHARACTER SET utf8 COMMENT '审查意见',
  `Status` int(11) DEFAULT NULL COMMENT '状态(0未提交，1形式审查中，2形式审查合格，项目评审中，3形式审查不合格，4评审中(状态4已没在用),5特等奖，6一等奖，7二等奖，8三等奖，9未中奖)',
  `WinningType` int(11) DEFAULT NULL COMMENT '中奖类型（1.直接进入，2.投票不符合降级中奖，3、投票符合中奖）',
  `Step` int(11) DEFAULT NULL COMMENT '已保存步骤（1项目基本情况,2主要完成单位,3主要完成人,4基本情况页盖章回传,5项目简介,6项目详细内容,7应用情况,8经济效益,9社会效益,10知识产权表,11推荐单位意见,12上传附件）',
  `GroupZH` int(50) DEFAULT NULL,
  `RegisterNum` int(10) DEFAULT NULL COMMENT '项目登记号',
  `Remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  `recom_results` int(11) DEFAULT NULL COMMENT '推荐结果(1 推荐一等奖 2 推荐)',
  `state` int(11) DEFAULT NULL COMMENT '1、专家评审项目表发送  2、  专业项目评审推荐项目汇总表 3、发送给专家”，生成最终总分排序表 4、投票类型分配表保存 5、投票类型分配表发送 6、提交票数统计结果 7、发布到申报平台',
  `vote_type` int(11) DEFAULT '0' COMMENT '投票类别(1、特等奖、2、一等奖、3、二等奖、4、三等奖)  直接进入获奖项目列表(5、特等奖、6、一等奖、7、二等奖、8、三等奖)',
  `send_state` int(11) DEFAULT NULL COMMENT '获奖项目列表发布 1 是 2 否',
  `groupZH_person` longtext COMMENT '综评组中的专家信息（页面选中）多个以,分开',
  `GroupZY` int(11) DEFAULT NULL COMMENT '专业评审组',
  `winning_results` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '获奖结果（特等奖，一等奖，二等奖，三等奖，未得奖）',
  `Applytime` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '申请时间 记录当前录入时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;


-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('133', '164', '药品级大豆亚油酸纯化工艺的研究', null, '3', 0x3432, '54,109,58,56', '2012-07-10', '2013-12-08', '3', null, '上海市科学技术委员会应用技术开发专项资金项目2012-208', '1', '10年', '上海良友集团', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/QQ图片20151231104619.jpg', '<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">本项目属于</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">油脂加工</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">行业</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">副产品皂脚</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">的深加工领域。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">本项目重点研究内容：</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">从大豆皂脚混合脂肪酸固有性质（沸点、分子结构）出发，通过精确控制工艺温度和压力条件，组合薄膜蒸发和精馏工艺，选择性分离出中、低碳链脂肪酸，</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">提高了原料中亚油酸的含量。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">本项目确定的大豆亚油酸纯化工艺——两次薄膜蒸发和一次精馏，</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">避免</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">了过程中</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">使用有机溶剂</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">，</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">真正做到清洁生产</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">，最终</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">产品</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">质量</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">符合</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">药品亚油酸技术指标的</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">要求</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">据中科院技术查新，尚未见有相同内容的研究报道，技术水平属于国内领先。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">高纯度药品级亚油酸具有良好的市场空间，</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">项目</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">研究开发的药品级亚油酸的生产工艺可以改变目前国内市场药品级亚油酸供应不足的现状</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">，</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">开发的药品级亚油酸可以应用于国内医药企业，作为生产治疗高血压、高血脂等疾病的药物的原料。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\"></span>\r\n</p>\r\n<!--EndFragment-->', '<p class=\"NewStyle16\" style=\"text-indent:28pt;\">\r\n	亚油酸是人体必需脂肪酸，具有抗辐射、降低胆固醇、防止动脉硬化、促进生长发育、增强机体免疫力及美容美发等多种生理功能。高纯度亚油酸在医药、食品等行业有着广泛的应用。 <br />\r\n传统的脂肪酸分离纯化亚油酸的方法有：冷冻压榨分离法、有机溶剂分离法、表面活性剂分离法、尿素包合分离法、精馏分离法等。虽然脂肪酸分离纯化亚油酸方法比较多，但仍有不少理论与实际问题需要深入研究和解决。上述方法除精馏分离法外，存在需使用大量有机溶剂的问题，生产过程中会带来环境的污染，同时残留的有机溶剂也会对人体产生不良影响，因此选择避免使用有机溶剂的工艺就十分必要。<br />\r\n大豆是我国重要的油脂来源，油脂加工过程中产生的副产品皂脚为脂肪酸的生产提供了大量的原料。脂肪酸作为一种重要的工业原料，化工、轻工，建材等方面都有广泛的应用，市场需求量大，以大豆油皂脚为原料制取的混合脂肪酸若不经过进一步提纯，只能在低层次上进行应用，限制了其应用领域的扩展。利用大豆油皂脚来提取混合脂肪酸，不但可以变废为宝，而且还能创造很大的经济效益。例如，药品级亚油酸所要求碘价在148gI/100g以上，大豆油皂脚脂肪酸作为一种混合酸，其凝固点高，碘价较低，一般在125gI/100g以下，因而无法在医药领域直接利用，有必要进一步提纯亚油酸。\r\n</p>', '<p class=\"NewStyle16\" style=\"text-indent:28pt;\">\r\n	（1）采用亚油酸含量百分之五十以下，碘价在125gI/100g以下的大豆混合脂肪酸为原料。<br />\r\n（2）采用薄膜蒸发、分子蒸馏和精馏组合提纯工艺。\r\n</p>', '<p>\r\n	1）工艺温度和压力参数的选择；<br />\r\n2）不同分离纯化技术的选择和组合及分离级数的确定。\r\n</p>', '<p class=\"NewStyle16\" style=\"text-indent:28pt;\">\r\n	传统的脂肪酸分离纯化亚油酸的方法有：冷冻压榨分离法、有机溶剂分离法、表面活性剂分离法、尿素包合分离法，但这些提取方式劳动强度大，收率偏低，生产过程中需使用大量有机溶剂，一方面未回收的溶剂会带来环境的污染，另一方面残留的溶剂也会对人体产生不良影响。<br />\r\n本项目确定的大豆亚油酸纯化工艺，在纯化过程中避免使用有机溶剂，保护被分离物质不受污染和侵害，真正做到清洁生产，最终产品质量指标符合药品亚油酸技术指标的要求。据中科院技术查新，尚未见有相同内容的研究报道，技术水平属于国内领先。\r\n</p>\r\n<p class=\"NewStyle16\" style=\"text-indent:28pt;\">\r\n	<br />\r\n</p>', '<p class=\"NewStyle16\" style=\"text-indent:28pt;\">\r\n	根据生产实际情况，我们采用以下方法加以研究：<br />\r\n（1）薄膜蒸发脱水、脱气工艺的研究<br />\r\n脱除物料中的溶剂、水等轻物质，保证后续蒸馏工艺的顺利完成。<br />\r\n（2）蒸馏初步分离饱和与不饱和脂肪酸工艺的研究<br />\r\n分离出轻组分饱和脂肪酸，主要是棕榈酸和硬脂酸。传统的冷冻压榨法、表面活性剂法、尿素包合分离法或溶剂结晶等方法分离混合脂肪酸中的饱和脂肪酸，会带来环境的污染和溶剂对人体的危害。而采用蒸馏工艺是纯物理过程，在纯化过程中避免使用有机溶剂，保护被分离物质不受污染和侵害，真正做到清洁生产。<br />\r\n（3）精馏工艺进一步纯化亚油酸工艺的研究<br />\r\n收集轻组分不饱和脂肪酸作为最终产品，去除重组分色素等高分子杂质，使最终产品满足色泽、碘价等要求<br />\r\n综合以上各单项研究成果，确定了碘价不低于148gI/100g的药品级亚油酸的生产工艺——采用两次薄膜蒸发和一次精馏，可同时实现脱气、脱水、脱溶及精制目标产物的目的。整个工艺为纯物理过程，可以很好地保护被分离物质不受污染和侵害。中试产品质量达到了企业现有成品的指标。\r\n</p>', '<p style=\"text-indent:28pt;\" class=\"NewStyle16\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">上海市粮食科学研究所和上海良友（集团）有限公司下属上海金伴药业有限公司有着良好的合作基础。上海金伴药业有限公司是行业内知名的药品亚油酸生产企业，有着多年产品生产经验，近年来一直致力于在环保许可的条件下改进工艺，提高产品产量的努力。本项目的完成，可为企业改进工艺提供依据，为最终实现更大规模的生产，改善国内</span><span style=\"font-family:宋体;font-size:14pt;\">药品级亚油酸</span><span style=\"font-family:宋体;font-size:14pt;\">供应</span><span style=\"font-family:宋体;font-size:14pt;\">不足的现状</span><span style=\"font-family:宋体;font-size:14pt;\">提供帮助。</span><span style=\"font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<!--EndFragment-->', '', '', '2014年药用级亚油酸销售量350吨，销售额805万。', '<p style=\"text-indent:28pt;\" class=\"NewStyle16\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">高纯度药品级亚油酸具有良好的市场空间，</span><span style=\"font-family:宋体;font-size:14pt;\">项目</span><span style=\"font-family:宋体;font-size:14pt;\">研究开发的药品级亚油酸生产工艺可以</span><span style=\"font-family:宋体;font-size:14pt;\">提高产品质量，为</span><span style=\"font-family:宋体;font-size:14pt;\">改变目前国内市场药品级亚油酸供应不足的现状</span><span style=\"font-family:宋体;font-size:14pt;\">提供帮助</span><span style=\"font-family:宋体;font-size:14pt;\">。</span><span style=\"font-family:宋体;font-size:14pt;\">提纯后的</span><span style=\"font-family:宋体;font-size:14pt;\">药品级亚油酸可以作为原料药应用于国内医药企业，作为生产治疗高血压、高血脂等疾病的药物的原料。</span><span style=\"font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">由于药品级亚油酸的价格是原料混合脂肪酸的</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:14pt;\">3~4</span><span style=\"font-family:宋体;font-size:14pt;\">倍，具有价格优势，相对于最初的原料大豆油皂脚，效益空间更加巨大，真正做到了变废为宝</span><span style=\"font-family:宋体;font-size:14pt;\">。</span>\r\n</p>\r\n<!--EndFragment-->', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/IMG_20151231_0948031.jpg', '2016', null, '7', '2', '12', '41', '1', null, '1', '6', '2', '1', '54,123,121,119,117', '28', '二等奖', '2016-01-08');
INSERT INTO `project` VALUES ('134', '164', '高纯度改性大豆磷脂（羟基化）的制备工艺研究', null, '3', 0x3432, '54,109,58,56', '2013-07-08', '2015-03-08', '3', null, '上海市科学技术委员会应用技术开发专项资金项目2013-209', '1', '10年', '上海良友集团', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/QQ图片201512311046192.jpg', '<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">本项目属于油脂副产品深加工的磷脂精深加工领域。</span><span style=\"font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">本项目是在自主研发的磷脂纯化技术基础上，进行大豆磷脂纯化与改性工艺的集成研究，同时优化了改性磷脂</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:14pt;\">HLB</span><span style=\"font-family:宋体;font-size:14pt;\">值的检测方法，从而确定了大豆磷脂羟基化的小试工艺。</span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">本项目确定的大豆磷脂纯化和羟基化改性同步进行的小试工艺，由于磷脂纯化技术领先于国内水平，因而在此基础上进行的羟基化改性后的总体水平较高，经此工艺研制的改性磷脂，</span><span style=\"font-family:宋体;font-size:14pt;\"><span>，</span></span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:14pt;\">HLB</span><span style=\"font-family:宋体;font-size:14pt;\">值从</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:14pt;\">4.2</span><span style=\"font-family:宋体;font-size:14pt;\">提升至</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:14pt;\">8~10</span><span style=\"font-family:宋体;font-size:14pt;\">，大幅提升了磷脂的亲水性和品质，从而扩大了磷脂的使用范围</span><span style=\"font-family:宋体;font-size:14pt;\">。据中科院查新报告，本项目采用的降粘、离心除杂以及羟基化等相结合的技术具有创新性，项目综合技术达到国内领先水平。</span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<!--EndFragment-->', '<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">大豆是全球最大的油料作物之一，大豆磷脂是大豆油在加工过程中产生的油脚，是一种天然含磷的多种类脂混合物。磷脂的分子上既有亲水基团又有亲油基团，是一种天然表面活性剂。高品质浓缩磷脂产品在糖果、糕点等食品行业以及轻工、医药、纺织、橡胶、化工等行业都有很广的应用范围，浓缩磷脂精制加工纯化技术是行业的研究热点。发达国家在磷脂产品上已形成系列化、专用化，但这一领域的核心制造技术一直是机密。由于工艺原因，国产大豆浓缩磷脂</span><span style=\"font-family:宋体;font-size:14pt;\">历来因杂质多、亲水性差，</span><span style=\"font-family:宋体;font-size:14pt;\">长期以来一直作为饲料应用</span><span style=\"font-family:宋体;font-size:14pt;\">，远远没有体现其价值</span><span style=\"font-family:宋体;font-size:14pt;\">。近年来，我们重点研究了磷脂中细微杂质的去除工艺，于<span>2012</span><span>年</span><span>9</span><span>月获得发明专利（</span><span>ZL201010122531.X</span><span>），</span><span>2014</span><span>年建立了</span><span>100Kg/</span><span>班的磷脂纯化中试生产线。</span></span><span style=\"font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;磷脂虽然是良好的天然表面活性剂，但是由于亲水亲油平衡值（<span>HLB</span><span>值）较低，亲水性差，应用范围受到了较大的限制。将大豆磷脂改性，提高其</span><span>HLB</span><span>值，可扩大应用范围。本项目重点研究将饲料级大豆磷脂提纯到食用级磷脂的过程中加入改性工艺，以提高</span><span>HLB</span><span>值的技术。</span></span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:14pt;\"></span>\r\n</p>\r\n<!--EndFragment-->', '<p style=\"text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">1<span>）</span></span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">改进了大豆改性磷脂<span>HLB</span><span>值的检测方法。</span></span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">2<span>）确定了大豆磷脂羟基化的小试工艺。</span></span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">成果创新性：将磷脂纯化和羟基化反应同步进行，对降低生产成本，提高羟基化磷脂品质有较大帮助。</span>\r\n</p>\r\n<!--EndFragment-->', '<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">1<span>）将饲料级大豆</span></span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">磷脂纯化技术和羟基化技术整合、反应同步进行的工艺。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<!--EndFragment-->', '<span style=\"font-family:宋体;font-size:14pt;\">\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">发达国家在磷脂产品精深加工领域的核心制造技术一直是机密。国内对磷脂的研究主要集中在纯化、分提等领域，在磷脂改性方面</span><span style=\"font-family:宋体;font-size:14pt;\">尚属起步阶段，</span><span style=\"font-family:宋体;font-size:14pt;\">报道多以综述为主，可供借鉴的资料很少。</span><span style=\"font-family:宋体;font-size:14pt;\">上海市粮食科学研究所在磷脂纯化方面的研究处于国内领先水平，在纯化磷脂工艺中加入改性工艺是一种新思路。</span><span style=\"font-family:宋体;font-size:14pt;\">根据中科研上海科技查新咨询公司的查新结论，此项研究采用的降粘、离心除杂以及羟基化等相结合的技术具有创新性。项目综合技术达到国内领先水平。</span><span style=\"font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">本项目为小试研究，在实验室中制造出苯不溶物含量低、色泽浅、透明度较高、亲水性较高的高品质改性磷脂，</span><span style=\"font-family:宋体;font-size:14pt;\">总体水平较高。</span>\r\n</p>\r\n<!--EndFragment--></span><!--EndFragment-->', '<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">本项目是在自主研发的磷脂纯化技术基础上进行，通过对大豆磷脂纯化工艺与改性工艺的整合研究，重点研究以下内容：</span><span style=\"font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:-36pt;margin-left:64pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\"><span>（1）<span>&nbsp;</span></span></span><span style=\"font-family:宋体;font-size:14pt;\">研究并优化了改性磷脂的</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:14pt;\">HLB</span><span style=\"font-family:宋体;font-size:14pt;\">值检测方法</span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">实验中发现乳化法是适用于改性磷脂HLB值检测的方法，并用已知HLB值的表面活性剂进行了验证，为项目研究奠定基础。</span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">（2）改性磷脂工艺研究</span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"margin-left:26.25pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">通过正交试验研究了溶剂浓度、</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:14pt;\">催化剂</span><span style=\"font-family:宋体;font-size:14pt;\">添加量</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:14pt;\">、改性剂添加量、反应温度、</span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:&quot;Times New Roman&quot;;font-size:14pt;\">反应时间</span><span style=\"font-family:宋体;font-size:14pt;\">这五个</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:14pt;\">因素</span><span style=\"font-family:宋体;font-size:14pt;\">对改性反应的影响，发现溶剂浓度对改性反应有显著影响，其余的</span><span style=\"font-family:宋体;font-size:14pt;\">为非显著因素</span><span style=\"font-family:宋体;font-size:14pt;\">。同时确定了</span><span style=\"font-family:宋体;font-size:14pt;\">溶液浓</span><span style=\"font-family:宋体;font-size:14pt;\"><span>反应</span><span>3</span><span>小时是磷脂羟基化的最佳制备工艺条件。</span></span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">（3）不同改性工艺的比较</span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">通过对不同改性工艺的比较研究，发现</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">后脱溶工艺对产品碘值有明显影响，</span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">中和加碱量对改性磷脂质量指标的影响。</span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">（4）改性磷脂杂质含量测定方法比较</span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">研究了改性磷脂杂质含量测定方法，发现</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">乙醚不溶物含量的测定不能代替苯不溶物。</span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\"></span>&nbsp;\r\n</p>\r\n<!--EndFragment-->', '<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">上海金伴药业有限公司是国内拥有磷脂产品最丰富的专业磷脂生产企业，是国内最早生产药用磷脂产品的企业之一，有着几十年磷脂系列产品的生产经验，公司生产的产品有粉末磷脂、口服用磷脂、注射用磷脂以及大豆磷脂散成药等多种药用磷脂产品。</span><span style=\"font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">本项目研究的小试样品送该企业进行了应用试验，经对方检测和应用，改性磷脂样品达到了药用磷脂原料的质量指标，符合该企业产品质量控制要求，将对该企业扩大磷脂产品种类，拓展产品用途起到积极作用，也有利于进一步推动项目技术成果的后续开发和产业化。</span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<!--EndFragment-->', null, null, null, '<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">在国内，作为食用大豆油加工副产品的大豆磷脂，历来因杂质多、亲水性差而大多被用于饲料行业，远远没有体现其真实的经济价值。本项目技术不仅大幅降低了大豆磷脂的杂质含量，而且较好地改变了它的HLB值，提高了磷脂的亲水性，扩大了磷脂的使用范围，同时，通过采用同步反应技术，可以有效降低改性磷脂的生产成本，为推进改性磷脂的深入研究和产业化应用奠定了较好技术基础。</span><span style=\"font-family:仿宋_GB2312;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<!--EndFragment-->', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/QQ图片201512311046192.jpg', '2016', null, '2', null, '11', null, '3', null, '2', '2', '0', null, null, '28', null, '2016-01-08');
INSERT INTO `project` VALUES ('135', '175', '茶叶籽油—低温低水份压榨纯物理精炼技术', null, '3', 0x3432, '54,109,58,56,126,125,124,123,122', '2004-10-08', '2009-06-08', '7', null, null, '0', null, '贵州省粮食行业协会', 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/2015年度中国粮油学会科学技术奖申报书.pdf', '<p>\r\n	（项目所属学科领域、主要内容、特点及应用推广情况）\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	本项目属农副食品加工业领域食用植物油加工，本项目运用《低温低水份压榨纯物理精炼技术》从茶叶籽中制取茶叶籽油。茶叶籽油是一种高端木本植物油，2009年卫生部18号公告正式批准为新资源食品。茶叶籽油是一种营养丰富的食用油，极具健康调理作用，其主要成分为油酸、亚油酸、亚麻酸、棕榈酸等，茶叶籽油不仅抗衰老、抗辐射、美容护肤，更是对抗动脉硬化、预防三高等心脑血管疾病的天然臻品。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	本项目主要研究内容：\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	1、低温低水份压榨茶叶籽工艺技术研究；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	2、茶叶籽油纯物理精炼技术研究；\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	3、茶叶籽油质量研究。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	本项目由于采用低温低水份压榨纯物理精炼技术生产茶叶籽油，在生产过程中没有添加任何外来物质，因此产品具有纯天然性。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	应用推广情况：已使用该技术的厂家有贵州南方嘉木食品有限公司、贵州泰谷农业科技有限公司、贵州湄潭县天利达食品有限公司。\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '435', '545545', '545', '545', '545', '545', '5', '5', '55', '55', 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/2015年度中国粮油学会科学技术奖申报书.pdf', '2016', '通过', '2', null, '12', null, '78', null, null, '1', '0', null, null, '28', null, '2016-01-19');
INSERT INTO `project` VALUES ('136', '175', '高效节能型锤片粉碎机', null, '3', 0x3434, '126,123,122,121', '2012-01-10', '2013-01-07', '7', null, '6、2014年度公益性行业科研专项《基于物联网的储备粮动态监管技术集成与示范》。', '0', null, '高效节能型锤片粉碎机', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/7914B7BDFFDD5ABA68D1084C3D8981B61.jpg', '高效节能型锤片粉碎机广泛应用于各种颗粒状物料的粉碎，如：玉米、高粱、麦类、豆类，破碎后的<br />\r\n饼类等；并为纤维质原料、高水分、油性大的原料及细粉碎料进行了特别设计，尤其适合粉碎鱼干、棉粕、<br />\r\n虾壳、豆皮、中草药材，能满负荷工作，不堵筛。 <br />\r\n&nbsp; 高效节能型锤片粉碎机主要性能指标如下：&nbsp; <br />\r\n&nbsp; SFSP60 型锤片粉碎机主机功率范围：30kW～200kW, <br />\r\nSFSP72 型锤片粉碎机主机功率范围：37kW～220kW， <br />\r\nSFSP112 型锤片粉碎机主机功率范围：55kW～355kW， <br />\r\nSFSP138 型锤片粉碎机主机功率范围：90kW～400Kw。 <br />\r\n&nbsp; 高效节能型锤片粉碎机的主要特点：&nbsp; <br />\r\n&nbsp; 1、改善现有粉碎室，提高粉碎效率。 <br />\r\n&nbsp; 2、使物料得到更多的撞击几率，降低粉碎能耗。 <br />\r\n&nbsp; 3、粉碎室内和物料接触部分均采用耐磨可换部件及双重耐磨板。 <br />\r\n&nbsp; 4、改进进料空间，改变粉碎室风场，改变物料运行轨迹，破坏物料环流层，提高粉碎效率。 <br />\r\n&nbsp; 5、八组锤片设计，增加锤片与物料碰撞几率。&nbsp; <br />\r\n&nbsp; 4、改进机座，提高底座水平度与刚度，增加工作稳定性。&nbsp; <br />\r\n&nbsp; 6、改善转子总成，实现粗、细、微粉碎三种功能，提高转子运转平稳性，防止轴承发热，降低转子重心。 <br />\r\n&nbsp; 高效节能型锤片粉碎机具有完全自主知识产权，产品已在相关饲料企业持续得到应用，为客户不断创造<br />\r\n效益。 <br />', '饲料工业是一项跨部门、跨行业、跨学科的综合性工业，是农业经济的重要组成部分。发展畜牧、水<br />\r\n产养殖业，改变人类膳食结构、完成植物蛋白向动物蛋白安全转化的农业良性循环基础系统工程。从 2011<br />\r\n年起，我国已成为世界第一饲料生产大国。至 2015 年，饲料工业产量达到约 2 亿吨，饲料产量占全国总产<br />\r\n量的比例要达到 50%以上。粉碎是饲料加工过程中重要工序之一。粉碎作业不仅涉及动物对日粮营养价值、<br />\r\n动物生产性能、动物保健和环境卫生的影响，而且对后续混合、制粒、挤压膨化等工序的生产性能、效率<br />\r\n和理化质量等都会产生影响；同时，饲料粉碎粒度对饲料成本的影响也较为明显。粉碎系统的动力消耗占<br />\r\n全厂总动力消耗的 30%～50%（部分特种水产饲料生产线粉碎工序的动力消耗最高超过 60%）。提高粉碎系<br />\r\n统效率，降低粉碎系统的动力消耗，成为粉碎系统设计的重要因素。 <br />\r\n&nbsp;&nbsp; 高效节能型锤片粉碎机（SFSP 型锤片粉碎机）其工作原理：原料以稳定、均匀的流量全宽度喂入粉碎<br />\r\n室，在粉碎室内，经锤片的高速撞击、剪切，撞碎后的小颗粒原料高速与筛板、隔板撞击，从而使小颗粒<br />\r\n原料得到进一步粉碎；隔板有效破坏粉碎室内的环流层，与此同时，原料与锤片、筛板、隔板及原料之间<br />\r\n也发生相互摩擦、碰撞，从而得到更细的颗粒，在风力的作用下，细颗粒被吸出筛板，成品通过绞龙或气<br />\r\n力输送到下一道设备中。 <br />\r\n&nbsp;&nbsp; 现有锤片粉碎机粉碎玉米等物料时，依据国内先进水平考核，如行业标准JB/T9822 规定吨料电耗≤7kW<br />\r\n•h/t（筛孔直径 3 mm，原料玉米）。工业化饲料生产过程中，原料均需要粉碎。按饲料工业产量 2亿吨计算，<br />\r\n7kW•h/t ×2 亿吨=14 亿 kW•h，饲料原料粉碎需要消耗大量能源，整个饲料工业急需高效节能型锤片粉碎<br />\r\n机。 <br />', '<p>\r\n	<span> <br />\r\n</span>\r\n</p>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">一、无水脱皂</span>\r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span>\r\n</p>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">不经水洗的油通过加入助滤剂吸附后，再经废白土滤饼层过滤及预脱色的方法除去油中残余皂质及残余磷脂等杂质，达到无水洗脱残皂，实现了精炼车间无残皂废水排放。</span>\r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span>\r\n</p>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">二、预复脱色</span>\r\n</p>\r\n<p>\r\n	<span> </span><span style=\"font-family:宋体;font-size:14pt;\">利用废白土的剩余脱色能力及废白土滤饼层的过滤作用，充分挖掘白土的吸附能力，减少白土用量</span>\r\n</p>', '<span style=\"color:black;font-family:&quot;Times New Roman&quot;,serif;font-size:14pt;\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\"font-family:宋体;font-size:14pt;\">该项目技术属中粮油脂部所有，未经油脂部领导批准请不对外泄漏</span>', '<p>\r\n	<span> <br />\r\n</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">一、行业内调研情况：</span>\r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">目前行业内的油脂精炼，大多数还是用传统水洗工艺脱皂，只有个别工厂在<span>2008</span>年前后尝试使用无水脱皂工艺，但也未与预复脱色工艺配套。</span>\r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">二、专业设计院调研情况：</span>\r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">目前，集团所辖的无锡院、西安院、武汉院，上述三家设计院，目前都未搞过“无水脱皂”精炼工艺，主要设计还是传统的“水洗工艺”。</span>\r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">三、设备商的调研情况：</span>\r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">与北京东方莱茵机械技术有限公司、中国农业机械化科学研究院油脂所、国际上著名的粮油工程公司如力必浩工程公司、迪斯美工程公司、优德工程设备技术有限公司、阿法拉伐公司进行沟通，<span>2009</span>年前在国内未做过“无水脱皂工艺”的相关工程。</span>\r\n</p>\r\n<p>\r\n	<span> </span><span style=\"font-family:宋体;font-size:14pt;\">因此，该工艺居于国内外领先水平！</span>\r\n</p>', '<p>\r\n	<span> <br />\r\n</span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">随着社会的进步，环保节能要求的提高，常规精炼工艺已跟不上最新的节能降耗要求。国家要求到<span>2010</span>年总污染物总的排放量下降<span>10%</span>，同时国资委给我们中粮集团的要求是：污染物的总排放量每年要递减<span>10</span>％。无水脱皂及预复脱色工艺项目就是在此背景下诞生的。该工艺既适合在油脂精炼常规工艺基础上进行改造，更适合在新的油脂精炼项目中进行应用。当时，集团油脂部有<span>10</span>余条食用油精炼常规工艺生产线，<span>4</span>条即将开工的精炼生产线。在老生产线如何进行节能降耗改造及新上马项目如何进行节能降耗工艺选择时，油脂部组织所属企业的专家组经过充分论证，提出实施无水脱皂及预复脱色工艺改造项目，并在最具备条件的中粮新沙公司<span>400</span>吨精炼厂进行试点。</span>\r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp;&nbsp; </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">新沙公司精炼车间的以前的精炼工艺为：毛油<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>加热至<span>80</span>℃<span><span>&nbsp;&nbsp;&nbsp; </span></span>加磷酸脱胶<span><span>&nbsp;&nbsp;&nbsp; </span></span>加烧碱脱酸<span><span>&nbsp;&nbsp;&nbsp; </span></span>离心脱皂<span><span>&nbsp;&nbsp;&nbsp; </span></span>加<span>90</span>℃软水水洗脱残皂<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>离心脱水<span><span>&nbsp;&nbsp;&nbsp; </span></span>真空干燥<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>中和油<span><span>&nbsp;&nbsp;&nbsp; </span></span>加热至<span>110</span>℃<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>析气<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>加脱色剂（白土）<span><span>&nbsp;&nbsp;&nbsp; </span></span>脱色塔反应约<span>40min<span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>过滤（油土分离）<span><span>&nbsp;&nbsp;&nbsp; </span></span>析气<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>加热至约<span>250</span>℃高温高真空脱臭脱酸约<span>90min<span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>冷却至<span>60</span>℃以下<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>过滤<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>成品油。</span>\r\n</p>\r\n<p>\r\n	<span> </span><span style=\"font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp;&nbsp; </span></span><span style=\"font-family:宋体;font-size:14pt;\">该工艺在常规工艺上作如下改良：离心脱皂后的油，不用加<span>90</span>℃软水，直接进行干燥（保留少部分水以使残皂在油中呈悬浮液态），升温后加入<span>0.05%</span>助滤剂，再利用经脱色反应后的废白土的剩余脱色力进行预脱色，除去油中残皂及部分色素，然后加入新鲜白土进行复脱色。这样变废为宝，使白土的脱色力达到最大限度的利用，故可以大大降低白土的用量。为此需对工艺流程作如下改动：增加<span>2</span>台<span>80</span>㎡过滤器用于预复脱色过滤时进行周转，增加一个<span>2<span style=\"color:black;\">m<sup>3</sup></span></span>干燥罐用于添加助滤剂后除去油中多余水分，增加一个<span>1<span style=\"color:black;\">m<sup>3</sup></span></span>助滤剂调和罐（带搅拌）<span>,</span>增加<span>3</span>台流量<span>30</span></span><span style=\"color:black;font-family:宋体;font-size:12pt;\"> </span><span style=\"color:black;font-family:宋体;font-size:14pt;\">m<sup>3</sup></span><span style=\"font-family:宋体;font-size:14pt;\">/h</span><span style=\"font-family:宋体;font-size:14pt;\">、扬程<span>60m</span>的油输送泵，增加管道阀门一批，增加用于承放阿玛过滤机的钢结构承台，增加一组袋式安全过滤器，电脑程序修改等。</span>\r\n</p>', '<span> </span>\r\n<p style=\"text-indent:21pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">该项目投产以来<span>,</span>在以下几方面体现出了其比常规工艺更好的优势：</span>\r\n</p>\r\n<span> </span>\r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp; </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">一、减少废水的排放量：实现无水脱皂工艺，新沙<span>400</span>吨的精炼车间每年可减少废水排放<span>10000</span>吨，减少<span>1</span>吨<span>COD</span>。污水处理车间的聚合硫酸铁、石灰粉、聚丙烯酰胺等的用量至少减少一半，年减少污水处理费用约<span>15000</span>元。</span>\r\n</p>\r\n<span> </span>\r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp; </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">二、减少白土用量：减少白土用量<span>28%</span>。年节约白土<span>400</span>吨。</span>\r\n</p>\r\n<span> </span>\r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp; </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">三、提高品质：无水脱皂工艺生产出来的成品油总体质量水平明显高于常规工艺的质量。其酸价、颜色、风味、氧化稳定性（<span>AOM</span>）、烟点都比常规工艺的要好。特别是成品油含磷从<span>2.5</span></span><span style=\"color:#333333;line-height:150%;font-family:&quot;Arial&quot;,sans-serif;font-size:14pt;\">mg/kg</span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">降到<span>1.2</span></span><span style=\"color:#333333;line-height:150%;font-family:&quot;Arial&quot;,sans-serif;font-size:14pt;\">mg/kg</span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">，为满足特殊客户的需求，可生产出色泽更浅的产品。</span>\r\n</p>\r\n<span> </span>\r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp; </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">四、降低生产成本：按年加工<span>12</span>万吨油计算，每年可节约成本<span>123.3</span>万元，即每吨加工成本可减少<span>10.27</span>元。</span>\r\n</p>\r\n<span> </span>\r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp; </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">五、装机容量减少<span>4KW</span>。</span>\r\n</p>\r\n<span> </span>\r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp; </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">六、改善了车间的环境：少用一台离心机，车间噪音明显变小。</span>\r\n</p>\r\n<span> </span><span style=\"font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp; </span></span><span style=\"font-family:宋体;font-size:14pt;\">该项目领先国内先进水平，已在油脂部新建工厂及生产线中迅速得到全面推广，如天津佳悦、广西钦州、中粮东海精炼一厂、三厂、中粮黄海<span>1000</span>吨精炼厂、</span><span style=\"font-family:宋体;font-size:14pt;\">中粮九江等都采用了该工</span><span style=\"font-family:宋体;font-size:14pt;\">艺，取得了满意效果。</span>', '138.5', '1.2', '常规工艺和无水脱皂工艺按年加工12万吨效益对比分析：\r\n序号	比较项目	常规\r\n工艺(元)	无水脱皂\r\n工艺(元)	比常规工艺\r\n增减量	备注\r\n1	白土	1728000	1238900	减少28.3%	白土按我司均价：1200元/吨计\r\n2	助滤剂	0	75240	增加0.19%用量	助滤剂按3300元/吨计\r\n3	柠檬酸	57600	144000	增加150%	柠檬酸按6000元/吨计\r\n4	工艺软水	28800	0	节约软水9600吨	软水按3.0元/吨计，8%添加量\r\n5	废水处理	24000	0	少处理污水9600吨	污水处理费按2.5元/吨计算\r\n6	煤	87400	0	节约煤115吨	只计使9600吨的水从25度升到90度耗煤量\r\n7	油损耗	1542800	892100	减少损耗0.12%	只计废白土和洗皂水带走的油。\r\n8	电	/	/	减少4kw容量	只差4KW，暂时忽略不考虑\r\n9	脂肪酸	1920000	2035200	增加0.06%	脂肪酸按8000元/吨计\r\n10	合计	1548600	315040	可节约\r\n1,233，560元	合计等于1至8项之和减第9项\r\n\r\n\r\n1、产量按400T/D，年产量按400*300=120000吨计算。\r\n2、白土按1200元/吨计，煤按760元/吨计，油按5000元/吨计，助滤剂按3300元/吨计，柠檬酸按6000元/吨计，软水按3.0元/吨计，污水处理费按2.5元/吨计，脂肪酸按8000元/吨计。\r\n3、每年节约123.3万元，每吨加工成本减少10.27元。\r\n', '<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">无水脱皂工艺用于油脂精炼中<span>,</span>不但有一定的经济效益<span>,</span>而且会产生很好的社会效益：节约了水资源，减少了污水的排放量，同时减少了<span>COD</span>的排放量，在新建<span style=\"color:black;\">项目中可以降低污水处理工程的投资。</span></span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"color:black;line-height:150%;font-family:宋体;font-size:14pt;\">我司<span>400</span>吨精炼厂按年精炼<span>12</span>万吨毛油估算，可少用软水<span>6000</span>吨，减少污水处理量<span>6000</span>吨，同时减少约<span>1</span>吨的<span>COD</span>的排放量，对保护当地的水资源起着积极作用。</span>\r\n</p>\r\n<span> </span><span style=\"color:black;font-family:宋体;font-size:14pt;\">中粮</span><span style=\"color:black;font-family:宋体;font-size:14pt;\">集团油脂部所属企业天津佳悦、广西钦州、中粮东海精炼一厂、三厂、中粮黄海<span>1000</span>吨精炼厂、中粮九江等工厂都应用了此工艺，其经济技术指标都等于或优于试点工厂，以上</span><span style=\"font-family:宋体;font-size:14pt;\">工厂按此工艺年精炼豆油量共<span>120</span>万多吨，按每吨加工成本减少<span>10.27</span>元的保守值计算，年至少可节约资金<span>1230</span>万元，可少用软水<span>96000</span>吨，减少污水处理量<span>96000</span>吨。</span>', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/7914B7BDFFDD5ABA68D1084C3D8981B6.jpg', '2016', null, '7', '3', '1', '41', '2', null, '2', '6', '3', '1', '54,123,121,120,119,117', '35', '二等奖', '2016-01-09');
INSERT INTO `project` VALUES ('137', '175', '20160111', null, '1', 0x3432, '54,109,58,56,126,125,124,123,122', '2015-12-29', '2016-01-21', '2,3', null, '1、“十一五”国家科技支撑计划重点项目《粮食宏观调控信息保障关键技术研究与示范》（编号：2008BADA8B00）；\r\n2、首批国家信息化试点项目《基于RFID的区域粮食流通管理》发改办高技［2009］1816号；\r\n3、国家物联网重大应用示范工程《国家粮食储运监管物联网应用示范工程》国粮展［2012］170号；\r\n4、2012年物联网技术研发及产业化专项《多种粮食智能感知设备研发及产业化》发改办高技［2012］2766号；\r\n5、2013年度公益性行业科研专项《粮食库存质量在线监控物联网技术与设备研究》国粮财［2013］260号；\r\n6、2014年度公益性行业科研专项《基于物联网的储备粮动态监管技术集成与示范》。\r\n', '0', null, '54455', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/2015年度中国粮油学会科学技术奖申报书.pdf', '1、项目所属科学技术领域\r\n	属于轻工专业-粮油食品加工技术领域\r\n	2、主要内容及特点\r\n	食用油精加工的常规工艺流程：毛油经加热，加酸加碱反应后进行油皂离心分离，油中残皂再通过加水水洗后进行离心分离，经干燥得到中和油。中和油加入白土进行脱色反应后，过滤进行油土分离，进入析气除氧罐，最后进入脱臭系统，通过高温高真空蒸馏后成为成品食用油。常规工艺最大的缺点就是有大量废水产生，并且其生产辅料——白土的脱色能力没有得到充分利用。\r\n	食用油精加工的无水脱皂及预/复脱色工艺流程：毛油经加热，加酸加碱反应后进行油皂离心分离，干燥后得中和油，加入助滤剂，真空干燥，进入已形成滤饼层准备切换的过滤机进行预脱色，滤去残皂、残余磷脂等杂质，加入白土进行脱色反应后，过滤进行油土分离，进入析气除氧罐，最后进入脱臭系统，通过高温高真空蒸馏后成为成品食用油。\r\n	无水脱皂的原理是：脱皂离心机出来的油，其所含一定量的残余皂粒及磷脂等杂质，不进行水洗工艺，而是直接通过加入助滤剂吸附后，利用废白土滤饼层的剩余脱色能力滤去残皂及磷脂，达到无水洗脱残皂，实现精炼车间废水的零排放。脱色时使用过一次的白土（废白土）还有吸附力，当接触颜色更深的油时，仍可以吸附一定量的色素，重新达到吸附平衡。预复脱色工艺就是充分利用废白土的剩余吸附色素能力达到降低白土用量的目的。\r\n	无水脱皂工艺的特点：①减少精炼废水的排放量，实现无水洗脱皂； ②可减少白土用量28%； ③提高成品油品质 ④降低生产成本\r\n	3、应用推广情况\r\n	目前行业内的油脂精炼，大多数还是用传统水洗工艺脱皂，只有个别工厂在2008年前后尝试使用无水脱皂工艺，但也未与预复脱色工艺配套。2008年，中粮集团在其油脂部所属工厂——中粮新沙粮油工业（东莞）有 \r\n	1、项目所属科学技术领域\r\n	属于轻工专业-粮油食品加工技术领域\r\n	2、主要内容及特点\r\n	食用油精', '<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">节能减排是我国目前工作重点之一，中粮集团油脂部所辖十余家油脂制取、精炼的加工厂，在生产加工过程中，都会产生废气、废水、废渣，能耗问题也较突出，因此节能减排也是油脂部各工厂的重点工作之一。各级领导对此项工作相当重视，多次下达有关文件，号召所属企业在节能减排上找路子、想点子。无水脱皂及预复脱色工艺项目就是在此背景下诞生的。</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">食用油加工企业最难处理的废水为精炼车间的水洗废水，该废水含有残皂、残余磷脂、少量油脂等，其<span>COD</span>在<span>5000</span>至<span>50000</span>左右，必须经隔油、除皂、除磷、<span>PH</span>值调节、厌氧、好氧等处理后才能达标排放。</span>\r\n</p>\r\n<span> </span><span style=\"font-family:宋体;font-size:14pt;\">为了实现水洗废水的少排直至零排放，我们着手研究国内外最新精炼工艺，最后确定用无水脱皂工艺与预复脱色工艺相结合的方法进行改造实验。初步制订了脱皂离心机出来的油不水洗，加入助滤剂吸附后，利用脱色废白土的剩余脱皂及脱色能力进行二次脱色的工艺。该工艺的实施可使中和油不用水洗，实现精炼车间无废水排放，还可减少脱色剂用量约<span>30%</span>，提高油脂精炼率约<span>0.07%</span>。集团油脂部领导对此工艺改造着重安排，于<span>2008</span>年<span>5</span>月迅速成立了“中粮油脂部无水脱皂项目领导小组”，<span>2008</span>年<span>8</span>月份完成了项目的前期可行性论证。<span>8</span>月中旬，经“中粮油脂部无水脱皂项目领导小组”研究并报中粮油脂部领导批准，中粮新沙公司成为了该项目的试点单位。决定先在中粮新沙公司<span>400</span>吨精炼厂进行该项目的改造试点，成功后，再在中粮油脂部各厂全面推广。</span>', '<span> </span>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">一、无水脱皂</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">不经水洗的油通过加入助滤剂吸附后，再经废白土滤饼层过滤及预脱色的方法除去油中残余皂质及残余磷脂等杂质，达到无水洗脱残皂，实现了精炼车间无残皂废水排放。</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">二、预复脱色</span>\r\n</p>\r\n<span> </span><span style=\"font-family:宋体;font-size:14pt;\">利用废白土的剩余脱色能力及废白土滤饼层的过滤作用，充分挖掘白土的吸附能力，减少白土用量</span>', '<span style=\"color:black;font-family:&quot;Times New Roman&quot;,serif;font-size:14pt;\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\"font-family:宋体;font-size:14pt;\">该项目技术属中粮油脂部所有，未经油脂部领导批准请不对外泄漏</span>', '<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">一、行业内调研情况：</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">目前行业内的油脂精炼，大多数还是用传统水洗工艺脱皂，只有个别工厂在<span>2008</span>年前后尝试使用无水脱皂工艺，但也未与预复脱色工艺配套。</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">二、专业设计院调研情况：</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">目前，集团所辖的无锡院、西安院、武汉院，上述三家设计院，目前都未搞过“无水脱皂”精炼工艺，主要设计还是传统的“水洗工艺”。</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">三、设备商的调研情况：</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">与北京东方莱茵机械技术有限公司、中国农业机械化科学研究院油脂所、国际上著名的粮油工程公司如力必浩工程公司、迪斯美工程公司、优德工程设备技术有限公司、阿法拉伐公司进行沟通，<span>2009</span>年前在国内未做过“无水脱皂工艺”的相关工程。</span>\r\n</p>\r\n<span> </span><span style=\"font-family:宋体;font-size:14pt;\">因此，该工艺居于国内外领先水平！</span>', '<span> </span>\r\n<p style=\"text-indent:28.5pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">随着社会的进步，环保节能要求的提高，常规精炼工艺已跟不上最新的节能降耗要求。国家要求到<span>2010</span>年总污染物总的排放量下降<span>10%</span>，同时国资委给我们中粮集团的要求是：污染物的总排放量每年要递减<span>10</span>％。无水脱皂及预复脱色工艺项目就是在此背景下诞生的。该工艺既适合在油脂精炼常规工艺基础上进行改造，更适合在新的油脂精炼项目中进行应用。当时，集团油脂部有<span>10</span>余条食用油精炼常规工艺生产线，<span>4</span>条即将开工的精炼生产线。在老生产线如何进行节能降耗改造及新上马项目如何进行节能降耗工艺选择时，油脂部组织所属企业的专家组经过充分论证，提出实施无水脱皂及预复脱色工艺改造项目，并在最具备条件的中粮新沙公司<span>400</span>吨精炼厂进行试点。</span>\r\n</p>\r\n<span> </span>\r\n<p>\r\n	<span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span><span> </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp;&nbsp; </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">新沙公司精炼车间的以前的精炼工艺为：毛油<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>加热至<span>80</span>℃<span><span>&nbsp;&nbsp;&nbsp; </span></span>加磷酸脱胶<span><span>&nbsp;&nbsp;&nbsp; </span></span>加烧碱脱酸<span><span>&nbsp;&nbsp;&nbsp; </span></span>离心脱皂<span><span>&nbsp;&nbsp;&nbsp; </span></span>加<span>90</span>℃软水水洗脱残皂<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>离心脱水<span><span>&nbsp;&nbsp;&nbsp; </span></span>真空干燥<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>中和油<span><span>&nbsp;&nbsp;&nbsp; </span></span>加热至<span>110</span>℃<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>析气<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>加脱色剂（白土）<span><span>&nbsp;&nbsp;&nbsp; </span></span>脱色塔反应约<span>40min<span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>过滤（油土分离）<span><span>&nbsp;&nbsp;&nbsp; </span></span>析气<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>加热至约<span>250</span>℃高温高真空脱臭脱酸约<span>90min<span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>冷却至<span>60</span>℃以下<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>过滤<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>成品油。</span>\r\n</p>\r\n<span> </span><span style=\"font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp;&nbsp; </span></span><span style=\"font-family:宋体;font-size:14pt;\">该工艺在常规工艺上作如下改良：离心脱皂后的油，不用加<span>90</span>℃软水，直接进行干燥（保留少部分水以使残皂在油中呈悬浮液态），升温后加入<span>0.05%</span>助滤剂，再利用经脱色反应后的废白土的剩余脱色力进行预脱色，除去油中残皂及部分色素，然后加入新鲜白土进行复脱色。这样变废为宝，使白土的脱色力达到最大限度的利用，故可以大大降低白土的用量。为此需对工艺流程作如下改动：增加<span>2</span>台<span>80</span>㎡过滤器用于预复脱色过滤时进行周转，增加一个<span>2<span style=\"color:black;\">m<sup>3</sup></span></span>干燥罐用于添加助滤剂后除去油中多余水分，增加一个<span>1<span style=\"color:black;\">m<sup>3</sup></span></span>助滤剂调和罐（带搅拌）<span>,</span>增加<span>3</span>台流量<span>30</span></span><span style=\"color:black;font-family:宋体;font-size:12pt;\"> </span><span style=\"color:black;font-family:宋体;font-size:14pt;\">m<sup>3</sup></span><span style=\"font-family:宋体;font-size:14pt;\">/h</span><span style=\"font-family:宋体;font-size:14pt;\">、扬程<span>60m</span>的油输送泵，增加管道阀门一批，增加用于承放阿玛过滤机的钢结构承台，增加一组袋式安全过滤器，电脑程序修改等。</span>', '<table bordercolor=\"#000000\" style=\"width:100%;\" border=\"1\" cellspacing=\"0\" cellpadding=\"2\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				1<br />\r\n			</td>\r\n			<td>\r\n				1<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				1<br />\r\n			</td>\r\n			<td>\r\n				1<br />\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				1<br />\r\n			</td>\r\n			<td>\r\n				1<br />\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<span> </span>\r\n<p style=\"text-indent:21pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">该项目投产以来<span>,</span>在以下几方面体现出了其比常规工艺更好的优势：</span>\r\n</p>\r\n<span> </span>\r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp; </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">一、减少废水的排放量：实现无水脱皂工艺，新沙<span>400</span>吨的精炼车间每年可减少废水排放<span>10000</span>吨，减少<span>1</span>吨<span>COD</span>。污水处理车间的聚合硫酸铁、石灰粉、聚丙烯酰胺等的用量至少减少一半，年减少污水处理费用约<span>15000</span>元。</span>\r\n</p>\r\n<span> </span>\r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp; </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">二、减少白土用量：减少白土用量<span>28%</span>。年节约白土<span>400</span>吨。</span>\r\n</p>\r\n<span> </span>\r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp; </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">三、提高品质：无水脱皂工艺生产出来的成品油总体质量水平明显高于常规工艺的质量。其酸价、颜色、风味、氧化稳定性（<span>AOM</span>）、烟点都比常规工艺的要好。特别是成品油含磷从<span>2.5</span></span><span style=\"color:#333333;line-height:150%;font-family:&quot;Arial&quot;,sans-serif;font-size:14pt;\">mg/kg</span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">降到<span>1.2</span></span><span style=\"color:#333333;line-height:150%;font-family:&quot;Arial&quot;,sans-serif;font-size:14pt;\">mg/kg</span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">，为满足特殊客户的需求，可生产出色泽更浅的产品。</span>\r\n</p>\r\n<span> </span>\r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp; </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">四、降低生产成本：按年加工<span>12</span>万吨油计算，每年可节约成本<span>123.3</span>万元，即每吨加工成本可减少<span>10.27</span>元。</span>\r\n</p>\r\n<span> </span>\r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp; </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">五、装机容量减少<span>4KW</span>。</span>\r\n</p>\r\n<span> </span>\r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp; </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">六、改善了车间的环境：少用一台离心机，车间噪音明显变小。</span>\r\n</p>\r\n<span> </span><span style=\"font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp; </span></span><span style=\"font-family:宋体;font-size:14pt;\">该项目领先国内先进水平，已在油脂部新建工厂及生产线中迅速得到全面推广，如天津佳悦、广西钦州、中粮东海精炼一厂、三厂、中粮黄海<span>1000</span>吨精炼厂、</span><span style=\"font-family:宋体;font-size:14pt;\">中粮九江等都采用了该工</span><span style=\"font-family:宋体;font-size:14pt;\">艺，取得了满意效果。</span><br />', '138.5', '1.2', '序号	比较项目	常规\r\n工艺(元)	无水脱皂\r\n工艺(元)	比常规工艺\r\n增减量	备注\r\n1	白土	1728000	1238900	减少28.3%	白土按我司均价：1200元/吨计\r\n2	助滤剂	0	75240	增加0.19%用量	助滤剂按3300元/吨计\r\n3	柠檬酸	57600	144000	增加150%	柠檬酸按6000元/吨计\r\n4	工艺软水	28800	0	节约软水9600吨	软水按3.0元/吨计，8%添加量\r\n5	废水处理	24000	0	少处理污水9600吨	污水处理费按2.5元/吨计算\r\n6	煤	87400	0	节约煤115吨	只计使9600吨的水从25度升到90度耗煤量\r\n7	油损耗	1542800	892100	减少损耗0.12%	只计废白土和洗皂水带走的油。\r\n8	电	/	/	减少4kw容量	只差4KW，暂时忽略不考虑\r\n9	脂肪酸	1920000	2035200	增加0.06%	脂肪酸按8000元/吨计\r\n10	合计	1548600	315040	可节约\r\n1,233，560元	合计等于1至8项之和减第9项\r\n\r\n\r\n1、产量按400T/D，年产量按400*300=120000吨计算。\r\n2、白土按1200元/吨计，煤按760元/吨计，油按5000元/吨计，助滤剂按3300元/吨计，柠檬酸按6000元/吨计，软水按3.0元/吨计，污水处理费按2.5元/吨计，脂肪酸按8000元/吨计。\r\n3、每年节约123.3万元，每吨加工成本减少10.27元。\r\n1、产量按400T/D，年产量按400*300=120000吨计算。\r\n2、白土按1200元/吨计，煤按760元/吨计，油按5000元/吨计，助滤剂按3300元/吨计，柠檬酸按6000元/吨计，软水按3.0元/吨计，污水处理费按2.5元/吨计，脂肪酸按8000元/吨计。\r\n3、每年节约123.3万元，每吨加工成本减少10.27元。\r\n\r\n1、产量按400T/D，年产量按400*300=120000吨计算。\r\n2、白土按1200元/吨计，煤按760元/吨计，油按5000元/吨计，助滤剂按3300元/吨计，柠檬酸按6000元/吨计，软水按3.0元/吨计，污水处理费按2.5元/吨计，脂肪酸按8000元/吨计。\r\n3、每年节约123.3万元，每吨加工成本减少10.27元。\r\n\r\n1、产量按400T/D，年产量按400*300=120000吨计算。\r\n2、白土按1200元/吨计，煤按760元/吨计，油按5000元/吨计，助滤剂按3300元/吨计，柠檬酸按6000元/吨计，软水按3.0元/吨计，污水处理费按2.5元/吨计，脂肪酸按8000元/吨计。\r\n3、每年节约123.3万元，每吨加工成本减少10.27元。\r\n\r\n\r\n', '<p>\r\n	<span> <br />\r\n</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">无水脱皂工艺用于油脂精炼中<span>,</span>不但有一定的经济效益<span>,</span>而且会产生很好的社会效益：节约了水资源，减少了污水的排放量，同时减少了<span>COD</span>的排放量，在新建<span style=\"color:black;\">项目中可以降低污水处理工程的投资。</span></span>\r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"color:black;line-height:150%;font-family:宋体;font-size:14pt;\">我司<span>400</span>吨精炼厂按年精炼<span>12</span>万吨毛油估算，可少用软水<span>6000</span>吨，减少污水处理量<span>6000</span>吨，同时减少约<span>1</span>吨的<span>COD</span>的排放量，对保护当地的水资源起着积极作用。</span>\r\n</p>\r\n<p>\r\n	<span> </span><span style=\"color:black;font-family:宋体;font-size:14pt;\">中粮</span><span style=\"color:black;font-family:宋体;font-size:14pt;\">集团油脂部所属企业天津佳悦、广西钦州、中粮东海精炼一厂、三厂、中粮黄海<span>1000</span>吨精炼厂、中粮九江等工厂都应用了此工艺，其经济技术指标都等于或优于试点工厂，以上</span><span style=\"font-family:宋体;font-size:14pt;\">工厂按此工艺年精炼豆油量共<span>120</span>万多吨，按每吨加工成本减少<span>10.27</span>元的保守值计算，年至少可节约资金<span>1230</span>万元，可少用软水<span>96000</span>吨，减少污水处理量<span>96000</span>吨。</span>\r\n</p>', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/其他证明1.jpg', '2016', null, '2', null, '11', null, '21', null, null, '1', '0', null, null, '31', null, '2016-01-27');
INSERT INTO `project` VALUES ('138', '175', '精炼厂无水脱皂及预复脱色工艺改造', null, '3', 0x3432, '54,109,58,56,126,125,124,123,122', '2008-08-04', '2009-07-06', '4,6,7', null, '1、“十一五”国家科技支撑计划重点项目《粮食宏观调控信息保障关键技术研究与示范》（编号：2008BADA8B00）；\r\n2、首批国家信息化试点项目《基于RFID的区域粮食流通管理》发改办高技［2009］1816号；\r\n3、国家物联网重大应用示范工程《国家粮食储运监管物联网应用示范工程》国粮展［2012］170号；\r\n4、2012年物联网技术研发及产业化专项《多种粮食智能感知设备研发及产业化》发改办高技［2012］2766号；\r\n5、2013年度公益性行业科研专项《粮食库存质量在线监控物联网技术与设备研究》国粮财［2013］260号；\r\n6、2014年度公益性行业科研专项《基于物联网的储备粮动态监管技术集成与示范》。', '0', null, '中粮集团油脂部中粮新沙粮油工业（东莞）有限公司', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/QQ截图201601131016442.jpg', '<p>\r\n	<span> <br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:12pt;\"><span>1</span></span><span style=\"font-family:宋体;font-size:12pt;\">、项目所属科学技术领域</span> \r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">属于轻工专业</span><span style=\"font-size:12pt;\"><span>-</span></span><span style=\"font-family:宋体;font-size:12pt;\">粮油食品加工技术领域</span> \r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:12pt;\"><span>2</span></span><span style=\"font-family:宋体;font-size:12pt;\">、主要内容及特点</span> \r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">食用油精加工的常规工艺流程：毛油经加热，加酸加碱反应后进行油皂离心分离，油中残皂再通过加水水洗后进行离心分离，经干燥得到中和油。中和油加入白土进行脱色反应后，过滤进行油土分离，进入析气除氧罐，最后进入脱臭系统，通过高温高真空蒸馏后成为成品食用油。常规工艺最大的缺点就是有大量废水产生，并且其生产辅料——白土的脱色能力没有得到充分利用。</span> \r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">食用油精加工的无水脱皂及预</span><span style=\"font-size:12pt;\"><span>/</span></span><span style=\"font-family:宋体;font-size:12pt;\">复脱色工艺流程：毛油经加热，加酸加碱反应后进行油皂离心分离，干燥后得中和油，加入助滤剂，真空干燥，进入已形成滤饼层准备切换的过滤机进行预脱色，滤去残皂、残余磷脂等杂质，加入白土进行脱色反应后，过滤进行油土分离，进入析气除氧罐，最后进入脱臭系统，通过高温高真空蒸馏后成为成品食用油。</span> \r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">无水脱皂的原理是：脱皂离心机出来的油，其所含一定量的残余皂粒及磷脂等杂质，不进行水洗工艺，而是直接通过加入助滤剂吸附后，利用废白土滤饼层的剩余脱色能力滤去残皂及磷脂，达到无水洗脱残皂，实现精炼车间废水的零排放。脱色时使用过一次的白土（废白土）还有吸附力，当接触颜色更深的油时，仍可以吸附一定量的色素，重新达到吸附平衡。预复脱色工艺就是充分利用废白土的剩余吸附色素能力达到降低白土用量的目的。</span> \r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">无水脱皂工艺的特点：</span><span style=\"font-family:宋体;font-size:12pt;\">①</span><span style=\"font-family:宋体;font-size:12pt;\">减少精炼废水的排放量，实现无水洗脱皂；</span><span style=\"font-size:12pt;\"><span> </span></span><span style=\"font-family:宋体;font-size:12pt;\">②</span><span style=\"font-family:宋体;font-size:12pt;\">可减少白土用量</span><span style=\"font-size:12pt;\"><span>28%</span></span><span style=\"font-family:宋体;font-size:12pt;\">；</span><span style=\"font-size:12pt;\"><span> </span></span><span style=\"font-family:宋体;font-size:12pt;\">③</span><span style=\"font-family:宋体;font-size:12pt;\">提高成品油品质</span><span style=\"font-size:12pt;\"><span> </span></span><span style=\"font-family:宋体;font-size:12pt;\">④</span><span style=\"font-family:宋体;font-size:12pt;\">降低生产成本</span> \r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"font-size:12pt;\"><span>3</span></span><span style=\"font-family:宋体;font-size:12pt;\">、应用推广情况</span> \r\n</p>\r\n<p>\r\n	<span> <br />\r\n</span> \r\n</p>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">目前行业内的油脂精炼，大多数还是用传统水洗工艺脱皂，只有个别工厂在</span><span style=\"font-size:12pt;\"><span>2008</span></span><span style=\"font-family:宋体;font-size:12pt;\">年前后尝试使用无水脱皂工艺，但也未与预复脱色工艺配套。</span><span style=\"font-size:12pt;\"><span>2008</span></span><span style=\"font-family:宋体;font-size:12pt;\">年，中粮集团在其油脂部所属工厂——中粮新沙粮油工业（东莞）有限公司进行无水脱皂及预</span><span style=\"font-size:12pt;\"><span>/</span></span><span style=\"font-family:宋体;font-size:12pt;\">复脱色工艺配套改造试点，</span><span style=\"font-size:12pt;\"><span>2009</span></span><span style=\"font-family:宋体;font-size:12pt;\">年</span><span style=\"font-size:12pt;\"><span>5</span></span><span style=\"font-family:宋体;font-size:12pt;\">月，该项目获得成功，并通过了中粮集团油脂部组织的专家验收。</span><span style=\"font-size:12pt;\"><span>2011</span></span><span style=\"font-family:宋体;font-size:12pt;\">年</span><span style=\"font-size:12pt;\"><span>3</span></span><span style=\"font-family:宋体;font-size:12pt;\">月，广东省科学技术情报研究所出具了“无水脱皂精炼工艺</span><span style=\"font-size:12pt;\"><span> </span></span><span style=\"font-family:宋体;font-size:12pt;\">”科技查新报告（报告编号：</span><span style=\"font-size:12pt;\"><span>20112192</span></span><span style=\"font-family:宋体;font-size:12pt;\">）。</span> \r\n</p>\r\n<p>\r\n	<span> </span><span style=\"font-family:宋体;font-size:12pt;\">该工艺领先国内油脂精炼工艺水平，</span><span style=\"font-family:;\" roman\",serif;font-size:12pt;\"=\"\" new=\"\" times=\"\">2009</span><span style=\"font-family:宋体;font-size:12pt;\">年以来，已在中粮油脂部所有新建工厂及生产线迅速得到推广，如天津佳悦、广西钦州、中粮东海精炼一厂及三厂、中粮黄海</span><span style=\"font-family:;\" roman\",serif;font-size:12pt;\"=\"\" new=\"\" times=\"\">1000</span><span style=\"font-family:宋体;font-size:12pt;\">吨线、中粮九江等都采用了该工艺，取得了满意的效果。</span> \r\n</p>', '<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">节能减排是我国目前工作重点之一，中粮集团油脂部所辖十余家油脂制取、精炼的加工厂，在生产加工过程中，都会产生废气、废水、废渣，能耗问题也较突出，因此节能减排也是油脂部各工厂的重点工作之一。各级领导对此项工作相当重视，多次下达有关文件，号召所属企业在节能减排上找路子、想点子。无水脱皂及预复脱色工艺项目就是在此背景下诞生的。</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">食用油加工企业最难处理的废水为精炼车间的水洗废水，该废水含有残皂、残余磷脂、少量油脂等，其<span>COD</span>在<span>5000</span>至<span>50000</span>左右，必须经隔油、除皂、除磷、<span>PH</span>值调节、厌氧、好氧等处理后才能达标排放。</span>\r\n</p>\r\n<span> </span><span style=\"font-family:宋体;font-size:14pt;\">为了实现水洗废水的少排直至零排放，我们着手研究国内外最新精炼工艺，最后确定用无水脱皂工艺与预复脱色工艺相结合的方法进行改造实验。初步制订了脱皂离心机出来的油不水洗，加入助滤剂吸附后，利用脱色废白土的剩余脱皂及脱色能力进行二次脱色的工艺。该工艺的实施可使中和油不用水洗，实现精炼车间无废水排放，还可减少脱色剂用量约<span>30%</span>，提高油脂精炼率约<span>0.07%</span>。集团油脂部领导对此工艺改造着重安排，于<span>2008</span>年<span>5</span>月迅速成立了“中粮油脂部无水脱皂项目领导小组”，<span>2008</span>年<span>8</span>月份完成了项目的前期可行性论证。<span>8</span>月中旬，经“中粮油脂部无水脱皂项目领导小组”研究并报中粮油脂部领导批准，中粮新沙公司成为了该项目的试点单位。决定先在中粮新沙公司<span>400</span>吨精炼厂进行该项目的改造试点，成功后，再在中粮油脂部各厂全面推广。</span>', '<span> </span>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">一、无水脱皂</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">不经水洗的油通过加入助滤剂吸附后，再经废白土滤饼层过滤及预脱色的方法除去油中残余皂质及残余磷脂等杂质，达到无水洗脱残皂，实现了精炼车间无残皂废水排放。</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:24pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">二、预复脱色</span>\r\n</p>\r\n<span> </span><span style=\"font-family:宋体;font-size:14pt;\">利用废白土的剩余脱色能力及废白土滤饼层的过滤作用，充分挖掘白土的吸附能力，减少白土用量</span>', '<span style=\"color:black;font-family:&quot;Times New Roman&quot;,serif;font-size:14pt;\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><span style=\"font-family:宋体;font-size:14pt;\">该项目技术属中粮油脂部所有，未经油脂部领导批准请不对外泄漏</span>', '<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">一、行业内调研情况：</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">目前行业内的油脂精炼，大多数还是用传统水洗工艺脱皂，只有个别工厂在<span>2008</span>年前后尝试使用无水脱皂工艺，但也未与预复脱色工艺配套。</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">二、专业设计院调研情况：</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">目前，集团所辖的无锡院、西安院、武汉院，上述三家设计院，目前都未搞过“无水脱皂”精炼工艺，主要设计还是传统的“水洗工艺”。</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">三、设备商的调研情况：</span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">与北京东方莱茵机械技术有限公司、中国农业机械化科学研究院油脂所、国际上著名的粮油工程公司如力必浩工程公司、迪斯美工程公司、优德工程设备技术有限公司、阿法拉伐公司进行沟通，<span>2009</span>年前在国内未做过“无水脱皂工艺”的相关工程。</span>\r\n</p>\r\n<span> </span><span style=\"font-family:宋体;font-size:14pt;\">因此，该工艺居于国内外领先水平！</span>', '<span> </span>\r\n<p style=\"text-indent:28.5pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">随着社会的进步，环保节能要求的提高，常规精炼工艺已跟不上最新的节能降耗要求。国家要求到<span>2010</span>年总污染物总的排放量下降<span>10%</span>，同时国资委给我们中粮集团的要求是：污染物的总排放量每年要递减<span>10</span>％。无水脱皂及预复脱色工艺项目就是在此背景下诞生的。该工艺既适合在油脂精炼常规工艺基础上进行改造，更适合在新的油脂精炼项目中进行应用。当时，集团油脂部有<span>10</span>余条食用油精炼常规工艺生产线，<span>4</span>条即将开工的精炼生产线。在老生产线如何进行节能降耗改造及新上马项目如何进行节能降耗工艺选择时，油脂部组织所属企业的专家组经过充分论证，提出实施无水脱皂及预复脱色工艺改造项目，并在最具备条件的中粮新沙公司<span>400</span>吨精炼厂进行试点。</span>\r\n</p>\r\n<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">\r\n<p style=\"text-indent:28.5pt;\">\r\n	<span> <br />\r\n</span>\r\n</p>\r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span>&nbsp;</span>新沙公司精炼车间的以前的精炼工艺为：毛油<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>加热至<span>80</span>℃<span><span>&nbsp;&nbsp;&nbsp; </span></span>加磷酸脱胶<span><span>&nbsp;&nbsp;&nbsp; </span></span>加烧碱脱酸<span><span>&nbsp;&nbsp;&nbsp; </span></span>离心脱皂<span><span>&nbsp;&nbsp;&nbsp; </span></span>加<span>90</span>℃软水水洗脱残皂<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>离心脱水<span><span>&nbsp;&nbsp;&nbsp; </span></span>真空干燥<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>中和油<span><span>&nbsp;&nbsp;&nbsp; </span></span>加热至<span>110</span>℃<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>析气<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>加脱色剂（白土）<span><span>&nbsp;&nbsp;&nbsp; </span></span>脱色塔反应约<span>40min<span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>过滤（油土分离）<span><span>&nbsp;&nbsp;&nbsp; </span></span>析气<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>加热至约<span>250</span>℃高温高真空脱臭脱酸约<span>90min<span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>冷却至<span>60</span>℃以下<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>过滤<span><span>&nbsp;&nbsp;&nbsp;&nbsp; </span></span>成品油。</span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\">\r\n	<span> </span><span style=\"font-family:宋体;font-size:14pt;\"><span>&nbsp;&nbsp;&nbsp; </span></span><span style=\"font-family:宋体;font-size:14pt;\">该工艺在常规工艺上作如下改良：离心脱皂后的油，不用加<span>90</span>℃软水，直接进行干燥（保留少部分水以使残皂在油中呈悬浮液态），升温后加入<span>0.05%</span>助滤剂，再利用经脱色反应后的废白土的剩余脱色力进行预脱色，除去油中残皂及部分色素，然后加入新鲜白土进行复脱色。这样变废为宝，使白土的脱色力达到最大限度的利用，故可以大大降低白土的用量。为此需对工艺流程作如下改动：增加<span>2</span>台<span>80</span>㎡过滤器用于预复脱色过滤时进行周转，增加一个<span>2<span style=\"color:black;\">m<sup>3</sup></span></span>干燥罐用于添加助滤剂后除去油中多余水分，增加一个<span>1<span style=\"color:black;\">m<sup>3</sup></span></span>助滤剂调和罐（带搅拌）<span>,</span>增加<span>3</span>台流量<span>30</span></span><span style=\"color:black;font-family:宋体;font-size:12pt;\"> </span><span style=\"color:black;font-family:宋体;font-size:14pt;\">m<sup>3</sup></span><span style=\"font-family:宋体;font-size:14pt;\">/h</span><span style=\"font-family:宋体;font-size:14pt;\">、扬程<span>60m</span>的油输送泵，增加管道阀门一批，增加用于承放阿玛过滤机的钢结构承台，增加一组袋式安全过滤器，电脑程序修改等。</span>\r\n</p>\r\n</span>\r\n<p style=\"text-indent:28.5pt;\">\r\n	<br />\r\n</p>\r\n<span> </span>', '<span> </span> \r\n<p style=\"text-indent:21pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">该项目投产以来<span>,</span>在以下几方面体现出了其比常规工艺更好的优势：</span> \r\n</p>\r\n<span> </span> \r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span> </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">一、减少废水的排放量：实现无水脱皂工艺，新沙<span>400</span>吨的精炼车间每年可减少废水排放<span>10000</span>吨，减少<span>1</span>吨<span>COD</span>。污水处理车间的聚合硫酸铁、石灰粉、聚丙烯酰胺等的用量至少减少一半，年减少污水处理费用约<span>15000</span>元。</span> \r\n</p>\r\n<span> </span> \r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span> </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">二、减少白土用量：减少白土用量<span>28%</span>。年节约白土<span>400</span>吨。</span> \r\n</p>\r\n<span> </span> \r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span> </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">三、提高品质：无水脱皂工艺生产出来的成品油总体质量水平明显高于常规工艺的质量。其酸价、颜色、风味、氧化稳定性（<span>AOM</span>）、烟点都比常规工艺的要好。特别是成品油含磷从<span>2.5</span></span><span style=\"color:#333333;line-height:150%;font-family:\" arial\",sans-serif;font-size:14pt;\"=\"\">mg/kg</span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">降到<span>1.2</span></span><span style=\"color:#333333;line-height:150%;font-family:\" arial\",sans-serif;font-size:14pt;\"=\"\">mg/kg</span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">，为满足特殊客户的需求，可生产出色泽更浅的产品。</span> \r\n</p>\r\n<p>\r\n	<img src=\"http://localhost:8089/ccoa/attached/image/20160128/20160128092328_709.jpg\" width=\"600\" alt=\"\" />\r\n</p>\r\n<span> </span> \r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span> </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">六、改善了车间的环境：少用一台离心机，车间噪音明显变小。</span> \r\n</p>\r\n<span> </span><span style=\"font-family:宋体;font-size:14pt;\"><span> </span></span><span style=\"font-family:宋体;font-size:14pt;\">该项目领先国内先进水平，已在油脂部新建工厂及生产线中迅速得到全面推广，如天津佳悦、广西钦州、中粮东海精炼一厂、三厂、中粮黄海<span>1000</span>吨精炼厂、</span><span style=\"font-family:宋体;font-size:14pt;\">中粮九江等都采用了该工</span><span style=\"font-family:宋体;font-size:14pt;\">艺，取得了满意效果。</span><span></span> \r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span> </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">三、提高品质：无水脱皂工艺生产出来的成品油总体质量水平明显高于常规工艺的质量。其酸价、颜色、风味、氧化稳定性（<span>AOM</span>）、烟点都比常规工艺的要好。特别是成品油含磷从<span>2.5</span></span><span style=\"color:#333333;line-height:150%;font-family:\" arial\",sans-serif;font-size:14pt;\"=\"\">mg/kg</span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">降到<span>1.2</span></span><span style=\"color:#333333;line-height:150%;font-family:\" arial\",sans-serif;font-size:14pt;\"=\"\">mg/kg</span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">，为满足特殊客户的需求，可生产出色泽更浅的产品。</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<span> </span> \r\n<p>\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\"><span> </span></span><span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">六、改善了车间的环境：少用一台离心机，车间噪音明显变小。</span> \r\n</p>\r\n<span> </span><span style=\"font-family:宋体;font-size:14pt;\"><span> </span></span><span style=\"font-family:宋体;font-size:14pt;\">该项目领先国内先进水平，已在油脂部新建工厂及生产线中迅速得到全面推广，如天津佳悦、广西钦州、中粮东海精炼一厂、三厂、中粮黄海<span>1000</span>吨精炼厂、</span><span style=\"font-family:宋体;font-size:14pt;\">中粮九江等都采用了该工</span><span style=\"font-family:宋体;font-size:14pt;\">艺，取得了满意效果。</span>', '45', '545', '545', '<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"line-height:150%;font-family:宋体;font-size:14pt;\">无水脱皂工艺用于油脂精炼中<span>,</span>不但有一定的经济效益<span>,</span>而且会产生很好的社会效益：节约了水资源，减少了污水的排放量，同时减少了<span>COD</span>的排放量，在新建<span style=\"color:black;\">项目中可以降低污水处理工程的投资。</span></span>\r\n</p>\r\n<span> </span>\r\n<p style=\"text-indent:28pt;\">\r\n	<span style=\"color:black;line-height:150%;font-family:宋体;font-size:14pt;\">我司<span>400</span>吨精炼厂按年精炼<span>12</span>万吨毛油估算，可少用软水<span>6000</span>吨，减少污水处理量<span>6000</span>吨，同时减少约<span>1</span>吨的<span>COD</span>的排放量，对保护当地的水资源起着积极作用。</span>\r\n</p>\r\n<span> </span><span style=\"color:black;font-family:宋体;font-size:14pt;\">中粮</span><span style=\"color:black;font-family:宋体;font-size:14pt;\">集团油脂部所属企业天津佳悦、广西钦州、中粮东海精炼一厂、三厂、中粮黄海<span>1000</span>吨精炼厂、中粮九江等工厂都应用了此工艺，其经济技术指标都等于或优于试点工厂，以上</span><span style=\"font-family:宋体;font-size:14pt;\">工厂按此工艺年精炼豆油量共<span>120</span>万多吨，按每吨加工成本减少<span>10.27</span>元的保守值计算，年至少可节约资金<span>1230</span>万元，可少用软水<span>96000</span>吨，减少污水处理量<span>96000</span>吨。</span>', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/QQ截图20160113101644.jpg', '2016', '3434', '2', null, '12', null, '55', null, null, '1', '0', null, null, '28', null, '2016-01-27');
INSERT INTO `project` VALUES ('139', '170', 'MMR系列磨粉机', null, '3', 0x3434, '126,123,122,121', '2016-01-03', '2016-01-12', null, null, null, '1', '无限期', '中国粮油学会食品分会', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/QQ图片201512311046193.jpg', '<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">该项目属于装备的技术研发和升级，根据“高效、节能、减噪、信息化”的粮油加工业发展的总体思路，重点解决磨粉机运行过程中效率低、能耗高和噪声大的问题。在现有的MME、MMD、MMT系列磨粉机基础上，充分利用和发挥张家口公司和中粮工科的技术力量和装备制造优势，研制出符合高效、节能、减噪、信息化管理要求的全新MMR系列新型磨粉机。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">主要内容及特点是：1）利用机械杠杆原理与重力式计量传感技术，适时将料流变化转化成数字信号后，通过智能伺服控制技术调节料门大小和喂料辊转速，确保喂料均匀，达到稳定碾磨效果，减少磨辊损伤，降低电耗。2）前后喂料辊设计成独立模块组合，利用滑槽结构，具备推拉导出功能。3）结合喂料腔掀背式设计，实现在线快速清扫功能。4）利用磨辊间距离与压力数字传感技术、轧距伺服驱动调节限位技术，实现远程、系统轧距设计。5）快、慢辊设计成独立模块组合，采取导出拆卸原理，结合气动张紧同步齿楔带传动结构，实现磨辊快速装拆。6）物料接触部分采用不锈钢一次成型结构，无死角，无残留，保证食品卫生。7）利用工业造型与现代模具技术，实现流线型美观设计。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">通过以上技术开发升级，成功研制了符合食品安全、节能减噪和信息化管理要求的新型磨粉机。去年已成功研制出MMR100、MMR125磨粉机各一台，并且进行了生产性能考核，及时修改完善，现已满足产业化要求，实现量产，年产量两百台左右，成功应用于一套日处理500吨的小麦专用粉生产线，其中：1）单机吨粉电耗平均降低1.5度。2）单机噪音降低5分贝以上。3）碾磨稳定性提高，出粉率提高1%-2%。4）减少磨辊损伤度，延长磨辊使用寿命20%以上。5）提高轴承、气缸、齿楔带等易损件使用寿命50%以上。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<!--EndFragment-->', '<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">中粮工程装备（张家口）有限公司（以下简称张家口公司）是中粮工程科技有限公司（以下简称中粮工科）成功并购张家口市东旭粮食机械有限公司（以下简称东旭粮机）后成立的新公司。原东旭粮机厂在企业技术力量相对薄弱的情况下，依靠几十年对磨粉机的理解和执着精神，形成目前的MME、MMD、MMT系列磨粉机产品，虽然目前国内磨粉机市场占有份额与我们的标杆企业也是我们的竞争对手瑞士布勒公司持平，东旭牌磨粉机与布勒在国内主要销售的MDDK型磨粉机比较，工艺效果已不相上下且有着自己的结构特色，如：磨粉机底座形式、辊间传动方式、轧距锁紧结构等，使用中噪音和电耗的指标还略胜一筹。但行业调查显示：竞争对手布勒、意大利GBS公司均已在总部开发出新一代产品，虽然目前未在中国工厂生产，但他们在技术先进性、加工手段、产品质量、售后服务理念上的超前创新意识，是国内粮机厂家需要学习和借鉴的。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">国内粮机产品在注重食品安全方面、自动控制先进性可靠性、产品外形美感、制造精度等与国际一流品牌存在不小的差距，我们和布勒产品竞争主要还是依靠价格优势，在产品技术的先进性、可靠性上与国际一流品牌无法形成抗衡。随着布勒和GBS公司产品质量优势、服务优势、营销优势加大，一旦新一代产品进入中国市场，又将拉开与国产磨粉机、高方平筛的技术档次，直接影响到国内粮机产品的生存空间。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">中粮工科在无菌面粉上的研究处于国内领先，取得了一系列研究成果，对磨粉机贯彻食品安全、节能降噪、信息管理理念，确定技术升级方向奠定了基础，结合张家口公司优良的加工装备、经验和已形成的市场影响力，为圆满完成本项目提供了保证。</span>\r\n</p>\r\n<!--EndFragment-->', '（1）快、慢辊设计成独立模块组合，采取导出拆卸原理，结合气动张紧同步齿楔带传动机构，前面板整体旋转上翻，实现磨辊快速装拆，是国内唯一能实现磨辊整体快速装拆的磨粉机厂家。（正申请国家专利）\r\n	（2）磨粉机辊轮传动机构采用三轮系齿楔带传动，将张紧机构设为弹性可调机构，使张紧轮和齿楔带内齿壁接合时有缓冲余地，通过改进齿楔带齿体的节距提升传动力及稳定性，通过改进张紧轮的外周面使齿楔带安装简便。这是全球首个高效运行的弹性张紧结构。（国际专利）\r\n	（3）利用磨辊间距离与压力数字传感技术、轧距伺服驱动调节限位技术，实现远程、系统轧距设计，微调轧距结构简单省力，小气缸锁紧手轮面板按键控制，方便快捷。（国家专利）\r\n	（4）利用工业造型与现代磨具技术，实现流线型美观设计。（外观专利）\r\n	（5）物料接触部分采用不锈钢一次成型结构，无死角、无残留，保证卫生。\r\n	（6）整体铸铁底座，平稳减震降噪', '<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\"> </span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">磨辊快速拆装机构正在申请国家专利，需保密</span>\r\n</p>\r\n<!--EndFragment-->', '<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">（1）齿楔带的张紧是我公司自主开发的专利产品弹性张紧结构，能自动补偿带的微量变化，提高带的使用寿命3-5倍，而其它厂家生产的同类产品用的是齿轮传动或带的刚性张紧，这是全球首个高效运行的弹性张紧结构。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;&nbsp;（2）国内同类磨粉机的前面板大部分不能翻转，无锡布勒的最新产品能翻转也只是外置铰链的翻转，而我公司产品是内置铰链翻转。内置铰链翻转形式美观，制作难度大。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;&nbsp;（3）国内唯一厂家能实现磨辊整体快速拆装的磨粉机。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">（4）料位传感系统，该控制系统灵敏度高，成本低，该系统的技术含量高。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">（5）我公司用的是整体压铸底座，而其它厂家是钢板焊接的，稳定性差，噪音大。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;&nbsp;（6）国内的磨粉机外形几乎都是钣金折弯焊接而成，而我公司MMR磨得外形都是磨具压铸而成，流线型好。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<!--EndFragment-->', '<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">（1）总体思路</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;本项目是根据“高效、节能、减噪、信息化”的粮油加工业发展的总体思路，重点解决磨粉机运行过程中效率低、能耗高和噪声大的问题。在现有的MME、MMD、MMT系列磨粉机基础上，充分利用和发挥张家口公司和中粮工科的技术力量和装备制造优势，研制出符合高效、节能、减噪、信息化管理要求的全新MMR系列新型磨粉机。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;&nbsp;（2）研究成果</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">通过料位传感控制技术实现自动变频喂料；实现喂料单元整体向外翻转清理；实现有效降低磨辊碾磨时的温升；改进磨辊面清理装置；内部无残料设计；磨辊轧距数字化远程控制；节能降耗，降低电耗和噪音。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">项目研发过程中获国际PCT专利1项，国家实用新型专利6项，国家外观专利1项，申报国家发明专利4项。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;&nbsp;（3）技术方案和创新成果</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">Ⅰ物料重力传感式检测与喂料均匀性研究</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<img align=\"left\" src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps3EEB.tmp.jpg\" width=\"275\" height=\"248\" /><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">利用机械杠杆原理与重力式计量传感技术，适时将料流变化转化成数字信号后，通过智能伺服控制技术调节料门大小和喂料辊转速，确保喂料均匀，达到稳定碾磨效果，减少磨辊损伤，降低电耗。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">Ⅱ喂料辊可快速清扫机构的研究</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">前后喂料辊设计成独立模块组合，如图一所示，利用滑槽结构，具备推拉导出功能，结合喂料腔掀背式设计，实现在线快速清扫功能。&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">图一</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">Ⅲ磨辊轧距数字化远程控制装置及软件开发(获国家专利)</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">利用磨辊间距离与压力数字传感技术、轧距伺服驱动调节限位技术，实现远程、系统轧距设计，微调轧距结构简单省力，小气缸锁紧手轮面板按键控制，方便快捷。如图二所示，调节锁紧装置包括轧调螺杆（3），该轧调螺杆连接磨粉机的快辊轴承座（1）和慢辊轴承座（2），其中，磨辊轧距调节锁紧装置还包括</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">调节螺母（4），该调节螺母设置在所述慢辊轴承座的外侧的轧调螺杆上。通过上述技术方案，将调节螺母安装在慢辊轴承座的外侧，从而使对调节螺母的操作空间较大，操作时不会因与其他零部件发生碰撞和干涉而导致危险。可以通过工具等对该调节螺母进行调节，不但省力而且方便操作。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps3EFC.tmp.jpg\" width=\"533\" height=\"389\" /></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">图二</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;text-indent:28.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">Ⅳ磨粉机辊轮传动机构及包含该机构的磨粉机（获国际专利）</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">磨粉机辊轮传动机构如图三所示，三轮系齿楔带传动，机构中包括机快辊轮（1）、慢辊轮（2）、齿楔带（4），该齿楔带设有内齿面和外齿面，该齿楔带的内齿面和快辊轮的外周面接合，外齿面与慢辊轮的的外周面接合，磨粉机辊轮传动机构还包括：张紧座（7），支承轴（8），摆动架（6），滚轴（5），张紧轮（3），压紧机构。将张紧机构设为弹性可调机构，使张紧轮和齿楔带内齿壁接合时有缓冲余地，齿楔带的张力可通过张紧机构自身的弹力缓冲；通过改进齿楔带齿体的节距提升传动力及稳定性，通过改进张紧轮的外周面使齿楔带安装简便。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps3EFD.tmp.jpg\" width=\"645\" height=\"350\" /></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">图三</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">Ⅴ磨辊快速装拆（正在申请国家专利）</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-align:left;text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">快、慢辊设计成独立模块组合，采取导出拆卸原理，结合气动张紧同步齿楔带传动结构，实现磨辊快速装拆。如图四所示，</span><span style=\"font-family:宋体;font-size:14pt;\">一种磨粉机磨辊支承部分整体布局结构，使上述拆卸所有部件形成一个整体单元，此整体单元包括气缸（4），快辊轴承座（3），慢辊轴承座（7），轧距调整机构（2），横梁（5），外卡档（9），中卡档（8），整体单元的拆装还需要前面板旋转机构（1）的辅助。</span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-align:left;text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">气缸（4）与横梁（5）铰接，快辊轴承座（3）固定在横梁（5）上，慢辊轴承座（7）与横梁（5）铰接，轧距调节机构（2）安装在快辊轴承座（3）上，通过气缸（4）伸缩驱动，拉动慢辊轴承座（7）以慢辊轴承座与横梁（5）铰接点为圆心转动，调整快辊与慢辊的间距，横梁（5）与底座（6）由两条螺栓连接，中卡档（8）卡在两根磨辊轴头之间。</span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">在更换磨辊时候，需要先翻开前面板（1），只需要拆下外卡档（9），拆除两根连接底座（6）的螺栓，磨辊整体支承部分连同中卡档（8）一同拆下，将另一套整体支承部分安装，完成更换。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps3F0D.tmp.png\" width=\"418\" height=\"390\" /></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">图四</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps3F0E.tmp.jpg\" width=\"324\" height=\"316\" /></span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">Ⅵ利用工业造型与现代模具技术，实现流线型设计，美观简洁。<span>(&nbsp;</span><span>获得国家外观设计专利&nbsp;</span><span>)</span><span>（如图五所示）。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;&nbsp;</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">图五</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">Ⅶ整体精密铸造底座，运行更加平稳</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">面粉机底座整体精密铸造（如图六所示），具备以下优点：坚固耐用不错位；保证碾磨区位置精确；无共振，降低运行噪音。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps3F1F.tmp.jpg\" width=\"338\" height=\"223\" /></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:259pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">图六</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">（4）实施效果</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;&nbsp;</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\">&nbsp;MMR系列磨粉机经过面粉厂推广应用，可实现以下指标：&nbsp;</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">1）单机吨粉电耗平均降低1.5度。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">2）单机噪音降低5分贝以上。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">3）碾磨稳定性提高，出粉率提高1%-2%。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">4）减少磨辊损伤度，延长磨辊使用寿命20%以上。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">5）提高轴承、气缸、齿楔带等易损件使用寿命50%以上。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\">&nbsp;</span>\r\n</p>\r\n<!--EndFragment-->', '<p style=\"text-indent:28pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">MMR新型磨粉机已实行量产，年产量两百台左右，成功应用于一套日处理500吨的小麦专用粉生产线，其中：1）单机吨粉电耗平均降低1.5度。2）单机噪音降低5分贝以上。3）碾磨稳定性提高，出粉率提高1%-2%。4）减少磨辊损伤度，延长磨辊使用寿命20%以上。5）提高轴承、气缸、齿楔带等易损件使用寿命50%以上。</span><span style=\"color:#000000;font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<!--EndFragment-->', '470.6', '2', '各栏目的计算依据：新增利润=年销售量（100台/200台）×单机利润（3万元）\r\n新增税收=年度新增纳税总额\r\n创收外汇=年出口销售总额\r\n节支总额=年成本费用开支的节约总额', '<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MMR系列新型磨粉机在产品技术的先进性、可靠性上与国际一流品牌形成抗衡，解决了国内磨粉机运行过程中效率低、能耗高和噪声大的问题，对推动我国小麦加工装备技术进步做出了贡献。</span>\r\n</p>\r\n<!--EndFragment-->', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/QQ图片201512311046193.jpg', '2016', null, '8', '2', '12', null, '5', null, '2', '6', '3', '1', null, '29', '三等奖', '2016-01-11');
INSERT INTO `project` VALUES ('140', '169', '清洁高效节能饲料制粒成型装备', null, '1', 0x3435, '114,112,109,102,101', '2015-01-14', '2016-01-12', '7', null, null, '1', '8年', '江苏牧羊集团', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/IMG_20151231_0948033.jpg', '<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;font-weight:bold;\" class=\"16\">（一）科学技术领域</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\"> </span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">本项目属于动物饲料加工技术及关键设备研发。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;font-weight:bold;\" class=\"16\">（二）主要内容、特点：</span><span style=\"font-family:宋体;font-size:14pt;font-weight:bold;\" class=\"16\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">1<span>、建立了基于</span><span>Bekker</span><span>理论的环模压辊压料模型，利用离散元软件</span><span>PFC2D</span><span>仿真分析优化了环模压辊参数，确定了最优环模线速度和最优料层厚度；利用有限元分析的手段，对齿轮箱的强度、热平衡等方面进行了校核和优化，使制粒机运行稳定高效；制粒机生产性能达到产量</span><span>38.1T/h</span><span>，吨电耗</span><span>6.27kW</span><span>•</span><span>h/T</span><span>，能耗降低</span><span>20%</span><span>以上；&nbsp;</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">2<span>、采用制粒室门体与齿轮箱间适配盘式联接定位技术，适配盘通过适配器压合在齿轮箱的前侧壁，使齿轮箱受压均匀，使制粒机运行更加稳定；</span></span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">3<span>、采用高效、低摩阻、零泄漏压辊润滑密封技术，压辊采用</span><span>V</span><span>型密封与迷宫密封组合机构，并使用新型润滑材料，实现了压辊的免维护润滑，避免了润滑剂对饲料的污染；&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">4<span>、采用新型旁通门柔性连接技术，密封板采用柔性可调结构，保证了旁通门的密封效果，实现旁通门零漏料。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">&nbsp;</span><span style=\"font-family:宋体;font-size:12pt;\">经国家渔业机械仪器质量监督检验中心检测，本项目产品</span><span style=\"font-family:宋体;font-size:12pt;\">“SZLH685大型高效节能制粒机”</span><span style=\"font-family:宋体;font-size:12pt;\">性能指标合格；</span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">经省级鉴定，达到国际领先水平。</span><span style=\"font-family:宋体;font-size:12pt;\">本项目获授权国家发明专利3件，授权实用新型专利5件，授权外观专利1件，主持制定行业标准1件，发表学术论文1篇。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;font-weight:bold;\" class=\"16\">（三）应用推广情况</span><span style=\"font-family:宋体;font-size:14pt;font-weight:bold;\" class=\"16\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;font-weight:normal;\">本项目已在国内广泛应用，如宜城双胞胎、广西华港等公司，至目前的生产考核中，各生产线运行正常，性能稳定，性能可靠，客户认为是理想的饲料制粒成型设备。截止目前，该项目实现销售收入<span>30560</span><span>万元，利税</span><span>4158</span><span>万元，成为我公司的拳头产品，得到广大饲料企业的一致好评。</span></span>\r\n</p>\r\n<!--EndFragment-->', '目前国内部分大型饲料集团，在选择中大型制粒机时，均把单机产能定位在35t/h左右。双胞胎集团提出时产100t车间，配备3条制粒线的工艺设计理念，并将其作为新建工厂的设计标准。作为行业领头羊，双胞胎的设备配置模式也必然成为其他饲料企业竞相参照的标准。\r\n	双胞胎集团目前普遍采用的CPM 7726-9制粒机，稳定产量便在32t/h左右，这一机型也是CPM公司的主打产品，得到国内外大型饲料企业普遍认可。我公司虽然也有这一级别的机型，但其稳定产能、吨电耗、运行可靠性、操作维护便捷性等与CPM产品均存在较大差距，急需一款高性能的替代机型，以争夺这一细分市场。\r\n	现有产品与竞争对手标杆产品（结构）技术性能对比表\r\n					项目\r\n					江苏牧羊控股\r\n					江苏牧羊控股\r\n					CPM\r\n					设备型号/规格\r\n					MUZL1200A\r\n					MUZL1610\r\n					7726-9\r\n					功率配置，kw\r\n					110×2\r\n					160×2\r\n					250\r\n					产能，t/h\r\n					≤25\r\n					≤35\r\n					≤35', '（1）建立了基于Bekker理论的环模压辊压料模型，利用离散元软件PFC2D仿真分析优化了环模压辊参数，确定了最优环模线速度和最优料层厚度；利用有限元分析的手段，对齿轮箱的强度、热平衡等方面进行了校核和优化，使制粒机运行稳定高效；制粒机生产性能达到产量38.1T/h，吨电耗6.27kW•h/T，能耗降低20%以上；\r\n	（2）采用制粒室门体与齿轮间适配盘式联接定位技术，适配盘通过适配器压合在齿轮箱的前侧壁，使齿轮箱受压均匀，使制粒机运行更加稳定；\r\n	（3）采用高效、低摩阻、零泄漏压辊润滑密封技术，压辊采用V型密封与迷宫密封组合，并使用新型润滑材料，实现了压辊的免维护润滑，避免了润滑剂对饲料的污染；\r\n	（4）采用新型旁通门柔性连接技术，密封板采用柔性可调结构，保证了旁通门的密封效果，实现旁通门零漏料。\r\n	经国家渔业机械仪器质量监督检验中心检测，本项目产品“SZLH685大型高效', '<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">创新点需保密。</span>\r\n</p>\r\n<!--EndFragment-->', '（1）本项目采用技术：通过调节刮刀最佳安装角度实现均匀分料装置，在国内外公开发表的文献中未见报道。\r\n	（2）本项目采用技术：齿轮传动优化设计，制粒室门体与齿轮采用适配盘式联接定为技术，在国内外公开发表的文献中未见报道。\r\n	（3）本项目产品生产性能：产量达到38.1T/h，吨电耗6.27kW•h/T，能耗降低20%以上，经省级鉴定，达到国际领先水平。\r\n	（4）本项目采用高效、低摩阻、零泄漏压辊润滑密封密封技术，压辊采用V型密封与迷宫密封组合，并使用新型润滑材料，实现了压辊的免维护润滑，避免了润滑剂对饲料的污染，属国内首创。\r\n	表1  项目产品与国内外主要技术指标比较表\r\n					CPM\r\n					7726-9\r\n					国内同行 \r\n					858\r\n					牧羊 \r\n					SZLH685\r\n					主机功率（kw） \r\n					250 \r\n					355\r\n					250\r\n					环模内径（mm） \r\n					673\r\n					858\r\n					685\r\n					传动形式\r\n					齿轮传动 \r\n					产量', '<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;font-weight:bold;\">1<span>）总体思路：</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;font-weight:bold;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-family:宋体;font-size:12pt;\">本项目通过建立</span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">基于<span>Bekker</span><span>理论的环模压辊压料模型</span></span><span style=\"font-family:宋体;font-size:12pt;\">，利用离散元软件PFC2D仿真分析优化了环模压辊参数，确定了最优环模线速度和最优料层厚度；设计了一种新型物料分料机构，保证了物料的均匀分布；压辊采用V型密封与迷宫密封组合，并使用新型润滑材料，实现了压辊的免维护润滑，避免了润滑剂对饲料的污染；采用新型旁通门防漏料技术，密封板采用柔性可调结构，保证了旁通门的密封效果；利用有限元分析的手段，优化了齿轮箱的传动结构，使制粒机运行稳定高效；制粒机生产性能达到产量38.1T/h，吨电耗6.27kW•h/T。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;font-weight:bold;\">（<span>2</span><span>）技术方案与创新成果：</span></span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:14pt;font-weight:bold;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;font-weight:bold;\">技术方案：</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:14pt;font-weight:bold;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">1<span>）采用环模压辊、齿轮箱优化技术，建立了压辊攫料模型，利用离散元软件</span><span>PFC2D</span><span>仿真分析优化了环模压辊参数，确定了最优环模线速度和最优料层厚度；利用有限元分析的手段，对齿轮箱的强度、热平衡等方面进行了校核和优化，使制粒机运行稳定高效；制粒机生产性能达到产量</span><span>38.1T/h</span><span>，吨电耗</span><span>6.27kW</span><span>•</span><span>h/T</span><span>，能耗降低</span><span>20%</span><span>以上；</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">①&nbsp;通过建立基于<span>Bekker</span><span>理论的环模压辊压料模型，利用离散元软件</span><span>PFC2D</span><span>仿真分析，对环模压辊的参数进行优化，确定最优环模线速度和最优料层厚度</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:&quot;Times New Roman&quot;;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:253pt;\" class=\"MsoNormal\">\r\n	<span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps6B01.tmp.png\" width=\"205\" height=\"167\" /></span><span><span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps6B02.tmp.png\" width=\"187\" height=\"1822\" /></span></span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:58.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:9pt;\">基于<span>Bekker</span><span>模型的压辊受力分析</span></span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:9pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">②&nbsp;</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\">PFC2D</span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">仿真分析和优化设计</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">利用<span>PFC2D</span><span>离散元仿真软件，对建立的环模压辊的物料压制模型进行仿真计算，对环模转速、压辊尺寸、料层厚度、压辊齿形等参数进行优化选择，确定最优的物料压制状态。</span></span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps6B12.tmp.jpg\" width=\"266\" height=\"145\" /><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps6B13.tmp.jpg\" width=\"266\" height=\"145\" /><span style=\"font-family:&quot;Times New Roman&quot;;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">③&nbsp;利用有限元分析等手段，对齿轮箱进行了校核和优化，确保制粒机运行的稳定性</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps6B24.tmp.png\" width=\"576\" height=\"302\" /></span></span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">2<span>）采用制粒室门体与齿轮间适配盘式联接定位技术，适配盘通过适配器压合在齿轮箱的前侧壁，使齿轮箱受压均匀，使制粒机稳定性提升</span><span>20%</span><span>。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">3<span>）采用高效、低摩阻、零泄漏压辊润滑技术，压辊采用</span><span>V</span><span>型密封与迷宫密封组</span></span><span style=\"font-family:宋体;font-size:12pt;\">合机构</span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">，并使用新型润滑材料，实现了压辊的免维护润滑，避免了润滑剂对饲料的污染，实现绿色化生产。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">为避免工业用压辊润滑密封脂直接进入制粒室污染物料，导致饲料存在安全隐患，推出新型免维护压辊组件，采用低磨阻、零泄漏密封技术，润滑脂在压辊壳寿命周期内无须更换，杜绝润滑剂对饲料的污染。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">&nbsp;&nbsp;&nbsp;&nbsp;V<span>型油封与迷宫密封组合使用，压辊壳或轴承首次装配时填入宽温、极压锂基脂，正常使用期间不加油，待更换压辊壳或更换轴承时重新填入新的润滑脂。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-indent:67.5pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">压辊润滑&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>V</span><span>型油封&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新型旁通门</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:9pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img align=\"left\" src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps6B25.tmp.png\" width=\"147\" height=\"136\" /><img align=\"left\" src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps6B26.tmp.jpg\" width=\"180\" height=\"134\" /><img align=\"left\" src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps6B36.tmp.jpg\" width=\"77\" height=\"145\" /><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">4<span>）采用新型旁通门柔性连接技术，密封板采用柔性可调结构，保证了旁通门的密封效果，实现旁通门零漏料。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">柔性密封板采用耐磨聚四氟乙烯材料，通过调节机构使位于旁通门夹层中的密封板与门板贴合，有效地防止饲料泄露。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;font-weight:bold;\">创新成果：</span><span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">1）本项目技术成果得到广泛应用，同时支持完成了行业标准1项：JB/T&nbsp;11930-2014《饲料环模制粒机&nbsp;环模&nbsp;精度》。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">2）研究</span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">环模压辊、齿轮箱优化技术，</span><span style=\"font-family:宋体;font-size:12pt;\">制粒室门体与齿轮间适配盘式联接定位技术，</span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">高效、低摩阻、零泄漏压辊润滑技术，新型旁通门柔性连接技术</span><span style=\"font-family:宋体;font-size:12pt;\">等，并申请国家发明专利3项、实用新型专利5项，外观专利1项。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">4）研发了大型</span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">制粒机，生产性能达到产量<span>38.1T/h</span><span>，吨电耗</span><span>6.27kW</span><span>•</span><span>h/T</span><span>，能耗降低</span><span>20%</span><span>以上</span></span><span style=\"font-family:宋体;font-size:12pt;\">。本产品于2015年5月通过省级新产品鉴定，认定为国际领先水平。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;font-weight:bold;\">（<span>3</span><span>）实施效果：</span></span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:14pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:6pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">1<span>）</span></span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">时产<span>35</span><span>吨大型饲料制粒装备的应用，带动国内整个饲料行业制粒水平的提升，制粒机生产性能达到产量</span><span>38.1T/h</span><span>，吨电耗</span><span>6.27kW</span><span>•</span><span>h/T</span><span>，能耗降低</span><span>20%</span><span>以上；</span></span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:6pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">2<span>）</span></span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">采用新型的密封设计，并使用新型润滑材料，实现了压辊的免维护润滑，避免了润滑剂对饲料的污染，实现了饲料绿色化生产</span><span style=\"font-family:宋体;font-size:12pt;\">，带动饲料整体质量的提升；</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">3<span>）本项目已在国内外广泛应用，</span></span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">如宜城双胞胎、广西华港等公司</span><span style=\"font-family:宋体;font-size:12pt;\">，</span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">截止目前，该项目实现销售收入<span>30560</span><span>万元，利税</span><span>4158</span><span>万元</span></span><span style=\"font-family:宋体;font-size:12pt;\">，</span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">得到广大饲料企业的一致好评</span><span style=\"font-family:宋体;font-size:12pt;\">。</span>\r\n</p>\r\n<!--EndFragment-->', '<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">本项目已在</span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">宜城双胞胎、广西华港、泰国<span>SPM</span><span>、印尼新希望等公司应用</span></span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">。为满足客户耗需求，项目从压辊、齿轮优化设计，设备大型化，关键部件润滑密封等多方面着手开展研究，确保项目的顺利实施。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">（<span>1</span><span>）应用环模压辊、齿轮箱优化技术和</span></span><span style=\"font-family:宋体;font-size:12pt;\">制粒室门体与齿轮间适配盘式联接定位技术，</span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">使制粒机运行稳定高效，能耗降低<span>20%</span><span>以上；</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">（<span>2</span><span>）设计完成了产量</span></span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\">达到<span>38.1T/h</span><span>的大型饲料制粒装备，满足大型饲料厂设计需求；</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">（<span>3</span><span>）应用高效、低摩阻、零泄漏压辊润滑密封技术和新型旁通门柔性连接技术，实现了压辊的免维护润滑，避免了润滑剂对饲料的污染并实现旁通门零漏料。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">本项目已在国内广泛应用，如宜城双胞胎、广西华港等公司，至目前的生产考核中，各生产线运行正常，性能稳定，性能可靠，客户认为是理想的饲料制粒成型设备。<span>2015</span><span>年</span><span>5</span><span>月，经省级鉴定，达到国际领先水平。截止目前，该项目实现销售收入</span><span>30560</span><span>万元，利税</span><span>4158</span><span>万元，成为我公司的拳头产品，得到广大饲料企业的一致好评。</span></span>\r\n</p>\r\n<!--EndFragment-->', '3230', '2.5', '各栏目的计算依据：\r\n1）新增利润：为本项目涉及技术在企业应用产生的直接利润；2）新增税收：本项目涉及技术在企业应用产生的直接税收；3）创收外汇：本项目技术成果带来的直接外汇收入；4）节支总额：未使用本技术前企业所生产相同产品的成本与本技术应用后企业在能耗、设备维修、产品原料成本等各方面的差价；5）项目总投资额:包括科研总投入、生产线建设投资。\r\n社会效益：\r\n本项目研究的相关标准，发表的学术论文，申请的各项专利，提升我国饲料工艺与制粒设备的水平和行业科技水平。通过本项目的实施，每年为客户减少能源消耗70多万元，减少因设备堵机、停机造成的人工、时间成本30万元。\r\n序号	本项目实施前	本项目实施后	年度(万元)\r\n节能	吨电耗：7.5度/吨	电耗：6.27度/吨	1.23×60×1=73.8\r\n降本	设备维护人员从4人减少至2人 ，降低人员成本15万元\r\n注：电费按1元/度、年产量60万吨饲料厂\r\n', '<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">本项目研究的相关标准，发表的学术论文，申请的各项专利，提升我国饲料工艺与制粒设备的水平和行业科技水平。通过本项目的实施，每年为客户减少能源消耗<span>70</span><span>多万元，减少因设备堵机、停机造成的人工、时间成本</span><span>30</span><span>万元。</span></span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:12pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<!--EndFragment-->', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/QQ图片201512311046195.jpg', '2016', null, '7', '2', '11', null, '4', null, '1', '6', '2', '1', null, '32', '二等奖', '2016-01-11');
INSERT INTO `project` VALUES ('141', '172', '全价五谷杂粮饮料超细制浆核心技术与装备的研究', null, '4', 0x3434, '126,123,122,121', '2016-01-04', '2016-01-13', '3', null, '江苏省科技型企业创新资金项目“工业鲜湿豆渣全利用关键技术与成套装备产业化”（BC2010031）', '1', '3年', '江南大学', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/IMG_20151231_0948034.jpg', '<p style=\"background:#FFFFFF;text-align:left;text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">五谷杂粮饮品作为植物饮料类的一个新品种，符合饮料的发展趋势和消费趋势。早在2008年底，国家发改委公众营养与发展中心宣布在2009年启动“喝营养”工程，向公众推荐“喝健康水”、“喝水果”、“喝粮食”等饮食方式，并计划将“喝营养”列入国家公众营养改善项目中。</span><span style=\"font-family:宋体;font-size:12pt;\">五谷杂粮饮品，正是因为打破饮料只限水果的界限，改善膳食结构、平衡营养，符合现代生活的健康理念，所以受到了市场的欢迎</span><span style=\"font-family:宋体;font-size:12pt;\">，谷杂粮饮品的迅猛发展迎合了国家的推广政策。</span><span style=\"font-family:宋体;font-size:12pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">&nbsp;&nbsp;&nbsp;&nbsp;目前，国内一些企业已开发了这类产品，如惠尔康集团上市的谷粒谷力，维维集团推出谷动力一燕麦浓浆等。现阶段五谷杂粮饮品</span><span style=\"font-family:宋体;font-size:12pt;\">的生产是将</span><span style=\"font-family:宋体;font-size:12pt;\">原料清洗浸泡后磨浆</span><span style=\"font-family:宋体;font-size:12pt;\">，</span><span style=\"font-family:宋体;font-size:12pt;\">然后进行浆渣分离和过滤</span><span style=\"font-family:宋体;font-size:12pt;\">，再经调配、</span><span style=\"font-family:宋体;font-size:12pt;\">均质</span><span style=\"font-family:宋体;font-size:12pt;\">、</span><span style=\"font-family:宋体;font-size:12pt;\">灌</span><span style=\"font-family:宋体;font-size:12pt;\">装、杀菌等工艺处理而成。</span><span style=\"font-family:宋体;font-size:12pt;\">这种生产需要一道干磨、三道胶体磨和三道高压均质机的流程，工艺路线长、能耗极高。而且在五谷杂粮生产中把皮渣作为废弃物丢弃掉，使得杂粮中的膳食纤维成分利用率低，营养损失大，同时对环境产生污染，无法处置皮渣。所以，企业生产五谷杂粮饮品时的原料利用率较低、皮渣损耗大、设备能耗较高、磨损严重、污染大，急需通过先进的技术与设备进行技术改造。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">如何将五谷杂粮加工产生的皮渣进行有效处理并全部高效利用，研发生产高纤营养五谷杂粮饮品，并通过先进的技术简化整个生产工艺流程，达到节能减排的清洁化生产过程，是目前五谷杂粮饮品生产企业迫切需要解决的技术难题。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<!--EndFragment-->', '<p style=\"background:#FFFFFF;text-align:left;text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">五谷杂粮饮品作为植物饮料类的一个新品种，符合饮料的发展趋势和消费趋势。早在2008年底，国家发改委公众营养与发展中心宣布在2009年启动“喝营养”工程，向公众推荐“喝健康水”、“喝水果”、“喝粮食”等饮食方式，并计划将“喝营养”列入国家公众营养改善项目中。</span><span style=\"font-family:宋体;font-size:12pt;\">五谷杂粮饮品，正是因为打破饮料只限水果的界限，改善膳食结构、平衡营养，符合现代生活的健康理念，所以受到了市场的欢迎</span><span style=\"font-family:宋体;font-size:12pt;\">，谷杂粮饮品的迅猛发展迎合了国家的推广政策。</span><span style=\"font-family:宋体;font-size:12pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">&nbsp;&nbsp;&nbsp;&nbsp;目前，国内一些企业已开发了这类产品，如惠尔康集团上市的谷粒谷力，维维集团推出谷动力一燕麦浓浆等。现阶段五谷杂粮饮品</span><span style=\"font-family:宋体;font-size:12pt;\">的生产是将</span><span style=\"font-family:宋体;font-size:12pt;\">原料清洗浸泡后磨浆</span><span style=\"font-family:宋体;font-size:12pt;\">，</span><span style=\"font-family:宋体;font-size:12pt;\">然后进行浆渣分离和过滤</span><span style=\"font-family:宋体;font-size:12pt;\">，再经调配、</span><span style=\"font-family:宋体;font-size:12pt;\">均质</span><span style=\"font-family:宋体;font-size:12pt;\">、</span><span style=\"font-family:宋体;font-size:12pt;\">灌</span><span style=\"font-family:宋体;font-size:12pt;\">装、杀菌等工艺处理而成。</span><span style=\"font-family:宋体;font-size:12pt;\">这种生产需要一道干磨、三道胶体磨和三道高压均质机的流程，工艺路线长、能耗极高。而且在五谷杂粮生产中把皮渣作为废弃物丢弃掉，使得杂粮中的膳食纤维成分利用率低，营养损失大，同时对环境产生污染，无法处置皮渣。所以，企业生产五谷杂粮饮品时的原料利用率较低、皮渣损耗大、设备能耗较高、磨损严重、污染大，急需通过先进的技术与设备进行技术改造。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">如何将五谷杂粮加工产生的皮渣进行有效处理并全部高效利用，研发生产高纤营养五谷杂粮饮品，并通过先进的技术简化整个生产工艺流程，达到节能减排的清洁化生产过程，是目前五谷杂粮饮品生产企业迫切需要解决的技术难题。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<!--EndFragment-->', '<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">项目的核心技术创新点</span><span style=\"font-family:宋体;font-size:10.5pt;\">为</span><span style=\"font-family:宋体;font-size:10.5pt;\">：</span><span style=\"font-family:宋体;font-size:10.5pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">（1</span><span style=\"font-family:宋体;font-size:10.5pt;\">）</span><span style=\"font-family:宋体;font-size:10.5pt;\">研究五谷杂粮皮渣纤维湿态下的剪切</span><span style=\"font-family:宋体;font-size:10.5pt;\">断裂机理</span><span style=\"font-family:宋体;font-size:10.5pt;\">及高速剪切粉碎腔体内纤维流体的流动规律，建立其剪切粉碎的理论模型，</span><span style=\"font-family:宋体;font-size:10.5pt;\">为剪切粉碎装备的设计提供理论指导</span><span style=\"font-family:宋体;font-size:10.5pt;\">；</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">（2</span><span style=\"font-family:宋体;font-size:10.5pt;\">）</span><span style=\"font-family:宋体;font-size:10.5pt;\">研究剪切粉碎装备核心部件剪切粉碎头结构与</span><span style=\"font-family:宋体;font-size:10.5pt;\">转子系统的动态稳定性与可靠性</span><span style=\"font-family:宋体;font-size:10.5pt;\">，建立装备</span><span style=\"font-family:宋体;font-size:10.5pt;\">的动力学模型</span><span style=\"font-family:宋体;font-size:10.5pt;\">，</span><span style=\"font-family:宋体;font-size:10.5pt;\">研发新型</span><span style=\"font-family:宋体;font-size:10.5pt;\">湿</span><span style=\"font-family:宋体;font-size:10.5pt;\">法剪切</span><span style=\"font-family:宋体;font-size:10.5pt;\">粉碎</span><span style=\"font-family:宋体;font-size:10.5pt;\">装备；</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">（3</span><span style=\"font-family:宋体;font-size:10.5pt;\">）</span><span style=\"font-family:宋体;font-size:10.5pt;\">研究高纤维全营养五谷杂粮浓浆（皮渣100%全利用）</span><span style=\"font-family:宋体;font-size:10.5pt;\">的新型加工工艺</span><span style=\"font-family:宋体;font-size:10.5pt;\">技术，研</span><span style=\"font-family:宋体;font-size:10.5pt;\">发新型健康饮</span><span style=\"font-family:宋体;font-size:10.5pt;\">料</span><span style=\"font-family:宋体;font-size:10.5pt;\">；</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">（4</span><span style=\"font-family:宋体;font-size:10.5pt;\">）</span><span style=\"font-family:宋体;font-size:10.5pt;\">通过</span><span style=\"font-family:宋体;font-size:10.5pt;\">新技术的应用，研发</span><span style=\"font-family:宋体;font-size:10.5pt;\">五谷杂粮高效全利用</span><span style=\"font-family:宋体;font-size:10.5pt;\">的加工系统，实现无渣化、清洁化、高效化生产目标</span><span style=\"font-family:宋体;font-size:10.5pt;\">。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;这项技术的研究将为我国农产品加工提供具有完全自主知识产权的理论、方法与手段。</span>\r\n</p>\r\n<!--EndFragment-->', '<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">超细粉碎机理与设备结构图</span>\r\n</p>\r\n<!--EndFragment-->', '<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">江南大学与</span><span style=\"font-family:宋体;font-size:10.5pt;\">无锡轻大食品装备有限公司、江苏南方机电股份有限公司</span><span style=\"font-family:宋体;font-size:10.5pt;\">进行全方位紧密合作，在已有研发成果的基础上提出该项目的技术方案，有着很高的可行度，尤其是基于剪切原理的剪切超细粉碎技术应用性很强，关键装备日趋成熟，具有高剪切、纯切割、低摩擦、易调控特点的创新设备对谷物果蔬的超细粉碎效果尤为显著。全价五谷杂粮饮料超细制浆加工技术与成套系统的方案也是经过充分酝酿而推出来的。对五谷杂粮物料超细粉碎核心技术进行攻关，开发具有自主知识产权的皮渣全利用加工技术与成套加工系统，满足国内农产品深加工企业的需要，获得高品质的农产品加工产品，这是国内农产品加工企业的一致愿望，必定对农产品加工领域产生巨大的影响，这是农业科技创新工作的一项重大而紧迫的任务。</span><span style=\"font-family:宋体;font-size:10.5pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">本项目组研究的技术水平与国内外同类研究现状水平相比较，其优势在于：</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">(1)国内外尚缺乏对含高纤维的五谷杂粮皮渣物料超细粉碎的机理与技术研究，本项目组对此内容进行大量的机理分析与实验研究工作；</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">(2)国内外剪切设备主要用于化工原料的混合分散，尚未涉及对高纤维皮渣的粉碎，本项目组是针对五谷杂粮高效全利用技术所攻关研发的成套加工系统，并且是以超剪切技术为支撑的高效节能型系统，专门用于解决五谷杂粮超细粉碎与全利用技术的共性难题；</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;(3)项目组成员具有很好的工程实践与创新能力，是一支优秀的创业团队，有能力解决可能遇到的各种问题。</span>\r\n</p>\r\n<!--EndFragment-->', '<p style=\"text-indent:13.7pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">（<span>1</span><span>）总体思路</span></span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:10.3pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;项目所涉及的基于</span><span style=\"font-family:宋体;font-size:10.5pt;\">剪切粉碎的</span><span style=\"font-family:宋体;font-size:10.5pt;\">五谷杂粮高效全利用加工技术是在果蔬谷物纤维湿法超细粉碎这项创新技术基础上进行研究的课题，其“果蔬谷物纤维湿法超细粉碎”技术是针对果蔬谷物精深加工中存在湿态下微细粉碎困难而导致的原料利用率低、有效成分浪费、废弃物对环境污染严重等问题，而开展的高速湿法粉碎系统中的纤维剪切断裂机理及动力学行为研究。本项目基于果蔬谷物纤维湿法超细粉碎核心技术研究成果的基础上，而开展的五谷杂粮高效全利用加工技术研究与开发。通过理论、技术、装备、生产线全方面深入研究，实现五谷杂粮中高纤维皮渣的最佳高效粉碎的效果、开发高纤维全营养的五谷杂粮浓浆饮品、开发核心超细装备、建设五谷杂粮浓浆成套加工系统、建设产品的中试生产基地和推广产业化技术成果。本项目采用高剪切湿法粉碎技术，对高纤维皮渣进行超细粉碎与</span><span style=\"font-family:宋体;font-size:10.5pt;\">全利用</span><span style=\"font-family:宋体;font-size:10.5pt;\">制成高纤维全营养五谷杂粮浓浆的研究处于国内外研究前列。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:10.3pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">（2）技术研究内容</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:10.3pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">①</span><span style=\"font-family:宋体;font-size:10.5pt;\">皮渣超细粉碎机理研究</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:10.3pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;通过对五谷杂粮的结构微观尺度的观察，如图<span>1</span><span>所示，皮渣组织紧密，纤维具有复杂的网状结构，这使得皮渣具有良好的韧性，能够抵抗变形和吸收变形，皮渣纤维的结构特点使得鲜湿皮渣难以粉碎。如何利用机械的方法最有效地破坏皮渣纤维的组织结构，克服其良好的韧性、抵抗变形的能力和吸收变形能的能力等，就成为粉碎过程中的关键。</span></span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps72EE.tmp.jpg\" width=\"142\" height=\"137\" /></span><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;</span><span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps731E.tmp.jpg\" width=\"147\" height=\"137\" /></span><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps731F.tmp.png\" width=\"136\" height=\"137\" /><span style=\"font-family:楷体_GB2312;font-size:12pt;\">&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps732F.tmp.png\" width=\"135\" height=\"136\" /><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:left;text-indent:11.75pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">&nbsp;&nbsp;</span><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;图1&nbsp;&nbsp;玉米种皮结构照片（400倍）&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图2&nbsp;&nbsp;纤维的有效断裂方式</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:10.3pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;从能量利用的角度以及纤维微团变形速度张量分析的基础上，我们认为对皮渣纤维较有效的粉碎断裂方式是以纤维层间的分离断裂和长度方向上直接断裂这两种方式为主（图2），采用剪切作用方式。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">高纤维物料在高速旋转叶片带动物料与静止的刀片做相对运动，并在定转子缝隙内受到强烈的湍流剪切作用，利用高速旋转的转子的梳状齿与定子上的相应齿之间产生的剪切力作用，使物料瞬时受到强剪切作用力被渐次切割粉碎。由于叶轮的转速极高，物料在粉碎腔内只停留很短的时间，粉碎速度很快；并且每个刀片对物料的切割量一定，粉碎后的产品粒度均匀，产生热量很小，特别适用于纤维物料的超细粉碎。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:left;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7330.tmp.jpg\" width=\"150\" height=\"139\" /><span style=\"font-family:楷体_GB2312;font-size:12pt;\">&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7331.tmp.jpg\" width=\"128\" height=\"142\" /><span style=\"font-family:楷体_GB2312;font-size:12pt;\">&nbsp;&nbsp;&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7342.tmp.jpg\" width=\"214\" height=\"137\" /><span style=\"font-family:楷体_GB2312;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图3&nbsp;&nbsp;剪切粉碎原理图</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">高剪切湿法粉碎设备内的流体流场情况相当复杂，高速旋转的叶轮及转子使物料处于强烈的湍流状态，当物料通过定转子之间的间隙时又受到强烈的剪切作用，形成复杂的混合流场。用数值解法和有关流体力学软件(如Ansys软件)进行建模，分析出设备流场中的各类参数情况，研究周向和径向的速度流场。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7343.tmp.png\" width=\"139\" height=\"133\" /></span><span style=\"font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;</span><span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7353.tmp.png\" width=\"144\" height=\"136\" /></span><span style=\"font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7354.tmp.png\" width=\"141\" height=\"140\" /></span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图4&nbsp;&nbsp;周向流流场分布图</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7355.tmp.png\" width=\"187\" height=\"137\" /></span><span style=\"font-family:宋体;font-size:14pt;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-family:宋体;font-size:14pt;\">&nbsp;</span><span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7356.tmp.png\" width=\"181\" height=\"142\" /></span><span style=\"font-family:宋体;font-size:14pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图5&nbsp;&nbsp;叶槽内流速分布图</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;text-indent:21pt;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7357.tmp.jpg\" width=\"210\" height=\"179\" /><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7358.tmp.jpg\" width=\"227\" height=\"188\" /><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图6&nbsp;&nbsp;粉碎腔内颗粒轨迹图</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7369.tmp.jpg\" width=\"229\" height=\"163\" /><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps736A.tmp.jpg\" width=\"229\" height=\"163\" /><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图7&nbsp;&nbsp;粉碎腔内温度分布图</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps736B.tmp.png\" width=\"238\" height=\"169\" /><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps736C.tmp.png\" width=\"234\" height=\"166\" /><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图8&nbsp;&nbsp;转子中心处速度矢量图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图9&nbsp;&nbsp;转子中心处压强等值线图</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps736D.tmp.png\" width=\"243\" height=\"181\" /><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps737E.tmp.png\" width=\"216\" height=\"184\" /><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图10&nbsp;定</span><span style=\"font-family:宋体;font-size:10.5pt;\">-</span><span style=\"font-family:宋体;font-size:10.5pt;\">转子区域的速度等值线云图&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图11&nbsp;定转子区域的剪切应力等值线图</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps737F.tmp.png\" width=\"178\" height=\"192\" /><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7380.tmp.png\" width=\"188\" height=\"186\" /><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图12&nbsp;&nbsp;压力力等值线</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">②</span><span style=\"font-family:宋体;font-size:10.5pt;\">关键核心设备结构优化研究</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">对关键设备与加工系统进行结构参数、操作参数的研究和优化研究。高速旋转的定子与转子是整个设备的核心部分，其性能直接影响到粉碎效果及设备整体寿命。本项目在结构设计中，运用了高速运动状态下结构的动态优化设计方法。采用有限元分析方法，对转子的临界转速，高速运转的转子的压力、变形齿条的振动模态进行定性定量的理论分析计算，为转子的结构优化设计提供可靠的依据。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoBodyTextIndent3\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7381.tmp.png\" width=\"195\" height=\"158\" /><span style=\"font-family:宋体;font-size:8pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7382.tmp.png\" width=\"214\" height=\"160\" /><span style=\"font-family:楷体_GB2312;font-size:8pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图13&nbsp;&nbsp;高速转子的三维建模与网格划分图&nbsp;&nbsp;&nbsp;&nbsp;图14&nbsp;&nbsp;高速转子的应力分布图</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7392.tmp.png\" width=\"528\" height=\"251\" /><span style=\"font-family:楷体_GB2312;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">（a）ω</span><span style=\"font-family:宋体;font-size:10.5pt;\">=</span><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;</span><span style=\"font-family:宋体;font-size:10.5pt;\">4000rad/s</span><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（b）ω</span><span style=\"font-family:宋体;font-size:10.5pt;\">=</span><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;45</span><span style=\"font-family:宋体;font-size:10.5pt;\">00rad/s</span><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（c）ω</span><span style=\"font-family:宋体;font-size:10.5pt;\">=</span><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;6</span><span style=\"font-family:宋体;font-size:10.5pt;\">000rad/s</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图15&nbsp;&nbsp;不同转速下的庞卡莱图和轴心轨迹图</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span><span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7393.tmp.png\" width=\"554\" height=\"254\" /></span></span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">a）ω</span><span style=\"font-family:宋体;font-size:10.5pt;\">=</span><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;</span><span style=\"font-family:宋体;font-size:10.5pt;\">4000rad/s</span><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（b）ω</span><span style=\"font-family:宋体;font-size:10.5pt;\">=</span><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;45</span><span style=\"font-family:宋体;font-size:10.5pt;\">00rad/s</span><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;（c）ω</span><span style=\"font-family:宋体;font-size:10.5pt;\">=</span><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;6</span><span style=\"font-family:宋体;font-size:10.5pt;\">000rad/s</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图16&nbsp;&nbsp;不同转速下的波形图和频谱图</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoBodyTextIndent3\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7394.tmp.jpg\" width=\"224\" height=\"147\" /><span style=\"font-family:宋体;font-size:8pt;\">&nbsp;&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7395.tmp.jpg\" width=\"206\" height=\"147\" /><span style=\"font-family:楷体_GB2312;font-size:8pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7396.tmp.jpg\" width=\"216\" height=\"152\" /><span style=\"font-family:楷体_GB2312;font-size:12pt;\">&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73A7.tmp.png\" width=\"203\" height=\"151\" /><span style=\"font-family:楷体_GB2312;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图17&nbsp;&nbsp;高速转子轴系统的不同振动模态图</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73A8.tmp.jpg\" width=\"473\" height=\"174\" /><span style=\"font-family:楷体_GB2312;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73A9.tmp.jpg\" width=\"474\" height=\"173\" /><span style=\"font-family:楷体_GB2312;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73B9.tmp.jpg\" width=\"471\" height=\"174\" /><span style=\"font-family:楷体_GB2312;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73BA.tmp.jpg\" width=\"475\" height=\"174\" /><span style=\"font-family:楷体_GB2312;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图18&nbsp;&nbsp;不同结构的粉碎部件</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">③成套装备开发研究</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">本项目研发的五谷杂粮超细粉碎设备已达到如下指标：五谷杂粮粉碎后98%以上的粒度达到150目，物料处理量为2000～8000公斤/小时，电动机功率为7.5～18.5千瓦，定转子寿命大于4500小时。实验型与工业型粉碎设备如下：</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73BB.tmp.jpg\" width=\"480\" height=\"177\" /><span style=\"font-family:宋体;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73BC.tmp.jpg\" width=\"483\" height=\"177\" /><span style=\"font-family:宋体;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73CD.tmp.jpg\" width=\"480\" height=\"178\" /><span style=\"font-family:宋体;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73CE.tmp.jpg\" width=\"468\" height=\"174\" /><span style=\"font-family:宋体;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图19&nbsp;&nbsp;系列超细粉碎设备</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">中试与生产型成套制浆系统如下：</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73CF.tmp.jpg\" width=\"477\" height=\"177\" /><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73E0.tmp.jpg\" width=\"479\" height=\"177\" /><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73E1.tmp.jpg\" width=\"480\" height=\"178\" /><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73E2.tmp.png\" width=\"240\" height=\"157\" /><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73F2.tmp.png\" width=\"238\" height=\"159\" /><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73F3.tmp.jpg\" width=\"518\" height=\"192\" /><span style=\"font-family:楷体_GB2312;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图20&nbsp;&nbsp;湿法超细粉碎制浆系统</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;④五谷杂粮高效利用产业化应用研究</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:26.25pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">将五谷杂粮进行湿法超细粉碎后加工高纤维全营养浓浆饮品，进行工艺研究与产品感官评定；对浓浆饮品进行工业化生产研究，确定加工工艺，进行关键设备选型，搭建生产系统，并进行技术经济分析。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73F4.tmp.jpg\" width=\"632\" height=\"224\" /><span style=\"font-family:楷体_GB2312;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图21&nbsp;&nbsp;高纤维全营养五谷杂粮浓浆饮品生产系统图</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps73F5.tmp.png\" width=\"176\" height=\"117\" /><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7406.tmp.png\" width=\"176\" height=\"117\" /><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;</span><img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps7407.tmp.png\" width=\"178\" height=\"118\" /><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">图23&nbsp;&nbsp;参加展会</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">（3）实施效果</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">本项目的研究不仅解决了传统湿法粉碎设备（如胶体磨和砂磨等）难于将五谷杂粮原料中的软性皮渣纤维进行微细粉碎问题，而且降低了能耗，提高了产品的品质、优化了加工工艺、减少了粉尘污染、提高了产品得率以及降低了成本，开发</span><span style=\"font-family:宋体;font-size:10.5pt;\">出高纤维</span><span style=\"font-family:宋体;font-size:10.5pt;\">全营养五谷杂粮浓浆饮料</span><span style=\"font-family:宋体;font-size:10.5pt;\">。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;本项目在皮渣纤维超细粉碎机理研究、新型高效粉碎设备的关键部件优化研究及</span><span style=\"font-family:宋体;font-size:10.5pt;\">高纤维</span><span style=\"font-family:宋体;font-size:10.5pt;\">全营养五谷杂粮浓浆</span><span style=\"font-family:宋体;font-size:10.5pt;\">绿色加工生产技术与成套生产线</span><span style=\"font-family:宋体;font-size:10.5pt;\">等方面</span><span style=\"font-family:宋体;font-size:10.5pt;\">都取得了</span><span style=\"font-family:宋体;font-size:10.5pt;\">突破</span><span style=\"font-family:宋体;font-size:10.5pt;\">性</span><span style=\"font-family:宋体;font-size:10.5pt;\">的研究成果，为我</span><span style=\"font-family:宋体;font-size:10.5pt;\">国农产品精深加工领域及</span><span style=\"font-family:宋体;font-size:10.5pt;\">新型</span><span style=\"font-family:宋体;font-size:10.5pt;\">健康</span><span style=\"font-family:宋体;font-size:10.5pt;\">饮料的</span><span style=\"font-family:宋体;font-size:10.5pt;\">开发提供了强有力的技术支撑</span><span style=\"font-family:宋体;font-size:10.5pt;\">。</span>\r\n</p>\r\n<!--EndFragment-->', '<p style=\"text-align:left;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\"> </span><span style=\"font-family:宋体;font-size:10.5pt;\">本项目主要研究单位江南</span><span style=\"font-family:宋体;font-size:10.5pt;\">大学</span><span style=\"font-family:宋体;font-size:10.5pt;\">、无锡轻大食品装备有限公司与江苏东方名厨食品科技有限公司共同研发的系列高效湿法微细粉碎设备，无论是从经济效益还是社会效益方面都取得了很好的成效，为饮料加工企业以及农副产品的深加工众多企业提供了新的加工手段。本项目研究成果能广泛应用于农产品深加工和食品工程等领域，应用前景较为广泛。</span><span style=\"font-family:宋体;font-size:10.5pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;本项目所研发的设备共计销售了2</span><span style=\"font-family:宋体;font-size:10.5pt;\">8</span><span style=\"font-family:宋体;font-size:10.5pt;\">0台（套）系统,销售至如下企业：南京果果食品有限公司、长治市胖妞食品有限公司、盐城永源早餐工程有限公司、山西沁洲黄小米集团有限公司、福建中绿集团有限公司等。这些企业采用本项目组所研制的新设备进行生产加工，在节能降耗、提高产品品质、提高产量、降低成本、改善环境等许多方面获得了明显的经济效益和社会效益。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\"></span>\r\n</p>\r\n<!--EndFragment-->', '480', '3', '以早餐工程企业使用本项目技术来加工五谷杂粮浆为例，一般一家早餐工程企业每天处理600～1000kg五谷杂粮，每天生产2～3.3万袋五谷杂粮饮料产品。若按每天处理600kg料、每天生产2万袋饮料，每年生产300天。使用本项目推广的五谷杂粮皮渣全利用加工技术与成套系统，产品的产出率将提高1.3倍，产生的经济效益估算如下：\r\n	传统工艺	皮渣全利用新工艺	新增量\r\n1kg原料生产五谷杂粮浆量	10kg	13kg	3kg\r\n每年产量（300ml/袋）	600万袋	780万袋	180万袋\r\n每年产值（出厂价1元/袋）	600万元	780万元	180万元\r\n每年利润（0.2元/袋）	120万元	156万元	36万元\r\n此项目2012年推广至5家早餐工程企业，新增利润为180万元；2013年推广至10家早餐工程企业，新增利润为360万元；2014年推广至20家早餐工程及五谷杂粮饮料加工企业，新增利润为720万元；其经济效益十分可观。', '<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"font-family:宋体;font-size:10.5pt;\">本项目是基于所拥有的湿法超细粉碎核心技术与市场需求基础上所提出与实施，通过所研究的五谷杂粮高效全利用技术以及开发相应的成套系统，在清洁化与无渣化食品的创新加工方法方面进行技术进步，对农副产品的精深加工、农村农民的增值增效、食品企业节能减排技术的升级等均会产生重大影响。此项目将作为运用新技术来实现农产品精深加工过程的清洁化生产、运用新技术来开发新型健康食品以满足人们快节奏与健康生活市场需求的示范性工程。</span><span style=\"font-family:宋体;font-size:10.5pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;&nbsp;&nbsp;&nbsp;本项目的实施在如下三方面产生着积极的社会效益：1）五谷杂粮原料达到100％全利用，可使农产品原料得到高效增值利用，极大地节约了资源、减少了浪费，提高产品的附加值；2）对五谷杂粮皮渣这一天然膳食纤维进行全程利用，生产高</span><span style=\"font-family:宋体;font-size:10.5pt;\">纤维</span><span style=\"font-family:宋体;font-size:10.5pt;\">全营养五谷杂粮浓浆，为社会提供新型绿色高纤维饮料，有利于国民生活健康水平的提高；3）清洁化无渣化的绿色生产技术，减少了废弃物的排放，为企业绿色清洁化生产作出有效示范。故而，实施该项目，其社会效益将会十分明显。</span>\r\n</p>\r\n<!--EndFragment-->', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/QQ图片201512311046196.jpg', '2016', null, '9', '3', '11', null, '9', null, '2', '6', '4', '1', null, '29', '未得奖', '2016-01-11');
INSERT INTO `project` VALUES ('142', '172', '谷朊粉增值加工关键技术和装备研发及其产业化示范', null, '3', 0x3435, '114,112,109,102,101', '2013-01-08', '2016-01-13', '1', null, '“十二五”国家高技术研究发展计划项目“蛋白质生物转化及精制关键技术研究与开发”（2013AA102201）；国家科技部“863”探索项目“小麦蛋白源阿片肽的酶法制备及高效分离关键技术”（2008AA10Z312）；国家“十五”重大科技攻关项目“小麦深加工技术研究与开发”（2001BA501A04）', '0', null, '江南大学', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/IMG_20151231_0948035.jpg', '本项目属于农产品加工领域，具体细分属于粮食加工副产品精深加工技术领域。本项目以小麦湿法加工副产品——谷朊粉为主要原料，经过多年的研究，成功研发出小麦拉丝蛋白生产关键技术及装备、高谷氨酰胺肽的酶解制备技术、小麦抗氧化肽和阿片肽高效释放和富集技术以及小麦肽脱苦技术，并开发出具有市场竞争力的小麦谷氨酰胺肽粉产品、小麦拉丝蛋白产品及其成套加工装备、小麦抗氧化肽和阿片肽等高附加值新产品，主要研究内容包括以下4个方面：\r\n	1、以蛋白组织化度、质构分析、感官评价为指标，优化得到小麦拉丝蛋白的挤压系统参数和目标参数，探明了调质剂对拉丝蛋白产品品质的影响规律，最终获得NaOH（0.075%）、L-半胱氨酸（0.060%）、三聚磷酸钠（0.5%）具有较好地改善小麦拉丝蛋白品质的作用，并建成国内首条年产4000吨小麦拉丝蛋白生产示范线；\r\n	2、成功研制出生产小麦拉丝蛋白的专用成套装备，挤压机主机系统的螺杆直径包括：44、62、93、125、175mm；装机容量：20 ~ 600kW；每小时处理量150kg ~3000kg。其最大加工压力可达150 Bar，最高加工温度可达200℃，最大扭矩可达11.5 Nm/cm3；\r\n	3、以DABA为检测物，建立谷氨酰胺肽含量的UPLC检测方法，该方法最低检出限为0.2 ng/mL。采用添加半胱氨酸高效释放谷氨酰胺肽，处理后，产物中Gln含量提高了20%。从肽粉中分离并鉴定出4种谷氨酰胺肽，并鉴定出其序列，其中QQPDESQQ八肽中谷氨酰胺含量达60.94 g/100g；\r\n	4、建立了低频超声-酶解-膜超滤三位一体的小麦抗氧化肽和阿片肽的制备工艺和技术，建立了活性肽的脱盐、脱苦和精制工艺，并建成2条小麦活性肽生产线，生产的肽粉产品无明显苦味、灰分低于1.2%，分子量低于1000Da的可溶性肽的含量50%以上，从肽粉中分离鉴定出2种抗氧化肽：SR', '小麦是我国三大主要粮食作物之一，2012年小麦播种面积24400千公顷，总产1.175亿吨，均位居世界第一。谷朊粉是小麦淀粉加工的副产品，蛋白质含量在70-80%，具有低脂肪、零胆固醇、非转基因的特点，是优质植物蛋白源。我国谷朊粉资源丰富，我国产量达到12万吨左右，目前，国内谷朊粉90%以上都作为饲料用于养殖业，只有5%用于食品工业。主要是因为谷朊粉的溶解度小、凝胶特性差，在实际应用中难以满足食品加工的需要。随着市场上对小麦淀粉需求量的不断增加，谷朊粉的产量也持续增加。传统市场对小麦蛋白的需求饱和并囤积严重，价格快速下滑，一方面严重影响了小麦深加工企业的经济效益，另一方面造成了良好的食品资源浪费，因此研究开发以谷朊粉为基料的新型高值化产品，以拓宽其应用领域，开辟新的途径以使其能被充分利用、创造更高的经济价值显得颇为亟待。\r\n	食品挤压改性技术不仅可以极大地改善蛋白的加工特性，还可以丰富蛋白食品品种，改善产品组织状态和口感，而且占地少、操作简单、劳动强度低。目前，挤压技术在大豆基和花生基仿生肉制品等食品加工方面得到普遍应用，尤其是在大豆组织化蛋白方面已经实现了产业化。但由于谷朊粉结构复杂，其加工适性较差、加工难度大，其组织化深加工研发较少，对应的食品及食品基料开发严重滞后。另外，生物酶法也是植物蛋白改性常用的一种手段，通过酶解技术不仅可以显著改善植物蛋白的水溶性，还可以释放出大量短肽，而这些短肽一般都具有多种生理活性。小麦水溶性蛋白由于富含对人体和动物有益的活性肽和谷氨酰胺功能成分，国内外市场需求增长迅速，发展前景广阔。\r\n	本课题来源于“十二五”国家高技术研究发展计划（863计划）课题“蛋白质生物转化及精制关键技术研究与开发”（课题编号：2013AA102201）、国家高科技研究发展计划863探索项目“小麦蛋白源阿片肽的酶法制备及高效分离关键技术”（课题编号：2008A', '本项目具体的技术创新点汇总如下：\r\n（1）开发出适合小麦拉丝蛋白生产的专用挤压成套装备，挤压机主机具有高智能化、高灵活性、高自动化控制、高稳定性、适合高强度高组织化度、方便清洁等优点。并利用此装备并结合调质剂生产出高品质的小麦拉丝蛋白，解决小麦拉丝蛋白产品质量不稳定和组织化度低的行业共性难题。（申请并获得发明专利2项，授权1项，发表EI论文1篇，CSCD核心论文2篇，建立1条国内产能最大（年产4000吨）品质最优的小麦拉丝蛋白生产线）\r\n（2）建立了快速、准确测定肽中非氮端谷氨酰胺含量的方法，开发出高谷氨酰胺含量（谷氨酰胺含量&amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp;amp', '无', '谷朊粉由于其独特的蛋白结构，经挤压组织化后具有与肉类相似的纤维结构，可直接作为肉类替代品食用。且谷朊粉的蛋白含量高，氨基酸组成全面，营养价值高。因此，小麦拉丝蛋白是一种理想的肉类替代品。植物组织化蛋白(TVP)是以植物蛋白为原料，经挤压组织化后制备的一种具有肉类纤维结构的肉类替代品，品质不同的TVP价格可相差2~3倍。目前国内外市场上主要是以大豆蛋白为原料的组织化蛋白，而谷朊粉组织化后产品和大豆蛋白组织化产品相比具有的组织化度高、非转基因、无不良风味等优点，是生产高品质植物组织化蛋白的良好原料。但是谷朊粉组织化蛋白加工技术要求高，难度大，能够生产出高品质的组织化小麦蛋白的国内外企业非常少，目前主要有美国GMP公司生产出Wheatex系列组织化小麦蛋白。本项目通过长期研究解决了小麦蛋白组织化中各种技术难题，开发出高品质的植物组织化产品，并形成了自己的知识产权，获得国家技术发明专利，填补了国内市场空白，具有广阔市场前景。\r\n	食物蛋白源生物活性肽是现代营养学及食品学研究的热点，是一类极具发展前景的功能食品配料，成为市场和消费者关注的热点。我国的小麦活性肽生产厂家并不多，形成规模以上的生产企业较少，生产工艺比较简单，一般情况下都是采用相同的生产工艺，总体而言，近几年虽然我国的小麦活性肽的产量和质量都有了一定的提高，但是还不能满足国内的需求，特别是一些食品行业，对小麦活性肽的要求较高，每年都需要从美国、日本和欧洲进口大量的小麦水溶性蛋白和肽粉，来满足国内的需求。本项目通过对小麦面筋蛋白深加工研究，分别开发出高含量谷氨酰胺肽，抗氧化活性肽，阿片肽等具有生理活性产品。其中高纯度的谷氨酰胺含量达到60.94 g/100g，远高于市场同类产品20%谷氨酰胺含量产品，同时该法具有安全性高、生产条件温和、易于控制、工艺简单、成本相对低等优点，研究成果达到国内外先进水平，相关技术形成获得国家发', '<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;font-weight:bold;\">2<span>．详细科学技术内容</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;font-weight:bold;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\">1<span>、小麦拉丝蛋白的制备、品质改良关键技术研究及产业化示范</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">以蛋白组织化度、质构分析、感官评价为目标参数，研究了喂料转速、蒸汽压力和挤压机螺杆转速、喂料转速、机筒温度、物料水分等加工参数对小麦拉丝蛋白产品品质的影响，主要考察组织化蛋白的组织化度、质构特性、堆积密度、色泽等，探讨了影响拉丝蛋白组织化效果的内在因素，确定了关键评定指标；优化了双螺杆挤压程序可控挤压制备不同组织化度的小麦拉丝蛋白生产工艺，获取了最佳工艺参数和系统参数：螺杆长径比<span>20:1</span><span>，喂料速度：</span><span>150&nbsp;kg/h</span><span>，调制器用水温度：常温，挤压机</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">Ⅱ</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">区、</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">Ⅲ</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">区、</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">Ⅴ</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">区的温度分别为<span>155</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">℃</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">、<span>155</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">℃</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">、<span>175</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">℃</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">，物料含水量：<span>24.0%</span><span>（以物料</span><span>100%</span><span>计），螺杆转速：</span><span>400&nbsp;r/min</span><span>，模孔尺寸：</span><span>2&nbsp;mm×33&nbsp;mm</span><span>，谷朊粉质量分数</span><span>93.0%</span><span>，面粉质量分数：</span><span>7.0%</span><span>。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">筛选合适的助化剂和调质剂改善小麦拉丝蛋白品质，研究加水量、脂肪、淀粉、碱、盐、半胱氨酸、<span>ADA</span><span>对小麦拉丝蛋白产品质构特性和组织化效果的影响。适量的添加</span><span>NaOH</span><span>（</span><span>0.075%,&nbsp;w/w</span><span>）对小麦拉丝蛋白的品质起到改良的作用。谷朊粉添加</span><span>NaOH</span><span>挤压组织化时，溶解度增加，黏度下降，有助于减缓小麦面筋蛋白堵塞喂料口和挤压机的现象。系统参数表现为挤压机模头压力、扭矩、</span><span>SME</span><span>下降，拉丝蛋白的组织化度、弹性、咀嚼性力学、质构特性等因蛋白质</span><span>-</span><span>蛋白质交联作用的增加而增大，由于产品层与层之间空隙增加，小麦拉丝蛋白硬度降低，复水率升高。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">L-<span>半胱氨酸的添加使小麦拉丝蛋白组织化度、咀嚼度、硬度大大提高，使产品的口感与肉类更加接近。系统参数方面，</span><span>L-</span><span>半胱氨酸使挤压机模头压力、扭矩、</span><span>SEM</span><span>增加。由于</span><span>L-</span><span>半胱氨酸使拉丝蛋白层与层之间的空隙减少，因此小麦拉丝蛋白堆积密度增加，复水率下降。外观方面，添加</span><span>L-</span><span>半胱氨酸的拉丝蛋白复水后白度、光泽提高，最终确定</span><span>L-</span><span>半胱氨酸最适添加量为</span><span>0.06%</span><span>。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">谷朊粉挤压组织化过程中，有大量二硫键生成，非共价键几乎不变。维持小麦拉丝蛋白蛋白质之间的作用力主要是二硫键和非共价键的交互作用，以单一的非共价键和二硫键结合在一起的蛋白质仅占<span>12.81%</span><span>和</span><span>0.91%</span><span>。挤压组织化并未完全破坏谷朊粉的的二级结构，其中的</span><span>α-</span><span>螺旋、无规则卷曲、</span><span>β-</span><span>折叠向稳定的</span><span>β-</span><span>转角转变。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">添加<span>NaOH</span><span>、</span><span>L</span><span>半胱氨酸挤压组织化得到的小麦拉丝蛋白表面结构更为紧致，蛋白质在</span><span>SDS 2-ME</span><span>溶液中溶解度增加，游离巯基和半胱氨酸含量减少，</span><span>β-</span><span>折叠增加；</span><span>L-</span><span>半胱氨酸的添加还会促使拉丝蛋白单层厚度和层与层之间空隙减少。添加</span><span>ADA</span><span>后，</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">小麦拉丝蛋白</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">品质发生劣变，组织化度减小，表面出现空隙，分层现象减弱，<span>β-</span><span>折叠减少，但蛋白质在</span><span>SDS 2-ME</span><span>溶液中溶解度、游离巯基和半胱氨酸含量变化趋势与添加</span><span>L-</span><span>半胱氨酸相同。原因是在挤压机模头处增加</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">小麦拉丝蛋白</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">蛋白质分子间二硫键的定向交联可以改善</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">拉丝蛋白的</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">品质，但在挤压之前增加其交联反而会使品质劣变。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">又研究采用拉丝蛋白生产方便即食休闲食品，研发了</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">素肉丸</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">、素肉干、清水面筋、素肉罐头等高值化休闲产品。研究发现，</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">淀粉添加量在<span>10%~15%</span><span>时，既能将</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">小麦拉丝蛋白</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">胶粘在一起，又能使</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">拉丝蛋白</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">的性质更好的表现，添加淀粉超过<span>15%</span><span>时，</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">产品就</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">会因老化变硬、干裂。谷朊粉对素肉丸子的粘合能力强，持水好，但添加量高于<span>9%</span><span>时不易成型、易掩盖</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">拉丝蛋白</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">本身的特点。少量添加<span>SMC</span><span>即可使</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">拉丝蛋白</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">紧密粘合，且可以促进</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">产品</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">的弹性、多汁性，是一种优秀的粘合剂。</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">拉丝蛋白</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">的质构特性对</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">休闲产品</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">的品质影响较大，尤其是组织化度，与</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">休闲产品</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">的各项指标均呈显著性<span>(p&lt;0.05)</span><span>正相关，其次是弹性、咀嚼性和吸水性、硬度。与大豆组织蛋白相比，小麦</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">拉丝</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">蛋白制作的</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">休闲产品</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">无异味、弹性、咀嚼性好。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\">2<span>、小麦拉丝蛋白专用挤压装备开发和设计</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">开发</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">设计</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">组织化加工过程操控便捷，机筒的温度调节灵活可控，每一节筒体采用独立的温度控制单元进行加热或冷却，实现机筒中易损件的更换简单方便。挤压过程中水和蒸汽的添加由挤压机闭环电路控制。原料在调质器中进行预处理，调质器安装在一个可移动的基座上，拆装简单，清洁方便。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">切刀装置可多方向移动，使用过程中即使在操作过程中亦可对刀头进行更换，生产过程中可对切刀进行调整，从而实现了优质成品的连续化生产。可拆卸的液压螺杆挤压设备使螺杆的拆卸安全顺利。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">创新性开发的单层调质器，原料无需较长滞留时间。在调质器中，原料处于流化状态，与蒸汽或所添加液体均匀混合。原料经调质器后无须强制喂料可直接进入挤压机。调质器安装在可移动基座上，可以快速方便地连接到挤压机上。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">通过嵌入式耦合器连接控制系统和电源，使调质器轻松地从挤压机上拆卸及清洗。设计坚固耐用且易于操作的控制系统，实现快捷方便地设置操作参数，如喂料速度、螺杆转速、切刀速度等。安全电路避免了因使用不当导致的设备损坏，发生紧急情况时，挤压机会自动停机。设计可触摸屏控制系统或配备全自动的触摸屏控制系统，实现设计机械高度智能化。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">成功研制出适宜生产小麦拉丝蛋白的专用成套装备，挤压机主机系统的螺杆直径包括：<span>44</span><span>、</span><span>62</span><span>、</span><span>93</span><span>、</span><span>125</span><span>、</span><span>175mm</span><span>；装机容量：</span><span>20&nbsp;~&nbsp;600kW</span><span>；每小时处理量</span><span>150kg&nbsp;~3000kg</span><span>。其最大加工压力可达</span><span>150&nbsp;Bar</span><span>，最高加工温度可达</span><span>200</span><span>℃，最大扭矩可达</span><span>11.5&nbsp;Nm/cm3</span><span>，建成的示范线就是采用了自主设计研发的挤压装备，取得了较好的效果。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">3<span>、以谷朊粉为原料高效制备</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\">谷氨酰胺肽</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">关键技术研发</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\">3.1<span>、谷氨酰胺肽的</span><span>UPLC</span><span>检测方法建立及其酶解制备工艺优化研究</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">建立一种经<span>BTI</span><span>衍生、酸水解、</span><span>DNFB</span><span>柱前衍生的</span><span>UPLC</span><span>快速、准确测定肽中非氮端谷氨酰胺含量的方法。所建立方法中</span><span>DABA</span><span>的定量限为</span><span>0.4&nbsp;ng</span><span>，最低检出限为</span><span>0.2&nbsp;ng/mL</span><span>。经</span><span>Ala-Gln</span><span>、</span><span>Gly-Asn</span><span>、</span><span>β-</span><span>乳球蛋白、</span><span>α-</span><span>乳清蛋白、溶菌酶五种标准品检验得到方法回收率为（</span><span>93±2</span><span>）～（</span><span>98±3</span><span>）</span><span>%</span><span>。采用响应面法对酶解制备谷氨酰胺肽工艺进行优化，得到最佳制备工艺条件为</span><span>[S]=6&nbsp;g/100mL</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">，</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">t=1&nbsp;h</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">，</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">pH=7.5</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">，</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">T=55&nbsp;</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">℃</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">，</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">酶用量<span>0.033&nbsp;AU/g&nbsp;Protein</span><span>，在此条件下产物中</span><span>Gln</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">&nbsp;</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">%=15.85&nbsp;g/100g</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">，</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">DH=11.8%<span>，</span><span>PCL=8</span><span>个氨基酸，</span><span>Rprotein=83%</span><span>。该工艺与以往研究相比具有短时、低成本的特点。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">酶解小麦面筋蛋白制备谷氨酰胺肽过程中，水解度与肽中谷氨酰胺含量间不存在线性关系，因此水解度不能代替谷氨酰胺含量作为衡量谷氨酰胺肽制备的主要指标。谷氨酰胺肽与小麦面筋蛋白中氨基酸组成比例相似，其中<span>Glx</span><span>和</span><span>Pro</span><span>含量总和占蛋白质总量一半以上，</span><span>Glx</span><span>含量约占蛋白质总量的</span><span>1/2.5</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\">3.2<span>、促谷氨酰胺肽释放的面筋蛋白预处理方法及机理研究</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">微波、添加半胱氨酸及湿热法作为</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">酶解前处理方法，能够有效提高面筋蛋白的酶解产物中谷氨酰胺的含量，特别是添加半胱氨酸法，添加<span>0.2%</span><span>的半胱氨酸能够在酶解</span><span>1&nbsp;h</span><span>时间内使得产物肽中谷氨酰胺含量从</span><span>15.85g/100g&nbsp;</span><span>提高到</span><span>18.8g/100g</span><span>，提高幅度近</span><span>20%</span><span>，</span><span>Rprotein=83%</span><span>，更接近国内外报道水平，这对于谷氨酰胺肽工业化更为重要。干热处理作为一种新的前处理方式，能够极显著的提高小麦面筋蛋白水解度，然而对于谷氨酰胺肽含量的增益不大，建议在以水解度为指标的工艺中可以推广应用。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">为探讨各预处理方法对</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">酶解过程及产物肽中谷氨酰胺含量的影响，对前处理后</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">的显微结构、二级结构及巯基、二硫键、疏水度、水合作用及溶解性进行了分析，发现微波处理后</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">出现淀粉质纤维结构，蛋白片层经各预处理后都发生了不同程度的破裂；预处理方法对于蛋白二级结构的影响主要表现在<span>β</span><span>折叠结构含量的增大上；游离巯基与二硫键之间的转化在添加半胱氨酸处理时尤为显著；疏水度和水合作用经各处理后也发生了不同程度的变化。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">在获得</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">结构等信息基础上，采用<span>PLSR</span><span>法对预处理方法影响</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">碱性蛋白酶酶解进程和产物肽谷氨酰胺含量的机理进行了分析探讨，<span>PLSR</span><span>分析结果得出反映各预处理</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">结构信息的两个主成分，<span>PLSR</span><span>结果表明</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">在碱性蛋白酶酶解过程中的水解度与产物肽中谷氨酰胺含量与其二级结构中的分子间<span>β-</span><span>折叠、水合&nbsp;</span><span>β-</span><span>折叠、</span><span>1675&nbsp;cm-1</span><span>处</span><span>β-</span><span>折叠、总&nbsp;</span><span>β-</span><span>折叠、扩展结构、</span><span>α-</span><span>螺旋、</span><span>β-</span><span>转角结构含量和疏水度</span><span>HO</span><span>及游离巯基含量（</span><span>-SH</span><span>）具有较高相关性，相对而言与溶解度之间的相关性不是很大。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\">3.3<span>、谷氨酰胺肽的分离与结构初探及分离纯化产品理化性质与生理活性研究</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">谷氨酰胺肽粗品经超滤分级分离和大孔树脂疏水分离两步处理，能够将谷氨酰胺含量从<span>18.8&nbsp;g/100g</span><span>提高至</span><span>25.9&nbsp;g/100g</span><span>，达到与国内外研究成果相当水平，但回收率偏低为</span><span>8.5%</span><span>。离子交换色谱和凝胶色谱联合使用，最终将谷氨酰胺肽中谷氨酰胺含量提高至</span><span>29.8&nbsp;g/100g</span><span>，但是这种方法具有上样量局限性，且成本相对来说较高，对于大规模分离价廉的谷氨酰胺肽来说可能不合适，然而作为实验室规模提纯谷氨酰胺肽是可行的。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">采用<span>RP-HPLC</span><span>实现了谷氨酰胺肽混合物的最终分离，分离得到四个主要组分，分别经质谱结果分析得到四种肽序分别为：</span><span>LLEQRFLVDYL</span><span>、</span><span>QQPDESQQ</span><span>、</span><span>ENSPQSGGWNQT</span><span>、</span><span>CLEYDWMDEQSDS</span><span>。其中</span><span>QQPDESQQ</span><span>八肽中谷氨酰胺含量高达</span><span>60.94&nbsp;g/100g</span><span>。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">理化性质方面，<span>UF-E</span><span>在</span><span>pH&nbsp;2</span><span>～</span><span>12</span><span>范围内具有良好且稳定的溶解性，</span><span>NSI%</span><span>均在</span><span>80%</span><span>以上；当</span><span>UF-E</span><span>浓度介于</span><span>0</span><span>～</span><span>20&nbsp;g/100g</span><span>时其表观粘度基本恒定在</span><span>1&nbsp;mpa·s</span><span>左右；</span><span>DSC</span><span>表明</span><span>UF-E</span><span>的变性峰值温度为（</span><span>85±3</span><span>）</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">℃</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">；<span>UF-E</span><span>能够抵制体内消化酶系统的消化作用；在</span><span>50</span><span>～</span><span>90&nbsp;</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">℃</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">和<span>121&nbsp;</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">℃</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">、<span>30&nbsp;min</span><span>条件下，</span><span>UF-E</span><span>均具有良好稳定性。以抑制亚油酸自氧化和螯合亚铁离子分别作为电子转移和质子转移两种氧化模式的代表，对</span><span>UF-E</span><span>的抗氧化性进行综合考察，结果表明</span><span>UF-E</span><span>具有良好的亚油酸氧化抑制作用，同时螯合亚铁离子的</span><span>EC50</span><span>为&nbsp;</span><span>0.46&nbsp;mg/mL</span><span>。对游泳疲劳大鼠灌胃饲喂</span><span>UF-E</span><span>，并与游离</span><span>Gln</span><span>相比较，经分析大鼠多种器官中谷氨酰胺含量表明</span><span>UF-E</span><span>能够有效供给应激大鼠谷氨酰胺，且效果优于游离</span><span>Gln</span><span>；测定灌饲</span><span>UF-E</span><span>的游泳疲劳大鼠多项生理指标，包括游泳力竭时间、血液和肌肉中乳酸水平、血尿氮含量、肝</span><span>/</span><span>肌糖原含量、</span><span>SOD</span><span>酶活、</span><span>LDH</span><span>酶活力、</span><span>CK</span><span>酶活，与游泳对照组相比，谷氨酰胺肽具有抗运动疲劳作用，且效果优于游离</span><span>Gln</span><span>。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">采用市售且广泛报道的游离谷氨酰胺替代品<span>Ala-Gln</span><span>作为对照药品，对</span><span>UF-E</span><span>对鼠脾细胞、人胃癌细胞和大鼠淋巴瘤细胞的影响进行研究，&nbsp;</span><span>MTT</span><span>测定结果和倒置显微镜观察结果表明：</span><span>UF-E</span><span>具有促进大鼠脾细胞增殖的作用，当</span><span>UF-E</span><span>浓度为</span><span>2&nbsp;mmol&nbsp;Gln/L</span><span>时，增殖率最高达</span><span>575%</span><span>；</span><span>UF-E</span><span>对人胃癌细胞的抑制作用呈显著的剂量效应关系，当浓度为</span><span>2&nbsp;mmol&nbsp;Gln/L</span><span>时，抑瘤率最高为</span><span>30%</span><span>，倒置显微镜下能够观察到明显的胃癌细胞凋亡现象；</span><span>UF-E</span><span>对小鼠淋巴瘤</span><span>YAC-1</span><span>细胞具有更显著的抑制作用且呈现剂量效应关系，</span><span>2&nbsp;mmol&nbsp;Gln/L</span><span>时抑瘤率最高可达</span><span>80%</span><span>；而对照组</span><span>Ala-Gln</span><span>对人胃癌细胞和</span><span>YAC-1</span><span>都具有一定抑制作用，但剂量效应不明显。细胞实验初步说明</span><span>UF-E</span><span>对正常细胞和癌细胞的作用具有一定选择性。此外，</span><span>UF-E</span><span>组分之一的</span><span>QQPDESQQ</span><span>八肽对人胃癌细胞也具有显著的剂量效应抑制作用。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">结合理化性质和体内、体外活性实验结果表明<span>UF-E</span><span>具有优于游离谷氨酰胺的稳定性，是游离谷氨酰胺的稳定化载体，具有供给应激机体谷氨酰胺和抗疲劳功效，可以作为游离谷氨酰胺的替代品。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">4<span>、以谷朊粉为原料高效制备阿片肽和抗氧化肽关键技术研发</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\">4.1</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\">酶解物的阿片活性及其镇痛药效研究</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">采用豚鼠回肠离体检定法对不同蛋白酶水解</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">制备的酶解物的阿片活性进行了测定，结果表明，由碱性蛋白酶、胃酶、胃酶和胰酶复合水解制备的三种</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">酶解物（<span>AWGH</span><span>、</span><span>PWGH</span><span>和</span><span>PPWGH</span><span>）具有较好的阿片活性，其</span><span>IC50</span><span>值分别为</span><span>1.21±0.25</span><span>、</span><span>1.57±0.21</span><span>和</span><span>1.29±0.38&nbsp;mg</span><span>蛋白</span><span>/mL</span><span>。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">采用<span>NG108-15</span><span>细胞生物学检定法对</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">酶解物的阿片活性进行研究，结果发现，仅有<span>AWGH</span><span>和</span><span>PWGH</span><span>的产物具备较好的阿片活性，并且</span><span>AWGH</span><span>对腺苷酸环化酶的活性具有刺激作用，而</span><span>PWGH</span><span>则对</span><span>AC</span><span>的活性具有抑制作用，其</span><span>AC</span><span>抑制率为</span><span>39.66</span><span>％。</span><span>PPWGH</span><span>的复合酶解产物的阿片活性较高，其</span><span>AC</span><span>抑制率达到</span><span>50.13</span><span>％。因此，</span><span>AWGH</span><span>、</span><span>PWGH</span><span>和</span><span>PPWGH</span><span>酶解物中均含有可以与</span><span>μ</span><span>受体和</span><span>δ</span><span>阿片受体作用的阿片肽类物质。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">采用小鼠热板法和小鼠醋酸扭体法对由不同</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">酶解物的镇痛活性进行了测定。结果表明，<span>AWGH</span><span>、</span><span>PWGH</span><span>和</span><span>PPWGH</span><span>具有较好的镇痛作用。在小鼠热板法实验中，其痛阈提高百分率分别为</span><span>77.78±13.82</span><span>％、</span><span>81.22±9.69</span><span>％和</span><span>79.78±22.77</span><span>％；在小鼠醋酸扭体实验中，其扭体抑制率分别为</span><span>38.25±2.98</span><span>％、</span><span>57.82±3.04</span><span>％和</span><span>52.43±3.87</span><span>％。整体动物实验与离体实验结果基本一致</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\">4.2</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\">源阿片肽的制备</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">采用强酸型阳离子交换树脂<span>732</span><span>和强碱型阴离子交换树脂</span><span>717</span><span>对</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">酶解物进行脱盐处理，氮回收率和脱盐率较高，且不会造成阿片活性的损失，是一种可行的产品精制方案。采用超滤<span>(MWCO&nbsp;3000)</span><span>处理，发现阿片活性肽主要集中于</span><span>MWCO&lt;3000</span><span>的范围内，且超滤处理可以提高水解物的阿片活性。两种酶解物的超滤透过物的阿片活性均有了较大程度的提高。采用高效液相色谱对</span><span>AWGH</span><span>和</span><span>PPWGH</span><span>的相对分子质量分布研究发现，其相对分子质量在</span><span>2000&nbsp;Da</span><span>以下的组分占多数，并且</span><span>AWGH</span><span>中肽组分的分子量较</span><span>PPWGH</span><span>要更小一些。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">小麦面筋蛋白酶解物<span>AWGH</span><span>和</span><span>PPWGH</span><span>经过离子交换脱盐处理和超滤处理后，所得</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">源阿片肽蛋白质含量在<span>90</span><span>％以上，灰分含量在</span><span>1.5</span><span>％左右，且经处理后，</span><span>AWGH</span><span>和</span><span>PPWGH</span><span>的</span><span>IC50</span><span>值分别约减小至处理前的</span><span>1/2</span><span>和</span><span>1/3</span><span>。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\">4.3</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\">源阿片肽的分离纯化及结构鉴定</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">经过凝胶过滤色谱、半制备<span>RP-HPLC</span><span>和</span><span>RP-HPLC</span><span>分离纯化，从</span><span>AWGH</span><span>中得到一个具有较强阿片活性的组分</span><span>AWGH-C14-1</span><span>，从</span><span>PPWGH</span><span>中得到两个具有较强阿片活性的组分</span><span>PPWGH-&nbsp;c4-1</span><span>和</span><span>PPWGH-&nbsp;c10-2</span><span>，</span><span>RP-HPLC</span><span>分析为单一峰。离体豚鼠回肠实验表明，</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">源阿片肽<span>AWGH-C14-1</span><span>可抑制离体豚鼠回肠的收缩，</span><span>IC50</span><span>值为</span><span>0.062&nbsp;mg</span><span>蛋白</span><span>/mL</span><span>；</span><span>NG108-15</span><span>细胞生物学鉴定方法实验表明，</span><span>AWGH-C14-1</span><span>可以刺激</span><span>AC</span><span>活性，引起胞内</span><span>cAMP</span><span>含量的增大，且该效应可被纳洛酮所逆转。离体豚鼠回肠实验表明，</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">源阿片肽<span>PPWGH-c4-1</span><span>和</span><span>PPWGH-&nbsp;c10-2</span><span>可抑制离体豚鼠回肠的收缩，</span><span>IC50</span><span>值分别为</span><span>0.050</span><span>和</span><span>0.029&nbsp;mg</span><span>蛋白</span><span>/mL</span><span>；</span><span>NG108-15</span><span>细胞生物学鉴定方法实验表明，</span><span>PPWGH-c4-1</span><span>和</span><span>PPWGH-&nbsp;c10-2</span><span>均可以抑制</span><span>AC</span><span>活性，引起胞内</span><span>cAMP</span><span>含量的减小，且该效应可被纳洛酮所逆转，其</span><span>AC</span><span>抑制率分别为</span><span>81.03±0.42</span><span>％和</span><span>83.29±0.38</span><span>％。采用</span><span>MALDI-TOF-MS/MS</span><span>分析鉴定</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">谷朊粉</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">源阿片肽<span>AWGHs-C8-1</span><span>、</span><span>PPWGH-c4-1</span><span>和</span><span>PPWGH-c10-2</span><span>氨基酸序列分别为</span><span>LSPHK</span><span>、</span><span>GCKSPH</span><span>和</span><span>APSAPT</span><span>，且其</span><span>IC50</span><span>值分别为</span><span>106.68</span><span>、</span><span>79.61</span><span>和</span><span>53.40&nbsp;μM</span><span>。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\">4.4<span>超声波辅助酶解谷朊粉制备抗氧化肽</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">研究碱性蛋白酶酶解谷朊粉制备抗氧化肽，在酶解过程中采用超声波作为辅助手段，以体外抗氧化活性（亚铁离子螯合能力、还原能力、对亚油酸自氧化抑制能力、<span>ABTS</span><span>自由基清除能力）作为指标，在单因素的基础上，通过正交实验，确定出最佳酶解条件：在最大功率（</span><span>400w</span><span>）的条件下，低频（</span><span>25kHz</span><span>）酶解</span><span>30min</span><span>，酶解温度</span><span>50</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">℃</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">，<span>pH9.0</span><span>。在最佳酶解条件下水解度达到</span><span>9.51%</span><span>，亚铁离子螯合能力</span><span>IC50</span><span>值为</span><span>0.513mg/mL</span><span>，当蛋白质含量为</span><span>2.4mg/mL</span><span>时还原能力为</span><span>0.385</span><span>，亚油酸抑制能力效果显著，</span><span>ABTS ·</span><span>自由基清除能力在蛋白质浓度为</span><span>2.4mg/mL</span><span>时相当于</span><span>1.40mmol/L&nbsp;Trolox</span><span>。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">进而对谷朊粉酶解产物（<span>WGH</span><span>）进行超滤处理，采用不同截留分子量的超滤膜对谷朊粉酶解产物进行初步分离富集，并通过测定各级多肽的亚铁离子螯合能力、对亚油酸的自氧化抑制能力以及对</span><span>ABTS</span><span>自由基的清除能力来评价其体外抗氧化能力。结果表明：抗氧化能力由弱到强依次为：大于</span><span>10kDa&lt;10-5kDa&lt;</span><span>小于</span><span>5kDa</span><span>。对于分子量在</span><span>5kDa</span><span>以下的组分，当浓度为</span><span>0.2</span><span>和</span><span>0.4mg/mL</span><span>时，亚铁离子螯合能力是超滤前样品的</span><span>2</span><span>倍左右；对亚油酸自氧化的抑制能力在</span><span>36h</span><span>后比其它分子量片段的组分效果明显；而当浓度为</span><span>4mg/mL</span><span>时，</span><span>TEAC</span><span>值达到</span><span>1.45mmol/L&nbsp;Trolox</span><span>；并且由高效液相色谱法对其相对分子质量进行分析发现，小分子肽占了绝大部分，推测抗氧化肽主要集中在</span><span>2kDa</span><span>以下。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">进一步验证了<span>WGH</span><span>及超滤产品（分子量小于</span><span>5kDa</span><span>以下的片段）（</span><span>WGHU-5</span><span>）的抗氧化性，选用</span><span>D-</span><span>半乳糖致衰老模型，对昆明种小鼠进行了实验，以小鼠各组织（血浆、心脏、脑、肝脏、肾）中</span><span>MDA</span><span>含量、</span><span>GSH-PX</span><span>活性、</span><span>SOD</span><span>活性和</span><span>T-AOC</span><span>作为体内抗氧化指标，结果表明，</span><span>WGH</span><span>和</span><span>WGHU-5</span><span>都能够提高</span><span>D-</span><span>半乳糖致衰老模型中小鼠血浆、心脏、脑、肝脏和肾组织的</span><span>SOD</span><span>、</span><span>T-AOC</span><span>、</span><span>GSH-PX</span><span>的活性，而降低其体内</span><span>MDA</span><span>含量，有的可以超过正常组水平，</span><span>WGHU-5</span><span>效果尤为显著（</span><span>P&lt;0.01</span><span>），说明谷朊粉酶解物具有明显的防衰老抗氧化作用。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">采用大孔吸附树脂（<span>DA201-C</span><span>）对</span><span>WGHU-5</span><span>进行除盐并分级。静态吸附实验发现大孔树脂对小麦蛋白抗氧化肽吸附很快，在</span><span>30min</span><span>时基本达到吸附平衡，</span><span>75%</span><span>乙醇静态解吸率在</span><span>30min</span><span>时可以达到</span><span>70%</span><span>。采用乙醇梯度洗脱效果良好，可以将</span><span>WGHU-5</span><span>很好的分级分离。乙醇梯度洗脱组分的疏水性值从</span><span>25%</span><span>组分的</span><span>5.06KJ/mol</span><span>到</span><span>100%</span><span>组分的</span><span>6.46KJ/mol</span><span>，而且各组分的抗氧化能力随着疏水性的增加先增加后减小。</span><span>75%</span><span>乙醇洗脱组分的抗氧化能力最高，在浓度为</span><span>0.4mg/mL</span><span>时，亚铁离子螯合能力达到</span><span>84.13%</span><span>，</span><span>TEAC</span><span>值为</span><span>0.36mmol/L&nbsp;Trolox</span><span>。</span><span>25%</span><span>到</span><span>100%</span><span>四个不同浓度乙醇洗脱组分的除盐率分别达到</span><span>67.84%</span><span>、</span><span>75.96%</span><span>、</span><span>93.56%</span><span>、</span><span>95.91%</span><span>。由此说明利用不同浓度的乙醇对小麦蛋白抗氧化肽按疏水性进行初步分离纯化是完全可行的。</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">采用<span>MALDI-TOF-TOF&nbsp;MS</span><span>法测得谷朊粉抗氧化活性肽中两个主要成分的相对相对分子质量为</span><span>951</span><span>和</span><span>1349Da</span><span>。结合</span><span>TOF&nbsp;MS/MS</span><span>串联质谱得出：</span><span>951Da</span><span>肽段由</span><span>8</span><span>个氨基酸组成，其连接顺序为</span><span>Ser-Arg-Tyr-Asp-Ala-Ile-Arg-Ala</span><span>（简称为</span><span>SRYDAIRA</span><span>）；</span><span>1349Da</span><span>肽段由</span><span>12</span><span>个氨基酸组成，其连接顺序为</span><span>Tyr-Pro-Leu-Glu-Ala-Ala-Gly-Asp-Thr-&nbsp;Lys-Arg-Glu</span><span>（简称为</span><span>YPLEAAGDTKRE</span><span>）。</span></span>\r\n</p>\r\n<!--EndFragment-->', '<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">经过课题组多年不断的研究，已经基本完成了国家级项目合同书规定的研究内容，并取得了多项研究成果。申请国家发明专利<span>5</span><span>项，获得</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">国家发明专利<span>3</span><span>项，发表学术论文</span><span>2</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">0</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">篇，其中</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">7</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">篇被<span>SCI</span><span>收录，该成果已在安徽瑞福祥食品有限公司</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">、</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">润禾粉业南通有限公司</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">、布勒（无锡）商业有限公司</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">等小麦深加工龙头企业得到推广应用，建成<span>3</span><span>条生产线，形成了</span><span>6800</span><span>万元的投资、</span></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">生产和销售额达共计<span>3.892</span><span>亿元</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">，实现利</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">润<span>9840</span></span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">万</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">元</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">。</span><span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<!--EndFragment-->', '6800', '1.5', '无锡布勒机械制造公司未布勒（无锡）商业有限公司子公司，2012年实现新增利润600万元，实现税收160.8万元；2013年无锡布勒机械制造公司实现新增利润600万元，实现税收160.8万元，润禾粉业南通有限公司实现新增利润520万元，实现税收190万元，安徽瑞福祥食品有限公司实现新增利润3220万元，实现新增税收1826万元；2014年无锡布勒机械制造公司实现新增利润650万元，实现税收170万元，润禾粉业南通有限公司实现新增利润750万元，实现税收230万元，安徽瑞福祥食品有限公司实现新增利润3500万元，实现新增税收1960万元。详细信息见各单位应用和效益证明。', '<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">本项目的实施，形成了具有自主知识产权的小麦面筋蛋白深加工的关键技术，增加了小麦面筋蛋白利用效率，开发了市场认可的小麦蛋白产品，大大提高了小麦面筋蛋白的附加值，提高了企业经济效益，有效促进了小麦深加工产业的发展。同时本项目的实施为当地增加<span>90</span><span>多个就业机会，对缓解了当地劳动力就业不足贡献一份力量。本项目实施无废水，废弃物排放，不会对坏境造成危害。</span></span>\r\n</p>\r\n<!--EndFragment-->', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/QQ图片201512311046197.jpg', '2016', null, '8', '3', '11', null, '7', null, '2', '6', '4', '1', null, '33', '三等奖', '2016-01-12');
INSERT INTO `project` VALUES ('143', '168', '大型气压全自动砻谷机的研制', null, '1', 0x3433, '126,125,124,123', '2015-01-05', '2016-01-27', '1', null, '国家“十二五”科技支撑计划项目《粮食绿色加工大型装备的研制与集成》（编号：2012BAD34B06） 本项目为其子任务之一', '0', null, '河南工业大学', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/QQ图片201512311046194.jpg', '（项目所属学科领域、主要内容、特点及应用推广情况）\r\n					（一）所属科学技术领域\r\n					本项目成果的应用领域为粮食加工装备领域。\r\n					（二）项目主要内容\r\n					1、研究砻谷机的脱壳机理，优化工艺参数\r\n					（1）依据基础试验数据，对胶辊砻谷机进行工作参数与工艺效果评定指标之间的单因素分析；（2）多因素、单指标正交试验优化分析，并借助矩阵分析法解决了多指标情况下工作参数配置的优化选择问题；（3）建立了脱壳率、产量、糙碎率和胶耗等主要因素与工作参数之间的数学模型；（4）分析了满足脱壳率、产量、糙碎率和胶耗要求的最佳工作参数组合；（5）对模型进行了试验验证。\r\n					2、研究新型砻谷机双变频电机驱动技术\r\n					针对目前砻谷机驱动装置存在的问题，本项目提出一种胶辊砻谷机的双变频电机驱动装置。详细研究了双变频电机驱动装置的结构组成；针对砻谷机合辊工作时存在的功率封闭问题，提出了变频电机处于发电状态时的能量回收方法，并进行了相关实验验证。\r\n					3、研究砻谷机自动控制技术\r\n					运用动态测试技术与自动控制技术，设计开发胶辊砻谷机的双变频电机驱动与控制系统，实现对大型气压胶辊砻谷机运行状态的自动控制。控制系统主要包括自检模块、系统监控模块、运行参数控制模块、系统调试模块、系统信息模块等。实现了自动松、紧辊，自动流量控制，自动调节辊压，自动启闭料门，超负荷报警与自动松辊等功能。\r\n					4、研制大型气压全自动砻谷机\r\n					针对目前我国胶辊砻谷机存在的主要问题，综合运用现代设计方法、结构优化方法、动态测试技术与自动控制技术等，研制了大', '《大型气压全自动砻谷机的研制》是国家“十二五”科技支撑计划项目《粮食绿色加工大型装备的研制与集成》的任务之一，项目编号为：2012BAD34B06，由河南工业大学和湖北永祥粮食机械有限公司共同研制开发。\r\n	稻谷加工作为粮油食品加工业中的重要组成部分，对人们生活所起的作用不言而喻。稻谷脱壳工艺是稻谷加工工艺中最主要的环节之一，胶辊砻谷机是稻谷加工中选用较多的稻谷脱壳设备，在稻谷加工过程中有着举足轻重的地位。\r\n	虽然在稻谷加工技术上我国和发达国家的差距在不断缩短，但砻谷机装备的整体水平与发达国家相比还存在着差距，仍处于中低端技术水平。具体表现为：1）工作稳定性差、脱壳率低、单机产量小；2）工作效率低、能耗高；3）装备可靠性差，自动化与智能化程度低；4）大型化节能加工装备缺乏；5）对设备卫生安全方面的考虑少，要求低。由于上述问题的客观存在，导致我国砻谷机装备的生产仍以中小型为主，高端产品市场的竞争力不强，缺少具有自主知识产权的产品和品牌产品，大型成套设备的自主化率低，关键技术装备不得不依赖高价购买进口产品或在华外商独资企业的产品，使得在大型、特大型粮油加工企业建设中，外资企业的生产线全部采用进口设备，或主机采用进口设备，采用国产成套设备较少。\r\n	本项目的研究目标正是为了满足我国稻米加工大型化、现代化的要求，针对我国胶辊砻谷机技术水平落后、自动化水平低等问题，运用现代设计方法与自动控制技术，研究胶辊砻谷机的双变频电机驱动与控制技术，并基于该技术分析工作参数对工艺效果的影响；通过理论分析计算和实验研究，优化主要控制与工艺参数，优化胶辊砻谷机的机械结构，开发出具有国际先进水平的大型高效、大产量、全自动的新型气压砻谷设备，提升我国稻谷加工业的技术和现代化水平，提高稻米成品的质量和出率，提高生产效率，节能降耗，实现清洁生产，保证食品卫生安全，使之达到最优工艺效果，为我国稻谷加工', '1）根据砻谷机脱壳机理的研究，优化了砻谷机的工艺参数\r\n	对胶辊砻谷机的主要性能参数进行了优化研究，得到最佳工作参数：辊间压力5.5-7.0 kg/cm，快辊线速16-18.5 m/s，快慢辊线速差2.7-3.2 m/s。从而使砻谷工艺达到最佳效果。\r\n	2）设计了新型砻谷机双变频电机驱动装置\r\n	本项目提出采用双变频电机的方式对砻谷机进行驱动，突破了传统的齿轮变速传动方式，整体结构简单，降低了机器的振动与噪音，提高了传动效率，降低了机器的故障率，延长了机器使用时间。该技术已经申请了国家专利。\r\n	3）设计开发了砻谷机自动控制系统\r\n	运用现代控制技术与自动测试方法，设计了“触摸屏 可编程控制器 变频器 传感器 变频电机”的自动控制体系，实现了对胶辊砻谷机运行状态与工作参数的自动控制。\r\n	4）研制了大型气压全自动砻谷机\r\n	实现了处理量8～9吨/小时，脱壳率达92%，糙碎率', '无', '5．与当前国内外同类研究、同类技术的综合比较\r\n					与当前国内外同类技术相比，本项目研究成果的先进性体现如下：\r\n					1）砻谷机工艺参数优化研究\r\n					目前，大多数企业均采用经验法和类比法来确定砻谷机的实际工艺参数，对此缺乏系统性的理论研究和科学依据。本项目通过理论分析和试验研究，对胶辊砻谷机的主要性能参数进行了优化研究，得到最佳工艺参数：辊间压力5.5-7.0 kg/cm，快辊线速16-18.5 m/s，快慢辊线速差2.7-3.2 m/s。实践证明，当砻谷机按照上述工艺参数工作时，能够使砻谷工艺达到最佳效果。该项研究为胶辊砻谷机的设计与使用提供了坚实的理论基础。\r\n					2）新型砻谷机双变频电机驱动技术及装置\r\n					目前国内外大多数砻谷机的驱动方式是：采用齿轮变速箱与双皮带相结合或单根皮带关联传动的方式，普遍存在结构复杂、噪声大、故障率高、漏油、污染粮食等问题。本项目提出了新型的砻谷机双变频电机驱动技术及装置。该装置省去了传统的齿轮变速箱，整体结构简单，降低了机器的振动与噪音，提高了传动效率，解决了故障率高、漏油、污染粮食等问题，实现了砻谷机节能降耗、清洁环保的目标。该技术已经申请了国家专利。\r\n					3）砻谷机自动控制系统\r\n					目前，大多数胶辊砻谷机的控制方式普遍落后，存在电器元件多、器件不稳定、线路繁杂、连线不可靠、故障率高、可靠性差、维修查找麻烦等问题。本项目运用现代控制技术与自动测试方法，构建了“触摸屏 可编程控制器 变频器 传感器 变频电机”的自动控制体系，实现了对大型气压胶辊砻谷机运行状态与工作参数的自动控制。本项目研发的控制系统融入了砻谷机最佳工艺参数和新型双电机驱动装置的研究成果，因而其技术先', '<p style=\"text-indent:24.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\">1<span>）砻谷机脱壳机理的研究和工艺参数的优化</span></span><span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">胶辊砻谷机工作参数与工艺效果之间是一种相互制约的关系，若改变其中任何一个参数，都会导致工艺效果中的某一指标发生变化。所以，工作参数的选择和配置是影响砻谷工艺效果的重要因素。常用的胶辊砻谷机工艺参数主要包括：辊间压力、进机流量、快辊线速、慢辊线速以及线速差等。反映胶辊砻谷机工艺效果优劣的指标主要是脱壳率、破碎率、产量、胶耗和电耗等。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">传统的胶辊砻谷机设计与制造多采用类比法、经验法，即据已有参数和经验数据使用分析对比的方法进行设计，缺乏深入系统的参数试验研究与优化。因此，要使胶辊砻谷机工艺效果中的各项指标达到最佳状态，必需合理地优化设计与配置工作参数。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">本项目针对胶辊砻谷机的主要性能参数进行了系列优化设计研究，主要包括：（<span>1</span><span>）依据基础试验数据，进行胶辊砻谷机工作参数与工艺效果评定指标之间的单因素分析，得出每个工作参数的最佳值及其优选范围，并提出相应的综合试验设计方案；（</span><span>2</span><span>）根据单因素试验结果，进行多因素、单指标正交试验优化分析；（</span><span>3</span><span>）借助于矩阵分析法进行多因素、多指标综合优化分析，解决多指标情况下工作参数配置的优化选择问题。（</span><span>4</span><span>）通过采用响应面优化方法和</span><span>Design-Expert</span><span>软件，进行试验设计和数据处理分析，分别得到脱壳率、产量、糙碎率和胶耗对</span><span>4</span><span>个因素的二次多项回归数学模型；（</span><span>5</span><span>）利用</span><span>Design-Expert</span><span>软件优化分析得出能满足脱壳率、产量、糙碎率和胶耗要求的最佳工作参数的组合；（</span><span>6</span><span>）对优化的参数组合进行试验验证，通过验证效果分析获得工作参数组合优化的可靠性。本研究工作旨在为今后研究设计胶辊砻谷机的性能参数提供理论依据。</span></span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\">2<span>）</span></span><span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\">砻谷机双变频电机驱动技术研究</span><span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">根据胶辊砻谷机的差速传动工作原理，目前国内外大多采用齿轮变速箱与双皮带相结合或单根皮带关联传动方式。该方式能够根据辊径的磨损进行变档调速和快慢辊交替，保证两辊在不同辊径时仍然具有合理的线速和线速差，操作方便。由于胶辊可以一次装夹直至用完，因此能够省掉多次换辊劳动和时间。但该方式也存在明显的缺点：结构复杂，加工成本高，故障率高；齿轮变速箱漏油严重，污染粮食；工作噪音大，磨损严重；能耗高，效率低；工艺参数不稳定等。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">针对该问题，</span><span style=\"font-family:宋体;font-size:12pt;\">本项目提出一种新型的砻谷机双变频电机驱动与控制技术。该技术原理为：由可编程控制器（PLC）控制2个变频器，每个变频器各驱动并控制一个变频电机，每个变频电机分别通过联轴器与胶辊主轴相连接。这样，在砻谷机中的两个胶辊各由一个直接连接在胶辊主轴上的变频电机提供动力，而抛弃了传统的</span><span style=\"font-family:宋体;font-size:12pt;\">齿轮变速箱装置</span><span style=\"font-family:宋体;font-size:12pt;\">。砻谷机</span><span style=\"font-family:宋体;font-size:12pt;\">双变频电机</span><span style=\"font-family:宋体;font-size:12pt;\">驱动装置原理如图1所示。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wps9723.tmp.jpg\" width=\"386\" height=\"137\" /><span style=\"font-family:宋体;font-size:12pt;\">&nbsp;</span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">图<span>1&nbsp;</span></span><span style=\"font-family:宋体;font-size:12pt;\">砻谷机双变频电机驱动装置原理图</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">该驱动方式的优点：</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">（<span>1</span><span>）两个胶辊各由一个直接连接在胶辊主轴上的变频电机提供动力，省去了中间的变速与传动装置，整体结构简单，降低了机器的振动与噪音，提高了传动效率，降低了机器的故障率，延长机器使用时间。降低机器成本，减轻机器重量。</span></span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">（<span>2</span><span>）可编程控制器通过变频器对变频电机进行无级调速，可以对快慢辊的转速实现较为精确的控制，并且能够很方便的实现快慢辊交替变换和调节胶辊线速差。与传统的齿轮变速器控制方式相比，具有清洁环保、无污染、能耗低的优点。</span></span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\">3<span>）</span></span><span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\">砻谷机自动控制技术研究与系统</span><span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\">开发</span><span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">传统的胶辊砻谷机控制方式严重落后，普遍存在电器元件多、器件不稳定、线路繁杂、连线不可靠、故障率高、可靠性差、维修查找麻烦等问题。针对该问题，本项目提出</span><span style=\"font-family:宋体;font-size:12pt;\">运用现代控制技术与自动测试方法，构建&nbsp;“触摸屏 可编程控制器 变频器 传感器 变频电机”的自动控制技术体系，实现对大型气压胶辊砻谷机运行状态与工作参数的自动控制。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">本项目采用触摸屏和<span>PLC</span><span>，通过气压传感器与</span><span>PLC</span><span>的数据通信，可以实时监控气压和辊间压力。从而可以避免由辊压过小而导致脱壳率降低，也可以避免由辊压过大而导致碎米率升高。通过电流传感器与</span><span>PLC</span><span>的数据通信，可以实时监测电机电流，具有过流报警功能，以防止由于辊压过大或产量过大二导致的过流问题。此外，胶辊砻谷机的自动控制技术</span><span>,&nbsp;</span><span>不仅具有自动控制砻谷机的喂料、停机关料、快慢辊合拢和退开、无料自动分辊，有料自动合辊等动作的功能</span><span>,&nbsp;</span><span>还具有实时显示砻谷机的工作状态（电机状态、胶辊状态及料门状态）、电流大小、气压大小、喂料振动频率、故障维护提示等功能。运用现代工业自动控制器件</span><span>,&nbsp;</span><span>以控制软件替代传统器件和线路</span><span>,&nbsp;</span><span>发挥以一当百的效能</span><span>,&nbsp;</span><span>达到电气控制的精简、稳定、准确。</span></span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:12pt;\">该项目首次在胶辊砻谷机上实现产量数字化调节，通过智能数字控制器来调节振动喂料槽的频率和电压<span>,&nbsp;</span><span>控制振动喂料槽的振幅大小</span><span>,&nbsp;</span><span>以设定进机稻谷的流量大小</span><span>,</span><span>调节时只要轻轻触动触摸屏上的按钮软键上、下调节即可实现。使气压砻谷机始终可靠有效地运行，操作维护更具人性化。</span></span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\">4<span>）</span></span><span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\">大型气压全自动砻谷机的研制</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">针对目前我国胶辊砻谷机存在的主要问题，以新型双电机驱动装置和自动控制系统的研究成果为基础，综合运用现代设计方法、优化计算技术、动态测试技术与自动控制技术，</span><span style=\"font-family:宋体;font-size:12pt;\">在项目完成单位湖北永祥粮食机械股份有限公司的大力支持下，</span><span style=\"font-family:宋体;font-size:12pt;\">研究并试制了大型气压全自动砻谷机，样机的实物照片如图<span>2-</span><span>图</span><span>4</span><span>所示。</span></span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">经过对样机实际运行效果的检测，本项目研制的大型气压全自动砻谷机达到了下列指标：处理量<span>8</span><span>～</span><span>9</span><span>吨</span><span>/</span><span>小时，脱壳率达</span><span>92%</span><span>，糙碎率降低</span><span>2%</span><span>，胶耗降低</span><span>15%</span><span>，能耗降低</span><span>10%</span><span>。特别的是，原来的齿轮变速箱式胶辊砻谷机的总输入电流为</span><span>26A</span><span>，而本项目研制的砻谷机样机的总输入电流降为</span><span>18A</span><span>，极大的降低了设备能耗，效果非常理想。</span></span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">通过本项目的研究与开发，解决了胶辊砻谷机工作稳定性差、脱壳率低、单机产量小、自动化水平低、能耗高等问题。</span>\r\n</p>\r\n<!--EndFragment-->', '<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">目前，本项目所研制的大型气压全自动砻谷机及相关技术已经在湖北永祥粮食机械股份有限公司、湖北花中花农业股份有限公司、湖北禾丰粮油集团有限公司、河南山信米业有限公司和河南迪一米业有限公司得到成功应用，并达到了相应的使用要求。</span><span style=\"font-family:宋体;font-size:12pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\">经过用户单位近<span>2</span><span>年多的实际使用表明，本项目研究成果大大提高了砻谷机的单机产量，提高了砻谷机的自动化水平，提高了脱壳率，降低了糙米破碎率，降低了胶耗和能耗。设备具有自动控制砻谷机的喂料、停机关料、快慢辊合拢和退开、无料自动分辊、有料自动合辊等功能</span><span>,&nbsp;</span><span>还可实时显示砻谷机的工作状态（电机状态、胶辊状态及料门状态）、电流大小、气压大小、喂料振动频率、故障维护提示等功能</span><span>,&nbsp;</span><span>克服了传统控制方法中电器多、器件不稳定、线路繁杂、连线不可靠、维修查找麻烦等缺点。经过用户单位的实际使用和严格考核，验证了本项目技术成果的可靠性。通过生产试验运行，已经证明：设备综合性能优良，运行稳定可靠，自动化程度高，生产处理量大，该项技术在国内处于领先水平。</span></span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\">现今国内外还没有其他生产厂家具有相同技术，本项目的研究成果将为粮食机械行业增添一种新产品，为企业注入新活力，开辟新市场。</span><span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:24.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;font-weight:bold;\">本项目研究成果的推广应用，提升了我国粮食加工装备的科技创新水平，引领了我国粮食加工装备的发展方向，推动了我国粮食加工产业的科技进步。</span><span style=\"color:#000000;font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<!--EndFragment-->', '100', '10', '', '<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\"><span>（1）</span></span><span style=\"font-family:宋体;font-size:12pt;\">砻谷机双变频电机驱动技术，降低了机器的振动与噪音，提高了传动效率，降低了机器的故障率，引领了我国粮食加工装备的发展方向，推动了我国粮食加工产业的科技进步。</span><span style=\"font-family:宋体;font-size:12pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\"><span>（2）</span></span><span style=\"font-family:宋体;font-size:12pt;\">砻谷机自动控制系统的成功研制，突破了粮食加工装备与自动控制技术有效结合的技术瓶颈，促进了粮食加工装备自动化水平的快速进步，提升了我国粮食加工装备的科技创新水平。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\"><span>（3）</span></span><span style=\"font-family:宋体;font-size:12pt;\">研制完成的大型气压全自动砻谷机，提高了砻谷机的单机产量和自动化水平，提高了脱壳率，降低了糙米破碎率，降低了胶耗和能耗，实现了粮食的节约和高效利用。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:24pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:12pt;\"><span>（4）</span></span><span style=\"font-family:宋体;font-size:12pt;\">本项目的研究成果将为粮食机械行业增添一种新产品，为企业注入新活力，开辟新市场。本项目成果转化和推广应用的条件及前景良好，对社会经济发展和科技进步具有重要的作用和意义。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<!--EndFragment-->', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/QQ图片201512311046198.jpg', '2016', null, '2', null, '11', null, '8', null, null, '1', '0', null, null, '31', null, '2016-01-12');
INSERT INTO `project` VALUES ('144', '174', '中国粮食仓储行业淘汰甲基溴项目', null, '4', 0x3433, '126,125,124,123', '2013-01-08', '2016-01-20', '5', null, '中国粮食仓储行业淘汰甲基溴国际援助项目\r\nProject No: MP/CPR/03/092', '0', null, '中国粮油学会储藏分会', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/QQ图片201512311046195.jpg', '本项目属于国际援助项目、农业领域中粮食产后领域\r\n	为切实履行我国政府向国际社会对《关于消耗臭氧层物质的蒙特利尔议定书》的《哥本哈根修正案》所作出的承诺，中国粮食仓储行业淘汰甲基溴国际援助项目于2004年正式启动。\r\n	中国粮食仓储行业淘汰甲基溴项目从“技术援助”和“设备援助”两大方面入手，分调研子项、规程子项、教材子项、国外培训、国内培训、设备子项、监督检查、会议子项、监督管理、保障技术、安全处理等11个子项目分别研究制定了科学合理的项目实施方案，实行软件建设与硬件建设、宏观与微观相结合。\r\n	该项目对全国使用甲基溴的9省2国资粮油公司（包括山东、河北、甘肃、安徽、大连等）进行了现场核实，基本摸清了仓储行业使用或库存甲基溴情况；根据调研的情况，结合行业实际情况，筛选确定了较为成熟的“磷化氢膜下环流熏蒸技术”和“磷化氢与二氧化碳混合熏蒸技术”作为甲基溴替代技术；编制了《粮食仓储行业淘汰甲基溴培训教材》、《粮食仓储行业淘汰甲基溴宣传手册——留住蓝天，享受阳光》；制作了《粮食仓储行业淘汰甲基溴多媒体教程》；先后4次国内培训（含1次保障技术培训会）和1次总结大会和1次新技术研讨会，总结交流了经验，研讨了甲基溴替代新技术，培训了490多名技术骨干（含保障技术培训112名）；并组织国内有关省市粮食局、公司和科研机构的专家和管理人员赴以色列等国进行考察与学习先进的甲基溴替代技术和替代药剂；在全国128个使用过甲基溴的粮库中，根据甲基溴使用情况、淘汰难度以及区域特点等情况，选择了9省区市的34个粮库为设备援助示范库；为了保证设备质量和供货进度，成立监督检查小组对34个设备援助库设备到位情况分三个阶段进行了监督检查；通过技术辐射部分非示范库自筹资金也进行了替代技术改造；通过国内多种粮食行业杂志、互联网、全国粮食储藏技术论坛，进行了广泛宣传，提高了公众保护臭氧层意识；国家粮食局会同环保', '<p style=\"text-indent:26.45pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">臭氧层破坏成为当前面临的全球性环境问题之一，受到世界各国的关注。甲基溴（</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">Methyl&nbsp;bromide</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">），又名溴甲烷、溴代甲烷，是一种性能优良的熏蒸剂。中国于上世纪</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">50</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">年代以来开始大量生产和应用，在粮食仓储行业主要用于储粮害虫的防治。经研究发现，甲基溴是一种重要的消耗臭氧层物质，它对大气平流层中的臭氧层有很强的破坏作用。据估计</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">,</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">全球</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">10%</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">臭氧减少可能与使用甲基溴有关。臭氧层受损可直接导致地面紫外线辐射增强，这给人类健康和地球表面生态系统带来了严重危害。</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:26.45pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">为保护地球臭氧层，保护生物生存的环境，国际社会通过共同努力，于</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">1985</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">年缔结了《保护臭氧层的维也纳公约》，</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">1992</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">年国际社会签署了《关于消耗臭氧层物质的蒙特利尔议定书》，甲基溴为</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">95</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">种受控物质之一。中国政府积极投入到淘汰甲基溴行列中，于</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">2003</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">年</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">4</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">月</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">22</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">日正式签署《关于消耗臭氧层物质的蒙特利尔议定书》的《哥本哈根修正案》，成为世界上第</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">142</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">个签署哥本哈根修正案的国家，承诺按照议定书的要求淘汰“消耗臭氧层物质（ODS）”，中国作为全球最大的ODS生产国和消费国，履约任务十分艰巨。该修正案规定，发达国家在2005年实现甲基溴的完全淘汰；发展中国家的淘汰时间为2002年冻结在1995～1998年的平均水平上，2005年削减20%，2015年实现完全淘汰。</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<!--EndFragment-->', '3.1 履行了国际公约，融入到了全球保护臭氧层行动中。项目自立项以来，一方面意识到这项工作有利于保护臭氧层、保护我们的家园、造福子孙后代；另一方面也认识到这项工作关系中国粮食行业的国际形象、行业信誉和社会责任，中国粮食仓储行业对淘汰甲基溴工作严谨认真，真正融入到了全球保护臭氧行动中，义不容辞地履行了保护臭氧层义务。\r\n	    3.2 制订相关粮食储藏技术和管理标准，促进绿色环保储粮。一是研究分析甲基溴淘汰的替代技术，报废甲基溴安全处理技术，制订了《储粮化学药剂管理和使用规范》（LS1212-2008）、《粮油储藏—熏蒸剂使用准则》（GB/T 22497-2008）、《磷化氢熏蒸技术规程》（报批稿，待发布）,规范了熏蒸剂的使用，降低了库存化学药剂库存量；二是淘汰了破坏臭氧层的甲基溴，同时还推广了磷化氢环流熏蒸技术，推进了仓储行业科学合理使用甲基溴替代技术，降低了储粮化学药剂的使用量。', '无', '中国粮食仓储行业作为消费“消耗臭氧层物质”甲基溴（又称溴甲烷）的行业之一，肩负着履约国际公约任务。根据国家淘汰甲基溴的行业计划，在国家环保部、国家粮食局和各有关省区市粮食主管部门和行业公司主管单位的大力支持与配合下，中国粮食仓储行业顺利地完成了淘汰目标，成为第一个实现承诺的中国甲基溴消费行业。\r\n	5.1 报废库存甲基溴处置技术：\r\n	处理报废甲基溴的措施最可能的有三项，一是邀请有资质的危险品处理中心进行回收处理，二是厂家回收处理，三是与化学试剂进行化学反应。“请有资质的危险品处理中心进行回收处理”，环保部门有资质的危险品处理中心的处理对象主要是固体农药、液体农药、粉尘、废水、废气等废弃物，均未涉及到甲基溴等毒气的处理，也没有处理报废甲基溴的业务，均不能回收处理大批量报废甲基溴；“生产厂家回收处理”危险性较大，运输有可能产生泄漏的危险，点多量大跨省转移运输的成本较高，办理跨省转移手续较多，生产工艺还要进行适当调整，这些将需要大量的人力和物力，厂家都不愿意进行回收处理。化学试剂进行化学反应，仅可用少量的甲基溴处理，并且反应产品也难安全处置。本项目提出的“再生合理利用”是一种安全的、经济有效的方法,并且符合《消耗臭氧层物质管理条例》规定，再生合理利用不是直接排空，主要应用于生产设备、包装物、麻袋编织袋车间等器材或空仓消毒，甲基溴很大一部份被这些被熏蒸物吸附并逐步化学反应生成无害物质（主要是蛋氨酸甲基溴化锍、1-甲基组氨酸、S-甲基半胱氨酸、O-甲基化合物），但还是有很小一部份甲基溴可以直接通过熏蒸场所的缝隙进入空气中，但是量是很小的，虽然会对环境有不利的影响，但已经将不利影响降到最低了。\r\n	5.2 替代技术的选择：\r\n	在甲基溴替代技术研究方面，澳大利亚R.F.Ryan 博士等人研究用环氧乙烷替代。以色列的S. Navarro 等与土耳其的科学家合作，研究了环氧丙烷对', '<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">中国粮食仓储行业淘汰甲基溴项目</span><span style=\"font-family:宋体;font-size:10.5pt;\">从“技术援助”和“设备援助”两大方面入手，研究制定了科学合理的项目实施方案，实行软件建设与硬件建设、宏观与微观相结合。</span><span style=\"font-family:宋体;font-size:10.5pt;\">&nbsp;</span><span style=\"font-family:宋体;font-size:10.5pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">2.1&nbsp;技术援助部分</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">2.1.1摸清了仓储行业甲基溴使用和库存情况</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:20.6pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">国家粮食局2004年和2006年先后两次发文</span><span style=\"font-family:宋体;font-size:10.5pt;\">进行了全国甲基溴使用和库存情况的摸底调研</span><span style=\"font-family:宋体;font-size:10.5pt;\">，同时组织</span><span style=\"font-family:宋体;font-size:10.5pt;\">成都粮食储藏科学研究所（以下简称：成都储藏所）、河南工业大学对全国使用甲基溴的9省2公司（山东、河北、大连等）进行了现场核实，基本摸清了仓储行业使用或库存甲基溴情况。据2004年底调研数据显示，全国共有10省（直辖市）2公司（</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">“中储”、“中谷”）</span><span style=\"font-family:宋体;font-size:10.5pt;\">120个仓储企业使用甲基溴，使用量为86974kg。</span><span style=\"font-family:宋体;font-size:12pt;\"></span>\r\n</p>\r\n<p style=\"text-align:left;text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">截止2008年8月，综合几年来调研结果，共有15个省、公司共41个粮库仍库存或报废的14337kg甲基溴，具体分布如图2。库存的甲基溴绝大多数为七十年代计划经济时期遗留下来的，数量较多，分布广，且绝大多数已经完全锈蚀，无法打开，并且原生产厂家已不存在，无法回收，现各有关单位均须按照《储粮化学药剂管理和使用规范》（LS1212）有关规定进行保管。</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">国家粮食局组织了成都储藏所对甘肃、山西等部分库存甲基溴进行了在允许行业内使用的示范处理，消除了部分安全隐患，但处理的难度还是较大，尤其是完全锈蚀且无法打开钢瓶甲基溴存有难度，</span><span style=\"font-family:宋体;font-size:10.5pt;\">尚需要更科学、安全的处理方法。</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:left;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">2.1.2&nbsp;明确了两项主要替代技术</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-align:left;text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">根据调研并结合行业实际情况，确定了较为成熟的甲基溴替代技术为“磷化氢膜下环流熏蒸技术”和“磷化氢与二氧化碳混合环流熏蒸技术”，两项技术的主要技术参数见表1。</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">表1：两种替代技术主要技术参数比较</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<table style=\"width:403.3pt;border-collapse:collapse;\" class=\"MsoNormalTable\" align=\"center\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"border:0.5pt solid windowtext;\" valign=\"center\" rowspan=\"2\" width=\"134\" colspan=\"2\">\r\n				<p style=\"text-align:center;text-indent:24pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">&nbsp;</span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"219\" colspan=\"2\">\r\n				<p style=\"text-align:center;text-indent:24pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;font-weight:bold;\">磷化氢膜下环流熏蒸技术</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;font-weight:bold;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" rowspan=\"2\" width=\"183\">\r\n				<p class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;font-weight:bold;\">磷化氢与二氧化碳混合熏蒸技术</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;font-weight:bold;\"></span>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td valign=\"center\" width=\"111\">\r\n				<p class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">使用仓外发生器</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"108\">\r\n				<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">不使用仓外发生器</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td valign=\"center\" width=\"134\" colspan=\"2\">\r\n				<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">膜下回流管</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"111\">\r\n				<p style=\"text-align:center;text-indent:24pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">有</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"108\">\r\n				<p style=\"text-align:center;text-indent:24pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">有</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"183\">\r\n				<p style=\"text-align:center;text-indent:24pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">无</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td valign=\"center\" width=\"134\" colspan=\"2\">\r\n				<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">是否覆盖薄膜</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"111\">\r\n				<p style=\"text-align:center;text-indent:24pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">是</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"108\">\r\n				<p style=\"text-align:center;text-indent:24pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">是</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"183\">\r\n				<p style=\"text-align:center;text-indent:24pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">否</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td valign=\"center\" width=\"134\" colspan=\"2\">\r\n				<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">用药量通常情况</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"402\" colspan=\"3\">\r\n				<p class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">一般3g/m</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;vertical-align:super;\">3</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\">。通常在温度25～30℃，若浓度低于200ppm（非抗性虫种，如玉米象、赤拟谷盗等）或300ppm（抗性虫种，如：谷蠹、锈赤扁谷盗等），再补药。</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td valign=\"center\" width=\"134\" colspan=\"2\">\r\n				<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">密闭时间</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"111\">\r\n				<p style=\"text-align:center;text-indent:-0.25pt;margin-left:0.25pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">14d</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"108\">\r\n				<p style=\"text-align:center;text-indent:-0.1pt;margin-left:0.1pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">14d</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"183\">\r\n				<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">14d</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td valign=\"center\" rowspan=\"3\" width=\"49\">\r\n				<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">CO</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;vertical-align:sub;\">2</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"85\">\r\n				<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">是否使用</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"111\">\r\n				<p style=\"text-align:center;text-indent:-0.25pt;margin-left:0.25pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">使用</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"108\">\r\n				<p style=\"text-align:center;text-indent:-0.1pt;margin-left:0.1pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">不使用</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"183\">\r\n				<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">使用</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td valign=\"center\" width=\"85\">\r\n				<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">粮堆中浓度</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"111\">\r\n				<p class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">1%左右（约磷化铝1kg对应钢瓶二氧化碳25kg）</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"108\">\r\n				<p style=\"text-align:center;text-indent:-0.1pt;margin-left:0.1pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">0</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"183\">\r\n				<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">≥</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\">5%</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\">（</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\">根据仓房容积</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\">）</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td valign=\"center\" width=\"85\">\r\n				<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">作用</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"111\">\r\n				<p style=\"text-align:center;text-indent:-0.25pt;margin-left:0.25pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">防爆阻燃</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"108\">\r\n				<p style=\"text-align:center;text-indent:-0.1pt;margin-left:0.1pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">/</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"183\">\r\n				<p class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">PH</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;vertical-align:sub;\">3</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\">增效、防爆阻燃</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td valign=\"center\" width=\"134\" colspan=\"2\">\r\n				<p style=\"text-align:center;text-indent:24pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">杀虫效果</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"111\">\r\n				<p style=\"text-align:center;text-indent:-0.25pt;margin-left:0.25pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">好</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"108\">\r\n				<p style=\"text-align:center;text-indent:-0.1pt;margin-left:0.1pt;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">一般</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n			<td valign=\"center\" width=\"183\">\r\n				<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n					<span style=\"color:#000000;font-family:宋体;font-size:9pt;\">好</span><span style=\"color:#000000;font-family:宋体;font-size:9pt;\"></span>\r\n				</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">2.1.3&nbsp;</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">编制了培训教材、宣传手册以及多媒体宣传片</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:20.6pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">为培训全国粮食仓储管理和技术人员的磷化氢熏蒸基础理论和实际操作水平，推广和应用磷化氢熏蒸技术，项目编制了《粮食仓储行业淘汰甲基溴培训教材》和《粮食仓储行业淘汰甲基溴宣传手册</span><span style=\"font-family:宋体;font-size:10.5pt;\">——</span><span style=\"font-family:宋体;font-size:10.5pt;\">留住蓝天，享受阳光》，制作了《粮食仓储行业淘汰甲基溴多媒体教程》。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">2.1.4&nbsp;制定了《磷化氢熏蒸技术规程》行业标准</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:20.6pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">项目在LS/T&nbsp;1201-2002《磷化氢环流熏蒸技术规程》的基础上，结合近年来储粮生产应用和研究成果，编制了《磷化氢熏蒸技术规程》（报批稿）行业标准。</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">2.1.5&nbsp;组织进行了国内外培训和研讨交流</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">项目主要进行国内培训与研讨交流有：（1）在安徽合肥和山东聊城举办了三期淘汰甲基溴替代技术培训班，全国共有21个省、区、市粮食仓储系统149个粮库和67个地方粮食局的387人参加了培训；</span><span style=\"font-family:宋体;font-size:10.5pt;\">（2）环保部、国家粮食局以及联合国工业发展组织在北京联合组织召开了《中国粮食仓储行业淘汰甲基溴总结大会》，总结交流了粮食仓储行业淘汰甲基溴工作执行情况和管理经验，宣传了粮食仓储行业淘汰甲基溴、保护环境方面所做出的成绩，表彰了粮食仓储行业淘汰甲基溴项目取得突出成绩的先进单位；（3）在石家庄组织召开了《粮食仓储行业淘汰甲基溴保障技术培训会》，主要培训了储粮害虫抗性增加后的监测及综合治理等问题，培训基层粮库管理人员112人；（4）在杭州组织召开了“粮食仓储淘汰甲基溴新技术与害虫抗性监测治理研讨会”，</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">研讨交流了硫酰氟、甲酸乙酯、氮气储粮及抗性监测等新药剂和新技术在粮食上的研究及应用进展。</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">项目主要进行国外培训与研讨交流的内容有：磷化氢熏蒸技术、储粮防护</span><span style=\"font-family:宋体;font-size:10.5pt;\">剂、真空气调、高压气调、生物防治、物理防治、高温杀虫、低温杀虫等技术；甲基溴替代物硫酰氟以及其他替代产品在美国的应用和研究发展状况；磷化氢、甲酸乙酯、硫酰氟等熏蒸剂研发和应用、害虫抗性基因研究、甲基溴回收等技术；加工车间防治技术（热空气杀虫技术、</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">害虫诱捕与监测技术、压缩液体冷冻杀虫技术）、储粮杀虫技术（磷化氢熏蒸杀虫技术、</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">磷化氢与二氧化碳混合熏蒸技术、快速熏蒸箱“SPEEDBOX”杀虫技术）等。</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">2.1.6&nbsp;监测评价了34个示范库的熏蒸效果</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:20.6pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">通过2007年和2008年对示范库的熏蒸效果检测评价，其中：2007年共对32个示范库（有2个库因粮食轮换出库未熏蒸）进行了熏蒸效果跟踪检测，效果好的示范库有31个（占97%），效果一般1个（占3%）；</span><span style=\"font-family:宋体;font-size:10.5pt;\">2008年共对18个示范库（2007年熏蒸后有9个粮库没有检测出虫害发生、有7个粮库因政策因素粮食轮换出库后未收购粮食）进行了熏蒸效果检测，熏蒸效果良好，杀虫效果达100%。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">2.1.7&nbsp;初步建立了害虫抗性监测服务网络</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:20.6pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">通过2007年和2008年对34个示范库和部分非示范库的害虫抗性监测（采用的方法为</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">FAO抗性测定法），其中：2</span><span style=\"font-family:宋体;font-size:10.5pt;\">007年</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">共采集到52个试虫样（示范库47个、非示范库5个）；2008年共采集到113个试虫样（示范库40个、使用甲基溴非示范库41个、未使用甲基溴非示范库32个）。示范库两年具体抗性情况对比分析见表2。</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">&nbsp;</span>\r\n</p>\r\n<!--EndFragment-->', '<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:14pt;\">&nbsp;</span><span style=\"font-family:宋体;font-size:10.5pt;\">本项目分三个层次进行应用推广了淘汰甲基溴替代技术。</span><span style=\"font-family:宋体;font-size:14pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">6.1建立了34个淘汰甲基溴示范库</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:20.6pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">在全国128个使用过甲基溴的粮库中，根据甲基溴使用情况、淘汰难度以及区域特点等情况，选择了9省区市的34个粮库为设备援助示范库，并通过1年的熏蒸验证试验，使用正常，效果良好，通过了环保部外经办的验收。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">6.2&nbsp;辐射带动了94个非示范库全面淘汰甲基溴</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:20.6pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">由于非示范库未给予设备等援助，主要依托有关省级粮食主管部门和示范库的辐射带动，同时国家粮食局也组织了三期培训班，对非示范库的有关人员进行了培训，非示范库也充分感受到替代技术的实用性，积极自筹资金进行了仓房改造。经统计，非示范库利用自有资金或财政资金，配备了磷化氢环流熏蒸系统的共有35个库，占94个非援助库的37％，投资约264万元人民币。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">6.3&nbsp;拉动了示范库对非示范仓的改造积极性，推广了替代技术</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">通过在示范仓成功应用甲基溴替代技术，很多示范库充分感受到替代技术的优越性，并自筹资金进行非示范仓的仓房等进行改造，使用上了甲基溴替代技术，为绿色储粮提供了好的设施条件，也为粮食仓储行业彻底淘汰甲基溴作出了应有的贡献。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<!--EndFragment-->', '100', '1', '', '<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">通过项目的实施，社会和环境效益十分显著，主要体现在三点，一是大大降低了用药量（磷化铝约减少了1/5），减少了对环境的污染，同时停止了破坏臭氧层的甲基溴在粮食仓储行业应用，保护了我们的家园；二是避免了保管人员进仓投药，减少了与熏蒸剂的接触，减轻了劳动强度，有利于保管人员的身体健康；三是通过替代技术的应用，提高了粮食仓储行业的科技水平，更加有利于科学施药，减少了对磷化氢抗性害虫的培养，延缓了磷化氢在仓储行业的使用寿命，确保了我国储粮害虫防治的可持续发展，确保了我国储粮安全。</span>\r\n</p>\r\n<!--EndFragment-->', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/QQ图片201512311046199.jpg', '2016', null, '7', '2', '11', null, '10', null, '1', '6', '2', '1', null, '30', '二等奖', '2016-01-12');
INSERT INTO `project` VALUES ('145', '176', '智慧粮食云平台    ', null, '3', 0x3435, '114,112,109,102,101', '2012-01-04', '2016-01-21', '6', null, '无', '0', null, '中国粮油学会物流分会', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/QQ图片201512311046196.jpg', '<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">目前，大量先进的信息技术已经在粮食行业广泛应用，并发挥着重要的作用。粮食信息化已成为当前强化行业指导能力，提高行政管理水平的必然途径，加快粮食行业信息化建设已成为深化粮食事业改革和发展的必然要求。</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">智慧粮食云平台以平台为中枢核心，统一对粮食局和储备库的业务进行流程管理、数据计算、维护存储，采用标准化平台进行接口规范，避免了数据孤岛和系统不兼容问题，实现了数据的互联互通和实时上传。云平台应用云计算、大数据、物理网等高新技术进行规划和建设，大量获取直接数据和关联数据，利用数学模型和大数据分析进行粮食信息挖掘，为粮食监管和调控提供强有力支撑，更好的服务于涉粮企业和粮食行政管理部门。</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\"></span>\r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">智慧粮食云平台</span><span style=\"font-family:宋体;font-size:10.5pt;\">的研发依托公司的软件开发和系统集成团队，结合粮食行业近十年的业务经验和研发成果，并以粮食局和储备库的实际需求为导向，进行的软硬件一体化集成设计，具有多个创新点：将云计算、云存储应用与智慧粮食中，集中了资源优势，可实现统一配置、统一维护，大大提高了系统的应用效果；先进的智能出入库系统，利用流程引擎，涵盖所有的业务出入库流程，仅需配置即可实现流程适应；应用多种防作弊技术，减少人情粮、转圈粮等作弊现象；构建标准化数据规范，将各个系统的数据格式进行统一，实现多系统的无缝融合；嵌入粮食识别代码，可实现粮食的快速追溯；利用移动终端可实现数据的实时查询、业务审批，为领导决策提供技术支撑。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span>\r\n</p>\r\n<p class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">智慧粮食云平台项目的建设周期为两年，自</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">2013</span><span style=\"font-family:宋体;font-size:10.5pt;\">年</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">10</span><span style=\"font-family:宋体;font-size:10.5pt;\">月至</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">2015</span><span style=\"font-family:宋体;font-size:10.5pt;\">年</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">10</span><span style=\"font-family:宋体;font-size:10.5pt;\">月，目前处于实施部署阶段。在项目研发过程中对所涉及的技术成果及时进行了专利申报，共获得了发明专利</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">1</span><span style=\"font-family:宋体;font-size:10.5pt;\">项，实用新型专利</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">3</span><span style=\"font-family:宋体;font-size:10.5pt;\">项，外观设计专利</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">1</span><span style=\"font-family:宋体;font-size:10.5pt;\">项，软件著作权</span><span style=\"font-family:&quot;Times New Roman&quot;;font-size:10.5pt;\">17</span><span style=\"font-family:宋体;font-size:10.5pt;\">项。下一步将对项目进行全面推广，形成标准化产品，建立行业标准</span>\r\n</p>\r\n<!--EndFragment-->', '<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">2012</span><span style=\"font-family:宋体;font-size:10.5pt;\">年</span><span style=\"font-family:宋体;font-size:10.5pt;\">7</span><span style=\"font-family:宋体;font-size:10.5pt;\">月，国家粮食局下发《粮油仓储信息化建设指南》，作为各级粮食行政管理部门的信息化工作参照；</span><span style=\"font-family:宋体;font-size:10.5pt;\">2013</span><span style=\"font-family:宋体;font-size:10.5pt;\">年</span><span style=\"font-family:宋体;font-size:10.5pt;\">1</span><span style=\"font-family:宋体;font-size:10.5pt;\">月</span><span style=\"font-family:宋体;font-size:10.5pt;\">15</span><span style=\"font-family:宋体;font-size:10.5pt;\">日，李克强总理在国家粮食局科学研究院考察调研时强调，要“守住管好‘天下粮仓’，做好‘广积粮、积好粮、好积粮’三篇文章”；</span><span style=\"font-family:宋体;font-size:10.5pt;\">2013</span><span style=\"font-family:宋体;font-size:10.5pt;\">年</span><span style=\"font-family:宋体;font-size:10.5pt;\">12</span><span style=\"font-family:宋体;font-size:10.5pt;\">月</span><span style=\"font-family:宋体;font-size:10.5pt;\">23</span><span style=\"font-family:宋体;font-size:10.5pt;\">日，习近平总书记在中央农村经济工作会议上明确指示“中国人的饭碗任何时候都要牢牢端在自己手上”。中央工作会议将“切实保障粮食安全”列为</span><span style=\"font-family:宋体;font-size:10.5pt;\">2014</span><span style=\"font-family:宋体;font-size:10.5pt;\">年中央六大经济任务之首。</span><span style=\"font-family:宋体;font-size:10.5pt;\">2014</span><span style=\"font-family:宋体;font-size:10.5pt;\">年中央一号文件《关于全面深化农村改革加快推进农业现代化的若干意见》明确提出要“完善国家粮食安全保障体系”；</span><span style=\"font-family:宋体;font-size:10.5pt;\">2015</span><span style=\"font-family:宋体;font-size:10.5pt;\">年中央一号文件《关于加大改革创新力度加快农业现代化建设的若干意见》</span><span style=\"font-family:宋体;font-size:10.5pt;\">,</span><span style=\"font-family:宋体;font-size:10.5pt;\">粮食安全首当其冲，被提到了前所未有的高度。</span><span style=\"font-family:宋体;font-size:10.5pt;\">山东省粮食局</span><span style=\"font-family: ;\" Roman?;font-size:10.5pt;?=\"\" New=\"\" Times=\"\">2014</span><span style=\"font-family:宋体;font-size:10.5pt;\">年在国家的危仓老库改造项目中，也出台了粮食信息化的建设指南。</span><span style=\"font-family: ;\" Roman?;font-size:10.5pt;?=\"\" New=\"\" Times=\"\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">粮食是国家的命脉，粮食安全关系到国家安全</span><span style=\"font-family:宋体;font-size:10.5pt;\">,</span><span style=\"font-family:宋体;font-size:10.5pt;\">保障粮食安全首先要掌握确切的粮情信息，粮食信息化是实现准确掌握粮情的重要途径。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">粮食信息领域科技发展的总体目标是构建“智慧粮食”，不仅是传统统计工作的提升，也不仅是搞粮库的自动化和办公信息化，而是用最新的信息技术大量获取直接数据和关联数据，利用数学模型和大数据分析进行粮食信息挖掘，为粮食监管和调控提供强有力支撑，更好的服务于涉粮企业和粮食行政管理部门。</span><span style=\"font-family: ;\" Roman?;font-size:10.5pt;?=\"\" New=\"\" Times=\"\"></span> \r\n</p>\r\n<!--EndFragment-->', '1) 一卡通：业务车辆和人员采用IC卡进行一卡通管理，业务过程中取消纸质单据，实现电子数据流转和结算。\r\n	2) 软件平台架构：应用五层技术架构，基础层、数据访问层、开发平台、业务层、表现层，针对不同的功能需求，仅需要在开发平台的基础上进行业务功能模块开发即可，大大提高了系统的复用性。对于多系统融合则在数据访问层实现，具有很好的适用性和可扩展性。\r\n	3) 开发框架：开发了专用浏览器，将BS与CS完美融合，既体现了CS的稳定高效性，已集成了BS的灵活方便性。\r\n	4) 标准化平台：利用Webservive构建标准化数据接口，通过标准化平台进行数据转化，以达到系统的互联互通。\r\n	5) 云平台：将业务处理、数据存储集中到云平台上，流程配置、系统部署、远程监管、数据报表等实现了标准化规划和建设，充分体现云平台的优势，更重要的将数据打通，实现阳光数据。\r\n	6) 粮食识别代码集成：将识', '<p class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">一卡通、软件平台架构及开发架构、标准化平台</span> \r\n</p>\r\n<!--EndFragment-->', '<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"> \r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">国外的仓房类型、粮食状态、管理方式等相对简单，没有国内复杂，所面临的问题少，应用的先进技术也不多，所以项目技术、产品的比较主要集中在国内厂家所研发的产品和项目上。智慧粮食云平台是将粮食的行政管理和业务管理进行了统一融合，既有平台的软件系统，也有针对数字粮库的出入库、粮情、通风等系统的硬件集成，所以说平台是一个软硬一体化的系统集成。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">国内做系统平台的介入比较早的有航天信息、浪潮集团，他们的平台主要是软件系统，采用单纯的</span><span style=\"font-family:宋体;font-size:10.5pt;\">BS</span><span style=\"font-family:宋体;font-size:10.5pt;\">架构部署，出入库系统的本地硬件控制效率不高。没有粮库的通风、粮情等产品。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">粮库的通风、粮情系统做的厂家比较多，如天硕、贝博、金辰等厂家，产品质量不错应用的也比较好。但是应为没有统一的标准，往往在平台集成上面不能统一，很容易造成了一个一个的信息孤岛。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">智慧粮食云平台应用了云计算、大数据、物联网、图像识别、无线网络等多种新技术，将软件平台和硬件系统进行了融合，从源头上考虑了系统标准化的问题，因此说智慧粮食云平台在国内粮食信息化领域处于国内领先地位，具有非常好的市场前景。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<!--EndFragment--></span><!--EndFragment-->', '<p style=\"text-indent:21.1pt;\" class=\"p\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">（</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">1</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">）总体思路</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">信息技术的快速发展将继续引领全球的整体发展进程，成为世界各国推动经济社会进步，增强综合国力的共同选择。粮食产业作为最古老的也是永恒的产业，负担着保障国家粮食安全的重要任务，信息技术的应用必然会给粮食产业带来革命性的发展。目前，大量先进的信息技术已经在粮食行业广泛应用，并发挥着重要的作用。粮食信息化已成为当前强化行业指导能力，提高行政管理水平的必然途径，加快粮食行业信息化建设已成为深化粮食事业改革和发展的必然要求。</span><span style=\"font-family: ;\" Roman?;font-size:10.5pt;?=\"\" New=\"\" Times=\"\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">智慧粮食云平台能够将基层收纳库、储备库、市级粮食局的数据在平台进行整合，可以与省局平台、国家局平台进行纵向贯通，达到横向到边，纵向到底的数据涵盖要求，利用粮食直接数据和关联数据进行挖掘，发挥数据的作用，用数据说话，用数据指导决策。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"p\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"> </span> \r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"p\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">（</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">2</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">）研究成果</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">粮食信息化的建设要进行整体规划，统一布局，解决好四个方面的问题，也是目前国内粮食信息化所普遍存在的问题。</span><span style=\"font-family: ;\" Roman?;font-size:10.5pt;?=\"\" New=\"\" Times=\"\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">第一、夯实粮食行业信息化数据基础。数据是粮食</span><span style=\"font-family:宋体;font-size:10.5pt;\">行业信息化的基础、是掌握我国粮情和保障国家粮食安全的基本前提，实现粮食数据的自动采集、夯实数据基础是粮食信息化建设的首要问题。</span><span style=\"font-family: ;\" Roman?;font-size:10.5pt;?=\"\" New=\"\" Times=\"\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">第二、打破粮食行业信息化孤岛现状。</span><span style=\"font-family:宋体;font-size:10.5pt;\">粮库间信息孤岛、企业和上级主管部门间信息孤岛、地市级以下粮库与中央级粮库信息孤岛、粮食应用网络和信息传递网络互相隔断、粮食行业内和行业外不同部门信息的孤岛。打破粮食行业信息化孤岛、实现信息互联互通是实现粮食信息化建设目标的重要手段。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">第三、</span><span style=\"font-family:宋体;font-size:10.5pt;\">提高粮食行业标准化水平。</span><span style=\"font-family:宋体;font-size:10.5pt;\">粮食行业已发布若干国家标准和行业标准</span><span style=\"font-family:宋体;font-size:10.5pt;\">,</span><span style=\"font-family:宋体;font-size:10.5pt;\">但是，仅限于基于传统管理模式的国家层面标准，没有面向全行业的信息化标准体系。面向部门和企业信息的数据标准几乎处于空白状态，缺乏统一指导，建设标准不统一，缺乏数据共享接口，不能有效互联互通。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">第四、高新技术应用不足。粮食流通作为物质的运动，需要与信息运动同步。随着信息化智能终端技术的完善、信息自动化采集的实现、不同部门间数据信息的互联互通，必定会产生粮食大数据。这些大数据的存储、流通、追溯等都需要新技术的支持才能实现，因此在粮食信息化的建设中将广泛应用物联网、大数据、云计算等新技术。</span><span style=\"font-family: ;\" Roman?;font-size:10.5pt;?=\"\" New=\"\" Times=\"\"></span> \r\n</p>\r\n<p class=\"p\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"> </span> \r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"p\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">（</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">3</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">）技术方案与创新成果</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:-21pt;margin-left:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:Wingdings;font-size:10.5pt;font-weight:bold;\"><span>l<span> </span></span></span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">技术路线：</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">平台技术路线以信息安全、可维护、易拓展、高效率为设计基础，基于</span><span style=\"font-family:宋体;font-size:10.5pt;\">SOA</span><span style=\"font-family:宋体;font-size:10.5pt;\">思想、采用</span><span style=\"font-family:宋体;font-size:10.5pt;\">B/S</span><span style=\"font-family:宋体;font-size:10.5pt;\">多层结构设计，以</span><span style=\"font-family:宋体;font-size:10.5pt;\">.net</span><span style=\"font-family:宋体;font-size:10.5pt;\">技术架构构建应用平台，适应多种不同的操作系统和数据库的平台。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">系统整体采用组件化、动态化的软件技术，利用一致的可共享的数据模型，按照界面控制层、业务逻辑层、数据资源层的多层架构体系进行设计。通过一体化企业级平台的应用集成，实现物流应用与和企业其他业务应用、企业外部应用之间的数据集成、应用集成、流程集成等。同时在用户体验上，充分考虑并应用</span><span style=\"font-family:宋体;font-size:10.5pt;\">Web2.0</span><span style=\"font-family:宋体;font-size:10.5pt;\">技术，增强用户体验。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">整体系统采用</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">B/S</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">与</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">C/S</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">结合，五层结构，</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">SOA</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">架构的设计理念，操作终端使用</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">IE</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\">浏览器和其他智能终端浏览器。</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<a name=\"_Toc320779569\"></a><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"><a name=\"_Toc350803449\"></a><a name=\"_Toc351037350\"></a><a name=\"_Toc351066670\"></a><a name=\"_Toc351499535\"></a><a name=\"_Toc357844524\"></a><a name=\"_Toc357845080\"></a><a name=\"_Toc357845370\"></a><a name=\"_Toc357861125\"></a><a name=\"_Toc357950924\"></a><a name=\"_Toc357952348\"></a><a name=\"_Toc357959584\"></a><a name=\"_Toc357959895\"></a>基础层</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">系统开发和运行的软硬件环境支持平台。硬件环境包括网络、主机、存储、安全设备。本次主机操作系统采用</span><span style=\"font-family:宋体;font-size:10.5pt;\">Windows&nbsp;Server</span><span style=\"font-family:宋体;font-size:10.5pt;\">，后台数据库采用</span><span style=\"font-family:宋体;font-size:10.5pt;\">SQL&nbsp;Server</span><span style=\"font-family:宋体;font-size:10.5pt;\">，应用服务器后台环境为</span><span style=\"font-family:宋体;font-size:10.5pt;\">.NET&nbsp;Framework</span><span style=\"font-family:宋体;font-size:10.5pt;\">、</span><span style=\"font-family:宋体;font-size:10.5pt;\">IIS</span><span style=\"font-family:宋体;font-size:10.5pt;\">。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<a name=\"_Toc351037351\"></a><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"><a name=\"_Toc351066671\"></a><a name=\"_Toc351499536\"></a><a name=\"_Toc357844525\"></a><a name=\"_Toc357845081\"></a><a name=\"_Toc357845371\"></a><a name=\"_Toc357861126\"></a><a name=\"_Toc357950925\"></a><a name=\"_Toc357952349\"></a><a name=\"_Toc357959585\"></a><a name=\"_Toc357959896\"></a>数据访问层</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">系统通过</span><span style=\"font-family:宋体;font-size:10.5pt;\">JZLib </span><span style=\"font-family:宋体;font-size:10.5pt;\">和</span><span style=\"font-family:宋体;font-size:10.5pt;\">Web&nbsp;Services </span><span style=\"font-family:宋体;font-size:10.5pt;\">两种方式进行数据访问。</span><span style=\"font-family:宋体;font-size:10.5pt;\">JZLib</span><span style=\"font-family:宋体;font-size:10.5pt;\">是我公司自主开发的一个基于</span><span style=\"font-family:宋体;font-size:10.5pt;\">.Net </span><span style=\"font-family:宋体;font-size:10.5pt;\">的针对关系型数据库的对象持久化类库，能够快速实现应用程序对各种大型数据库的访问。</span><span style=\"font-family:宋体;font-size:10.5pt;\">Web&nbsp;services </span><span style=\"font-family:宋体;font-size:10.5pt;\">使用基于</span><span style=\"font-family:宋体;font-size:10.5pt;\"> XML </span><span style=\"font-family:宋体;font-size:10.5pt;\">的消息作为数据通信的基本方式，以帮助减少组件模型、操作系统和编程语言不一致的系统之间的差别。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<a name=\"_Toc351037352\"></a><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"><a name=\"_Toc351066672\"></a><a name=\"_Toc351499537\"></a><a name=\"_Toc357844526\"></a><a name=\"_Toc357845082\"></a><a name=\"_Toc357845372\"></a><a name=\"_Toc357861127\"></a><a name=\"_Toc357950926\"></a><a name=\"_Toc357952350\"></a><a name=\"_Toc357959586\"></a><a name=\"_Toc357959897\"></a>开发平台</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">我公司总结多年应用软件设计经验自行研发了底层通用程序开发平台，主要包括：机构管理、用户管理、权限管理、工作流管理、报表引擎、参数管理、日志管理、基础信息管理。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<a name=\"_Toc351037353\"></a><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"><a name=\"_Toc351066673\"></a><a name=\"_Toc351499538\"></a><a name=\"_Toc357844527\"></a><a name=\"_Toc357845083\"></a><a name=\"_Toc357845373\"></a><a name=\"_Toc357861128\"></a><a name=\"_Toc357950927\"></a><a name=\"_Toc357952351\"></a><a name=\"_Toc357959587\"></a><a name=\"_Toc357959898\"></a>业务层</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">系统前后台业务具体展现，主要包括：仓储管理系统、购销管理系统、质量管理系统、财务统计系统、后勤管理系统、粮情测控管理、出入库控制、外部接口管理、二期扩展系统等。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<a name=\"_Toc351037354\"></a><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"><a name=\"_Toc351066674\"></a><a name=\"_Toc351499539\"></a><a name=\"_Toc357844528\"></a><a name=\"_Toc357845084\"></a><a name=\"_Toc357845374\"></a><a name=\"_Toc357861129\"></a><a name=\"_Toc357950928\"></a><a name=\"_Toc357952352\"></a><a name=\"_Toc357959588\"></a><a name=\"_Toc357959899\"></a>表现层</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">用户能够使用业务系统的表现方式，包括：</span><span style=\"font-family:宋体;font-size:10.5pt;\">PC</span><span style=\"font-family:宋体;font-size:10.5pt;\">客户端、</span><span style=\"font-family:宋体;font-size:10.5pt;\">IE</span><span style=\"font-family:宋体;font-size:10.5pt;\">浏览器、客户端插件</span><span style=\"font-family:宋体;font-size:10.5pt;\"> </span><span style=\"font-family:宋体;font-size:10.5pt;\">、平板电脑浏览器、智能手机浏览器。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">云计算是一种基于</span><span><a href=\"http://zh.wikipedia.org/wiki/%E4%BA%92%E8%81%94%E7%BD%91\"><span style=\"font-family:宋体;font-size:10.5pt;\">互联网</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">的计算方式，通过这种方式，共享的软硬件资源和信息可以按需求提供给计算机和其他设备。</span><span><a href=\"http://zh.wikipedia.org/wiki/%E4%BA%92%E8%81%94%E7%BD%91\"><span style=\"font-family:宋体;font-size:10.5pt;\">互联网</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">上汇聚的计算资源、存储资源、数据资源和应用资源正随着互联网规模的扩大而不断增加，互联网正在从传统意义的通信平台转化为泛在、智能的计算平台。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">云计算平台要求具有自动化管理功能，用户可以通过用户接口，自己申请计算资源和应用，按自己的需要建立自己的资源环境，而整个过程是不需云平台管理员的干预，云计算平台只需自动记录用户使用资源的大小和时间。云计算模式基于</span><span style=\"font-family:宋体;font-size:10.5pt;\">SOA</span><span style=\"font-family:宋体;font-size:10.5pt;\">的架构，动态地分配和部署共享的计算资源，同时云计算具有灵活性、高可用性、动态资源监控以及虚拟性。基于虚拟化的云计算平台为企业的资源重构带来了便利，使其能短时间内转向云计算平台，降低了基础架构的重建成本，缩短了为企业转型的时间。云平台的理念：面向服务，支撑业务</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">我们在智能出入库（</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">GAM</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">）系统部分功能采用嵌入式系统开发，提供安全性与灵活性。</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">嵌入式</span><span><a href=\"http://baike.baidu.com/view/25302.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">系统</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">是以应用为中心，以</span><span><a href=\"http://baike.baidu.com/view/3314.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">计算机</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">技术为基础，并且软硬件可裁剪，适用于应用系统对功能、可靠性、成本、体积、功耗有严格要求的</span><span><a href=\"http://baike.baidu.com/view/949321.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">专用计算机</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">系统。它一般由</span><span><a href=\"http://baike.baidu.com/view/27055.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">嵌入式微处理器</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">、外围硬件设备、</span><span><a href=\"http://baike.baidu.com/view/18554.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">嵌入式操作系统</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">以及用户的</span><span><a href=\"http://baike.baidu.com/view/330120.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">应用程序</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">等四个部分组成，用于实现对其他设备的控制、监视或管理等功能</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">嵌入式</span><span><a href=\"http://baike.baidu.com/view/25302.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">系统</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">一般指非</span><span><a href=\"http://baike.baidu.com/view/13621.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">PC</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">系统，它包括硬件和软件两部分。硬件包括</span><span><a href=\"http://baike.baidu.com/view/50152.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">处理器</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">/</span><span><a href=\"http://baike.baidu.com/view/1125.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">微处理器</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">、</span><span><a href=\"http://baike.baidu.com/view/87697.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">存储器</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">及外设器件和</span><span style=\"font-family:宋体;font-size:10.5pt;\">I/O</span><span style=\"font-family:宋体;font-size:10.5pt;\">端口、图形控制器等。软件部分包括</span><span><a href=\"http://baike.baidu.com/view/880.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">操作系统</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">软件（</span><span><a href=\"http://baike.baidu.com/view/34963.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">OS</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">）（要求实时和多任务操作）和</span><span><a href=\"http://baike.baidu.com/view/330120.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">应用程序</span></a></span><span><a href=\"http://baike.baidu.com/view/3281.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">编程</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">。有时设计人员把这两种软件组合在一起。应用</span><span><a href=\"http://baike.baidu.com/view/17674.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">程序</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">控制着</span><span><a href=\"http://baike.baidu.com/view/25302.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">系统</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">的运作和行为；而</span><span><a href=\"http://baike.baidu.com/view/880.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">操作系统</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">控制着应用程序</span><span><a href=\"http://baike.baidu.com/view/3281.htm\"><span style=\"font-family:宋体;font-size:10.5pt;\">编程</span></a></span><span style=\"font-family:宋体;font-size:10.5pt;\">与硬件的交互作用。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">我们在平台软件开发过程中采用的技术路线是</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">.NET</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">。</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">.NET</span><span style=\"font-family:宋体;font-size:10.5pt;\">是为简化在第三代因特网的高分布式环境下的应用程序开发，基于开放互联网标准和协议之上，实现异质语言和平台高度交互性，而构建的新一代计算和通信平台。为敏捷商务构建互联互通的应用系统，用。</span><span style=\"font-family:宋体;font-size:10.5pt;\">.NET</span><span style=\"font-family:宋体;font-size:10.5pt;\">是基于</span><span style=\"font-family:宋体;font-size:10.5pt;\">Windows</span><span style=\"font-family:宋体;font-size:10.5pt;\">操作系统运行的操作平台，应用于互联网的分布式。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">Web</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">开发方面，我们采用的是</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">ASP.NET</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">框架。</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">ASP.NET</span><span style=\"font-family:宋体;font-size:10.5pt;\">是</span><span style=\"font-family:宋体;font-size:10.5pt;\">.NET</span><span style=\"font-family:宋体;font-size:10.5pt;\">开发平台的重要组成部分，提供了为建立和部署企业级</span><span style=\"font-family:宋体;font-size:10.5pt;\"> Web </span><span style=\"font-family:宋体;font-size:10.5pt;\">应用程序所必需的服务。</span><span style=\"font-family:宋体;font-size:10.5pt;\">ASP.NET </span><span style=\"font-family:宋体;font-size:10.5pt;\">能够为面向任何浏览器或设备的更安全的、更强的、可升级性、更稳定的应用程序提供了新的编程模型和基础结构。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">ASP.NET </span><span style=\"font-family:宋体;font-size:10.5pt;\">是</span><span style=\"font-family:宋体;font-size:10.5pt;\"> Microsoft&nbsp;.NET&nbsp;Framework </span><span style=\"font-family:宋体;font-size:10.5pt;\">的一部分，是一种可以在高度分布的</span><span style=\"font-family:宋体;font-size:10.5pt;\"> Internet </span><span style=\"font-family:宋体;font-size:10.5pt;\">环境中简化应用程序开发的计算环境。</span><span style=\"font-family:宋体;font-size:10.5pt;\">.NET&nbsp;Framework </span><span style=\"font-family:宋体;font-size:10.5pt;\">包含公共语言运行库，它提供了各种核心服务，如内存管理、线程管理和代码安全。它也包含</span><span style=\"font-family:宋体;font-size:10.5pt;\"> .NET&nbsp;Framework </span><span style=\"font-family:宋体;font-size:10.5pt;\">类库，这是一个开发人员用于创建应用程序的综合的、面向对象的类型集合。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:-21pt;margin-left:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:Wingdings;font-size:10.5pt;font-weight:bold;\"><span>l<span> </span></span></span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\">研发内容：</span><span style=\"font-family:宋体;font-size:10.5pt;font-weight:bold;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">基于粮食信息化管理的智慧粮食云平台，实现粮食局、储备库的云平台管理。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-align:center;\" class=\"MsoNormal\">\r\n	<img src=\"file://C:/Users/zy/AppData/Local/Temp/ksohtml/wpsE12F.tmp.png\" width=\"345\" height=\"333\" /><span style=\"font-family:宋体;font-size:10.5pt;\"> </span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"p\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"> </span> \r\n</p>\r\n<p style=\"text-indent:21.1pt;\" class=\"p\">\r\n	<span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">（</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">4</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-weight:bold;\">）实施效果</span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">项目经过一年半的标准化开发，各个模块的开发测试工作已经完成，子模块既可以在平台上统一部署，也可以作为单独系统独立运行，目前整个平台处于部署实施阶段，随后进入上线试运行和项目文档整理阶段。目前看来，平台的实施推广使用已对粮食行业发展产生促进作用。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">1</span><span style=\"font-family:宋体;font-size:10.5pt;\">）降低人力及管理成本</span><span style=\"font-family:宋体;font-size:10.5pt;\"> </span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">2)</span><span style=\"font-family:宋体;font-size:10.5pt;\">提高工作效率，计量时间由以前的一辆车</span><span style=\"font-family:宋体;font-size:10.5pt;\">3-5</span><span style=\"font-family:宋体;font-size:10.5pt;\">分钟时间，缩短为半分钟</span><span style=\"font-family:宋体;font-size:10.5pt;\">-1</span><span style=\"font-family:宋体;font-size:10.5pt;\">分钟时间，效率大大提高。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">3</span><span style=\"font-family:宋体;font-size:10.5pt;\">）便于单位领导层透明化管理，数据及时共享，随时掌握库存和进度情况，实时、准确、高效传输对提高核算、控制、管理有着重要的意义，为生产调度和领导决策提供及时、强大的统计分析和报表功能，为领导决策提供可靠的数据支持。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">4</span><span style=\"font-family:宋体;font-size:10.5pt;\">）堵住了计量中的管理漏洞，杜绝了种种作弊现象，提高了企业的经济效益。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">5</span><span style=\"font-family:宋体;font-size:10.5pt;\">）降低劳动强度，提高工作效率。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">6</span><span style=\"font-family:宋体;font-size:10.5pt;\">）改善工作环境，以人为本，符合科学发展观的要求。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"MsoNormal\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">7</span><span style=\"font-family:宋体;font-size:10.5pt;\">）各个环节更加透明、公开，将会增强企业与客户的信任程度。</span><span style=\"font-family:宋体;font-size:10.5pt;\"></span> \r\n</p>\r\n<p style=\"text-indent:21pt;\" class=\"p\">\r\n	<span style=\"font-family:宋体;font-size:10.5pt;\">8</span><span style=\"font-family:宋体;font-size:10.5pt;\">）计量管理水平、企业信息化管理水平大大提高，以此为亮点，提升企业形象，为创立明星、标杆企业做好坚实的基础<img style=\"width:234px;height:355px;\" alt=\"\" src=\"/ccoa/attached/image/20160112/20160112111204_516.jpg\" width=\"1837\" height=\"3037\" /></span><span style=\"color:#000000;font-family:宋体;font-size:10.5pt;font-style:italic;\"></span> \r\n</p>\r\n<!--EndFragment-->', '金钟公司目前拥有专业信息化技术开发人员200余人，涉及软件开发、网络应用、结构设计、自动化实施等多个专业和领域，具有丰富的理论知识和实战经验。拥有山东省级技术研发中心和山东省工业智能衡器工程技术研究中心共两个研发中心。研发中心目前已拥有20项软件著作权和近百项专利。与国家粮食局科学院、郑州粮院、中华粮网、北京邮电大学、中南工业大学、山东大学、济南大学等多家科学院所进行了密切项目合作和人员交流。\r\n	金钟公司的信息化产品在粮油行业已经广泛应用：山东省粮油仓储管理信息系统、江西省储备粮管理系统、安徽省粮油仓储管理系统、山东粮油集团信息管理系统、济南第一粮库信息化管理系统、济南第二粮库智能通风管理系统、威海市粮食调控及储备业务智能管理系统、中储粮涿州直属库智能出入库系统、中储粮油脂镇江基地一卡通智能管控平台等等。\r\n	平台软件研发设计采用项目经理负责制，统一协调相关资源；硬件设备生产以自主加工为主，部分产品外协。项目安装、实施、售后均由项目组成员完成。智慧粮食云平台的研发建设紧跟先进技术和市场需求，也紧紧跟随国家十三五粮食发展战略，进行顶层模型设计，按照梯次化的层级模式进行规划，既考虑横向覆盖的广度，也关注纵向挖掘的深度，依托现有良好的信息化基础，结合粮安工程和百万吨建库任务，利用云计算、大数据、物联网等新技术逐步打造“智慧粮食”。\r\n	项目实施期限预计为2年，自2013年10月至2015年10月。在2015年10月份形成系统软件产品，完成当年30套，2000万元销售任务，取得10项专利和20项软件著作权，参与制定一项行业标准。\r\n	因此，在2020年之前，粮食信息化的建设会突飞猛进的进行，智慧粮食云平台将会不断的在各个省市、储备库得到应用，既能够满足高端，也能适应低端，产品应用会是一种爆发式的增长，市场竞争力非常强。每年将预计销售100套，年实现5000万至8000万元', '500', '2', '	按照目前的产品销售价格和市场占有率计算，以政策引导和市场推广为主要市场因素。', '<p style=\"text-indent:37.8pt;\" class=\"MsoNormal\">\r\n	<span style=\"color:#000000;font-family:&quot;Times New Roman&quot;;font-size:14pt;\"> </span><span style=\"font-family:宋体;font-size:10.5pt;\">平台建设将会更加节能，降低整体投资费用。</span><span style=\"font-family:宋体;font-size:10.5pt;\"><?xml:namespace prefix = o ns = \"urn:schemas-microsoft-com:office:office\" /></span>\r\n</p>\r\n<!--EndFragment-->', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/QQ图片2015123110461910.jpg', '2016', null, '8', '2', '4', null, '6', null, '2', '6', '3', '1', null, '34', '三等奖', '2016-01-12');
INSERT INTO `project` VALUES ('146', '165', '343', null, '4', 0x3432, '54,109,58,56,126,125,124,123,122', '2016-01-20', '2016-01-28', '3', null, '44', '0', null, '44', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/其他证明2.jpg', '44', '4', '44', '44', '44', '44', '44', '4', '4', '4', '44', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/其他证明2.jpg', '2016', null, '9', '3', '12', null, '343', null, '2', '6', '0', null, null, '31', null, '2016-01-21');
INSERT INTO `project` VALUES ('147', '175', '323', null, '2', null, null, '2016-01-20', '2016-01-29', '4', null, '3', '0', null, '3', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016', null, '0', null, '1', null, null, null, null, null, '0', null, null, '33', null, '2016-01-21');
INSERT INTO `project` VALUES ('148', '178', '3434', null, '3', null, null, '2016-01-06', '2016-01-21', '2', null, '4', '0', null, '4', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016', null, '0', null, '3', null, null, null, null, null, '0', null, null, '30', null, '2016-01-21');
INSERT INTO `project` VALUES ('149', '165', '4343', null, '2', null, null, '2016-01-18', '2016-01-22', '2', null, '444', '0', null, '4', null, null, null, null, null, null, null, null, null, null, null, null, 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/2015年度中国粮油学会科学技术奖申报书.pdf', '2016', null, '0', null, '11', null, null, null, null, null, '0', null, null, '30', null, '2016-01-22');
INSERT INTO `project` VALUES ('150', '165', '34334', null, '2', 0x3432, '54,109,58,56,126,125,124,123,122', '2016-01-18', '2016-01-29', '3', null, '55', '0', null, '55', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/其他证明1.jpg', 'sdds', 'dsd', 'dsd', 'dsd', 'dsd', 'dsd', 'dsds', '3', '3', 'cxcx', 'sdsd', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/其他证明1.jpg', '2016', '5', '2', null, '12', null, '5454', null, null, '1', '0', null, null, '30', null, '2016-01-25');
INSERT INTO `project` VALUES ('151', '175', '5445', null, '2', null, null, '2016-01-13', '2016-01-21', '2', '5', '5', '0', null, '5', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016', null, '0', null, '1', null, null, null, null, null, '0', null, null, '30', null, '2016-01-27');
INSERT INTO `project` VALUES ('152', '175', '4545', null, '3', null, null, '2016-01-13', '2016-01-13', '2,3', null, '545', '0', null, '545', null, null, null, null, null, null, null, null, null, null, null, null, null, '2016', null, '0', null, '1', null, null, null, null, null, '0', null, null, '29', null, '2016-01-27');
INSERT INTO `project` VALUES ('153', '175', '43', null, '2', null, null, '2016-01-13', '2016-01-28', '2', null, '4', '0', null, '4', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/其他证明1.jpg', '44', '44', '4', '4', '4', '4', '4', '4', '4', '4', '4', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/其他证明11.jpg', '2016', null, '1', null, '12', null, null, null, null, null, '0', null, null, '34', null, '2016-01-29');
INSERT INTO `project` VALUES ('154', '175', '45454', null, '3', null, null, '2016-02-09', '2016-02-10', '3', null, '545', '0', null, '545', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/其他证明1.jpg', 'dsd', 'dsd', 'dsd', 'dsd', 'dsd', 'dsd', 'dsd', '3', '3', '33', '33', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/其他证明2.jpg', '2016', null, '1', null, '12', null, null, null, null, null, '0', null, null, '31', null, '2016-02-03');
INSERT INTO `project` VALUES ('155', '175', '任务为俄文', null, '3', null, null, '2016-03-08', '2016-04-01', '2,3', '恩恩问问', null, '0', null, null, 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/jbqk/2.射线对赭曲霉毒素A的辐照降解与产物分析_迟蕾.pdf', '2323', '3232', '323', '323', '323', '323', '32323', '3', '3', '33', '333', 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/dwyj/5.高效液相色谱_串联质谱法检测花生中的黄曲霉毒素B_1_杨静.pdf', '2016', 'fd', '1', null, '12', null, '443', null, null, null, '0', null, null, '32', null, '2016-03-02');

-- ----------------------------
-- Table structure for `project_accessory`
-- ----------------------------
DROP TABLE IF EXISTS `project_accessory`;
CREATE TABLE `project_accessory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '上传类型',
  `filePath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '上传地址',
  `fileName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件名称',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_accessory
-- ----------------------------
INSERT INTO `project_accessory` VALUES ('113', '主要论著的复印件', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/范德萨发_基本信息.pdf', '范德萨发_基本信息', '133');
INSERT INTO `project_accessory` VALUES ('114', '被他人引用情况检索复印件', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/“食用油脂质量安全控制关键技术研发与应用”的客观评价意见.doc', '“食用油脂质量安全控制关键技术研发与应用”的客观评价意见', '133');
INSERT INTO `project_accessory` VALUES ('115', '科学评价证明', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/科协信发〔2015〕5号-年鉴表彰决定.doc', '科协信发〔2015〕5号-年鉴表彰决定', '133');
INSERT INTO `project_accessory` VALUES ('116', '技术评价证明(复印件)', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/IMG_20151231_094803.jpg', 'IMG_20151231_094803', '133');
INSERT INTO `project_accessory` VALUES ('117', '应用证明', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/IMG_20151231_0948031.jpg', 'IMG_20151231_0948031', '133');
INSERT INTO `project_accessory` VALUES ('118', '其它证明', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/QQ图片20151231104619.jpg', 'QQ图片20151231104619', '133');
INSERT INTO `project_accessory` VALUES ('119', '主要论著的复印件', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/2015年度粮油科技奖获奖项目决定(1).pdf', '2015年度粮油科技奖获奖项目决定(1)', '133');
INSERT INTO `project_accessory` VALUES ('120', '主要论著的复印件', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/茶叶籽油—低温低水份压榨纯物理精炼技术_基本信息.pdf', '茶叶籽油—低温低水份压榨纯物理精炼技术_基本信息', '136');
INSERT INTO `project_accessory` VALUES ('121', '被他人引用情况检索复印件', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/2015年度中国粮油学会科学技术奖申报书.pdf', '2015年度中国粮油学会科学技术奖申报书', '136');
INSERT INTO `project_accessory` VALUES ('122', '主要论著的复印件', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/国粮局“传承科学精神推进人才兴粮”座谈会通知.pdf', '国粮局“传承科学精神推进人才兴粮”座谈会通知', '139');
INSERT INTO `project_accessory` VALUES ('123', '主要论著的复印件', 'D:\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/2015年度粮油科技奖获奖项目决定1.pdf', '2015年度粮油科技奖获奖项目决定1', '139');
INSERT INTO `project_accessory` VALUES ('132', '主要论著的复印件', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/回传申报书.docx', '回传申报书', '146');
INSERT INTO `project_accessory` VALUES ('133', '主要论著的复印件', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/回传评分表222.doc', '回传评分表222', '150');
INSERT INTO `project_accessory` VALUES ('136', '主要论著的复印件', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/评分表模板.doc', '评分表模板', '137');
INSERT INTO `project_accessory` VALUES ('201', '主要论著的复印件', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/153/175/回传评分表222.doc', '回传评分表222.doc', '153');
INSERT INTO `project_accessory` VALUES ('202', '技术评价证明(复印件)', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/153/175/技术评价证明（如成果鉴定）.jpg', '技术评价证明（如成果鉴定）.jpg', '153');
INSERT INTO `project_accessory` VALUES ('203', '其它证明', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/153/175/技术评价证明（如成果鉴定）1.jpg', '技术评价证明（如成果鉴定）1.jpg', '153');
INSERT INTO `project_accessory` VALUES ('204', '其它证明', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/153/175/其他证明1.jpg', '其他证明1.jpg', '153');
INSERT INTO `project_accessory` VALUES ('205', '其它证明', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/153/175/其他证明2.jpg', '其他证明2.jpg', '153');
INSERT INTO `project_accessory` VALUES ('206', '其它证明', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/153/175/推荐意见.jpg', '推荐意见.jpg', '153');
INSERT INTO `project_accessory` VALUES ('207', '其它证明', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/153/175/应用证明.jpg', '应用证明.jpg', '153');
INSERT INTO `project_accessory` VALUES ('222', '主要论著的复印件', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/138/175/1/回传申报书.docx', '回传申报书.docx', '138');
INSERT INTO `project_accessory` VALUES ('223', '被他人引用情况检索复印件', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/138/175/2/回传评分表222.doc', '回传评分表222.doc', '138');
INSERT INTO `project_accessory` VALUES ('225', '科学评价证明', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/138/175/3/2015年度中国粮油学会科学技术奖申报书.pdf', '2015年度中国粮油学会科学技术奖申报书.pdf', '138');
INSERT INTO `project_accessory` VALUES ('226', '其它证明', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/138/175/6/其他证明2.jpg', '其他证明2.jpg', '138');
INSERT INTO `project_accessory` VALUES ('244', '主要论著的复印件', 'D:\\WorkSoft\\java\\64 bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/154/175/1/回传申报书.docx', '回传申报书.docx', '154');
INSERT INTO `project_accessory` VALUES ('283', '科学评价证明', 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/135/175/3/回传评分表222.doc', '回传评分表222.doc', '135');
INSERT INTO `project_accessory` VALUES ('300', '主要论著的复印件', 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/135/175/1/2015年度中国粮油学会科学技术奖申报书.pdf', '2015年度中国粮油学会科学技术奖申报书.pdf', '135');
INSERT INTO `project_accessory` VALUES ('301', '被他人引用情况检索复印件', 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/135/175/2/附件2.粮油科技成果鉴定申请表.doc', '附件2.粮油科技成果鉴定申请表.doc', '135');
INSERT INTO `project_accessory` VALUES ('302', '科学评价证明', 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/135/175/3/回传评分表222.doc', '回传评分表222.doc', '135');
INSERT INTO `project_accessory` VALUES ('303', '其它证明', 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/135/175/6/技术评价证明（如成果鉴定）.jpg', '技术评价证明（如成果鉴定）.jpg', '135');
INSERT INTO `project_accessory` VALUES ('304', '主要论著的复印件', 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/155/175/1/5.高效液相色谱_串联质谱法检测花生中的黄曲霉毒素B_1_杨静.pdf', '5.高效液相色谱_串联质谱法检测花生中的黄曲霉毒素B_1_杨静.pdf', '155');
INSERT INTO `project_accessory` VALUES ('305', '被他人引用情况检索复印件', 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/155/175/2/2.射线对赭曲霉毒素A的辐照降解与产物分析_迟蕾.pdf', '2.射线对赭曲霉毒素A的辐照降解与产物分析_迟蕾.pdf', '155');
INSERT INTO `project_accessory` VALUES ('306', '科学评价证明', 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/155/175/3/2015年度中国粮油学会科学技术奖申报书.pdf', '2015年度中国粮油学会科学技术奖申报书.pdf', '155');
INSERT INTO `project_accessory` VALUES ('307', '其它证明', 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/155/175/6/QQ截图20160302184209.jpg', 'QQ截图20160302184209.jpg', '155');
INSERT INTO `project_accessory` VALUES ('308', '应用证明', 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/155/175/5/技术评价证明（如成果鉴定）.jpg', '技术评价证明（如成果鉴定）.jpg', '155');
INSERT INTO `project_accessory` VALUES ('309', '技术评价证明(复印件)', 'D:\\WorkSoft\\java\\64bit\\apache-tomcat-7.0.63\\webapps\\ccoa/upload/uploads/155/175/4/其他证明2.jpg', '其他证明2.jpg', '155');

-- ----------------------------
-- Table structure for `project_economies`
-- ----------------------------
DROP TABLE IF EXISTS `project_economies`;
CREATE TABLE `project_economies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Year` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '年份',
  `Profit` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '新增利润',
  `Tax` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '新增税收',
  `Tevenue` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '创收外汇（美元）',
  `Cutting` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '节支总额',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_economies
-- ----------------------------
INSERT INTO `project_economies` VALUES ('71', '2009', '约70', null, null, '70', '136');
INSERT INTO `project_economies` VALUES ('72', '2010', '97.73', null, null, '97.73', '136');
INSERT INTO `project_economies` VALUES ('73', '2011', '115.82', null, null, '115.82', '136');
INSERT INTO `project_economies` VALUES ('74', '2012', '112.83', null, null, '112.83', '136');
INSERT INTO `project_economies` VALUES ('75', '2013', '89.6', null, null, '89.6', '136');
INSERT INTO `project_economies` VALUES ('76', '2014', '113.25', null, null, '113.25', '136');
INSERT INTO `project_economies` VALUES ('77', '2009', '约70', null, null, '70', '137');
INSERT INTO `project_economies` VALUES ('78', '2015', '300万元', '100万元', '5.5万元', '10万元', '139');
INSERT INTO `project_economies` VALUES ('79', '2016', '600万元', '200万元', '103.1万元', '15万元', '139');
INSERT INTO `project_economies` VALUES ('80', '2014', '1628', '650', '854', '365', '140');
INSERT INTO `project_economies` VALUES ('81', '2014', '720万元', '50万元', '100万元', '100万美元', '141');
INSERT INTO `project_economies` VALUES ('82', '2015', '500', '800', null, null, '145');
INSERT INTO `project_economies` VALUES ('83', '2323', '2323', '323', '323', '323', '154');

-- ----------------------------
-- Table structure for `project_group`
-- ----------------------------
DROP TABLE IF EXISTS `project_group`;
CREATE TABLE `project_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
  `Status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_group
-- ----------------------------
INSERT INTO `project_group` VALUES ('28', '油脂', '1');
INSERT INTO `project_group` VALUES ('29', '食品', '1');
INSERT INTO `project_group` VALUES ('30', '粮食储藏', '1');
INSERT INTO `project_group` VALUES ('31', '质检', '1');
INSERT INTO `project_group` VALUES ('32', '饲料', '1');
INSERT INTO `project_group` VALUES ('33', '粮油营养', '1');
INSERT INTO `project_group` VALUES ('34', '信息', '1');
INSERT INTO `project_group` VALUES ('35', '玉米深加工', '1');
INSERT INTO `project_group` VALUES ('36', '米制品', '1');
INSERT INTO `project_group` VALUES ('37', '物流', '1');

-- ----------------------------
-- Table structure for `project_key_person`
-- ----------------------------
DROP TABLE IF EXISTS `project_key_person`;
CREATE TABLE `project_key_person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Sort` int(11) DEFAULT NULL COMMENT '排序',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `Sex` int(1) DEFAULT NULL COMMENT '性别，1男，0女',
  `Nation` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '民族',
  `Homeplace` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '出生地',
  `Birthday` date DEFAULT NULL COMMENT '出生日期',
  `Parties` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '党派',
  `Company` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '工作单位',
  `ContactPhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系电话',
  `ContactAddress` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `ZipCode` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮政编码',
  `HomeAddress` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '家庭住址',
  `HomePhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '住宅电话',
  `EMail` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '电子信箱',
  `School` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '毕业学校',
  `Education` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '文化程度',
  `Degree` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '学位',
  `JobTitle` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '职务职称',
  `Speciality` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '专业专长',
  `Graduation` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '毕业时间',
  `Honor` text CHARACTER SET utf8 COMMENT '曾获奖励及荣誉',
  `StartTime` date DEFAULT NULL COMMENT '本项目起时间',
  `EndTime` date DEFAULT NULL COMMENT '本项目止时间',
  `Contribution` text CHARACTER SET utf8 COMMENT '创建性贡献',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_key_person
-- ----------------------------
INSERT INTO `project_key_person` VALUES ('99', '1', '王文高', '1', '汉', '山东', '1976-06-01', null, '上海市粮食科学研究所', '13916449201', '上海市府村路445号1幢', null, null, null, 'doublesstt@sina.com', null, null, null, '工程师', null, '2002-07-08', '中国粮油学会科技进步三等奖', '2012-07-08', '2013-12-09', '项目策划、组织项目实施及中试生产。', '133');
INSERT INTO `project_key_person` VALUES ('100', '2', '袁开金', '1', '汉', '上海', '1959-01-15', '中国共产党', '上海市粮食科学研究所', '13601727529', '上海市府村路445号1幢', null, null, null, null, null, null, null, null, null, null, null, '2012-07-02', '2013-12-31', '主要负责项目管理及项目协调。', '133');
INSERT INTO `project_key_person` VALUES ('101', '3', '陈凤香', '0', null, null, null, null, '上海', '110', '110', null, null, null, null, null, null, null, null, null, null, null, '2011-01-21', '2016-01-18', null, '133');
INSERT INTO `project_key_person` VALUES ('102', '4', '陈卫栋', '1', null, null, null, null, '上海市粮食科学研究所', '110', '110', null, null, null, null, null, null, null, null, null, null, null, '2012-01-11', '2016-01-12', null, '133');
INSERT INTO `project_key_person` VALUES ('103', '5', '王波', '1', null, null, null, null, '禁办制药', '110', '110', null, null, null, null, null, null, null, null, null, null, null, '2014-01-13', '2015-12-25', null, '133');
INSERT INTO `project_key_person` VALUES ('104', '6', '谈黎明', '1', null, null, null, null, '工作单位	上海金伴药业有限公司', '110', '110', null, null, null, null, null, null, null, null, null, null, null, '2015-01-05', '2016-01-28', null, '133');
INSERT INTO `project_key_person` VALUES ('105', '7', '朱天仪', '1', null, null, null, null, '110', '110', '110', null, null, null, null, null, null, null, null, null, null, null, '2016-01-04', '2016-01-21', null, '133');
INSERT INTO `project_key_person` VALUES ('106', '1', '郑伟', '1', null, null, null, null, '上海市粮食科学研究所', '13681779931', '上海市府村路445号1幢', null, null, null, null, null, null, null, null, null, null, null, '2016-01-04', '2016-01-27', null, '134');
INSERT INTO `project_key_person` VALUES ('107', '2', '陈慧', '0', null, null, null, null, '上海市粮食科学研究所', '13611899440', '上海市府村路445号1幢', null, null, null, null, null, null, null, null, null, null, null, '2016-01-04', '2016-01-27', null, '134');
INSERT INTO `project_key_person` VALUES ('108', '1', '金德国', '1', null, null, null, null, '贵州南方嘉木食品有限公司', '123456789', '贵州南方嘉木食品有限公司', null, null, null, null, null, null, null, null, null, null, null, '2004-10-08', '2009-06-08', null, '135');
INSERT INTO `project_key_person` VALUES ('109', '2', '彭朝军', '1', null, null, null, null, '贵州南方嘉木食品有限公司', '12345687988', '贵州南方嘉木食品有限公司', null, null, null, null, null, null, null, null, null, null, null, '2004-10-08', '2009-06-08', null, '135');
INSERT INTO `project_key_person` VALUES ('110', '3', '任子东', '1', null, null, null, null, '贵州南方嘉木食品有限公司', '13528457899', '贵州南方嘉木食品有限公司', null, null, null, null, null, null, null, null, null, null, null, '2004-10-08', '2009-06-08', null, '135');
INSERT INTO `project_key_person` VALUES ('111', '4', '陈智斌', '1', null, null, null, null, '贵州南方嘉木食品有限公司', '13552555555', '贵州南方嘉木食品有限公司', null, null, null, null, null, null, null, null, null, null, null, '2004-10-08', '2009-06-08', null, '135');
INSERT INTO `project_key_person` VALUES ('112', '1', '郝波 ', '1', '汉族 ', '江苏溧阳 ', '1956-01-04', '中共党员 ', '江苏正昌粮机股份有限公司 ', '051987309810', '溧阳市正昌路 28 号，江苏正昌粮机股份有限公司', '213300', '江苏省溧阳市', '无', 'webmaster@zcme.com', '江苏理工大学', '研究生 ', '学士 ', '总裁 ', ' 机制 ', '1980-02-07', '江苏省“333”跨世纪学术带头人、全国“五一”劳动奖章 获得者、九届全国人大代表、先后获部、省科技进步奖多次 ', '2012-06-07', '2013-12-05', '1、对国内外产品进行系统调研，确定总体技术方案。 2、指导各工段的主要设计。 3、确定粉碎室结构等技术方案。 ', '136');
INSERT INTO `project_key_person` VALUES ('114', '2', '洑飞波', '1', '汉 ', '常州市溧阳市 ', '1984-12-11', '群众 ', '江苏正昌粮机股份有限公司 ', '13813565505', '溧阳市正昌路 28 号', '213300', '溧阳市天目湖镇美景天城 ', '无', 'ffb1546@163.com', '常州机电职业技术 学院 ', '大学', '学士 ', '中级 ', '机械设计 ', '2006-01-19', '参与多项国家重点新产品、国家火炬、攻关计划的项目实施 工作，先后获行业和常州市科技进步奖三等奖多次，主持负 责开发的多项产品获国家发明专利', '2012-06-06', '2013-12-10', '总体结构、总装、部装和主轴等零部件设计', '136');
INSERT INTO `project_key_person` VALUES ('115', '3', '史顺达', '1', '汉', '常州市溧阳市', '1981-09-17', '群众', '江苏正昌粮机股份有限公司', '13813525129', '溧阳市正昌路 28 号', '213300', '溧阳市溧城镇新庄史家村 128 号', '无', 'shundashi@sohu.com', '江苏技术师范学院 ', '本科 ', '学士 ', '设计师 ', '工业设计', '2004-06-16', '荣誉称号情况： 参与多项国家重点新产品、国家火炬、攻关计划的项目实施 工作，主持负责开发的多项产品获国家发明专利', '2012-07-17', '2013-12-18', '粉碎室等部件设计', '136');
INSERT INTO `project_key_person` VALUES ('117', '1', '苏从毅', '1', '汉族', null, null, null, '无锡中粮工程科技有限公司', '18921515800 ', '江苏省无锡市滨湖区梅园贾巷109号   ', null, null, null, null, null, null, null, null, null, null, null, '2016-01-04', '2016-01-13', null, '139');
INSERT INTO `project_key_person` VALUES ('118', '1', '陈正俊', '1', null, null, null, null, '江苏牧羊控股有限公司', '0514-85828888', '江苏省扬州市华声路1号', null, null, null, null, null, null, null, null, null, null, null, '2015-12-28', '2016-01-27', null, '140');
INSERT INTO `project_key_person` VALUES ('119', '1', '杨新俊', '1', '汉', null, null, null, '南京工业大学', '13921422066', '无锡市蠡湖大道1800号，214122', null, null, null, null, null, null, null, null, null, null, null, '2015-12-29', '2016-01-29', null, '141');
INSERT INTO `project_key_person` VALUES ('120', '1', '周惠明', '1', null, null, null, null, '江南大学', '0510-85329037', '江苏省无锡市蠡湖大道1800号江南大学', null, null, null, null, null, null, null, null, null, null, null, '2015-12-31', '2016-01-26', null, '142');
INSERT INTO `project_key_person` VALUES ('121', '1', '阮竞兰', '0', null, null, null, null, '河南工业大学', '18623717729', '河南省郑州市中原路195号', null, null, null, null, null, null, null, null, null, null, null, '2014-01-13', '2016-01-05', null, '143');
INSERT INTO `project_key_person` VALUES ('122', '1', '严晓平', '1', null, null, null, null, '中储粮成都粮食储藏科学研究所', '28-87666620', '四川成都青羊区广富路239号N32栋 ', null, null, null, null, null, null, null, null, null, null, null, '2016-01-04', '2016-01-07', null, '144');
INSERT INTO `project_key_person` VALUES ('123', '1', '高绍和', '1', null, null, null, null, '济南金钟电子衡器股份有限公司', '0531—82569179', '山东省济南市英雄山路147号', null, null, null, null, null, null, null, null, null, null, null, '2015-12-29', '2016-01-28', null, '145');
INSERT INTO `project_key_person` VALUES ('124', '2', '王小三', '1', null, null, null, null, '实施', '1235', '所得到的', null, null, null, null, null, null, null, null, null, null, null, '2016-01-05', '2016-01-21', null, '145');
INSERT INTO `project_key_person` VALUES ('125', '1', '汤见平', '1', '汉', null, '1968-05-01', '无', '中粮新沙粮油工业(东莞)有限公司', '13802115331', '广东省东莞市麻涌镇新沙港工业区', null, null, null, 'tangjianping@cofco.com', '武汉粮食工业学院', '本科', '学士', '总经理助理 工程师', '油脂工程', '1991-07-01', '1、负责该项目的前期可行性论证并完成可行性报告；\r\n2、当任“中粮新沙无水脱皂工艺改造项目组”组长、技术负责人，负责项目的具体实施；\r\n3、负责项目工艺设计、设备布置、工程施工图评审、项目建设的技术论证；\r\n4、负责项目工程进度等具体工作、施工协调、质量监督、施工安全监督等；\r\n', '2008-05-01', '2009-07-08', null, '138');
INSERT INTO `project_key_person` VALUES ('126', '2', '陈玉军', '1', '汉', null, '1964-02-06', '无', '中粮北海粮油工业（天津）有限公司', '13802115331', '天津市塘沽区胡北路869号', '.', null, null, 'chen-yj@cofco.com', '无锡轻工业学院', '本科', '学士', '副总经理', '油脂工程', '1986-07-03', '1、当任“中粮油脂部无水脱皂工艺项目小组”集团技术顾问，负责该项目的前期可行性论证并完成可行性报告。\r\n2、组织油脂部专家组进行项目验收并提出了许多改造建议。\r\n3、完成项目的验收，推广。\r\n', '2008-05-07', '2009-07-08', null, '138');
INSERT INTO `project_key_person` VALUES ('127', '3', '严中和', '1', '汉', null, '1969-03-06', null, '中粮新沙粮油工业(东莞)有限公司', '13678995531', '广东省东莞市麻涌镇新沙港工业区', null, null, null, 'yanzhonghe@cofco.com', '武汉粮食工业学院', '本科', '学士', '经理  工程师', '油脂工程', '1991-07-10', '\r\n1、“中粮新沙无水脱皂工艺改造项目组”组员，负责项目的具体实施；\r\n2、参与负责项目工艺设计、设备布置、工程施工图评审、项目建设的技术论证；\r\n3、负责工艺设备及管道的现场安装指导；\r\n4、负责组织生产调试，调试数据的收集、整理，初步分析，起草调试工作总结。\r\n', '2008-05-08', '2009-07-15', null, '138');
INSERT INTO `project_key_person` VALUES ('128', '4', '杨 军', '1', '汉', null, '1979-11-14', '无', '中粮新沙粮油工业(东莞)有限公司', '13532323753', '广东省东莞市麻涌镇新沙港工业区', null, null, null, 'yjgood@163.com', '南昌大学', '大专', null, '主管', '行政管理', '2007-07-19', '1、前期预复脱色工艺资料的收集，协助预复脱色改造工艺图纸的绘制，进行设备、 管件、阀门等的初步预算；\r\n2、设备、管线安装过程，参与现场管线布置及连接确认；\r\n3、参与无水脱皂-预复脱色的调试工作，针对调试过程中出现的问题，提出改进建议。\r\n', '2008-05-14', '2009-07-16', null, '138');
INSERT INTO `project_key_person` VALUES ('129', '5', '廖锦春', '1', '壮', null, '1972-02-10', '无', '中粮油脂（钦州）有限公司', '15107899621', '广西钦州市钦州港滨海小区A1栋三楼', '535008', null, null, 'liaojc@cofco.com', '广西大学', '本科', '学士', '主任、助理工程', '食品工程', '1996-07-18', '1、起草该项目的工艺流程图纸、设备布置图纸；\r\n2、项目建设的现场管理，负责工程实施、进度管理、质量监督、施工协调、安全监督等；\r\n3、有无水脱皂生产经验，负责现场员工培训，生产调试的现场指导。\r\n', '2008-05-07', '2009-07-14', null, '138');
INSERT INTO `project_key_person` VALUES ('130', '6', '姓  名', '1', '汉', null, null, '无', '中粮新沙粮油工业(东莞)有限公司', '15992916436', '广东省东莞市麻涌镇新沙港工业区', null, null, null, null, null, null, null, '副经理', null, null, '1、参与工程施工图评审、项目建设的技术论证、施工协调、质量监督、施工安全监督等。\r\n2、负责工程的实施，主要是钢结构改造，设备及管道布局评审，吊装设备的改造，两个调和罐的制造等。\r\n', '2008-05-07', '2009-07-01', null, '138');
INSERT INTO `project_key_person` VALUES ('131', '2', '1', '1', null, null, null, null, '1', '1', '1', null, null, null, null, null, null, null, null, null, null, null, '2016-01-13', '2016-01-21', null, '148');
INSERT INTO `project_key_person` VALUES ('132', '1', '3', '1', '3', '3', null, null, '4', '5', '6', null, null, null, null, null, null, null, null, null, null, null, '2016-01-12', '2016-01-21', null, '148');
INSERT INTO `project_key_person` VALUES ('133', '1', '4', '1', null, null, null, null, '4', '4', '4', null, null, null, null, null, null, null, null, null, null, null, '2016-01-07', '2016-01-21', null, '146');
INSERT INTO `project_key_person` VALUES ('134', '1', '434', '1', '434', '434', '2016-01-28', '434', '434', '434', '434', '434', null, null, '434@qq.com', '434', '343', '434', '432434', '4343', '2016-01-21', '434', '2016-01-13', '2016-01-21', '434', '149');
INSERT INTO `project_key_person` VALUES ('135', '1', '345545', '1', '55', '55', '2016-01-12', '55', '55', '55', '55', '55', null, null, '55@qq.com', '343', '434', '434', '343', '434', '2016-01-26', '434', '2016-01-18', '2016-01-27', '434', '150');
INSERT INTO `project_key_person` VALUES ('136', '1', '4', '1', '4', '4', '2016-01-27', '4', '4', '4', '4', '4', null, null, '24dsdf@qq.com', '3434', '434', '434', '434', '434', '2016-01-04', '434', '2016-01-05', '2016-01-05', '434', '137');
INSERT INTO `project_key_person` VALUES ('137', '1', '4', '1', '4', '4', '2016-01-05', '4', '4', '4', '4', '4', null, null, '44@22.com', '34', '434', '434', '4', '4', '2016-01-19', '44', '2016-01-27', '2016-01-28', '44', '153');
INSERT INTO `project_key_person` VALUES ('138', '1', '3434', '1', '434', '434', '2016-02-09', '434', '343', '434', '434', '434', '34', '434', '34@qq.cvom', '434', '34', '34', '434', '434', '2016-02-02', '434', '2016-02-22', '2016-02-25', '43', '154');
INSERT INTO `project_key_person` VALUES ('139', '1', '2', '1', '2', '2', '2016-03-14', '2', '2', '22', '2', '2', null, null, '2@qq.com', '2', '2', '2', '2', '2', '2016-03-22', '22', '2016-03-16', '2016-04-01', '222', '155');

-- ----------------------------
-- Table structure for `project_major_company`
-- ----------------------------
DROP TABLE IF EXISTS `project_major_company`;
CREATE TABLE `project_major_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Sort` int(11) DEFAULT NULL COMMENT '排序',
  `CompanyName` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位名称',
  `CompanyAddress` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '通讯地址',
  `ZipCode` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮政编码',
  `LinkMan` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人',
  `LinkPhone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系电话',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_major_company
-- ----------------------------
INSERT INTO `project_major_company` VALUES ('107', '上海市粮食科学研究所', '上海市府村路445号1幢', '200333', '袁开金', '1111', '133');
INSERT INTO `project_major_company` VALUES ('108', '上海市粮食科学研究所', '上海市普陀区府村路445号1幢', '200333', '郑伟', '13681779931', '134');
INSERT INTO `project_major_company` VALUES ('109', '贵州南方嘉木食品有限公司', '贵州南方嘉木食品有限公司', '123456', '贵州南方嘉木食品有限公司', '1234568797887', '135');
INSERT INTO `project_major_company` VALUES ('110', '江苏正昌粮机股份有限公 司', '溧阳市昆仑开发区正昌路 28 号', '123456', '周玉东', '13921066609', '136');
INSERT INTO `project_major_company` VALUES ('112', '中粮工程装备（张家口）有限公司', '河北省张家口市产业集聚区中粮大街4号', '123000', '徐桂清', '13703133948', '139');
INSERT INTO `project_major_company` VALUES ('113', '江苏牧羊控股有限公司', '江苏省扬州市华声路1号', '225127', '调研', '0514-85828888', '140');
INSERT INTO `project_major_company` VALUES ('114', '江南大学', '无锡市蠡湖大道1800号', '130012', '杨新俊', '0510-85910390', '141');
INSERT INTO `project_major_company` VALUES ('115', '无锡轻大食品装备有限公司', '无锡市凤翔北路15号', '100032', '赵欢', '0510-85819190', '141');
INSERT INTO `project_major_company` VALUES ('116', '江南大学', '江苏无锡蠡湖大道1800号', '214122', '彭伟', '13771541880', '142');
INSERT INTO `project_major_company` VALUES ('117', '河南工业大学', '郑州市高新区莲花街100号河南工业大学', '450001', '惠延波', '0371-67756860', '143');
INSERT INTO `project_major_company` VALUES ('118', '中储粮成都粮食储藏科学研究所', '四川成都青羊区广富路239号N32栋', '610091', '周浩', '028-87662397', '144');
INSERT INTO `project_major_company` VALUES ('119', '济南金钟电子衡器股份有限公司', '济南市市中区英雄山路147号金钟大厦', '250002', '祁波', '18653171572', '145');
INSERT INTO `project_major_company` VALUES ('120', '中粮集团油脂部中粮新沙粮油工业(东莞)有限公司', '广东省东莞市麻涌镇新沙港工业区', '523147', '汤见平', '076988825601', '138');
INSERT INTO `project_major_company` VALUES ('121', '34', '4344', '4', '434', '4', '146');
INSERT INTO `project_major_company` VALUES ('122', '45454', '4', '434', '4', '4', '149');
INSERT INTO `project_major_company` VALUES ('123', '1', '1', '1', '1', '1', '149');
INSERT INTO `project_major_company` VALUES ('124', '343', '4344', '4', '4', '4', '150');
INSERT INTO `project_major_company` VALUES ('125', '4545', '4', '4', '4', '4', '137');
INSERT INTO `project_major_company` VALUES ('126', '4', '4', '4', '4', '4', '153');
INSERT INTO `project_major_company` VALUES ('127', '3434', '434', '434', '434', '434', '154');
INSERT INTO `project_major_company` VALUES ('128', '12', '2', '2', '2', '2', '155');

-- ----------------------------
-- Table structure for `project_property`
-- ----------------------------
DROP TABLE IF EXISTS `project_property`;
CREATE TABLE `project_property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Categories` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '知识产权类别及国家（地区）',
  `Name` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '知识产权具体名称',
  `ApplyDate` date DEFAULT NULL COMMENT '申请日期',
  `AuthorityDate` date DEFAULT NULL COMMENT 'AuthorityDate',
  `PatentNumber` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '专利号',
  `Obligee` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '权利人',
  `Inventor` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '发明人',
  `ProjectID` int(11) DEFAULT NULL COMMENT '所属项目',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of project_property
-- ----------------------------
INSERT INTO `project_property` VALUES ('77', '中国', '一种薄膜精馏制取药品级大豆亚油酸的方法', null, null, '201310705258.7', null, null, '133');
INSERT INTO `project_property` VALUES ('78', '无', '无', null, null, null, null, null, '134');
INSERT INTO `project_property` VALUES ('79', '无', '无', null, null, null, null, null, '136');
INSERT INTO `project_property` VALUES ('80', '中国', '磨粉机辊轮传动机构及包含该机构的磨粉机', '2016-01-04', '2016-01-13', 'EP13848274.0', '中粮工程装备（张家口）有限公司', '徐桂清', '139');
INSERT INTO `project_property` VALUES ('81', '发明，中国', '磨粉机辊轮传动机构、磨粉机', '2015-01-05', '2016-01-05', '201210407923X', '中粮工程装备（张家口）有限公司', '徐桂清', '139');
INSERT INTO `project_property` VALUES ('82', '无', '无', null, null, null, null, null, '140');
INSERT INTO `project_property` VALUES ('83', '中国', '用于高效剪切微细粉碎机中的粉碎头装置', null, null, null, null, null, '141');
INSERT INTO `project_property` VALUES ('84', '发明专利', '一种小麦组织化蛋白的制备方法', null, null, null, null, null, '142');
INSERT INTO `project_property` VALUES ('85', '无', '无', null, null, null, null, null, '143');
INSERT INTO `project_property` VALUES ('86', '无', '无', null, null, null, null, null, '144');
INSERT INTO `project_property` VALUES ('87', '发明专利，中国', '数字粮库智能出入库系统', null, null, null, null, null, '145');
INSERT INTO `project_property` VALUES ('88', '无', '无', null, null, null, null, null, '138');
INSERT INTO `project_property` VALUES ('89', '4', '4', null, null, null, null, null, '146');
INSERT INTO `project_property` VALUES ('90', 'd', 'd', null, null, null, null, null, '150');
INSERT INTO `project_property` VALUES ('91', '5', '5', null, null, null, null, null, '135');
INSERT INTO `project_property` VALUES ('92', '4', '4', null, null, null, null, null, '137');
INSERT INTO `project_property` VALUES ('93', '4', '4', null, null, null, null, null, '153');
INSERT INTO `project_property` VALUES ('94', '34', '434', '2016-02-09', '2016-02-10', '3434', '434', '434', '154');
INSERT INTO `project_property` VALUES ('95', '3', '3', null, null, null, null, null, '155');

-- ----------------------------
-- Table structure for `project_review`
-- ----------------------------
DROP TABLE IF EXISTS `project_review`;
CREATE TABLE `project_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `projectID` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '项目编号',
  `expertID` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '专家编号',
  `score` decimal(10,2) DEFAULT NULL COMMENT '分数',
  `recommend` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否推荐',
  `prize` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否推荐一等奖',
  `note` longtext CHARACTER SET utf8  COMMENT '意见',
  `status` char(2) COLLATE utf8_bin DEFAULT '0' COMMENT '操作',
  `prdescribe` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `scoreParam` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '分数属性，用逗号隔开(12,15,13,14,13)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of project_review
-- ----------------------------
INSERT INTO `project_review` VALUES ('326', '133', '109', '84.00', '1', '0', null, '2', '技术创新程度:14, 技术经济指标的先进程度:11, 技术创新对提高市场竞争能力的作用:24, 已获得经济效益:24, 推动科技进步的作用:11');
INSERT INTO `project_review` VALUES ('327', '140', '109', '92.80', '1', '1', 'henhao ', '2', '新颖性与创造性:30, 技术先进性:30, 成熟完备性与转化应用情况:19, 发展前景及促进科技进步的作用:13.8');
INSERT INTO `project_review` VALUES ('328', '142', '109', '58.00', '0', '0', null, '2', '技术创新程度:14, 技术经济指标的先进程度:11, 技术创新对提高市场竞争能力的作用:11, 已获得经济效益:11, 推动科技进步的作用:11');
INSERT INTO `project_review` VALUES ('329', '145', '109', '83.00', '1', '0', null, '2', '技术创新程度:12, 技术经济指标的先进程度:12, 技术创新对提高市场竞争能力的作用:24, 已获得经济效益:24, 推动科技进步的作用:11');
INSERT INTO `project_review` VALUES ('330', '133', '54', '84.00', '1', '1', null, '2', '技术创新程度:11, 技术经济指标的先进程度:19, 技术创新对提高市场竞争能力的作用:21, 已获得经济效益:22, 推动科技进步的作用:11');
INSERT INTO `project_review` VALUES ('331', '133', '58', '89.00', '1', '1', null, '2', '技术创新程度:14, 技术经济指标的先进程度:17, 技术创新对提高市场竞争能力的作用:22, 已获得经济效益:22, 推动科技进步的作用:14');
INSERT INTO `project_review` VALUES ('332', '133', '56', '85.00', '1', '1', null, '2', '技术创新程度:14, 技术经济指标的先进程度:18, 技术创新对提高市场竞争能力的作用:21, 已获得经济效益:21, 推动科技进步的作用:11');
INSERT INTO `project_review` VALUES ('333', '143', '125', '76.00', '0', '0', null, '2', '新颖性与创造性:26, 技术先进性:26, 成熟完备性与转化应用情况:12, 发展前景及促进科技进步的作用:12');
INSERT INTO `project_review` VALUES ('334', '144', '125', '86.00', '1', '1', null, '2', '技术创新程度:12,技术指标的先进程度:18, 推广、应用程度:21,已获得社会、生态、环境效益:21,对科技进步的推动作用:14');
INSERT INTO `project_review` VALUES ('335', '143', '124', '91.00', '1', '1', null, '2', '新颖性与创造性:25, 技术先进性:28, 成熟完备性与转化应用情况:19, 发展前景及促进科技进步的作用:19');
INSERT INTO `project_review` VALUES ('336', '144', '124', '88.00', '1', '1', null, '2', '技术创新程度:14,技术指标的先进程度:18, 推广、应用程度:21,已获得社会、生态、环境效益:21,对科技进步的推动作用:14');
INSERT INTO `project_review` VALUES ('337', '143', '123', '94.00', '1', '1', null, '2', '新颖性与创造性:28, 技术先进性:28, 成熟完备性与转化应用情况:19, 发展前景及促进科技进步的作用:19');
INSERT INTO `project_review` VALUES ('338', '144', '123', '89.00', '1', '1', null, '2', '技术创新程度:14,技术指标的先进程度:19, 推广、应用程度:21,已获得社会、生态、环境效益:21,对科技进步的推动作用:14');
INSERT INTO `project_review` VALUES ('339', '136', '123', '86.00', '1', '0', null, '2', '技术创新程度:14, 技术经济指标的先进程度:19, 技术创新对提高市场竞争能力的作用:21, 已获得经济效益:21, 推动科技进步的作用:11');
INSERT INTO `project_review` VALUES ('340', '139', '123', '86.00', '1', '0', null, '2', '技术创新程度:14, 技术经济指标的先进程度:19, 技术创新对提高市场竞争能力的作用:21, 已获得经济效益:21, 推动科技进步的作用:11');
INSERT INTO `project_review` VALUES ('341', '141', '123', '92.00', '1', '0', null, '2', '技术创新程度:14,技术指标的先进程度:19, 推广、应用程度:21,已获得社会、生态、环境效益:24,对科技进步的推动作用:14');
INSERT INTO `project_review` VALUES ('342', '136', '122', '90.00', '1', '1', null, '2', '技术创新程度:14, 技术经济指标的先进程度:17, 技术创新对提高市场竞争能力的作用:24, 已获得经济效益:24, 推动科技进步的作用:11');
INSERT INTO `project_review` VALUES ('343', '139', '122', '87.00', '1', '0', null, '2', '技术创新程度:14, 技术经济指标的先进程度:17, 技术创新对提高市场竞争能力的作用:21, 已获得经济效益:21, 推动科技进步的作用:14');
INSERT INTO `project_review` VALUES ('344', '141', '122', '88.00', '1', '1', null, '2', '技术创新程度:14,技术指标的先进程度:18, 推广、应用程度:21,已获得社会、生态、环境效益:21,对科技进步的推动作用:14');
INSERT INTO `project_review` VALUES ('345', '136', '121', '88.00', '1', '0', null, '2', '技术创新程度:14, 技术经济指标的先进程度:18, 技术创新对提高市场竞争能力的作用:21, 已获得经济效益:21, 推动科技进步的作用:14');
INSERT INTO `project_review` VALUES ('346', '139', '121', '90.00', '1', '1', null, '2', '技术创新程度:14, 技术经济指标的先进程度:17, 技术创新对提高市场竞争能力的作用:21, 已获得经济效益:24, 推动科技进步的作用:14');
INSERT INTO `project_review` VALUES ('347', '141', '121', '88.00', '1', '0', null, '2', '技术创新程度:14,技术指标的先进程度:17, 推广、应用程度:24,已获得社会、生态、环境效益:21,对科技进步的推动作用:12');
INSERT INTO `project_review` VALUES ('348', '140', '114', '74.00', '0', '0', null, '2', '新颖性与创造性:24, 技术先进性:24, 成熟完备性与转化应用情况:14, 发展前景及促进科技进步的作用:12');
INSERT INTO `project_review` VALUES ('349', '142', '114', '87.00', '1', '0', null, '2', '技术创新程度:14, 技术经济指标的先进程度:17, 技术创新对提高市场竞争能力的作用:21, 已获得经济效益:21, 推动科技进步的作用:14');
INSERT INTO `project_review` VALUES ('350', '145', '114', '90.00', '1', '1', null, '2', '技术创新程度:14, 技术经济指标的先进程度:17, 技术创新对提高市场竞争能力的作用:24, 已获得经济效益:21, 推动科技进步的作用:14');
INSERT INTO `project_review` VALUES ('351', '140', '102', '90.00', '1', '1', null, '2', '新颖性与创造性:27, 技术先进性:27, 成熟完备性与转化应用情况:18, 发展前景及促进科技进步的作用:18');
INSERT INTO `project_review` VALUES ('352', '142', '102', '87.00', '1', '1', null, '2', '技术创新程度:14, 技术经济指标的先进程度:17, 技术创新对提高市场竞争能力的作用:24, 已获得经济效益:21, 推动科技进步的作用:11');
INSERT INTO `project_review` VALUES ('353', '145', '102', '88.00', '1', '1', null, '2', '技术创新程度:14, 技术经济指标的先进程度:18, 技术创新对提高市场竞争能力的作用:21, 已获得经济效益:21, 推动科技进步的作用:14');
INSERT INTO `project_review` VALUES ('354', '140', '101', '90.00', '1', '1', null, '2', '新颖性与创造性:27, 技术先进性:27, 成熟完备性与转化应用情况:18, 发展前景及促进科技进步的作用:18');
INSERT INTO `project_review` VALUES ('355', '142', '101', '86.00', '1', '0', null, '2', '技术创新程度:14, 技术经济指标的先进程度:18, 技术创新对提高市场竞争能力的作用:21, 已获得经济效益:22, 推动科技进步的作用:11');
INSERT INTO `project_review` VALUES ('356', '145', '101', '88.00', '1', '0', null, '2', '技术创新程度:14, 技术经济指标的先进程度:18, 技术创新对提高市场竞争能力的作用:21, 已获得经济效益:21, 推动科技进步的作用:14');
INSERT INTO `project_review` VALUES ('357', '133', '126', '30.00', '0', '0', '999', '1', '技术创新程度:6, 技术经济指标的先进程度:6, 技术创新对提高市场竞争能力的作用:6, 已获得经济效益:6, 推动科技进步的作用:6\'');

-- ----------------------------
-- Table structure for `project_review_gather`
-- ----------------------------
DROP TABLE IF EXISTS `project_review_gather`;
CREATE TABLE `project_review_gather` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectID` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '项目编号',
  `expertID` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '专家编号',
  `score` decimal(10,2) DEFAULT NULL COMMENT '分数',
  `vote` char(2) COLLATE utf8_bin DEFAULT NULL COMMENT '是否推荐',
  `note` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `status` char(2) COLLATE utf8_bin DEFAULT '0' COMMENT '操作(初始化为0；1为已评审还没提交；2已提交',
  `statusTp` char(2) COLLATE utf8_bin DEFAULT '0' COMMENT '投票操作状态(初始化为0,1投票，2提交)',
  `prdescribe` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of project_review_gather
-- ----------------------------
INSERT INTO `project_review_gather` VALUES ('455', '133', '54', '85.00', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('456', '133', '123', null, '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('457', '133', '121', '87.00', null, null, '2', '0', null);
INSERT INTO `project_review_gather` VALUES ('458', '133', '119', '87.00', '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('459', '133', '117', '84.00', '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('460', '136', '54', '58.00', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('461', '136', '123', '64.00', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('462', '136', '121', '86.00', null, null, '2', '0', null);
INSERT INTO `project_review_gather` VALUES ('463', '136', '120', '90.00', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('464', '136', '119', '87.00', '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('465', '136', '117', '50.00', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('466', '139', '53', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('467', '139', '54', '55.00', '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('468', '139', '123', '84.00', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('469', '139', '121', '89.00', null, null, '2', '0', null);
INSERT INTO `project_review_gather` VALUES ('470', '139', '120', '54.00', '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('471', '139', '119', '90.00', '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('472', '139', '117', '50.00', '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('473', '140', '53', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('474', '140', '54', '70.00', '0', null, '2', '2', '新颖性与创造性:21, 技术先进性:21, 成熟完备性与转化应用情况:14, 发展前景及促进科技进步的作用:14');
INSERT INTO `project_review_gather` VALUES ('475', '140', '123', null, '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('476', '140', '121', '86.00', null, null, '2', '0', '新颖性与创造性:28, 技术先进性:28, 成熟完备性与转化应用情况:15, 发展前景及促进科技进步的作用:15');
INSERT INTO `project_review_gather` VALUES ('477', '140', '120', '92.00', '1', null, '2', '2', '新颖性与创造性:28, 技术先进性:28, 成熟完备性与转化应用情况:18, 发展前景及促进科技进步的作用:18');
INSERT INTO `project_review_gather` VALUES ('478', '140', '119', '88.00', '1', null, '2', '2', '新颖性与创造性:27, 技术先进性:27, 成熟完备性与转化应用情况:17, 发展前景及促进科技进步的作用:17');
INSERT INTO `project_review_gather` VALUES ('479', '140', '117', '85.00', '1', null, '2', '2', '新颖性与创造性:22, 技术先进性:30, 成熟完备性与转化应用情况:15, 发展前景及促进科技进步的作用:18');
INSERT INTO `project_review_gather` VALUES ('480', '141', '53', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('481', '141', '54', '55.50', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('482', '141', '123', '67.00', '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('483', '141', '121', '41.00', null, null, '2', '0', null);
INSERT INTO `project_review_gather` VALUES ('484', '141', '120', '88.00', '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('485', '141', '119', '55.00', '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('486', '141', '117', '50.00', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('487', '142', '53', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('488', '142', '54', '55.23', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('489', '142', '123', null, '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('490', '142', '121', '50.00', null, null, '2', '0', null);
INSERT INTO `project_review_gather` VALUES ('491', '142', '120', '50.00', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('492', '142', '119', '55.00', '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('493', '142', '117', '50.00', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('494', '144', '53', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('495', '144', '54', '79.17', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('496', '144', '123', '88.00', '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('497', '144', '121', '85.00', null, null, '2', '0', null);
INSERT INTO `project_review_gather` VALUES ('498', '144', '120', '91.80', '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('499', '144', '119', '90.00', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('500', '144', '117', '86.00', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('501', '145', '53', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('502', '145', '54', '55.00', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('503', '145', '123', null, '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('504', '145', '121', '89.00', null, null, '2', '0', null);
INSERT INTO `project_review_gather` VALUES ('505', '145', '120', '88.00', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('506', '145', '119', '64.00', '0', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('507', '145', '117', '71.00', '1', null, '2', '2', null);
INSERT INTO `project_review_gather` VALUES ('508', '146', '53', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('509', '146', '54', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('510', '146', '123', '2.00', null, null, '1', '0', '技术创新程度:0, 技术指标的先进程度:0, 推广、应用程度:0, 已获得社会、生态、环境效益:0, 对科技进步的推动作用:2\'');
INSERT INTO `project_review_gather` VALUES ('511', '146', '121', '56.00', null, '陈富渊测试', '1', '0', '技术创新程度:12, 技术指标的先进程度:11, 推广、应用程度:11, 已获得社会、生态、环境效益:11, 对科技进步的推动作用:11');
INSERT INTO `project_review_gather` VALUES ('512', '146', '120', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('513', '146', '119', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('514', '146', '117', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('515', null, null, null, null, null, '1', '0', null);
INSERT INTO `project_review_gather` VALUES ('516', '134', '53', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('517', '134', '54', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('518', '134', '123', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('519', '134', '121', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('520', '134', '120', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('521', '134', '119', null, null, null, '0', '0', null);
INSERT INTO `project_review_gather` VALUES ('522', '134', '117', null, null, null, '0', '0', null);

-- ----------------------------
-- Table structure for `project_review_other`
-- ----------------------------
DROP TABLE IF EXISTS `project_review_other`;
CREATE TABLE `project_review_other` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProjectID` int(11) DEFAULT NULL,
  `ExpertID` int(11) DEFAULT NULL,
  `FilePath` varchar(200) DEFAULT NULL,
  `Recommend` char(2) DEFAULT NULL,
  `Note` varchar(1000) DEFAULT NULL,
  `Status` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_review_other
-- ----------------------------

-- ----------------------------
-- Table structure for `review`
-- ----------------------------
DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `ProjectID` int(11) DEFAULT NULL,
  `ExpertID` int(11) DEFAULT NULL,
  `Parameter1` double DEFAULT NULL COMMENT '评分参数',
  `Parameter2` double DEFAULT NULL COMMENT '评分参数',
  `Parameter3` double DEFAULT NULL COMMENT '评分参数',
  `Parameter4` double DEFAULT NULL COMMENT '评分参数',
  `Parameter5` double DEFAULT NULL COMMENT '评分参数',
  `Recommend` bit(1) DEFAULT NULL COMMENT '是否推荐(1推荐，0不推荐)',
  `Prize` int(11) DEFAULT NULL COMMENT '0特等奖，1：一等奖，2：二等奖，3：三等奖',
  `Note` text CHARACTER SET utf8 COMMENT '意见',
  `Status` bit(1) DEFAULT NULL COMMENT '状态(1：通过，0不通过)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of review
-- ----------------------------

-- ----------------------------
-- Table structure for `set_category`
-- ----------------------------
DROP TABLE IF EXISTS `set_category`;
CREATE TABLE `set_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of set_category
-- ----------------------------
INSERT INTO `set_category` VALUES ('1', '技术发明项目', '1');
INSERT INTO `set_category` VALUES ('2', '自然科学项目', '1');
INSERT INTO `set_category` VALUES ('3', '技术开发项目', '1');
INSERT INTO `set_category` VALUES ('4', '社会公益项目', '1');
INSERT INTO `set_category` VALUES ('5', '重大工程项目', '1');

-- ----------------------------
-- Table structure for `set_chapter`
-- ----------------------------
DROP TABLE IF EXISTS `set_chapter`;
CREATE TABLE `set_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of set_chapter
-- ----------------------------
INSERT INTO `set_chapter` VALUES ('22', '储藏分会', '1');
INSERT INTO `set_chapter` VALUES ('23', '粮油质检研究分会', '1');
INSERT INTO `set_chapter` VALUES ('24', '质检分会', '1');
INSERT INTO `set_chapter` VALUES ('25', '玉米深加工分会', '1');
INSERT INTO `set_chapter` VALUES ('26', '发酵面食分会', '1');
INSERT INTO `set_chapter` VALUES ('27', '玉米分会', '1');
INSERT INTO `set_chapter` VALUES ('28', '中国粮油学会 会员', '1');
INSERT INTO `set_chapter` VALUES ('29', '粮油营养分会', '1');
INSERT INTO `set_chapter` VALUES ('30', '营养分会', '1');
INSERT INTO `set_chapter` VALUES ('31', '信息与自动化分会', '1');
INSERT INTO `set_chapter` VALUES ('32', '粮油学会物流分会', '1');
INSERT INTO `set_chapter` VALUES ('33', '饲料分会', '1');
INSERT INTO `set_chapter` VALUES ('34', '油脂专业分会', '1');
INSERT INTO `set_chapter` VALUES ('35', '食品分会', '1');
INSERT INTO `set_chapter` VALUES ('36', '米制品分会', '1');

-- ----------------------------
-- Table structure for `set_expertgroup`
-- ----------------------------
DROP TABLE IF EXISTS `set_expertgroup`;
CREATE TABLE `set_expertgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL COMMENT '评审组编号',
  `expert_id` int(11) DEFAULT NULL COMMENT '专家编号',
  `status` int(11) DEFAULT NULL COMMENT '标记为:1主任委员,2副主任委员,3委员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of set_expertgroup
-- ----------------------------
INSERT INTO `set_expertgroup` VALUES ('197', '41', '53', null);
INSERT INTO `set_expertgroup` VALUES ('198', '0', '53', null);
INSERT INTO `set_expertgroup` VALUES ('199', '42', '54', null);
INSERT INTO `set_expertgroup` VALUES ('200', '41', '54', null);
INSERT INTO `set_expertgroup` VALUES ('202', '42', '109', null);
INSERT INTO `set_expertgroup` VALUES ('203', '42', '58', null);
INSERT INTO `set_expertgroup` VALUES ('204', '42', '56', null);
INSERT INTO `set_expertgroup` VALUES ('205', '43', '126', null);
INSERT INTO `set_expertgroup` VALUES ('206', '43', '125', null);
INSERT INTO `set_expertgroup` VALUES ('207', '43', '124', null);
INSERT INTO `set_expertgroup` VALUES ('208', '43', '123', null);
INSERT INTO `set_expertgroup` VALUES ('209', '44', '126', null);
INSERT INTO `set_expertgroup` VALUES ('210', '44', '123', null);
INSERT INTO `set_expertgroup` VALUES ('211', '44', '122', null);
INSERT INTO `set_expertgroup` VALUES ('212', '44', '121', null);
INSERT INTO `set_expertgroup` VALUES ('213', '45', '114', null);
INSERT INTO `set_expertgroup` VALUES ('214', '45', '112', null);
INSERT INTO `set_expertgroup` VALUES ('215', '45', '109', null);
INSERT INTO `set_expertgroup` VALUES ('216', '45', '102', null);
INSERT INTO `set_expertgroup` VALUES ('217', '45', '101', null);
INSERT INTO `set_expertgroup` VALUES ('218', '41', '123', null);
INSERT INTO `set_expertgroup` VALUES ('219', '41', '121', null);
INSERT INTO `set_expertgroup` VALUES ('220', '41', '120', null);
INSERT INTO `set_expertgroup` VALUES ('221', '41', '119', null);
INSERT INTO `set_expertgroup` VALUES ('222', '41', '117', null);
INSERT INTO `set_expertgroup` VALUES ('223', '47', '126', null);
INSERT INTO `set_expertgroup` VALUES ('224', '47', '125', null);
INSERT INTO `set_expertgroup` VALUES ('225', '47', '124', null);
INSERT INTO `set_expertgroup` VALUES ('226', '47', '123', null);
INSERT INTO `set_expertgroup` VALUES ('227', '47', '122', null);
INSERT INTO `set_expertgroup` VALUES ('228', '47', '121', null);
INSERT INTO `set_expertgroup` VALUES ('229', '47', '120', null);
INSERT INTO `set_expertgroup` VALUES ('230', '47', '119', null);
INSERT INTO `set_expertgroup` VALUES ('231', '47', '118', null);
INSERT INTO `set_expertgroup` VALUES ('232', '47', '117', null);
INSERT INTO `set_expertgroup` VALUES ('233', '46', '126', null);
INSERT INTO `set_expertgroup` VALUES ('234', '46', '125', null);
INSERT INTO `set_expertgroup` VALUES ('235', '46', '124', null);
INSERT INTO `set_expertgroup` VALUES ('236', '46', '123', null);
INSERT INTO `set_expertgroup` VALUES ('237', '46', '122', null);
INSERT INTO `set_expertgroup` VALUES ('238', '46', '121', null);
INSERT INTO `set_expertgroup` VALUES ('239', '46', '120', null);
INSERT INTO `set_expertgroup` VALUES ('240', '46', '119', null);
INSERT INTO `set_expertgroup` VALUES ('241', '46', '118', null);
INSERT INTO `set_expertgroup` VALUES ('242', '46', '117', null);
INSERT INTO `set_expertgroup` VALUES ('243', '42', '126', null);
INSERT INTO `set_expertgroup` VALUES ('244', '42', '125', null);
INSERT INTO `set_expertgroup` VALUES ('245', '42', '124', null);
INSERT INTO `set_expertgroup` VALUES ('246', '42', '123', null);
INSERT INTO `set_expertgroup` VALUES ('247', '42', '122', null);
INSERT INTO `set_expertgroup` VALUES ('248', '48', '401', null);
INSERT INTO `set_expertgroup` VALUES ('249', '48', '400', null);
INSERT INTO `set_expertgroup` VALUES ('250', '48', '399', null);
INSERT INTO `set_expertgroup` VALUES ('251', '48', '398', null);
INSERT INTO `set_expertgroup` VALUES ('252', '48', '397', null);
INSERT INTO `set_expertgroup` VALUES ('253', '48', '396', null);
INSERT INTO `set_expertgroup` VALUES ('254', '48', '395', null);
INSERT INTO `set_expertgroup` VALUES ('255', '48', '394', null);
INSERT INTO `set_expertgroup` VALUES ('256', '48', '393', null);
INSERT INTO `set_expertgroup` VALUES ('257', '48', '392', null);

-- ----------------------------
-- Table structure for `set_fromreview`
-- ----------------------------
DROP TABLE IF EXISTS `set_fromreview`;
CREATE TABLE `set_fromreview` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '形式审查编号',
  `ProjectID` int(11) DEFAULT NULL COMMENT '项目编号',
  `AdminID` int(11) DEFAULT NULL COMMENT '管理编号',
  `Note` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '审查意见',
  `Status` int(11) DEFAULT NULL COMMENT '状态 0 不通过 1通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of set_fromreview
-- ----------------------------
INSERT INTO `set_fromreview` VALUES ('73', '133', '1', null, '1');
INSERT INTO `set_fromreview` VALUES ('74', '134', '1', '缺少技术评价', '0');
INSERT INTO `set_fromreview` VALUES ('75', '136', '1', null, '1');
INSERT INTO `set_fromreview` VALUES ('76', '139', '1', '接经济效益。据有关部门统计，我国2004年以前年平均使用磷化铝的量约为5000吨（甲基溴参考价格为2.6万元/吨）,视为未应用替代技术进行熏蒸。通过项目实施过程对替代技术的辐射推广，很多库点由磷化铝仓内投药熏蒸改为了替代技术熏蒸，大大地减少了磷化铝的使用量。根据3.3中“替代技术（磷化氢膜下环流熏蒸技术和磷化氢与二氧化碳混合熏蒸技术）熏蒸、磷化铝仓内投药熏蒸、甲基溴熏蒸的成本之比约为4：5：8”。因此，每年节约费用为“磷化铝仓内投药熏蒸”费（主要为总磷化铝费＋投药补助等人工费）的1/5,每年“磷化铝仓内投药熏蒸”投药补助等人工费是磷化铝费用约0.32倍（根据08年对《34个示范库效果监测评价报告》中“效益分析——若采用磷化铝仓内投药熏蒸”，投药补助等人工费为1.92万元与磷化铝费用为5.9万', '0');
INSERT INTO `set_fromreview` VALUES ('77', '139', '1', '需要', '0');
INSERT INTO `set_fromreview` VALUES ('78', '140', '1', null, '1');
INSERT INTO `set_fromreview` VALUES ('79', '141', '1', null, '1');
INSERT INTO `set_fromreview` VALUES ('80', '142', '1', null, '1');
INSERT INTO `set_fromreview` VALUES ('81', '143', '1', null, '1');
INSERT INTO `set_fromreview` VALUES ('82', '144', '1', null, '1');
INSERT INTO `set_fromreview` VALUES ('83', '145', '1', null, '1');
INSERT INTO `set_fromreview` VALUES ('84', '139', '1', null, '1');
INSERT INTO `set_fromreview` VALUES ('85', '134', '1', '缺少东西', '0');
INSERT INTO `set_fromreview` VALUES ('86', '134', '2', null, '1');
INSERT INTO `set_fromreview` VALUES ('87', '146', '2', null, '1');
INSERT INTO `set_fromreview` VALUES ('88', '150', '2', '5', '1');
INSERT INTO `set_fromreview` VALUES ('89', '138', '2', '不通过', '0');
INSERT INTO `set_fromreview` VALUES ('90', '137', '2', '缺少资料', '0');
INSERT INTO `set_fromreview` VALUES ('91', '137', '2', '3434', '0');
INSERT INTO `set_fromreview` VALUES ('92', '138', '2', 'bu', '0');
INSERT INTO `set_fromreview` VALUES ('93', '138', '2', '3434', '1');
INSERT INTO `set_fromreview` VALUES ('94', '137', '2', '不通过', '0');
INSERT INTO `set_fromreview` VALUES ('95', '137', '2', null, '1');
INSERT INTO `set_fromreview` VALUES ('96', '135', '2', '不', '0');
INSERT INTO `set_fromreview` VALUES ('97', '135', '2', '通过', '1');
INSERT INTO `set_fromreview` VALUES ('98', '155', '2', 'fd', '0');

-- ----------------------------
-- Table structure for `set_fromtask`
-- ----------------------------
DROP TABLE IF EXISTS `set_fromtask`;
CREATE TABLE `set_fromtask` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of set_fromtask
-- ----------------------------
INSERT INTO `set_fromtask` VALUES ('1', '国家计划', '1');
INSERT INTO `set_fromtask` VALUES ('2', '部委计划', '1');
INSERT INTO `set_fromtask` VALUES ('3', '省市自治区计划', '1');
INSERT INTO `set_fromtask` VALUES ('4', '基金资助', '1');
INSERT INTO `set_fromtask` VALUES ('5', '国际合作', '1');
INSERT INTO `set_fromtask` VALUES ('6', '其它单位委托', '1');
INSERT INTO `set_fromtask` VALUES ('7', '自选', '1');
INSERT INTO `set_fromtask` VALUES ('8', '非职务', '1');
INSERT INTO `set_fromtask` VALUES ('9', '其他', '1');

-- ----------------------------
-- Table structure for `set_group`
-- ----------------------------
DROP TABLE IF EXISTS `set_group`;
CREATE TABLE `set_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Status` int(1) DEFAULT NULL COMMENT '状态(1有效，0无效)',
  `Group_Year` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '年度',
  `Type` char(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '1专业评审组 , 2 综评专家组,3自定义评审专家组',
  `BaseinfoID` varchar(64) DEFAULT NULL COMMENT '自定义奖项信息表id(type为3时有值)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of set_group
-- ----------------------------
INSERT INTO `set_group` VALUES ('40', '综评组', '1', '2015', '2', null);
INSERT INTO `set_group` VALUES ('41', '综评组', '1', '2016', '2', null);
INSERT INTO `set_group` VALUES ('42', '油脂加工', '1', '2016', '1', null);
INSERT INTO `set_group` VALUES ('43', '储藏质检', '1', '2016', '1', null);
INSERT INTO `set_group` VALUES ('44', '食品玉米', '1', '2016', '1', null);
INSERT INTO `set_group` VALUES ('45', '饲料信息营养', '1', '2016', '1', null);
INSERT INTO `set_group` VALUES ('46', '自定义奖项评审组', '1', '2016', '3', '5117770c-7e06-40e8-9973-4cf89b520ea0');
INSERT INTO `set_group` VALUES ('47', '自定义奖项评审组', '1', '2016', '3', 'fa674373-0145-4bd9-ba56-10b8796d69f1');
INSERT INTO `set_group` VALUES ('48', '自定义奖项评审组', '1', '2016', '3', '92d07c07-2195-4d9c-a185-a8538cdb4a6b');
INSERT INTO `set_group` VALUES ('49', '自定义奖项评审组', '1', '2016', '3', '83caf299-abba-47e9-b3ff-4e44a3511f00');

-- ----------------------------
-- Table structure for `set_prize`
-- ----------------------------
DROP TABLE IF EXISTS `set_prize`;
CREATE TABLE `set_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Grandest` int(1) DEFAULT NULL COMMENT '是否有特等奖(1有，0无)',
  `One` int(1) DEFAULT NULL COMMENT '是否有一等奖',
  `Two` int(1) DEFAULT NULL COMMENT '是否有二等奖',
  `Three` int(1) DEFAULT NULL COMMENT '是否有三等奖',
  `Professional` int(1) DEFAULT NULL COMMENT '专评打分规则(1：所有分数平均分；0去掉最低分去掉最高分的平均分)',
  `Composite` int(1) DEFAULT NULL COMMENT '综评打分规则(1：所有分数平均分；0去掉最低分去掉最高分的平均分)',
  `GrandestVote` int(11) DEFAULT NULL COMMENT '特等奖票数',
  `OneVote` int(11) DEFAULT NULL COMMENT '一等奖票数',
  `TwoVote` int(11) DEFAULT NULL COMMENT '二等奖票数',
  `ThreeVote` int(11) DEFAULT NULL COMMENT '三等奖票数',
  `ApplyStartTime` datetime DEFAULT NULL COMMENT '申报开始时间',
  `ApplyEndTime` datetime DEFAULT NULL COMMENT '申报结束时间',
  `ProfessionalStartTime` datetime DEFAULT NULL,
  `ProfessionalEndTime` datetime DEFAULT NULL,
  `CompositeStartTime` datetime DEFAULT NULL,
  `CompositeEndTime` datetime DEFAULT NULL,
  `CompositeVoteStartTime` datetime DEFAULT NULL,
  `CompositeVoteEndTime` datetime DEFAULT NULL,
  `Watermark` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '水印文字设置',
  `Status` int(1) DEFAULT NULL COMMENT '评审状态(1开启，0结束)',  
  `expertNote` text CHARACTER SET utf8 COMMENT '专家提示',
  `Note` text CHARACTER SET utf8 COMMENT '注意事项',
  `PrizeYear` int(11) DEFAULT NULL COMMENT '年份',
  `StatusSb` int(1) DEFAULT '1' COMMENT '申报状态(1开启，0结束)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of set_prize
-- ----------------------------
INSERT INTO `set_prize` VALUES ('1', null, '1', '1', '1', '1', '0', '2', '1', '0', '0', '2015-05-05 01:27:46', '2015-05-29 01:27:48', '2015-05-11 01:27:50', '2015-05-03 01:27:51', '2015-05-05 01:27:52', '2015-05-07 01:27:54', '2015-05-09 01:27:55', '2015-05-11 01:27:56', 'dsafas', '1', 'fsdafsdasdfsdf3434', null, '1');
INSERT INTO `set_prize` VALUES ('2', '1', '1', '1', '1', '1', '1', '2', '4', '2', '1', '2015-05-31 16:42:15', '2016-07-01 16:42:20', '2015-06-07 16:42:26', '2015-07-11 16:42:30', '2015-06-08 16:42:36', '2015-07-04 16:42:40', '2015-06-18 16:42:44', '2015-07-04 16:42:48', '中国粮油学会科学技术奖', '1', '尽快申报', '2015', '0');
INSERT INTO `set_prize` VALUES ('4', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, '2016', '1');

-- ----------------------------
-- Table structure for `set_template`
-- ----------------------------
DROP TABLE IF EXISTS `set_template`;
CREATE TABLE `set_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Path` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '路径',
  `Date` datetime DEFAULT NULL COMMENT '上传时间',
  `Note` text CHARACTER SET utf8 COMMENT '描述',
  `AdminId` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of set_template
-- ----------------------------

-- ----------------------------
-- Table structure for `t`
-- ----------------------------
DROP TABLE IF EXISTS `t`;
CREATE TABLE `t` (
  `b` bit(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t
-- ----------------------------
INSERT INTO `t` VALUES ('0');

-- ----------------------------
-- Table structure for `winning_list`
-- ----------------------------
DROP TABLE IF EXISTS `winning_list`;
CREATE TABLE `winning_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentID` int(11) DEFAULT NULL COMMENT '父ID',
  `type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '类型：1表示父内容(获奖名单描述)；2表示子内容（项目获奖列表）',
  `winName` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '获奖名单',
  `status` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '状态 ：1已发布 0 未发布',
  `registerNum` int(11) DEFAULT NULL COMMENT '登记号',
  `projectCN` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '项目名称',
  `majorCompany` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '主要完成单位',
  `keyPerson` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '主要完成人',
  `recommendCompany` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '推荐单位',
  `winning` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '获奖奖项',
  `winYear` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '年份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of winning_list
-- ----------------------------
INSERT INTO `winning_list` VALUES ('24', null, '1', '2016科技奖', '0', null, null, null, null, null, null, '2016');
INSERT INTO `winning_list` VALUES ('25', null, '1', '2016年项目获奖名单', '1', null, null, null, null, null, null, '2016');
INSERT INTO `winning_list` VALUES ('40', '25', '2', null, null, '10', '中国粮食仓储行业淘汰甲基溴项目', '中储粮成都粮食储藏科学研究所', '严晓平', '中国粮油学会储藏分会', '二等奖', null);
INSERT INTO `winning_list` VALUES ('41', '25', '2', null, null, '4', '清洁高效节能饲料制粒成型装备', '江苏牧羊控股有限公司', '陈正俊', '江苏牧羊集团', '二等奖', null);
INSERT INTO `winning_list` VALUES ('42', '25', '2', null, null, '1', '药品级大豆亚油酸纯化工艺的研究', '上海市粮食科学研究所', '王文高,朱天仪,谈黎明,王波,陈卫栋,陈凤香,袁开金', '上海良友集团', '二等奖', null);
INSERT INTO `winning_list` VALUES ('43', '25', '2', null, null, '2', '高效节能型锤片粉碎机', '江苏正昌粮机股份有限公 司', '郝波 ,洑飞波,史顺达', '高效节能型锤片粉碎机', '二等奖', null);
INSERT INTO `winning_list` VALUES ('44', '25', '2', null, null, '6', '智慧粮食云平台    ', '济南金钟电子衡器股份有限公司', '高绍和,王小三', '中国粮油学会物流分会', '三等奖', null);
INSERT INTO `winning_list` VALUES ('45', '25', '2', null, null, '5', 'MMR系列磨粉机', '中粮工程装备（张家口）有限公司', '苏从毅', '中国粮油学会食品分会', '三等奖', null);
INSERT INTO `winning_list` VALUES ('46', '25', '2', null, null, '7', '谷朊粉增值加工关键技术和装备研发及其产业化示范', '江南大学', '周惠明', '江南大学', '三等奖', null);
