<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title> 사이트 이름 </title>
<body>
   
   <header>
   <%@ include file="../common/header.jsp" %>
   </header>
   
   <section>   	
		<div class="container">
		    <div class="row">
		        <div class="col-sm-3 col-md-3">
		            <%@ include file="../common/menuCare.jsp" %>
		        </div>
	  		 	<div class="col-sm-9 col-md-9">
		            <div class="well">
			            <div class="container">
					      <h1 class="my-4 text-center text-lg-left">음식 목록</h1>
					
					      <div class="row text-center text-lg-left">
					
					        <div class="col-lg-3 col-md-4 col-xs-6">
					          <a href="foodInfo" class="d-block mb-4">
					            <img class="img-fluid img-thumbnail" src="/medical/resources/images/cake.png" alt="">
					          </a>
					        </div>
					        <div class="col-lg-3 col-md-4 col-xs-6">
					          <a href="foodInfo" class="d-block mb-4">
					            <img class="img-fluid img-thumbnail" src="/medical/resources/images/cabin.png" alt="">
					          </a>
					        </div>
					        <div class="col-lg-3 col-md-4 col-xs-6">
					          <a href="foodInfo" class="d-block mb-4">
					            <img class="img-fluid img-thumbnail" src="/medical/resources/images/circus.png" alt="">
					          </a>
					        </div>
					        <div class="col-lg-3 col-md-4 col-xs-6">
					          <a href="foodInfo" class="d-block mb-4">
					            <img class="img-fluid img-thumbnail" src="/medical/resources/images/game.png" alt="">
					          </a>
					        </div>					
					      </div>					
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

	
