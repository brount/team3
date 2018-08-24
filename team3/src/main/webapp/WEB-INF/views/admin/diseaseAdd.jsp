<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp"%>
<html>
<head>
<title>관리자 페이지 - 정보관리</title>
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
					<h1 class="page-header">질병정보추가</h1>
					<!-- 페이지 제목 -->
				</div>
				<!-- col-lg-12 -->

				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<form role="form" action="diseaseAddPro" onsubmit="return diseaseChk()" name="diseaseForm">
								<input type="hidden" name="pageNum" value="${pageNum}">
								<div class="form-group input-group">
									<label>병명</label> 
									<input type="text" class="form-control" name="diseaseName">
								</div>

								<div class="form-group">
									<label>정의</label>
									<textarea class="form-control" rows="3"	style="resize: none;"
										placeholder="'내용1','내용2',..." name="diseaseDefine"></textarea>
								</div>

								<div class="form-group">
									<label>원인</label>
									<textarea class="form-control" rows="3"	style="resize: none;"
										placeholder="'내용1','내용2',..." name="diseaseCause"></textarea>
								</div>

								<div class="form-group">
									<label>증상</label>
									<textarea class="form-control" rows="3"	style="resize: none;"
										placeholder="'내용1','내용2',..." name="diseaseSymptom"></textarea>
								</div>

								<div class="form-group">
									<label>자가진단</label>
									<textarea class="form-control" rows="3"	style="resize: none;"
										placeholder="'내용1','내용2',..." name="diseaseDiagnosis"></textarea>
								</div>

								<div class="form-group">
									<label>치료법</label>
									<textarea class="form-control" rows="3"	style="resize: none;"
										placeholder="'내용1','내용2',..." name="diseaseCure"></textarea>
								</div>

								<div class="form-group">
									<label>경과/합병증</label>
									<textarea class="form-control" rows="3"	style="resize: none;"
										placeholder="'내용1','내용2',..." name="complications"></textarea>
								</div>

								<div class="form-group">
									<label>예방법</label>
									<textarea class="form-control" rows="3"	style="resize: none;"
										placeholder="'내용1','내용2',..." name="prevention"></textarea>
								</div>

								<button type="submit" class="btn btn-default">등록</button>
								<button type="reset" class="btn btn-default"
									onclick="window.location='diseaseList'">취소</button>
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