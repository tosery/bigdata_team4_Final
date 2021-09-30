<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Cake Template">
<meta name="keywords" content="Cake, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>상품 List</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/flaticon.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/barfiller.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>


	<!-- Header Section Begin -->
	<jsp:include page="/WEB-INF/views/include/Nav.jsp" />
	<!-- Header Section End -->

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="breadcrumb__text">
						<h2>물건</h2>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="breadcrumb__links">
						<a href="./index.html">홈</a> <span>물건</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Shop Section Begin -->
	<section class="shop spad">
		<div class="container">
			<div class="shop__option">
				<div class="row">
					<div class="col-lg-7 col-md-7">
						<div class="shop__option__search">
							<h5>게시판 글 목록(글개수: ${ pageMaker.totalCount })</h5>
							<hr class="featurette-divider">
							<c:if test="${not empty sessionScope.id }">
								<button type="button"
									onclick="location.href = '/product/write?pageNum=${pageMaker.cri.pageNum }';">
									<span>새글쓰기</span>
								</button>
							</c:if>


							<!--Search area -->
							<form action="/products/productsList" method="get">
								<select id="searchType" name="type">
									<option value="" disabled selected>검색 조건</option>
									<option value="T" ${ (pageMaker.cri.type eq 'T') ? 'selected' : '' }>제목</option>
									<option value="C" ${ (pageMaker.cri.type eq 'C') ? 'selected' : '' }>내용</option>
									<option value="W" ${ (pageMaker.cri.type eq 'W') ? 'selected' : '' }>작성자</option>
								</select> <input type="text" placeholder="Search" id="searchKeyword" name="keyword" value="${pageMaker.cri.keyword }">
								<button type="submit">
									<i class="fa fa-search"></i>
								</button>
							</form>
							<!--Search area end-->
							
							
							
						</div>
					</div>
					<div class="col-lg-5 col-md-5">
						<div class="shop__option__right">
							<select>
								<option value="">Default sorting</option>
								<option value="">A to Z</option>
								<option value="">1 - 8</option>
								<option value="">Name</option>
							</select> <a href="#"><i class="fa fa-list"></i></a> <a href="#"><i
								class="fa fa-reorder"></i></a>
						</div>
					</div>
				</div>
			</div>
				
							<c:choose>
								<c:when test="${ pageMaker.totalCount gt 0 }">

									<div class="row">
										<c:forEach var="product" items="${ proList }">
											<div class="col-lg-3 col-md-6 col-sm-6">
												<div class="product__item">
													<a href="/products/details?pnum=${product.pnum}">
													<div class="product__item__pic set-bg"
														data-setbg="/resources/img/logo_widthVer.png">
														
														<div class="product__label">
															<span>${ product.productName }</span>
														</div>
													</div></a>
													<div class="product__item__text">
														<p>	 ${ product.status }</p>													
														<h6>
															  ${ product.title }
															   ${ product.pnum }
														</h6>
														<div class="product__item__price">${ product.sellprice }</div>
														<div class="product__item__price">${ product.sellerid }</div>
														<div class="cart_add">
															<a href="#">Add to cart</a>
														</div>
										<%-- <p class="text-center">게시글 번호: ${ product.pnum } </p> --%>
														
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="text-center">게시판 글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
            <!-- pagination area -->
            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center my-4">
              
              <%-- 이전 --%>
              <li class="page-item ${ (pageMaker.prev) ? '' : 'disabled' }">
              	<a class="page-link" href="${ (pageMaker.prev) ? '/products/productsList?pageNum=' += (pageMaker.startPage - 1) += '&type=' += pageMaker.cri.type += '&keyword=' += pageMaker.cri.keyword : '' }#board">이전</a>
              </li>
              
              <%-- 시작페이지 번호 ~ 끝페이지 번호 --%>
              <c:forEach var="i" begin="${ pageMaker.startPage }" end="${ pageMaker.endPage }" step="1">
              	<li class="page-item ${ (pageMaker.cri.pageNum eq i) ? 'active' : '' }">
              		<a class="page-link" href="/products/productsList?pageNum=${ i }&type=${pageMaker.cri.type}&keyword=${ pageMaker.cri.keyword}#board">${ i }</a>
              	</li>
              </c:forEach>
              
              <%-- 다음 --%>
              <li class="page-item  ${ (pageMaker.next) ? '' : 'disabled' }">
              	<a class="page-link" href="${ (pageMaker.next) ? '/products/productsList?pageNum=' += (pageMaker.endPage + 1) += '&type=' += pageMaker.cri.type += '&keyword=' += pageMaker.cri.keyword : '' }#board">다음</a>
              </li>

              </ul>
            </nav>
          

			<div class="shop__last__option">
				<div class="row">
					<div class="col-lg-6 col-md-6 col-sm-6">
					
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="shop__last__text">
							<p>Showing 12 results</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shop Section End -->

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
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.nice-select.min.js"></script>
	<script src="/resources/js/jquery.barfiller.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/jquery.slicknav.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/jquery.nicescroll.min.js"></script>
	<script src="/resources/js/main.js"></script>
</body>

</html>