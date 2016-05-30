function CheckoutCtrl($rootScope, $scope, $state, $localStorage, NgMap, CartService) {

    "use strict";

    (function() {
        $scope.buttonText = "Login";
        $scope.cart = CartService.getCart();
        $scope.hotel = CartService.getHotel();
        $scope.attractions = CartService.getAttractions();
        $scope.nights = CartService.getNights();
        $scope.perNightPrice = CartService.getPerNightPrice();
        $scope.grandTotal = CartService.getGrandTotal();
    }());

    $scope.checkout = function() {

        if (!$localStorage.user) {
            $scope.$parent.openLoginPopup();
            return;
        }

        CartService.setUser($localStorage.user);

        var rzp1 = new Razorpay({
            key: 'rzp_test_JkKRub0IbNEK3U',
            amount: CartService.getGrandTotal() * 100,
            name: '',
            description: CartService.getDescription(),
            image: '',
            handler: function(transaction) {
                console.dir(transaction);
                CartService.addBooking(transaction.razorpay_payment_id)
                .then(function(data) {
                    toastr.success("Congratulation, you trip has successfully been booked.");
                    $state.go("index");
                })
            },
            prefil: {
                name: '',
                email: '',
                contact: ''
            }

        });
        rzp1.open();
    }

};

vKation.controller('CheckoutCtrl', CheckoutCtrl);
CheckoutCtrl.$inject = ['$rootScope'
    , '$scope'
    , '$state'
    , '$localStorage'
    , 'NgMap'
    , 'CartService'
];

