<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>


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
		                                       <a href="#">내 질문목록</a>
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
			                <div class="mail-box">
                  <aside class="lg-side">
                      <div class="inbox-head">
                          <h3>나의 예약 목록</h3>
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
                                      <td>  <input type="checkbox" class="toption-input checkbox" /></td>

                     			  <td>예약번호</td>
                                  <td class="view-message">병원명</td>   
                                  <td></td>
                                  <td></td>                               
                                  <td>예약종류</td>
                                  <td>에약시간</td>
                             
                                        
                              </tr>
                              <tr class="">
                   <td>  <input type="checkbox" class="toption-input checkbox" /></td>
                               <td>101</td>
                                  <td colspan="3" class="view-message"><a href="boardInfo">김순영 소아과</a></td>
                                  <td><span class="label label-success">클리닉예약</span></td>
                                  <td class="view-message  text-left">2018/08/30</td>
                              </tr>
                                 <tr class="">
                   <td>  <input type="checkbox" class="toption-input checkbox" /></td>
                               <td>101</td>
                                  <td colspan="3" class="view-message"><a href="boardInfo">김순영 소아과</a></td>
                                  <td><span class="label label-success">클리닉예약</span></td>
                                  <td class="view-message  text-left">2018/08/30</td>
                              </tr>
                               <tr class="">
                   <td>  <input type="checkbox" class="toption-input checkbox" /></td>
                               <td>101</td>
                                  <td colspan="3" class="view-message"><a href="boardInfo">김순영 소아과</a></td>
                                  <td><span class="label label-success">클리닉예약</span></td>
                                  <td class="view-message  text-left">2018/08/30</td>
                              </tr>
                          </tbody>
                          </table>
                      </div>
                      </div>
           
                  </aside>
                  
                  <ul class="pagination" style="margin-top: 50px;margin-left:400px; ">
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
                   <div style="margin-top: 50px;">
				                       ※ 병원에 대기하는 환자가 많거나 현재 시간 기준으로 + 30분은 예약 및 예약수정이 불가능합니다.<br>
						재예약을 원하시는 분은 신중히 취소해 주시기 바랍니다.<br>
						※ 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 제 30조 2항(개인정보 이용내역의 통지)에 따라 에버메디 예약 서비스를 이용한 회원님의 개인정보 이용내역입니다.<br>
						※ ‘예약내역’ 에는 오늘 날짜 이후의 예약내역만 확인하실 수 있습니다.<br>
						※ 오늘 이전의 예약내역은 ‘지난예약내역’ 에서 확인하시기 바랍니다.<br>
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