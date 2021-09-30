<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Cake Template">
<meta name="keywords" content="Cake, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>단호박마켓(SGP)</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<%-- include head.jsp --%>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__cart">
			<div class="offcanvas__cart__links">
				<a href="#" class="search-switch"><img src="/resources/img/icon/search.png"
					alt=""></a> <a href="#"><img src="/resources/img/icon/heart.png" alt=""></a>
			</div>
			<div class="offcanvas__cart__item">
				<a href="#"><img src="img/icon/cart.png" alt=""> <span></span></a>
				<div class="cart__price">
					Cart: <span>₩0.00</span>
				</div>
			</div>
		</div>
		<div class="offcanvas__logo">
			<a href="/index"><img src="img/logo_widthVer.png" alt=""></a>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__option">
			<ul>
				<li>USD <span class="arrow_carrot-down"></span>
					<ul>
						<li>EUR</li>
						<li>USD</li>
					</ul>
				</li>
				<li>ENG <span class="arrow_carrot-down"></span>
					<ul>
						<li>Spanish</li>
						<li>ENG</li>
					</ul>
				</li>
				<li><a href="#">Sign in</a> <span class="arrow_carrot-down"></span></li>
			</ul>
		</div>
	</div>
	<!-- Offcanvas Menu End -->

   <!-- Header Section Begin -->
	<jsp:include page="/WEB-INF/views/include/Nav.jsp" />
   <!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<!-- <div class="breadcrumb__text"> -->
					<div>
						<h2>로그인</h2>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">

				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Checkout Section Begin -->
	<section class="checkout spad">
		<div class="container">
			<div class="checkout__form">
				<form action="/member/login" method="POST">
					<div class="row">
						<div class="col-lg-8 col-md-6">
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											아이디<span>*</span>
										</p>
										<input type="text" name="id">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="checkout__input">
										<p>
											비밀번호<span>*</span>
										</p>
										<input type="password" name="passwd">
									</div>
								</div>
							</div>

							<button class="btn btn-lg bg-warning">로그인</button>
							<label for="acc"> 로그인 유지 <input type="checkbox" id="acc" name="rememberMe">
								<span class="checkmark"></span>
							</label>
						</div>

					</div>
				</form>
			</div>
		</div>
	</section>
	<!-- Checkout Section End -->

<!-- Footer Section Begin -->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- Footer Section End -->

	<!-- Search Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search End -->

	<!-- Js Plugins -->
	<jsp:include page="/WEB-INF/views/include/javascripts.jsp" />
</body>

</html>