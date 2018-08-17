<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Jua" rel="stylesheet">

<!-- /medical/resources/css/ -->
<!-- Bootstrap core CSS -->
<link href="https://fonts.googleapis.com/css?family=Permanent+Marker" rel="stylesheet">
<link href="/medical/resources/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Plugin CSS -->
<link href="https://fonts.googleapis.com/css?family=Bungee+Shade|Do+Hyeon" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Bungee" rel="stylesheet">
<link href="/medical/resources/css/vendor/magnific-popup/magnific-popup.css" rel="stylesheet"
	type="text/css">

<!-- Custom styles for this template -->
<link href="resources/common/css/freelancer.min.css" rel="stylesheet">
<link href="/medical/resources/css/css/mycss.css" rel="stylesheet">
<link href="/medical/resources/css/css/mainmenuversion.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/default.css" />
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/component.css" />
<script src="/medical/resources/css/js/modernizr.custom.js"></script>
<link rel="stylesheet" href="/medical/resources/common/css/footer.css" type="text/css">

<script type="text/javascript">
function personalCare() {
	if(${sessionScope.id==null} ){
		alert('로그인이 필요한 서비스입니다.');
		window.location='memberLogin';
	}else{
		window.location='personalCare';
	}
}
function guestcheckupResultList() {
	if(${sessionScope.id==null} ){
		alert('로그인이 필요한 서비스입니다.');
		window.location='memberLogin';
	}else{
		window.location='guestcheckupResultList';
	}
}
function guestexaminationList() {
	if(${sessionScope.id==null} ){
		alert('로그인이 필요한 서비스입니다.');
		window.location='memberLogin';
	}else{
		window.location='guestexaminationList';
	}
}
function myFoodList() {
	if(${sessionScope.id==null} ){
		alert('로그인이 필요한 서비스입니다.');
		window.location='memberLogin';
	}else{
		window.location='myFoodListH';
	}
}

</script>
</head>
 
<div class="header"> 
	<a onclick="window.location='main'" style="padding: 0px; margin-top: 10px; float: left;">
	<h1 style="font-size: 40px; font-family: 'Bungee', cursive;
 padding-top:30px; margin-left: 50px;"> Medi Clip </h1></a>
