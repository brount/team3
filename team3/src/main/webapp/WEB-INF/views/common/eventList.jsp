<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title> 사이트 이름 </title>
<body>

<script type="text/javascript">
function noEvent() { // 새로 고침 방지
	if (event.keyCode == 116) {
		event.keyCode = 2;
		return false;
	} else if (event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)) {
		return false;
	}
}
document.onkeydown = noEvent;

document.oncontextmenu = function() {return false;}
</script>
   
<header >
	<%@ include file="../common/header.jsp" %>
</header>
   <%@ include file="../common/line.jsp"%>
   
   <section>
   		<c:if test="${updateCnt == 0}">
			<script type="text/javascript">
				alert("포인트가 부족합니다.");
				window.history.back();
			</script>
		</c:if>
		
		<c:if test="${updateCnt != 0}">	
		<div class="container">
		    <div class="row">
		        <div class="col-sm-3 col-md-3">
		            <%@ include file="../common/menuEvent.jsp" %>
		        </div>
	  		 	<div class="col-sm-9 col-md-9">
		            <div class="well">
			            <div class="container">
					      <h1 class="my-4 text-center text-lg-left">프로모션 목록</h1>
					
					      <div class="row text-center text-lg-left">
							<c:forEach var="dto" items="${dtos}">
								<div class="col-lg-3 col-md-4 col-xs-6">
						          <a href="eventInfo?advertisementNo=${dto.advertisementNo}" class="d-block mb-4">
						           	<div align="center"> 
						           	<div style="font-size:25px; font-family: 'Nanum Gothic', sans-serif !important;">${dto.advertisementTitle}</div>
						           	<img src="resources/images/event/${dto.advertisementThumbnail}" style="width:165px; height:100px;">
						           	<div style="font-size:14; margin-top:5px;">${dto.advertisementStart} ~ ${dto.advertisementEnd}</div>
						           	</div>
						          </a>
						        </div>
							</c:forEach>
					      </div>					
			        	</div> 
			        	
			        	<div class="pagination clearfix" style="display: table; margin: 0 auto;">
                        <c:if test="${cnt>0}">
                           <!-- 이전블록 -->
                           <c:if test="${startPage > pageBlock }">
                              <a href="eventList?pageNum=${startPage-pageBlock}"><</a>
                           </c:if>
                           <!-- 페이지 블록 -->
                           <c:forEach var="i" begin="${startPage }" end="${endPage }">
                              <c:if test="${i == currentPage }">
                                 <strong>${i }</strong>
                              </c:if>
                              <c:if test="${i != currentPage }">
                                 <a href="eventList?pageNum=${i}">${i }</a>
                              </c:if>
                           </c:forEach>
                           <!-- 다음블록 -->
                           <c:if test="${pageCnt > endPage }">
                              <a href="eventList?pageNum=${startPage+pageBlock}">></a>
                           </c:if>
                        </c:if>
                     </div>
			        	
			        	
		            </div>
		        </div>
		    </div>
		</div> 
		</c:if>
   </section>
   
<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>

</body>
</html>