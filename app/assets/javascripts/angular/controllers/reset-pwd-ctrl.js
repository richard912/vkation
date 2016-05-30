function ResetPwCtrl($rootScope, $scope, $state, $localStorage, $uibModalInstance, UserService, toastr, token){

    "use strict";

    (function() {
        $scope.buttonText = "Login";
        $scope.email = '';
        $scope.password='';
        $scope.confirm_password='';
        if (token == null)
        {
            $scope.user = '';
        }
        else
        {
            $scope.user = token;    
        }
    }());

    $scope.close = function(){
        $uibModalInstance.close("cancel");
    }

    $scope.reset_password= function(email, form){
        console.log('sssssssss',form);
        if(form.$Invalid){
            return
        }else{
            UserService.reset_password_email(email)
                .then(function(user) {
                    toastr.success("Check your email address for password reset email.");
                    $state.go('index');
                }, function(code) {
                    if (code == 400) {
                        console.log(code)
                        toastr.error('Invalid email', 'Error!');
                        $scope.errorMessage = "Invalid email";
                    }
                });  
        }
    }

};

vKation.controller('ResetPwCtrl', ResetPwCtrl);
ResetPwCtrl.$inject = ['$rootScope'
    , '$scope'
    , '$state'
    , '$localStorage'
    , '$uibModalInstance'
    , 'UserService'
    , 'toastr'
    , 'token'
];

