 $.validator.addMethod("dategreaterthan", function (value, element, params) {
            return !$(params).val() || !value || Date.parse(value.replace(/-/g, '/')) >= Date.parse($(params).val().replace(/-/g, '/'));
        });
        $.validator.unobtrusive.adapters.add("dategreaterthan", ["otherpropertyname"], function (options) {
            console.log(options);
            options.rules["dategreaterthan"] = "#" + options.params.otherpropertyname;
            options.messages["dategreaterthan"] = options.message;
        });