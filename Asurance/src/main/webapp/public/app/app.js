(function () {
    "use strict";
    angular.module("autoInsurance")
        .controller("mainCtrl", ["$scope", "$rootScope", "$location", function ($scope, $rootScope,$location) {
            var baseUrl = "public/app/templates/";
            $scope.templates = {
                navbarUrl: baseUrl + "navbar.jsp",
                footerUrl: baseUrl + "footer.jsp",
                registerUrl: baseUrl + "register.jsp",
                loginUrl: baseUrl + "login.jsp",
                tabsUrl: baseUrl + "tabs.jsp",
                policyUrl: baseUrl + "policyNumber.jsp"
            };
            $scope.isActive =  function (viewLocation) { 
            return viewLocation === $location.path();
            };

        
     }]);
})();
