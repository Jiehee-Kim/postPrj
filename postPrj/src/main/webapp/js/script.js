function goRegist(){
	location.href = "regist.jsp";
}

function goWrite(){
	location.href = "write.jsp";
}

function logChk(){
	if(document.hFrm.a.value == "0"){
		if(document.hFrm.name.value.length!=0){
			alert("로그인 되었습니다.");
			
			return false;
		}
	}else if(document.hFrm.a.value == "5"){
		if(document.hFrm.name.value != "admin"){
			alert("관리자 전용 페이지 입니다.");
			
			return false;
		}else{
			
			return true;
		}
	}else if(document.hFrm.a.value == "6"){
		if(document.hFrm.name.value.length == 0){
			alert("로그인이 필요한 페이지 입니다.");
			
			return false;
		}
	}else{
		return true;
	}
	
}

function userChk(){
	if(document.frm.userId.value == document.hFrm.name.value){
		
		return true;
	}else{
		alert("권한이 없습니다.");
		
		return false;
	}
}
function delChk(){
	if(document.hFrm.name.value == document.frm.userId.value || document.hFrm.name.value == "admin"){
		if(confirm("삭제 후에는 복구할 수 없습니다. 정말 삭제하시겠습니까?")){
			document.frm.setAttribute("action", "delete");
			alert("삭제되었습니다.");
			
			return true;
		}else{
			return false;
		}
	}else{
		alert("권한이 없습니다.");
		
		return false;
	}
}

function cDel(){
	if(document.hFrm.name.value == document.frm.cUserId.value || document.hFrm.name.value == "admin"){
		if(confirm("삭제 후에는 복구할 수 없습니다. 정말 삭제하시겠습니까?")){
			document.frm.setAttribute("action", "cDelete");
			alert("삭제되었습니다.");
			
			return true;
		}else{
			return false;
		}
	}else{
		alert("권한이 없습니다.");
		
		return false;
	}
}

function cModiChk(){
	if(document.hFrm.name.value == document.frm.cUserId.value){
		if(document.frm.comments.value.length < 4){
			alert("내용을 입력해 주세요.");
			
			return false;
		}else{
			alert("수정되었습니다.");
			
			return true;
		}
	}else{
		alert("권한이 없습니다.");
		
		return false;
	}
	
}
function commentsChk(){
	if(document.frm.comments.value.length < 4){
		alert("내용을 입력해 주세요.");
		
		return false;
	}else{
		document.frm.setAttribute("action", "cInsert");
		alert("등록되었습니다.");
		
		return true;
	}
}

function chk(){
	if(document.hFrm.name.value.length==0){
		alert("로그인이 필요한 서비스 입니다.");
		
		return false;
		
	}else{
		return true;
	}
}

function loginChk(){
	if(document.frm.userId.value.length==0){
		alert("아이디를 입력해주세요.");
		
		return false;
	}else if(document.frm.userPw.value.length==0){
		alert("비밀번호를 입력해주세요.");
		
		return false;
	}else{
		
		return true;
	}
}

function registChk(){
	if(document.frm.userId.value.length==0){
		alert("아이디를 입력해주세요.");
		
		return false;
	}else if(document.frm.userPw.value.length==0){
		alert("비밀번호를 입력해주세요.");
		
		return false;
	}else{
		alert("회원가입이 완료되었습니다.");
		
		return true;
	}
}

function idChk(){
	const xhttp = new XMLHttpRequest();
	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			document.getElementById("demo").innerHTML = this.responseText;
		}
	};
	xhttp.open("GET", "idChk?userId="+document.frm.userId.value);
	xhttp.send();
	
}

