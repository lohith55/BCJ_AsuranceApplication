// Custom directive to create a logo so that it can be reused anywhere we want
angular.module("components")
    .directive("customLogo", [function () {
        return {
            templateUrl: "public/app/templates/customLogo.html",
            restrict: "A,E,C"
        };
       
}]);
