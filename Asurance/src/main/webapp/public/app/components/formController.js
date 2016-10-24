//Module for handling form data on register page and quote generation page
angular.module("components").controller(
		'startPageCtrl',
		function($scope, $http) {
			
			/**when user click on generate quote button on the get quote page all the form data
			 * will be redirected to this quoteForm function for validation
			**/
			$scope.quoteForm = function(model) {
				$scope.registerPage.submitted = true;
				if ($scope.registerPage.$valid) {
					console.log(model);

				} else {
					console.log('Errors in form data');
					$scope.errorField = {
						"color" : "red",
						"font-size" : "30px"
					}
					$scope.errorField2 = {
						"color" : "red"

					}
				}
			};
		

			/**when user click on register button on the register page all the form data
			 * will be redirected to this register function for validation
			**/
			$scope.register = function(model) {
		
				$scope.registerPage.submitted = true;
				//$scope.registerPage.isPasswordMatch = false;
				var formData = {
						"firstName": model.firstName,
						"lastName": model.lastName,
						"dateOfBirth": model.dateOfBirth,
						"addressLine1": model.addressLine1,
						"addressLine2": model.addressLine2,
						"city": model.city,
						"state": model.state,
						"zip": model.zip,
						"password": model.password
					};
				
				var today = new Date();
				var birthDate = new Date(model.dateOfBirth);
				var year = today.getFullYear() - birthDate.getFullYear();
				var month = today.getMonth() - birthDate.getMonth();
				var day = today.getDate() - birthDate.getDate();
				$scope.under18 = false;
				if(year < 18 ){
					//startPageCtrl.$setValidity("underAge", true);
					$scope.under18 = true;
					console.log("age is less than 18");
					$scope.underage = {"color": "red", "font-size": "20px"}
				}
				if(year == 18 && month<=0 && day<=0  ){
					$scope.under18 = true;
					//startPageCtrl.$setValidity("underAge", true);
					console.log("age is less than 18");
					$scope.underage = {"color": "red", "font-size": "20px"}
				}
			
				if ($scope.registerPage.$valid && !$scope.under18) {
					
					console.log(formData);
					$http({
					    method: "POST",
					    url: "register",
					    data: JSON.stringify(formData),
					    contentType: 'application/json; charset=utf-8'
					}).success(function(data){
		            	console.log(data);
		            	window.location.href = "registered";
		            });
				}
				
				else {
					console.log('Errors in form data');
					$scope.errorField = {
						"color" : "red",
						"font-size" : "30px"
					}
					$scope.errorField2 = {
							"color" : "red"

						}
				}
			};
		});