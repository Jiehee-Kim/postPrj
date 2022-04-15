<%@page import="DBcon.DBcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>write</title>
<style type="text/css">
	th{
		height : 24px;
		width : 150px;
	}
	td{
		width : 300px;
		text-align : center;
	}
</style>
<script src="js/script.js"></script>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<form name="frm" action="write" method="post">
<%
	String sql = "SELECT max(postNum) FROM postDb";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		conn = DBcon.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
	
		rs.next();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<table border="1" class="center">
	<tr style="display:none">
		<td><input type="text" name="postNum" value="<%=rs.getInt(1)+1%>"/></td>
		<td><input type="text" name="name" value="${name }"/></td>
	</tr>
	<tr>
		<th>분류</th>
		<td>
		<select name="tag" size="1" style="width:98%">
			<option value="1">일상</option>
			<option value="2">약속</option>
			<option value="3">행사</option>
			<option value="4">일기</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" name="title" style="width:98%"/></td>
	</tr>
	<tr>
		<th colspan="2">내용</th>
	</tr>
	<tr>
		<td colspan="2"><input type="text" name="content" style="width:98%"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="등록"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>