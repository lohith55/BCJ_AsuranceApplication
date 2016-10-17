/**
 * Here main module named "autoInsurance" is created which depends on the two other 
 * modules, components and ui.router so that our ng-app starting point can be just 
 * "autoInsurance" instead of multiple ng-app
 */
(
    function () {
        angular.module("components", []);
        angular.module("autoInsurance", ["components","ui.router"]);
    }
)();
