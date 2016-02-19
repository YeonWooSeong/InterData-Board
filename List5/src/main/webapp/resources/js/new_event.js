var newEvent = {
		
		userid : '',
		getUserid : function() {
			return this.userid;
		},
		setUserid : function(userid) {
			this.userid = userid; 
		},
		
		
			 init : function(page) {
				 $.getJSON(context + "/article/list/" + page, function(data) {
					 var count = data.count;
                     var pageNo = parseInt(data.pageNo);
                     var startPage = parseInt(data.startPage);
                     var lastPage = parseInt(data.lastPage);
                     var totalPage = parseInt(data.totalPage);
                     var groupSize = parseInt(data.groupSize);

					 var table = 
						 	'<span style="margin-left:46%; font-size:4em; color:black">게시판</span>'
						 	+'<span style="margin-left:30%;">총 게시글: '+ data.count +'개</span>'
						 	+'<table class="inter_tab" style="margin-bottom:10px;">'
							+'<tr style="border-bottom:solid;">'
							+'<th style="width:10%;">번호</th>'
							+'<th style="width:45%;">제목</th>'
							+'<th style="width:15%;">아이디</th>'
							+'<th style="width:15%;">작성일</th>'
							+'<th style="width:10%;">조회수</th>'
							+'<th style="width:10%;">비고</th>'
							+'</tr>';
					 
					 var arr = [];
					$.each(data.list, function(index, value) {
						table += 
							'<tr>'
							+'<td>'+ this.rcdNo +'</td>'
							+'<td><a id="read'+ this.rcdNo +'" href="#readModal" class="page-scroll" data-toggle="modal" style="color:#9385AD;">'+ this.usrSubject +'</a></td>'
							+'<td>'+ this.usrName +'</td>'
							+'<td>'+ this.usrDate +'</td>'
							+'<td>'+ this.usrRefer +'</td>'
							+'<td><a id="equip'+ this.rcdNo +'" href="#equip_Modal" class="page-scroll" data-toggle="modal" style="color:#9385AD;">수정</a></td>'
							+'</tr>';
						arr.push(this.rcdNo);
					});
					
					table += '</table>';

					var pagination = 
							'<div style="; ">'
							+ '<button id="list" class="btn btn-primary" style="float:left; margin-left:80px;">목록</button>'
							+ '<button id="write" class="btn btn-primary" data-toggle="modal" data-target="#writeModal" style="margin-right:80px; float:right;">글쓰기</button>'
							+ '</div>'
							+ '<table id="pagination">'
							+ '<tr>'
	                        + '<td align=right WIDTH=100>'
	                        + '</TD>'
	                        + '<TD WIDTH=320 ALIGN=CENTER>';

			        if (startPage != 1) {
                           pagination +=
                            '<a href="#temp-inter" onclick="newEvent.init(1)">'
                            + '<IMG SRC="'+ img +'/btn_bf_block.gif">&nbsp;'
                            + '</a>'
                            + '<a href="#temp-inter" onclick="newEvent.init('+(startPage-groupSize)+ ')">'
                            + '<IMG SRC="'+ img +'/btn_bf_page.gif">&nbsp;'
                            + '</a>'
                    }
                      
                    for (var i = startPage; i <= lastPage; i++) {
                        if (i == pageNo ) {
                               pagination +=
                                     '<font style="color:red;font-size: 20px">'+i+ '</font>';
                        } else {
                               pagination +=
                                     '<a href="#temp-inter" onclick="newEvent.init('+i+')">'
                                    + '<font>'+i+'</font>&nbsp;'
                                    + '</a>';
                       	}
                    }
                      
                    if (lastPage != totalPage) {
                           pagination +=
                               '<a href="#temp-inter" onclick="newEvent.init('+(startPage + groupSize)+ ')">'
                               + '<img src="'+ img +'/btn_nxt_page.gif"/> &nbsp;'
                               + '</a>'
                               + '<a href="#temp-inter" onclick="newEvent.init('+(totalPage - ((totalPage-1) % groupSize))+')">'
                               + '<img src="'+ img +'/btn_nxt_block.gif"/> &nbsp;'
                               + '</a>';
                    }
                      
                    pagination +=
                    		    '</TD>'
                    			+ '</tr></table>'
                    			+ '</br>'
                    			+ '<div style="text-align:center;">'
                    			+ '<select name="column" size="1" style="color:black;">'
                    			+ '<option value="" selected style="color:black;">선택</OPTION>'
                    			+ '<option value="USR_NAME" style="color:black;">ID</OPTION>'
                    			+ '<option value="USR_SUBJECT" style="color:black;">제목</OPTION>'
                    			+ '<option value="USR_CONTENT" style="color:black;">내용</OPTION>'
                    			+ '</select>&nbsp&nbsp&nbsp;'
                    			+ '<input type="text" name="keyword" size="20" maxlength="40" style="color:black;">&nbsp&nbsp&nbsp;' 
                    			+ '<button id="traverse" style="color:black;">검 색</button>'
                    			+ '</div>'
                      table += pagination;

					$("#temp-inter").html(table);
					
					// 검색버튼을 클릭하면 다음과 같은내용을 수행
					$("#traverse").click(function() {
						newEvent.search(1);
					});
					
					//목차 버튼을 클릭하면
					$("#list").click(function() {
						newEvent.init(1);
						alert(userid);
					});
					
					$("#register").click(function() {
						syw.sywLogin();
					});
					
					//글쓰기 버튼을 클릭하면
					$("#write").click(function(e) {
						if(userid != null){
							$("#write").attr("data-target","#writeModal");
						} else {
							alert("로그인을 먼저 해주세요");
							$("#write").attr("data-target","");
						}
					});
					
					// 각각의 글을 클릭하면
					$.each(data.list, function(index, value) {
						$("#read" + arr[index]).click(function() {
							var bool = true;
							
								
							
							newEvent.getData(bool,arr[index]);
						});
					});
					
					// 각각의 수정버튼을 클릭하면
					$.each(data.list, function(index, value) {
						$("#equip" + arr[index]).click(function() {
							var bool = false;
							
							newEvent.getData2(bool,arr[index]);
						});
					});
					
				});
			},
			
			//////////////////////////////////////////////
			
			
			search : function(page) {
				$.ajax(context + "/article/board_search/" + page,{
					data : {
						"column" : $("select[name=column] option:selected").val(),
						"keyword" : $("input:text[name=keyword]").val()
					},
					dataType : "json",
					success : function(data) {
						$("#temp-inter").empty();
						
						 var count = data.count;
	                     var pageNo = parseInt(data.pageNo);
	                     var startPage = parseInt(data.startPage);
	                     var lastPage = parseInt(data.lastPage);
	                     var totalPage = parseInt(data.totalPage);
	                     var groupSize = parseInt(data.groupSize);

						 var table = 
							 	'<span style="font-size:4em; color:BLACK">INTERDATA</span>'
							 	+'<span style="margin-left:30%;">총 게시글: '+ data.count +'개</span>'
							 	+'<table class="inter_tab" style="margin-bottom:10px;">'
								+'<tr>'
								+'<th style="width:10%;">번호</th>'
								+'<th style="width:45%;">제목</th>'
								+'<th style="width:15%;">아이디</th>'
								+'<th style="width:15%;">작성일</th>'
								+'<th style="width:10%;">조회수</th>'
								+'<th style="width:10%;">비고</th>'
								+'</tr>';
						 var arr = [];
						$.each(data.list, function(index, value) {
							table += 
								'<tr>'
								+'<td>'+ this.rcdNo +'</td>'
								+'<td><a id="read'+ this.rcdNo +'" href="#readModal" class="page-scroll" data-toggle="modal" style="color:#9385AD;">'+ this.usrSubject +'</a></td>'
								+'<td>'+ this.usrName +'</td>'
								+'<td>'+ this.usrDate +'</td>'
								+'<td>'+ this.usrRefer +'</td>'
								+'<td><a id="equip'+ this.rcdNo +'" href="#update_Modal" class="page-scroll" data-toggle="modal" style="color:#9385AD;">수정</a></td>'
								+'</tr>';
							arr.push(this.rcdNo);
						});
						
						table += '</table>';
						
						var pagination = 
								'<div style="; ">'
								+ '<button id="list" class="btn btn-primary" style="float:left; margin-left:80px;">목록</button>'
								+ '<button id="write" class="btn btn-primary" data-toggle="modal" data-target="#writeModal" style="margin-right:80px; float:right;">글쓰기</button>'
								+ '</div>'
								+ '<table id="pagination">'
								+ '<tr>'
		                        + '<td align=right WIDTH=100>'
		                        + '</TD>'
		                        + '<TD WIDTH=320 ALIGN=CENTER>';

				        if (startPage != 1) {
	                           pagination +=
	                            '<a href="#temp-inter" onclick="newEvent.search(1)">'
	                            + '<IMG SRC="'+ img +'/btn_bf_block.gif">&nbsp;'
	                            + '</a>'
	                            + '<a href="#temp-inter" onclick="newEvent.search('+(startPage-groupSize)+ ')">'
	                            + '<IMG SRC="'+ img +'/btn_bf_page.gif">&nbsp;'
	                            + '</a>'
	                    }
	                      
	                    for (var i = startPage; i <= lastPage; i++) {
	                        if (i == pageNo ) {
	                               pagination +=
	                                     '<font style="color:red;font-size: 20px">'+i+ '</font>';
	                        } else {
	                               pagination +=
	                                     '<a href="#temp-inter" onclick="newEvent.search('+i+')">'
	                                    + '<font>'+i+'</font>&nbsp;'
	                                    + '</a>';
	                       	}
	                    }
	                      
	                    if (lastPage != totalPage) {
	                           pagination +=
	                               '<a href="#temp-inter" onclick="newEvent.search('+(startPage + groupSize)+ ')">'
	                               + '<img src="'+ img +'/btn_nxt_page.gif"/> &nbsp;'
	                               + '</a>'
	                               + '<a href="#temp-inter" onclick="newEvent.search('+(totalPage - ((totalPage-1) % groupSize))+')">'
	                               + '<img src="'+ img +'/btn_nxt_block.gif"/> &nbsp;'
	                               + '</a>';
	                    }
	                      
	                    pagination +=
	                    		    '</TD>'
	                    			+ '</tr></table>'
	                    			+ '</br>'
	                    			+ '<div style="text-align:center;">'
	                    			+ '<SELECT NAME="column" SIZE=1 style="color:black;">'
	                    			+ '<OPTION VALUE="" SELECTED style="color:black;">선택</OPTION>'
	                    			+ '<OPTION VALUE="USR_NAME" style="color:black;">ID</OPTION>'
f	                    			+ '<OPTION VALUE="USR_CONTENT" style="color:black;">내용</OPTION>'
	                    			+ '</SELECT>&nbsp&nbsp&nbsp;'
	                    			+ '<INPUT TYPE=TEXT NAME="keyword" SIZE=20 MAXLENGTH=40 style="color:black;">&nbsp&nbsp&nbsp;' 
	                    			+ '<button id="traverse" style="color:black;">검 색</button>'
	                    			+ '</div>'
	                      table += pagination;

						$("#temp-inter").html(table);
						
						// 검색버튼을 클릭하면 다음과 같은내용을 수행
						$("#traverse").click(function() {
							newEvent.search(1);
						});
						
						//목차 버튼을 클릭하면
						$("#list").click(function() {
							newEvent.init(1);
						});
						
						//글쓰기 버튼을 클릭하면
						$("#write").click(function() {
						
								location.href = "#writeModal";
							
						});
						
						// 각각의 글을 클릭하면
						$.each(data.list, function(index, value) {
							$("#read" + arr[index]).click(function() {
								var bool = false;
								if (userid != $("#"+this.id).parent().next().text()) {
									var temp = $("#"+this.id).parent().next().next().next().text();
									$("#"+this.id).parent().next().next().next().text(parseInt(temp)+1);
								} else {
									bool = true;
								}
								newEvent.getData(bool,arr[index]);
							});
							
						
							
							$("#equip" + arr[index]).click(function() {
							
								var bool = false;
								newEvent.getData2(bool,arr[index]);
							});
						});
					},
					
					error : function() {
						
					}
				});
			},
			//////////// 글을쓰고 확인버튼을 누르면 ///////////////
			write : function() {
				$.ajax(context + "/article/write",{
					data : {
						"title" : $("input:text[name=title]").val(),
						"content" : $("textarea[name=content]").val(),
						"id" : $(".navbar-right a").text()
					},
					method : "post",
					success : function() {
						$("input:text[name=title]").val("");
						$("textarea[name=content]").val("");
						newEvent.init(1);
					},
					error : function() {
						alert("제목을 30자 내로 써주세요.");
						location.href = "#writeModal";
					}
				});
			},
			//////////// 글의 내용을 읽어오는 역할 ///////////////
			//////////// 여기서 data는 rcdNo을 의미함 //////////
			getData : function(bool, data) {
				$("#code").html(data);
				$.ajax(context + "/article/read",{
					data : {
						"myself" : bool, 
						"code" : data
					},
					success : function(data) {
						$("#readModal input:text[name=title]").val(data.writing.usrSubject);
						$("#readModal textarea[name=content]").val(data.writing.usrContent);
						newEvent.drawReply(data.reply);
					},
					error : function() {
						alert("ajax 실패");
					}
				});
			},
			
			getData2 : function(bool, data) {
			
				$("#code").html(data);
				$.ajax(context + "/article/equipRead",{
					data : {
						"myself" : bool,
						"code" : data
					},
					success : function(data) {
						$("#equip_Modal input:text[name=title2]").val(data.writing.usrSubject);
						$("#equip_Modal textarea[name=content2]").val(data.writing.usrContent);
					},
					error : function() {
						alert("ajax 실패");
					}
				});
			},
			drawReply : function(data) {
				
				$("#reply_area").empty();
				$.each(data, function(index, value) {
					reply = "<p style='position:relative;'><input class='form-control' style='background:#36333D;' readOnly value='"+ this.usrName + " | " + this.usrContent+"'>";
					if (userid === this.usrName) {
						reply += "<button class='btn' id='"+ this.rcdNo +"' style='position:absolute; right:0; top:0; border:none; color:blueviolet; background:white;'>지우기</button></p>";
					} else {
						reply += "</p>";
					}
					$("#reply_area").append(reply);
					
					 // 삭제버튼을 누르면
					$("#" + this.rcdNo).click(function() {
						$.ajax(context + "/article/remove_reply",{
							data : {
								code : $("#code").text(),
								reply : this.id
							},
							success : function(data) {
								
								newEvent.drawReply(data.reply)
							},
							error : function() {
								
							}
						});
					});
					
				});
			},
	
				
		
			
			
			
	 };