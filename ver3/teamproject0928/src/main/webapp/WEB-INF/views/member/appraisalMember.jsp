<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- include head.jsp --%>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
<jsp:include page="/WEB-INF/views/include/Nav.jsp" />
</head>
<body>

<!-- Breadcrumb Begin -->
   <div class="breadcrumb-option">
      <div class="container">
         <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
               <!-- <div class="breadcrumb__text"> -->
               <div>
                  <h2>단호박 온도</h2>
               </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">

            </div>
         </div>
      </div>
   </div>
   <!-- Breadcrumb End -->

<section class="checkout spad">
      <div class="container">
         <div class="checkout__form">
   <form id="frm">


   <div class="row">
                  <div class="col-lg-8 col-md-6">
                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              
                              <input type="text" name="id" placeholder="회원 아이디를 입력하세요.">
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-lg-6">
                           <div class="checkout__input">
                              
                               <input type="text" name="temperature" placeholder="단호박온도 숫자로입력">
                           </div>
                        </div>
                     </div>

                      <button type="submit" id="btn" class="btn btn-lg bg-warning">단호박온도 변경</button>
                     
                  </div>

               </div>
      
   </form>
   </div>
   </div>
</section>
   <script src="/resources/js/jquery-3.3.1.min.js"></script>
   <script src="/resources/js/jquery.serializeObject.js"></script>

   <script>
      var Member = document.querySelector('.tempmemberid');
      Member.onchange = function() {
         var Tempappraisal = document.querySelector('.appraisal');
         var MemOption = Member.options[Member.selectedIndex].innerText;
         var TempappOptions = {
            badTemperature : ['1', '2', '3' ],
         }

         switch (MemOption) {
         case 'abc':
            var TempappOption = TempappOptions.badTemperature;
            break;
         case 'abcd':
            var TempappOption = TempappOptions.badTemperature;
            break;
         case 'sye':
            var TempappOption = TempappOptions.badTemperature;
            break;
         case 'team4':
            var TempappOption = TempappOptions.badTemperature;
            break;
         }
         Tempappraisal.options.length = 0;
         for (var i = 0; i < TempappOption.length; i++) {
            var option = document.createElement('option');
            option.innerText = TempappOption[i];
            Tempappraisal.append(option);
         }
      }
   </script>
   <script>
      $('form#frm').on(
            'submit',
            function(event) {
               // 폼 태그의 기본동작 막기
               event.preventDefault();

               let obj = $(this).serializeObject();
               console.log(typeof obj); // object
               console.log(obj);

               let strJson = JSON.stringify(obj);
               console.log(typeof strJson); // string
               console.log(strJson);

               let $frm = $('form#frm');

               // ajax 함수 호출
               $.ajax({
                  url : '/api/members/' + obj.id + '.json',
                  method : 'PUT',
                  data : strJson,
                  contentType : 'application/json; charset=UTF-8',
                  success : function(data) {
                     console.log(typeof data); // object
                     console.log(data); // {}

                     alert('온도정보 업데이트 성공!');

                     $frm[0].reset();
                  },
                  error : function(request, status, error) {
                     alert('code: ' + request.status + '\n message: '
                           + request.responseText + '\n error: '
                           + error);
                  }
               });
            });
   </script>
   <!-- Footer Section Begin -->
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<!-- Footer Section End -->
</body>

</html>