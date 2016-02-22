<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="bg-dark" id="temp-inter">
</div>



<!-- 회원가입 -->
<div id="joinModal" class="modal fade"  tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content" style="height: 570px;">
    	<div class="modal-body">
    		<h2 class="text-center">회원가입</h2>
    		<hr />
    		<h5 class="text-center">
    		   저희 사이트에서 제공하는 서비스를 사용하시려면, 회원가입을 먼저 진행해주세요.
    		</h5>
    		<br />
    		<div class="col-lg-10 col-lg-offset-1 text-center">
                <form class="contact-form row">
                
                	<div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="text" class="form-control" placeholder="ID" name=join_Idd id="join_Id" onkeyup="syw.checking_Id()">
                    
                        <label style="float: left; color: red;" id="check_Msg">아이디를 입력해주세요 ♬</label>
                    	<div style="height:20px;"></div>
                    </div>
                    
                	<div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="email" class="form-control" placeholder="Email" id="email">
                    	<div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="password" class="form-control" placeholder="password" id="join_Password">
                   		<div style="height:12px;"></div>
                    </div>
                    <div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="password" class="form-control" placeholder="password Confirm" id="join_Password2">
                   		<div style="height:12px;"></div>
                    </div>
                    <div class="col-md-4" style="width: 300px; float: left;">
                        <label></label>
                        <input type="text" class="form-control" placeholder="Name" id="name">
                        <div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px; float: left;">
                        <label></label>
                        <input type="text" class="form-control" placeholder="Phone(  -없이 입력해주세요)" id="phone">
                        <div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 180px; float: left;">
                        <label></label>
                        <input type="text" class="form-control" placeholder="인증번호" id="confirm_num"></input>
                        <div style="height:12px;"></div>
                    </div>
                    
                    <button type="button" id="btn_confirm"
                    style="margin-top:6px; font-size: 12px; width: 100px; border-radius: 10px; float: left;" 
                    class="btn btn-primary btn-block">인증번호 발송</button>
                    
                    <div class="col-md-4 col-md-offset-4">
                        <label></label>
                        <button type="button" data-toggle="modal" data-dismiss="modal" class="btn btn-primary btn-block btn-lg" id="join">회원가입 <i class="ion-android-arrow-forward"></i></button>
                    </div>
                </form>
            </div>
    	</div>
    </div>
    </div>
</div>

<!-- 로그인 버튼을 클릭하였을 경우 -->
<div id="loginModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
    	<div class="modal-body">
    		<h2 class="text-center">로그인</h2>
    		<hr />
    		<h5 class="text-center">
    		    InerData에 오신것을 환영합니다.
    		</h5>
    		<br />
    		<label for="id" style="padding-left:10%">아이디</label>
    		<input type="text" name="id" id="id" placeholder="아이디" style="color: black;"/> &nbsp;&nbsp;
    		<label for="password">비밀번호</label>
    		<input type="password" name="password" id="password" placeholder="비밀번호" style="color: black;"/>
    		<br/>
    		<button class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true" id="login" > login </button>
    	</div>
    </div>
    </div>
</div>



