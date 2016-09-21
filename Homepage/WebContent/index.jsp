	<%@ page contentType="text/html; charset=UTF-8" %> 
	<%@ page import="java.text.*,java.util.*"%>
<% 
	request.setCharacterEncoding("utf-8"); 
	String root = request.getContextPath();
	String id = (String) session.getAttribute("id");


%> 
 
 <%
	int year;
	int month;
	Calendar today = Calendar.getInstance();
	Calendar cal = new GregorianCalendar();
	year = (request.getParameter("year") == null) ? today.get(Calendar.YEAR)
			: Integer.parseInt(request.getParameter("year").trim());
	month = (request.getParameter("month") == null) ? today.get(Calendar.MONTH) + 1
			: Integer.parseInt(request.getParameter("month").trim());
	
	if (month <= 0) {
		month = 12;
		year = year - 1;
	} else if (month >= 13) {
		month = 1;
		year = year + 1;
	}
	cal.set(Calendar.YEAR, year);
	cal.set(Calendar.MONTH, (month - 1));
	cal.set(Calendar.DATE, 1);
%>

<!DOCTYPE html> 
<html> 
<head> 


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<%if(id!=null){ %>
    <title>Welcome! <%=id%></title>
	<%} else{%>
	<title>Welcome Friend!</title>
	<%} %>

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


</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->

