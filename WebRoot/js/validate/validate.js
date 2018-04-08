$.validator.addMethod("dategreaterthan", function (value, element, params) {
    return !$(params).val() || !value || Date.parse(value.replace(/-/g, '/')) >= Date.parse($(params).val().replace(/-/g, '/'));
});
$.validator.unobtrusive.adapters.add("dategreaterthan", ["otherpropertyname"], function (options) {
    console.log(options);
    options.rules["dategreaterthan"] = "#" + options.params.otherpropertyname;
    options.messages["dategreaterthan"] = options.message;
});

$(document).ready(function(){
    $("input[data-val=true]").blur(function () {
        var form = $(this).parents("form")[0];
        $(form).validate().element($(this));
    });
    $('textarea[data-val=true]').blur(function () {
        var form = $(this).parents("form")[0];
        $(form).validate().element($(this));
    });
})

