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
   <div class="header__banner-left"  onclick="location.href='http://localhost:8090/products/productsList?type=T&keyword=코로나';">
   	<div>
      <h3>코로나19</h3>
      <h3>방역물품</h3>
      <h3>최대50%</h3>
      <h3>클릭</h3>
   	</div>
   	<div><img class="fit-picture" src="/resources/img/team4_img02.png"></div>
   </div>
   <jsp:include page="/WEB-INF/views/include/Nav.jsp" />
   <!-- Header Section End -->

   <!-- Hero Section Begin -->
   <section class="hero">
      <div class="hero__slider owl-carousel">
         <div class="hero__item set-bg teamlogo" data-setbg="/resources/img/4team_logo.png" style=" opacity = 0.5" >
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
                   <button class="btn btn-lg bg-warning d-flex flex-row justify-content-center " onclick="location.href='http://localhost:8090/products/productsList?type=T&keyword=코로나';">방역물품 사러가기</button>
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
                                    <h5>박준영</h5>
                                    <span>금정구</span>
                                </div>
                            </div>
                            <div class="rating">
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star-half_alt"></span>
                            </div>
                            <p>특기 : 닭강정 10알 사서 열흘에 나눠 먹기.<br>
                               취미 :  토리에게 산책 당하기.<br>
                               특이사항 : 미공개 복근 보유.</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="testimonial__item">
                            <div class="testimonial__author">
                                <div class="testimonial__author__pic">
                                    <img src="/resources/img/team4_img02.png"" alt="">
                                </div>
                                <div class="testimonial__author__text">
                                    <h5>정민욱</h5>
                                    <span>사상구</span>
                                </div>
                            </div>
                            <div class="rating">
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star-half_alt"></span>
                            </div>
                            <p>특기 : 자기 괴롭히는 사람 이름 데스노트에 적기.<br>
                               취미 : 노트 사러 가기.<br>
                               특이사항 : 용트름 가능.</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="testimonial__item">
                            <div class="testimonial__author">
                                <div class="testimonial__author__pic">
                                    <img src="/resources/img/team4_img03.png" alt="">
                                </div>
                                <div class="testimonial__author__text">
                                    <h5>심예은</h5>
                                    <span>남구</span>
                                </div>
                            </div>
                            <div class="rating">
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star-half_alt"></span>
                            </div>
                            <p>특기 : 성대모사.<br>
                               취미 : 준영&민욱 괴롭히기(하극상).<br>
                               특이사항 : 어린 시절 고구마를 닮음.</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="testimonial__item">
                            <div class="testimonial__author">
                                <div class="testimonial__author__pic">
                                    <img src="/resources/img/team4_img04.png" alt="">
                                </div>
                                <div class="testimonial__author__text">
                                    <h5>임수진</h5>
                                    <span>사상구</span>
                                </div>
                            </div>
                            <div class="rating">
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star-half_alt"></span>
                            </div>
                            <p>특기 : 킹코브라 만들기.<br>
                               취미 : 준영&민욱 괴롭히기(하극상).<br>
                               특이사항 : 학원 수강생 중 한 명의 열혈 팬.</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="testimonial__item">
                            <div class="testimonial__author">
                                <div class="testimonial__author__pic">
                                    <img src="/resources/img/team4_img01.jpg" alt="">
                                </div>
                                <div class="testimonial__author__text">
                                    <h5>주녕미눅</h5>
                                    <span>감자&칡</span>
                                </div>
                            </div>
                            <div class="rating">
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star-half_alt"></span>
                            </div>
                            <p>감자&칡스<br>
                            봐주는 척하지만 뒤에선 복수의 칼날을 갈고 있다.<br>
                             언젠간 꼭 복수하고 말 것.</p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="testimonial__item">
                            <div class="testimonial__author">
                                <div class="testimonial__author__pic">
                                    <img src="/resources/img/team4_img02.png" alt="">
                                </div>
                                <div class="testimonial__author__text">
                                    <h5>심옌&듀딩</h5>
                                    <span>고굼아&파프리카</span><br><br>
                                </div>
                            </div>
                            <div class="rating">
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star"></span>
                                <span class="icon_star-half_alt"></span>
                            </div>
                            <h5>고굼고굼&파프리크아아아앙</h5>
                            <span>박준영 & 정민욱 담당 일찐.</span><br><br>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonial Section End -->
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