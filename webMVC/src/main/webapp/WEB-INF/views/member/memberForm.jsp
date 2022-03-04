<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

#outside{
	background-color: #f2ede7;
	padding-top: 60px;
	padding-bottom: 111px;
}
#mFrm{
	width: 1100px;
	height: 520px;
	margin: 0px auto;
	padding: 60px 80px 60px 80px;
	/*border-radius: 19px;*/
	box-shadow: 0px 6px 18px 0 rgba(0, 0, 0, 0.13);
	border: solid 0 #000;
	background-color: #fff;
	font-weight: 500;
}

#mFrm ul{
	overflow:auto;
}
#mFrm li{
	float:left;
	height:50px; 
	line-height:40px;
	margin-bottom: 10px;
	/*border-bottom:1px solid gray*/;
}

#mFrm li input{
    padding: 10px 20px 10px 20px;
    border-radius: 35px;
    font-size: 17px;
    border: solid 2px #cfc0b8;
}

#mFrm li select{
    padding: 10px 20px 10px 20px;
    border-radius: 35px;
    font-size: 17px;
    border: solid 2px #cfc0b8;
}

#mFrm li> img{
	float: left;
}

#first li:nth-child(4n+1){width:8%;}
#first li:nth-child(4n+2){width:42%;}

#second li:nth-child(4n+1){width:8%;}
#second li:nth-child(4n+2){width:42%;}
#second li:nth-child(4n+3){width:8%;}
#second li:nth-child(4n){width:42%;}

#third li:nth-child(3n+1){width:8.5%;}
#third li:nth-child(3n+2){width:42%;}
#third li:nth-child(3n){width:49.5%;}

#forth li:nth-child(2n+1){width:46%;}
#forth li:nth-child(2n){width:54%;}

#third li select{
	margin-left: 25px;
	width: 340px;
}

#forth li select{
	margin-left: 25px;
	width: 340px;
}

#iconCircle{
  width: 50px;
  height: 50px;
  padding: 10px;
  object-fit: contain;
  border-radius: 100px;
  border: solid 2px #cfc0b8;
}

input, option:focus {
	outline: none !important;
}

select:focus {
  box-shadow: none;
  outline: none;
}

#first input[type=radio]{display:none;}

