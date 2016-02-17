<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<section class="bg-dark" id="temp-inter" style="height:50%; padding-top:2%;">
<div class="tem-sub" id="temp-sub"></div>
</section>



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
                        <input type="text" class="form-control" placeholder="ID" id="join_Id" onkeyup="Members.checking_Id()">
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

<!-- 글쓰기 눌렀을때 -->
<div id="writeModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" style="margin-right:37%">
   	<div class="modal-content" style="width:800px;">
   		<div class="modal-body" style="height:600px;">
   			<div style="margin-left:8%;">
   			<span id="code2" style="visibility:hidden"></span>
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
    			<button id="read_btn" class="btn btn-primary btn-lg center-block" data-dismiss="modal" aria-hidden="true" style="margin-left:0;">게시판으로</button>
    			
    		</div>
    		<div id="reply_area" style="padding-top:10px;">
    		</div>
    	</div>
   	</div>
   	</div>
</div>

<!-- 글 수정할 때 -->
<div id="update_Modal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
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



 <script src="${js}/jquery-1.11.1.min.js"></script>
    <script src="${js}/lumino.glyphs.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.0.0/jquery.magnific-popup.min.js"></script>
<script type="text/javascript" src="${js}/new_event.js"></script>
<script type="text/javascript" src="${js}/bootstrap.min.js"></script>
<script type="text/javascript" src="${js}/bootstrap-table.js"></script>
<script type="text/javascript" src="${js}/bootstrap-datepicker.js"></script>
<script>
$(function(){
	
	newEvent.init(1);

})

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
	
	
</script>