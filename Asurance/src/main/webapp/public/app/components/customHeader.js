//Custom directive to create a navigation bar
angular.module("components")
    .directive("customHeader", [function () {
        return {
            templateUrl: "public/app/templates/navbar.jsp",
            restrict: "A,E,C"
        };
}]);
