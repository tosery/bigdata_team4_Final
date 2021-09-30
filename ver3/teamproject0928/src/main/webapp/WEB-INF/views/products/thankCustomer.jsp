<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Cake Template">
<meta name="keywords" content="Cake, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<!-- Css Styles -->
<%-- include head.jsp --%>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
</head>

<body>
   <%
   String cartId = request.getParameter("cartId");
   String name = request.getParameter("name");
   String shippingDate = request.getParameter("shippingDate");
   String country = request.getParameter("country");
   String zipCode = request.getParameter("zipCode");
   String addressName = request.getParameter("addressName");
   %>


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
                  <h2>주문 완료</h2>
               </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
               <div class="breadcrumb__links">
                  <a href="/index">홈</a> <span>주문 완료</span>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- Breadcrumb End -->

   <!-- Checkout Section Begin -->
   <section class="checkout spad">
      <div class="container">
         <div class="checkout__form">
            <form action="/products/shippinginfo" class="form-horizontal"
               method="post">
               <input type="hidden" name="cartId" value=${ sessionScope.id } />
               <div class="row">
                  <div class="col-lg-8 col-md-6">
                     <div class="row">
                        <div class="col-lg-10">
                           <div class="checkout__input">
                              <h2 class="alert alert-danger">
                                 <%
                                 if (cartId.length() < 2) {
                                    out.println("비회원");
                                 } else {
                                    out.println(cartId);
                                 }
                                 %>님 주문해주셔서 감사합니다.
                              </h2>

                           </div>
                        </div>

                     </div>
                     <div class="row">
                        <div class="col-lg-17">
                           <div class="checkout__input">
                              <p>
                              <h3>
                                  주문은 <strong> <%
                               out.println(addressName);
                               %></strong>에 배송될
                                 예정입니다!
                              </h3>
                              <p>
                           </div>
                        </div>
                     </div>

                     <div class="row">
                        <div class="col-lg-10">
                           <div class="checkout__input">
                              <p>
                              <h3>
                                 이름 : <strong> <%
                               out.println(name);
                               %></strong>
                              </h3>
                              <p>
                           </div>
                        </div>
                     </div>

                     <div class="row">
                        <div class="col-lg-10">
                           <div class="checkout__input">
                              <p>
                              <h3>
                                 주문 날짜 : <strong> <%
                               out.println(shippingDate);
                               %></strong>
                              </h3>
                              <p>
                           </div>
                        </div>
                     </div>

                     <div class="row">
                        <div class="col-lg-10">
                           <div class="checkout__input">
                              <p>
                              <h3>
                                 나라 : <strong> <%
                               out.println(country);
                               %></strong>
                              </h3>
                              <p>
                           </div>
                        </div>
                     </div>

                     <div class="row">
                        <div class="col-lg-10">
                           <div class="checkout__input">
                              <p>
                              <h3>
                                 우편 번호 : <strong> <%
                                  out.println(zipCode);
                                  %></strong>
                              </h3>
                              <p>
                           </div>
                        </div>
                     </div>

                     <div class="row">
                        <div class="col-lg-10">
                           <div class="checkout__input">
                              <p>
                              <h3>
                                 주소 : <strong> <%
                                  out.println(addressName);
                                  %></strong>
                              </h3>
                              <p>
                           </div>
                        </div>
                     </div>

                     <div class="container">
                        <p>
                        <br>
                        <br>
                        <a href="/index" class="btn btn-lg bg-warning"> &laquo; 홈</a>
                     </div>

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