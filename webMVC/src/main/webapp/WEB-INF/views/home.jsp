<!-- 지시부(@ 있는곳) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src= "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="js_css/script.js"></script>
<link rel="stylesheet" href="js_css/style.css" type="text/css"/>

<style>
	
#top-background {
  width: 100%;
  height: 485px;
  margin: 0 0 120px;
  background-color: #f2ede7;
}

#clothes{
	width: 1100px;
	height: 100%;
	padding: 5px 0px 40px 0px;
}

#box {
	margin: 0px auto;
	width: 1150px;
	height: 260px;
	/*border-radius: 19px;*/
	box-shadow: 0px 4px 14px 0 rgba(0, 0, 0, 0.13);
	border: solid 0 #000;
	background-color: #fff;
}

/*메뉴*/
#menu{
	width:100%;
	height:120px;
}
#menu li{
	float:left;
	width:20%;
	height:120px;
	text-align: center;
	line-height:30px;
	font-size: 14.5px;
	font-weight: bolder;
	border-bottom: 2px solid #E6E0DA;
}

#menu div{
	height: 55px;
	text-align: center;
	margin: 23px 0 0 0;
}

#search{
	height: 100px;
}

#searchword{
	width: 500px;
	height: 8px;
	padding: 22px 31px 20px 30px;
	border-radius: 35px;
	border: solid 2px #cfc0b8;
	font-size: 17px;
	margin: 0px 5px 0px 65px;
}

#searchKey{
	width: 300px;
	height: 55px;
	padding: 10px 26px 10px 30px;
	border-radius: 35px;
	font-size: 17px;
	border: solid 2px #cfc0b8;
	margin: 40px 5px 0px 5px;
}


#search-button{
	width: 130px;
	height: 55px;
	border-radius: 35px;
	background-color: #cfc0b8;
	border-style: none;
	font-size: 17px;
	font-weight: 600;
	color: white;
	margin: 40px 0px 0px 5px;
	display: inline-block;
}

/*
input::placeholder {
	font-size: 18px;
	color: #cfc0b8;
}
*/

input, option:focus {
	outline: none !important;
}

#content{
	width: 1240px;
	height: 1380px;
 	margin: 0px auto;
}

#content_box {
	float: left;	
	width: 300px;
	height: 450px;
	margin: 5px;
	/*border-radius: 19px;*/
	box-shadow: 0px 4px 14px 0 rgba(0, 0, 0, 0.13);
	border: solid 0 #000;
	background-color: #fff;
}

select:focus {
  box-shadow: none;
  outline: none;
}

#paging{
	padding:20px 0px;
	display: flex;
  	justify-content: center;
}

#paging a{
	color:black;
	font-size: 15px;
	font-weight: 400;
}

#paging li{
	float:left;
	width:40px;
	text-align:center;
}

#top-background input[type=radio]{display:none;}

</style>

<script>
	/*
	$(function(){
		$("img:first").click(function(){
			show();
		})
	});

	*/
	
	$(function(){
		$('#menu li').hover(function () {
		    $(this)
		    .css('background-color','#E6E0DA');
		}, function () {
		    $(this).css('background-color', 'white');
		});

		//click
		$('#menu li').on('click', function (e) {

		    $('#menu li').each(function () {
		        $(this).css('background-color', 'white');
		        $('#menu li').hover(function () {
		            $(this).css('background-color','#E6E0DA')
		        }, function () {
		            $(this).css('background-color', 'white');
		        });
		    });
		    $(this).unbind('mouseenter mouseleave');
		    $(this).css('background-color','#E6E0DA');
		});
		
		
		$("#top-background input[type=radio]").change(function(){
			var idx = $("#top-background input[type=radio]").index(this);
			
			 $("#menu>label").eq(idx).children("li")
			 .css('background-color','#E6E0DA');
		});
		
		
		//이벤트발생
		if('${logStatus}'=='Y'){  // '스웨터'			
			$("#top-background input[type=radio]").eq(${pickSize.icon-1}).trigger('change');
			$("#menu>label").eq(${pickSize.icon-1}).children("li").trigger('click');
			
		}
		$("#searchKey").val(${vo.typesize});
		
		if('${pVo.searchWord}' != ''){  // '스웨터'			
			$("#top-background input[type=radio]").eq(${pickSize.icon-1}).trigger('change');
			$("#menu>label").eq(${pickSize.icon-1}).children("li").trigger('click');
			$("#searchword").val('${pVo.searchWord}');
			$("#searchKey").val('${pVo.searchKey}');
		}
		
		//changeSelect($("#first>li>label").eq(${vo.type-1}).children("img"), 'size'); //changeSelect(this, 'size')
		
		
		$("#search-button").click(function(){
			//제목여부
			if($("#searchword").val()==""){
				alert("검색할 키워드를 입력하세요.");
				return false;
			}
			
			if($("#searchKey").val()==null){
				alert("검색할 물품과 사이즈를 선택하세요");
				return false;
			}
			return true;
			//$("#searchForm").submit();
		});
	});
	
