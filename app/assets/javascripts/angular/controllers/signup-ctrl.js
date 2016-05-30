function SignUpCtrl($rootScope, $scope, $state, $localStorage, toastr, $uibModalInstance, $auth, UserService) {

    "use strict";

    $scope.initialize = function () {
        $scope.buttonText = "Signup"
        $scope.isWorking = false;

    };
    $scope.initialize();

    $scope.close = function(){
    	$uibModalInstance.close("cancel");
    }
    
    $scope.signup = function(form) {
        if (form.$invalid) {
            return;
        }else{
            $scope.isWorking = true;
        }
        var user = {
            email: $scope.email,
            password: $scope.password,
            password_confirmation: $scope.confirm_password,
            first_name: $scope.first_name,
            last_name: $scope.last_name,
        }
        UserService.register(user)
            .then(function(response) {
                console.dir(response)
                $localStorage.user = response;
                $scope.$emit('user-logged-in', response);
                $scope.isWorking = false;
                toastr.success("Congratulation, you are registered");
                $uibModalInstance.close("cancel");
            }, function(code) {
                $scope.buttonText = "Signup";
                $scope.isWorking = false;
                if (code == 400) {
                    toastr.error('Something went wrong.', 'Error!');
                    $scope.errorMessage = "Something went wrong.  Error!";
                }
                if (code == 422) {
                    toastr.error('Email has already been taken.', 'Error!');
                    $scope.errorMessage = "Email has already been taken.  Error!";
                }
            });
    }

    $scope.authenticate = function() {
        $uibModalInstance.close("log-in");
    }
};

vKation.controller('SignUpCtrl', SignUpCtrl);
SignUpCtrl.$inject = ['$rootScope'
            , '$scope'
            , '$state'
            , '$localStorage'
            , 'toastr'
            , '$uibModalInstance'
            , '$auth'
            , 'UserService'
];