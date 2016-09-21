<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String root = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Join us!</title>

<script>
	function send() {
		// Checkbox 체크 검사 
		// 폼이름.input 태그의 주어진 이름.속성 
		if (document.frm.agree.checked == false) {
			alert('please check small box.');
			return false; // 서브밋 중지 
		} else {
			return true; // 서브밋 진행 
		}
	}
</script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


</head>

<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" />
	<!-- *********************************************** -->
<br>
<br>
<br>
<br>
<br>
	<form name="frm" method="post" action="./createForm.jsp"
		onsubmit="return send();">

		<div contentEditable="false" style="text-align: center;">
			<h1>Janis Ancens</h1> 
			<img src="../menu/images/agreement_img.gif"  />
		</div>

<br>
		<div style="text-align: center;">
			<label class="btn btn-success"><input type="checkbox"
				name="agree" value="1"> I agree. </label> <br>
			<br> <input type="submit" value="Join us!" class="btn btn-success">
			&nbsp; <input type="button" value="Cancel" class="btn btn-primary"
				onclick="history.back();">

		</div>
		<br>
		<br>
		<br>
		<br>
	</form>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html>

