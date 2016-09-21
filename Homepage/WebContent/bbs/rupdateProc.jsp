<%@ page contentType="text/html; charset=UTF-8" %> 
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="rdao" class="bbs.ReplyDAO"/>
<jsp:useBean id="rdto" class="bbs.ReplyDTO"/>
<jsp:setProperty name="rdto" property="*"/>
<%
	int bbsnum = Integer.parseInt(request.getParameter("bbsnum"));
	String col =  request.getParameter("col");
	String word = request.getParameter("word");
	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
	int nPage = Integer.parseInt(request.getParameter("nPage"));

	if(rdao.update(rdto)){
%>		
	<script>
		var url = "./read.jsp";
		url = url + "?bbsnum=<%=bbsnum%>";
		url = url + "&col=<%=col%>";
		url = url + "&word=<%=word%>";
		url = url + "&nowPage=<%=nowPage%>";
		url = url + "&nPage=<%=nPage%>";
		
		location.href = url;
	</script>
	<h3>
<%	
	}else{
		out.print("Reply update Fail!");//나중에 sendRedirect로 error페이지로 이동하게 만들기
	}
%>
</h3>