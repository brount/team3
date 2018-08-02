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
	                	<h1 class="page-header">운동정보추가</h1>		<!-- 페이지 제목 -->
	            	</div>
	            	<!-- col-lg-12 -->
						<div class="panel-body">
                              <div class="row">
                                  <div class="col-lg-6">
									<form role="form" action="exerciseAddPro" name="exerciseForm" enctype="multipart/form-data" method="post">
										<input type="hidden" name="pageNum" value="${pageNum}">
										<div class="form-group input-group">
											<label>운동명</label>
											<input type="text" class="form-control" name="exerciseName"> 
										</div>
										
										<div class="form-group input-group">
											<label>이미지</label>
											<input class="input" type="file" name="exerciseImage" maxlength="1000" style="width: 270px">
										</div>
										
										<div class="form-group">
											<label>운동정의</label>
											<textarea class="form-control" rows="3" name="exerciseDefine"></textarea>
										</div>
										
										<div class="form-group">
											<label>운동방법</label>
											<textarea class="form-control" rows="3" name="exerciseMethod"></textarea>
										</div>
										 
										<div class="form-group">
											<label>운동부위</label>
											<textarea class="form-control" rows="3" name="exercisePart"></textarea>
										</div>
										 
										<div class="form-group">
											<label>주의할점</label>
											<textarea class="form-control" rows="3" name="exerciseCaution"></textarea>
										</div>
										                              
										<button type="submit" class="btn btn-default">등록</button>
										<button type="reset" class="btn btn-default" onclick="window.location='exerciseList'">취소</button>
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