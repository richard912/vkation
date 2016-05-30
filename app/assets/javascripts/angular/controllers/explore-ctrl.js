function ExploreCtrl($rootScope, $scope, $state, $localStorage, toastr, NgMap, CartService, hotel, attractions, transports) {

    "use strict";
    (function() {
        $scope.googleMapsUrl="https://maps.googleapis.com/maps/api/js?libraries=visualization,drawing,geometry,places&key=AIzaSyAkxG3qQ8ZU-VKCUonHC8PbEKgSNP1pOf4";
        $scope.hotel = hotel;
        $scope.searchData = $localStorage.search;
        $scope.hotelList = $localStorage.hotels;
        $scope.attractions = attractions;
        $scope.addAttraction = {}
        $scope.addTransportation = {}
        $scope.imageArray = ["/assets/bg-banner.jpg","/assets/pg-1.jpg"]
        $scope.hotelPopup = false;
        $scope.attractionPopup = false;
        $scope.markers = [];
        $scope.showPopup = true;
        $scope.map = {
            center: {
                latitude: 12.972442,
                longitude: 77.580643
            },
            zoom: 8
        };
        $scope.showHotelPopup = false;
        $scope.addAttractions = false;
        $scope.transports = transports;
        $scope.addAttractionToCartStage = 0;
        CartService.initCart(
            $scope.searchData.start_date,
            $scope.searchData.end_date,
            $scope.searchData.guest,
            $scope.searchData.place,
            $scope.searchData.budget,
            $scope.hotel
        );
        $scope.nights = CartService.getNights();
        $scope.perNightPrice = CartService.getPerNightPrice();
        $scope.tripDates = CartService.getTripDates();
        $scope.cartAttractions = CartService.getAttractions();
        $scope.cartTransports = CartService.getTransports();
        $scope.grandTotal = CartService.getGrandTotal();
        $scope.showTransportPopup = false;
        $scope.addTransport = false;
        $scope.showTransportTypes = false;
    })();
    
    $scope.showHotelPopup = function() {
        $scope.hotelPopup = true;
        $scope.attractionPopup = false;
    }

    $scope.closeHotelPopup = function() {
        $scope.hotelPopup = false;
    }

    $scope.showAttractionPopup = function(attraction) {
        $scope.addAttractionToCartStage = 0;
        $scope.attraction = attraction;
        $scope.attractionPopup = true;
        $scope.hotelPopup = false;
    }

    $scope.closeAttractionPopup = function() {
        $scope.attractionPopup = false;
    }

    NgMap.getMap().then(function(map) {
        $scope.markers = [];
        $scope.attractions.forEach(function (attraction) {
            $scope.markers.push(attraction);
        });
    });

    $scope.mapInitialized = function(map) {
        google.maps.event.trigger(map, 'resize');
    }

    $scope.checkout_page = function(){
        $scope.showTransportPopup = true;
    }
    $scope.add_attractions = function(status){
        $scope.addAttractions = status;
        $scope.showPopup = false;
    }
    $scope.addTransportStatus = function(status){
        $scope.addTransport = status;
        if ($scope.addTransport === false){
            $state.go('checkout');
        }else{
            $scope.showTransportTypes = true;
            $scope.showTransportPopup = false;
        }
    }

    $scope.showAddAttractionToCartForm = function() {
        $scope.addAttractionToCartStage = 1;
    }

    $scope.showAddAttractionContinueButton = function() {
        $scope.addAttractionToCartStage = 2;
    }

    $scope.addAttractionToCart = function(attraction) {
        CartService.addAttraction($scope.addAttraction.guests, $scope.addAttraction.date, $scope.addAttraction.startTime, $scope.addAttraction.endTime, attraction);
        $scope.cartAttractions = CartService.getAttractions();
        $scope.grandTotal = CartService.getGrandTotal();
        $scope.attractionPopup = false;
    }

    $scope.removeAttractionFromCart = function(index) {
        CartService.removeAttraction(index);
        $scope.cartAttractions = CartService.getAttractions();
        $scope.grandTotal = CartService.getGrandTotal();
    }

    $scope.addTransportToCart = function() {
        var transport = $scope.transports[$scope.addTransportation.transport];
        CartService.addTransport($scope.addTransportation.date, transport);
        $scope.cartTransports = CartService.getTransports();
    }

    $scope.removeTransportFromCart = function(index) {
        CartService.removeTransport(index);
        $scope.cartTransports = CartService.getTransports();
    }
};

vKation.controller('ExploreCtrl', ExploreCtrl);
ExploreCtrl.$inject = ['$rootScope'
    , '$scope'
    , '$state'
    , '$localStorage'
    , 'toastr'
    , 'NgMap'
    , 'CartService'
    , 'hotel'
    , 'attractions'
    , 'transports'
  
];