	var vKation = angular
        .module('vKation', [
            'ui.router',
            'ui.bootstrap',
            'ngStorage',
            'toastr',
            'duScroll',
            '720kb.tooltips',
            'angular-confirm',
            'angular-loading-bar',
            'naif.base64',
            '720kb.datepicker',
            'satellizer',
            'ngAnimate',
            'ngMap',
            'angular-flexslider'
        ]);

	vKation.config(["$provide", function ($provide) {
		$provide.value("$apiRoot", "/api/");
    }]);

    vKation.config(function($authProvider) {
        $authProvider.facebook({
            clientId: '1305929016091208',
            name: 'facebook',
            url: '/api/auths/facebook',
            authorizationEndpoint: 'https://www.facebook.com/v2.5/dialog/oauth',
            redirectUri: window.location.origin + '/',
            requiredUrlParams: ['display', 'scope'],
            scope: ['email'],
            scopeDelimiter: ',',
            display: 'popup',
            type: '2.0',
            popupOptions: { width: 580, height: 400 }
        });
    });

	vKation.config(["$httpProvider", function ($httpProvider) {
        csrfToken = $('meta[name=csrf-token]').attr('content');
        $httpProvider.defaults.headers.post['X-CSRF-Token'] = csrfToken;
        $httpProvider.defaults.headers.put['X-CSRF-Token'] = csrfToken;
        $httpProvider.defaults.headers.patch['X-CSRF-Token'] = csrfToken;
    }]);

    vKation.filter('range', function() {
        return function(input, total) {
            total = parseInt(total);
            for (var i=0; i<total; i++) {
                input.push(i);
            }
            return input;
        };
    });

    vKation.config(function (toastrConfig) {
        angular.extend(toastrConfig, {
            allowHtml: false,
            closeButton: true,
            closeHtml: '<button>&times;</button>',
            extendedTimeOut: 1000,
            iconClasses: {
                error: 'toast-error',
                info: 'toast-info',
                success: 'toast-success',
                warning: 'toast-warning'
            },
            messageClass: 'toast-message',
            onHidden: null,
            onShown: null,
            onTap: null,
            progressBar: false,
            tapToDismiss: true,
            templates: {
                toast: 'directives/toast/toast.html',
                progressbar: 'directives/progressbar/progressbar.html'
            },
            timeOut: 5000,
            titleClass: 'toast-title',
            toastClass: 'toast'
        });
    });


 