<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
	String id = (String) session.getAttribute("id");

	if(id==null){
		id = "Lucky";
	}
	
%>
<!--  
<div style="width: 100%; background-color: black; text-align: center; color: #31B0D5; position: fixed; bottom: 0px; ">
	Lucky Blue Smith
</div>
-->
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS - Uses Bootswatch Flatly Theme: http://bootswatch.com/flatly/ -->
<link href="<%=root%>/menu/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=root%>/menu/css/freelancer.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=root%>/menu/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top" class="index">
	<!-- Footer -->
	<footer class="text-center">
		<div class="footer-above">
			<div class="container">
				<div class="row">
					<div class="footer-col col-md-4">
						<h3>Lucky Blue Smith</h3>
						<p>
						                        
                            <a href="https://www.instagram.com/luckybsmith/?hl=ko"><i class="fa fa-instagram fa-fw fa-3x"></i></a>
                            <a href="https://twitter.com/luckybsmith"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                            <a href="https://ko-kr.facebook.com/luckyblue.smith/"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                        
						</p>
					</div>
					<div class="footer-col col-md-4">
						<h3>Social Service</h3>
						<ul class="list-inline">
							
						
						
							
								
							<li><a href="https://instagram.com/#" class="btn-social btn-outline"><i
								class="fa fa-fw fa-instagram"></i></a></li>
								
							<li><a href="https://github.com/#" class="btn-social btn-outline"><i
									class="fa fa-fw fa-github"></i></a></li>
									
							<li><a href="https://ko-kr.facebook.com/" class="btn-social btn-outline"><i
									class="fa fa-fw fa-facebook"></i></a></li>
									
<!-- 							<li><a href="#" class="btn-social btn-outline"><i -->
<!-- 									class="fa fa-fw fa-google-plus"></i></a></li> -->
									
							<li><a href="https://twitter.com/#" class="btn-social btn-outline"><i
									class="fa fa-fw fa-twitter"></i></a></li>
									
							<li><a href="https://ph.linkedin.com/hp" class="btn-social btn-outline"><i
									class="fa fa-fw fa-linkedin"></i></a></li>
									
<!-- 							<li><a href="#" class="btn-social btn-outline"><i -->
<!-- 									class="fa fa-fw fa-dribbble"></i></a></li> -->
						</ul>
					</div>
					<div class="footer-col col-md-4">
						<h3>About David</h3>
						<p>
							I'm Creative and Fun Developer! <br><a href="http://bubblecat.co.kr/">Enjoy My Blog!</a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<div class="footer-below">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">Property of David Kim</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- jQuery -->
	<script src="<%=root%>/menu/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=root%>/menu/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="<%=root%>/menu/js/classie.js"></script>
	<script src="<%=root%>/menu/js/cbpAnimatedHeader.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="<%=root%>/menu/js/jqBootstrapValidation.js"></script>
	<script src="<%=root%>/menu/js/contact_me.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=root%>/menu/js/freelancer.js"></script>

</body>

</html>
