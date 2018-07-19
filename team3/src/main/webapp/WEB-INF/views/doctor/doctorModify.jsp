<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![ENDif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![ENDif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![ENDif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![ENDif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>bootstrap form validation</title>
<link href="/medical/resources/css/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical//resources/css/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical//resources/css/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<header>
   <%@ include file="../common/header.jsp" %>
</header>

<div class="container">
<div class="col-lg-9">
	        <br>
  <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- homeyLink -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-0173509626327009"
     data-ad-slot="9233259299"
     data-ad-format="link"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
<br>


  <form class="form-horizontal" action=" " method="post"  id="reg_form">
    <fieldset>
      
      <!-- Form Name -->
      <legend> 개인정보 입력 수정 </legend>
    
      <!-- Text input-->
      
      
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
            <input  name="first_name" placeholder="이름을 입력해주세요" class="form-control"  type="text">
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
            <textarea class="form-control" name="comment" placeholder="전문분야를 적어주세요 "></textarea>
          </div>
        </div>
      </div>
      
     
       
   	  	<legend> 추가정보 </legend>
      
    <div class="form-group">
        <label class="col-md-4 control-label">이메일 수신여부</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
            <input name="emailAgree"  type="radio" value="동의">동의합니다
            <input name="emailAgree" type="radio" value="동의안함">동의하지 않습니다
            
          </div>
        </div>
      </div>
       
     
  
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


<div class="col-lg-3">
 <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- responsive hotel -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-0173509626327009"
     data-ad-slot="7944464098"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

</div>

</div>

<div class="row" align="left">
 <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- responsive hotel -->
<ins class="adsbygoogle"
     style="display:block"
     data-ad-client="ca-pub-0173509626327009"
     data-ad-slot="7944464098"
     data-ad-format="auto"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>

</div>
</div>
<!-- /.container --> 
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>

        <script src="js/index.js"></script>
<script type="text/javascript">
 
   $(document).ready(function() {
    $('#reg_form').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            first_name: {
                validators: {
                        stringLength: {
                        min: 2,
                    },
                        notEmpty: {
                        message: '공백없이 입력하세요'
                    }
                }
            },
            
            id: {
                validators: {
                        stringLength: {
                        min: 2,
                    },
                        notEmpty: {
                        message: '공백없이 입력하세요'
                    }
                }
            },
             
           
            phone: {
                validators: {
                    notEmpty: {
                        message: '공백없이 입력하세요'
                    },
                    phone: {
                        country: 'KO',
                        message: 'Please supply a vaild phone number with area code'
                    }
                }
            },
            
            
		comment: {
                validators: {
                      stringLength: {
                        max: 100,
                        message:'100글자 미만으로 입력하세요'
                    },
                    notEmpty: {
                        message: '전문분야를 입력해주세요'
                    }
                    }
                 },	
	 email: {
                validators: {
                    notEmpty: {
                        message: '공백없이 입력하세요'
                    },
                    emailAddress: {
                        message: '이메일을 형식에 맞게 입력하세요'
                    }
                }
            },
					
	password: {
            validators: {
                identical: {
                    field: 'confirmPassword',
                    message: '아래 암호를 확인하시고 동일한 암호를 입력하십시오.'
                }
            }
        },
        confirmPassword: {
            validators: {
                identical: {
                    field: 'password',
                    message: '비밀 번호와 비밀 번호 확인이 동일하지 않습니다.'
                }
            }
         },
			
            
            }
        })
		
 	
        .on('success.form.bv', function(e) {
            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                $('#reg_form').data('bootstrapValidator').resetForm();

            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
                console.log(result);
            }, 'json');
        });
});


 
 </script>
<footer>
   <%@ include file="../common/footer.jsp" %>
</footer> 
</body>
</html>
