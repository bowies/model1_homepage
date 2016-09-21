<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="member.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="dao" class="member.MemberDAO"></jsp:useBean>

<%
	String id = request.getParameter("id");
	
if(id==null){
	id=(String)session.getAttribute("id");
}
	MemberDTO dto = dao.read(id);

%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update My Information</title>


<script type="text/javascript"> 

	var f = document.frm; // <FORM>태그 객체 

	// 입력 값 검사후 서버로 전송 
  function inputCheck(){ 
   
    
 
    if(f.email.value == ""){ 
      alert("이메일을 입력해 주세요."); 
      f.email.focus(); 
      return; 
    } 
 
    if(f.job.value == "0"){ 
      alert("직업을 선택해 주세요."); 
      f.job.focus(); 
      return; 
    } 
    // Form onsubmit 이벤트일경우 
    // return false; 
     
    f.submit(); 
  } 
 
  // 중복 아이디를 검사합니다. 
  function idCheck(idv){ 
    if(idv == ""){ 
      window.alert("아이디를 입력해 주세요."); 
      document.frm.id.focus(); // 커서 이동 
    }else{ 
      url="./id_proc.jsp?id=" + idv;  // GET 
      wr = window.open(url,"아이디검색","width=500,height=400"); 
      wr.moveTo((window.screen.width-500)/2, (window.screen.height-400)/2);// x, y 
      //window.open객체를 wr이라는 것으로 참조한 다음에
      //wr이라는 애를 저 x y 좌표로 이동하겠다는 얘기인가 봄
      
    } 
  } 
 
  //중복 이메일을 검사합니다. 
  function emailCheck(email){ 
    if(email == ""){ 
      window.alert("이메일을 입력해 주세요."); 
      f.email.focus(); 
    }else{
      url="./membercheck/email_proc.jsp?email=" + email;  // GET 
      wr = window.open(url,"이메일검색","width=500,height=400"); 
      wr.moveTo((window.screen.width-500)/2, (window.screen.height - 400)/2);// x, y 
    } 
  } 
 

 
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>

</head>
<!-- *********************************************** -->
<body leftmargin="0" topmargin="0">
	<jsp:include page="/menu/top.jsp" />
	<!-- *********************************************** -->
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<DIV class="title" align="center"><h1>Change My Information</h1></DIV>

	<FORM name='frm' method='POST' action='./updateProc.jsp'
		onsubmit="return inputCheck()">

		<input type="hidden" name="id" value="<%=dto.getId()%>">

  <TABLE style="margin: 0 auto;line-height: 3.3em;"> 

			<tr>
				<th style="text-align: right;">ID:　</th>
				<td><%=dto.getId() %></td>
			</tr>
			<tr>
				<th style="text-align: right;">Name:　</th>
				<td><%=dto.getMembername() %></td>
				
			</tr>
			<tr>
				<th style="text-align: right;">Phone:　</th>
				<td><input type="text" name="phone" value="<%=dto.getPhone()%>" class="form-control" style="width: 200px; float: left;"></td>
			</tr>
			<tr>
				<th style="text-align: right;">Email:　</th>
				<td><input type="text" name="email" 
					value='<%=dto.getEmail()%>' class="form-control" style="width: 200px; float: left;"> 　<input type="button"
					value="Email Check"
					onclick="javascript:emailCheck(document.frm.email.value)"  class="btn btn-success">

				</td>
			</tr>
			<tr>
				<th style="text-align: right;">Zip Code:　</th>
				<td><input type="text" name="zipcode" id="sample6_postcode"
					value="<%=dto.getZipcode() %>" class="form-control"  style="width: 200px; float: left;">　 <input type="button"
					name="btnPost" value="Zip Code" onclick="sample6_execDaumPostcode()"  class="btn btn-success"      ></td>
		
			</tr>
			<tr>
				<th style="text-align: right;">Address:　</th>
				<td><input type="text" name="address1" 
					id="sample6_address" value="<%=dto.getAddress1()%>" class="form-control" style="width: 200px; float: left;" ><br />
					<input type="text" name="address2"  id="sample6_address2"
					value="<%=dto.getAddress2()%>" class="form-control"  style="width: 200px; float: left;"></td>
			
			</tr>
			<tr>
				<th style="text-align: right;">Job:　</th>
				<td> <select name='job' class="form-control"> 
               <option value="0" selected>Please select your present occupation.</option> 
               <option value="A01">Businessman</option> 
               <option value="A03">Programmer</option> 
               <option value="A05">Researcher</option> 
               <option value="A07">Student</option> 
               <option value="A09">Owner operator</option> 
               <option value="A11">Government employee</option> 
               <option value="A13">Health care provider</option> 
               <option value="A15">Law society member</option> 
               <option value="A17">Artist</option> 
               <option value="A19">Farmer</option> 
               <option value="A23">Livestock raiser</option> 
               <option value="A25">Fisher</option> 
               <option value="A27">Miner</option> 
               <option value="A30">Homemaker</option> 
               <option value="A32">Unemployed</option> 
               <option value="A99">ETC</option> 
             </select> <script>
       			document.frm.job.value = '<%=dto.getJob()%>'; 
       			//이렇게 하면 현재 document의 frm form의 job의 값이 선택됨
       		</script></td>
				
			</tr>
		</TABLE>

		<br>

		<DIV class='bottom'  align="center">
			<input type='submit' value='Confirm' class="btn btn-success" > <input type='reset'
				value='Reset' class="btn btn-primary">
				<input type='button' value='Cancel' onclick="history.back()" class="btn btn-primary">
		</DIV>
	</FORM>

<br>
<br>
<br>
<br>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html>

