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
<title></title>
<link href="/medical/resources/css/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical//resources/css/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical//resources/css/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<header>
	<%@ include file="../common/header.jsp" %>
</header>

<section style="padding:2rem 0;">

<div class="container">
<div class="col-lg-9">
	        <br>
  <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
<br>


  <form class="form-horizontal" action=" " method="post"  id="reg_form">
    <fieldset>
      
      <!-- Form Name -->
      <legend> 이벤트 신청 페이지 </legend>
    
      <!-- Text input-->
      아래 내용을 바탕으로 이벤트 페이지 및 배너 게재를 요청합니다<br><br>
      <div class="form-group">
        <label class="col-md-4 control-label">제목</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
            <input  name="title" placeholder="제목을 입력해주세요" class="form-control" type="text">
          </div>
        </div>
      </div>
      
      
      
      <div class="form-group">
        <label class="col-md-4 control-label">이벤트 기간 </label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
             <input  name="date1" class="form-control" type="date">
             <input  name="date2" class="form-control" type="date">
          </div>
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-4 control-label">이벤트 이미지</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
            <input  name="image" class="form-control"  type="file">
          </div>
        </div>
      </div>
      
      <div class="form-group">
        <label class="col-md-4 control-label">이벤트 내용 </label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
            <textarea class="form-control" name="comment" placeholder="이벤트 내용을 적어주세요 "></textarea>
          </div>
        </div>
      </div>
      
        <div class="form-group">
        <label class="col-md-4 control-label">이벤트 종류</label>
        <div class="col-md-6 selectContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
            <select name="kind" class="form-control selectpicker" >
              <option value=" " >이벤트 종류를 선택해주세요</option>
              <option>광고</option>
              <option>베너</option>
            </select>
          </div>
        </div>
      </div>
    
      <!-- Text input-->
      
     
  
      <!-- Button -->
      <div class="form-group">
        <label class="col-md-4 control-label"></label>
        <div class="col-md-4">
          <button type="submit" class="btn btn-warning" >신청 <span class="glyphicon glyphicon-send"></span></button>
          <button type="reset" class="btn btn-warning" >취소 <span class="glyphicon glyphicon-send"></span></button>
          <button type="button" class="btn btn-warning" >메인 <span class="glyphicon glyphicon-send"></span></button>
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
            title: {
                validators: {
                        stringLength: {
                        min: 2,
                    },
                        notEmpty: {
                        message: '공백없이 입력하세요'
                    }
                }
            },
            
            date1: {
                validators: {
                        stringLength: {
                        min: 2,
                    },
                        notEmpty: {
                        message: '공백없이 입력하세요'
                    }
                }
            },
            
            date2: {
                validators: {
                        stringLength: {
                        min: 2,
                    },
                        notEmpty: {
                        message: '공백없이 입력하세요'
                    }
                }
            },
            
            image: {
                validators: {
                        stringLength: {
                        min: 2,
                    },
                        notEmpty: {
                        message: '공백없이 입력하세요'
                    }
                }
            },
             
           
            kind: {
                validators: {
                        stringLength: {
                        min: 2,
                    },
                        notEmpty: {
                        message: '이벤트 종류를 선택해주세요'
                    }
                }
            },  
            
            
		comment: {
                validators: {
                      stringLength: {
                        max: 500,
                        message:'500글자 미만으로 입력하세요'
                    },
                    notEmpty: {
                        message: '내용를 입력해주세요'
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
