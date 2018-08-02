<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../admin_setting.jsp" %>
<html>
<head>
<title> 관리자 페이지 - 정보관리</title>
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
	                	<h1 class="page-header">예방정보수정</h1>		<!-- 페이지 제목 -->
	            	</div>
	            	<!-- col-lg-12 -->
	            	
							<div class="panel-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <form role="form" action="apreventionList">
                                            
                                            <div class="form-group">
                                                <label>국가번호</label>
                                                <select class="form-control">
                                                    <option>+82 대한민국</option>
                                                    <option>+01 미국</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>예방접종종류</label>
                                                <select class="form-control">
                                                    <option>파상풍</option>
                                                    <option>자궁경부암예방주사</option>
                                                </select>
                                            </div>
                                            
                                            <div class="form-group input-group">
                                            	<label>질병등록번호</label>
                                                <input type="text" class="form-control"> 	<!-- 검색창 -->
                                            </div>
                                            
                                            <div class="form-group">
                                                <label>내용</label>
                                                <textarea class="form-control" rows="3"></textarea>
                                            </div>
                                            
	                                        <button type="submit" class="btn btn-default">수정</button>
                                            <button type="reset" class="btn btn-default" onclick="window.location='apreventionList'">취소</button>
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