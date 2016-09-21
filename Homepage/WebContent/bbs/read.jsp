<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import = "bbs.*, utility.*, java.util.*" %>
<jsp:useBean id="dao" class="bbs.BbsDAO"></jsp:useBean>
<jsp:useBean id="rdao" class="bbs.ReplyDAO"/>
<% 
String id = Utility.nullCheck((String)session.getAttribute("id"));
	int bbsnum = Integer.parseInt(request.getParameter("bbsnum"));	
	dao.increaseviewcount(bbsnum);
	BbsDTO dto = dao.read(bbsnum);

	String col =  request.getParameter("col");
	String word = request.getParameter("word");
	//get방식인것...'ㅅ')...	
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>"); //라인스킵 처리해준다. \r\n = 엔터치면 생기는 코드값
		
			
	/* 댓글 관련  시작 */
	String url = "read.jsp";
	int nPage= 1; //시작 페이지 번호는 1부터 
	 
	if (request.getParameter("nPage") != null) { 
	nPage= Integer.parseInt(request.getParameter("nPage"));  
	}
	int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
	 
	int sno = ((nPage-1) * recordPerPage) + 1; // 
	int eno = nPage * recordPerPage;
	 
	
	Map map = new HashMap();
	map.put("sno", sno);
	map.put("eno", eno);
	map.put("bbsnum", bbsnum);
	 
	List<ReplyDTO> list = rdao.list(map);
	 
	int total = rdao.total(bbsnum);
	 
	String paging = Utility.paging(total, nPage, recordPerPage, url,bbsnum,nowPage, col,word);
	 
	 
	/* 댓글 관련 끝 */ 
%> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Read Page</title> 

<script type="text/javascript">
//댓글관련 함수 시작
function rcheck(tarea) {
	if ('<%=id%>' == "") {
		if (confirm("로그인후 댓글를 쓰세요")) {
			var url = "../member/loginForm.jsp";
			url = url + "?bbsnum=<%=bbsnum%>";
			url = url + "&nowPage=<%=nowPage%>";
			url = url + "&nPage=<%=nPage%>";
			url = url + "&col=<%=col%>";
			url = url + "&word=<%=word%>";
			url = url + "&flag=../bbs/read.jsp";
			location.href = url;
		} else {
			tarea.blur();
		}
	}
}

function input(f) {
	if ('<%=id%>' == "") {
		if (confirm("로그인후 댓글를 쓰세요")) {
			var url = "../member/loginForm.jsp";
			url = url + "?bbsnum=<%=bbsnum%>";
			url = url + "&nowPage=<%=nowPage%>";
			url = url + "&nPage=<%=nPage%>";
			url = url + "&col=<%=col%>";
			url = url + "&word=<%=word%>";
			url = url + "&flag=../bbs/read.jsp";
			location.href = url;
			return false;
		} else {

			return false;
		}
	} else if (f.content.value == "") {
		alert("댓글 내용을 입력하세요.");
		f.content.focus();
		return false;
	}
}
function rupdate(rnum, rcontent) {
	var f = document.rform;
	f.content.value = rcontent;
	f.rnum.value = rnum;
	f.rsubmit.value = "수정";
	f.action = "./rupdateProc.jsp"
}
function rdelete(rnum) {
	if (confirm("정말삭제 하겠습니까?")) {
		var url = "../bbs/rdeleteProc.jsp";
		url = url + "?rnum=" + rnum;
		url = url + "&bbsnum=<%=bbsnum%>";
		url = url + "&nowPage=<%=nowPage%>";
		url = url + "&nPage=<%=nPage%>";
		url = url + "&col=<%=col%>";
		url = url + "&word=<%=word%>";
		location.href = url;
	}
}
//댓글관련 함수 끝

function listB(){
		var url = "list.jsp";
		url += "?col=<%=col%>";
		url += "&word=<%=word%>";
		url += "&nowPage=<%=nowPage%>";
		
		location.href = url;
	}

