function IndexCtrl($rootScope, $scope, $state, $filter, $localStorage, toastr, $uibModal, $auth, places, budgets, stayTypes, categories, HotelService, UserService) {

    "use strict";

    var SEARCH_TEXT = "EXPLORE OUR RECOMMENDATIONS";

    (function() {
        $scope.startDate = new Date().toString();
        $scope.bookingType = '';
        $scope.searchText = SEARCH_TEXT;
        $scope.search = $localStorage.search || {} ;
        $scope.showForm = true;
        $scope.places = places;
        $scope.budgets = budgets;
        $scope.stayTypes = stayTypes;
        $scope.showCategories = false;
        $scope.categories = categories;
        $scope.showActivity = false;
        $scope.selectedCategories = [];
        if ($localStorage.user) {
            $scope.user = $localStorage.user;
            $scope.isLoggedIn = true;
        }
        else {
            $scope.isLoggedIn = false;
        }
        if ($localStorage.search) {
            $scope.filteredPlace = $filter('filter')($scope.places, {id: $scope.search.place})[0].name;
        }
        else
        {
            $scope.filteredPlace = '';
        }
        $scope.checkInDateSelected = false;

    }());

    $rootScope.$on("user-logged-in", function(event, user) {
        $scope.isLoggedIn = true;
        $scope.user = user;
    });

    $rootScope.$on("user-logged-out", function(event) {
        $scope.isLoggedIn = false;
        $scope.user = null;
    });
    $scope.$watch('search', function() {
        $scope.showCategories = false;
    }, true);

    $scope.showCategoryActivities = function(index){
        var category = $scope.categories[index];
        var found = false;
        $scope.selectedCategories.forEach(function(c) {
            if (c.id === category.id) {
                found = true;
            }
        });
        if (found) {
            var selectedIndex = $scope.selectedCategories.indexOf(category);
            $scope.selectedCategories.splice(selectedIndex, 1);
        }
        else {
            category.activities.forEach(function(activity) {
                activity.selected = false;
            });
            $scope.selectedCategories.push(category);
        }
    }

    $scope.toggleActivitySelection = function(cId, aId) {
        $scope.selectedCategories.forEach(function(c) {
            if (c.id === cId) {
                c.activities.forEach(function (a) {
                    if (a.id === aId) {
                        a.selected = !a.selected;
                    }
                });
            }
        });
    }

    $scope.getForm = function(type){
        if (type === 'custom'){
            $scope.text_type = 'Customised Packages';
        }else{
            $scope.text_type = 'Best Deals';
        }
        $scope.showForm = false;
    }

    $scope.searchData = function(type, search, form) {
        if (form.$invalid) {
            return;
        }
        $localStorage.search = search;
        $scope.showCategories = true;
    }

    $scope.searchHotels = function() {

        var categories = [];
        $scope.selectedCategories.forEach(function(c) {
            var category = {};
            category.category_id = c.id;
            category.activities = [];
            c.activities.forEach(function(a) {
                if (a.selected) {
                    category.activities.push(a.id);
                }
            });
            categories.push(category);
        });

        $scope.isWorking = true;
        $scope.searchText = "Please wait ...";

        $scope.search.start_date1 = angular.copy($scope.search.start_date);
        $scope.search.end_date1 = angular.copy($scope.search.end_date);

        var start_date = $scope.search.start_date1.split('/');
        var end_date = $scope.search.end_date1.split('/');
        
        $scope.search.start_date1 = start_date[2]+'-'+start_date[1]+'-'+start_date[0];
        $scope.search.end_date1 = end_date[2]+'-'+end_date[1]+'-'+end_date[0];

        HotelService.search($scope.search, categories)
        .then(function(properties) {
            $scope.isWorking = false;
            $scope.searchText = SEARCH_TEXT;
            if (properties.length > 0) {
                $localStorage.hotels = properties;
                $state.go('results-index');
            }
            else {
                toastr.error("Sorry! We could not find any results for given criteria.", "Error!");
            }
        }, function(error) {
            $scope.isWorking = false;
            toastr.error('Something went wrong.', 'Error!');
        });
    }

    $scope.openSignUpPopup = function(){
        var modalInstance = $uibModal.open({
            templateUrl: "assets/angular/templates/popup/signup.popup.html",
            controller: 'SignUpCtrl'
        });
        modalInstance.result
        .then(function(result) {
            if (result === 'log-in') {
                $scope.openLoginPopup();
            }
        })
    }

    $scope.openLoginPopup = function(){
        var modalInstance = $uibModal.open({
            templateUrl: "assets/angular/templates/popup/login.popup.html",
            controller: 'LoginCtrl'
        });
        modalInstance.result
        .then(function(result) {
            if (result === 'forgot-password') {
                $scope.openResetPwPopup();
            }
            else if (result === 'sign-up') {
                $scope.openSignUpPopup();
            }
            else if (result === 'fb-login') {
                $auth.authenticate("facebook")
                .then(function(response) {
                    $localStorage.user = response.data.user;
                    $scope.$emit('user-logged-in', $localStorage.user);
                    toastr.success("Congratulation, you have logged in.");
                },function(code){
                    if (code == 400) {
                     toastr.error('Something went wrong.', 'Error!');
                     $scope.errorMessage = "Something went wrong.  Error!";
                 }
             });
            }
        });
    }

    $scope.openResetPwPopup = function() {
        var modalInstance = $uibModal.open({
            templateUrl: "assets/angular/templates/popup/reset-password.popup.html",
            controller: 'ResetPwCtrl',
            resolve : {
                token: function(){
                    return null;
                }
            }
        });
        modalInstance.result
        .then(function(result) {
            if (result === 'log-in') {
                $scope.openLoginPopup();
            }
        })
    }

    $scope.logout = function() {
        delete $localStorage.user;
        $scope.$emit('user-logged-out', null);
        $state.go('index');
    }

    $scope.viewDetails = function(index){
        var category = $scope.categories[index];
        if($scope.selectedCategories.indexOf(category)) {
            return false;
        }
        else {
            return true;
        }
    }

    $scope.date_format=function() {
        $scope.formated_start_date = angular.copy($scope.search.start_date);
        var date = $scope.formated_start_date.split('/');
        date[0] = (parseInt(date[0])+1).toString();
        $scope.formated_start_date = (new Date((date[1]+'/'+date[0]+'/'+date[2])).toString());
        $scope.checkInDateSelected=true;
    }

    
};

vKation.controller('IndexCtrl', IndexCtrl);
IndexCtrl.$inject = ['$rootScope'
, '$scope'
, '$state'
, '$filter'
, '$localStorage'
, 'toastr'
, '$uibModal'
, '$auth'
, 'places'
, 'budgets'
, 'stayTypes'
, 'categories'
, 'HotelService'
, 'UserService'
];