<!-- 업데이트 페이지 - 정보수정 버튼 클릭했을 때 -->
<div id="update_Modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content" style="height:540px; width:400px; margin-left:100px;">
    	<div class="modal-body">
    		<h2 class="text-center">My Page - 정보수정</h2>
    		<hr />
    		<h5 class="text-center">
    		  내 정보수정 페이지(Update Page)
    		</h5>
    		<br />
    		<div class="col-lg-10 col-lg-offset-1 text-center">
                <form class="contact-form row">
                
                	<div class="col-md-4" style="width: 300px;">
                        <input type="text" class="form-control" value="${user.id}" id="update_Id" readonly="readonly" style="color: black;">
                    	<div style="height:12px;"></div>
                    </div>
                    
                	<div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="email" class="form-control" value="${user.email}" id="update_Email" readonly="readonly" style="color: black;">
                    	<div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="password" class="form-control" value="${user.password}" id="update_Password" style="color: black;">
                   		<div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px; float: left;">
                        <label></label>
                        <input type="text" class="form-control" value="${user.name}" id="update_Name"  readonly="readonly" style="color: black;">
                        <div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px; float: left;">
                        <label></label>
                        <input type="text" class="form-control" placeholder="${user.phone}" id="update_Phone" style="color: black;">
                        <div style="height:12px;"></div>
                    </div>
                    
                    <button type="button" id="btn_Update" 
                    data-toggle="modal"
                    data-dismiss="modal"
                    style="margin-top:6px; margin-left: 45px;
                    width: 100px; border-radius: 10px; float: left;"
                    title="Update"
                    class="btn btn-primary btn-block">정보수정</button>
                    
                    <button type="button" id="btn_Delete"
                    style="margin-top:6px; width: 100px; margin-left: 10px; border-radius: 10px; float: left;" 
                    class="btn btn-primary btn-block" data-dismiss="modal">회원탈퇴</button>
                    <button id="read_btn" class="btn btn-primary btn-block" data-dismiss="modal" aria-hidden="true" style="margin-top:17px; margin-left: 45px;  width: 100px; border-radius: 10px; float: left;">돌아가기</button>
                    
                </form>
            </div>
    	</div>
    </div>
    </div>
</div>


<!-- 마이페이지 -->
<div id="mypage_Modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" style="">
    <div class="modal-dialog">
    <div class="modal-content" style="height:540px; width:400px; margin-left:100px;">
    	<div class="modal-body" id="mypage">
    		<h2 class="text-center">My Page</h2>
    		<hr />
    		<h5 class="text-center">
    		  마이페이지(My Page)
    		</h5>
    		<br />
    		<div class="col-lg-10 col-lg-offset-1 text-center">
                <form class="contact-form row">
                
                	<div class="col-md-4" style="width: 300px;">
                        <input type="text" class="form-control" value="${user.id}" id="mypage_Id" readonly="readonly" style="color: black;">
                    	<div style="height:12px;"></div>
                    </div>
                    
                	<div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="email" class="form-control" value="${user.email}" id="mypage_email" readonly="readonly" style="color: black;">
                    	<div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px;">
                        <label></label>
                        <input type="password" class="form-control" value="${user.password}" id="mypage_Password" readonly="readonly" style="color: black;">
                   		<div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px; float: left;">
                        <label></label>
                        <input type="text" class="form-control" value="${user.name}" id="mypage_name" readonly="readonly" style="color: black;">
                        <div style="height:12px;"></div>
                    </div>
                    
                    <div class="col-md-4" style="width: 300px; float: left;">
                        <label></label>
                        <input type="text" class="form-control" value="${user.phone}" id="mypage_Phone" readonly="readonly" style="color: black;">
                        <div style="height:12px;"></div>
                    </div>
                    
                    <button type="button" id="btn_Logout"
                    style="margin-top:6px; margin-left: 45px; 
                    width: 100px; border-radius: 10px; float: left;" 
                    class="btn btn-primary btn-block" data-dismiss="modal">로그아웃</button>
                    
                 	<a class="btn btn-primary btn-block" data-toggle="modal"
                 	data-dismiss="modal"
                 	style="margin-top:6px; width: 100px; margin-left: 10px;
                   	border-radius: 10px; float: left;"
                 	title="Mypage Update" 
                 	href="#update_Modal">
                 	내정보수정</a>
             		
             		<button id="read_btn" class="btn btn-primary btn-block" data-dismiss="modal" aria-hidden="true" style="margin-top:17px; margin-left: 45px;  width: 100px; border-radius: 10px; float: left;">돌아가기</button>
      
              
                   <%--  <c:forEach var="ticket" items="${tickets}" varStatus="status">
                    <input type="radio" id="${ticket.ticketNumber}" name="tickets" class="ticket_info" value="${status.index}" style="display: none;">
                    <label style="margin-top:5px;" for="${ticket.ticketNumber}">${ticket.ticketNumber}</label><br/>
                    </c:forEach> --%>
                </form>
            </div>
            
    	</div>
    </div>
    </div>
