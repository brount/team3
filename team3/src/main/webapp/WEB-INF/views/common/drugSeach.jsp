<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="/medical/resources/common/css/drugSeach.css" rel="stylesheet">
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<html lang="en">
<title> 사이트 이름 </title>
<body>
	<header>
	<%@ include file="../common/header.jsp" %>
	</header>
	
	<section>
		<script src="/medical/resources/common/js/drugSeach.js"></script>
		<div class="container">
		    <div class="row">
		        <div class="col-sm-3 col-md-3">
		            <div class="panel-group" id="accordion">
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">날씨(보건기상지수)</a>
		                        </h4>
		                    </div>
		                    <div id="collapseOne" class="panel-collapse collapse in collapse show">
		                        <div class="panel-body">
		                            <table class="table">
		                                <tr>
		                                    <td>
		                                       <a href="#">자외선지수</a>
		                                    </td>
		                                </tr>
		                                <tr>
		                                    <td>
		                                        <a href="#">식중독지수</a>
		                                    </td>
		                                </tr>
		                            </table>
		                        </div>
		                    </div>
		                </div>
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a href="cpreventionList">예방정보</a>
		                        </h4>
		                    </div>
		                </div>
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a href="diseaseTop">10대질병</a>
		                        </h4>
		                    </div>
		                </div>
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a href="simpleTreat">간단진료</a>
		                        </h4>
		                    </div>
		                </div>
		                <div class="panel panel-default">
		                    <div class="panel-heading">
		                        <h4 class="panel-title">
		                            <a href="drugSeach">약검색</a>
		                        </h4>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <div class="col-sm-9 col-md-9">
		            <div class="well">
		            	<div class="medicine_search_wrap active">
							<div class="medicine_search">
								<form name="medicineNameSearchForm" action="/medicineSearch.nhn" method="get" id="medicineNameSearchForm">
								<input type="hidden" name="mode" value="nameSearch">
								<label for="medicine_name" class="label_search"><strong>약 정보</strong>로 검색</label>
								<input name="query" type="text" placeholder="약 이름 또는 성분 등으로 검색해 보세요." value="약 이름 또는 성분 등으로 검색해 보세요." id="ip_txt" class="input_search">
								<input type="submit" value="검색" class="btn_cont_search" id="nameSearchBtn">
								</form>
							</div>
							<div class="medicine_search_detail">
								<form name="medicineExteriorSearchForm" action="/medicineSearch.nhn" method="get" id="medicineExteriorSearchForm">
									<input type="hidden" name="mode" value="exteriorSearch">
									<input type="hidden" name="shape" value="">
									<input type="hidden" name="color" value="">
									<input type="hidden" name="dosageForm" value="">
									<input type="hidden" name="divisionLine" value="">
									<div class="dsc_mdcn">
										<div class="slide_mdcn">
											<div class="mdcn_shape inner_mdcn" id="slide_shape">
											<!-- [D] 리스트 클릭 추가 클래스 on -->
												<div class="item_mdcn on"><a href="javascript:void(0)" class="all">모양<br>전체</a></div>
												<div class="item_mdcn" data-displayname="1"><a href="javascript:void(0)" class="shape"><span>원형</span></a></div>
												<div class="item_mdcn" data-displayname="2"><a href="javascript:void(0)" class="shape2"><span>타원형</span></a></div>
												<div class="item_mdcn" data-displayname="3"><a href="javascript:void(0)" class="shape3"><span>반원형</span></a></div>
												<div class="item_mdcn" data-displayname="4"><a href="javascript:void(0)" class="shape4"><span>삼각형</span></a></div>
												<div class="item_mdcn" data-displayname="5"><a href="javascript:void(0)" class="shape5"><span>사각형</span></a></div>
												<div class="item_mdcn" data-displayname="6"><a href="javascript:void(0)" class="shape6"><span>마름모형</span></a></div>
												<div class="item_mdcn" data-displayname="7"><a href="javascript:void(0)" class="shape7"><span>장방형</span></a></div>
												<div class="item_mdcn" data-displayname="8"><a href="javascript:void(0)" class="shape8"><span>오각형</span></a></div>
												<div class="item_mdcn" data-displayname="9"><a href="javascript:void(0)" class="shape9"><span>육각형</span></a></div>
												<div class="item_mdcn" data-displayname="10"><a href="javascript:void(0)" class="shape10"><span>팔각형</span></a></div>
												<div class="item_mdcn" data-displayname="99"><a href="javascript:void(0)" class="shape11"><span>기타</span></a></div>
												</div>
											<a href="javascript:void(0)" class="btn_page type1 prev"><span class="blind">이전</span></a>
											<a href="javascript:void(0)" class="btn_page type1 next"><span class="blind">다음</span></a>
										</div>
										<div class="slide_mdcn">
											<div class="mdcn_color inner_mdcn" id="slide_color">
												<div class="item_mdcn on"><a href="javascript:void(0)" class="all">색상<br>전체</a></div>
												<div class="item_mdcn" data-displayname="16384"><a href="javascript:void(0)" ><span class="color"></span>하양</a></div>
												<div class="item_mdcn" data-displayname="8"><a href="javascript:void(0)" ><span class="color2"></span>노랑</a></div>
												<div class="item_mdcn" data-displayname="512"><a href="javascript:void(0)" ><span class="color3"></span>주황</a></div>
												<div class="item_mdcn" data-displayname="32"><a href="javascript:void(0)" ><span class="color4"></span>분홍</a></div>
												<div class="item_mdcn" data-displayname="64"><a href="javascript:void(0)" ><span class="color5"></span>빨강</a></div>
												<div class="item_mdcn" data-displayname="1"><a href="javascript:void(0)" ><span class="color6"></span>갈색</a></div>
												<div class="item_mdcn" data-displayname="128"><a href="javascript:void(0)" ><span class="color7"></span>연두</a></div>
												<div class="item_mdcn" data-displayname="2048"><a href="javascript:void(0)" ><span class="color8"></span>초록</a></div>
												<div class="item_mdcn" data-displayname="1024"><a href="javascript:void(0)" ><span class="color9"></span>청록</a></div>
												<div class="item_mdcn" data-displayname="8196"><a href="javascript:void(0)" ><span class="color10"></span>파랑</a></div>
												<div class="item_mdcn" data-displayname="4"><a href="javascript:void(0)" ><span class="color11"></span>남색</a></div>
												<div class="item_mdcn" data-displayname="256"><a href="javascript:void(0)" ><span class="color12"></span>자주</a></div>
												<div class="item_mdcn" data-displayname="16"><a href="javascript:void(0)" ><span class="color13"></span>보라</a></div>
												<div class="item_mdcn" data-displayname="32768"><a href="javascript:void(0)" ><span class="color14"></span>회색</a></div>
												<div class="item_mdcn" data-displayname="2"><a href="javascript:void(0)" ><span class="color15"></span>검정</a></div>
												<div class="item_mdcn" data-displayname="4096"><a href="javascript:void(0)" ><span class="color16"></span>투명</a></div>
												</div>
											<a href="javascript:void(0)" class="btn_page type2 prev"><span class="blind">이전</span></a>
											<a href="javascript:void(0)" class="btn_page type2 next"><span class="blind">다음</span></a>
										</div>
										<div class="slide_mdcn">
											<div  class="mdcn_hoof">
												<div class="item_mdcn on"><a href="javascript:void(0)" class="all">제형<br>전체</a></div>
												<div class="item_mdcn" data-displayname="1"><a href="javascript:void(0)" class="hoof"><span>정제류</span></a></div>
												<div class="item_mdcn" data-displayname="2"><a href="javascript:void(0)" class="hoof2"><span>경질캡슐</span></a></div>
												<div class="item_mdcn" data-displayname="3"><a href="javascript:void(0)" class="hoof3"><span>연질캡슐</span></a></div>
												</div >
										</div>
										<div class="slide_mdcn">
											<div class="mdcn_costula">
												<div class="item_mdcn on"><a href="javascript:void(0)" class="all">분할선<br>전체</a></div>
												<div class="item_mdcn" data-displayname="8"><a href="javascript:void(0)" class="costula"><span>없음</span></a></div>
												<div class="item_mdcn" data-displayname="2"><a href="javascript:void(0)" class="costula2"><span>(-)형</span></a></div>
												<div class="item_mdcn" data-displayname="1"><a href="javascript:void(0)" class="costula3"><span>(+)형</span></a></div>
												<div class="item_mdcn" data-displayname="4"><a href="javascript:void(0)" class="costula4"><span>기타</span></a></div>
												</div>
										</div>
									</div>
									<div class="btn_area">
										<a href="javascript:void(0);" role="button" class="btn_pill_search" id="exteriorSearchBtn">검색</a>
										<a href="javascript:void(0);" role="button" class="btn_reset" id="exteriorSearchResetBtn">초기화</a>
									</div>
								</form>
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