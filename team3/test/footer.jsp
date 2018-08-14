<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<footer class="footer-bs">
        <div class="row">
        	<div class="col-md-3 footer-brand animated fadeInLeft">
            	<h2>Logo</h2>
                <p>Suspendisse hendrerit tellus laoreet luctus pharetra. Aliquam porttitor vitae orci nec ultricies. Curabitur vehicula, libero eget faucibus faucibus, purus erat eleifend enim, porta pellentesque ex mi ut sem.</p>
                <p>© 2014 BS3 UI Kit, All rights reserved</p>
            </div>
        	<div class="col-md-4 footer-nav animated fadeInUp">
            	<h4>Menu —</h4>
            	<div class="col-md-6">
                    <ul class="pages">
                        <li><a href="#">Travel</a></li>
                        <li><a href="#">Nature</a></li>
                        <li><a href="#">Explores</a></li>
                        <li><a href="#">Science</a></li>
                        <li><a href="#">Advice</a></li>
                    </ul>
                </div>
            <!-- 	<div class="col-md-6">
                    <ul class="list">
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Contacts</a></li>
                        <li><a href="#">Terms & Condition</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                    </ul>
                </div> -->
            </div>
        	<div class="col-md-2 footer-social animated fadeInDown">
            	<h4>Follow Us</h4>
            	<ul>
                	<li><a href="#">Facebook</a></li>
                	<li><a href="#">Twitter</a></li>
                	<li><a href="#">Instagram</a></li>
                	<li><a href="#">RSS</a></li>
                </ul>
            </div>
        	<div class="col-md-3 footer-ns animated fadeInRight">
            	<h4>Newsletter</h4>
                <p>A rover wearing a fuzzy suit doesn’t alarm the real penguin
	                <c:if test="${sessionScope.memberState == null }">
	                	<a onclick="window.open('adminLogin','로그인창','width=450px,height=420px,screenX=700px,screenY=400px');" style="font-size: 18px;">s</a>
	                </c:if>
	                <c:if test="${sessionScope.memberState == 0 }">
	                	<a onclick="window.open('adminLogin','로그인창','width=450px,height=420px,screenX=700px,screenY=400px');" style="font-size: 18px;">s</a>
	                </c:if>
                </p>
               
            </div>
        </div>
    </footer>


<!-- Bootstrap core JavaScript -->
<script src="/medical/resources/css/vendor/jquery/jquery.min.js"></script>
<script src="/medical/resources/css/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="/medical/resources/css/vendor/jquery-easing/jquery.easing.min.js"></script>
<script src="/medical/resources/css/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="/medical/resources/css/js/jqBootstrapValidation.js"></script>
<script src="/medical/resources/css/js/contact_me.js"></script>

<!-- Custom scripts for this template -->

<script src="/medical/resources/css/js/freelancer.min.js"></script>
<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
 -->
<script src="/medical/resources/css/js/cbpHorizontalMenu.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	  //Set the carousel options
	  $('#carousel').carousel({
	    pause: true,
	    interval: 4000,
	  });
	});
</script>

<script type="text/javascript">
!function($, window) {
	Foo = {};
	Foo.Bar = function(){};
	SMC = {};
	window.SMC = SMC;

SMC.Quick = {
		 obj: $('.quick-navigation')
		,open_expand: function() {
			this.obj.removeClass('quick-closed');
		}
		,close_expand: function() {
			this.obj.addClass('quick-closed');
		}
		,toggle_expand: function() {
			this.obj.toggleClass('quick-closed')
		}
		,init: function() {
			var that = this;

			this.obj.find('.quick-menu-toggle').on('click', function() {

				that.toggle_expand();
			});
		}
	}
}

</script>

</html>