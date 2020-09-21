<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="true" %>
<%
	pageContext.setAttribute("br","<br/>");
	pageContext.setAttribute("cn","\n");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta http-equiv="content-Type" content="text/html; charset=UTF-8">
	<title>게시판 상세보기</title>
</head>
<!-- jQuery 3.4.1 -->

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap-theme.min.css">

<style>
	.readOnlyInput{
		width:400px;
		height:50px;
	}
	.box{
		
		font-size:15px;
		text-align:center;
		margin:0 auto;
	}
	.box-body{
		margin:40px 0;
		padding: 30px;
	}
	.boarddetail-header{
		display: table;
	    width: 100%;
	    border-top: 2px solid #3a5696;
	    border-bottom: 1px solid #ddd;
	    margin-top:30px;
	}
	.boardDetailTitle{
		display: table-cell;
		font-size:25px;
		padding: 25px 20px;
	}
	.boardHeader-Info{
		display: table-cell;
	    text-align: right;
	    vertical-align: middle;
	}
	span:first-child{
		padding-left: 0;
	}
	span:last-child{
		border: none;
	}
	span{
		display: inline-block;
		padding:8px;
		border-right: 1px solid #ddd;
	}
	.boarddetaile-content{
		padding:8px 0;
	}
	.container-fluid{
		border-top:3px solid #3a5696;
		width:900px;
		margin-top:100px;
	}
	.content{
		border-top:3px solid orange;
		width:900px;
		margin-top:100px;
		height: inherit;
	}
	.borrowlist3{
		margin-top:30px;
		
	}
	.boardDtail{
		margin-top:30px;
	}
	
	.board-image{
		width:100%;
		
	}
	.line_box{
		  border-top: 1px solid #3a5696;
    	  border-bottom: 1px solid #ddd;
    	  height:20px;
    	  margin-top:30px;
	}
	.reply_header{
		
   	  	display: table;
   		 width: 100%;
	}
	.reply_info{
		display: flex;
		justify-content:space-around;
		padding: 1em 1em 1em .5em;
    	font-size: 1em;
		 border-bottom: 1px solid #ddd;
		 height: 64px;
	}
	.reply_title{
		display: table-cell;
    	padding: 1em 1em 1em .5em;
    	font-size: 1.5em;
   	    border-bottom: 1px solid #ddd;
	}
	.reply_content {
	    height: 300px;
	    padding: 1em;
	    text-align: left;
	    font-size: 20px;
	    line-height: 40px;
	}
	.reply_total{
		margin-top:20px;
	    border: 1px solid #ddd;
	    width:840px;
	}
	
	.replyLi{
		list-style-type : none;
		width:840px;
	}
	ul { margin: 0;  padding: 0; }
	
	.reply_update_btn{
		background-color:#ddd;
		height:64px;
		
		padding: 1em;
	}
	
	
</style>
<script>

