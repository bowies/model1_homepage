<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.*,image.*, utility.*" %>
<jsp:useBean id="dao" class = "image.ImgDAO"/>

<%
String col = Utility.nullCheck(request.getParameter("col"));
String word = Utility.nullCheck(request.getParameter("word"));

if(col.equals("total")) word = "";

int nowPage = 1;
int recordPerPage = 5;

if(request.getParameter("nowPage")!=null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

int sno = ((nowPage-1)*recordPerPage)+1 ;
int eno = nowPage * recordPerPage ;

Map map = new HashMap();
map.put("sno", sno);
map.put("eno", eno);
map.put("col", col);
map.put("word", word);

List<ImgDTO> list = dao.list(map);
int total = dao.total(col,word);

String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);
String root = request.getContextPath();
String id = (String) session.getAttribute("id");

%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Image List</title> 


<script type = "text/javascript">
function read(imagenum){
	var url = "./read.jsp";
	url = url+"?imagenum=" + imagenum;
	
	loction.href = url;
}
</script>

</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 	<% if (id==null){ %>
     <script>location.href ="<%=root%>/member/loginForm.jsp"; </script>
	<%} else{%>
	
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>	
<DIV class="title" align="center">
		<h1>Image List</h1>
	</DIV>
<br>
	<DIV class="content" align="center">
		<input type='button' value='Register'
			onclick="location.href='./createForm.jsp'" class="btn btn-primary">

		<br> <br>

	</DIV>
<div   style="margin-left: 33%"> 
<FORM method='POST' action='./list.jsp' >
	<select name="col"  class="form-control" style="width: 200px; float: left;"> 
		<option value = "membername"
		<% if(col.equals("membername")) out.print("selected='selected'");%>
		>Name</option>
		<option value = "title"
		<% if(col.equals("title")) out.print("selected='selected'");%>
		>Title</option>
		<option value = "content"
		<% if(col.equals("content")) out.print("selected='selected'");%>
		>Content</option>
		<option value = "total"
		<% if(col.equals("total")) out.print("selected='selected'");%>
		>Total</option>
	</select>&nbsp;&nbsp;<input type="text" name="word" value="<%=word%>"
				class="form-control" style="width: 200px; float: left;"/> 
	<input type = "submit" value = "Search"  class="btn btn-success" />
</form>
</div>
<br>

<%
for(int i=0; i<list.size(); i++){
	ImgDTO dto = list.get(i);
%>
	<h5>
<TABLE style="margin: 0 auto; line-height: 3.3em;">
   <TR>
   	<TD rowspan = '8' width="300px"  align="center">
   	<Img src = './storage/<%=dto.getFilename()%>'style="max-width: 200px; height: auto;"></TD>
   	<TH style="text-align: right;">Title:　</TH>
   	<TD width="200px">
            <%
                 for(int j=0; j<dto.getIndent(); j++){
                        out.println("&nbsp;&nbsp;");
                 }
            if (dto.getIndent() > 0)//답변이있는경우
			{%>
			<img src = "./storage/reply.gif">&nbsp;
			<%

			}
            %>
   	<a href='./read.jsp?imagenum=<%=dto.getImagenum()%>'><%=dto.getTitle() %></a></TD>
   </TR>
   <TR>
    <TH style="text-align: right;">Name:　</TH>
    <TD><%=dto.getMembername() %></TD>
   </TR>
   <TR>
    <TH style="text-align: right;">Content:　</TH>
    <TD><%=dto.getContent() %></TD>
   </TR>
   <TR>
    <TH style="text-align: right;">Image:　</TH>
    <TD><%=dto.getFilename() %></TD>
   </TR>
   <!-- 
   <TR>
    <TH>grpno</TH>
    <TD><%=dto.getGrpno() %></TD>
   </TR>
   <TR> 
    <TH>indent</TH>
    <TD><%=dto.getIndent() %></TD>
   </TR>
   <TR>
    <TH>ansnum</TH>
    <TD><%=dto.getAnsnum() %></TD>
   </TR> 
   <TR>
    <TH>imagenum</TH>
    <TD><%=dto.getImagenum() %></TD>
   </TR>
   -->
  
  </TABLE>
  </h5>
  <BR>
  <%
  }
 %>
  
  <DIV class='bottom'>
  	<%=paging%>
  	<br>
    <!-- <input type='button' value='Register' onclick = "location.href = './createForm.jsp'">
   -->
   </DIV>

 
<br>
<br>
<br>
<br>
 <%} %>
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 