// Custom directive to create a custom date picker. It can be reused anywhere we want
angular.module("components")
    .directive("datePicker", [function () {
        return {
            restrict: "A",
            link: function (scope, element, attrs) {
                element.datepicker();
            }
        };
}]);
