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
	                	<h1 class="page-header">예방정보추가</h1>		<!-- 페이지 제목 -->
	            	</div>
	            	<!-- col-lg-12 -->
	            	
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-6">
								<form role="form" action="apreventionList">
									<input type="hidden" name="pageNum" value="${pageNum}">
				
									<div class="form-group input-group">
										<label>국가 코드</label>
										<input type="text" class="form-control" name="countryCode"> 
									</div>
									    
									<div class="form-group input-group">
										<label>예방접종 종류</label>
										<input type="text" class="form-control" name="preventionKind"> 
									</div>
									    
									<div class="form-group input-group">
										<label>질병선택</label>
										<select class="input" name="diseaseCode">
											<c:forEach var="dto" items="${dtos}">
												<option value="${dto.diseaseCode}">${dto.diseaseName}</option>
											</c:forEach>
										</select>
									</div>
									                               
									<div class="form-group input-group">
										<label>접종목적</label>
										<textarea class="form-control" rows="3" name="preventionContent"></textarea>
									</div>
									
									<button type="submit" class="btn btn-default">등록</button>
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