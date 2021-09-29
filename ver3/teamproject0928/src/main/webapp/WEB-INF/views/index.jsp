<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Cake Template">
<meta name="keywords" content="Cake, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>단호박마켓(SGP)</title>

<%-- include head.jsp --%>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
 <script>
google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawLogScales);

function drawLogScales() {
    var data = new google.visualization.DataTable();
    data.addColumn('number', '날짜');
    data.addColumn('number', '확진자수');

    data.addRows([
      [6.15, 12121],    [6.16, 12084],   [6.17, 12050],  [6.18, 12002],   [6.19, 11946],  [6.20, 12000]
      
    ]);

    var options = {
      hAxis: {
        title: '날짜',
        logScale: true
      },
      vAxis: {
        title: '확진자 수',
        logScale: false
      },
      colors: ['#a52714']
    };

    var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }

 </script>

</head>

<body>
   <!-- Page Preloder -->
   <div id="preloder">
      <div class="loader"></div>
   </div>
<%-- 
   <!-- Offcanvas Menu Begin -->
   <div class="offcanvas-menu-overlay"></div>
   <div class="offcanvas-menu-wrapper">
      <div class="offcanvas__cart">
         <div class="offcanvas__cart__links">
            <a href="#" class="search-switch"><img
               src="/resources/img/icon/search.png" alt=""></a> <a href="#"><img
               src="/resources/img/icon/heart.png" alt=""></a>
         </div>
         <div class="offcanvas__cart__item">
            <a href="#"><img src="/resources/img/icon/cart.png" alt="">
               <span>0</span></a>
            <div class="cart__price">
               Cart: <span>₩0.00</span>
            </div>
         </div>
      </div>
      <div class="offcanvas__logo">
         <a href="/index"><img src="/resources/img/logo.png" alt=""></a>
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
--%>
   <!-- Header Section Begin -->
	<div class="header__banner-left"  onclick="location.href='http://localhost:8090/products/productsList?type=T&keyword=127';">
		<h3>코로나19</h3>
		<h3>방역물품</h3>
		<h3>최대50%</h3>
		<h3>클릭</h3>
	</div>
   <jsp:include page="/WEB-INF/views/include/Nav.jsp" />
   <!-- Header Section End -->

   <!-- Hero Section Begin -->
   <section class="hero">
      <div class="hero__slider owl-carousel">
         <div class="hero__item set-bg teamlogo" data-setbg="/resources/img/4team_logo.png" >
            <div class="container">
               <div class="row d-flex justify-content-center">
                  <div class="col-lg-8">
                     <div class="hero__text">
                        <h2>단호박마켓(SGP)</h2><br>
                        <h2>오픈기념 최대 50%</h2>
                        <a href="#" class="primary-btn">WELCOME</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="hero__item set-bg" data-setbg="/resources/img/4team_logomain_.jpg" style=" object-fit: contain;">
            <div class="container">
               <div class="row d-flex justify-content-center">
                  <div class="col-lg-8">
                     <div class="hero__text">
                        <h2>단호박마켓(SGP)</h2><br>
                        <h2>오픈기념 최대 50%</h2>
                        <a href="#" class="primary-btn">Our cakes</a>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!-- Hero Section End -->

   <!-- Testimonial Section Begin -->
   <section class="testimonial spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-12 text-center">
               <div class="section-title">
                  <span>코로나 방역물품 50% 할인</span>
                  <h2>손소독제, 마스크</h2>
               </div>
            </div>
         </div>
         <div class="row">
         <div class="col-sm-8">
            <div id="chart_div"></div>
         </div>
         <div class="col-sm-4">
         		<table border="1">
		<thead>
			<tr>
				<th>기준일</th>
				<th>확진자수</th>
				<th>사망자수</th>
				<th>누적확진률</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${ fn:length(covidList) gt 0 }">
					<c:forEach var="covid" items="${ covidList }">
						<tr>
							<td>${ covid.stateDt }</td>
							<td>${ covid.decideCnt }</td>
							<td>${ covid.deathCnt }</td>
							<td>${ covid.accDefRate }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">데이터가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
         </div>
         </div>
      </div>
   </section>
   <!-- Testimonial Section End -->
