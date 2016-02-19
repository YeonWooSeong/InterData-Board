var syw = {
		//  Main
		sywLogin : function() {
			var table = '<div class="container"><div class="row" style="margin-top: 10%;"><div class="col-sm-6 col-md-4 col-md-offset-4"><h1 class="text-center login-title">InterData</h1><div class="account-wall">'
				+'<img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120" alt="">'
				+'<form class="form-signin">'
				+'<input type="text" id="id" class="form-control" placeholder="아이디를 입력하세요" style="margin-bottom: 5%;" required autofocus>'
				+'<input type="password" id="password" class="form-control" placeholder="비밀번호를 입력하세요" style="margin-bottom: 5%;" required>'
				+'<button class="btn btn-lg btn-primary btn-block" type="submit" id="setLogin">로그인</button>'
				+'<a href="#" class="pull-right need-help">아이디/비밀번호 찾기.</a><span class="clearfix"></span></form></div>'
				+'<a data-toggle="modal" href="#joinModal" class="text-center new-account">"회원가입"</a></div></div></div>';
				$("#temp-inter").html(table);
			$("#register").click(function() {
				location.href = "#joinModal";
			});
			$("#setLogin").click(function() {
				syw.login();
				
			});
		},
		
		// 로그인
		login : function() {
			
			$.ajax(context + "/member/login",{
				data : {"id" : $("#id").val(),
						"password" :$("#password").val()
				},
				type : "post",
				success : function(data) {
					if(data.member != null){
						$("#bs-navbar").load(context + "/member/headerReload #bs-navbar");
						userid = data.member.id;
					
						$("#mypage_Id").val(data.member.id);
						$("#mypage_email").val(data.member.email);	
						$("#mypage_Phone").val(data.member.phone);
						$("#mypage_Password").val(data.member.password);
						$("#mypage_name").val(data.member.name);
						$("#update_Id").val(data.member.id);
						$("#update_Email").val(data.member.email);
						$("#update_Phone").val(data.member.phone);
						$("#update_Password").val(data.member.password);
						$("#update_Name").val(data.member.name);
						location.reload();
						alert('환영합니다 '+userid +'님.');
					} else{
						alert("아이디 혹은 패스워드를 다시한번 확인해주세요");
					}
				},
				error : function() {
					alert("아이디 혹은 패스워드를 다시한번 확인해주세요 Error");
				}
			});
		},
		
		
		
		// ID 중복체크
		checking_Id : function() {
			$.ajax(context + "/member/checking_Id",{
				data : {"id" : $("#join_Id").val(),
					},
				type : "post",
				success : function(data) {
					// 아이디가 이미 존재할경우.
					if (data.id_fail == "id_fail") {
						document.getElementById('check_Msg').style.color = "red";
						document.getElementById('check_Msg').innerHTML = "가입되어있는 아이디입니다.";
					}
					// 아이디 사용가능할 경우.
					if (data.id_Confirm == "id_Confirm") {
						document.getElementById('check_Msg').style.color = "green";
						document.getElementById('check_Msg').innerHTML = "가능한 아이디입니다.";
					}
				},
				error : function() {
					document.getElementById('check_Msg').style.color = "red";
					document.getElementById('check_Msg').innerHTML = "아이디를 입력하세요.";
				}
			});
		},
			
		//회원가입
		join : function() {
			var join_Mem = {
				"id" :$("#join_Id").val(),
				"email" :$("#email").val(),
				"password" :$("#join_Password").val(),
				"name" :$("#name").val(),
				"phone" :$("#phone").val(),
				"confirm_num" :$("#confirm_num").val()
			};
			$.ajax(context + "/member/join",{
				data : JSON.stringify(join_Mem),
				dataType : "json",
				type : 'post',
				contentType : "application/json;",
				mimeType: "application/json;",
				async : false,
				success : function(data) {
					if(data.result == "success"){
						alert(data.name+"님 회원가입이 완료되었습니다.");
						location.reload(true);
					}
					if(data.result == "fail"){
						alert("회원가입을 실패하였습니다. 다시 시도해주세요.");
					}
					if(data.result == "not_Agreement"){
						alert("인증번호가 일치하지 않습니다. 인증을 다시 해주세요.");
					}
				},
				error : function(xhr, status, msg) {
				}
			});
		},
		
		
		//회원정보 수정
		update : function() {
			var update_Mem = {
				"id" :$("#update_Id").val(),
				"password" :$("#update_Password").val(),
				"phone" :$("#update_Phone").val(),
			};
			$.ajax(context + "/member/update",{
				data : JSON.stringify(update_Mem),
				dataType : "json",
				type : 'post',
				contentType : "application/json;",
				mimeType: "application/json;",
				success : function(data) {
					if(data.result == "success"){
						alert("회원정보수정이 완료되었습니다.");
						$("#mypage_Phone").val(update_Mem.phone);
						$("#mypage_Password").val(update_Mem.password);
					}
					if(data.result == "fail"){
						alert("정보수정을 실패하였습니다. 다시 시도해주세요.");
					}
				},
				error : function(xhr, status, msg) {
					alert('에러발생, 다시시도해주세요. 다시 시도하셔도 에러가 발생하면 관리자에게 문의해주세요.');
				}
			});
		},
		//탈퇴
		delete_Member : function() {
			$.ajax(context + "/member/delete",{
				data : {"delete_Id" : $("#update_Id").val(),
				},
				type : "post",
				success : function(data) {
					if(data.result == "success"){
						location.reload();
						alert("회원탈퇴가 완료되었습니다.");
					}
					if(data.result == "fail"){
						alert("회원탈퇴를 실패하였습니다.");
					}
				},
				error : function(xhr, status, msg) {
					alert('에러발생, 다시시도해주세요. 다시 시도하셔도 에러가 발생하면 관리자에게 문의해주세요.');
				}
			});
		},
		
		//email 인증
		join_Auth : function() {
			$.ajax(context + "/member/join_auth",{
				data : {"id" : $("#join_Id").val(),
						"e_mail" :$("#email").val(),
						"name" :$("#name").val()
				},
				type : "post",
				success : function(data) {
					//이메일이 발송.
					//아이디, 이메일이 전부 없을경우
					if(data.success == "success"){
						alert("인증번호가 이메일로 발송되었습니다.");
					}
					// 아이디가 이미 존재할경우.
					else if (data.id_fail == "id_fail") {
						alert("이미 가입되어 있는 '※ 아이디(ID) 입니다.' 아이디/비밀번호 찾기를 이용해주세요.");
					}
					// 이메일이 이미 존재할경우.
					else if (data.email_fail == "email_fail"){
						alert("이미 가입되어 있는 '※ 이메일(email) 입니다.' 아이디/비밀번호 찾기를 이용해주세요.");
					}
					
				},
				error : function() {
					alert('이메일을 입력하고 다시 시도해 주세요.');
				}
			});
		},
		testsyw : function() {
			var table = '<div class="testsyW" id="testsyW">테스트페이지</div>';
				$("#temp-inter").html(table);
		}
		
		
}