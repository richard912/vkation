var compareTo = function() {
    return {
        require: "ngModel",
        scope: {
            otherModelValue: "=datesCompare"
        },
        link: function(scope, element, attributes, ngModel) {
            ngModel.$validators.compareTo = function(modelValue) {
                return modelValue === scope.otherModelValue;
            };

            scope.$watch("otherModelValue", function() {
                ngModel.$validate();
            });
        }
    };
};
vKation.directive("datesCompare", compareTo);
