<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
#coment{width:500px;height:100px;}
#replyList>ul>li{
	border-bottom:1px solid #ddd;
	padding:10px 0px;
	width: 100%;
}

#outside{
	background-color: #f2ede7;
	padding-top: 60px;
	padding-bottom: 111px;
}

#boardFrm{
	width: 1100px;
	margin: 0px auto;
	padding: 60px 80px 60px 80px;
	/*border-radius: 19px;*/
	box-shadow: 0px 6px 18px 0 rgba(0, 0, 0, 0.13);
	border: solid 0 #000;
	background-color: #fff;
	font-weight: 500;
}

#boardFrm ul{
	overflow:auto;
}
#boardFrm li{
	float:left;
	height:50px; 
	line-height:40px;
	margin-bottom: 10px;
	/*border-bottom:1px solid gray*/;
}

#boardFrm li select{
    padding: 10px 20px 10px 20px;
    border-radius: 35px;
    font-size: 17px;
    border: solid 2px #cfc0b8;
}

#first h1, h2 {height:50px; float: left}
#first li {
	height: 60px;
}
#first li:nth-child(2n+1){width:9%}
#first li:nth-child(2n){width:91%; margin-top: 20px}

#second{margin-left: 100px; height: 300x}
#second li{height: 300x; font-size: 19px; font-weight: 700; width: 25%;}
#second h4{
	display: inline-block;
	font-size: 19px;
	font-weight: 350;
}

/*
#third{margin-left: 100px;}
#third li:nth-child(2n+1){width:50%; font-size: 21px; font-weight: 700;}
#third li:nth-child(2n){width:20%;}
*/

#forth{
	margin-left: 100px;
	height: 500px;
	margin-top: 10px;
}
#forth li:nth-child(2n+1){width:10%; font-size: 19px; font-weight: 700;}
#forth li:nth-child(2n){width:90%; font-size: 19px; font-weight: 400;}

#last li{
	text-align: center;
	margin-top: 30px;
	margin-bottom: 20px;
	color: white;
	font-size: 21px;
	font-weight: 600;
	padding: 4px 20px 20px 20px;
    border-radius: 35px;
    font-size: 17px;
    border: solid 2px #cfc0b8;
}
#imgcircle{
	width: 70px;
	height: 70px;
	border-radius: 500px;
	background-color: #f2ede7;
}

#sizecircle{
	width: 70px;
	height: 40px;
	object-fit: contain;
	border-radius: 34.9px;
	background-color: #cfc0b8;
	margin-left: 30px;
}

a:link, a:visited, a:hover{
	text-decoration:none;
}

#coment{
	width: 100%;
	height: 80px;
}

#replyFrm li:nth-child(3n+1){width:0%;}
#replyFrm li:nth-child(3n+2){width:85%;}
#replyFrm li:nth-child(3n){width:15%;}

#replyFrm ul{height:100px;}

#replyBtn{
	width: 155px;
	height: 86px;
	border-radius: 0px;
	border: 1px solid gray;
	background-color: #cfc0b8;
	color: white;
	font-weight: 300;
	font-size: 15px;
	cursor:pointer;
}

#boardFrm li input{
	margin-left: 8px;
    padding: 10px 20px 10px 20px;
    font-size: 17px;
    border: solid 1px gray;
}

#comentBtn{
	padding: 0px !important;
	width: 50px;
	height: 30px;
}

#comentLi{
	line-height: 0px !important;
}

</style>
<script>
	//삭제여부 확인한 후 페이지 이동
	function delCheck(){
		//alert() >알려주는거 등록했습니다. 삭제되었습니다. 이렇게 통보하는거
		//confirm() : yes/no를 선택할 수 있는 대화상자(true, false가 return됨)
		if(confirm("삭제하시겠습니까?")){
			//확인(yes) 버튼을 선택한 경우
			//자바스크립트에서 페이지 이동하기, get방식으로 간다!
			var link = "/myapp/board/boardDel?no=${vo.no}&pageNum=${pVo.pageNum}";
			
			// 검색어가 있을때 주소를 연결
			if('${pVo.searchWord}' != ''){
				link += "&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}";
			}
			console.log(link);
			location.href = link;
		}
	}
