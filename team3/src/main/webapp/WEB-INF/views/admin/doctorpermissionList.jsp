<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../admin_setting.jsp" %>
<html>
<head>
<title> 관리자 페이지 - 의사회원관리</title>
<body>
	<div id="wrapper">

	   <jsp:include page="./admin_nav.jsp"></jsp:include>
	
	    <div id="page-wrapper">
	        <div class="row">
	            <div class="col-lg-12">	
	                <h1 class="page-header">회원관리 - 의사회원 승인대기</h1>		<!-- 페이지 제목 -->
	            </div>
	            <!-- /.col-lg-12 -->
	        </div>
	        <!-- /.row -->
	        <div class="row">
	            <div class="col-lg-8">
	                <!-- /.panel -->
	                <div class="panel panel-default">
					<div class="panel-heading" style="background-color: #5b92cb78!important">
	                        <div class="pull-right">
	                            <div class="btn-group">
                                   	<input type="hidden" id="pageNum" name="pageNum" value="${pageNum}">
									<input type="hidden" id="pageDivision" name="pageDivision" value="per">
	                            	<select class="btn btn-default btn-xs dropdown-toggle" onchange="location.href=this.value">
	                            		<option value="doctorpermissionList">의사회원승인대기목록</option>
						 				<option value="doctorList">의사회원목록</option>
						 				<!-- <option value="doctorsanctionList">의사제제회원목록</option> -->
						 				<option value="doctorsecessionList">의사탈퇴회원목록</option>
						 			</select>
                                    <button type="button"class="btn btn-dark-blue" style="width: 50px; height:30px; margin-left:15px;" onclick="doctordeleteCheck();">
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
	                                    <table class="responstable">
	                                        <thead>
	                                        <tr>
	                                        	<th><input type="checkbox" name="checkAll" id="checkAll"></th>
	                                            <th>회원번호</th>			
	                                            <th>병원명</th>			
	                                            <th>회원ID</th>			
	                                            <th>회원명</th>			
	                                            <th>병원소재지</th>			
	                                            <th>병원연락처</th>			
	                                            <th>전문분야</th>			
												<th>포인트</th>			
	                                            <th>가입일</th>			
	                                        </tr>
	                                        </thead>
	                                        <tbody>
	                                        
	                                        <c:if test="${cnt > 0}">
												<c:set value="0" var="a"></c:set>
												<c:forEach var="dto" items="${dtos}">
													<tr>
														<td>
															<input type="checkbox" name="checkOne" value="${dto.doctorno}">
															<input style="display:none" type="checkbox" name="checkTwo" value="${dto.hospitalno}">
														</td>
													    <td onclick="window.location='doctorManage?&doctorid=${dto.doctorid}&pageNum=${pageNum}&number=${number+1}'">${dto.doctorno}</td>
														<td onclick="window.location='doctorManage?&doctorid=${dto.doctorid}&pageNum=${pageNum}&number=${number+1}'">${dtos2[a].hospitalname}</td>
														<td onclick="window.location='doctorManage?&doctorid=${dto.doctorid}&pageNum=${pageNum}&number=${number+1}'">${dto.doctorid}</td>
														<td onclick="window.location='doctorManage?&doctorid=${dto.doctorid}&pageNum=${pageNum}&number=${number+1}'">${dto.doctorname}</td>
														<td onclick="window.location='doctorManage?&doctorid=${dto.doctorid}&pageNum=${pageNum}&number=${number+1}'">${dtos2[a].hospitaladdr}</td>
														<td onclick="window.location='doctorManage?&doctorid=${dto.doctorid}&pageNum=${pageNum}&number=${number+1}'">${dtos2[a].hospitalphone}</td>
														<c:if test="${dto.doctorspecialism == 1}">
															<td onclick="window.location='doctorManage?&doctorid=${dto.doctorid}&pageNum=${pageNum}&number=${number+1}'">내과</td>
														</c:if>
														<c:if test="${dto.doctorspecialism == 2}">
															<td onclick="window.location='doctorManage?&doctorid=${dto.doctorid}&pageNum=${pageNum}&number=${number+1}'">이비인후과</td>
														</c:if>
														<c:if test="${dto.doctorspecialism == 3}">
															<td onclick="window.location='doctorManage?&doctorid=${dto.doctorid}&pageNum=${pageNum}&number=${number+1}'">정신의학과</td>
														</c:if>
														<c:if test="${dto.doctorspecialism == 4}">
															<td onclick="window.location='doctorManage?&doctorid=${dto.doctorid}&pageNum=${pageNum}&number=${number+1}'">외과</td>
														</c:if>
														<c:if test="${dto.doctorspecialism == 5}">
															<td onclick="window.location='doctorManage?&doctorid=${dto.doctorid}&pageNum=${pageNum}&number=${number+1}'">치과</td>
														</c:if>
														<td onclick="window.location='doctorManage?&doctorid=${dto.doctorid}&pageNum=${pageNum}&number=${number+1}'">${dto.point}</td>
														<td onclick="window.location='doctorManage?&doctorid=${dto.doctorid}&pageNum=${pageNum}&number=${number+1}'">${dto.doctorregstration}</td>
		                                        	</tr>
		                                        	<c:set var="a" value="${a+1 }"></c:set>
		                                       	</c:forEach>
		                                       </c:if>
	                                        </tbody>
	                                    </table>
	                                    <div class="pagination clearfix" style="display: table; margin: 0 auto;">
											<c:if test="${cnt>0}">
										<!-- 이전블록 -->
										 <c:if test="${startPage > pageBlock }">
											 <a href="doctorpermissionList"><<</a>
				                             <a href="doctorpermissionList?pageNum=${startPage -pageBlock}"><</a>
				                          </c:if>
				                          <!-- 페이지 블록 -->
				                          <c:forEach var="i" begin="${startPage }" end="${endPage }">
				                             <c:if test="${i == currentPage }">
				                                <strong>${i }</strong>
				                             </c:if>
				                             <c:if test="${i != currentPage }">
				                                <a href="doctorpermissionList?pageNum=${i}">${i }</a>
				                             </c:if>
				                          </c:forEach>
				                          <!-- 다음블록 -->
				                          <c:if test="${pageCount > endPage }">
				                             <a href="doctorpermissionList?pageNum=${startPage +pageBlock}">></a>
				                             	<a href="doctorpermissionList?pageNum=${pageCount}">>></a>
				                          </c:if>
				                       </c:if>
				                    </div>
	                               
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