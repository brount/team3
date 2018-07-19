<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
<!DOCTYPE html PUBLIC"-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

 -->

<html  class="no-js" lang="en" >
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> 사이트이름 </title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript">
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>


 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />

<script  type="text/javascript" src="/medical/resources/djcss/css/calendar.js"></script>

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
 <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function addressSearch() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullAddr = '';
						var extraAddr = '';
						if (data.userSelectedType === 'R') {
							fullAddr = data.roadAddress;
						} else {
							fullAddr = data.jibunAddress;
						}

						if (data.userSelectedType === 'R') {
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ','
										+ data.buildingName : data.buildingName);

							}
							fullAddr += (extraAddr !== '' ? '(' + extraAddr
									+ ')' : '');

						}
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById('sample6_address').value = fullAddr;

						document.getElementById('sample6_address2').focus();
					}
				}).open();

	}

</script>

  <form class="form-horizontal" action=" " method="post"  id="reg_form">
    <fieldset>
      

      <legend>진료 예약 </legend><a>김순영 소아과 032-544-8275</a>
     <div style="margin: 20px 20px;">
   
  </div>

      
    <div class="form-group">
    	
    	
        <label class="col-md-4 control-label">진료과</label>
        <div class="col-md-6 selectContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
            <select name="state" class="form-control selectpicker" >
              <option value=" " >진료과</option>
              <option>이비인후과</option>
              <option>내과</option>
        
            </select>
          </div>
        </div>
      </div> 
        <div class="form-group" style="margin-top:50px;">
    	
        <label class="col-md-4 control-label">예약구분</label>
        <div class="col-md-6 selectContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
            <select name="state" class="form-control selectpicker" >
              <option value=" " >진료</option>
              <option>진료</option>
        
            </select>
          </div>
        </div>
      </div> 
      
      <!-- Text input-->
      
         <div class="form-group" style="margin-top:50px;" >
        <label class="col-md-4 control-label">예약 일자</label>
        <div class="col-md-6  inputGroupContainer">
     <!--     <div id="calendarDiv" style="font-family:Gulim;font-size:9pt; margin-left: 40px;"></div>  -->
     <div class="wrapper" style="z-index: 100">
    <input type="text" id="datepicker" placeholder="날짜를 선택하세요." readonly="true" />
    <i class="ion-calendar" ></i>
  </div>

         
        </div>
      </div>
     

         <div class="form-group" style="margin-top:50px;" >
    	
        <label class="col-md-4 control-label">예약시간</label>
        <div class="col-md-6 selectContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
            <select  class="form-control selectpicker" >
              <option >시</option>
              <option>오전 9시</option>
              <option>오전 10시</option>
              <option>오전 11시</option>
              <option>오후 12시</option>
              <option>오후 1시</option>
              <option>오후 2시</option>
              <option>오후 3시</option>
              <option>오후 4시</option>
              <option>오후 5시</option>
              <option>오후 6시</option>
        
            </select>
              <select  class="form-control selectpicker" >
                <option>분</option>
              	<option>00 분</option>
                <option>10 분</option>
                <option>20 분</option>
                <option>30 분</option>
                <option>40 분</option>
                <option>50 분</option>                       
                          

            </select>
          </div>
        </div>
      </div> 
      
      
      
     
       </fieldset>
       
       
       <div style="margin-top: 200px;">
       	<legend> 추가입력 정보 </legend>
        <fieldset>
        
        
       
         <div class="form-group" style="margin-top:50px;" >
        <label class="col-md-4 control-label">증상 입력 </label>
        <div class="col-md-6  inputGroupContainer">
          <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
            <textarea class="form-control" name="comment" placeholder="About "></textarea>
          </div>
        </div>
      </div>
      
         <div class="form-group" style="margin-top:50px;" >
        <label class="col-md-4 control-label">증상 체크</label>
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
    </div>
      
  
      <div class="form-group" style="margin: 50px 50px;">
        <label class="col-md-4 control-label"></label>
        <div class="col-md-4">
          <button type="submit" class="btn btn-warning" >예약 <span class="glyphicon glyphicon-send"></span></button>
        </div>
      </div>
    </fieldset>
  </form>
</div>

<script>
    $.datepicker.setDefaults({
      closeText: "닫기",
      prevText: "이전달",
      nextText: "다음달",
      currentText: "오늘",
      monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
        "7월", "8월", "9월", "10월", "11월", "12월"
      ],
      monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
        "7월", "8월", "9월", "10월", "11월", "12월"
      ],
      dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
      dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
      dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
      weekHeader: "주",
      dateFormat: "yy년 m월 d일",
      firstDay: 0,
      isRTL: false,
      showMonthAfterYear: true,
      yearSuffix: "년"
    })
    $("#datepicker").datepicker({
      minDate: 0,
      /* to use in wix */
      onSelect: function (selected, event) {
        console.log(selected);
        /* 
         * wix-send-messages from html component
         * https://support.wix.com/en/article/working-with-the-html-component-in-wix-code
         */
        window.parent.postMessage(selected, "*");
      }
    })
  </script>


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



	<!-- <img src="resources/images/Demonstration/reserveForm.jpg">
	<input type="button" onclick="window.location='main'" value="메인페이지">
	<input type="button" onclick="window.location='reserveList'" value="등록">
	<input type="button" onclick="window.location='reserveList'" value="취소"> -->
</body>
</html>