</script>
<body>
<%@ include file="include/pagelayoutHeader.jsp"%>
	<div class="mainaa">
		<div class="side">
			<%@include file="include/pagelayoutSide3.jsp" %>
		</div>
		<div class="content">
			<div class="tot">
				<div class="nav">
		
				</div>
	
				<div class="section">
					<section class="boardDtail">
						<c:if test="${board.bb_bnum eq 'notice'}">
		  					<h1>공지사항</h1>
						</c:if>
						<c:if test="${board.bb_bnum eq 'frequestions'}">
		  					<h1>자주하는 질문</h1>
						</c:if>
						<c:if test="${board.bb_bnum eq 'qna'}">
		  					<h1>묻고 답하기</h1>
						</c:if>

						<div class="box">
							<div class="box-body">
								<div class=boarddetail-header>
								  <h3 class="boardDetailTitle">${board.bb_title}</h3>
									  <div class="boardHeader-Info">
									  	<span>글번호${board.bb_num}</span>
									  	<span>조회${board.bb_readcnt}</span>
									  	<span>
									  		${board.bb_name}
									  		<span>${board.bb_date}</span>
									  	</span>
									  </div>
							    </div>
							    <div class="boarddetaile-content" >
								     <c:if test="${not empty board.bb_image}">
								     <div class="result-images">
					        			<img class="board-image" src="${pageContext.request.contextPath}/resources/uploadfile/${board.bb_image}">
									</div>
									</c:if>
							   		 ${fn:replace(board.bb_content,cn,br)}
							    </div>
			      
						 </div>
					</div>
				 	</section>
				</div> <!-- end div section -->

				<div class="box-footer">
					<form role="form" method="POST">
						<input type="hidden" name="bb_bnum" value="${board.bb_bnum}">
						<input type="hidden" name="bb_num" value="${board.bb_num}">
						<input type="hidden" name="page" value="${criteria.page}"> 
						<input type="hidden" name="perPageNum" value="${criteria.perPageNum}">
						<input type="hidden" name="searchType" value="${criteria.searchType}"> 
						<input type="hidden" name="keyword" value="${criteria.keyword}">
					</form>
					<c:if test="${board.bb_bnum eq 'qna'}">
						<button class="btn btn-outline-info">글쓰기</button>
					</c:if>
					<c:if test="${user.mb_id eq board.bb_id}">
						<button class="btn btn-outline-primary">수정</button>
						<button class="btn btn-outline-danger">삭제</button>
					</c:if>
					<button class="btn btn-outline-secondary">목록</button>
				</div>
		
				<div id="replyList">
					<section class="container-fluid">
		  				<div class="col-lg-12">
		 				   <div class="box box-primary">
		       				 <div class="box-header with-border">
		       				 </div>
		       				<div class="box-body">
		          			  <div class="form-group">
		               			 <label for="newReplyText">댓글 내용</label>
		                		 <input class="form-control" id="newReplyText" name="rp_content" placeholder="댓글 내용을 입력해주세요">
		            			</div>
					            <div class="form-group">
					                <label for="newReplyWriter">댓글 작성자</label>
					                <input class="form-control" value="${user.mb_name}" id="newReplyWriter" name="rp_name" readonly>
					            </div>
					            <div class="col-sm-2">
					                <button type="button" id="replyAddBtn" class="btn btn-primary btn-block"><i class="fa fa-save"></i> 저장</button>
					            </div>
					        </div>
					        	<div class="line_box">
					        	</div>
					        <div class="box-footer">
					            <ul id="replies">
					
					            </ul>
					        </div>
					        <div class="box-footer">
					            <div class="text-center">
					                <!-- <ul class="pagination pagination-sm no-margin">
					
					                </ul> -->
					            </div>
					        </div>
					    </div>
					  </div>
					
					  <div class="modal fade" id="modifyModal" role="dialog">
					    <div class="modal-dialog">
					        <div class="modal-content">
					            <div class="modal-header">
					                <button type="button" class="close" data-dismiss="modal">&times;</button>
					                <h4 class="modal-title">댓글 수정창</h4>
					            </div>
					            <div class="modal-body">
					                <div class="form-group">
					                    <label for="replyNo">댓글 번호</label>
					                    <input class="form-control" id="rp_num" name="rp_num" readonly>
					                </div>
					                <div class="form-group">
					                    <label for="replyText">댓글 내용</label>
					                    <input class="form-control" id="rp_content" name="rp_content" placeholder="댓글 내용을 입력해주세요">
					                </div>
					                <div class="form-group">
					                    <label for="replyWriter">댓글 작성자</label>
					                    <input class="form-control" id="rp_name" name="rp_name" readonly>
					                </div>
					            </div>
					            <div class="modal-footer">
					                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
					                <button type="button" class="btn btn-success modalModBtn">수정</button>
					                <button type="button" class="btn btn-danger modalDelBtn">삭제</button>
					            </div>
					        </div>
					    </div>
					  </div>
					</section>
			</div>
		</div>
		
		</div> <!-- 내용 end -->
	</div>

	
	
	<%@ include file = "include/pagelayoutFooter.jsp" %>
	<!-- Bootstrap -->
	<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script> 
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	
	
</body>

<script>  
//  게시판 목록	
	$(function(){
		var formObj = $("form[role='form']");
		//목록 버튼을 눌렀을 때 처리
		$(".btn-outline-secondary").click(function(){
			formObj.attr("method", "get");
			formObj.attr("action", "boardlist");
			formObj.submit();

			//location.href="list?page=${page}&perPageNum=${perPageNum}";
			//history.back();
		});
		//삭제 버튼을 눌렀을 때 처리
		$(".btn-outline-danger").click(function() {
			formObj.attr("method", "get");
			formObj.attr("action", "boarddelete");
			formObj.submit();
		});
		//수정 버튼을 눌렀을 때 처리
		$(".btn-outline-primary").click(function() {
			formObj.attr("method", "get");
			formObj.attr("action", "boardupdate");
			formObj.submit();
			//location.href = "boardupdate?bb_num=" + ${board.bb_num};
		});
		//글쓰기 버튼을 눌렀을 때 처리
		$(".btn-outline-info").click(function() {
			location.href = "boardinsert?bb_bnum=${board.bb_bnum}";
		});
		
		
		
	});
</script>

