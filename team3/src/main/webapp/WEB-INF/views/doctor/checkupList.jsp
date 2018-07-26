<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="/medical/resources/css/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<body>
<header>
	<%@ include file="../common/header.jsp" %>
</header>

<section>
	<div class="container">
	    <div class="row">
	        <div class="col-sm-3 col-md-3">
	            <%@ include file="../common/menuCheckup.jsp" %>
	        		</div>	
		  		 		<div class="col-sm-9 col-md-9">
		           			 <div class="well">
		                <div class="mail-box">
                 <aside class="lg-side">
                     <div class="inbox-head">
                         <h3>검사 의뢰서 목록</h3>
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
                                 <td class="view-message">의뢰환자</td>        
							  <td class="view-message">담당의사</td>        
                                 <td class="view-message  text-left">신청일</td>
                             </tr>
                             <tr class="">
                                 <td class="view-message  dont-show">5</td>
                                 <td class="view-message"><a href="checkupInfo">신우철님 검사</a></td>
                                 <td class="view-message">박영진</td>
                                 <td class="view-message  text-left">2018-05-06 16시 45분</td>
                             </tr>
                            
                             <tr class="">
                                 <td class="view-message  dont-show">4</td>
                                 <td class="view-message"><a href="checkupInfo">공유님 검사</a></td>
                                 <td class="view-message">인재상</td>
                                 <td class="view-message  text-left">2018-05-06 15시 37분</td>
                             </tr>
                            
                             <tr class="">
                                 <td class="view-message  dont-show">3</td>
                                 <td class="view-message"><a href="checkupInfo">김환자님 검사</a></td>
                                 <td class="view-message">김선한</td>
                                 <td class="view-message  text-left">2018-05-06 15시 30분</td>
                             </tr>
                            
                             <tr class="">
                                 <td class="view-message  dont-show">2</td>
                                 <td class="view-message"><a href="checkupInfo">김아무개님 검사</a></td>
                                 <td class="view-message">김행동</td>
                                 <td class="view-message  text-left">2018-05-06 14시 50분</td>
                             </tr>
                            
                             <tr class="">
                                 <td class="view-message  dont-show">1</td>
                                 <td class="view-message"><a href="checkupInfo">김마음님 검사</a></td>
                                 <td class="view-message">인겸손</td>
                                 <td class="view-message  text-left">2018-05-06 14시 20분</td>
                             </tr>
                            
                         </tbody>
                         </table>
                     </div>  
                 </aside>
                 <ul class="pagination" style="display:table; margin:0 auto;">
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
</section>

 <footer>
	<%@ include file="../common/footer.jsp" %>
</footer>
</body>
</html>