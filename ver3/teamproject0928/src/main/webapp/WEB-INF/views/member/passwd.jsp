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
   <header class="header">
      <div class="header__top">
         <div class="container">
            <div class="row">
               <div class="col-lg-12">
                  <div class="header__top__inner">
                     <div class="header__top__left">
                        <ul>
                           <li><a href="/member/join">회원가입</a></li>
                           <li><a href="/member/login">로그인</a></li>
                        </ul>
                     </div>
                     <div class="header__logo">
                        <a href="/index"><img src="/resources/img/logo_widthVer.png"
                           alt=""></a>
                     </div>
                     <div class="header__top__right">
                        <div class="header__top__right__links">
                           <a href="#" class="search-switch"><img
                              src="/resources/img/icon/search.png" alt=""></a> <a href="#"><img
                              src="/resources/img/icon/heart.png" alt=""></a>
                        </div>
                        <div class="header__top__right__cart">
                           <a href="#"><img src="img/icon/cart.png" alt=""> <span></span></a>
                           <div class="cart__price">
                              Cart: <span>₩0.00</span>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="canvas__open">
               <i class="fa fa-bars"></i>
            </div>
         </div>
      </div>
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <nav class="header__menu mobile-menu">
                  <ul>
                     <li><a href="/index">홈</a></li>
                     <li><a href="/chatting">채팅</a></li>
                     <li><a href="#">물품</a></li>
                     <li><a href="#">마이페이지</a>
                        <ul class="dropdown">
                           <li><a href="#">단호박 온도</a></li>
                           <li><a href="#">장바구니</a></li>
                           <li><a href="#">회원정보수정</a></li>
                           <li><a href="#">비밀번호변경</a></li>
                        </ul></li>
                  </ul>
               </nav>
            </div>
         </div>
      </div>
   </header>
   <!-- Header Section End -->

   <!-- Breadcrumb Begin -->
   <div class="breadcrumb-option">
      <div class="container">
         <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
               <!-- <div class="breadcrumb__text"> -->
               <div>
                  <h2>비밀번호 수정</h2>
               </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
               <div class="breadcrumb__links">
                  <a href="./index.html">홈</a> <span>비밀번호 수정</span>
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
            <form action="/member/passwd" method="POST">
               <div class="row">
                  <div class="col-lg-8 col-md-6">
                     <div class="row">
                        
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 아이디<span>*</span>
                              </p>
                             <input type="text" value="${ sessionScope.id }" class="form-control" id="id" aria-describedby="idHelp" name="id" required autofocus readonly="readonly">
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 비밀번호<span>*</span>
                              </p>
                              <input type="text" name="passwd">
                           </div>
                        </div>
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 비밀번호 재확인<span>*</span>
                              </p>
                              <input type="text">
                           </div>
                        </div>
                     </div>
                     

                     <div class="form-group">
                        <div class="col-lg-6">
                           <div class="checkout__input">

                              <button class="btn btn-lg bg-warning">비밀번호 수정</button>
                              <button class="btn btn-lg bg-warning">초기화</button>
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
