<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#outside{
	background-color: #f2ede7;
}

/*페이징*/
#paging{
	padding:20px 0px;
	display: flex;
  	justify-content: center;
}
#paging>ul, #boardList{
	overflow:auto;
}
#paging li{
	float:left;
	width:40px;
	text-align:center;
}
/*검색*/
#search{
	padding:20px 200px;
	text-align:center;
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


</style>
<script>
	//검색어 체크
	function searchWordCheck(){
		if(document.getElementById("searchWord").value==""){
			alert("검색어를 입력후 검색하세요.");
			return false;
		}
		return true;
	}
</script>

<div id="container">
	<div id="outside">
		
		<!-- <h1 style="text-align: center">게시판 목록</h1>  -->
		
		<!-- 
		<a href="/myapp/board/boardFrm">글쓰기</a>
		<ul id="boardList">
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>조회수</li>
			<li>등록일</li>
			
	jstl el 표현식 
	items : 컬렉션, 배열형변수를 표시하는 곳
	var : 변수선언
			
			
			<c:forEach var="vo" items="${lst}">
				<li>${vo.no}</li>
				<li><a href="/myapp/board/view?no=${vo.no}&pageNum=${pVo.pageNum}<c:if test='${pVo.searchWord!=null}'>&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">${vo.title}</a></li>
				<li>${vo.userid}</li>
				<li>${vo.hit}</li>
				<li>${vo.writedate}</li>
			</c:forEach>
		</ul>
		-->
		
		<!-- 검색어 -->
		<div id= "search">
			<form action="/myapp/board/list" id="searchForm" onsubmit="return searchWordCheck()">
				<input type="radio" name="searchKey" value="0" id="icon1" checked/>
				
				<input type="text" name="searchWord" id="searchWord"/>
				<input type="submit" value="Search"/>
			</form>
		</div>
		
		<!-- 박스 예시 -->
		<div id="content">
			<c:forEach var="vo" items="${lst}">
				<div id="content_box" OnClick="location.href ='/myapp/board/view?no=${vo.no}&pageNum=${pVo.pageNum}<c:if test='${pVo.searchWord!=null}'>&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>'" style="cursor:pointer;">
					<img src="${vo.pic}"<c:if test="${vo.pic==null}">src="/myapp/resources/boardImg/image_none.png"</c:if>  style="width: 300px; height: 350px; border: 2px solid gray">
					<div style="font-size: 18px; font-weight: 800; margin-left: 20px; margin-top: 14px">${vo.title}</div>
					<div>
						<img src="/myapp/resources/button-outer.png" style="width: 40px; margin-left:12px; float:left; margin-top: 7px"/>
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
					<li><a href="#">prev</a></li>
				</c:if>
				<c:if test="${pVo.pageNum>1}">
					<li><a href="/myapp/board/list?pageNum=${pVo.pageNum-1}<c:if test='${pVo.searchWord!=null}'>&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">prev</a></li>
				</c:if>
				<!-- 페이지번호 	1				1		5-->
				<!-- 			6				6		10  end는 작거나 같다라는 뜻을 가지고 있음 -->
				<c:forEach var="p" begin="${pVo.startPageNum}" end="${pVo.startPageNum + pVo.onePageCount-1}">
					<c:if test="${pVo.totalPage>=p}">
					<c:if test="${p==pVo.pageNum}">	
						<li style="background:red;color:#fff;"><a href="/myapp/board/list?pageNum=${p}<c:if test='${pVo.searchWord!=null}'>&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">${p}</a></li>
					</c:if>
					<c:if test="${p!=pVo.pageNum}">
						<li><a href="/myapp/board/list?pageNum=${p}<c:if test='${pVo.searchWord!=null}'>&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">${p}</a></li>
					</c:if>
					</c:if>
				</c:forEach>
				<!-- 다음 페이지 -->
				<c:if test="${pVo.pageNum<pVo.totalPage}">
					<li><a href="/myapp/board/list?pageNum=${pVo.pageNum+1}<c:if test='${pVo.searchWord!=null}'>&searchKey=${pVo.searchKey}&searchWord=${pVo.searchWord}</c:if>">next</a></li>
				</c:if>
				<c:if test="${pVo.pageNum>=pVo.totalPage}">
					<li><a href="#">next</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>