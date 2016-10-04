<% String failure = (String) session.getAttribute("failure"); %>
<div class="container text-center" id="retrieveQuotePage">
  <h1 style="color:orange">Use your quote to continue</h1>
  <%if(failure != null) {%><div  style="color:red"><%=failure %></div>
					<%} session.invalidate();%>
  <form class="form-inline" action="" method="post">
    <input type="text" class="form-control" size="50" placeholder="Your Quote" required>
    <button type="submit" class="btn btn-danger">Continue</button>
  </form>
</div>



