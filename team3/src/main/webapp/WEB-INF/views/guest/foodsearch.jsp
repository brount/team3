<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<html>
<head>
<title> 사이트이름 </title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/default.css" />
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/table.css" />


<script src="/medical/resources/djcss/dj.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="../common/setting.jsp"%>
<script type="text/javascript">
$(document).ready(function(){    
	aa();
    /* data 가 json 인경우 */      
    function aa(){        
       var select = $("#select").val(); 
       var sc = $("#sc").val();
       var pageNum = $("#pageNum").val();
       console.log(sc+"aaa"+select);
       $.ajax({
          url:"/medical/foodSearch_sub?sc="+sc+"&select="+select+"&pageNum="+pageNum,            
          type: 'post',                        
          
          success : function(data){ 
             $('#result').html(data);  
          },error:function(){ 
             alert('오류');
          }
       });
    }
    $('#search').click(aa);
 });
</script>
</head>
<body > 


<section>
		<div class="container">
			<div class="inbox-body">
				<div class="mail-option">
					<table class="responstable">
					<tr>
						<th>식품군</th>
						<th>식품명</th>
						<th>${index }</th>
					</tr>
					<tr>
						<td>
							<select name="sc" id="sc">
								<option value="전체">전체</option>
								<c:forEach var="op" items="${vo}" >
									<option value="${op.foodkind }"<c:if test="${sc == op.foodkind }"> selected="selected"</c:if>>${op.foodkind }</option>								
								</c:forEach>								
							</select>
						</td>
						<td>
							<input type="text" name="select" id="select" value="${select }">
							<input type="hidden" name="pageNum" id="pageNum" value="${pageNum }">
						</td>
						<td>
							<button id="search" class="btn btn-dark-blue">검색</button>
						</td>
					</tr>
						 
						
					</table>
				</div>
				
				<div id="result">
					검색어를 입력해주세요
				</div>
			</div>
		</div>
	</section>
</body>
</html>