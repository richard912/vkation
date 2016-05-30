vKation.service('CartService', function($localStorage, $http, $q, $apiRoot) {
    this.initCart = function(startDate, endDate, guests, place, budget, hotelInfo) {
        $localStorage.cart = {
            guests: guests,
            place_id: place,
            stay_type_id: 1,
            budget_id: budget,
            startDate: startDate,
            endDate: endDate,
            hotelInfo: hotelInfo,
            attractions: [],
            transports: []
        }
    }
    this.getCart = function() {
        return $localStorage.cart;
    }
    this.getDescription = function() {
        return $localStorage.cart.hotelInfo.name
    }
    this.getHotel = function() {
        return $localStorage.cart.hotelInfo;
    }
    this.addAttraction = function(guests, date, startTime, endTime, attractionInfo) {
        var attractions = $localStorage.cart.attractions || [];
        var attraction = {
            guests: guests,
            date: date,
            startTime: startTime,
            endTime: endTime,
            info: attractionInfo,
            total: parseFloat(guests) * parseFloat(attractionInfo.price)
        }
        attractions.push(attraction);
        $localStorage.cart.attractions = attractions;
    }
    this.getAttractions = function() {
        return $localStorage.cart.attractions;
    }
    this.removeAttraction = function(index) {
        $localStorage.cart.attractions.splice(index, 1);
    }
    this.addTransport = function(date, transportInfo) {
        var transports = $localStorage.cart.transports || [];
        var transport = {
            date: date,
            info: transportInfo
        }
        transports.push(transport);
        $localStorage.cart.transports = transports;
    }
    this.removeTransport = function(index) {
        $localStorage.cart.transports.splice(index, 1);
    }
    this.getTransports = function() {
        return $localStorage.cart.transports;
    }
    this.startDate = function() {
        return $localStorage.cart.startDate;
    }
    this.endDate = function() {
        return $localStorage.cart.endDate;
    }
    this.getTripDates = function() {
        var startDate = moment(this.startDate(), "DD/MM/YYYY");
        var endDate = moment(this.endDate(), "DD/MM/YYYY");
        var dates = [];
        while (startDate < endDate) {
            var date = new moment(startDate);
            dates.push(date.format('D/MM/YYYY'));
            startDate = startDate.add(1, 'd');
        }
        console.dir(dates);
        return dates;
    }
    this.getNights = function() {
        var startDate = moment(this.startDate(), "DD/MM/YYYY");
        var endDate = moment(this.endDate(), "DD/MM/YYYY");
        return endDate.diff(startDate, 'days');
    }
    this.getPerNightPrice = function() {
        if ($localStorage.cart) {
            if ($localStorage.cart.hotelInfo) {
                return $localStorage.cart.hotelInfo.total;
            }
        }
        return 0;
    }
    this.getGrandTotal = function() {
        var total = 0;
        var nights = this.getNights();
        var pnp = this.getPerNightPrice();
        var attractions = this.getAttractions();
        total = pnp * nights;
        var attractions = this.getAttractions();
        attractions.forEach(function(attraction) {
            var price = parseFloat(attraction.total);
            total += price;
        });
        return total;
    }
    this.setUser = function(user) {
        $localStorage.cart.user = user;
    }
    this.getUserInfo = function() {
        return $localStorage.cart.user;
    }
    this.addBooking = function(razorId) {
        var defer = $q.defer();
        var url = $apiRoot + "bookings";
        $http({
            method: 'POST',
            url: url,
            data: {
                booking: {
                    startDate: $localStorage.cart.startDate,
                    endDate: $localStorage.cart.endDate,
                    guest_count: $localStorage.cart.guests,
                    place_id: $localStorage.cart.place_id,
                    stay_type_id: $localStorage.cart.stay_type_id,
                    budget_id: $localStorage.cart.budget_id,
                    hotelInfo: $localStorage.cart.hotelInfo,
                    attractions: $localStorage.cart.attractions,
                    transports: $localStorage.cart.transports,
                    razor_id: razorId
                }
            }
        }).success(function (data, status, header, config) {
            defer.resolve(data);
        }).error(function (data, status, header, config) {
            defer.reject(data);
        });
        return defer.promise;

    }
})