<!-- Testimonial Section Begin -->
    <section class="testimonial spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="section-title">
                        <span>추천 물품</span>
                        <h2>마스크, 소독제 최대50% EVENT</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="testimonial__slider owl-carousel">
                    <div class="col-lg-6">
                        <div class="testimonial__item">
                            <div class="testimonial__author">
                                <div class="testimonial__author__pic">
                                    <img src="/resources/img/team4_img01.jpg" alt="">
                                </div>
                                <div class="testimonial__author__text">
                                    <h5>Kerry D.Silva</h5>
                                    <span>New york</span>
                                </div>
                            </div>
                            <div class="rating">
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star-half_alt"></span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                            ut labore et dolore magna aliqua viverra lacus vel facilisis.</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="testimonial__item">
                            <div class="testimonial__author">
                                <div class="testimonial__author__pic">
                                    <img src="/resources/img/team4_img02.png"" alt="">
                                </div>
                                <div class="testimonial__author__text">
                                    <h5>Kerry D.Silva</h5>
                                    <span>New york</span>
                                </div>
                            </div>
                            <div class="rating">
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star-half_alt"></span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                            ut labore et dolore magna aliqua viverra lacus vel facilisis.</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="testimonial__item">
                            <div class="testimonial__author">
                                <div class="testimonial__author__pic">
                                    <img src="/resources/img/team4_img03.png" alt="">
                                </div>
                                <div class="testimonial__author__text">
                                    <h5>Ophelia Nunez</h5>
                                    <span>London</span>
                                </div>
                            </div>
                            <div class="rating">
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star-half_alt"></span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                            ut labore et dolore magna aliqua viverra lacus vel facilisis.</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="testimonial__item">
                            <div class="testimonial__author">
                                <div class="testimonial__author__pic">
                                    <img src="/resources/img/team4_img04.png" alt="">
                                </div>
                                <div class="testimonial__author__text">
                                    <h5>Kerry D.Silva</h5>
                                    <span>New york</span>
                                </div>
                            </div>
                            <div class="rating">
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star-half_alt"></span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                            ut labore et dolore magna aliqua viverra lacus vel facilisis.</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="testimonial__item">
                            <div class="testimonial__author">
                                <div class="testimonial__author__pic">
                                    <img src="/resources/img/team4_img01.jpg" alt="">
                                </div>
                                <div class="testimonial__author__text">
                                    <h5>Ophelia Nunez</h5>
                                    <span>London</span>
                                </div>
                            </div>
                            <div class="rating">
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star-half_alt"></span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                            ut labore et dolore magna aliqua viverra lacus vel facilisis.</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="testimonial__item">
                            <div class="testimonial__author">
                                <div class="testimonial__author__pic">
                                    <img src="/resources/img/team4_img02.png" alt="">
                                </div>
                                <div class="testimonial__author__text">
                                    <h5>Kerry D.Silva</h5>
                                    <span>New york</span>
                                </div>
                            </div>
                            <div class="rating">
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star-half_alt"></span>
                            </div>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt
                            ut labore et dolore magna aliqua viverra lacus vel facilisis.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial Section End -->
   <!-- Footer Section Begin -->
   <footer class="footer set-bg" data-setbg="/resources/img/footer-bg.jpg">
      <div class="container">
         <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-6">
               <div class="footer__widget">
                  <h6>WORKING HOURS</h6>
                  <ul>
                     <li>Monday - Friday: 08:00 am – 08:30 pm</li>
                     <li>Saturday: 10:00 am – 16:30 pm</li>
                     <li>Sunday: 10:00 am – 16:30 pm</li>
                  </ul>
               </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
               <div class="footer__about">
                  <div class="footer__logo">
                     <a href="#"><img src="/resources/img/footer-logo.png" alt=""></a>
                  </div>
                  <p>Lorem ipsum dolor amet, consectetur adipiscing elit, sed do
                     eiusmod tempor incididunt ut labore dolore magna aliqua.</p>
                  <div class="footer__social">
                     <a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
                        class="fa fa-twitter"></i></a> <a href="#"><i
                        class="fa fa-instagram"></i></a> <a href="#"><i
                        class="fa fa-youtube-play"></i></a>
                  </div>
               </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6">
               <div class="footer__newslatter">
                  <h6>Subscribe</h6>
                  <p>Get latest updates and offers.</p>
                  <form action="#">
                     <input type="text" placeholder="Email">
                     <button type="submit">
                        <i class="fa fa-send-o"></i>
                     </button>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <div class="copyright">
         <div class="container">
            <div class="row">
               <div class="col-lg-7">
                  <p class="copyright__text text-white">
                     <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                     Copyright &copy;
                     <script>
                        document.write(new Date().getFullYear());
                     </script>
                     All rights reserved | This template is made with <i
                        class="fa fa-heart" aria-hidden="true"></i> by <a
                        href="https://colorlib.com" target="_blank">Colorlib</a>
                     <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                  </p>
               </div>
               <div class="col-lg-5">
                  <div class="copyright__widget">
                     <ul>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms & Conditions</a></li>
                        <li><a href="#">Site Map</a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </footer>
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