<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
<style type="text/css">
	*{
		margin : 0;
		padding : 0;
	}
	
	#header{
		height : 80px;
		text-align : center;
		font-size : 48px;
		font-weight : bold;
		padding : 20px;
		background-color : skyblue;
		color : black;
	}
	
	nav{
		height : 30px;
		text-align : center;
		font-size : 18px;
		padding : 5px;
		background-color : pink;
	}
	
	.nav{
		margin-left : 20px;
		margin-right : 20px;
		color : blue;
	}
	
	#user{
		height : 20px;
		text-align : right;
		font-size : 16px;
		font-weight : bold;
		padding : 5px;
		background-color : black;
		color : white;
	}
	
	#headline{
		font-size : 36px;
		font-weight : bold;
		margin-top : 10px;
		margin-bottom : 10px;
		text-align : center;
	}
	
	.center{
		margin-top : 30px;
		margin-left : auto;
		margin-right : auto;
	}
	
	table{
		width : 400px;
		text-align : center;
	}
	
	hr{
		margin-top : 30px;
		margin-bottom : 30px;
	}
</style>
<script src="js/script.js"></script>
</head>
<header>
<form name="hFrm" action="aChk" method="post">
	<div id="header">
		post
	</div>
	<nav>
		<object>
			<select name="a" size="1">
			<option value="0">로그인/회원가입</option>
			<option value="1">전체</option>
			<option value="2">일상</option>
			<option value="3">약속/행사</option>
			<option value="4">일기</option>
			<option value="5">회원관리</option>
<!--  			<option value="6">마이페이지</option> -->
		</select>
		<input type="submit" value="이동" onClick="return logChk()"/>
		</object>
	</nav>
	<div id="user">
		${user}님
		<input type="text" name="name" style="display:none" value="${user }"/>
	</div>
</form>
</header>
<body>
</body>
</html>