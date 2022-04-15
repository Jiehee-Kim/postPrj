<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*	function loadDoc() {
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
			document.getElementById("demo").innerHTML = this.responseText;
		}
		xhttp.open("GET", "ajax_info.txt", true);
		xhttp.send();
	}
*/

	function loadDoc() {
		const xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				document.getElementById("demo").innerHTML = this.responseText;
			}
		};
		xhttp.open("GET", "ajax_info.txt");
		xhttp.send();
	}
</script>
</head>
<body>
	<div id="demo">
		<h2>변경 전 텍스트</h2>
		<button type="button" onclick="loadDoc()">텍스트 변경</button>
	</div>
</body>
</html>