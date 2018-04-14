$.validator.addMethod("dategreaterthan", function (value, element, params) {
    return !$(params).val() || !value || Date.parse(value.replace(/-/g, '/')) >= Date.parse($(params).val().replace(/-/g, '/'));
});
$.validator.unobtrusive.adapters.add("dategreaterthan", ["otherpropertyname"], function (options) {
    console.log(options);
    options.rules["dategreaterthan"] = "#" + options.params.otherpropertyname;
    options.messages["dategreaterthan"] = options.message;
});

//验证数据是否合法
$.validator.addMethod('ISlegal', function (value, element, params) {
    return value != "123";
});
$.validator.unobtrusive.adapters.add("ISlegal", function (options)
{
    options.rules["ISlegal"] = {

    };
    options.messages["ISlegal"] = options.message;
});

$.validator.addMethod("checkCreditCode",function(value,element,params){
    return this.optional(element)||(value.length==15)||(value.length==18);
},"统一社会信用代码长度必须为15或18位");

$.validator.unobtrusive.adapters.add("checkCreditCode", function (options)
{
    options.rules["checkCreditCode"] = {

    };
    options.messages["checkCreditCode"] = options.message;
});



$(document).ready(function () {
    $("input[data-val=true]").blur(function () {
        var form = $(this).parents("form")[0];
        $(form).validate().element($(this));
    });
    $('textarea[data-val=true]').blur(function () {
        var form = $(this).parents("form")[0];
        $(form).validate().element($(this));
    });
})

