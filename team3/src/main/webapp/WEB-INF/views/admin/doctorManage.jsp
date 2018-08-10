<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp"%>
<html>
<head>
<title>관리자 페이지 - 의사회원관리</title>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="./admin_nav.jsp"></jsp:include>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">회원관리 - 의사회원 상세정보</h1>
					<!-- 페이지 제목 -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-lg-8">
					<!-- /.panel -->
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-6">
									<form role="form" action="membersanctionManagePro" name="manageForm" onsubmit="return sanctionChk()">
										<input type="hidden" name="pageNum" value="${pageNum}">
										<div class="form-group input-group">
											<label>회원번호</label> 
											<input type="text" class="form-control" id="doctorno" name="doctorno" value="${dto.doctorno}" readonly >
										</div>
										
										<div class="form-group input-group">
											<label>소속병원</label> 
											<input type="text" class="form-control" id="hospitalname" name="hospitalname" value="${dto2.hospitalname}" readonly >
										</div>
										
										<div class="form-group input-group">
											<label>회원명</label> 
											<input type="text" class="form-control" id="doctorname" name="doctorname" value="${dto.doctorname}" readonly >
										</div>

										<div class="form-group input-group">
											<label>회원ID</label>
											<input type="text" class="form-control" id="doctorid" name="doctorid" value="${dto.doctorid}" readonly >
										</div>
										
										<div class="form-group input-group">
											<label>의사 자격증</label>
											<img src="/medical/resources/images/licence/${dto.licence}" width="250px" height="190px" onerror="this.src='/medical/resources/images/dachaimg.jpg'">
										</div>
										
										<c:if test="${dto.doctorappro != 0}">
											<div class="form-group input-group">
												<select id="doctorappro" name="doctorappro">
													<option value="1">---</option>
													<option value="3">제명</option>
												</select>
											</div>
																						
											<div class="form-group input-group">
												<label>제제사유</label>
												<select id="sanctions" name="sanctions">
													<option value="#">---</option>
													<option value="0">음란</option>
													<option value="1">욕설/비방</option>
													<option value="2">도배</option>
													<option value="3">광고/홍보</option>
													<option value="4">허위정보</option>
												</select>
											</div>
											<button type="submit" class="btn btn-default">등록</button>
										</c:if>
										
										<c:if test="${dto.doctorappro == 0}">
											<button type="submit" class="btn btn-default">승인</button>
										</c:if>
										<button type="reset" class="btn btn-default" onclick="window.history.back(-1)">취소</button>
										
									</form>
								</div>
								<!-- /.col-lg-6 (nested) -->
							</div>
							<!-- /.row (nested) -->
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-4 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->



</body>
</html>