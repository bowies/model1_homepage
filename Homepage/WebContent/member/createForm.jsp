<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title>Join us!</title> 


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
<script type="text/javascript"> 

	var f = document.frm; // <FORM>태그 객체 

	// 입력 값 검사후 서버로 전송 
  function inputCheck(){ 
   
    
 
    if(f.email.value == ""){ 
      alert("Please insert Email."); 
      f.email.focus(); 
      return; 
    } 
 
    if(f.job.value == "0"){ 
      alert("Please select Your Job."); 
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
      window.alert("Please insert your ID."); 
      document.frm.id.focus(); // 커서 이동 
    }else{ 
      url="./membercheck/id_proc.jsp?id=" + idv;  // GET 
      wr = window.open(url,"아이디검색","width=500,height=400"); 
      wr.moveTo((window.screen.width-500)/2, (window.screen.height-400)/2);// x, y 
      //window.open객체를 wr이라는 것으로 참조한 다음에
      //wr이라는 애를 저 x y 좌표로 이동하겠다는 얘기인가 봄
      
    } 
  } 
 
  //중복 이메일을 검사합니다. 
  function emailCheck(email){ 
    if(email == ""){ 
      window.alert("Please insert your Email."); 
      f.email.focus(); 
    }else{
      url="./membercheck/email_proc.jsp?email=" + email;  // GET 
      wr = window.open(url,"이메일검색","width=500,height=400"); 
      wr.moveTo((window.screen.width-500)/2, (window.screen.height - 400)/2);// x, y 
    } 
  } 
 

 
</script>
</head>
<jsp:include page="/menu/top.jsp" />

<body leftmargin="0" topmargin="0">
<br>
<br>
<br>
<br>
<br>
<br>

<DIV class="title" align="center"><h1>Join us!</h1></DIV>
 
<br>
<FORM name='frm' 
      method='POST' 
      action='./createProc.jsp'
      enctype='multipart/form-data'
      onsubmit="return inputCheck()">
          
      
  <TABLE style="margin: 0 auto;line-height: 3.3em;"> 
  
    <tr> 
       <th style="text-align: right;">Picture:　</th> 
       
       <td>
       <label class="btn btn-success">
       <input type='file' name='picturename'  style="display: none;">Input File
       </label>
       </td> 
      
       <td>　Please upload picture of yours.</td> 
       
     </tr>
     <tr>
     	<th style="height: 5px"></th>
     	<td></td>
     	<td></td>
     </tr> 
 
     <tr> 
       <th  style="text-align: right;">ID:　</th> 
       <td> 
           <input type="text" name="id" placeholder='ID' class="form-control"  style="width: 50%;float: left;"> 
           &nbsp;  &nbsp; 
           <input type="button" value="ID Check"  
                  onclick="idCheck(document.frm.id.value)" class="btn btn-success">
       </td> 
       <td>　Please check the overlap ID.</td> 
     </tr> 

    <tr>  
       <th  style="text-align: right;">Password:　</th> 
       <td> <input type="password" name="password" placeholder='password' class="form-control"   style="width: 50%;float: left;"> </td> 
       <td>　You are in the Password zone!</td> 
     </tr> 
     <tr>  
       <th  style="text-align: right;">Check Password:　</th> 
       <td> <input type="password" name="repassword" placeholder='password' class="form-control"   style="width: 50%;float: left;"> </td> 
       <td>　And check it twice!</td> 
     </tr> 
     <tr>  
       <th  style="text-align: right;">Name:　</th> 
       <td> <input type="text" name="membername" placeholder='name' class="form-control"   style="width: 50%;float: left;"> </td> 
       <td>　Please type your name.</td> 
     </tr> 
     <tr>  
       <th  style="text-align: right;">Phone:　</th> 
       <td><input type="text" name="phone" placeholder="010-1234-5678"class="form-control"   style="width: 50%;float: left;"></td> 
       <td></td> 
     </tr>           
     <tr>  
       <th  style="text-align: right;">Email:　</th> 
       <td> 
           <input type="email" name="email" size="27"  placeholder='email@email.com' class="form-control"  style="width: 50%;float: left;" > 
                   &nbsp;  &nbsp; 
           <input type="button" value="Email Check"  
                   onclick="javascript:emailCheck(document.frm.email.value)" class="btn btn-success"> 
        
       </td> 
       <td>　Please insert your email.</td> 
     </tr> 
     <tr>   
       <th  style="text-align: right;">Zip Code:　</th> 
       <td> <input type="text" name="zipcode" id="sample6_postcode"
					placeholder="Zip Code"  class="form-control"  style="width: 50%;float: left;">
					  &nbsp;  &nbsp; 
            <input type="button" name="btnPost" value="Find your Zip Code" 
                  onclick="sample6_execDaumPostcode()" class="btn btn-success"></td> 
       <td>　Search your Zip Code.</td> 
     </tr> 
     <tr>   
       <th  style="text-align: right;">Address:　</th> 
       <td> 
       <input type="text" name="address1" size="45" id="sample6_address" placeholder="Address" class="form-control"  style="width: 50%;float: left;" ><br/> 
       <input type="text" name="address2" size="45" id="sample6_address2" placeholder="Extra Address" class="form-control"  style="width: 100%;float: left;">
       
					 
       </td> 
       <td>　Please type your extra address.</td> 
     </tr> 
     <tr>   
       <th  style="text-align: right;">Job:　</th> 
       <td> 
           <select name='job' class="form-control"> 
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
             </select> 
         </td> 
       <td>　Please select your present occupation.</td> 
     </tr>
  </TABLE>
  
  
  <DIV class='bottom'  align="center">
  <br>
  <br>
    <input type='submit' value='Regesiter' class="btn btn-success">
    <input type='reset' value='Cancel' class="btn btn-primary">
  </DIV>
</FORM>
 
<br>
<br>
<br>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" />
</body>
<!-- *********************************************** -->
</html> 
 
