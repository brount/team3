<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp" %>
<html>
<head>
<title> 관리자 페이지 - 광고관리</title>
</head>
<body>
	<div id="wrapper">

	   <jsp:include page="./admin_nav.jsp"></jsp:include>
	
	    <div id="page-wrapper">
	        <div class="row">
	            <div class="col-lg-12">	
	                <h1 class="page-header">광고관리</h1>		<!-- 페이지 제목 -->
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
                                    <select class="btn btn-default btn-xs dropdown-toggle">
						 				<option value="#">게시중</option>
						 				<option value="#">승인대기</option>
						 			</select>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" onclick="eventDelCheck();">
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
		                                        	<th><input type="checkBox"></th>
		                                            <th>광고번호</th>
		                                            <th>의사회원번호</th>
		                                            <th>병원명</th>
		                                            <th>광고명</th>
		                                            <th>신청일</th>
		                                            <th>등록기간</th>
		                                            <th>광고종류</th>
													<th>게시여부</th>
		                                        </tr>
	                                        </thead>
	                                        <tbody>
	                                        
	                                        <c:if test="${cnt > 0}">
	                                        
												<c:forEach var="dto" items="${dtos}">
													<tr>
													
														<td> <input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
														<input type="checkbox" name="checkOne" value="${dto.advertisementNo}"> </td>
													    <td onclick="window.location='eventModify?&advertisementNo=${dto.advertisementNo}&pageNum=${pageNum}&number=${number+1}'">${dto.advertisementNo}</td>
														<td onclick="window.location='eventModify?&advertisementNo=${dto.advertisementNo}&pageNum=${pageNum}&number=${number+1}'">${dto.doctorno}</td>
														<td onclick="window.location='eventModify?&advertisementNo=${dto.advertisementNo}&pageNum=${pageNum}&number=${number+1}'">${dto.advertisementThumbnail}</td>
														<td onclick="window.location='eventModify?&advertisementNo=${dto.advertisementNo}&pageNum=${pageNum}&number=${number+1}'">${dto.advertisementTitle}</td>
														<td onclick="window.location='eventModify?&advertisementNo=${dto.advertisementNo}&pageNum=${pageNum}&number=${number+1}'">${dto.advertisementRegDate}</td>
														<td onclick="window.location='eventModify?&advertisementNo=${dto.advertisementNo}&pageNum=${pageNum}&number=${number+1}'">${dto.advertisementStart} ~ ${dto.advertisementEnd} </td>
														<td onclick="window.location='eventModify?&advertisementNo=${dto.advertisementNo}&pageNum=${pageNum}&number=${number+1}'">${dto.advertisementKind}</td>
														<td onclick="window.location='eventModify?&advertisementNo=${dto.advertisementNo}&pageNum=${pageNum}&number=${number+1}'">${dto.advertisementState}</td>
		                                        	</tr>
		                                       	</c:forEach>
		                                       </c:if>
	                                        </tbody>
	                                    </table>
	                                    
	                                   <!-- 페이지 컨트롤 -->
										<table align="center">
											<tr>
												<th align="center">
													<c:if test="${cnt > 0}">
														<!-- 맨끝[◀◀] / 이전[◀] -->
														<c:if test="${startPage > pageBlock}">
															<a href="eventRequestList">[맨앞]</a>
															<a href="eventRequestList?pageNum=${startPage - pageBlock}">[이전]</a>
														</c:if>
									
														<c:forEach var="i" begin="${startPage}" end="${endPage}">
															<c:if test="${i == currentPage}">
																<span><b>[${i}]</b></span>
															</c:if>
															<c:if test="${i != currentPage}">
																<a href="eventRequestList?pageNum=${i}">[${i}]</a>
															</c:if>
														</c:forEach>
														
														<!-- 맨끝[▶▶] / 다음▶] -->
														<c:if test="${pageCount > endPage}">
															<a href="eventRequestList?pageNum=${startPage + pageBlock}">[다음]</a>
															<a href="eventRequestList?pageNum=${pageCount}">[맨뒤]</a>
														</c:if>
													</c:if>
												</th>
											</tr>
										</table>
	                                    <table align="center">
                                  			<tr>
                                       			<td>
	                                        		<select class="input" name="btn btn-default btn-xs dropdown-toggle onchange=">
								 						<option value="#">병원명</option>
								 						<option value="#">광고명</option>
								 						<option value="#">등록기간</option>
								 					</select>
							 					</td>
							 					<td>
							 						<input type="search" id="search">
							 					</td>
							 					<td>
							 						<input type="button" value="검색">
							 					</td>
						 					</tr>
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