<br>
<br>
<br>
   <!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#page-top">Lucky Blue Smith</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#portfolio">Menu</a>
                    </li>
                    
                    <li class="page-scroll">
                        <a href="#about">About</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#contact">Calendar</a>
                    </li>
                    
                    <%if(id==null){ %>
                    <li class="page-scroll">
                        <a href="<%=root%>/member/loginForm.jsp">Login</a>
                    </li>
                    <%}else{%>
                    <li class="page-scroll">
                        <a href="<%=root%>/member/logout.jsp">Logout</a>
                    </li>
                    	
                    <%} %>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                       
                       
                 <%if(id!=null){ %>
                
                <a href="<%=root%>/member/read.jsp">
                    <img class="img-responsive" src="<%=root%>/menu/img/profile1.png" alt=""  onmouseover="this.src='<%=root%>/menu/img/profile2.png'" onmouseout="this.src='<%=root%>/menu/img/profile1.png'">
                    </a>
                    <%} else{%>
                    <img class="img-responsive" src="<%=root%>/menu/img/profile1.png" alt=""  onmouseover="this.src='<%=root%>/menu/img/profile2.png'" onmouseout="this.src='<%=root%>/menu/img/profile1.png'">
                    
                    <%} %>
                    <div class="intro-text">
                        <span class="name">Lucky Blue Smith</span>
                        <hr class="star-light">
                        <span class="skills">Property of David Kim</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Portfolio Grid Section -->
    <section id="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Menu</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 portfolio-item">
                    <a href="#portfolioModal1" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <%if(id==null){ %>
                        <img src="<%=root%>/menu/img/portfolio/1blind.png" class="img-responsive" alt="">
                        <%}else if(id!=null){%> 
                        <img src="<%=root%>/menu/img/portfolio/1.png" class="img-responsive" alt="">
						<%} %>
                    </a>
                </div>
                <div class="col-sm-4 portfolio-item">
                    <a href="#portfolioModal2" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <%if(id==null){ %>
                        <img src="<%=root%>/menu/img/portfolio/2.png" class="img-responsive" alt="">
                        <%}else if (id.equals("admin")){%>
                         <img src="<%=root%>/menu/img/portfolio/2list.png" class="img-responsive" alt="">
                       <%} else if(id!=null){%>                       
                         <img src="<%=root%>/menu/img/portfolio/2info.png" class="img-responsive" alt="">
                       <%} %>
                    </a>
                </div>
                <div class="col-sm-4 portfolio-item">
                    <a href="#portfolioModal3" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <img src="<%=root%>/menu/img/portfolio/3.png" class="img-responsive" alt="">
                    </a>
                </div>
                <div class="col-sm-4 portfolio-item">
                    <a href="#portfolioModal4" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                            </div>
                        </div>
                        <%if(id==null){ %>
                        <img src="<%=root%>/menu/img/portfolio/4blind.png" class="img-responsive" alt="">
                        <%}else if(id!=null){%> 
                        <img src="<%=root%>/menu/img/portfolio/4.png" class="img-responsive" alt="">
						<%} %>
                    </a>
                </div>
                <div class="col-sm-4 portfolio-item">
                    <a href="#portfolioModal5" class="portfolio-link" data-toggle="modal">
                        <div class="caption">
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                           	</div>
                        </div>
                        
                        <%if(id==null){ %>
                        <img src="<%=root%>/menu/img/portfolio/5blind.png" class="img-responsive" alt="">
                        <%}else if(id!=null){%> 
                        <img src="<%=root%>/menu/img/portfolio/5.png" class="img-responsive" alt="">
						<%} %>
                    </a>
                </div>
                <div class="col-sm-4 portfolio-item">
                    <a href="#portfolioModal6" class="portfolio-link" data-toggle="modal">
                        <div class="caption"> 
                            <div class="caption-content">
                                <i class="fa fa-search-plus fa-3x"></i>
                          </div>
                        </div>
                       <%if(id==null){ %>
                        <img src="<%=root%>/menu/img/portfolio/6blind.png" class="img-responsive" alt="">
                        <%}else if(id!=null){%> 
                        <img src="<%=root%>/menu/img/portfolio/6.png" class="img-responsive" alt="">
						<%} %>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section class="success" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>About David</h2>
                    <hr class="star-light">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-lg-offset-2">
                    <p>JAVA<br>JSP<br>ORACLE<br>MYSQL<br>HTML5<br>JavaScript<br>C<br>C++<br>Phython<br>AJAX<br>JSON<br>JQuery<br>Spring<br>MyBatis<br>iBatis<br>Bootstrap<br></p>
                </div>
                <div class="col-lg-4">
                    	<p>
		                    Lucky Blue Smith<br><br>
                            <a href="https://www.instagram.com/luckybsmith/?hl=ko"><i class="fa fa-instagram fa-fw fa-3x"></i></a>
                            <a href="https://twitter.com/luckybsmith"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                            <a href="https://ko-kr.facebook.com/luckyblue.smith/"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                      		<a href="http://luckybsmith.tumblr.com/"><i class="fa fa-tumblr fa-fw fa-3x"></i></a>
                        
						</p>
                    	<p>
                    		Janis Ancens<br><br>
                            <a href="https://www.instagram.com/janisancens/?hl=ko"><i class="fa fa-instagram fa-fw fa-3x"></i></a>
                            <a href="https://twitter.com/dirtylogger"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                            <a href="https://ko-kr.facebook.com/Janis-Ancens-164557600383509/"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                            <a href="https://www.tumblr.com/tagged/janis-ancens"><i class="fa fa-tumblr fa-fw fa-3x"></i></a>
                        
						</p>
                    	<p>
                  			Jeremy Dufour<br><br>
                            <a href="https://www.instagram.com/jeremy.dufour/"><i class="fa fa-instagram fa-fw fa-3x"></i></a>
                            <a href="https://twitter.com/iamjeremydufour"><i class="fa fa-twitter fa-fw fa-3x"></i></a>
                            <a href="https://www.facebook.com/JeremySDufour"><i class="fa fa-facebook fa-fw fa-3x"></i></a>
                         
						</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Calendar</h2>
                    <hr class="star-primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2" align="center">
                   
              <table>
		
		<tr>
			<td>　</td>
		</tr>
		<tr>
			<td>　</td>
		</tr>
		<tr>
			<td align="center" colspan="7">
				<h2><%=cal.get(Calendar.YEAR)%>/<font color="#18BC9C"><%=(cal.get(Calendar.MONTH)+1)%></font></h2>
			</tr>
		<tr>
			<td></td>
		</tr>
		
		<tr>
			<td>　</td>
		</tr>
		<tr align="center">
		
			<td><h4>　Sun　</h4></td>
			<td><h4>　Mon　</h4></td>
			<td><h4>　Tue　</h4></td>
			<td><h4>　Wed　</h4></td>
			<td><h4>　Thu　</h4></td>
			<td><h4>　Fri　</h4></td>
			<td><h4>　Sat　</h4></td>
			
		</tr>
		<%
			cal.set(year, month - 1, 1);
			int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
		%>
		<tr align="center">
			<%
				for (int i = 1; i < dayOfWeek; i++) {
			%><td align="center"></td>
			<%
				}
				for (int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++) {
			%>
			<td>
			<h3>
			<!-- <a href='< % = root % >/schedule/day.jsp?year=< %=cal.get(Calendar.YEAR ) % >&month=< % =((cal.get(Calendar.MONTH) + 1))%>&day=< %=i%>'>< %=i%></a>
			 -->
			 <%
			 int tday = today.get(Calendar.DATE);

			 int tmonth = today.get(Calendar.MONTH)+1;
			 int tyear = today.get(Calendar.YEAR);
			 
			 if(i==tday&&month==tmonth&&year==tyear){ %>
			 
<%-- 			 <h2><a href='<%=root%>/schedule/day.jsp?year=<%=cal.get(Calendar.YEAR)%>&month=<%=((cal.get(Calendar.MONTH) + 1))%>&day=<%=i%>' style="text-decoration:none;"><%=i%></a> --%>
<!-- 			 </h2> -->
			<h2><a href='#contact' style="text-decoration:none; "><%=i%></a></h2>
			 
			 <%}else{%>
			 <%=i%>
			  <%} %>
			</h3>
			</td>
			<%
				if ((dayOfWeek - 1 + i) % 7 == 0) {
			%>
		</tr>
		<tr align="center">
			<% }
  }%>

		</tr>
	</table>
                </div>
            </div>
        </div>
    </section>


    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll visible-xs visible-sm">
        <a class="btn btn-primary" href="#page-top">
            <i class="fa fa-chevron-up"></i>
        </a>
    </div>

    <!-- Portfolio Modals -->
    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Schedule</h2>
                            <hr class="star-primary">
 	                       <% if (id==null){%>
                            <p><a href="<%=root%>/schedule/list.jsp"><img src="<%=root%>/menu/img/portfolio/1.png" class="img-responsive img-centered" alt=""></a></p>
                             <%}else if(id.equals("admin")){ %>
                            <p><a href="<%=root%>/schedule/list.jsp"><img src="<%=root%>/menu/img/portfolio/1.png" class="img-responsive img-centered" alt=""></a></p>
                             <%} else{%>
                              <p><a href="<%=root%>/schedule/planlist.jsp"><img src="<%=root%>/menu/img/portfolio/1.png" class="img-responsive img-centered" alt=""></a></p>
            
                             <%} %>
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                               <div class="modal-body">
                          
                            
                            <%if(id==null){ %>
                            <h2>Login!</h2>
                            <hr class="star-primary">
                              <p><a href="<%=root%>/member/loginForm.jsp"><img src="<%=root%>/menu/img/portfolio/2.png" class="img-responsive img-centered" alt=""></a></p>	
                      		<%}else if (id.equals("admin")){%>
                            
                            <h2>Member List</h2>
                            <hr class="star-primary">
                               <p><a href="<%=root%>/member/list.jsp"><img src="<%=root%>/menu/img/portfolio/2list.png" class="img-responsive img-centered" alt=""></a></p>	
                            <%} else if(id!=null){%>
                            
                            <h2>My Information</h2>
                            <hr class="star-primary">
                            <p><a href="<%=root%>/member/read.jsp"><img src="<%=root%>/menu/img/portfolio/2info.png" class="img-responsive img-centered" alt=""></a></p>
                            <%} %>
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Guest Book</h2>
                            <hr class="star-primary">
                            	<p><a href="<%=root%>/guest/list.jsp"><img src="<%=root%>/menu/img/portfolio/3.png" class="img-responsive img-centered" alt=""></a></p>
							
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Default List</h2>
                            <hr class="star-primary">
                            
                            <p><a href="<%=root%>/bbs/list.jsp"><img src="<%=root%>/menu/img/portfolio/4.png" class="img-responsive img-centered" alt=""></a></p>
                     
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Image List</h2>
                            <hr class="star-primary">
                            
                            <p><a href="<%=root%>/images/list.jsp"><img src="<%=root%>/menu/img/portfolio/5.png" class="img-responsive img-centered" alt=""></a></p>
                     
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>Member Memo</h2>
                            <hr class="star-primary">
                          
                            <p><a href="<%=root%>/memo/list.jsp">  <img src="<%=root%>/menu/img/portfolio/6.png" class="img-responsive img-centered" alt=""></a></p>
                     
                          
                            <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-times"></i> Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="<%=root%>/menu/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="<%=root%>/menu/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="<%=root%>/menu/js/classie.js"></script>
    <script src="<%=root%>/menu/js/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="<%=root%>/menu/js/jqBootstrapValidation.js"></script>
    <script src="<%=root%>/menu/js/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="<%=root%>/menu/js/freelancer.js"></script>




<br>
<br>
<br>
<br>




<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 