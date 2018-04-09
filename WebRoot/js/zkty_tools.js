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

    }
});
///jQuery的扩展方法
$.extend({
    ///通信的扩展的方法
    zkty_commun_post:function (url, data, success, error) {
        $.ajax({
            url: url,
            type: 'post',
            dataType: 'json',
            data: data,
            success: success,
            error: error
        });
    },
    zkty_commun_get:function (url, data, success, error) {
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