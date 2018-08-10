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
                                        <form role="form" action="hospitalModifyPro" name="hosModifyForm" onsubmit="return hosModifyChk()">
                                        	<input type="hidden" name="pageNum" value="${pageNum}">
                                        	<div class="form-group input-group">
                                            	<label>병원번호</label><br>
                                                <input type="text" name="hospitalno" value="${dto.hospitalno}" readonly>
                                            </div>
                                            
                                        
                                            <div class="form-group input-group">
                                            	<label>병원명</label><br>
                                                <input type="text" name="hospitalname" value="${dto.hospitalname}">
                                                
                                            </div>
                                            
                                            <div class="form-group input-group">
                                           		<label>주소</label><br>
                                           		<input type="text" name="hospitaladdr" value="${dto.hospitaladdr}">
                                            </div>
                                            
                                            <div class="form-group input-group">
                                           		<label>병원번호</label><br>
                                           		<input type="text" name="hospitalphone" value="${dto.hospitalphone}">
                                            </div>
                                      		
	                                        
	                                        <div class="form-group">
                                                <label>소개글</label>
                                                <textarea class="form-control" rows="3" name="hospitalinstruction">${dto.hospitalinstruction}</textarea>
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