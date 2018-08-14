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
   <%@ include file="../common/line.jsp"%>
   
   <section>   	
		<div class="container">
		    <div class="row">
		        <div class="col-sm-3 col-md-3">
		            <%@ include file="../common/menuEvent.jsp" %>
		        </div>
	  		 	<div class="col-sm-9 col-md-9">
		            <div class="well">
			  		 	<div class="container">
					      <div class="row text-center text-lg-left">
				           	<div>
				           		<table class='table'>
				           			<tr>
				           				<th style="text-align: center;">
				           					${dto.advertisementTitle}
				           				</th>
				           			</tr>
				           			<tr>
				           				<th>
				           					<img src="resources/images/event/${dto.advertisementImage}" style="width:100%">
				           				</th>
				           			</tr>
				           			<tr>
				           				<th>
				           					${dto.advertisementContents}
				           				</th>
				           			</tr>
				           		</table>
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

	
