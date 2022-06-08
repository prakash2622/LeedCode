<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%
String p = (String) session.getAttribute("pn");
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
<%
String PNR = (String) session.getAttribute("pn");
%>
<%
String name = "";
String sn = "";
String fs = "";
String ts = "";
%>
<%
try {
	connection = DriverManager.getConnection(connectionUrl + database, userid, password);
	String sql1 = "SELECT * FROM Reservation.BookingDetails where PNR=?";
	PreparedStatement pss = connection.prepareStatement(sql1);
	pss.setString(1, PNR);
	resultSet = pss.executeQuery();
	while (resultSet.next()) {
		name = resultSet.getString("PassengerName");
		sn = resultSet.getString("seatNo");
		ts = resultSet.getString("ToStation");
		fs = resultSet.getString("FromStation");
	}

} catch (Exception e) {
	e.printStackTrace();
}

try {
	connection = DriverManager.getConnection(connectionUrl + database, userid, password);
	String sql = "update Reservation.BookingDetails set PassengerName=NULL,SeatAvailability='Available' "
	+ ",FromStation=NULL,ToStation=NULL where PNR=?";
	PreparedStatement ps = connection.prepareStatement(sql);
	ps.setString(1, PNR);
	ps.executeUpdate();
} catch (Exception e) {
	e.printStackTrace();
}

try {
	connection = DriverManager.getConnection(connectionUrl + database, userid, password);
	String sql2 = "insert into Reservation.CancelTickets(PNR,PassengerName,SeatNo,FromStation,ToStation)values(?,?,?,?,?)";
	out.print(name + 2);
	PreparedStatement ps1 = connection.prepareStatement(sql2);
	ps1.setString(1, PNR);
	ps1.setString(2, name);
	ps1.setString(3, sn);
	ps1.setString(4, fs);
	ps1.setString(5, ts);
	ps1.executeUpdate();
	connection.close();
} catch (Exception e) {
	e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Cancel.css">
<meta charset="UTF-8">
<title>Reservation System</title>
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
	<br>
	<div class="center">
		<h1>Successfully Cancelled</h1>
	</div>
</body>
</html>