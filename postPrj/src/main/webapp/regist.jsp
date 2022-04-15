<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registPage</title>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<form name="frm" action="regist" method="post">
<table border="1" class="center">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="userId" id="userId"/>
		<input type="button" value="중복확인" onClick="idChk()"/>
		<div id="demo"></div>	
		</td>
	</tr>	
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="userPw" id="userPw"/>
		<input type="submit" value="회원가입" onClick="return registChk()"/></td>
	</tr>
</table>
</form>
<script src="js/script.js"></script>
</body>
</html>