</style>
<script>
	$(function(){
		$("#mFrm").submit(function(){
			//아이디->문자, 숫자, 8~15글자까지
			var userid = $("#userid").val();
			//정규표현식 패턴
			// ^: 처음부터, $: 끝까지
			var reg = /^[a-zA-z]{1}[a-zA-z0-9_$]{7,14}$/;
			if(!reg.test(userid)){ //true:조건에 맞을때, false:조건이 맞지 않을때
				alert("아이디는 첫번째 문자, 영어대소문자, 숫자,_,$만 허용되며\n아이디의 길이는 8~15글자사이여야 합니다.");
				return false;
			}
			if(!reg.test($("#userpwd").val())){ //true:조건에 맞을때, false:조건이 맞지 않을때
				alert("비밀번호는 첫번째 문자, 영어대소문자, 숫자,_,$만 허용되며\n비밀번호의 길이는 8~15글자사이여야 합니다.");
				return false;
			}
			if($("#userpwd").val() != $("#userpwd2").val()){
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
			//이름 유효성검사
			reg = /^[가-힣]{2,7}$/;
			if(!reg.test($("#username").val())){
				alert("이름을 잘못입력하였습니다.");
				return false;
			}
			
			reg = /^[0-9]{3,4}$/;
			var reg1 = /^[0-9]{4}$/;
			if(!reg.test($("#tel2").val()) || !reg1.test($("#tel3").val())){
				alert("연락처를 잘못입력하였습니다.")
				return false;
			}
			
			if($("#size1").val()==null){
				alert("OUTER의 사이즈를 선택하세요.");
				return false;
			}
			
			if($("#size3").val()==null){
				alert("PANTS의 사이즈를 선택하세요.");
				return false;
			}
			
			if($("#size4").val()==null){
				alert("TOP의 사이즈를 선택하세요.");
				return false;
			}
			
			if($("#size5").val()==null){
				alert("SHOES의 사이즈를 선택하세요.");
				return false;
			}
		});
		
		//hover했을시 색변화 + 나머지는 다시 정상으로
		$('#first img').hover(function () {
		    $(this)
		    .css('border-color','#8A807B')
            .css('border-width','3px');
		}, function () {
		    $(this)
		    .css('border-color', '#cfc0b8')
	        .css('border-width','2px');
		});

		//click
		$('#first img').on('click', function (e) {

		    $('#first img').each(function () {
		        $(this)
		        .css('border-color', '#cfc0b8')
		        .css('border-width','2px');
		        $('#first img').hover(function () {
		            $(this)
		            .css('border-color','#8A807B')
		            .css('border-width','3px');
		        }, function () {
		            $(this)
		            .css('border-color', '#cfc0b8')
			        .css('border-width','2px');
		        });
		    });
		    $(this).unbind('mouseenter mouseleave');
		    $(this)
		    .css('border-color','#8A807B')
            .css('border-width','3px');
		});
	});
</script>

<div id="container">
	<div id="outside">
		<!-- 			 폼의 값을 서버로 가져가는 접속어 - controller- method -->
		<form method="post" action="<%=request.getContextPath()%>/member/memWrite" id="mFrm">
		<h1 style="margin-bottom:30px">회원가입</h1>
			
			<ul id="first" style="height: 90px">
				<li>아이콘</li>
				<li>
					<label for="icon1"><img src="/myapp/resources/button1.png" style="width:50px; height: 50px; border-radius: 100px; border: solid 2px #cfc0b8; padding: 5px"></label>
					<label for="icon2"><img src="/myapp/resources/button2.png"  style="width:50px; height: 50px; border-radius: 100px; border: solid 2px #cfc0b8; padding:5px; margin-left: 10px"></label>
					<label for="icon3"><img src="/myapp/resources/button3.png"  style="width:50px; height: 50px; border-radius: 100px; border: solid 2px #cfc0b8; padding: 5px; margin-left: 10px"></label>
					<label for="icon4"><img src="/myapp/resources/button4.png"  style="width:50px; height: 50px; border-radius: 100px; border: solid 2px #cfc0b8; padding: 5px; margin-left: 10px"></label>
					<label for="icon5"><img src="/myapp/resources/button5.png"  style="width:50px; height: 50px; border-radius: 100px; border: solid 2px #cfc0b8; padding: 5px; margin-left: 10px"></label>
					<input type="radio" name="icon" value="1" id="icon1" checked/>
					<input type="radio" name="icon" value="2" id="icon2"/>
					<input type="radio" name="icon" value="3" id="icon3"/>
					<input type="radio" name="icon" value="4" id="icon4"/>
					<input type="radio" name="icon" value="5" id="icon5"/>
				</li>
			</ul>
			
			<ul id="second">
				<li>이름</li>
				<li><input type="text" name="username" id="username" placeholder="이름" style="width: 380px"/></li><!-- value="김한화" -->
				
				<li>번호</li>
				<li>
					<select name="tel1" id="tel1" style="width: 133px">
						<!-- <option value="not">선택</option> -->
						<option value="010">010</option>
						<option value="02">02</option>
						<option value="031">031</option>
					</select> -
					<input type="text" name="tel2" id="tel2" style="width: 105px"/> -
					<input type="text" name="tel3" id="tel3" style="width: 105px"/>
				</li>
				
				<li>아이디</li>
				<li><input type="text" name="userid" id="userid" maxlength="15" placeholder="아이디" style="width: 380px"/></li><!-- value="hanwha" -->
				
				<li>비밀번호</li>
				<li>
					<input type="password" name="userpwd" id="userpwd" maxlength="15" placeholder="비밀번호" style="width: 185px"/><!-- value="12345678" -->
					<input type="password" name="userpwd2" id="userpwd2" maxlength="15" placeholder="비밀번호 확인" style="width: 185px"/>
				</li>
				
				<!--  
				<li>이메일</li>
				<li><input type="text" name="email" id="email" placeholder="이메일"/></li>
				 -->
				
			</ul>

			<ul id="third">
				<li>사이즈</li>
				<li>
					<img src="/myapp/resources/button1.png" style="width:50px; height: 50px;">
					<select name="size1" id="size1">
						<!-- <option value="not">선택</option> -->
						<option value="defaults" disabled selected value>사이즈</option>
						<option value="85">85</option>
						<option value="90">90</option>
						<option value="95">95</option>
						<option value="100">100</option>
						<option value="105">105</option>
						<option value="110">110</option>
					</select>
				</li>
				
				<li>
					<img src="/myapp/resources/button2.png"  style="width:50px; height: 50px;">
					<select name="size2" id="size2">
						<!-- <option value="not">선택</option> -->
						<option value="defaults" disabled selected value>사이즈</option>
						<option value="0">없음</option>
						<option value="44">44</option>
						<option value="55">55</option>
						<option value="66">66</option>
						<option value="77">77</option>
					</select>
				</li>
			</ul>
			
			<ul id="forth" style="margin-left: 93px">
				<li>			
					<img src="/myapp/resources/button3.png"  style="width:50px; height: 50px;">
					
					<select name="size3" id="size3">
						<!-- <option value="not">선택</option> -->
						<option value="defaults" disabled selected value>사이즈</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
						<option value="32">32</option>
					</select>
				</li>
					
				<li>			
					<img src="/myapp/resources/button4.png"  style="width:50px; height: 50px;">
					<select name="size4" id="size4">
						<!-- <option value="not">선택</option> -->
						<option value="defaults" disabled selected value>사이즈</option>
						<option value="85">85</option>
						<option value="90">90</option>
						<option value="95">95</option>
						<option value="100">100</option>
						<option value="105">105</option>
						<option value="110">110</option>
					</select>
				</li>
					
				<li>				
					<img src="/myapp/resources/button5.png"  style="width:50px; height: 50px;">
					<select name="size5" id="size5">
						<!-- <option value="not">선택</option> -->
						<option value="defaults" disabled selected value>사이즈</option>
						<option value="220">220</option>
						<option value="230">230</option>
						<option value="240">240</option>
						<option value="250">250</option>
						<option value="260">260</option>
						<option value="270">270</option>
						<option value="280">280</option>
					</select>
				</li>
			</ul>
			
			<ul id="last" style="margin-top: 25px; margin-left: 405px">
				<li>
					<input type="submit" value="확인" style="background-color:#cfc0b8; color: white; width: 130px ; cursor:pointer;"/>
					<input type="reset" value="취소" style="background-color: white; color: #cfc0b8; width: 130px ; cursor:pointer;"/><!-- value="다시쓰기" -->
				</li>
			</ul>
		</form>
	</div>
</div>