vKation.directive('isUnique', ['$http', '$q', function($http, $q) {
    return {
        restrict: 'A',
        require: 'ngModel',
        link: function(scope, element, attrs, ngModel) {
            var canceller = null;
            element.bind('keyup', function (e) {
                
                if (!ngModel || !element.val()) return;
                if (!attrs.uniqueUrl || !attrs.uniqueParam) return;
                
                var currentValue = element.val();
                
                function successCallback() {
                    return function(response, status, headers, config) {
                        if (currentValue === element.val()) {
                            ngModel.$setValidity('unique', !response.exists);
                        }
                    }
                }
                
                function errorCallback() {
                    return function(response, status, headers, config) {
                        ngModel.$setValidity('unique', true);
                    }
                }
                
                $http.get(attrs.uniqueUrl + "?" + attrs.uniqueParam + "=" + currentValue)
                .success(function (response, status, header, config) {
                    if (currentValue === element.val()) {
                          ngModel.$setValidity('unique', !response.exists);
                    }
                }).error(function (data, status, header, config) {
                    ngModel.$setValidity('unique', true);
                });
        
            });
        }
    }    
}]);