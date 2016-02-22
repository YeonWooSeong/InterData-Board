<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<nav class="headersyw" id="headerSyw" style="width: 1553px; height: 30px;  font: normal; background-color: 337ab7; margin: auto;">
<div class="headerBar">

<div id="bs-navbar">


<ul class="nav navbar-nav">
<!-- not Login -->
<c:if test="${empty sessionScope.user}">
<dd>
<font color="white" size="2em;">인터데이터 게시판 페이지에 오신걸 환영합니다.</font><font style="color: white; margin-left: 15px;" > 손님</font>
<a  style="color: white; margin-left: 63%;" class="page-scroll" data-toggle="modal" href="#joinModal" >회원가입</a>
<a  style="color: white; margin-left: 13px;" class="page-scroll" data-toggle="modal" href="#loginModal" >로그인</a>
<a  style="color: white; margin-left: 13px;" class="page-scroll" data-toggle="modal" href="#findModal" >ID/PW찾기</a>
</dd>																			
</c:if>




<!-- Login -->
 <c:if test= "${not empty sessionScope.user}">
 <dt>
 <font color="white">인터데이터 게시판 페이지에 오신걸 환영합니다</font><font style="color: white; margin-left: 20px;">${user.name} 님.</font>
  <a style="color: #FFE05C; margin-left:95px;" href="#" onclick="newEvent.init(1)">게시판보기</a>
 <a style="color: white; margin-left: 55%;" class="page-scroll" data-toggle="modal" href="#mypage_Modal" id="id_Click">마이페이지</a>
 </dt>
 </c:if>
 
</ul>

</div>

</div>
</nav>

