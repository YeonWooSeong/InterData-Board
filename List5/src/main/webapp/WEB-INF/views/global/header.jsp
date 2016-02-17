<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<nav class="headersyw" id="headerSyw" style="width: 1553px; height: 30px;  font: normal; background-color: 337ab7; margin: auto;">
<div class="headerBar">
<ul class="header_hreff">
<!-- not Login -->
<c:if test="${empty sessionScope.user}">
<li>
<font color="white" size="2em;">인터데이터 게시판 페이지에 오신걸 환영합니다.</font><font style="color: white; margin-left: 15px;" > 손님</font>
</li>
</c:if>


<!-- Login -->
 <c:if test= "${not empty sessionScope.user}">
 <li>
 <font color="white">인터데이터 게시판 페이지에 오신걸 환영합니다.</font><font style="color: white; margin-left: 20px;">${user.name} 님.</font>
 </li>
 <li>
 <a style="color: white; margin-left: 97%;" class="page-scroll" data-toggle="modal" href="#mypage_Modal" id="id_Click">마이페이지</a>
 </li>
 </c:if>
 
</ul>
</div>
</nav>


