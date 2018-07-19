<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<link href="/medical/resources/css/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<body>
<header>
	<%@ include file="../common/header.jsp" %>
</header>
	    <div class="container">
 <div class="mail-box">
                  <aside class="lg-side">
                      <div class="inbox-head">
                          <h3>검사 결과 목록 페이지</h3>
                          <form action="#" class="pull-right position">
                              <div class="input-append">
                                  <input type="text" class="sr-input" placeholder="검색">
                                  <button class="btn sr-btn" type="button"><i class="fa fa-search"></i></button>
                              </div>
                          </form>
                      </div>
                      <div class="inbox-body">
                         <div class="mail-option">
                             

                               <table class="table table-inbox table-hover">
                                
                            <tbody>
                              <tr class="unread">
                                    <td class="view-message  dont-show">번호</td>
                                  <td class="view-message">환자</td>                                  
                                  <td class="view-message  text-left">등록일</td>
                              </tr>
                              <tr class="">
                                  <td class="view-message  dont-show">5</td>
                                  <td class="view-message"><a href=checkupResult>신우철님 처방전</a></td>
                                  <td class="view-message  text-left">2018-05-06</td>
                              </tr>
                             
                              <tr class="">
                                  <td class="view-message  dont-show">4</td>
                                  <td class="view-message"><a href=checkupResult>김환자님 처방전</a></td>
                                  <td class="view-message  text-left">2018-05-06</td>
                              </tr>
                             
                              <tr class="">
                                  <td class="view-message  dont-show">3</td>
                                  <td class="view-message"><a href=checkupResult>김짜잔님 처방전</a></td>
                                  <td class="view-message  text-left">2018-05-06</td>
                              </tr>
                             
                              <tr class="">
                                  <td class="view-message  dont-show">2</td>
                                  <td class="view-message"><a href=checkupResult>김허접님 처방전</a></td>
                                  <td class="view-message  text-left">2018-05-06</td>
                              </tr>
                             
                              <tr class="">
                                  <td class="view-message  dont-show">1</td>
                                  <td class="view-message"><a href=checkupResult>김게임님 처방전</a></td>
                                  <td class="view-message  text-left">2018-05-06</td>
                              </tr>
                             
                             
                             
                          </tbody>
                          </table>
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
 <footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>