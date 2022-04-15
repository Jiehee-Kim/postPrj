<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBcon.DBcon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<table class="center" border="1">
<tr>
	<th>항목명</th><th>값</th>
</tr>
<%
	String sql = "SELECT max(postNum) FROM postDb";

	Connection conn = DBcon.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	try{
		conn = DBcon.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		rs.next();
	
	
%>
	<tr>
		<th>총 게시글 수</th>
		<td><%=rs.getInt(1) %></td>
	</tr>
	
<%
	}catch(Exception e){
		e.printStackTrace();
	}
	
	String sql2 = "SELECT max(commentsNum) FROM comments";
	
	try{
		rs = stmt.executeQuery(sql2);
		
		rs.next();
%>

	<tr>
		<th>총 댓글 수</th>
		<td><%=rs.getInt(1) %></td>
	</tr>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>

</table>
</body>
</html>