</div>

<!-- id/pw 찾기 모달 -->
<!-- Modal -->
  <div class="modal fade" id="findModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width: 60%">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Id / Pw 찾기</h4>
        </div>
        <div class="modal-body">
          <p>항목을 선택해 주세요</p>
        </div>
        <div class="modal-footer">
          <button id="findId" type="button" class="btn btn-default" class="page-scroll" data-toggle="modal" data-target="#findIdform" >아이디 찾기</button>
          <button id="findPw" type="button" class="btn btn-default" class="page-scroll" data-toggle="modal" data-target="#findPwform">비밀번호 찾기</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>

<!-- 아이디찾기 -->

<div class="modal fade" id="findIdform" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" 
                   data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   아이디 찾기.
                </h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                  <div class="form-group">
                    <label  class="col-sm-2 control-label"
                              for="inputEmail3">이름</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" style="width:40%" 
                        id="inputEmail3"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"
                          for="inputPassword3" >폰번호</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" style="width:40%"
                            id="inputPassword3" placeholder="Password"/>
                    </div>
                  </div>
                </form>
            </div>
            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">
				확인
                </button>
            </div>
        </div>
    </div>
</div>


<!-- 비밀번호 찾기 -->
<div class="modal fade" id="findPwform" tabindex="-1" role="dialog" 
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <button type="button" class="close" 
                   data-dismiss="modal">
                       <span aria-hidden="true">&times;</span>
                       <span class="sr-only">Close</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">
                   비밀번호 찾기.
                </h4>
            </div>
            
            <!-- Modal Body -->
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                  <div class="form-group">
                    <label  class="col-sm-2 control-label"
                              for="inputEmail3">아이디</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" style="width:40%" 
                        id="inputId"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label"
                          for="inputPassword3" >이메일</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control" style="width:40%"
                            id="inputName"/>
                    </div>
                  </div>
                   <div class="form-group">
                    <label class="col-sm-2 control-label"
                           >인증번호</label>
                    <div class="col-sm-10">
                     <input type="text" class="form-control" style="width:30%"
                            id="inputConfirmtext"/>
                        <button id="inputConfirm" type="button" class="btn btn-default" class="page-scroll" data-toggle="modal">인증번호 전송</button>
                    </div>
                  </div>
                </form>
            </div>
            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary">
				확인
                </button>
            </div>
        </div>
    </div>
</div>







<!-------------------------------------------- 게시판 ----------------------------------------------------->
<!-- 글쓰기 눌렀을때 -->
<div id="writeModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" style="margin-right:37%">
   	<div class="modal-content" style="width:800px;">
   		<div class="modal-body" style="height:600px;">
   			<div style="margin-left:8%;">${user.id}
   				<label for="title" style="display:block;">제목</label>
    			<input name="title" type="text" size="80" maxlength="100" style="width:90%; color:black;"/>
    		</div>
    		<br />
    		<div style="margin-left:8%">
   				<label for="content" style="display:block;">내용</label>
   				<textarea name="content" cols="82" rows="20" style="width:90%; color:black;"></textarea>
   			</div>
   			<br />
   			<div>
   				<button id="write_close_btn" class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true" style="float:left; margin-left:37%; margin-right:20px;">취소 <i class="ion-android-close"></i></button>
    			<button id="write_btn" class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true" style="margin:0;">확인 O</button>
    		</div>
    	</div>
   	</div>
   	</div>
</div>



