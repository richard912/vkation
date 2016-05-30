vKation.factory("BudgetService", function ($http, $q, $localStorage, $apiRoot) {
    var resourcePath = $apiRoot + "budgets";

    return {
        list: function () {
            var url = resourcePath;
            var defer = $q.defer();
            $http({
                method: 'GET',
                url: url
            }).success(function (data, status, header, config) {
                defer.resolve(data.budgets);
            }).error(function (data, status, header, config) {
                defer.reject(data);
            });
            return defer.promise;
        },
    };
});