<script>
//댓글 목록 호출
//var offset = 0;
//댓글 저장 버튼 클릭 이벤트 발생시
$(document).ready(function(){
	console.log("1");	
	getReplies();
	
	
	//댓글 저장 버튼 클릭 이벤트
    //$(#btnReplySave).click(function(){
	$(document).on('click', '#replyAddBtn', function(){
		 // 화면으로부터 입력 받은 변수값의 처리
	    var rp_content = $("#newReplyText");
	    var rp_name = $("#newReplyWriter");

	    var rp_contentVal = rp_content.val();
	    var rp_nameVal = rp_name.val();
	    
	    console.log(rp_contentVal);
	    console.log(rp_nameVal);
	    
		var url = "${pageContext.request.contextPath}/board/replyinsert";//추가
		var paramData = {"rp_content": rp_contentVal, "rp_name": rp_nameVal, "rp_bb_num":"${board.bb_num}", "rp_mb_id":"${user.mb_id}"};		
		
		$.ajax({
			type: 'POST',
	        url: url,
	        data : paramData,
	        dataType: 'text',
			success: function(result){
				if(result=="regSuccess"){
					alert("댓글 등록 완료!");
				}
				getReplies();
				rp_content.val(""); // 댓글 내용 초기화
			},
			error: function(error){
				console.log("eeeeeeeee에러 : " + error);
			}
		});
	});
	
	
});

//댓글 목록 출력 함수
function getReplies() {
	var url = "${pageContext.request.contextPath}/board/replylist";
	var paramData = {"bb_num" : "${board.bb_num}"};
	var mb_id = "${user.mb_id}";
	//console.log("mb_name="+mb_name)
	$.ajax({
		type : 'POST',
		url : url,
		data : paramData,
		dataType : 'json',
		success : function(entity) {
			
		var rp_title="${board.bb_title}";
		var str = "";
		if (entity.length < 1) {
			str += "등록된 댓글이 없습니다.";
		} else {
			$(entity).each(function(){
					str += "<li data-rp_num='" + this.rp_num + "' class='replyLi'>"
					+"<div class='reply_total'>"
						+"<div class='reply_header'>"
							+"<div class='reply_title'>"
								+"RE : "+rp_title
							+"</div>"
							+"<div class='reply_info'>"
								+"<div class='rp_name'>"
									+this.rp_name
								+"</div>"
								+"<div class='rp_date'>"
									 +this.rp_date
								+"</div>"
							+"</div>"
						+"</div>"
						+"<div class='reply_content rp_content'>"
							+this.rp_content
						+"</div>"
						if(mb_id==this.rp_mb_id){
							str+="<div class='reply_update_btn'>"
							+"<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
							+"</div>"
						}
					+"</div>"
					+ "</li>" + "<hr/>";
						/* + "<p class='rp_content'>"
						+ this.rp_content
						+ "</p>"
						+ "<p class='rp_name'>"
						+ this.rp_name
						+ "</p>"
						+ this.rp_date
						+ "</p>" */
						//if(mb_name==this.rp_name){
						//}

				});//each end
			}
			$("#replies").html(str);
		}, //success end
		error : function(data) {
			alert("에러가 발생했습니다.")
		}
	}); //ajax end
	//offset+=5;
}


$("#replies").on("click", ".replyLi button", function () {
    var reply = $(this).parent().parent().parent(); //this는 replies 안에있는 replyLi 안에잇는 button태그
	//console.log("reply"+reply_p);
    var rp_Num = reply.attr("data-rp_num"); //attr 안에 값 불러오기
    var rp_Content = reply.find(".rp_content").text();
    var rp_Name = reply.find(".rp_name").text();

    $("#rp_num").val(rp_Num);
    $("#rp_content").val(rp_Content);
    $("#rp_name").val(rp_Name);

});

$(".modalDelBtn").on("click", function () {
	var url = "${pageContext.request.contextPath}/board/replydelete";//수정
    // 댓글 번호
    var rp_num = $(this).parent().parent().find("#rp_num").val();
	console.log("RPNUM="+rp_num);
	var paramData = {"rp_num" : rp_num};  //수정
    // AJAX통신 : DELETE
    $.ajax({
        type : "post",
        url : url,
        data : paramData,
        dataType : "text",
        success : function (result) {
            console.log("result : " + result);
            if (result == "delSuccess") {
                alert("댓글 삭제 완료!");
                $("#modifyModal").modal("hide"); // Modal 닫기
                $(".modal-backdrop").remove();
                getReplies(); // 댓글 목록 갱신
            }
        }
    });
});

$(".modalModBtn").on("click", function () {
	var url = "${pageContext.request.contextPath}/board/replyupdate";
    // 댓글 선택자
    var reply = $(this).parent().parent();
    // 댓글번호
    var rp_num = reply.find("#rp_num").val();
    // 수정한 댓글내용
    var rp_content = reply.find("#rp_content").val();

	var paramData = {"rp_content" : rp_content, "rp_num" : rp_num}
    // AJAX통신 : PUT
    $.ajax({
        type : "post",
        url : url,
        data : paramData,
        dataType : "text",
        success : function (result) {
            console.log("result : " + result);
            if (result == "modSuccess") {
                alert("댓글 수정 완료!");
                $("#modifyModal").modal("hide"); // Modal 닫기
                $(".modal-backdrop").remove();
                getReplies(); // 댓글 목록 갱신
            }
        }
    });

});
</script>
	
</html>
