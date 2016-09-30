
<% String failure = (String) session.getAttribute("message"); %>

<div class="container">
	<div class="row">


		<div
			class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">

			<%if(failure != null) {%><div id="wrongCredential"
				style="color: white; font-size: 20px;"><%=failure %></div>
			<%session.invalidate();} %>

			<form role="form" name="registerPage" ng-controller="startPageCtrl"
				action="getVehicles" method="post">
				<span class="text-error"
					ng-show="registerPage.submitted && registerPage.$invalid"
					ng-style="errorField2">* Required Fields</span><br>

				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">

						<div class="form-group">
							<input type="text" name="firstName" ng-model="model.firstName"
								id="first_name" class="form-control input-lg"
								placeholder="First Name" tabindex="1" required> <span
								class="text-error"
								ng-show="registerPage.submitted && registerPage.firstName.$invalid"
								ng-style="errorField">*</span>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" name="lastName" ng-model="model.lastName"
								id="last_name" class="form-control input-lg"
								placeholder="Last Name" tabindex="2" required> <span
								class="text-error"
								ng-show="registerPage.submitted && registerPage.lastName.$invalid"
								ng-style="errorField">*</span>
						</div>
					</div>
				</div>


				<div class="form-group">
					<input type="text" name="addressLine1"
						ng-model="model.addressLine1" id="add_line_1"
						class="form-control input-lg" placeholder="Mailing Address"
						tabindex="3" required> <span class="text-error"
						ng-show="registerPage.submitted && registerPage.addressLine1.$invalid"
						ng-style="errorField">*</span>
				</div>

				<div class="form-group">
					<input type="text" name="addressLine2"
						ng-model="model.addressLine2" id="add_line_2"
						class="form-control input-lg" placeholder="Apt./Unit #"
						tabindex="4">



				</div>

				<div class="form-group">
					<input type="text" name="city" ng-model="model.city" id="City"
						class="form-control input-lg" placeholder="City" tabindex="5"
						required> <span class="text-error"
						ng-show="registerPage.submitted && registerPage.city.$invalid"
						ng-style="errorField">*</span>
				</div>

				<div class="form-group">
					<input type="text" name="zip" ng-model="model.zip" id="zip"
						class="form-control input-lg" placeholder="Zip" tabindex="6"
						required> <span class="text-error"
						ng-show="registerPage.submitted && registerPage.city.$invalid"
						ng-style="errorField">*</span>
				</div>

				<div class="form-group" ng-controller="stateController">

					<select class="form-control input-lg" name="state" tabindex="7"
						ng-model="model.state" id="stateID" required>
						<option value="">Select State</option>
						<option ng-repeat="state in addState" value="{{state.name}}">{{state.name}}</option>
					</select> <span class="text-error"
						ng-show="registerPage.submitted && registerPage.state.$invalid"
						ng-style="errorField">*</span>
				</div>



				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-md-12">
						<input type="submit" value="Continue"
							class="btn btn-primary btn-block btn-lg"
							ng-click="quoteForm(model)" tabindex="8">
					</div>
				</div>
		</div>
		</form>
	</div>

</div>