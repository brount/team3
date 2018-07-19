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
  <form class="form-horizontal" action=" " method="post"  id="reg_form">
    <fieldset>
      

      <legend>간단 진료</legend>
    

     
   <div class="form-group" >
        <label class="col-md-4 control-label">성별</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
          
          

          
          
            <label style="margin-left: 10px;margin-right: 10px;">
			    <input type="radio" class="option-input radio" name="m" checked />
			  여자
			  </label>
			    <label style="margin-left: 10px;margin-right: 10px;">
			    <input type="radio" class="option-input radio" name="m" />
			  남자
			  </label>
			  
          </div>
        </div>
      </div>
  
   <div class="form-group" style="margin-top: 50px;">
        <label class="col-md-4 control-label">생년월일</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
            <input name="phone1" placeholder="1994" class="form-control" type="text" style="width:30px; margin-right: 10px;margin-left: 10px;">
          		<b>년</b> 
             <input name="phone2" placeholder="01" class="form-control" type="text" style="width:50px; margin-right: 10px; margin-left: 10px;" >
     		       <b>월</b> 	
              <input name="phone3" placeholder="13" class="form-control" type="text" style="width:50px; margin-right: 10px;">
              	<b>일</b> 
          </div>
        </div>
     
      </div>

  
  
         <div class="form-group" >
        <label class="col-md-4 control-label">증상</label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> 
          
				<div style="margin-left: 10px;">
				
				  <label>
				    <input type="checkbox" class="option-input checkbox"  />
					두통
				  </label>
				  <label>
				    <input type="checkbox" class="option-input checkbox" />
					    발열
				  </label>
				  <label>
				    <input type="checkbox" class="option-input checkbox" />
				    기침
				  </label>
				 <label>
				    <input type="checkbox" class="option-input checkbox" />
				메스꺼움
				  </label>
				   <label>
				    <input type="checkbox" class="option-input checkbox" />
				   복통
				  </label>
				   <label>
				    <input type="checkbox" class="option-input checkbox" />
				    구토
				  </label>
 					<label>
				    <input type="checkbox" class="option-input checkbox" />
				  설사
				  </label>
				   <label>
				    <input type="checkbox" class="option-input checkbox" />
				    근육통
				  </label>
				  <label>
				    <input type="checkbox" class="option-input checkbox" />
				    인후통
				  </label>
				  

          </div>
        </div>
      </div>
</div>
 
      <div style="margin-top: 50px; margin-left:450px;" >
      
      
         <button type="submit" class="btn btn-warning"onclick="window.location=''" >검색 <span class="glyphicon glyphicon-send"></span></button>
  		
  </div>
  
  
  
  </fieldset>
  </form>
  

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






<!-- 

	<img src="resources/images/Demonstration/simpleTreat.jpg">
	<input type="button" onclick="window.location='main'" value="메인페이지"> -->
</body>
</html>