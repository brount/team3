<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	                	<h1 class="page-header">약 수정</h1>		<!-- 페이지 제목 -->
	            	</div>
	            	<!-- col-lg-12 -->
	            	
								<div class="panel-body">
	                                <div class="row">
	                                    <div class="col-lg-6">
											<form role="form" action="drugList">
											<input type="hidden" name="drugCode" value="${dto.drugCode}">
												<div class="form-group input-group">
													<label>약이름</label>
													<input type="text" class="form-control" name="drugName" value="${dto.drugName}" readonly>
												</div>
												
												<div class="form-group input-group">
													<label>업체명</label>
													<input type="text" class="form-control" name="drugCompany" value="${dto.drugCompany}" readonly>
												</div>
												
												<div class="form-group input-group">
													<label>약효분류코드</label>
													<input type="text" class="form-control" name="drugGroupCode" value="${dto.drugGroupCode}" readonly>
												</div>
												
												<div class="form-group input-group">
													<label>전문/일반</label>
													<input type="text" class="form-control" name="pro_Usual" value="${dto.pro_Usual}" readonly>
												</div>
												
												<div class="form-group input-group">
													<label>저장방법</label>
													<textarea class="form-control" rows="3" name="drugStorageMethod">${dto.drugStorageMethod}</textarea>
												</div>
												
												<div class="form-group input-group">
													<label>효능 효과</label>
													<textarea class="form-control" rows="3" name="drugEfficacy">${dto.drugEfficacy}</textarea>
												</div>
												
												<div class="form-group input-group">
													<label>용법용량</label>
													<textarea class="form-control" rows="3" name="drugUsedCapacity">${dto.drugUsedCapacity}</textarea>
												</div>
												<div class="form-group input-group">
													<label>주의사항</label>
													<textarea class="form-control" rows="3" name="drugPrecautions">${dto.drugPrecautions}</textarea>
												</div>
												
											    <div class="form-group input-group">
													<button type="submit" class="btn btn-default">수정</button>
													<button type="reset" class="btn btn-default" onclick="window.location='drugList'">취소</button>
												</div>
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