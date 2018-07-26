<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title> 사이트 이름 </title>
<body>
   
<header>
	<%@ include file="../common/header.jsp" %>
</header>
   
   <section>   	
		<div class="container">
		    <div class="row">
		        <div class="col-sm-3 col-md-3">
		            <div class="panel-group" id="accordion">
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a href="eventList">이벤트</a>
		                        </h4>
		                    </div>                   
		                </div>
		             </div>
		        </div>
	  		 	<div class="col-sm-9 col-md-9">
		            <div class="well">
			            <div class="container">
					      <h1 class="my-4 text-center text-lg-left">이벤트 목록</h1>
					
					      <div class="row text-center text-lg-left">
							<c:forEach var="dto" items="${dtos}">
								<div class="col-lg-3 col-md-4 col-xs-6">
						          <a href="eventInfo?advertisementNo=${dto.advertisementNo}" class="d-block mb-4">
						           	<div align="center"> 
						           	${dto.advertisementTitle}
						           	<img src="resources/images/event/${dto.advertisementThumbnail}" style="width:165px; height:100px;">
						           	<div style="font-size:14; margin-top:5px;">${dto.advertisementStart} ~ ${dto.advertisementEnd}</div>
						           	</div>
						          </a>
						        </div>
							</c:forEach>
					      </div>					
			        	</div> 
			        	<table align="center">
							<tr>
								<th align="center">
									<c:if test="${cnt>0}">
										<!-- 처음[◀◀] / 이전블록 [◀] -->
										<c:if test="${startPage > pageBlock}">
											<a href="eventList">[◀◀]</a>
											<a href="eventList?pageNum=${startPage-pageBlock}">[◀]</a>	
										</c:if>
										<!-- 페이지 블록 -->
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<c:if test="${i == currentPage }">
												<span> <b>[${i }]</b></span>
											</c:if>
											<c:if test="${i != currentPage }">
												<a href="eventList?pageNum=${i}">[${i}]</a>
											</c:if>
										</c:forEach>										
										<!-- 다음블록[▶] / 끝[▶▶] -->
										<c:if test="${pageCnt > endPage}">
											<a href="eventList?pageNum=${startPage+pageBlock}">[▶]</a>
											<a href="eventList?pageNum=${pageCnt}">[▶▶]</a>
										</c:if>
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

	
