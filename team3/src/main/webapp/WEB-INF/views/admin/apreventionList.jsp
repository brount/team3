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
	
	    <div id="page-wrapper">
	        <div class="row">
	            <div class="col-lg-12">	
	                <h1 class="page-header">정보관리 - 예방정보목록</h1>		<!-- 페이지 제목 -->
	            </div>
	            <!-- /.col-lg-12 -->
	        </div>
	        <!-- /.row -->
	        <div class="row">
	            <div class="col-lg-8">
	                <!-- /.panel -->
	                <div class="panel panel-default">
	                    <div class="panel-heading">
	                        <div class="pull-right">
	                            <div class="btn-group">
                                    <button type="button" onclick="window.location='apreventionAdd?pageNum=${pageNum}'">
                                    	추가
                                    </button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" onclick="preventiondeleteCheck()">
                                    	삭제
                                    </button>
	                            </div>
	                        </div>
	                    </div>
	                    <!-- /.panel-heading -->
	                    <div class="panel-body">
	                        <div class="row">
	                            <div class="col-lg-4">
	                                <div class="table-responsive">
	                                    <table class="table table-bordered table-hover table-striped">
	                                        <thead>
		                                        <tr>
		                                        	<th>전체선택&nbsp;<input type="checkbox" name="checkAll" id="checkAll"></th>
		                                            <th>예방등록번호</th>
		                                            <th>예방접종명</th>
		                                            <th>질병명</th>
		                                            <th>국가번호</th>
													<th>질병코드</th>
		                                            <th>접종목적</th>
		                                        </tr>
	                                        </thead>
	                                        <tbody>
		                                        <c:if test="${cnt > 0}">
													<c:forEach var="dto" items="${dtos}">
														<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
														<tr >
															<td class="center">
															<input type="checkbox" name="checkOne" value="${dto.preventionCode}"></td>
															<td onclick="window.location='apreventionModify?preventionCode=${dto.preventionCode}&pageNum=${pageNum}&number=${number+1}'">${dto.preventionCode}</td>
															<td onclick="window.location='apreventionModify?preventionCode=${dto.preventionCode}&pageNum=${pageNum}&number=${number+1}'">${dto.preventionKind}</td>
															<td onclick="window.location='apreventionModify?preventionCode=${dto.preventionCode}&pageNum=${pageNum}&number=${number+1}'">${dto.diseaseName}</td>
															<td onclick="window.location='apreventionModify?preventionCode=${dto.preventionCode}&pageNum=${pageNum}&number=${number+1}'">${dto.countryCode}</td>
															<td onclick="window.location='apreventionModify?preventionCode=${dto.preventionCode}&pageNum=${pageNum}&number=${number+1}'">${dto.diseaseCode}</td>
															<td onclick="window.location='apreventionModify?preventionCode=${dto.preventionCode}&pageNum=${pageNum}&number=${number+1}'">${dto.preventionContent}</td>
	                                 		        	</tr>
		                                       		</c:forEach>
		                                    	</c:if>
	                                    	</tbody>
	                                    </table>
	                                    
	                                    <!-- 페이지 컨트롤 -->
										<table align="center">
											<tr>
												<th align="center"><c:if test="${cnt > 0}">
														<!-- 맨끝[◀◀] / 이전[◀] -->
														<c:if test="${startPage > pageBlock}">
															<a href="apreventionList">[맨앞]</a>
															<a href="apreventionList?pageNum=${startPage - pageBlock}">[이전]</a>
														</c:if>

														<c:forEach var="i" begin="${startPage}" end="${endPage}">
															<c:if test="${i == currentPage}">
																<span><b>[${i}]</b></span>
															</c:if>
															<c:if test="${i != currentPage}">
																<a href="apreventionList?pageNum=${i}">[${i}]</a>
															</c:if>
														</c:forEach>

														<!-- 맨끝[▶▶] / 다음▶] -->
														<c:if test="${pageCount > endPage}">
															<a href="apreventionList?pageNum=${startPage + pageBlock}">[다음]</a>
															<a href="apreventionList?pageNum=${pageCount}">[맨뒤]</a>
														</c:if>
													</c:if></th>
											</tr>
										</table>

										<table align="center">
											<form action="apreventionSearchList" class="search_box" method="post">
												<tr>
													<td>
														<select class="input" name="sc">
															<option value="0">예방접종명</option>
								 							<option value="1">국가번호</option>
															<option value="2">질병명</option>
														</select>
													</td>
													<td>
														<input type="text" id="search" name="search">
													</td>
													<td>
														<input type="submit" value="검색">
													</td>
												</tr>
											</form>
										</table>
	                                </div>
	                                <!-- /.table-responsive -->
	                            </div>
	                        </div>					
	                        <!-- /.row -->
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