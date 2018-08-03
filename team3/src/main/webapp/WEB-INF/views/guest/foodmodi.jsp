 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title> 사이트이름 </title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function modi() {
	if(!document.foodlist.foodcal.value){
		alert('수정할 칼로리를 입력해주세요.');
		document.foodlist.foodcal.focus();
		return false;
		
	}else if(!document.foodlist.foodgram.value){
		alert('수정할 그램을 입력해주세요.');
		document.foodlist.foodgram.focus();
		return false;
	}



/* 	window.location="myFoodModi?foodno?"+foodno+"&foodcal="+foodcal+"&foodgram="+foodgram;
 */
	
}
</script>


</head>
<body>




<section  style="margin-bottom: 100px; margin-top: 100px;" >
  <form name="foodlist" action="myFoodModi" onsubmit="return modi()" >
<div class="container">
		    <div class="row">
		     
			  		 <div class="col-sm-9 col-md-9">
			                <div class="mail-box">
			   
                  <aside class="lg-side">
                      <div class="inbox-head">
                          <h3>나만의 음식 수정</h3>
                       
                      </div>
                      <div class="inbox-body">
                         <div class="mail-option">
                             

                               <table class="table table-inbox table-hover" style="font-size: 25px;">
                                <input type="hidden" value="${vo.foodno }" name="foodno">
                            <tbody>
                              <tr class="unread">
                          <!--       <td>  <input type="checkbox" class="toption-input checkbox" /></td> -->
                     			 
                                  <td class="view-message">음식</td>   
                                  <td></td>
                                  <td></td>                               
                                  <td>칼로리</td>
                                  <td>gram</td>
								 
                                  <td></td>
                                  
                             
                                        
                              </tr>
                              
                         
                              
                             
                              <tr class="">
               			 <!--   <td>  <input type="checkbox" class="toption-input checkbox" /></td> -->
                               
                                  <td colspan="3" class="view-message">${vo.food }</td>
                                 
                                  <td><span class="label label-success">
                               
                         		  <input type="text" placeholder="  ${vo.foodcal }" name="foodcal" style="width: 100px;background-color: #5cb85c;">  
                                   Kcal
                                  </span></td>
                               
                               <td><span class="label label-success">
                                <input type="text" placeholder="${vo.foodgram}" name="foodgram" style="width: 100px;background-color: #5cb85c;">  
                             			g
                                  </span></td>
                                  
                                  
                                 <td>
                                	    <input type="submit" class="btn" value="수정" onclick="modi(${vo.foodno })">
           	                       
           	                	   
           	
                                  </td>
                              </tr>
                                
                  
                     
                     
                 	<tr>
                     
                          </tbody>
                          </table>
                      </div>
                      </div>
           
           	
                  </aside>
                  
   	 </div>                    
             
			            </div>
			        </div>
			    </div>
    
                  </form>
</section>

  
 

</body>
</html>