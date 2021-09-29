<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 완료</title>
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
   <jsp:include page="/WEB-INF/views/include/Nav.jsp" />
   <div class="jumbotron">
      <div class="container">
         <h1 class="display-3">주문 완료</h1>
      </div>
   </div>
   <div class="container">
      <h2 class="alert alert-danger"><%  if (cartId.length() < 2) {out.println("비회원");} else{out.println(cartId);}
         %>님 주문해주셔서 감사합니다.</h2>
   
      <p>   주문은   <%   out.println(addressName);%>에 배송될 예정입니다! !   
      <p>   이름 :   <%   out.println(name);   %>      
      <p>   주문 날짜 :   <%   out.println(shippingDate);   %>      
      <p>   나라 :   <%   out.println(country);   %>      
      <p>   우편 번호 :   <%   out.println(zipCode);   %>      
      <p>   주소 :   <%   out.println(addressName);   %>      
   </div>
   <div class="container">
      <p><a href="/index" class="btn btn-secondary"> &laquo; 홈</a>   
   </div>
</body>
</html>
