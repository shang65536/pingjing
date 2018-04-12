//项目基本信息--地区选择
var SelectTypeDataSource = [
    {
        id: "1",
        name: " 智能产品类",
        child: [
            {
                id: "4",
                name: "方向1：核心基础产品",
                child: []
            },
            {
                id: "5",
                name: "方向2：智能控制产品",
                child: []
            },
            {
                id: "6",
                name: "方向3：智能理解产品",
                child: []
            }
        ]

    },
    {
        id: "2",
        name: "行业应用类",
        child: [
            {
                id: "7",
                name: "方向4：制造业智能化提升",
                child: []
            },
            {
                id: "8",
                name: "方向5：产业智能升级",
                child: []
            },
            {
                id: "9",
                name: "方向6：民生服务智能化",
                child: []
            }
        ]

    },
    {
        id: "3",
        name: "支撑体系类",
        child: [
            {
                id: "10",
                name: "方向7：训练资源服务平台",
                child: []
            },
            {
                id: "11",
                name: "方向8：标准测试评估体系",
                child: []
            },
            {
                id: "12",
                name: "方向9：安全保障体系",
                child: []
            }
        ]

    }
]
//企业基本信息--单位性质
var unit_properties = [
    {
        key: "unit_properties",
        title: "单位性质",
        ShowTitle: false,
        data: ["政府机关", "事业单位", "社会团体", "民营企业", "外资企业", "合资企业", "国有企业", "国有控股企业", "国有参股企业"],
        Type: "radio"
    }
]
//企业基本信息--主营业务
var business = [
    {
        key: "brace_business",
        title: "支撑类",
        ShowTitle: true,
        data: ["人工智能基础软件", "数据处理及存储", "云计算", "网络与信息安全", "能传感器", "人工智能芯片"],
        Type: "checkbox"
    },
    {
        key: "technology_business",
        title: "技术类",
        ShowTitle: true,
        data: ["图像识别", "语音识别", "生物特征识别", "自然语言处理", "无人自主系统", "智能协作系统"],
        Type: "checkbox"
    },
    {
        key: "app_business",
        title: "应用业务",
        ShowTitle: true,
        data: ["智能机器人", "智能汽车", "AR/VR", "智能穿戴设备", "智能无人设备", "智能制造", "智能医疗", "智能教育", "智能金融", "智能家居", "智能物流",
            "智能商务", "智能农业", "智能健康与养老", "智慧城市", "智能安防", "智慧法庭", "智能交通", "智能客服"],
        Type: "checkbox"
    }
]

