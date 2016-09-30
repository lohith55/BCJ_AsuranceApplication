angular.module("components").controller(
		'startPageCtrl',
		function($scope, $http, $state) {
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
			$scope.noThanks = function(){
				$state.go("register");
			};

			$scope.register = function(model) {
		
				$scope.registerPage.submitted = true;
				$scope.registerPage.isPasswordMatch = false;
			
				if ($scope.registerPage.$valid
						&& model.password == model.passwordConfirmation) {
					$scope.registerPage.isPasswordMatch = true;
					
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
					
		
					console.log(formData);
					
					
				
					
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