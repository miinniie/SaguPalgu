<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>


#outside{
	background-color: #f2ede7;
	/*padding-top: 20px;*/
	padding-top: 20px;
	padding-bottom: 30px;
}

#formSize{
	width: 1100px;
	height: 760px;
	margin: 0px auto;
	box-shadow: 0px 6px 18px 0 rgba(0, 0, 0, 0.13);
	border: solid 0 #000;
	background-color: #fff;
	display: flex;
}

#container div:nth-child(2n+1):{width: 50%;}
#container div:nth-child(2n):{width: 50%;}

#mainContent{
	width:400px;
	height: 455px;
	margin: 200px 30px 0px 70px;
	background-color:#fff;		
}

#daumFrm>li:first-of-type{ 
	text-align:left;
	margin-bottom: 50px;
}

#daumFrm li input{
    padding: 10px 20px 10px 20px;
    width: 350px;
    height: 30px;
    border-radius: 35px;
    font-size: 17px;
    margin-bottom: 10px;
    border: solid 2px #cfc0b8;
}

#ipon{float: right;}
#on{color:rgb(76,135,238); font-weight:bold;}

#daumFrm>li:nth-of-type(6){
	text-align:center;
	padding:50px 0;
}

</style>
<script>
	function logChk(){
		if(document.getElementById("userid").value==""){
			alert("아이디를 입력후 로그인 하세요.");
			return false;
		}
		if(document.getElementById("userpwd").value==""){
			alert("비밀번호를 입력후 로그인 하세요.")
			return false;
		}
		return true;
	}
</script>
<div id="container">
	<div id="outside">
		<div id="formSize">
			<div id="intro">
				<img src="/myapp/resources/login.png" style="width: 550px; height: 760px; background-color: #ede7e2">
			</div>
		
		
			<div id="mainContent"">
				<form method="post" action="/myapp/member/loginCheck" onsubmit="return logChk()">
					<ul id="daumFrm">
						<li><h1 style="color:#9e938d">4989에 환영합니다!</h1></li>
						<li><input type="text" name = "userid" id="userid" placeholder="아이디" maxlength="15"/></li>
						<li><input type="passWord" name = "userpwd" id="userpwd" placeholder="비밀번호" maxlength="15"/></li>
						<li><input type="submit" value="로그인" style="height:50px; width: 393px; background-color:#cfc0b8; color: white ; cursor:pointer"/></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	
</div>