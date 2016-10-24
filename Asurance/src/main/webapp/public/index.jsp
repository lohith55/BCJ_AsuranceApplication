

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html ng-app="autoInsurance">

<head>
    <link rel="stylesheet" href="public/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="public/bower_components/bootstrap/dist/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="public/css/style.css">
    <link rel="stylesheet" href="public/css/driverPage.css">
        <link rel="stylesheet" href="public/css/footer.css">
    <link href="public/css/navbar.css" rel="stylesheet">
    <link rel="stylesheet" href="public/bower_components/jquery-ui/themes/base/minified/jquery-ui.min.css">
    <script src="public/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="public/bower_components/jquery-ui/ui/minified/jquery-ui.min.js"></script>
    <script src="public/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="public/bower_components/angular/angular.js"></script>
    <script src="public/bower_components/angular-ui-router/release/angular-ui-router.min.js"></script> 
</head>

<body >
    <div class="container-fluid" ng-controller="mainCtrl">
        <div custom-header></div>
         <div ui-view ></div>
        
    </div>
    <footer custom-footer></footer>

   <script src="public/app/modules/modules.js"></script>
   <script src="public/app/app.js"></script>
    <script src= "public/app/configuration/config.js"></script>
    <script src= "public/app/components/customHeader.js"></script>
    <script src= "public/app/components/customLogo.js"></script>
    <script src= "public/app/components/startPage.js"></script>
     <script src= "public/app/components/footer.js"></script>
    <script src= "public/app/components/stateController.js"></script>
    <script src= "public/app/components/formController.js"></script>
    <script src= "public/app/components/formController.js"></script>
     <script src= "public/app/components/datePicker.js"></script>
    <!-- <script src="app/components/route.js"></script> -->
   
    
</body>

</html>

