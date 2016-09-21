<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String root = request.getContextPath();
	String id = (String)session.getAttribute("id");
%>

<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row_content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row_content {
		height: auto;
	}
}
</style>
<!-- 검색기능 -->
<script type="text/javascript" src="<%=root%>/ajax/httpRequest.js"></script>
<script type="text/javascript">
    var checkFirst = false;
    var lastKeyword = '';
    var loopSendKeyword= false;
    function startSuggest(){
if(checkFirst == false){
//0.5초 후에 sendKeyword() 함수를 실행
setTimeout("sendKeyword();",500);
loopSendKeyword = true;
}
checkFirst = true;
    }
    //요청 전송
    function sendKeyword() {
        // log("키가 눌렸습니다.");
        if(loopSendKeyword == false) return;
        var keyword = $("#keyword").val();
        if (keyword == '') {
            lastKeyword = '';
            $("#suggest").hide();
        } else if (keyword != lastKeyword) { // 새로운 키워드 입력 여부 검사
            lastKeyword = keyword; // 새로운 키를 전역변수로 저장
            // 한글이나 특수문자를 UTF-8문자셋으로 변경
            var params = "keyword="+encodeURIComponent(keyword);
            // 요청 전송, 서블릿 주소 지정
            $.post(
            	"<%=root%>/suggest",
            	params,
            	function(data) {
    	response(data);
            	}
            );
        }
        setTimeout("sendKeyword();",500);
    }
 
    // 결과 출력
    function response(res) {
              
        var resultText = $.trim(res);        
        var result = resultText.split('|');
     
        var count = parseInt(result[0]);     
        var keywordList = null;
                
        if (count > 0) {
            keywordList = result[1].split(',');             
            var html = '';
            html += "등록된 쿼리 목록(선택하세요.)<br>";
            for (var i = 0 ; i < keywordList.length ; i++) {                 
               html += "<a href=\"javascript:select('"+keywordList[i]+"')\">"+keywordList[i]+"</a><br>";
            }
            $("#suggestList").html(html);
            $("#suggest").show();     
            
          } else {
               	$("#suggest").hide();
          }
       }
    
    //검색된 항목을 클릭하면 검색어를 keyword 태그에 출력하고
    //검색 목록은 숨겨 버립니다.
    function select(selectedKeyword) {
        $("#keyword").val(selectedKeyword);
        
        loopSendKeyword = false;
        checkFirst=false;
        
        $("#suggest").hide();
    }
 
    function frmSend(f){
        f.submit();
    }        
</script>
</head>
<body>
	<!-- 상단 메뉴 -->
	<div class="container-fluid">
		<div class="row_content">
			<div class="col-sm-2 sidenav" style="height: 100%">
				<h4>My Home</h4>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="<%=root %>/index.jsp">Home</a></li>
					<li><a href="<%=root %>/bbs/list.jsp">목록</a></li>
					<li><a href="<%=root %>/member/list.jsp">회원목록</a></li>
					<li><a href="<%=root %>/memo/list.jsp">글목록</a></li>
				</ul>
				<br>
				<div align="center">
					<form name='search' action="<%=root%>/bbs/list.jsp">
						<input type="hidden" name="col" value="title"> <input
							type='text' id='keyword' name="word" onkeydown="startSuggest()">
						<input type="submit" value="검색"
							onclick="javascript:frmSend(this.form);">
						<div id="suggest"
							style="display: none; postion: absolute; left: 0px; top: 30px; color: #000000; background: #EAEAEA; width: 500px">
							<div id="suggestList"></div>
						</div>
					</form>
				</div>
			</div>
			<div class="col-sm-9">
				<!-- 상단 메뉴 끝 -->



				<!-- 내용 시작 -->
				<div style="width: 100%; padding-top: 10px;">