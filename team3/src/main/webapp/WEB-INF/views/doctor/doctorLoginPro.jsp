<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${loginCnt == 0}">   
         
         <script type="text/javascript">
         alert("입력한 정보를 다시 확인하세요~!");
            window.location="memberLogin";
         </script>
   </c:if>         
   <c:if test="${logindAppro == 0}">
   <script type="text/javascript">
         alert("승인이 안된 회원입니다");
      
      window.location="main";
      </script>
   </c:if>
   <c:if test="${logindAppro == 2}">
   <script type="text/javascript">
         alert("탈퇴된 회원입니다");
      
      window.location="main";
      </script>
   </c:if>
      
   <c:if test="${loginCnt == 1}">
   <script type="text/javascript">
         alert("로그인 성공하였습니다~!");
      
      window.location="main";
      </script>
   </c:if>
</body>
</html>