</script>

<script type="text/javascript">
//검색어 체크
function searchWordCheck(){
	if(document.getElementById("searchWord").value==""){
		alert("검색어를 입력후 검색하세요.");
		return false;
	}
	return true;
}

function changeSelect(element, targetId){
	
	var val = document.getElementById(element.id).getAttribute('value');
	var targetSelect = document.getElementById(targetId);
	
	removeAll(targetSelect);
			
	if(val=='size1' || val=="size4"){ //outer, top
		addOption('85', targetSelect);
        addOption('90', targetSelect);
        addOption('95', targetSelect);
        addOption('100', targetSelect);
        addOption('105', targetSelect);
        addOption('110', targetSelect);
	}
	
	else if(val=='size2'){ //dress
		addOption('44', targetSelect);
        addOption('55', targetSelect);
        addOption('66', targetSelect);
        addOption('77', targetSelect);
	}
	
	else if(val=='size3'){ //pants 
		addOption('23', targetSelect);
        addOption('24', targetSelect);
        addOption('25', targetSelect);
        addOption('26', targetSelect);
        addOption('27', targetSelect);
        addOption('28', targetSelect);
        addOption('29', targetSelect);
        addOption('30', targetSelect);
        addOption('31', targetSelect);
        addOption('32', targetSelect);
	}

	else if(val=='size5'){ //shoes
        addOption('220', targetSelect);
        addOption('230', targetSelect);
        addOption('240', targetSelect);
        addOption('250', targetSelect);
        addOption('260', targetSelect);
        addOption('270', targetSelect);
        addOption('280', targetSelect);
	}
	
	function addOption(value, e){
	    var o = new Option(value);
	    o.value = value;
	    try{
	        e.add(o);
	    }catch(ee){
	        e.add(o, null);
	    }
	}

	function removeAll(e){
	    for(var i = 0, limit = e.options.length; i < limit - 1; ++i){
	        e.remove(1);
	    }
	}
	
	//기존 선택한 사이즈가 있으면 셋팅
	mySizeSet(val)
}

var myIcon = '${pickSize.icon}';
var s1 = '${pickSize.size1}';
var s2 = '${pickSize.size2}';
var s3 = '${pickSize.size3}';
var s4 = '${pickSize.size4}';
var s5 = '${pickSize.size5}';
function mySizeSet(val){
	//console.log(val, myIcon)
	if(val =='size1' && myIcon=='1' ){
		$("#searchKey").val(s1);
	}
	if(val =='size2' && myIcon=='2'){
		$("#searchKey").val(s2);
	}
	if(val =='size3' && myIcon=='3'){
		$("#searchKey").val(s3);
	}
	if(val =='size4' || myIcon=='4'){
		$("#searchKey").val(s4);
	}
	if(val =='size5' || myIcon=='5'){
		$("#searchKey").val(s5);
	}
}
</script>


