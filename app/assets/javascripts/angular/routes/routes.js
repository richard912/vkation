vKation.config(function ($stateProvider, $urlRouterProvider, $httpProvider) {
    $urlRouterProvider.otherwise('/index');
    $stateProvider
    .state('base', {
        abstract: true,
        templateUrl: 'assets/angular/templates/base/base.html',
        controller: 'IndexCtrl',
        resolve : {
            places: function(PlaceService){
                return PlaceService.list();
            },
            budgets: function(BudgetService){
                return BudgetService.list();
            },
            stayTypes: function(StayTypeService){
                return StayTypeService.list();
            },
            categories: function(CategoryService){
                return CategoryService.list();
            }
        }
    })
    .state('base2', {
        abstract: true,
        parent: 'base',
        templateUrl: 'assets/angular/templates/base/base2.html',
        controller: 'IndexCtrl'
    })
    .state('index', {
        url: '/index',
        parent: 'base',
        templateUrl: 'assets/angular/templates/main/index.html',
        controller: 'IndexCtrl'        
    })
    .state('results-index', {
        url: '/results',
        parent: 'base2',
        templateUrl: 'assets/angular/templates/results/results-index.html',
        controller: 'ResultsCtrl',
        resolve: {
            attractions: function ($localStorage, PlaceService) {
                return PlaceService.attractions($localStorage.search.place, null, null);
            },
            categories: function (CategoryService) {
                return CategoryService.list();
            },
            amenities: function (CategoryService) {
                return CategoryService.getAmenities();
            }
        }
    })

    .state('explore', {
        url: '/explore',
        parent: 'base2',
        templateUrl: 'assets/angular/templates/explore/explore.html',
        controller: 'ExploreCtrl',
        resolve: {
            hotel: function($localStorage) {
                return $localStorage.hotel;
            },
            attractions: function($localStorage, PlaceService) {
                return PlaceService.attractions($localStorage.search.place,
                    $localStorage.hotel.longitude,
                    $localStorage.hotel.latitude);
            },
            transports: function(TransportService) {
                return TransportService.list();
            }
        }
    })
    .state('checkout',{
        url:'/checkout',
        parent:'base2',
        templateUrl: 'assets/angular/templates/checkout/checkout_page.html',
        controller: 'CheckoutCtrl'
        // controller: ExploreCtrl,
        // resolve: {
        //     hotel: function($localStorage) {
        //         return $localStorage.hotel;
        //     },
        //     attractions: function($localStorage, PlaceService) {
        //         return PlaceService.attractions($localStorage.search.place,
        //                                         $localStorage.hotel.longitude,
        //                                         $localStorage.hotel.latitude);
        //     }
        // }
    })
    .state('resetPassword', {
        url: '/forget-password/:token',
        templateUrl: 'assets/angular/templates/reset_password/reset_password.html',
        controller: 'ChangePwdCtrl',
        parent:'base2',
        resolve : {
            token: function(UserService, $stateParams){
                return UserService.checkForgetUser($stateParams.token);
            }
        }
    })

});
vKation.run(['$rootScope', '$localStorage', function ($rootScope, $localStorage, $state, Subdomain) {
    $rootScope.$on('$stateChangeSuccess', function (event, to, toParams, from, fromParams, $state) {
        if (from.name === 'checkout' && to.name === 'explore'){
            window.location.reload();
        }
        if (from.name === 'explore' && to.name === 'results-index'){
            window.location.reload();
        }
        if (from.name === 'results-index' && to.name === 'index'){
            window.location.reload();
        }
    });
    $rootScope.$on('$stateChangeError', function (event, to, toParams, from, fromParams, error, $state, $localStorage) {
    });
}]);