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
<form name="frm" action="detail" method="post">
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
		
		String tag = null;
		int _tag = rs.getInt("tag");
		switch(_tag){
		case 1 : 
			tag = "일상";
			break;
		case 2 : 
			tag = "약속";
			break;
		case 3 : 
			tag = "행사";
			break;
		case 4 : 
			tag = "일기";
			break;
		}
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
		<td><%=tag %></td>
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
	<tr>
		<td colspan="2">
			<input type="submit" value="수정" onClick="return userChk()"/>
			<input type="submit" value="삭제" onClick="return delChk()"/>
		</td>
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
	String sql2 = "SELECT * FROM comments where postNum=?";

	try{
		pstmt = conn.prepareStatement(sql2);
		pstmt.setInt(1, postNum);
		rs = pstmt.executeQuery();
	
		while(rs.next()){
%>
	<tr>
		<td><%=rs.getString("userId") %></td>	
		<td><%=rs.getString("comments") %></td>
		<td><a href="cDetail.jsp?postNum=<%=rs.getInt("postNum") %>&commentsNum=<%=rs.getInt("commentsNum")%>">댓글관리</a></td>
		
	</tr>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<%
String sql3 = "SELECT max(commentsNum) FROM comments";

try{
	pstmt= conn.prepareStatement(sql3);
	rs = pstmt.executeQuery();
	
	rs.next();
%>
	<tr>
		<td colspan="2"><input type="text" name="comments" style="width:98%"/></td>
		<td style="display:none"><input type="text" name="cUserId" value="${user }"/></td>
		<td style="display:none"><input type="text" name="postNum" value="${postNum }"/></td>
		<td style="display:none"><input type="text" name="commentsNum" value="<%=rs.getInt(1)+1 %>"></td>
		<td><input type="submit" value="등록" onClick="return commentsChk()" style="width:98%"/></td>
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