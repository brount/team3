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
   

      
	<section>   
		<div class="container">
		    <div class="row">
		        <div class="col-sm-3 col-md-3">
		            <div class="panel-group" id="accordion">
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a data-toggle="collapse" data-parent="#accordion" href="#">마이페이지</a>
		                        </h4>
		                    </div>
		                    <div id="collapseOne" class="panel-collapse collapse in collapse show">
		                        <div class="panel-body">
		                            <table class="table">
		                                <tr>
		                                    <td>
		                                        <a href="myHealth">내 건강정보</a>
		                                    </td>
		                                </tr>
	                                    <tr>
		                                    <td>
		                                        <a href="checkupRegister">검진서등록</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="checkAnalyze">내 검진결과</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                       <a href="myBordList">내 질문목록</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="reserveList">예약목록</a>
		                                    </td>
		                                </tr>
		                            </table>
		                        </div>
		                    </div>
		                </div>
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a href="bookMark">즐겨찾는병원</a>
		                        </h4>
		                    </div>
		                </div>
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a  href="guestModify">회원정보수정</a>
		                        </h4>
		                    </div>
		                </div>
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a href="memberExit">회원탈퇴</a>
		                        </h4>
		                    </div>
		                </div>
		            </div>
		        </div>	
			  		 <div class="col-sm-9 col-md-9">
			            <div class="well">
			                <h1> 내 질문 목록</h1>
			                
      <div class="container">
 <div class="mail-box">
                  <aside class="lg-side">
                      <div class="inbox-head">
                        
                          <form action="#" class="pull-right position">
                              <div class="input-append">
                                  <input type="text" class="sr-input" placeholder="검색">
                                  <button class="btn sr-btn" type="button"><i class="fa fa-search"></i></button>
                                  <input type="button" class="btn" value="글쓰기" onclick="window.location='boardAdd'">
                              </div>
                              <div>
                              	
                              </div>
                          </form>
                      </div>
                      <div class="inbox-body">
                         <div class="mail-option">

                               <table class="table table-inbox table-hover">
                                
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
                              
                              
                              
                              <c:forEach var="dto" items="${dtos }" >
                              <tr class="">
                                  <td class="view-message  dont-show">${dto.boardno}</td>
                                  <td colspan="3" class="view-message"><a href="boardInfo">${dto.boardtitle}</a></td>
                                  <td><span class="label label-success">${dto.boardwriter}</span></td>
                                  <td class="view-message  text-left">${dto.boarddate}</td>
                              </tr>
                            
                            </c:forEach>
                            
                       
                          </tbody>
                          </table>
                          </div>
                      </div>
                  </aside>
                  <ul class="pagination">
				      <li class="disabled"><span>«</span></li>
				      <li class="active"><span>1</span></li>
				      <li><a href="http://bootsnipp.com/search?q=page&page=2">2</a></li>
				      <li><a href="http://bootsnipp.com/search?q=page&page=3">3</a></li>
				      <li><a href="http://bootsnipp.com/search?q=page&page=4">4</a></li>
				      <li class="disabled"><span>...</span></li>
				      <li><a href="http://bootsnipp.com/search?q=page&page=22">5</a></li>
				      <li><a href="http://bootsnipp.com/search?q=page&page=2" rel="next">»</a></li>
				    </ul>
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