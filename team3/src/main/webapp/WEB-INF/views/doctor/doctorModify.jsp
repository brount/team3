<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="/medical/resources/css/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical//resources/css/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />

<body>
<header>
   <%@ include file="../common/header.jsp" %>
</header>

<section>
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <%@ include file="../doctor/menuDoctor.jsp" %>
            </div>
            <div class="col-sm-9 col-md-9">
            <div class="well">
                <div>
				  <form class="form-horizontal" action="modifyPro" method="post"  id="reg_form" enctype="multipart/form-data">
				    <fieldset>
				      
				      <!-- Form Name -->
				      <legend> 개인정보 입력 수정 </legend>
				    
				      <!-- Text input-->
				      <div class="form-group">
				        <label class="col-md-4 control-label">아이디</label>
				        <div class="col-md-6  inputGroupContainer">
				          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
								${sessionScope.id}
				          </div>
				        </div>
				      </div>
				      
				       <div class="form-group has-feedback">
				            <label for="password"  class="col-md-4 control-label">
				                    비밀번호
				                </label>
				                <div class="col-md-6  inputGroupContainer">
				                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
				            <input class="form-control" id="userPw" type="password" placeholder="비밀번호를 입력해주세요" 
				                       name="password" data-minLength="5"
				                       data-error="some error"
				                       required/>
				                <span class="glyphicon form-control-feedback"></span>
				                <span class="help-block with-errors"></span>
				                </div>
				             </div>
				        </div>
				     
				        <div class="form-group has-feedback">
				            <label for="confirmPassword"  class="col-md-4 control-label">
				                   비밀번호 확인
				                </label>
				                 <div class="col-md-6  inputGroupContainer">
				                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
				            <input class="form-control {$borderColor}" id="userPw2" type="password" placeholder="비밀번호를 다시 입력해주세요" 
				                       name="confirmPassword" data-match="#confirmPassword" data-minLength="5"
				                       data-match-error="some error 2"
				                       required/>
				                <span class="glyphicon form-control-feedback"></span>
				                <span class="help-block with-errors"></span>
				      			 </div>
				             </div>
				        </div>
				      
				      <div class="form-group">
				        <label class="col-md-4 control-label">이름</label>
				        <div class="col-md-6  inputGroupContainer">
				          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				            <input  name="name" placeholder="이름을 입력해주세요" class="form-control"  type="text">
				          </div>
				        </div>
				      </div>
				      
				      <!-- Text input-->
				      
				      <div class="form-group">
				        <label class="col-md-4 control-label">휴대 전화</label>
				        <div class="col-md-6  inputGroupContainer">
				          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
				            <input name="phone" placeholder=" '-' 없이 입력해 주세요" class="form-control" type="text">
				          </div>
				        </div>
				      </div>
				     
				       <div class="form-group">
				        <label class="col-md-4 control-label">이메일</label>
				        <div class="col-md-6  inputGroupContainer">
				          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
				            <input name="email" placeholder="이메일을 입력해주세요" class="form-control"  type="text"><input type="button" value="인증">
				          </div>
				        </div>
				      </div>
				    
				        <!-- Text area -->
				      
				      <div class="form-group">
				        <label class="col-md-4 control-label">전문분야 </label>
				        <div class="col-md-6  inputGroupContainer">
				          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
				            <textarea class="form-control" name="specialism" placeholder="전문분야를 적어주세요 "></textarea>
				          </div>
				        </div>
				      </div>
				      
				     <div class="form-group">
				        <label class="col-md-4 control-label">의사 면허증</label>
				        <div class="col-md-6  inputGroupContainer">
				          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
				            <input  name="file" class="form-control"  type="file" style="padding:1px;">
				          </div>
				        </div>
				      </div>
				       
				   	 <!--  	<legend> 추가정보 </legend>
				      
				    <div class="form-group">
				        <label class="col-md-4 control-label">이메일 수신여부</label>
				        <div class="col-md-6  inputGroupContainer">
				          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
				            <input name="emailAgree"  type="radio" value="동의">동의합니다
				            <input name="emailAgree" type="radio" value="동의안함">동의하지 않습니다
				            
				          </div>
				        </div>
				      </div> -->
				       
				     
				  
				      <!-- Button -->
				      <div class="form-group">
				        <label class="col-md-4 control-label"></label>
				        <div class="col-md-4">
				          <button type="submit" class="btn btn-warning" >수정 <span class="glyphicon glyphicon-send"></span></button>
				          <button type="reset" class="btn btn-warning" >취소 <span class="glyphicon glyphicon-send"></span></button>
				          <a href="myPage"><button type="button" class="btn btn-warning" >목록<span class="glyphicon glyphicon-send"></span></button></a>
				        </div>
				      </div>
				    </fieldset>
				  </form>
				</div>
			</div>
		</div>
       </div>
      </div>
</section>

<footer>
   <%@ include file="../common/footer.jsp" %>
</footer> 
</body>
</html>