///jQuery的扩展的插件
$.fn.extend({
    //层级联动
    zkty_linkage: function (option) {
        var self = this;
        var _default = {
            //数据源
            data: SelectTypeDataSource,
            level: 2,
            classInfo: "form-control",
            //默认初始项 默认为null
            initialNode: ""
        }
        //合并参数
        var _option = $.extend(_default, option);

        //总体
        var zkty_linkage_content = $('<div class="zkty_linkage_content"></div>');
        for (var i = 0; i < _option.level; i++) {
            var temp = $('<div class="col-sm-6"></div>');
            var select = $("<select></select>");
            temp.append(select);
            select.addClass("zkty_linkage_content_level_" + i);
            select.addClass(_option.classInfo);
            zkty_linkage_content.append(temp);
            select.change(function () {
                var sop = $(this).find('option:selected');
                var opdata = sop.data("data");
                initial(opdata.child, 1);
            })
        }

        //初始化页面
        var initial = function (data, Grade) {
            if (data.length <= 0) {
                return false;
            }
            zkty_linkage_content.find(".zkty_linkage_content_level_" + Grade).html('');
            $.each(data, function (i, dom) {
                var option = $('<option></option>');
                option.addClass("levelid_" + dom.id);
                option.attr("value", dom.id);
                option.text(dom.name);
                option.data("data", dom);
                zkty_linkage_content.find(".zkty_linkage_content_level_" + Grade).append(option);
            })
        }
        initial(_option.data, 0);

        //设置默认和选择
        if (_option.initialNode != "") {
            var arry = _option.initialNode.split(',');
            for (var i = 0; i < arry.length; i++) {
                zkty_linkage_content.find(".zkty_linkage_content_level_" + i).find(".levelid_" + arry[i]).prop('selected', true).change();
            }
        } else {
            for (var i = 0; i < _option.level; i++) {
                zkty_linkage_content.find(".zkty_linkage_content_level_" + i).find("option").eq(0).prop('selected', true).change();
            }
        }

        self.append(zkty_linkage_content);

        _option.getSelected = function () {
            var arry = [];
            //循环深度、读取值
            for (var i = 0; i < _option.level; i++) {
                var node = _option.level[i];
                var selectoption = zkty_linkage_content.find(".zkty_linkage_content_level_" + i).find("option:selected");
                var selectdata = $(selectoption).data("data");
                arry.push(selectdata.id);
            }
            return arry.toString();
        }
        return _option;

    },
    //选择列表组
    zkty_checkoutgroup: function (option) {
        var self = this;
        var _default = {
            //数据源
            data: business,
            initiaSelect: [
                {
                    key: "",
                    data: [],
                    otherinput: ""
                }
            ]
        }
        //合并参数
        var _option = $.extend(_default, option);
        self.html('');
        var SelectionContent = $('<div class="SelectionContent"></div>');
        self.append(SelectionContent);
        var initialPage = function () {
            $.each(_option.data, function (i, dom) {
                //容器
                var ssnode = $('<div class="SelectionNode ' + dom.key + '"></div>');
                ssnode.data("data", dom);
                //标题
                if (dom.ShowTitle == true) {
                    var title = $('<div class="SelectionTitle"><div class="SelectionTitle_Line">' + dom.title + '</div></div>');
                    ssnode.append(title);
                }
                //内容
                var mainnode = $(' <div class="SelectionArea"><div class="checkboxList"><ul></ul></div>');
                ssnode.append(mainnode);
                $.each(dom.data, function (cc, cdom) {
                    var li = null;
                    if (dom.Type == "checkbox") {
                        li = $('<li><label class="checkbox-inline"></label></li>')
                        var input = $('<input type="checkbox"/>');
                        li.find('label').append(input);
                    } else {
                        li = $('<li><label class="radio-inline"></label></li>')
                        var input = $('<input type="radio" name = "radio_"' + dom.key + '"/>');
                        li.find('label').append(input);
                    }
                    li.find('label').append(cdom);
                    mainnode.find('ul').append(li);
                })
                //其他输入的项
                var other = $('<li class="input">其他（请注明):<input type="text" class="form-control" id="" /></li>');
                mainnode.find('ul').append(other);
                SelectionContent.append(ssnode);
            });
        }
        initialPage();

        _option.GetResult = function () {
            var arry = [];
            var allnode = self.find(".SelectionNode");
            if (allnode.length > 0) {
                $.each(allnode, function (i, dom) {
                    var temp = {
                        key: $(dom).data('data').key,
                        list: [],
                        otherinput: ""
                    }
                    var allinput = $(dom).find("input");
                    $.each(allinput, function (ci, cdom) {
                        if (ci != allinput.length - 1) {
                            var ss = $(cdom).prop('checked');
                            if (ss == true) {
                                temp.list.push("1");
                            } else {
                                temp.list.push("0");
                            }
                        }
                        if (ci == allinput.length - 1) {
                            temp.otherinput = $(cdom).val();
                        }
                    })
                    arry.push(temp);
                })
            }
            return arry;
        }

        _option.backfill = function (option) {
            // var option = [
            //     {
            //         key: "",
            //         list: "",
            //         opinput: ""
            //     }
            // ]

            $.each(option, function (i, dom) {
                //找到容器
                var content = self.find('.' + dom.key);
                if (dom.list != "") {
                    var carry = dom.list.split(",");
                    $.each(carry, function (ci, cdom) {
                        if (cdom == "1") {
                            content.find('input').eq(ci).prop("checked", true);
                        }
                    })
                }
                content.find('input').last().val(dom.opinput);
            })

        }

        return _option;

    },
    //错误信息展示
    zkty_Error: function (option) {
        var self = this;
        var _default = {
            DisplayTime: null,
        }
        //合并参数
        var _option = $.extend(_default, option);
        //取出原有的数据
        var newContent = $('<div class="zkty-fixed"></div>');
        //添加关闭按钮
        var closed = $('<div class="zkty-fixed_hide"></div>');
        var btn = $('<span>X</span>');
        btn.bind('click', function () {
            _option.hide();
        })
        closed.append(btn);
        newContent.append(closed);
        //为原数据加上壳
        newContent.append(self);
        //回填数据
        $("body").append(newContent);

        _option.show = function () {
            newContent.show();
        }

        _option.hide = function () {
            newContent.hide(500);
        }
        return _option;
    }
});
///jQuery的扩展方法
$.extend({
    ///通信的扩展的方法
    zkty_commun_post: function (url, data, success, error) {
        $.ajax({
            url: url,
            type: 'post',
            dataType: 'json',
            data: data,
            success: success,
            error: error
        });
    },
    zkty_commun_get: function (url, data, success, error) {
        $.ajax({
            url: url,
            type: 'get',
            dataType: 'json',
            data: data,
            success: success,
            error: error
        });
    }
});