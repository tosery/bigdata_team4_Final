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
                  <h2>회원가입</h2>
               </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
               <div class="breadcrumb__links">
                  <a href="/index">홈</a> <span>회원가입</span>
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
            <form action="/member/join" method="POST">
               <div class="row">
                  <div class="col-lg-8 col-md-6">
                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 이름<span>*</span>
                              </p>
                              <input type="text" name="name">
                           </div>
                        </div>
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 아이디<span>*</span>
                              </p>
                              <input type="text" class="form-control" id="id"
                                 aria-describedby="idHelp" name="id"> <small
                                 id="idHelp" class="form-text text-muted">아이디는 필수 입력
                                 요소입니다.</small>
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
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 비밀번호 재확인<span>*</span>
                              </p>
                              <input type="password">
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">

                              <p>
                                 우편번호<span>*</span>
                              <p>
                                 <input id="member_post" type="text" placeholder="찾기" readonly
                                    onclick="findAddr()" name="address1">
                           </div>
                        </div>
                        <div class="col-lg-6">
                           <div class="checkout__input">

                              <p>
                                 주소<span>*</span>
                              <p>
                                 <input id="member_addr" type="text" placeholder="주소" readonly
                                    name="address2">
                           </div>
                        </div>
                        <div class="col-lg-6">
                           <div class="checkout__input">

                              <p>
                                 상세주소<span>*</span>
                              <p>
                                 <input type="text" placeholder="상세 주소" name="address3">
                           </div>
                        </div>
                     </div>
                     <script>
                        function findAddr() {
                           new daum.Postcode(
                                 {
                                    oncomplete : function(data) {

                                       console.log(data);

                                       // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                                       // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                                       // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                       var roadAddr = data.roadAddress; // 도로명 주소 변수
                                       var jibunAddr = data.jibunAddress; // 지번 주소 변수
                                       // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                       document
                                             .getElementById('member_post').value = data.zonecode;
                                       if (roadAddr !== '') {
                                          document
                                                .getElementById("member_addr").value = roadAddr;
                                       } else if (jibunAddr !== '') {
                                          document
                                                .getElementById("member_addr").value = jibunAddr;
                                       }
                                    }
                                 }).open();
                        }
                     </script>
                     <script
                        src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 휴대전화<span>*</span>
                              </p>
                              <input type="text" name="phonenumber">
                           </div>
                        </div>
                        
                     </div>
                     
                     <div class="row">
                     <div class="col-lg-6">
                           <div class="checkout__input">
                              <p>
                                 Email<span>*</span>
                              </p>
                              <input type="email" name="email">
                           </div>
                        </div>
                     
                     </div>

                     <div class="row">
                        <div class="form-group">
                           <div class="col-lg-8">
                              <div class="checkout__input">
                                 <p>
                                    성별<span>*</span>
                                 </p>

                              </div>
                              <select class="form-control mx-3" id="gender" name="gender">
                                 <option value="" disabled selected>성별을 선택하세요.</option>
                                 <option value="M">남자</option>
                                 <option value="F">여자</option>
                                 <option value="U">선택 안함</option>
                              </select>
                           </div>
                        </div>
                        <br>
                        
                     </div>

                     <div class="row">
                     <div class="col-lg-6">
                           <div class="form-group">
                           <div class="checkout__input">
                              <p>
                                 생년월일<span>*</span>
                              </p>
                           </div>
                           <input type="date" class="form-control" id="birthday"
                              name="birth">
                        </div>
                        </div>
                     
                     </div>

                     <div class="form-group">
                        <div class="col-lg-6">
                           <div class="checkout__input">

                              <button class="btn btn-lg bg-warning">회원가입</button>
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
   <script>
      $('input#id').on(
            'focusout',
            function() {

               let id = $(this).val();
               if (id.length == 0) {
                  return;
               }

               // ajax 함수 호출
               $.ajax({
                  url : '/api/members/' + id + '.json',
                  method : 'GET',
                  success : function(data) {
                     console.log(typeof data); // object
                     console.log(data); // {}

                     if (data.count == 0) {
                        $('small#idHelp').html('사용가능한 아이디 입니다.')
                              .removeClass('text-muted').removeClass(
                                    'text-danger').addClass(
                                    'text-success');
                     } else { // data.count == 1
                        $('small#idHelp').html('이미 사용중인 아이디 입니다.')
                              .removeClass('text-muted').removeClass(
                                    'text-success').addClass(
                                    'text-danger');
                     }
                  },
                  error : function(request, status, error) {
                     alert('code: ' + request.status + '\n message: '
                           + request.responseText + '\n error: '
                           + error);
                  }
               });

            });
   </script>



</body>

</html>