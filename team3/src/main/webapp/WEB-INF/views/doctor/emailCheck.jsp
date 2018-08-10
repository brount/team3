<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file = "../common/setting.jsp" %>
<html>
<body>
     <table class="login_table">	          
       <tr>
         <td><label for="pwd">인증번호</label></td>
         <td><input type="password" id=pwd name="pwd"></td>
       </tr>
     </table>
     <br><br><br>
     <center>
                <input type="button" id="abc" value="확인">
     
     <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
	 <script type="text/javascript">
	 	$("#abc").click(function(){
	 		var pwd = $("#pwd").val();
	 		if( pwd == "${key }" ){
	 			alert("인증에 성공했습니다.");
	 			opener.document.reg_form.hiddenEmail.value=1;
	 			window.close();   				
	 		}else{
	 			alert("인증번호가 틀렸습니다.");
	 			$("#pwd").focus();
	 		}
	 	});  
     </script>
</body>
</html>