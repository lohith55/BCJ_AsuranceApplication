<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="com.ekthasol.asurance.models.Quote"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Payment Successful!!!</h1>
<%Quote quote = (Quote) session.getAttribute("paidQuote");%>
<h2>Your Quote ID is : ${quote.getQuoteId() }</h2>
<h3>Please save this quote id for future reference.</h3>
<a href="/Asurance" >Click here to go to Home Page</a>
</body>
</html>