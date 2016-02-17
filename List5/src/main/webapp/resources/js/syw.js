var syw = {
		//Login
		sywLogin : function() {
			var table = '<div class="container"><div class="row" style="margin-top: 10%;"><div class="col-sm-6 col-md-4 col-md-offset-4"><h1 class="text-center login-title">InterData</h1><div class="account-wall">'
				+'<img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120" alt="">'
				+'<form class="form-signin"><input type="text" class="form-control" placeholder="아이디를 입력하세요" style="margin-bottom: 5%;" required autofocus>'
				+'<input type="password" class="form-control" placeholder="비밀번호를 입력하세요" style="margin-bottom: 5%;" required><button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>'
				+'<a href="#" class="pull-right need-help">아이디를 잊으셨나요?</a><span class="clearfix"></span></form></div>'
				+'<a data-toggle="modal" href="#joinModal" class="text-center new-account">"회원가입"</a></div></div></div>';
				$("#temp-inter").html(table);
			$("#register").click(function() {
				location.href = "#joinModal";
			});
		}
			
}