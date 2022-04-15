<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBcon.DBcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<form name="frm" action="cModi" method="post">
<%
	String sql = "SELECT * FROM postDb where postNum= ?";
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String _postNum = request.getParameter("postNum");
	int postNum = Integer.parseInt(_postNum);
	
	try{
		conn = DBcon.getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, postNum);
		
		rs = pstmt.executeQuery();
		
		rs.next();
%>
<table class="center" border="1">
	<tr style="display:none">
		<td>
			<input type="text" name="userId" value="<%=rs.getString("userId")%>"/>
			<input type="text" name="postNum" value="<%=rs.getInt("postNum") %>"/>
		</td>
	</tr>
	<tr>
		<th>분류</th>
		<td><%=rs.getInt("tag") %></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><%=rs.getString("title")%></td>
	</tr>
	<tr>
		<th colspan="2">내용</th>
	</tr>
	<tr>
		<td colspan="2"><%=rs.getString("content")%></td>
	</tr>
</table>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
<hr>
<table class="center"border="1">
<%
	String sql2 = "SELECT * FROM comments where commentsNum=?";
	
	int commentsNum = Integer.parseInt(request.getParameter("commentsNum"));
	
	try{
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, commentsNum);
		rs = pstmt.executeQuery();
	
		rs.next();
%>
	<tr style="display:none">
		<td><input type="text" name="cUserId" value="<%=rs.getString("userId")%>"/></td>
		<td><input type="text" name="postNum" value="<%=rs.getInt("postNum")%>"/></td>
		<td><input type="text" name="commentsNum" value="<%=rs.getInt("commentsNum")%>"/></td>
	</tr>
	<tr>
		<td><input type="text" name="comments" value="<%=rs.getString("comments") %>" style="width:98%"/></td>
		<td><input type="submit" value="수정" onClick="return cModiChk()" style="width:98%"/></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="삭제" onClick="return cDel()"/></td>
	</tr>
<%
	}catch(Exception e){
		e.printStackTrace();
	}
%>
</table>
</form>
</body>
</html>