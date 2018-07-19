<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> 사이트이름 </title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
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
<section>   
<div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-3">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#">마이페이지</a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in collapse show">
                        <div class="panel-body">
                            <table class="table">
                                <tr>
                                    <td>
                                        <a href="myHealth">내 건강정보</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="http://www.jquery2dotnet.com">내 검진결과</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                       <a href="http://www.jquery2dotnet.com">내 질문목록</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="http://www.jquery2dotnet.com">예약목록</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a  href="bookMark">즐겨찾는병원</a>
                        </h4>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a href="guestModify">회원정보수정</a>
                        </h4>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#">회원탈퇴</a>
                        </h4>
                    </div>
                </div>
            </div>
        </div>	
	  		 <div class="col-sm-9 col-md-9">
	            <div class="">
	                <form class="form-horizontal" action=" " method="post"  id="reg_form">
    <fieldset>
      
      <legend>회원정보수정</legend>
    
      <!-- 아이디-->
      
      <div class="form-group" >
        <label class="col-md-4 control-label">아이디</label>
      뿌링클
      </div>
  
        <div class="form-group has-feedback">
            <label for="password"  class="col-md-4 control-label">
             		      비밀번호
                </label>
                <div class="col-md-6  inputGroupContainer">
                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
            <input class="form-control" id="userPw" type="password" placeholder="password" 
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
            <input class="form-control {$borderColor}" id="userPw2" type="password" placeholder="Confirm password" 
                       name="confirmPassword" data-match="#confirmPassword" data-minLength="5"
                       data-match-error="some error 2"
                       required/>
                <span class="glyphicon form-control-feedback"></span>
                <span class="help-block with-errors"></span>
      			 </div>
             </div>
        </div>
       
    
  
     
      <div class="form-group">
        <label class="col-md-4 control-label">Zip Code</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
            <input name="zip" placeholder="Zip Code" class="form-control"  type="text">
          </div>
        </div>
      </div>
      
        <!-- Text area -->
      
      <div class="form-group">
        <label class="col-md-4 control-label">About </label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
            <textarea class="form-control" name="comment" placeholder="About "></textarea>
          </div>
        </div>
      </div>
      
     
       </fieldset>
       	<legend> Account information </legend>
        <fieldset>
          <div class="form-group">
        <label class="col-md-4 control-label">연락처</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
            <input name="phone1" placeholder="010" class="form-control" type="text" style="width:30px;" onkeyup="nextHp1();">
            -
             <input name="phone2" placeholder="1234" class="form-control" type="text" style="width:50px;" onkeyup="nextHp2();">
             -
              <input name="phone3" placeholder="5678" class="form-control" type="text" style="width:50px;" onkeyup="nextHp3();">
          </div>
        </div>
      </div>
      
      <!-- Text input-->
      
  
      
      
      <div class="form-group">
        <label class="col-md-4 control-label">주소</label>
        <div class="col-md-6  inputGroupContainer">
        <input type="text" name="addcode" id="sample6_postcode" placeholder="우편번호" size="6" style="padding:3px"class="form-control" style="width:30px" >
		 			<input type="button" onclick="addressSearch();" value="주소찾기" class="btn btn-warning">
		 			 <input name="address" id="sample6_address" placeholder="주소" class="form-control" type="text">
        
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
           
             <input name="address"   id="sample6_address2"  placeholder="상세주소" class="form-control" type="text" onchange="addinput();">
             <input type="hidden" name="address">
          </div>
        </div>
      </div>
      
  
		
        <!-- Text input-->
      <div class="form-group">
        <label class="col-md-4 control-label">이메일</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
            <input name="email"  class="form-control"  type="text" >
             @
            <input class="input" type="text" name="email" >
           
		 <select name="state" class="form-control selectpicker"  onchange="SelectEmailChk();">
		 
				 			<option value="0">직접입력</option>
		 					<option value="gmail.com">구글</option>
		 					<option value="daum.net">다음</option>
		 					<option value="naver.com">네이버</option>
		 </select>
		 <input  class="btn btn-warning"  type="button" value="이메일인증" name="echk" onclick="emailchk();">
          </div>
        </div>
      </div>
      
      
  
  
  
      <!-- Button -->
      <div class="form-group">
        <label class="col-md-4 control-label"></label>
        <div class="col-md-4">
          <button type="submit" class="btn btn-warning" >수정완료 <span class="glyphicon glyphicon-send"></span></button>
        </div>
     >
 
    </fieldset>
  </form>
</div>
</div>
</div>
</div>
</section>


  


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
                        message: 'Please supply your first name'
                    }
                }
            },
             last_name: {
                validators: {
                     stringLength: {
                        min: 2,
                    },
                    notEmpty: {
                        message: 'Please supply your last name'
                    }
                }
            },
           
            phone: {
                validators: {
                    notEmpty: {
                        message: 'Please supply your phone number'
                    },
                    phone: {
                        country: 'US',
                        message: 'Please supply a vaild phone number with area code'
                    }
                }
            },
            address: {
                validators: {
                     stringLength: {
                        min: 8,
                    },
                    notEmpty: {
                        message: 'Please supply your street address'
                    }
                }
            },
            city: {
                validators: {
                     stringLength: {
                        min: 4,
                    },
                    notEmpty: {
                        message: 'Please supply your city'
                    }
                }
            },
            state: {
                validators: {
                    notEmpty: {
                        message: 'Please select your state'
                    }
                }
            },
            zip: {
                validators: {
                    notEmpty: {
                        message: 'Please supply your zip code'
                    },
                    zipCode: {
                        country: 'US',
                        message: 'Please supply a vaild zip code'
                    }
                }
            },
		comment: {
                validators: {
                      stringLength: {
                        min: 10,
                        max: 200,
                        message:'Please enter at least 10 characters and no more than 200'
                    },
                    notEmpty: {
                        message: 'Please supply a description about yourself'
                    }
                    }
                 },	
	 email: {
                validators: {
                    notEmpty: {
                        message: 'Please supply your email address'
                    },
                    emailAddress: {
                        message: 'Please supply a valid email address'
                    }
                }
            },
					
	password: {
            validators: {
                identical: {
                    field: 'confirmPassword',
                    message: 'Confirm your password below - type same password please'
                }
            }
        },
        confirmPassword: {
            validators: {
                identical: {
                    field: 'password',
                    message: 'The password and its confirm are not the same'
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


<!-- 
<h2>회원정보 수정 폼 페이지</h2>




	<img src="resources/images/Demonstration/guestModify.jpg">
	<br/>
	<input type="button" onclick="window.location='myPage'" value="회원정보수정">
	<input type="button" onclick="window.location='myPage'" value="수정취소">
	<input type="button" onclick="window.location='main'" value="메인페이지">
</body>
</html> -->