<!-- 글 제목을 눌러 읽을때 -->
<div id="readModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" style="margin-right:37%">
   	<div class="modal-content" style="width:800px;">
   		<div class="modal-body" style="min-height:800px;">
   			<div style="margin-left:8%;">
   				<span id="code" style="visibility:hidden"></span>
   				<label for="title" style="display:block;">제목</label>
    			<input name="title" type="text" disabled size="80" maxlength="100" style="width:90%; color:black;"/>
    		</div>
    		<br />
    		<div style="margin-left:8%">
   				<label for="content" style="display:block;">내용</label>
   				<textarea name="content" disabled cols="82" rows="20" style="width:90%; height:40%; color:black;"></textarea>
   			</div>
   			<br />
    		<div style="margin-left:8%">
   				<label for="reply" style="display:block;">댓글쓰기</label>
   				<textarea name="reply" cols="82" rows="20" style="width:90%; height:10%; color:black;"></textarea>
   			</div>
   			<br />
   			<div>
   				<button id="reply_btn" class="btn btn-primary btn-lg center-block" style="margin-left:35%; margin-right:20px; float:left;">댓글달기</button>
    			<button id="read_btn" class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true" style="margin-left:0;">종료</button>
    		</div>
    		<div id="reply_area" style="padding-top:10px;">
    		</div>
    	</div>
   	</div>
   	</div>
</div>


<!-- 글 수정할 때 -->
<div id="equip_Modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" style="margin-right:37%">
   	<div class="modal-content" style="width:800px;">
   		<div class="modal-body" style="min-height:800px;">
   			<div style="margin-left:8%;">
   				<span id="code" style="visibility:hidden"></span>
   				<label for="title2" style="display:block;">제목</label>
    			<input name="title2" type="text" size="80" maxlength="100" style="width:90%; color:black;"/>
    		</div>
    		<br />
    		<div style="margin-left:8%">
   				<label for="content2" style="display:block;">내용</label>
   				<textarea name="content2" cols="82" rows="20" style="width:90%; color:black;"></textarea>
   			</div>
   			<br />
   			<br />
   			<div>
   				<button id="equip_btn2" class="btn btn-primary btn-lg center-block" style="margin-left:0;">수정하기</button>
   				<button id="delete_btn" class="btn btn-primary btn-lg center-block" style="margin-left:38%; margin-right:20px; float:left;">글 삭제</button>
    			<button id="read_btn" class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true">취소</button>
    		</div>
    		<div id="reply_area" style="padding-top:10px;">
    		</div>
    	</div>
   	</div>
   	</div>
</div>

<script>
var patternId = /^[a-z][a-z\d]{3,11}$/;
var patternHangle = /^[가-힣]{2,4}$/;
var patternEmail =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var patternName = /^[가-힝]{2,}$/;
var patternPw = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
var patternPhoneNumber = /^[0-9]{12}$/;
var patternId = /^[a-z][a-z\d]{3,11}$/;
var number = /^[0-9]*$/;

var check_id = $("#join_Id").val();
var check_id2 = document.getElementById('join_Id');
var check_email = $("#email").val();
var check_email2 = document.getElementById('email');
var check_password = $("#join_Password").val();
var check_password2 = document.getElementById('join_Password');
var check_password3 = document.getElementById('join_Password2');

var check_name = $("#name").val();
var check_name2 = document.getElementById('name');
var check_phone = $("#phone").val();
var check_phone2 = document.getElementById('phone');
var check_confirm_num = $("#confirm_num").val();
function chk(re, e, msg) {
    if (re.test(e.value)) {
            return true;
    }

    alert(msg);
    e.value = "";
    e.focus();
    return false;
}
//* 회원가입 

//글자수 제한 체크 


