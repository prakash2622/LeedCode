<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>


<%
String PN = request.getParameter("PNR");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "Reservation";
String userid = "root";
String password = "password123@";
try {
	Class.forName(driver);
} catch (ClassNotFoundException e) {
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Cancel.css">
<title>Cancel Ticket</title>
</head>
<body>
	<nav>
		<ul>
			<li><a href="index.html">Book Ticket</a></li>
			<li><a href="Cancel.html">Cancel Ticket</a></li>
			<li><a href="summary.html">Booking Summary</a></li>

		</ul>
	</nav>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<%--
	if(session.getAttribute("name")==null){
	%>

    <script >
			setTimeout(function(){ window.location = "Login.jsp"; },3000);
    </script>
	<%
	}
	--%>
<% 
    //if(session.getAttribute("name")!=null){
	try {
		connection = DriverManager.getConnection(connectionUrl + database, userid, password);
		statement = connection.createStatement();
		
		String sql = "SELECT * FROM Reservation.BookingDetails where PNR=" +PN;
		resultSet = statement.executeQuery(sql);
	
		while (resultSet.next()) {
			
	%>
	<table class="content-table">
		<thead>
			<tr>
				<th>PNR No</th>
				<th>:</th>
				<th><%=resultSet.getString("PNR")%></th>
			</tr>
		</thead>
		<thead>
			<tr>
				<td>Date</td>
				<td>:</td>
				<td><%=resultSet.getString("Date")%></td>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>Passenger Name</th>
				<th>:</th>
				<th><%=resultSet.getString("PassengerName")%></th>
			</tr>
		</thead>
		<thead>
			<tr>
				<td>Seat No</td>
				<td>:</td>
				<td><%=resultSet.getString("SeatNo")%></td>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>Seat Availablity</th>
				<th>:</th>
				<th><%=resultSet.getString("SeatAvailability")%></th>
			</tr>
		</thead>
		<thead>
			<tr>
				<td>From Station</td>
				<td>:</td>
				<td><%=resultSet.getString("FromStation")%></td>
			</tr>
		</thead>
		<thead>
			<tr>
				<th>To Station</th>
				<th>:</th>
				<th><%=resultSet.getString("ToStation")%></th>
			</tr>
		</thead>

		<thead>
			<tr>
				<td>Berth</td>
				<td>:</td>
				<td><%=resultSet.getString("Berth")%></td>
			</tr>
		</thead>
	</table>
	<div class="center">
 <%  
 String pnr=request.getParameter("PNR");
 %>
 <% 
 session.setAttribute("pn",pnr);
 %>
		<button class="submit " value="Click to Submit" onclick="window.location.href='Confirm.jsp'">Confirm
			Cancel</button>
		<br>
		<br>
	</div>
	<div class="center1">
		<button class="submit " value="Click to Submit"
			onclick="window.location.href='Cancel.html'">Back</button>
		<br>
		<br>
	</div>
	
	<%

connection.close();
				
}
	}	
catch (Exception e) {
e.printStackTrace();
}
 
%>
</body>
</html>