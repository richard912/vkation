vKation.factory("HotelService", function ($http, $q, $localStorage, $apiRoot) {
    var resourcePath = $apiRoot + "hotels/";
    return {
        search: function(searchParams, categories) {
            var url = resourcePath + "search";
            var defer = $q.defer();
            $http({
                method: 'POST',
                url: url,
                data: {
                    search: {
                        place_id: searchParams.place,
                        check_in_date: searchParams.start_date1,
                        check_out_date: searchParams.end_date1,
                        number_of_guests: searchParams.guest,
                        budget_id: searchParams.budget,
                        stay_type: searchParams.stay_type
                    },
                    categories: categories
                }
            }).success(function (data, status, header, config) {
                defer.resolve(data.properties);
            }).error(function (data, status, header, config) {
                defer.reject(data);
            });
            return defer.promise;
        },
        detail: function(id) {
            var url = resourcePath + id;
            var defer = $q.defer();
            $http({
                method: 'GET',
                url: url
            }).success(function (data, status, header, config) {
                defer.resolve(data.SearchResponse);
            }).error(function (data, status, header, config) {
                defer.reject(data);
            });
            return defer.promise;
        }
    };
});

