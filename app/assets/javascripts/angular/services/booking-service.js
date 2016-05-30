vKation.factory("BookingService", function ($http, $q, $localStorage, $apiRoot) {
    var resourcePath = $apiRoot + "bookings";

    return {
        create: function(booking) {
            var url = resourcePath;
            var defer = $q.defer();
            $http({
                method: 'POST',
                url: url,
                data: {
                    booking: booking
                }
            }).success(function (data, status, header, config) {
                defer.resolve(data);
            }).error(function (data, status, header, config) {
                defer.reject(data);
            });
            return defer.promise;
        },
    };
});
