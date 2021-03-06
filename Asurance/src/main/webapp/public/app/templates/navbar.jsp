<% String sessionId = (String) session.getAttribute("currentSession");%>

<nav class="navbar navbar-default navbar-fixed-top navbar-collapse" id="navbar">
  <div class="container-fluid">
  	
  	 <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
   
    	<a class="navbar-brand" href="#"><custom-logo></custom-logo></a>
    
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
  
     <ul class="nav navbar-nav navbar-right">
      <!-- <li data-toggle="modal" data-target="#registerModal" ui-sref="login"><a href="#/login"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li data-toggle="modal" data-target="#loginModal"><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <li ><a href="#"><span class="glyphicon glyphicon-edit"></span> Get Quote</a></li> -->
      
      <%if("activeSession".equals(sessionId)) {%>
      <li><a href="profile"> <span class="glyphicon glyphicon-user"></span>Welcome ${customer.firstName} </a></li>
      <%} else {%>
      <li   ui-sref="register" ng-class="{active: isActive=='#/register'}" ng-click='isActive="#/register"'><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li  ui-sref="login" ng-class="{active: isActive=='#/login'}" ng-click='isActive="#/login"'><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      <%} %>
      <li ui-sref="quote" ng-class="{active: isActive=='#/quote'}" ng-click='isActive="#/quote"'><a href="#"><span class="glyphicon glyphicon-edit"></span> Get Quote</a></li>
        <li ui-sref="retrieveQuote" ng-class="{active: isActive=='#/retrieveQuote'}" ng-click='isActive="#/retrieveQuote"'><a href="#"><span class="glyphicon glyphicon-edit"></span> Retrieve Quote</a></li>
    </ul>
  </div>
  </div>
</nav>


