<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>배송 정보</title>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
</head>
<body>
 <jsp:include page="/WEB-INF/views/include/Nav.jsp" />
   <div class="jumbotron">
      <div class="container">
         <h1 class="display-3">배송 정보</h1>
      </div>
   </div>
   <div class="container">
      <form action="/products/shippinginfo" class="form-horizontal" method="post">
         <input type="hidden" name="cartId" value=${ sessionScope.id } />
         <div class="form-group row">
            <label class="col-sm-2">성명</label>
            <div class="col-sm-3">
               <input name="name" type="text" class="form-control" />
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">배송일</label>
            <div class="col-sm-3">
               <input name="shippingDate" type="date" class="form-control" />(연/월/일)
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">국가명</label>
            <div class="col-sm-3">
               <input name="country" type="text" class="form-control" />
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">우편번호</label>
            <div class="col-sm-3">
               <input name="zipCode" type="text" class="form-control" />
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2">주소</label>
            <div class="col-sm-5">
               <input name="addressName" type="text" class="form-control" />
            </div>
         </div>
         <div class="form-group row">
            <div class="col-sm-offset-2 col-sm-10 ">
<%--                <a href="/products/details?pnum=${ }" class="btn btn-secondary" role="button"> 이전 </a>  --%>
               <input   type="submit" class="btn btn-primary" value="등록" />
               <a href="/products/checkOutCancelled" class="btn btn-secondary" role="button"> 취소 </a>
            </div>
         </div>
      </form>
   </div>
</body>
</html>