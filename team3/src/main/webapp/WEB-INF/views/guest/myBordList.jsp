<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title> 사이트 이름 </title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
   
   <header>
   <%@ include file="../common/header.jsp" %>
   </header>
      
	<section  style="margin-bottom: 100px;"  >   
		<div class="container">
		    <div class="row">
		        <div class="col-sm-3 col-md-3">
		            <%@ include file="../guest/menuGuest.jsp" %>
		        </div>	
			  		 <div class="col-sm-9 col-md-9">
			            <div class="well">
			                <h1> 내 질문 목록</h1>
			                
      <div class="container">
 <div class="mail-box">
                  <aside class="lg-side">
                      <div class="inbox-head">
                        
                          <form action="#" class="pull-right position">
                           <!--    <div class="input-append">
                                  <input type="text" class="sr-input" placeholder="검색">
                                  <button class="btn sr-btn" type="button"><i class="fa fa-search"></i></button>
                                  <input type="button" class="btn" value="글쓰기" onclick="window.location='boardAdd'">
                              </div> -->
                           
                          </form>
                      </div>
                      <div class="inbox-body">
                         <div class="mail-option">

                               <table class="table table-inbox table-hover" style="margin-top: 50;">
                                
                            <tbody>
                              <tr class="unread">
                                    <td class="view-message  dont-show">글번호</td>
                                  <td class="view-message">제목</td>                                  
                                  <td></td>
                                  <td></td>
                                    <td>
                                        <span>작성자
                                            <span class="label label-success pull-left"> </span> 
                                            <span class="label label-info pull-left"> </span>
                                            <span class="label label-warning pull-left"> </span>
                                            <span class="label label-danger pull-left"> </span>
                                        </span>
                                    </td>
                                  <td class="view-message  text-left">등록일</td>
                              </tr>
                              
                              
                              <c:if test="${cnt!=0 }">
                              <c:forEach var="dto" items="${dtos }" >
                              <tr class="">
                                  <td class="view-message  dont-show">${dto.boardno}</td>
                                  
                                  <td colspan="3" class="view-message">
                                  <a href="boardInfoCheck?num=${dto.boardno}&pageNum=${pageNum}&number=${number+1}">${dto.boardtitle}</a></td>
                                  <td><span class="label label-success">${dto.boardwriter}</span></td>
                                  <td class="view-message  text-left">${dto.boarddate}</td>
                              </tr>
                            
                            </c:forEach>
                            </c:if>
                       		<c:if test="${cnt==0 }">
                       			<tr>
                       			<td colspan="6" align="center">작성된 질문이 없습니다.</td>
                       			</tr>
                       		</c:if>	
                       
                          </tbody>
                          </table>
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
							<a href="myBordList">[◀◀]</a>
							<a href="myBordList?pageNum=${startPage - pageBlock }">[◀]</a>
						</c:if>
						
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<c:if test="${i == currentPage }">
								<span><b>[${i}]</b></span>
							</c:if>
							<c:if test="${i != currentPage}">
								<a href="myBordList?pageNum=${i }">[${i}]</a>
							</c:if>
						</c:forEach>
						
						<!-- 다음[▶] / 끝[▶▶]  -->	
						<c:if test="${pageCount > endPage }">
							<a href="myBordList?pageNum=${startPage + pageBlock }">[▶]</a>
							<a href="myBordList?pageNum=${pageCount}">[▶▶] </a>
						</c:if>
					</c:if>
				</th>
			</tr>
		
		</table>			
                  
                  
                  
                  <!-- <ul class="pagination">
				      <li class="disabled"><span>«</span></li>
				      <li class="active"><span>1</span></li>
				      <li><a href="http://bootsnipp.com/search?q=page&page=2">2</a></li>
				      <li><a href="http://bootsnipp.com/search?q=page&page=3">3</a></li>
				      <li><a href="http://bootsnipp.com/search?q=page&page=4">4</a></li>
				      <li class="disabled"><span>...</span></li>
				      <li><a href="http://bootsnipp.com/search?q=page&page=22">5</a></li>
				      <li><a href="http://bootsnipp.com/search?q=page&page=2" rel="next">»</a></li>
				    </ul> -->
              </div>                    
		</div>
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