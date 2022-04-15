<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPage</title>
<script src="js/script.js"></script>
</head>
<jsp:include page="header.jsp"></jsp:include>
<body>
<form name="frm" method="post" action="login">
<table class="center">
	<tr>
		<td>
			<input type="text" name="userId" id="userId" placeholder="ID를 입력하세요."/><br>
		</td>
	<tr>
		<td>
			<input type="password" name="userPw" id="userPw"/>
		</td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="로그인" onClick="return loginChk()"/>
			<input type="button" value="회원가입" onClick="goRegist()"/>
		</td>
	</tr>
	<tr>
		<td>${message }</td>
	</tr>
</table>
</form>
</body>
</html>