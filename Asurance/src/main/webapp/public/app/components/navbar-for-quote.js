angular.module("components")
    .directive("navbarHeader", [function () {
        return {
            templateUrl: "navbar-for-quote.jsp",
            restrict: "A,E"
        };
}]);

