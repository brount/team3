<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> 사이트이름 </title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />

</head>

<body>
<c:if test="${overlap==1 }">
<script type="text/javascript">
	alert('이미 즐겨찾기된 병원입니다.');
</script>
</c:if>

<c:if test="${cnt==0 }">
<script type="text/javascript">
	alert('즐겨찾기된 병원이 없습니다.먼저 병원을 즐겨찾기해주세요!');
	window.location="achospitalSeach?state=2";
</script>
</c:if>

<header>
   <%@ include file="../common/header.jsp" %>
</header>
<section>

<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <%@ include file="../guest/menuGuest.jsp" %>
        </div>	
	 <div class="col-sm-9 col-md-9">

    <div class="well">
 <div class="mail-box">
                  <aside class="lg-side">
                      <div class="inbox-head">
                          <h3>관심병원</h3>
                          
                      </div>
                      <div class="inbox-body">
                         <div class="mail-option">
                             
 					
                               <table class="table table-inbox table-hover">
                                
                            <tbody>
                              <tr class="unread">
                 <!--   <td>  <input type="checkbox" class="toption-input checkbox" /></td> -->
                                  <td class="view-message">병원명</td>                                  
                                  <td></td>
                                  <td></td>
                                    <td> 
                                        <span>전화번호
                                            <div>
                                                <span class="label label-success pull-left"> </span> 
                                                <span class="label label-info pull-left"> </span>
                                                <span class="label label-warning pull-left"> </span>
                                                <span class="label label-danger pull-left"> </span>
                                            </div>
                                        </span>
                                    </td>
                                  <td class="view-message  text-left">주소</td>
                              </tr>
                                 <c:forEach var="dto" items="${dtos}" >
                              <tr class="">
                <!--    <td>  <input type="checkbox" class="toption-input checkbox" /></td> -->
                  
                                  <td colspan="3" class="view-message" onclick="hospitalInfo?hospitalno=${dto.hospitalno }">${dto.hospitalname }</td>
                                  <td><span class="label label-success">${dto.hospitalphone }</span></td>
                                  <td class="view-message  text-left"><a href="hospitalInfo?hospitalno=${dto.hospitalno }">${dto.hospitaladdr }</a></td>
                              </tr>
          			          </c:forEach>
                          </tbody>
                          </table>
                         
                        <!--   	<input type="button" onclick="window.location='reserveForm'" value="예약신청"> -->
                      </div>
                      </div>
                      </div>
                      
                  </aside>
                   
		                  <!-- 페이지 컨트롤 -->
				<table style="width:1000px" align="center">
					<tr>
						<th align="center">
							<c:if test="${cnt>0 }">
								<!-- 처음[◀◀] / 이전[◀]  -->
								<c:if test="${startPage > pageBlock }">
									<a href="bookMark">[◀◀]</a>
									<a href="bookMark?pageNum=${startPage - pageBlock }">[◀]</a>
								</c:if>
								
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:if test="${i == currentPage }">
										<span><b>[${i}]</b></span>
									</c:if>
									<c:if test="${i != currentPage}">
										<a href="bookMark?pageNum=${i }">[${i}]</a>
									</c:if>
								</c:forEach>
								
								<!-- 다음[▶] / 끝[▶▶]  -->	
								<c:if test="${pageCount > endPage }">
									<a href="bookMark?pageNum=${startPage + pageBlock }">[▶]</a>
									<a href="bookMark?pageNum=${pageCount}">[▶▶] </a>
								</c:if>)

							</c:if>
						</th>
					</tr>
				
				</table>			
              </div>                    
      </div>

	</div>
</div>
</section>

 <footer>
   <%@ include file="../common/footer.jsp" %>
</footer>

</body>
</html>