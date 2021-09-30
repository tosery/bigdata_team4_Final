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
               <!-- <div class="breadcrumb__text"> -->
               <div>
                  <h2>배송 정보</h2>
               </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
               <div class="breadcrumb__links">
                  <a href="/index">홈</a> <span>배송 정보</span>
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
            <form action="/products/shippinginfo" class="form-horizontal" method="post">
              <input type="hidden" name="cartId" value=${ sessionScope.id } />
               <div class="row">
                  <div class="col-lg-8 col-md-6">
                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 성명
                              </p>
                               <input name="name" type="text" class="form-control" />
                           </div>
                        </div>
                        
                     </div>
                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">

                              <p>
                                 배송일
                              <p>
                                  <input name="shippingDate" type="date" class="form-control" />(연/월/일)
                           </div>
                        </div>
                        
                        
                     </div>
                     
                     
                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                국가명
                              </p>
                              <input name="country" type="text" class="form-control" />
                           </div>
                        </div>

                     </div>
                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                우편번호
                              </p>
                               <input name="zipCode" type="text" class="form-control" />
                           </div>
                        </div>

                     </div>

                    
                     
                     <div class="row">
                     <div class="col-lg-6">
                           <div class="form-group">
                           <div class="checkout__input">
                              <p>
                                주소
                              </p>
                           </div>
                            <input name="addressName" type="text" class="form-control" />
                        </div>
                        </div>
                     
                     </div>


                     <div class="form-group">
                        <div class="col-lg-6">
                           <div class="checkout__input">
               <input   type="submit" class="btn btn-lg bg-warning" value="주문하기" />
                <a href="/products/checkOutCancelled" class="btn btn-lg bg-warning" role="button"> 취소 </a>
                          
                           </div>
                        </div>
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