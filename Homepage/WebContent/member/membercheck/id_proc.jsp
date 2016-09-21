<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>

<% request.setCharacterEncoding("utf-8"); 
	String id = request.getParameter("id");
	int cnt = dao.duplicateId(id);

	String root = request.getContextPath();
	
%>
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
    <link href="<%=root%>/menu/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=root%>/menu/css/freelancer.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=root%>/menu/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<title>Check your ID</title>
<script>
function use(){
	
	opener.frm.id.value = '<%=id%>';
	self.close();
}


</script>


<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<!-- *********************************************** -->
 
 
<DIV class="title" align="center"><h3>ID Double Check</h3></DIV>

<DIV class = 'content' align="center">
<h5>

<%=id%> 
<br>


<% 
	if(cnt==1){
		out.println("Please Insert another ID!"+"<br>");%>
		<br>
	<input type='button' value='Retry' onclick="location.href='id_form.jsp'"class="btn btn-success">
	<input type='button' value='Close' onclick="window.close()" class="btn btn-primary">
		<% 
		
	}else{
		out.println("I check Your ID!"+"<br>");%>
		<br>
		<input type='button' value ='Checked!' onclick='use()' class="btn btn-success">
		<input type='button' value='Close' onclick="window.close()" class="btn btn-primary">
		<%
	}
%>
</h5>
</DIV>
  
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 