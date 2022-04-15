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
<title>post1</title>
<script src="js/script.js"></script>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<form action="postWrite" name="frm" method="post">
	<div id="headline">게시글 전체</div>
	<table class="center">
		<tr>
			<th>분류</th><th>제목</th><th>작성자</th>
		</tr>
<%
	String sql = "SELECT * FROM postDb";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		conn = DBcon.getConnection();
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			String tag = null;
			int tagNum = Integer.parseInt(rs.getString("tag"));
			
			switch(tagNum){
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
		<tr>
			<td><%= tag%></td>
			<td><a href="detail.jsp?postNum=<%= rs.getInt("postNum") %>"><%=rs.getString("title") %></a></td>
			<td><%= rs.getString("userId") %></td>
		</tr>
<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}

%>
	<tr>
		<td colspan="3">
			<input type="text" name="name" value="${user }" style="display:none"/>
			<input type="submit" value="글쓰기" onClick="return chk()"/>
		</td>
	</tr>
	</table>
</form>
</body>
</html>