<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="bg-dark" id="temp-inter">

<form name="insertFrm"> 
<textarea name="test"  onKeyup="len_chk()"> 
</textarea> 
</form>

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
                        <input type="text" class="form-control" placeholder="ID" id="join_Id" onkeyup="syw.checking_Id()">
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


//* 회원가입 

//글자수 제한 체크 
function len_chk(){  
  var frm = document.insertFrm.test; 
    
  if(frm.value.length > 10){  
       alert("글자수는 영문10, 한글5자로 제한됩니다.!");  
       frm.value = frm.value.substring(0,10);  
       frm.focus();  
  } 

} 

$("#join").click(function(){
	var check_id = $("#join_Id").val();
	var check_email = $("#email").val();
	var check_password = $("#join_Password").val();
	var check_name = $("#name").val();
	var check_phone = $("#phone").val();
	var check_confirm_num = $("#confirm_num").val();
	if (check_id === "") {
		alert('아이디 공란을 채워주세요.');
	}else if(check_id.length>10){
		alert('10글자 오류 한글10/영어10');
		check_id = check_id.value.substring(0,10)
		
		
	} 
	else if(check_email === "") {
		alert('이메일 공란을 채워주세요.');
	} 
	else if(check_password === "") {
		alert('비밀번호 공란을 채워주세요.');
	} 
	else if(check_name === "") {
		alert('이름 공란을 채워주세요.');
	} 
	else if(check_phone === "") {
		alert('전화번호 공란을 채워주세요.');
	} 
	else if(check_confirm_num === "") {
		alert('공란을 채워주세요.');
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

</script>