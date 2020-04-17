<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="main.DBagent"%>
<%@page import="java.io.PrintWriter"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>****JSP****</title>
</head>
<body>
JSP file is running
<br>
<br>
<%
	String query = "select id, name from customers";

	DBagent db = new DBagent();
	Connection conn = db.getConnection();
	if (conn == null) {
		out.print("Connection failed!");
	}
	else {
		out.print("Connection success!<BR><BR>");
	}
	
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(query);
    
		
	while (rs.next()) {
 	   int id = rs.getInt(1);
 	   String name = rs.getString(2);
 	   out.print(id+": "+name+"<br>");
 	 }
	
	
%>


</body>
</html>