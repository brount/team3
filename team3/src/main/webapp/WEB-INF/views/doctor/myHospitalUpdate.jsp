<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp" %>
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
<section>
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


  <form class="form-horizontal" action="myHospitalInputPro" method="post" name="reg_form" enctype="multipart/form-data">
   	<input type="hidden" name ="hiddenId" value="0">
		<input type="hidden" name="hiddenEmail" value=0>
   
    <fieldset>
      
      <!-- Form Name -->
      <legend> 내 병원정보 수정 </legend>
    
      <!-- Text input-->
      
      <div class="form-group">
        <label class="col-md-4 control-label">병원 이름</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input  name="hospitalname" placeholder="병원 이름을 입력해주세요" class="form-control" type="text">
          </div>
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-4 control-label">병원 주소</label>
        <div class="col-md-6  inputGroupContainer">
           <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input  name="hospitaladdress1" placeholder="우편번호를 입력해주세요" class="form-control" type="text"><br>
            <input  name="hospitaladdress2" placeholder="도로명주소를 입력해주세요" class="form-control" type="text"><br>
            <input  name="hospitaladdress3" placeholder="지번 주소를 입력해주세요" class="form-control" type="text"><br>
            <input type="button" value="주소찾기">
          
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-4 control-label">병원 전화번호</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input  name="hospitalphone" placeholder="병원 전화번호를 입력해주세요" class="form-control" type="text">
          </div>
        </div>
      </div>
      
        <!-- Text area -->
      
      <div class="form-group">
        <label class="col-md-4 control-label">병원 소개글 </label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
            <textarea class="form-control" name="hospitalinstruction" placeholder="병원 소개글을 적어주세요 "></textarea>
          </div>
        </div>
      </div>
      
     <div class="form-group">
        <label class="col-md-4 control-label">병원 진료시간 </label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input  name="hospitaltime" placeholder="병원 진료시간을 입력해주세요" class="form-control" type="text">
          </div>
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-4 control-label">병원 휴무일</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input  name="hospitalholiday" placeholder="병원 휴무일을 입력해주세요" class="form-control" type="text">
          </div>
        </div>
      </div>
   
   <div class="form-group">
        <label class="col-md-4 control-label">병원 이미지</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input  name="hospitalimage"  class="form-control" type="file">
          </div>
        </div>
      </div>
      
    
       
     
  
      <!-- Button -->
      <div class="form-group">
        <label class="col-md-4 control-label"></label>
        <div class="col-md-4">
          <button type="submit" class="btn btn-warning" >등록<span class="glyphicon glyphicon-send"></span></button>
        <button type="reset" class="btn btn-warning" >취소<span class="glyphicon glyphicon-send"></span></button>
         <a href="main"><button type="button" class="btn btn-warning" >메인<span class="glyphicon glyphicon-send"></span></button></a>
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
</section>
<footer>
   <%@ include file="../common/footer.jsp" %>
</footer>
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
</body>
</html>