</script>
<script>
	$(function(){
		//해당 게시물의 모든 댓글 리스트를 선택하여 변경하는 함수
		function replyAllList(){
			//비동기식으로 서버에 접속하여 레코드선택(List)하여 view페이지의 목록을 변경하기
			var url = "/myapp/replyAllList";
			var params1 = "no=${vo.no}"// 원글 글번호
			
			$.ajax({
				type:'GET',
				url:url,
				data:params1,
				success:function(result){
					var $result = $(result);
					
					var tag="";
					$result.each(function(i, value){
						tag += "<li id='comentLi'><div>" +value.userid+" ("+value.writedate+") ";
						// 'dimpna96'	==	'dimpna96'		
						if(value.userid == '${logId}'){
							//수정, 삭제
							tag+= "<input type='button' value='Edit' id='comentBtn'/>";
							tag+= "<input type='button' value='Del' id='comentBtn' title='"+value.replyno+"'/>";
						}
						tag += "<br/ style='margin-bottom: 10px'>"+value.coment+"</div>";
						//본인이 쓴 댓글일 경우에만 수정폼을 생성하여 숨겨둔다.
						if(value.userid=='${logId}'){
							tag += "<div style='display:none'><form method='post'>";
							tag += "<input type='hidden' name='replyno' value='"+value.replyno+"'/>";
							tag += "<textarea name='coment' rows='4' cols='50'>"+value.coment+"</textarea>";
							tag += "<input type='submit' value='댓글수정하기'/>";
							tag += "</form></div>";
						}
						
						tag += "</li>";
					});
					console.log(tag);
					
					//view에 html추가
					$("#replyList>ul").html(tag);
					
				},error:function(e){
					console.log(e.responseText);
				}
			})
		}
		//댓글쓰기
		$("#replyBtn").click(function(){
			
			if($("#coment").val()==""){
				alert("댓글쓰신 후 등록하세요.");
				return false;
			}else{
				var data = $("#replyFrm").serialize();
				var url = "/myapp/replyWrite";
				
				$.ajax({
					type:'POST',
					url:url,
					data:data,
					success:function(result){
						console.log(result);
						$("#coment").val("");
						replyAllList();
					},error:function(e){
						console.log(e.responseText);
					}
				});
			}
		});
		//댓글 수정하기(폼 보여주기)
		$(document).on('click',"#replyList input[value=Edit]", function(){
			//이벤트가 발생한 input버튼의 부모 div는 숨기고
			$(this).parent().css("display","none");
			//부모 div 다음에 있는 div는 보여주기
			$(this).parent().next().css("display","block");
		
		});
		//	
		//댓글 수정하기(DB)
		$(document).on('submit','#replyList form',function(){
			//데이터
			var params2 = $(this).serialize();
			var url = "/myapp/replyEditOk";
			
			$.ajax({
				type:'POST',
				url:url,
				data:params2,
				success:function(result){
					replyAllList();
				},error:function(e){
					console.log(e.responseText);
				}
			});
			return false;
		});
		//댓글 삭제하기
		$(document).on('click','#replyList input[value=Del]',function(){
			if(confirm("댓글을 삭제하시겠습니까?")){
				//예 버튼을 선택했을때 삭제한다.
				var replyData = "replyno="+$(this).attr("title");
				var url = "/myapp/replyDelete";
				
				$.ajax({
					type:'GET',
					data:replyData,
					url:url,
					success:function(result){
						replyAllList();
					},error:function(e){
						console.log(e.responseText);
					}
				});
				
			}
		});
			
		//댓글 목록 호출
		replyAllList();
	});
	
	
</script>
<div id= "container">
	<div id="outside">
		<div id="boardFrm">
			<ul id="first">
				<li><div id="imgcircle"><img src="/myapp/resources/boardImg${vo.type}.png" style="width:70px; "></div></li>
				<li><h1 style="font-size: 22px; font-weight: 800; ">${vo.title} </h1>  <h2 style="font-size: 22px; font-weight: 500;">&nbsp;&nbsp;|&nbsp; ${vo.price}원</h2></li>
			</ul>
			<ul id="second">
				<li>사이즈:<div id="sizecircle" style="display:inline-block;"><h5 style="text-align: center; font-weight: 700; font-size: 19px; color: white; margin-top: 2px;" >${vo.typesize}</h5></div></li>
				<li>거래위치:&nbsp; <h4>${vo.location}</h4></li>
				<li>글쓴이:&nbsp;  <h4>${vo.userid}</h4></li>
				<li>조회수:&nbsp; <h4>${vo.hit}</h4></li>
			</ul>
			<ul id="forth">
				<!--
				<li>번호 : ${vo.no}</li>
				<li>글쓴이 : ${vo.userid}</li>
				<li>등록일 : ${vo.writedate}</li>
				<li>조회수 : ${vo.hit}</li>
				-->
				<li>글내용</li>
				<li>${vo.content}</li> 
			</ul>
			<ul id="last">
				<!-- 글쓴이만 수정, 삭제하도록 설정 -->
				<c:if test="${vo.userid==logId}">
					<li id="boardBtn" style="background-color:#cfc0b8; color: white; width: 70px ; height: 15px; cursor:pointer; margin-left: 430px"><a style="color: white; font-size: 18px;" href="/myapp/board/boardEdit?no=${vo.no}">수정</a></li>
					<li style="background-color: white; color: #cfc0b8; width: 70px ; height: 15px; cursor:pointer; margin-left: 10px"><a style="color: #cfc0b8; font-size: 18px;" href="javascript:delCheck()">삭제</a></li>
				</c:if>
			</ul>
			<!-- 댓글 -->
			<hr/>
			
			<div>
				<form method="post" id="replyFrm">
					<ul>
					<!-- 원글 글번호 -->
						<li><input type="hidden" name="no" value="${vo.no}"/></li>
						<li><textarea name="coment" id="coment"></textarea></li>
						<li><input type="button" id="replyBtn" value="댓글쓰기"/></li>
					</ul>
				</form>
			</div>

			<div id="replyList">
				<ul>
				</ul>
			</div>
		</div>
	</div>
</div>





