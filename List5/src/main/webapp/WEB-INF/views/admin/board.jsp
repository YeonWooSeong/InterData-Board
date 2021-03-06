<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FKOD - member</title>

<link href="${admin_css}/bootstrap.min.css" rel="stylesheet">
<link href="${admin_css}/datepicker3.css" rel="stylesheet">
<link href="${admin_css}/bootstrap-table.css" rel="stylesheet">
<link href="${admin_css}/styles.css" rel="stylesheet">

<!--Icons-->
<script src="${admin_js}/lumino.glyphs.js"></script>


</head>

<body>
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${context}/admin/main"><span>InterData</span>관리자</a>
				<a id="admin_logout" class="navbar-brand" href="#" style="float:right;">로그아웃</a>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<form role="search">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Search">
			</div>
		</form>
		<ul class="nav menu">
			<li class="active"><a href="${context}/admin/main"><svg class="glyph stroked dashboard-dial"><use xlink:href="#stroked-dashboard-dial"></use></svg> 홈</a></li>
			<li><a href="${context}/admin/member"><svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg> 회원관리</a></li>
			<li><a href="${context}/admin/board"><svg class="glyph stroked pencil"><use xlink:href="#stroked-pencil"></use></svg> 게시판관리</a></li>
		</ul>
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
				
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">게시판관리</h1>
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default" style="position:relative;">
					<div class="panel-heading">게시글 목록</div>
					<div class="panel-body">
					<div id="my_menu" style="position:absolute; top:11%;">
						<button id="notice" style="background:#E9ECF2; border:none;">공지글 쓰기</button>&nbsp;
						<button id="delete" style="background:#E9ECF2; border:none;">삭제</button>&nbsp;
					</div>
						<table id="member_table" data-toggle="table" data-url="tables/data1.json"  data-show-refresh="true" data-show-toggle="true" data-show-columns="true" data-search="true" data-select-item-name="toolbar1" data-pagination="true" data-sort-name="name" data-sort-order="desc">
						    <thead>
							    <tr>
							        <th data-field="check" data-checkbox="true" ></th>
							        <th data-field="name" data-sortable="true">번호</th>
							        <th data-field="id" data-sortable="true">제목</th>
							        <th data-field="password"  data-sortable="true">아이디</th>
							        <th data-field="email" data-sortable="true">작성일</th>
							        <th data-field="phone" data-sortable="true">조회수</th>
							    </tr>
						    </thead>
						    <tbody>
						    	<c:forEach items="${list}" var="article">
						    		<tr>
						    			<td></td>
						    			<td class="article_no">${article.rcdNo}</td>
						    			<td class="article_subject">${article.usrSubject}</td>
						    			<td class="article_userid">${article.usrName}</td>
						    			<td class="article_regdate">${article.usrDate}</td>
						    			<td class="article_refer">${article.usrRefer}</td>
						    		</tr>
						    	</c:forEach>
						    </tbody>
						</table>
					</div>
				</div>
			</div>
		</div><!--/.row-->	
	</div><!--/.main-->

	<script src="${admin_js}/jquery-1.11.1.min.js"></script>
	<script src="${admin_js}/bootstrap.min.js"></script>
	<script src="${admin_js}/bootstrap-datepicker.js"></script>
	<script src="${admin_js}/bootstrap-table.js"></script>
	<script>
		!function ($) {
			$(document).on("click","ul.nav li.parent > a > span.icon", function(){		  
				$(this).find('em:first').toggleClass("glyphicon-minus");	  
			}); 
			$(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
		}(window.jQuery);

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
		
		$(function() {
			/* 로그아웃 */
			$("#admin_logout").click(function() {
				$.ajax(context + "/admin/logout",{
					data : {
						
					},
					success : function() {
						location.href = context + "/";
					},
					error : function() {
						
					}
				});
			});
			
			/* 공지글 쓰기 */
			$("#notice").click(function() {
				location.href = context + "/admin/notice";
			});
			
			/* 삭제 하기 */
			$("#delete").click(function() {
				/* 선택된 항목이있을 경우에만 실행 */
				var length = $(".selected").length;
				if (length != 0) {
					/* 선택된 항목수만큼 반복 */
					for (var i = 0; i < length; i++) {
						$.ajax(context + "/admin/delete_writing",{
							data : {
								"code" : $(".selected:first .article_no").text()
							},
							async : false,
							success : function() {
								$(".selected:first").removeClass("selected");
							},
							error : function() {
								
							}
						});	
					}
					location.reload();
				} else {
					alert("삭제할 항목을 선택해주세요.");
				}
			});
		});
	</script>	
</body>

</html>
