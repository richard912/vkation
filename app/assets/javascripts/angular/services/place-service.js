vKation.factory("PlaceService", function ($http, $q, $localStorage, $apiRoot) {
    var resourcePath = $apiRoot + "places/";

    return {
        list: function () {
            var url = resourcePath;
            var defer = $q.defer();
            $http({
                method: 'GET',
                url: url
            }).success(function (data, status, header, config) {
                defer.resolve(data.places);
            }).error(function (data, status, header, config) {
                defer.reject(data);
            });
            return defer.promise;
        },
        attractions: function(placeId, lng, lat) {
            var url = resourcePath + placeId + "/attractions?lat="+lat+'&lng='+lng;
            var defer = $q.defer();
            $http({
                method: 'GET',
                url: url
            }).success(function (data, status, header, config) {
                defer.resolve(data.attractions);
            }).error(function (data, status, header, config) {
                defer.reject(data);
            });
            return defer.promise;
        }
    };
});
