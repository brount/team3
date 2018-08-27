<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html class="no-js" lang="en">
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link href="/medical/resources/css/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

   <header>
      <%@ include file="../common/header.jsp"%>
   </header>
   
	<%@ include file="../common/line.jsp"%>

   <section>
      <div class="container">
         <div class="row">
            <div class="col-sm-3 col-md-3">
               <%@ include file="../common/menuCheckup.jsp"%>
            </div>
            <div class="col-sm-9 col-md-9">

               <div class="well">
                  <form class="form-horizontal" action="checkupRequest?reservationNo=${ReservDto.reservationNo}" method="post"
                     id="reg_form">

                     <fieldset>
                     <h3><small style="font-family: 'Do Hyeon', sans-serif; font-size: 25px;" >진료 예약 목록 ></small> 환자정보 <small style="font-family: 'Do Hyeon', sans-serif; font-size: 25px;" >> 검사의뢰서 등록</small></h3>
                     
                        
                        <div style="margin: 20px 20px;"></div>

                        <table class="responstable">
                           <tr>
                              <th>성명 </th>
                              <th>주민등록번호  </th>
		                      <th>연락처 </th>
		                      <th>이메일 주소 </th>
                           </tr>

                           <tr>
                              <td>${gusDto.guestname}</td>
                              <td>${jumin}-*******</td>
                              <td>${gusDto.guesttel}</td>
                              <td>${gusDto.guestemail}</td>
                           </tr>
                        </table>
                        <!-- Text input-->
                     </fieldset>
                     <br>
                     <br>
                     <table class="responstable">
                        <tr>
                           <th style="padding: 0px;">▣ 증상
                           <textarea name="checkup_opinion" readonly rows="5" cols="120"
                                 style="resize: none; width: 100%;color: black; text-align:center ">${ReservDto.symptom}</textarea>
                           </th>
                        </tr>
                     </table>
                     
                     <br>
                     <table class="responstable">
                        <tr>
                           <th style="padding: 0px;">▣체크된  증상
                       	</tr>
                       	<tr>
                       	<td style="border: 1px solid #a9a9a9; ">
                            <c:forEach var="symptomchk" items="${symptom1}">
                          <b>
                             <c:if test="${symptomchk=='head'}">두통</c:if><c:if test="${symptomchk == 'fever' }">발열</c:if>
                                 <c:if test="${symptomchk == 'cough' }">기침</c:if>
                                 <c:if test="${symptomchk == 'disgusted' }" >메스꺼움</c:if>
                                 <c:if test="${symptomchk == 'stomachache' }" >복통</c:if>
                                 <c:if  test="${symptomchk == 'vomit' }" >구토</c:if>
                                 <c:if test="${symptomchk == 'diarrhea' }" >설사</c:if>
                                 <c:if test="${symptomchk == 'musclepain' }" >근육통</c:if>
                                  <c:if test="${symptomchk == 'sorethroat' }" >인후통</c:if></b>
                            </c:forEach>
                             
                           </td>
                           
                        </tr>
                     </table>
           
                     			
               <%--       <div>

                        <br>
                        <br>

                        <div class="form-group">
                           <label class="col-md-4 control-label">증상 체크</label>
                           <div class="col-md-6  inputGroupContainer">
                              <div class="input-group">
                                  <div style="margin-left: 10px;">
                                  
                                 
                  
                    <label>
                      <input type="checkbox" class="option-input checkbox"name="symptomchk"
                       value="head" onclick="return false;" <c:if test="${ReservDto.symptomchk == 'head' }" >checked='checked'</c:if> />
                     두통
                    </label>
                    <label>
                      <input type="checkbox" class="option-input checkbox"name="symptomchk"  
                      value="fever" onclick="return false;" <c:if test=" == 'fever' }" >checked='checked'</c:if> />
                         발열
                    </label>
                    <label>
                      <input type="checkbox" class="option-input checkbox"name="symptomchk" 
                       value="cough" onclick="return false;" <c:if test="${ReservDto.symptomchk == 'cough' }" >checked='checked'</c:if> />
                      기침
                    </label>
                   <label>
                      <input type="checkbox" class="option-input checkbox"name="symptomchk" 
                       value="disgusted" onclick="return false;" <c:if test="${ReservDto.symptomchk == 'disgusted' }" >checked='checked'</c:if>/>
                      
                  메스꺼움
                    </label>
                     <label>
                      <input type="checkbox" class="option-input checkbox"name="symptomchk" 
                       value="stomachache" onclick="return false;" <c:if test="${ReservDto.symptomchk == 'stomachache' }" >checked='checked'</c:if>/>
                     복통
                    </label>
                     <label>
                      <input type="checkbox" class="option-input checkbox"name="symptomchk"
                        value="vomit" onclick="return false;" <c:if  test="${ReservDto.symptomchk == 'vomit' }" >checked='checked'</c:if>/>
                      구토
                    </label>

                      <label>
                      <input type="checkbox" class="option-input checkbox"name="symptomchk"  
                      value="diarrhea" onclick="return false;" <c:if test="${ReservDto.symptomchk == 'diarrhea' }" >checked='checked'</c:if>/>
                    설사
                    </label>
                     <label>
                      <input type="checkbox" class="option-input checkbox"name="symptomchk"  
                      value="musclepain" onclick="return false;" <c:if test="${ReservDto.symptomchk == 'musclepain' }" >checked='checked'</c:if>/>
                      근육통
                    </label>
                    <label>
                      <input type="checkbox" class="option-input checkbox"name="symptomchk"  
                      value="sorethroat" onclick="return false;" <c:if test="${ReservDto.symptomchk == 'sorethroat' }" >checked='checked'</c:if>/>
                      인후통
                    </label>
                </div> 
                              </div>
                           </div>
                        </div>
                     </div> --%>

                     <div class="form-group">
                        <div style="display: table; margin: 0 auto">
                           <button type="submit" class="btn btn-dark-blue">
                              검사의뢰서 등록 <span class="glyphicon glyphicon-send"></span>
                           </button>
                        </div>
                     </div>
                     </fieldset>
                  </form>
               </div>
            </div>
         </div>
      </div>

   </section>
   
   <footer>
      <%@ include file="../common/footer.jsp"%>
   </footer>

</body>
</html>