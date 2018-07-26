<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                              <tr class="">
                   <td>  <input type="checkbox" class="toption-input checkbox" /></td>
                                  <td colspan="3" class="view-message"><a href="boardInfo">김순영 소아과</a></td>
                                  <td><span class="label label-success">032-544-8275</span></td>
                                  <td class="view-message  text-left">인천광역시 계양구 도두리로 52 상가건물 203호</td>
                              </tr>
                              <tr class="">
                   <td>  <input type="checkbox" class="toption-input checkbox" /></td>
                                    <td colspan="3" class="view-message"><a href="boardInfo">김순영 소아과</a></td>
                                  <td><span class="label label-success">032-544-8275</span></td>
                                  <td class="view-message  text-left">인천광역시 계양구 도두리로 52 상가건물 203호</td>
                              </tr>
                              <tr class="">
                   <td>  <input type="checkbox" class="toption-input checkbox" /></td>
                                 <td colspan="3" class="view-message"><a href="boardInfo">김순영 소아과</a></td>
                                  <td><span class="label label-success">032-544-8275</span></td>
                                  <td class="view-message  text-left">인천광역시 계양구 도두리로 52 상가건물 203호</td>
                              <tr class="">
                   <td>  <input type="checkbox" class="toption-input checkbox" /></td>
                                   <td colspan="3" class="view-message"><a href="boardInfo">김순영 소아과</a></td>
                                  <td><span class="label label-success">032-544-8275</span></td>
                                  <td class="view-message  text-left">인천광역시 계양구 도두리로 52 상가건물 203호</td>
                              </tr>
                            
                          </tbody>
                          </table>
                          	<input type="button" onclick="window.location='reserveForm'" value="예약신청">
                      </div>
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
</section>

 <footer>
   <%@ include file="../common/footer.jsp" %>
</footer>

</body>
</html>