function updateB(){
						
	var url = "updateForm.jsp";
	url += "?bbsnum=<%=bbsnum%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href = url;
}

function deleteB(){
	
	var url = "deleteForm.jsp";
	url += "?bbsnum=<%=bbsnum%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href = url;
	
}

function replyB(){
	
	var url = "replyForm.jsp";
	url += "?bbsnum=<%=bbsnum%>";
	url += "&col=<%=col%>";
	url += "&word=<%=word%>";
	url += "&nowPage=<%=nowPage%>";
	
	location.href = url;
	
	
}

</script>



</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 <br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<DIV class="title" align="center"><h1>Read</h1></DIV>
 
  <TABLE  style="margin: 0 auto;line-height: 3.3em;">
    <TR>
      <TH style="text-align: right;">Title:　</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    <TR>
      <TH style="text-align: right;">Content:　</TH>
      <TD><%=content %><!-- 미리 위에서 content에 받아놔서 --></TD>
    </TR>
    <TR>
      <TH style="text-align: right;">Name:　</TH>
      <TD><%=dto.getMembername() %></TD>
    </TR>
    <TR>
      <TH style="text-align: right;">View:　</TH>
      <TD><%=dto.getViewcount() %></TD>
    </TR>
    <TR>
      <TH style="text-align: right;">Date:　</TH>
      <TD><%=dto.getListdate() %></TD>
    </TR>
  </TABLE>
  <br>
  <br>
  
  
  
  
   <!-- 댓글관련 내용 -->

	<%for(int i=0; i<list.size() ; i++){
		ReplyDTO rdto = list.get(i);
	
	%>
		<div class="rlist" style="width:30%; margin: 20px auto;">
			<%=rdto.getId()%><br/>
			<p><%=rdto.getContent() %></p>
			<%=rdto.getRegdate()%>

			<%if(id.equals(rdto.getId())){ %>
			 <span style="float: right;"> 
				
				<a	href="javascript:rupdate('<%=rdto.getRnum() %>','<%=rdto.getContent() %>')" class="btn btn-success">
						Edit</a>
						
						<a href="javascript:rdelete('<%=rdto.getRnum() %>')" class="btn btn-primary">Delete</a>
				</span> 
			<%} %>
		</div>
		<%} %>

 <div style="width:10%; margin: 20px auto;">
 	<%=paging %>
 </div>
<br>
<br>

	<div class="rcreate" align="center">
		<form name="rform" action="./rcreateProc.jsp" method="post"
			onsubmit="return input(this)">
			<textarea name="content" onclick="rcheck(this)" class="form-control" style="width: 200px;" ></textarea>
			<br>
			<input type="submit" name="rsubmit" value="Reply" class="btn btn-primary"  >
				<input type="hidden" name="bbsnum" value="<%=bbsnum%>">
				<input type="hidden" name="id" value="<%=id%>">
				<input type="hidden" name="nowPage" value="<%=nowPage%>">
				<input type="hidden" name="nPage" value="<%=nPage%>">
				<input type="hidden" name="col" value="<%=col%>">
				<input type="hidden" name="word" value="<%=word%>"> 
				<input type="hidden" name="rnum" value="0"><!-- 수정처리를 위해 rnum 사용 -->


		</form>
	</div>    <br>
  
  <DIV class='bottom' align="center">
    <input type='button' value='Register' onclick="location.href='createForm.jsp'"  class="btn btn-success">
    <input type='button' value='List' onclick="listB()"  class="btn btn-primary">
    <br><br>
    <input type='button' value='Edit' onclick="updateB()"  class="btn btn-success">
    <input type='button' value='Reply' onclick="replyB()"  class="btn btn-success">
    <input type='button' value='Delete' onclick="deleteB()"  class="btn btn-primary">
  </DIV>
  
 
 
<br>
<br>
<br>
<br>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 