$("#join").click(function(){
	var check_confirm_num = $("#confirm_num").val();
	if(!chk(patternId,check_id2, "아이디는 시작은 영문으로만, 첫글자는 영문 소문자, 4~12자 입력할것!"))
		return false;
	 if(!chk(patternEmail,check_email2, "이메일 형식에 어긋납니다."))
         return false;
	 if(!chk(patternPw,check_password2,"비밀번호는 영문,숫자 혼용하여 6~20자 이내로 입력해주세요."))
		 return false;
	 if(check_password2.value!=check_password3.value&&check_password3.value!=check_password2.value) {
         alert("비밀번호가 일치하지 않습니다.");
  }
	 if(!chk(patternName,check_name2,"이름은 한글로만 2글자 이상을 기입해 주세요"))
         return false;
	 if(!chk(number,check_phone2,"번호는 숫자만 입력할 수 있습니다."))
		 return false;
	 else if(check_confirm_num === "") {
			alert('인증번호를 입력해 주세요.');
		} else {
			syw.join();	
		}
});

/* 이메일 인증 */
$("#btn_confirm").click(function(){
	var check_Confirm_Email = $("#email").val();
	if(check_Confirm_Email === ""){
		alert('이메일 입력란을 채워주세요.');
	}
	else{
		syw.join_Auth();
	}
});




/*로그인*/
 $("#login").click(function() {
	syw.login();
})
 

/* 로그아웃 */
$("#btn_Logout").click(function(){
	location.href = context + "/member/logout";
});

/* 정보수정 버튼 */
$("#btn_Update").click(function(){
	if(confirm('정보수정을 하시겠습니까?')) {
		syw.update();
	}
});



/*탈퇴버튼*/
$("#btn_Delete").click(function(){
	if(confirm('정말 회원탈퇴를 하시겠습니까?')) {
		
		syw.delete_Member();
	}
});

var userid = null;
/*게시판 버튼*/
$("#write_btn").click(function() {
	if($("#writeModal input:text[name=title]").val() === ""){
		$("#write_btn").attr("data-dismiss","");
		alert("제목을 필수로 입력해주세요.");
	} else {
		$("#write_btn").attr("data-dismiss","modal");
		newEvent.write();
	}
});
// 취소 //
$("#write_close_btn").click(function() {
	$("input:text[name=title]").val("");
	$("textarea[name=content]").val("");
});


/*삭제버튼*/
$("#delete_btn").click(function(){
	$.ajax(context + "/article/delete",{
		data : {
		code : $("#code").text()
		},
		
		success : function(data) {
			alert('글이 삭제 되었습니다.');
			newEvent.init(1);
		},
		error : function() {
			
		}
		
	});
	location.reload();
});
/*수정버튼*/
$("#equip").click(function(){
	$.ajax(context + "/article/read",{
		data : {
			"code" : data
		},
		success : function(data) {
			$("#readModal input:text[name=title2]").val(data.writing.usrSubject);
			$("#readModal textarea[name=content2]").val(data.writing.usrContent);
			newEvent.drawReply(data.reply);
		},
		error : function() {
			alert("ajax 실패");
		}
	});
	
});

$("#equip_btn2").click(function(){
	$.ajax(context + "/article/write2",{
		data : {
			"title" : $("input:text[name=title2]").val(),
			"content" : $("textarea[name=content2]").val(),
		},
		method : "post",
		success : function() {
			alert("수정완료");
			$("input:text[name=title2]").val("");
			$("textarea[name=content2]").val("");
			newEvent.init(1);
		},
		error : function() {
			alert("제목을 30자 내로 써주세요.");
			
		}
	});
})
	var index = 1;
	$("#reply_btn").click(function() {
		if(userid != null){
			$.ajax(context + "/article/reply ",{
				data : {
					"code" : $("#code").text(),
					"id" : $(".navbar-right a").text(),
					"content" : $("#readModal textarea[name=reply]").val()
				},
				success : function(data) {
					newEvent.drawReply(data.reply);
				},
				error : function() {
					
				}
			});
			
		}else{
			alert("댓글을 달려면 먼저 로그인을 해주세요");
		}
	});
	
	
	//id 찾기
	$("#findId").click(function(e) {
		$("#findId").attr("data-target","#findIdform");	
	});
	
	//pw 찾기
		$("#findPw").click(function(e) {
		$("#findPw").attr("data-target","#findPwform");	
	});

</script>