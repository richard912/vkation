vKation.factory("CategoryService", function ($http, $q, $localStorage, $apiRoot) {
    var resourcePath = $apiRoot + "categories";

    return {
        list: function () {
            var url = resourcePath;
            var defer = $q.defer();
            $http({
                method: 'GET',
                url: url
            }).success(function (data, status, header, config) {
                defer.resolve(data.categories);
            }).error(function (data, status, header, config) {
                defer.reject(data);
            });
            return defer.promise;
        },
        getAmenities: function () {
            var url = resourcePath + "/get_amenities";
            var defer = $q.defer();
            $http({
                method: 'GET',
                url: url
            }).success(function (data, status, header, config) {
                defer.resolve(data.amenities);
            }).error(function (data, status, header, config) {
                defer.reject(data);
            });
            return defer.promise;
        }
    };
});
