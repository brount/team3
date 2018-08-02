<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp" %>
<html>
<head>
<title> 관리자 페이지 - 병원관리</title>
</head>
<body>
	<div id="wrapper">

	    <jsp:include page="./admin_nav.jsp"></jsp:include>
	
			<!-- section -->
	    	<div id="page-wrapper">
	    		<!-- /.row -->
	        	<div class="row">
	        		<!-- col-lg-12 -->
	            	<div class="col-lg-12">	
	                	<h1 class="page-header">병원수정</h1>		<!-- 페이지 제목 -->
	            	</div>
	            	<!-- col-lg-12 -->
	            	
							<div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <form role="form" action="hospitalList">
                                      		<!-- 검색 -->
                                            <div class="form-group input-group">
                                            	<label>병원명</label>
                                                <input type="text" class="form-control"> 	<!-- 검색창 -->
                                                
                                                <span class="input-group-btn" style="top:13px">
                                                    <button class="btn btn-default" type="button" style="padding-bottom:9px; padding-top:9px'"><i class="fa fa-search"></i> <!-- 검색버튼 -->
                                                    </button>
                                                </span>
                                            </div>
                                            <!-- 검색 -->
                                            
                                            <div class="form-group input-group">
                                           		<label>주소</label><br>
									 				<input class="form-control" style="width:150px" type="text" id="postcode" name="u_postcode" placeholder="우편번호">&nbsp;&nbsp;&nbsp;
													<input class="btn btn-default" type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
													<input class="form-control" type="text" id="roadAddress" name="u_roadAddress" placeholder="도로명주소">
													<input class="form-control" type="text" id="jibunAddress" name="u_jibunAddress" placeholder="지번주소">
													<input class="form-control" type="text" id="detailAddress" name="u_detailAddress" placeholder="나머지주소">
													<span id="guide" style="color:#999"></span>
													<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
                                            </div>
                                      		
                                      		<div class="form-group input-group">
                                      			<label>병원연락처</label><br>
                                      			<input class="form-control" type="text" name="hospitalphone1" style="width:100px">
                                      			 - 
                                      			<input class="form-control" type="text" name="hospitalphone2" style="width:100px">	
                                      			 - 
                                      			<input class="form-control" type="text" name="hospitalphone3" style="width:100px">
                                      		</div>
                                      		
                                      		<div class="form-group input-group">
	                                      		<label>진료시간</label>
	                                            <input type="text" class="form-control">
	                                        </div>
	                                        
	                                        <div>
	                                      		<label>휴무일</label>
	                                            <input type="text" class="form-control">
	                                        </div>
	                                        
	                                        <div class="form-group">
                                                <label>소개글</label>
                                                <textarea class="form-control" rows="3"></textarea>
                                            </div>
	                                        
	                                        <button type="submit" class="btn btn-default" >수정</button>
                                            <button type="reset" class="btn btn-default" onclick="window.location='hospitalList'">취소</button>
                                        </form>
                                    </div>
                                    <!-- /.col-lg-6 (nested) -->
                                </div>
                                <!-- /.row (nested) -->
                            </div>
                            <!-- /.panel-body -->
															 
	    		</div>
	    		<!-- /.row -->
			</div>
			<!-- section -->
		</div>
	<!-- /#wrapper -->
    </body>
</html>