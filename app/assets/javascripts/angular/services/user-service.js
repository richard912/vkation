vKation.factory("UserService", function ($http, $q, $localStorage, $apiRoot) {
    var resourcePath = $apiRoot + "users";

    return {
        register: function(user) {
            var url = resourcePath + "/register/";
            var defer = $q.defer();
            $http({
                method: 'POST',
                url: url,
                data: {
                    user: user
                }
            }).success(function (data, status, header, config) {
                defer.resolve(data.user);
            }).error(function (data, status, header, config) {
                defer.reject(status);
            });
            return defer.promise;
        },
        authenticate: function (email, password) {
            var url = resourcePath + "/authenticate/";
            var defer = $q.defer();
            $http({
                method: 'POST',
                url: url,
                data: {
                    email: email,
                    password: password
                }
            }).success(function (data, status, header, config) {
                defer.resolve(data.user);
            }).error(function (data, status, header, config) {
                defer.reject(status);
            });
            return defer.promise;
        },
        logout: function (api_token) {
            var url = resourcePath + "/logout/";
            var defer = $q.defer();
            $http({
                method: 'DELETE',
                url: url,
                data: {
                    api_token: api_token
                }
            }).success(function (data, status, header, config) {
                defer.resolve(data);
            }).error(function (data, error, status, header, config) {
                defer.reject(error);
            });
            return defer.promise;
        },
        emailExists: function (email) {
            var url = resourcePath + "/email_exists?email=" + email;
            var defer = $q.defer();
            $http({
                method: 'GET',
                url: url
            }).success(function (data, status, header, config) {
                defer.resolve(data);
            }).error(function (data, status, header, config) {
                defer.reject(data);
            });
            return defer.promise;
        },
        reset_password_email: function(email){
            var url = resourcePath + "/forgot_password?email=" + email;
            var defer = $q.defer();
            $http({
                method: 'POST',
                url: url
            }).success(function (data, status, header, config) {
                defer.resolve(data);
            }).error(function (data, status, header, config) {
                defer.reject(data);
            });
            return defer.promise;   
        },
        checkForgetUser: function(token){
            var url = resourcePath +"/check_user?token="+token;
            var defer = $q.defer();
            $http({
                method: 'GET',
                url: url
            }).success(function (data, status, header, config) {
                defer.resolve(data);
            }).error(function (data, status, header, config) {
                defer.reject(data);
            });
            return defer.promise;
        },
        password_change: function(passowrd, confirm_password, user_email){
            var url = resourcePath +"/reset_password";
            var defer = $q.defer();
            $http({
                method: 'POST',
                url: url,
                data:{
                    user_email: user_email,
                    password: passowrd,
                    confirm_password: confirm_password
                }
            }).success(function (data, status, header, config) {
                defer.resolve(data);
            }).error(function (data, status, header, config) {
                defer.reject(data);
            });
            return defer.promise;
        }
    };
});