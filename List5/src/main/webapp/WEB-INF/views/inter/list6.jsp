<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<section class="bg-dark" id="temp-inter">
<div class="tem-sub" id="temp-sub"></div>
</section>



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

<script>
$(function() {
	syw.sywLogin();
});

/* ('.modal').on('hidden.bs.modal', function () {
    $(this).removeData('bs.modal');
}); */

/* 회원가입 */
$("#join").click(function(){
	var check_id = $("#join_Id").val();
	var check_email = $("#email").val();
	var check_password = $("#join_Password").val();
	var check_name = $("#name").val();
	var check_phone = $("#phone").val();
	var check_confirm_num = $("#confirm_num").val();
	if (check_id === "") {
		alert('공란을 채워주세요.');
	} 
	else if(check_email === "") {
		alert('공란을 채워주세요.');
	} 
	else if(check_password === "") {
		alert('공란을 채워주세요.');
	} 
	else if(check_name === "") {
		alert('공란을 채워주세요.');
	} 
	else if(check_phone === "") {
		alert('공란을 채워주세요.');
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





</script>