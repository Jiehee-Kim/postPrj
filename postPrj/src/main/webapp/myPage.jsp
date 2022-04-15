<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBcon.DBcon"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<table class="center">
	<tr>
		<th>등록한 게시글</th>
	</tr>
<%
	String name = request.getParameter("name");
	
	String sql = "SELECT * FROM postDb WHERE userId = ?";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("title") %></td>
	</tr>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
	<tr>
		<th>작성한 댓글</th>
	</tr>
<%
	String sql2 = "SELECT * FROM comments WHERE userId = ?";
	
	PreparedStatement pstmt2 = null;
	ResultSet rs2 = null;
	
	try{
		pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setString(1, name);
		
		rs2 = pstmt.executeQuery();
		
		while(rs2.next()){
%>
	<tr>
		<td><%=rs.getString("comments") %></td>
	</tr>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</table>
</body>
</html>