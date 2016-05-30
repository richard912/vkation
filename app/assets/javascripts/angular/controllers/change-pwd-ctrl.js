function ChangePwdCtrl($rootScope, $scope, $state, $localStorage, UserService, toastr, token){

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
    $scope.changePassword = function(){
        UserService.password_change($scope.password, $scope.confirm_password, $scope.user.user.email)
            .then(function() {
                toastr.success('Password successfully changed.');
                $state.go('index');
            }, function(code) {
                if (code == 400) {
                    toastr.error('Invalid email', 'Error!');
                }
            }); 
    }

};

vKation.controller('ChangePwdCtrl', ChangePwdCtrl);
ChangePwdCtrl.$inject = ['$rootScope'
    , '$scope'
    , '$state'
    , '$localStorage'
    , 'UserService'
    , 'toastr'
    , 'token'
];