<div id="container">
	<div class=container>
	<div id="top-background" >
	<!-- 
	<h5 style="text-align:center ; margin-bottom: 10px">이 세상의 모든 옷을!</h5>
	<h1 style="text-align:center ; margin-bottom: 10px">FIND YOUR CLOTHES</h1>
	 -->
		<div><img id="clothes" src="/myapp/resources/clothes.png" style="display: block; margin: 0px auto;"/></div>
		<form action="/myapp/" id="searchForm" onsubmit="return searchWordCheck()">
			<div id="box">
				<ul id="menu">
					<label for="icon1">
						<li for="icon1" onclick="changeSelect(this, 'searchKey')" id="size1" value="size1">
							<div><img id="menu-clothes" src="/myapp/resources/menu-outer.png" style="width: 40px; height: 45px;"/></div>
							<font>OUTER</font>
						</li>
					</label>
					<label for="icon2">
						<li onclick="changeSelect(this, 'searchKey')" id="size2" value="size2">
							<div><img id="menu-clothes" src="/myapp/resources/menu-dress.png" style="width: 25px; height: 50px;"/></div>
							<font>DRESS</font>
						</li>
					</label>
					<label for="icon3">
						<li onclick="changeSelect(this, 'searchKey')" id="size3" value="size3">
							<div><img id="menu-clothes" src="/myapp/resources/menu-pants.png" style="width: 17px; height: 52px;"/></div>
							<font>PANTS</font>
						</li>
					</label>
					<label for="icon4">	
						<li onclick="changeSelect(this, 'searchKey')" id="size4" value="size4">
							<div><img id="menu-clothes" src="/myapp/resources/menu-top.png" style="width: 37px; height: 42px; margin: 5px"/></div>
							<font>TOP</font>
						</li>
					</label>	
					<label for="icon5">	
						<li onclick="changeSelect(this, 'searchKey')" id="size5" value="size5">
							<div><img id="menu-clothes" src="/myapp/resources/menu-shoes.png" style="width: 40px; height: 10px; margin: 25px;"/></div>
							<font>SHOES</font>
						</li>
					</label>
				</ul>
				
				<input type="radio" name="type" value="1" id="icon1"/>
				<input type="radio" name="type" value="2" id="icon2"/>
				<input type="radio" name="type" value="3" id="icon3"/>
				<input type="radio" name="type" value="4" id="icon4"/>
				<input type="radio" name="type" value="5" id="icon5"/>
						
				<div id="search">
						<input type="text" name="searchWord" id="searchword" placeholder="키워드" maxlength="15"/>
						<!-- targetSelect -->
						<select id="searchKey" name="searchKey">
							<option value="" disabled selected>사이즈</option>
						</select>
						<input type="submit" name ="search-button" id="search-button" value="검색"/>
				</div>
			</div>
		</form>
	</div>
	
	<!-- 검색어 
	<div id= "search">
		<form action="/myapp/" id="searchForm" onsubmit="return searchWordCheck()">
			<select name="searchKey">
				<option value="title">제목</option>
				<option value="userid">작성자</option>
				<option value="content">글내용</option>
			</select>
			<input type="text" name="searchWord" id="searchWord"/>
			<input type="submit" value="Search"/>
		</form>
	</div>
	-->
		
	<!-- 박스 예시 -->
	<div id="content">
		<c:forEach var="vo" items="${lst}">
			<div id="content_box" OnClick="location.href ='/myapp/board/view?no=${vo.no}&pageNum=${pVo.pageNum}<c:if test='${pVo.searchWord!=null}'>&searchType=${pVo.type}&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>'" style="cursor:pointer;">
				<img src="${vo.pic}" <c:if test="${vo.pic==null}">src="/myapp/resources/boardImg/image_none.png"</c:if> style="width: 300px; height: 350px; /*border: 0.1px solid gray*/">
				<div style="font-size: 18px; font-weight: 800; margin-left: 20px; margin-top: 14px;">${vo.title}</div>
				<div>
					<img src="/myapp/resources/button${vo.type}.png" style="width: 40px; margin-left:12px; float:left; margin-top: 7px"/>
					<font style="font-size: 16px; font-weight:500; float:left; margin-left:3px; margin-top: 16px">${vo.typesize}</font>
					<font style="font-size: 18px; font-weight:700; float:right;  margin-top: 17px; margin-right: 18px">${vo.price}원</font>
				</div>
			</div>
		</c:forEach>
	</div>
	
	<!-- 페이징 -->
	<div id="paging">
		<ul>
			<!-- 이전 페이지 -->
			<c:if test="${pVo.pageNum==1}">
				<li><a href="#">◀</a></li>
			</c:if>
			<c:if test="${pVo.pageNum>1}">
				<li><a href="/myapp/?pageNum=${pVo.pageNum-1}<c:if test='${pVo.searchWord!=null}'>&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">◀</a></li>
			</c:if>
			<!-- 페이지번호 	1				1		5-->
			<!-- 			6				6		10  end는 작거나 같다라는 뜻을 가지고 있음 -->
			<c:forEach var="p" begin="${pVo.startPageNum}" end="${pVo.startPageNum + pVo.onePageCount-1}">
				<c:if test="${pVo.totalPage>=p}">
				<c:if test="${p==pVo.pageNum}">	
					<li style="background:#cfc0b8;color:white ;border-radius: 100px;"><a href="/myapp/?pageNum=${p}<c:if test='${pVo.searchWord!=null}'>&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">${p}</a></li>
				</c:if>
				<c:if test="${p!=pVo.pageNum}">
					<li><a href="/myapp/?pageNum=${p}<c:if test='${pVo.searchWord!=null}'>&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">${p}</a></li>
				</c:if>
				</c:if>
			</c:forEach>
			<!-- 다음 페이지 -->
			<c:if test="${pVo.pageNum<pVo.totalPage}">
				<li><a href="/myapp/?pageNum=${pVo.pageNum+1}<c:if test='${pVo.searchWord!=null}'>&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">▶</a></li>
			</c:if>
			<c:if test="${pVo.pageNum>=pVo.totalPage}">
				<li><a href="#">▶</a></li>
			</c:if>
		</ul>
	</div>
	
	<!-- 
	<div id="content">
		<div id="content_box">
			<img src="/myapp/upload/ex2.png" style="width: 300px; height: 350px; ">
			<div style="font-size: 18px; font-weight: 800; margin-left: 20px; margin-top: 14px">세컨즈 코트</div>
			<div>
				<img src="resources/button-outer.png" style="width: 40px; margin-left:12px; float:left; margin-top: 7px"/>
				<font style="font-size: 16px; font-weight:500; float:left; margin-left:3px; margin-top: 16px">95</font>
				<font style="font-size: 18px; font-weight:700; float:right;  margin-top: 17px; margin-right: 18px">10000원</font>
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
	-->
</div>
</div>

