/**
 * Here in this module "mainCtrl" controller is used to determine the current 
 * page location so that active link on the tabs can be achieved 
 */
(function () {
    "use strict";
    angular.module("autoInsurance")
        .controller("mainCtrl", ["$scope",  "$location", function ($scope,$location) {
            $scope.isActive =  function (viewLocation) { 
            return viewLocation === $location.path();
            };

        
     }]);
})();
