angular.module("components")
    .directive("customFooter", [function () {
        return {
            templateUrl: "public/app/templates/footer.jsp",
            restrict: "A,E,C"
        };
       
}]);
