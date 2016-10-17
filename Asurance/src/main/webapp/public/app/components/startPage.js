//Custom directive to create a template for home page which is start.jsp page
angular.module("components")
    .directive("startPage", [function () {
        return {
            templateUrl: "public/app/templates/start.jsp",
            restrict: "A,E,C"
        };
      
}]);

 