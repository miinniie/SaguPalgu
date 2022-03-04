<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">


<!-- top region -->
<%@ include file = "../../../inc/top.jspf"%>

<style>
	
#top-background {
  width: 100%;
  height: 650px;
  margin: 0 0 130px;
  background-color: #f2ede7;
}

#clothes{
	width: 1351px;
	height: 356px;
	padding: 10px 0px 40px 0px;
}

#box {
	margin: 0px auto;
	width: 1500px;
	height: 366px;
	border-radius: 19px;
	box-shadow: 0px 6px 18px 0 rgba(0, 0, 0, 0.13);
	border: solid 0 #000;
	background-color: #fff;
}

/*메뉴*/
#menu{
	width:100%;
	height:160px;
}
#menu>li{
	float:left;
	width:20%;
	height:160px;
	text-align: center;
	line-height:50px;
	font-size: 15.5px;
	font-weight: bolder;
	border-bottom-style:solid; 
   	border-bottom-color: #f2ede7;
}
#menu div{
	height: 70px;
	text-align: center;
	margin: 30px 0 0 0;
}

#menu li:hover {
   	border-bottom-style:solid 3px; 
   	border-bottom-color: #cfc0b8;
}


#search{
	height: 200px;
}
#keyword{
	width: 799px;
	height: 70px;
	padding: 22px 31px 20px 40px;
	border-radius: 35px;
	border: solid 2px #cfc0b8;
	font-size: 17px;
	margin: 65px 5px 0px 70px;
}

#size1, #size2, #size3, #size4, #size5{
	width: 341px;
	height: 70px;
	padding: 23px 26px 23px 34px;
	border-radius: 35px;
	font-size: 17px;
	border: solid 2px #cfc0b8;
	margin: 65px 5px 0px 5px;
}

#search-button{
	width: 187px;
	height: 70px;
	border-radius: 35px;
	background-color: #cfc0b8;
	border-style: none;
	font-size: 18px;
	font-weight: bold;
	color: white;
	margin: 65px 0px 0px 5px;
	display: inline-block;
}

input::placeholder {
	font-size: 18px;
	color: #cfc0b8;
}

input::placeholder {
	font-size: 18px;
	color: #cfc0b8; 
}

input, option:focus {
	outline: none !important;
}

#content{
	display: flex;
	flex-flow: wrap;
 	justify-content: center;
}

#content_box {
	width: 418px;
	height: 546px;
	margin: 15px;
	border-radius: 19px;
	box-shadow: 0px 6px 18px 0 rgba(0, 0, 0, 0.13);
	border: solid 0 #000;
	background-color: #fff;
}

</style>
    
<script>
	$('.container').on('click',function(){
		 alert( "확ㅇ니확인" );
	});
</script>


<div class=container>
	<div id="top-background" >
		<div><img id="clothes" src="resources/clothes.png" style="display: block; margin: 0px auto;"/></div>
		<div id="box">
			<ul id="menu">
				<li>
					<div><img id="menu-clothes" src="resources/menu-outer.png" style="width: 55px; height: 59px;"/></div>
					<font>OUTER</font>
				</li>
				<li>
					<div><img id="menu-clothes" src="resources/menu-dress.png" style="width: 39px; height: 68px;"/></div>
					<font>DRESS</font>
				</li>
				<li>
					<div><img id="menu-clothes" src="resources/menu-pants.png" style="width: 31px; height: 67px;"/></div>
					<font>PANTS</font>
				</li>
				<li>
					<div><img id="menu-clothes" src="resources/menu-top.png" style="width: 55px; height: 59px; margin: 5px"/></div>
					<font>TOP</font>
				</li>
				<li>
					<div><img id="menu-clothes" src="resources/menu-shoes.png" style="width: 56px; height: 20px; margin: 30px;"/></div>
					<font>SHOES</font>
				</li>
			</ul>
			
			<div id="search">
				<form action="#">
					<input type="text" name="keyword" id="keyword" placeholder="키워드" maxlength="15"/>
					<select id="size1" name="size">
						<option value="90" >90</option>
						<option value="95" selected>95</option>
						<option value="100">100</option>
						<option value="105">105</option>
					</select>
					<!-- 
					<select id="size2" name="size">
						<option value="90" >50</option>
						<option value="95" selected>95</option>
						<option value="100">100</option>
						<option value="105">105</option>
					</select>
					<select id="size3" name="size">
						<option value="90" >40</option>
						<option value="95" selected>95</option>
						<option value="100">100</option>
						<option value="105">105</option>
					</select>
					<select id="size4" name="size">
						<option value="90" >30</option>
						<option value="95" selected>95</option>
						<option value="100">100</option>
						<option value="105">105</option>
					</select>
					<select id="size5" name="size">
						<option value="90" >20</option>
						<option value="95" selected>95</option>
						<option value="100">100</option>
						<option value="105">105</option>
					</select>
					-->
					<input type="submit" name ="search-button" id="search-button" value="검색"/>
				</form>
			</div>
		</div>
	</div>
	
	<div id="content">
		<div id="content_box">
			<img src="upload/ex1.png" style="width: 418px; height: 409px; ">
			<div style="font-size: 25.5px; font-weight: 600; margin-left: 20px; margin-top: 22px">세컨즈 코트</div>
			<div>
				<img src="resources/button-outer.png" style="width: 50px; margin-left:20px; float:left; margin-top: 10px"/>
				<font style="font-size: 22px; font-weight:400; float:left; margin-left:5px; margin-top: 25px">95</font>
				<font style="font-size: 31px; font-weight:600; float:right;  margin-top: 20px; margin-right: 25px">10000원</font>
			</div>
		</div>
		<div id="content_box"></div>
		<div id="content_box"></div>
		<div id="content_box"></div>
		<div id="content_box"></div>
		<div id="content_box"></div>
		<div id="content_box"></div>
		<div id="content_box"></div>
		<div id="content_box"></div>
		<div id="content_box"></div>
	</div>
</div>


<!-- top region -->
<%@ include file = "../../../inc/bottom.jspf"%>