<div class="container">
	<header class="clearfix" style="height: 49px; padding: 0px; margin-right: 45px;">
		<nav class="mainmenu" style="font-size: 25px; padding: 0px 0px 0px 60px;">
			<c:if test="${sessionScope.memberState == null }">
				<a onclick="window.location='memberLogin'" style="font-size: 17px; padding-top: 25px;">login</a>
				<a onclick="window.location='memberClassify'" style="font-size: 17px; padding-top: 25px;">join us</a>
			</c:if>
			<c:if test="${sessionScope.memberState == 0 }">
				<a onclick="window.location='memberLogin'" style="font-size: 17px; padding-top: 25px;">login</a>
				<a onclick="window.location='memberClassify'" style="font-size: 17px; padding-top: 25px;">join us</a>
			</c:if>
			 <c:if test="${sessionScope.memberState == 1 }">
				<a onclick="window.location='myGuest'" style="font-size: 17px; padding-top: 25px;">my page</a>
				<a onclick="window.location='logout'" style="font-size: 17px; padding-top: 25px;">logout</a> 
			 </c:if>
			 <c:if test="${sessionScope.memberState == 2 }">
				<a onclick="window.location='myHospital'" style="font-size: 17px; padding-top: 25px;">my page</a>
				<a onclick="window.location='logout'" style="font-size: 17px; padding-top: 25px;">logout</a> 
			 </c:if>						
		</nav>
	</header>

	<!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-light white" id="headermenu" style="padding:0px 8px; width:100%; margin-left: 40px;">

    <!-- Collapse button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
        aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

    <!-- Collapsible content -->
    <div class="collapse navbar-collapse" id="navbarSupportedContent">

        <!-- Links -->
        <ul class="navbar-nav mr-auto">
            <!-- Dropdown -->
            <li class="nav-item dropdown mega-dropdown">
                <a class="nav-link dropdown" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 30px; color: black; font-family: 'Do Hyeon', sans-serif !important;">병원(검사) </a>
                <div class="dropdown-menu mega-menu row z-depth-1" aria-labelledby="navbarDropdownMenuLink">
                    <div class="row">
                        <div class="col-md-5 col-xl-3 sub-menu mt-5 mb-5 pl-4">
                            <ol class="list-unstyled mx-4 dark-grey-text">
                            <c:if test="${sessionScope.memberState != 2 }">
								<li class="sub-title text-uppercase"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"  onclick="guestcheckupResultList()">건강검진  목록</a></li>
                                <li class="sub-title text-uppercase"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"  onclick="guestexaminationList()">처방전 목록</a></li>  
							 </c:if>
							 <c:if test="${sessionScope.memberState == 2 }">
								<li class="sub-title text-uppercase mt-sm"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"   onclick="window.location='patientList'">검진 예약 목록</a></li>	
                                <li class="sub-title text-uppercase mt-sm"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"   onclick="window.location='checkupList'">검사 의뢰 목록</a></li>
                                <li class="sub-title text-uppercase"><a class="menu-item"  style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"  onclick="window.location='checkupResultList'">건강검진 목록</a></li>
                                <li class="sub-title text-uppercase"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"  onclick="window.location='examinationList'">처방전 목록</a></li>  
							 </c:if>	
                            </ol>
                        </div>
                        <div class="col-md-7 col-xl-9">
                            <div class="row">
                                <div class="col-xl-6 mt-5 mb-4 pr-5 clearfix d-none d-md-block">
                               
                                    <!--Featured image-->
                                    <div class="view overlay pb-3">
                                        <img src="resources/images/mainimg/bloodpersuer.jpg" class="img-fluid z-depth-1" alt="First sample image">
                                        <div class="mask rgba-white-slight flex-center">
                                            <p></p>
                                        </div>
                                    </div>
                            
                                </div>
                                
                             <div class="col-xl-6 mt-5 mb-4 pr-5 clearfix d-none d-md-block">
                                
                                    <!--Featured image-->
                                    <div class="view overlay pb-3">
                                        <img src="resources/images/mainimg/drug.jpg" class="img-fluid z-depth-1" alt="First sample image">
                                        <div class="mask rgba-white-slight flex-center">
                                            <p></p>
                                        </div>
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
             <li class="nav-item dropdown mega-dropdown">
                <a class="nav-link dropdown" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 30px;color: black; font-family: 'Do Hyeon', sans-serif !important;"> 의료 센터 </a>
                <div class="dropdown-menu mega-menu row z-depth-1" aria-labelledby="navbarDropdownMenuLink">
                    <div class="row">
                        <div class="col-md-5 col-xl-3 sub-menu mt-5 mb-5 pl-4">
                            <ol class="list-unstyled mx-4 dark-grey-text">
                            	<li class="sub-title text-uppercase mt-sm"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"  onclick="window.location='achospitalSeach?state=1'" >병원 예약</a></li>
                                <li class="sub-title text-uppercase mt-sm"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;" onclick="window.location='hospitalSeach'">병원 검색</a></li>
                                <li class="sub-title text-uppercase"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"   onclick="window.location='hospitalSeach'">약국 검색</a></li>
                            
                            </ol>
                        </div>
                    
                            
                          <div class="col-md-7 col-xl-9">
                            <div class="row">
                                <div class="col-xl-6 mt-5 mb-4 pr-5 clearfix d-none d-md-block">
                                    <div class="view overlay pb-3">
                                        <img src="resources/images/mainimg/hos5.jpg" class="img-fluid z-depth-1" alt="First sample image">
                                        <div class="mask rgba-white-slight flex-center">
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                                
                             <div class="col-xl-6 mt-5 mb-4 pr-5 clearfix d-none d-md-block">
                                    <div class="view overlay pb-3">
                                        <img src="resources/images/mainimg/drugstore3.jpg" class="img-fluid z-depth-1" alt="First sample image">
                                        <div class="mask rgba-white-slight flex-center">
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                          
                          
                     
                        
                    </div>
                </div>
            </li>
              <li class="nav-item dropdown mega-dropdown">
                <a class="nav-link dropdown" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 30px;color: black; font-family: 'Do Hyeon', sans-serif !important;">보건 정보 </a>
                <div class="dropdown-menu mega-menu row z-depth-1" aria-labelledby="navbarDropdownMenuLink">
                    <div class="row">
                        <div class="col-md-5 col-xl-3 sub-menu mt-5 mb-5 pl-4">
                            <ol class="list-unstyled mx-4 dark-grey-text">
                                <li class="sub-title text-uppercase mt-sm"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"    onclick="window.location='foodPoisoning'">날씨(보건기상지수)</a></li>
                                <li class="sub-title text-uppercase"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"   onclick="window.location='cdiseaseList'">질병목록</a></li>
                               <li class="sub-title text-uppercase"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"   onclick="window.location='simpleTreat'">간단진료</a></li>
                           <li class="sub-title text-uppercase"><a class="menu-item"  style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"  onclick="window.location='drugSeach'">약검색</a></li>
                            
                            </ol>
                        </div>
                           <div class="col-md-7 col-xl-9">
                            <div class="row">
                                <div class="col-xl-6 mt-5 mb-4 pr-5 clearfix d-none d-md-block">
                                    <div class="view overlay pb-3">
                                        <img src="resources/images/mainimg/doctor3.jpg" class="img-fluid z-depth-1" alt="First sample image">
                                        <div class="mask rgba-white-slight flex-center">
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                   			  <div class="col-xl-6 mt-5 mb-4 pr-5 clearfix d-none d-md-block">
                                    <div class="view overlay pb-3">
                                        <img src="resources/images/mainimg/drugquestion.jpg" class="img-fluid z-depth-1" alt="First sample image">
                                        <div class="mask rgba-white-slight flex-center">
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                     
                            </div>
                        </div>
                    </div>
                </div>
            </li>  <li class="nav-item dropdown mega-dropdown">
                <a class="nav-link dropdown" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 30px;color: black; font-family: 'Do Hyeon', sans-serif !important;">헬스 케어</a>
                <div class="dropdown-menu mega-menu row z-depth-1" aria-labelledby="navbarDropdownMenuLink">
                    <div class="row">
                        <div class="col-md-5 col-xl-3 sub-menu mt-5 mb-5 pl-4">
                            <ol class="list-unstyled mx-4 dark-grey-text">
                                <li class="sub-title text-uppercase mt-sm"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"   onclick="window.location='exerciseInfoList'">운동정보</a></li>
                                <li class="sub-title text-uppercase"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"   onclick="personalCare()">개인건강관리</a></li>
                                <c:if test="${sessionScope.memberState == 1 }">
                                <li class="sub-title text-uppercase"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"   onclick="myFoodList()">나만의 음식목록</a></li>
                                </c:if>
                            </ol>
                        </div>
                        <div class="col-md-7 col-xl-9">
                            <div class="row">
                                <div class="col-xl-6 mt-5 mb-4 pr-5 clearfix d-none d-md-block">
                                    <div class="view overlay pb-3">
                                        <img src="resources/images/mainimg/working.jpg" class="img-fluid z-depth-1" alt="First sample image">
                                        <div class="mask rgba-white-slight flex-center">
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                   			  <div class="col-xl-6 mt-5 mb-4 pr-5 clearfix d-none d-md-block">
                                    <div class="view overlay pb-3">
                                        <img src="resources/images/mainimg/fru.jpg" class="img-fluid z-depth-1" alt="First sample image">
                                        <div class="mask rgba-white-slight flex-center">
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                     
                            </div>
                        </div>
                    </div>
                </div>
            </li>
             <li class="nav-item dropdown mega-dropdown">
                <a class="nav-link dropdown" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 30px;color: black; font-family: 'Do Hyeon', sans-serif !important;">질문게시판 </a>
                <div class="dropdown-menu mega-menu row z-depth-1" aria-labelledby="navbarDropdownMenuLink">
                    <div class="row">
                        <div class="col-md-5 col-xl-3 sub-menu mt-5 mb-5 pl-4">
                            <ol class="list-unstyled mx-4 dark-grey-text">
                            
                                <li class="sub-title text-uppercase"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;" onclick="window.location='boardList'">질문게시판 </a></li>
                                
                            
                            </ol>
                        </div>
                        <div class="col-md-7 col-xl-9">
                            <div class="row">
                                <div class="col-xl-6 mt-5 mb-4 pr-5 clearfix d-none d-md-block">
                                    <div class="view overlay pb-3">
                                        <img src="resources/images/mainimg/pain.jpg" class="img-fluid z-depth-1" alt="First sample image">
                                        <div class="mask rgba-white-slight flex-center">
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                   			  <div class="col-xl-6 mt-5 mb-4 pr-5 clearfix d-none d-md-block">
                                    <div class="view overlay pb-3">
                                        <img src="resources/images/mainimg/pain2.jpg" class="img-fluid z-depth-1" alt="First sample image">
                                        <div class="mask rgba-white-slight flex-center">
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                     
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li class="nav-item dropdown mega-dropdown">
                <a class="nav-link dropdown" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 30px;color: black; font-family: 'Do Hyeon', sans-serif !important;">고객센터 </a>
                <div class="dropdown-menu mega-menu row z-depth-1" aria-labelledby="navbarDropdownMenuLink">
                    <div class="row">
                        <div class="col-md-5 col-xl-3 sub-menu mt-5 mb-5 pl-4">
                            <ol class="list-unstyled mx-4 dark-grey-text">
                            	<li class="sub-title text-uppercase mt-sm"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"   onclick="window.location='reportBoardList'">고객센터</a></li>
                            </ol>
                        </div>
                        <div class="col-md-7 col-xl-9">
                            <div class="row">
                                <div class="col-xl-6 mt-5 mb-4 pr-5 clearfix d-none d-md-block">
                                    <div class="view overlay pb-3">
                                        <img src="resources/images/mainimg/gogac2.png"  alt="First sample image" style="width: 500px;"> 
                                        <div class="mask rgba-white-slight flex-center">
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </li>
             <li class="nav-item dropdown mega-dropdown">
                <a class="nav-link dropdown" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 30px;color: black; font-family: 'Do Hyeon', sans-serif !important;">프로모션 </a>
                <div class="dropdown-menu mega-menu row z-depth-1" aria-labelledby="navbarDropdownMenuLink">
                    <div class="row">
                        <div class="col-md-5 col-xl-3 sub-menu mt-5 mb-5 pl-4">
                            <ol class="list-unstyled mx-4 dark-grey-text">
                            	<li class="sub-title text-uppercase mt-sm"><a class="menu-item" style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"   onclick="window.location='eventList'">프로모션  목록</a></li>
                                <c:if test="${sessionScope.memberState == 2 }">
                                <li class="sub-title text-uppercase mt-sm"><a class="menu-item"  style="font-size: 25px; font-family: 'Do Hyeon', sans-serif !important;"  onclick="window.location='eventRequest'">프로모션  신청</a></li>
							 	</c:if>	
                            </ol>
                        </div>
                            <div class="col-md-7 col-xl-9">
                            <div class="row">
                                <div class="col-xl-6 mt-5 mb-4 pr-5 clearfix d-none d-md-block">
                                    <div class="view overlay pb-3">
                                        <img src="resources/images/mainimg/event.png" class="img-fluid z-depth-1" alt="First sample image">
                                        <div class="mask rgba-white-slight flex-center">
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                   			  <div class="col-xl-6 mt-5 mb-4 pr-5 clearfix d-none d-md-block">
                                    <div class="view overlay pb-3">
                                        <img src="resources/images/mainimg/event2.jpg" class="img-fluid z-depth-1" alt="First sample image">
                                        <div class="mask rgba-white-slight flex-center">
                                            <p></p>
                                        </div>
                                    </div>
                                </div>
                     
                            </div>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
        <!-- Links -->

     

    </div>
    <!-- Collapsible content -->

</nav>
<!--/.Navbar-->

</div>
</div>

</html>