<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); 
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
    
<title>Check your Email</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<!-- *********************************************** -->

<DIV class="title" align="center"><h3>Email Check</h3></DIV>
	<div class="content">
		<FORM name='frm' method='POST' action='./email_proc.jsp'>
		

  <TABLE style="margin: 0 auto;line-height: 3.3em;">
				<TR>
					<TH>Email:　</TH>
					<TD><input  type="text"   class="form-control" placeholder="Email"></TD>
				</TR>
			</TABLE>
			<br>
			

			<DIV class='bottom' align="center">
				<input type='submit' value='Double Check!' class="btn btn-success"> <input type='button'
					value='Cancel' onclick="window.close()"  class="btn btn-primary">
			</DIV>
		</FORM>
	</div>

	<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html>
