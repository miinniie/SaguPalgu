<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#outside{
	background-color: #f2ede7;
	padding-top: 30px;
	padding-bottom: 61px;
}

#frm{
	width: 1100px;
	height: 600px;
	margin: 0px auto;
	padding: 60px 80px 60px 80px;
	box-shadow: 0px 6px 18px 0 rgba(0, 0, 0, 0.13);
	border: solid 0 #000;
	background-color: #fff;
	font-weight: 500;
}

#frm ul{
	overflow:auto;
}

#frm li{
	float:left;
	height:50px; 
	line-height:40px;
	margin-bottom: 10px;
	/*border-bottom:1px solid gray*/;
}

#frm li input{
    padding: 10px 20px 10px 20px;
    border-radius: 35px;
    font-size: 17px;
    border: solid 2px #cfc0b8;
}

#frm li select{
    padding: 10px 20px 10px 20px;
    border-radius: 35px;
    font-size: 17px;
    border: solid 2px #cfc0b8;
}


#first li:nth-child(6n+1){width:8%;}
#first li:nth-child(6n+2){width:42%;}
#first li:nth-child(6n+3){width:5%;margin-top:10px}
#first li:nth-child(6n+4){width:20%;margin-top:10px}
#first li:nth-child(6n+5){width:8%;margin-top:10px}
#first li:nth-child(6n){width:17%;margin-top:10px}

#second li:nth-child(4n+1){width:8%;}
#second li:nth-child(4n+2){width:42%;}
#second li:nth-child(4n+3){width:8%;}
#second li:nth-child(4n){width:42%;}

#third li:nth-child(2n+1){width:8%;}
#third li:nth-child(2n){width:92%;height: 310px;margin-top:5px}

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
		CKEDITOR.replace('content',{
			filebrowserUploadUrl:'/myapp/board/imageUpload'
		});
		
        $('#btn_publish').click(function () {
            alert(CKEDITOR.instances.editor.getData());
        });
        $('#btn_clear').click(function () {
            CKEDITOR.instances.editor.setData('');
        });
        
		$("#boardBtn").click(function(){
			//제목여부
			if($("#title").val()==""){
				alert("제목을 입력하세요.");
				return;
			}
			
			if($("#size").val()==null){
				alert("물품과 사이즈를 선택하세요.");
				return false;
			}
			
			if($("#location").val()==""){
				alert("위치를 입력하세요.");
				return;
			}
			
			if($("#price").val()==""){
				alert("가격을 입력하세요.");
				return;
			}
			
			var price = $("#price").val();
			var reg = /^[0-9]*$/;
			//가격은 숫자만
			if(!reg.test(price)){ //true:조건에 맞을때, false:조건이 맞지 않을때
				alert("가격은 숫자로 입력하세요.");
				return false;
			}
			
			//글내용여부
			//if($("#content").val()==""){
			if(CKEDITOR.instances.content.getData()==""){	
				alert("글내용을 입력하세요.");
				return;
			}
			//submit 발생시키기
			$("#frm").submit();
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
			
	if(val=='size1'){ //outer
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
	
	else if(val=='size4'){ //top
		addOption('85', targetSelect);
        addOption('90', targetSelect);
        addOption('95', targetSelect);
        addOption('100', targetSelect);
        addOption('105', targetSelect);
        addOption('110', targetSelect);
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
}
</script>

<div id="container">
	<div id="outside">
		<form method="post" id="frm" action="/myapp/board/boardFormOk">
			<h1 style="margin-bottom:30px">글쓰기폼</h1>
			
			<ul id="first" style="height: 90px">
				<li>물품</li>
				<li>
					<label for="icon1"><img onclick="changeSelect(this, 'size')" id="size1" value="size1" src="/myapp/resources/button1.png" style="width:50px; height: 50px; border-radius: 100px; border: solid 2px #cfc0b8; padding: 5px"></label>
					<label for="icon2"><img onclick="changeSelect(this, 'size')" id="size2" value="size2" src="/myapp/resources/button2.png"  style="width:50px; height: 50px; border-radius: 100px; border: solid 2px #cfc0b8; padding: 5px; margin-left: 10px"></label>
					<label for="icon3"><img onclick="changeSelect(this, 'size')" id="size4" value="size3" src="/myapp/resources/button3.png"  style="width:50px; height: 50px; border-radius: 100px; border: solid 2px #cfc0b8; padding: 5px; margin-left: 10px"></label>
					<label for="icon4"><img onclick="changeSelect(this, 'size')" id="size5" value="size4" src="/myapp/resources/button4.png"  style="width:50px; height: 50px; border-radius: 100px; border: solid 2px #cfc0b8; padding: 5px; margin-left: 10px"></label>
					<label for="icon5"><img onclick="changeSelect(this, 'size')" id="size3" value="size5" src="/myapp/resources/button5.png"  style="width:50px; height: 50px; border-radius: 100px; border: solid 2px #cfc0b8; padding: 5px; margin-left: 10px"></label>
					<input type="radio" name="type" value="1" id="icon1"/>
					<input type="radio" name="type" value="2" id="icon2"/>
					<input type="radio" name="type" value="3" id="icon3"/>
					<input type="radio" name="type" value="4" id="icon4"/>
					<input type="radio" name="type" value="5" id="icon5"/>
				</li>
				<li>가격</li>
				<li><input type="text" name="price" id="price" size="80" placeholder="가격" style="width:140px;"/></li>
				<li>거래위치</li>
				<li><input type="text" name="location" id="location" size="80" placeholder="거래 위치" style="width:140px;"/></li>
			</ul>
			
			<ul id="second">
				<li>제목</li>
				<li><input type="text" name="title" id="title" size="80" maxlength="19" placeholder="제목" style="width:380px;"/></li>
				<li>사이즈</li>
				<li>
					<!-- targetSelect -->
					<select id="size" name="typesize" style="width: 460px">
						<option value="defaults" disabled selected>사이즈</option>
					</select>
				</li>
			</ul>
			
			<ul id="third">
				<li>내용</li>
				<li><textarea name="content" id="content"></textarea></li>
			</ul>
			<ul id="last" style="margin-top: 25px; margin-left: 410px">
				<li>
					<input type="button" id="boardBtn" value="등록하기" style="background-color:#cfc0b8; color: white; width: 130px ; cursor:pointer"/>
					<input type="reset" value="다시쓰기" style="background-color: white; color: #cfc0b8; width: 130px ; cursor:pointer"/>	
				</li>
			</ul>
		</form>
	</div>
</div>