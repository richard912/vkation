function LoginCtrl($rootScope, $scope, $state, $localStorage, toastr, $uibModalInstance, UserService) {

    "use strict";

    (function() {
        $scope.buttonText = "Login";
    }());

    $scope.close = function(){
        $uibModalInstance.close("cancel");
    }

    $scope.authenticate = function(form) {
        if (!form.$valid) {
            return;
        }
        $scope.buttonText = "Please wait ...";
        $scope.errorMessage = "";
        $scope.isWorking = true;
        UserService.authenticate($scope.email, $scope.password)
            .then(function(user) {
                $localStorage.user = user;
                $scope.$emit('user-logged-in', user);
                $scope.isWorking = false;
                toastr.success("Congratulation, you are logged in");
                $uibModalInstance.close("cancel");
            }, function(code) {
                $scope.buttonText = "Login";
                $scope.isWorking = false;
                if (code == 400) {
                    toastr.error('Invalid email/password', 'Error!');
                    $scope.errorMessage = "Invalid email/password";
                }
            });
    }

    $scope.fbLogin = function() {
        $uibModalInstance.close("fb-login");
    }

    $scope.resetPassword = function() {
        $uibModalInstance.close("forgot-password");
    }

    $scope.signup = function() {
        $uibModalInstance.close("sign-up");
    }

};

vKation.controller('LoginCtrl', LoginCtrl);
LoginCtrl.$inject = ['$rootScope'
    , '$scope'
    , '$state'
    , '$localStorage'
    , 'toastr'
    , '$uibModalInstance'
    , 'UserService'
];
