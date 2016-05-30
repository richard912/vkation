function ResultsCtrl($rootScope, $scope, $state, $localStorage, toastr, NgMap, attractions, categories, amenities) {

    "use strict";

    (function() {
        $scope.googleMapsUrl="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkxG3qQ8ZU-VKCUonHC8PbEKgSNP1pOf4";
        $scope.hotels = $localStorage.hotels;
        $scope.search = $localStorage.search;
        $scope.amenities = amenities;
        $scope.attractions = attractions;
        $scope.showFilters = false;
        $scope.imageArray = ["/assets/bg-banner.jpg","/assets/pg-1.jpg"]
        $scope.categories = categories;
        $scope.map = {
            center: {
                latitude: $scope.hotels[0].latitude,
                longitude: $scope.hotels[0].longitude
            }
        }
        $scope.showHotelPopup = false;
        $scope.IsVisible = false;
        $scope.ShowMore = false;
        $scope.isChecked = false;
        $scope.categories = categories;
        $scope.selectedCategories = [];
        $scope.selectedAmenities = [];
    })();

    // NgMap.getMap().then(function(map) {
    // });

    $scope.markerClick = function(hotel) {
        $scope.showHotelPopup = true;
        $scope.selectedHotel = hotel;
    }

    $scope.closeHotelPopup = function() {
        $scope.showHotelPopup = false;
    }

    $scope.explore = function(hotelIndex) {
        $localStorage.hotel = $scope.hotels[hotelIndex];
        $state.go('explore');
    }
    $scope.ShowHide = function () {
        $scope.IsVisible = !$scope.IsVisible;
    }
    $scope.MoreShow=function(){
        $scope.ShowMore = !$scope.ShowMore; 
    }
    $scope.showChecked=function(index){
        $scope.isChecked[index] = !$scope.isChecked[index];     
    }
    $scope.exploreByPopup = function() {
        $localStorage.hotel = $scope.selectedHotel;
        $state.go('explore');
    }
    $scope.moreFilters = function(){
        $scope.showFilters = !$scope.showFilters
    }
    $scope.selectCategory = function(index, status){
        if(status === true){
            $scope.selectedCategories.push($scope.categories[index].name)
        }else{
            $scope.selectedCategories.splice($scope.categories[index].name, 1);
        }
    }
    $scope.selectedAmenity = function(index, status){
        if(status === true){
            $scope.selectedAmenities.push($scope.amenities[index].name)
        }else{
            $scope.selectedAmenities.splice($scope.amenities[index].name, 1);
        }
    }
    $scope.getHotels = function(){
        $state.go($state.current, {}, {reload: true});
    }
};

vKation.controller('ResultsCtrl', ResultsCtrl);
ResultsCtrl.$inject = ['$rootScope'
            , '$scope'
            , '$state'
            , '$localStorage'
            , 'toastr'
            , 'NgMap'
            , 'attractions'
            , 'categories'
            , 'amenities'
];