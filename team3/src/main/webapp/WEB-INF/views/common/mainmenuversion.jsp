<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">

<header>
	<%@ include file="../common/header.jsp" %>
</header>

<!-- slide Section -->
<div id="myCarousel" class="carousel slide bg-inverse   mr-auto" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" role="listbox">
    <div class="carousel-item active">
      <img class="slide" src="/medical/resources/images/mainimg/healthchk.jpg" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="slide " src="/medical/resources/images/mainimg/docslide2-1.jpg" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="slide" src="/medical/resources/images/mainimg/alert.jpg" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


<!-- Portfolio Grid Section -->
<section class="portfolio" id="portfolio">
	<div class="container">
	<!-- 	<h2 class="text-center text-uppercase text-secondary mb-0">Portfolio</h2>
		<hr class="star-dark mb-5"> -->
		<div class="row">
			<div class="col-md-6 col-lg-4">
				<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-1">
					<div
						class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div
							class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <img style="width: 100%; height: auto;"  src="/medical/resources/images/mainimg/portbag.jpg" alt="">
				</a>
			</div>
			<div class="col-md-6 col-lg-4">
				<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-2">
					<div
						class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div
							class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <img style="width: 100%; height: auto;"   src="/medical/resources/images/mainimg/portdrug.jpg" alt="">
				</a>
			</div>
			<div class="col-md-6 col-lg-4">
				<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-3">
					<div
						class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div
							class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <img style="width: 100%; height: auto;"   src="/medical/resources/images/mainimg/portear.jpg"  alt="">
				</a>
			</div>
			<div class="col-md-6 col-lg-4">
				<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-4">
					<div
						class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div
							class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <img style="width: 100%; height: auto;"   src="/medical/resources/images/mainimg/porthel.jpg" alt="">
				</a>
			</div>
			<div class="col-md-6 col-lg-4">
				<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-5">
					<div
						class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div
							class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <img style="width: 100%; height: auto;"   src="/medical/resources/images/mainimg/portjar.jpg" alt="">
				</a>
			</div>
			<div class="col-md-6 col-lg-4">
				<a class="portfolio-item d-block mx-auto" href="#portfolio-modal-6">
					<div
						class="portfolio-item-caption d-flex position-absolute h-100 w-100">
						<div
							class="portfolio-item-caption-content my-auto w-100 text-center text-white">
							<i class="fa fa-search-plus fa-3x"></i>
						</div>
					</div> <img style="width: 100%; height: auto;"   src="/medical/resources/images/mainimg/portweight.jpg" alt="">
				</a>
			</div>
		</div>
	</div>
</section>

<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
<div class="scroll-to-top d-lg-none position-fixed ">
	<a class="js-scroll-trigger d-block text-center text-white rounded"
		href="#page-top"> <i class="fa fa-chevron-up"></i>
	</a>
</div>

<!-- Portfolio Modals -->

<!-- Portfolio Modal 1 -->
<div class="portfolio-modal mfp-hide" id="portfolio-modal-1">
	<div class="portfolio-modal-dialog bg-white">
		<a class="close-button d-none d-md-block portfolio-modal-dismiss"
			href="#"> <i class="fa fa-3x fa-times"></i>
		</a>
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
					<hr class="star-dark mb-5">
					<img class="img-fluid mb-5" src="img/portfolio/cabin.png" alt="">
					<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
						magnam, recusandae quos quis inventore quisquam velit asperiores,
						vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
					<a
						class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
						href="#"> <i class="fa fa-close"></i> Close Project
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Portfolio Modal 2 -->
<div class="portfolio-modal mfp-hide" id="portfolio-modal-2">
	<div class="portfolio-modal-dialog bg-white">
		<a class="close-button d-none d-md-block portfolio-modal-dismiss"
			href="#"> <i class="fa fa-3x fa-times"></i>
		</a>
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
					<hr class="star-dark mb-5">
					<img class="img-fluid mb-5" src="/medical/resources/images/cake.png" alt="">
					<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
						magnam, recusandae quos quis inventore quisquam velit asperiores,
						vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
					<a
						class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
						href="#"> <i class="fa fa-close"></i> Close Project
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Portfolio Modal 3 -->
<div class="portfolio-modal mfp-hide" id="portfolio-modal-3">
	<div class="portfolio-modal-dialog bg-white">
		<a class="close-button d-none d-md-block portfolio-modal-dismiss"
			href="#"> <i class="fa fa-3x fa-times"></i>
		</a>
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
					<hr class="star-dark mb-5">
					<img class="img-fluid mb-5" src="/medical/resources/images/circus.png" alt="">
					<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
						magnam, recusandae quos quis inventore quisquam velit asperiores,
						vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
					<a
						class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
						href="#"> <i class="fa fa-close"></i> Close Project
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Portfolio Modal 4 -->
<div class="portfolio-modal mfp-hide" id="portfolio-modal-4">
	<div class="portfolio-modal-dialog bg-white">
		<a class="close-button d-none d-md-block portfolio-modal-dismiss"
			href="#"> <i class="fa fa-3x fa-times"></i>
		</a>
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
					<hr class="star-dark mb-5">
					<img class="img-fluid mb-5" src="/medical/resources/images/game.png" alt="">
					<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
						magnam, recusandae quos quis inventore quisquam velit asperiores,
						vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
					<a
						class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
						href="#"> <i class="fa fa-close"></i> Close Project
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Portfolio Modal 5 -->
<div class="portfolio-modal mfp-hide" id="portfolio-modal-5">
	<div class="portfolio-modal-dialog bg-white">
		<a class="close-button d-none d-md-block portfolio-modal-dismiss"
			href="#"> <i class="fa fa-3x fa-times"></i>
		</a>
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
					<hr class="star-dark mb-5">
					<img class="img-fluid mb-5" src="/medical/resources/images/safe.png" alt="">
					<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
						magnam, recusandae quos quis inventore quisquam velit asperiores,
						vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
					<a
						class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
						href="#"> <i class="fa fa-close"></i> Close Project
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Portfolio Modal 6 -->
<div class="portfolio-modal mfp-hide" id="portfolio-modal-6">
	<div class="portfolio-modal-dialog bg-white">
		<a class="close-button d-none d-md-block portfolio-modal-dismiss"
			href="#"> <i class="fa fa-3x fa-times"></i>
		</a>
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-8 mx-auto">
					<h2 class="text-secondary text-uppercase mb-0">Project Name</h2>
					<hr class="star-dark mb-5">
					<img class="img-fluid mb-5" src="/medical/resources/images/submarine.png"
						alt="">
					<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Mollitia neque assumenda ipsam nihil, molestias
						magnam, recusandae quos quis inventore quisquam velit asperiores,
						vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
					<a
						class="btn btn-primary btn-lg rounded-pill portfolio-modal-dismiss"
						href="#"> <i class="fa fa-close"></i> Close Project
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<footer>
	<%@ include file="../common/footer.jsp" %>
</footer>

</html>