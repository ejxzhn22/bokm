<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="true" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Library-admin</title>

<!-- Custom fonts for this template-->

</head>
<style>
	.readOnlyInput{
		width:400px;
		height:50px;
	}
	.box{
		width:720px;
		font-size:15px;
		text-align:center;
		margin:0 auto;
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

	.content{
		width:900px;
		margin-top:100px;
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
	.reply_content{
	    height: 217px;
        padding: 1em;
	}
	.reply_total{
		margin-top:20px;
	    border: 1px solid #ddd;
	    width:840px;
	}
	
	.replyLi{
		list-style-type : none;
		width: 720px;
	}
	ul { margin: 0;  padding: 0; }
	
	.reply_update_btn{
		background-color:#ddd;
		height:64px;
		
		padding: 1em;
	}
	.box-body{
	border: 1px solid #ddd;
    padding: 40px;
    margin-bottom: 40px;
	}
	p{
	display: inline-block;
    margin-right: 20px;
	}
	.replyC{
		text-align:left;
		width: 625px;
		display: inline-block;
	}
	.replyCC{
		display: inline-block;
	}
	.rp_content{
		text-align:left;
	}
</style>
<body>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- 사이드바 -->
		<%@include file="include/sidebar.jsp"%>

		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">

				<!-- 상단바 -->
				<%@include file="include/topbar.jsp"%>

				<!--  메인!!!!!!!!!!!!!!!! -->
					<!-- Page Heading -->
											<c:if test="${board.bb_bnum eq 'notice'}">
										  		<h1>공지사항</h1>
											</c:if>
											<c:if test="${board.bb_bnum eq 'frequestions'}">
										  		<h1>자주하는 질문</h1>
											</c:if>
											<c:if test="${board.bb_bnum eq 'qna'}">
										  		<h1>묻고 답하기</h1>
											</c:if>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3"></div>
						<div class="card-body">
							<div class="table-responsive">
								<div class="section">
									<section class="boardDtail">
								
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
										<div class="box-footer">
											<form role="form" method="POST">
												<input type="hidden" name="bb_bnum" value="${board.bb_bnum}">
												<input type="hidden" name="bb_num" value="${board.bb_num}">
											</form>
												<c:if test="${(board.bb_bnum eq 'notice' or board.bb_bnum eq 'frequestions') and user.mb_auth ne 'user'}">
													<button type="button" class="btn btn-info btn-flat" id="updateBtn" onClick="location.href='boardupdate?bb_bnum=${board.bb_bnum}&bb_num=${board.bb_num}';">
						            				<i class="fa fa-pencil"></i> 수정
						        					</button>
													<button type="button" class="btn btn-danger btn-flat" id="deleteBtn" onClick="location.href='boarddelete?bb_bnum=${board.bb_bnum}&bb_num=${board.bb_num}';">
						            				<i class="fa fa-pencil"></i> 삭제
						        					</button>
												</c:if>
												<c:if test="${board.bb_bnum eq 'qna' and user.mb_auth ne 'user'}">
													<button type="button" class="btn btn-danger btn-flat" id="deleteBtn" onClick="location.href='boarddelete?bb_bnum=${board.bb_bnum}&bb_num=${board.bb_num}';">
						            				<i class="fa fa-pencil"></i> 삭제
						        					</button>
												</c:if>
												<button type="button" class="btn btn-secondary btn-flat" id="listBtn" onClick="location.href='boardlist2?bb_bnum=${board.bb_bnum}&bb_num=${board.bb_num}';">
						            				<i class="fa fa-pencil"></i> 목록
						        				</button>
										</div>
							</div>
										
										</section>
										</div> <!-- 내용 end -->
										
																		
								<div id="replyList">
										<section class="content container-fluid">
								  <div class="col-lg-12">
								    <div class="box box-primary">
								        <div class="box-header with-border">
								            <h3 class="box-title">댓글 작성</h3>
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
								        <div class="box-footer">
								            <ul id="replies">
								
								            </ul>
								            <div class='btns'><button id="addbtn" onclick='morelist()' class='btn btn-primary'>더보기</button></div>
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
								                    <input class="form-control" id="rp_name" name="rp_name" value="${user.mb_name}" readonly>
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
						</div>
					</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
			<!-- Footer -->

			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->

	<%@include file="include/footer.jsp"%>

	<!-- End of Page Wrapper -->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

<script>

//  게시판 목록	
	$(function(){
		var formObj = $("form[role='form']");
		//목록 버튼을 눌렀을 때 처리
		$(".btn-outline-secondary").click(function(){
			formObj.attr("method", "get");
			formObj.attr("action", "admin/boardlist");
			formObj.submit();

			//location.href="list?page=${page}&perPageNum=${perPageNum}";
			//history.back();
		});
		//삭제 버튼을 눌렀을 때 처리
		$(".btn-outline-danger").click(function() {
			formObj.attr("method", "get");
			formObj.attr("action", "admin/boarddelete");
			formObj.submit();
		});
		//수정 버튼을 눌렀을 때 처리
		$(".btn-outline-primary").click(function() {
			formObj.attr("method", "get");
			formObj.attr("action", "../admin/boardupdate");
			formObj.submit();
			//location.href = "boardupdate?bb_num=" + ${board.bb_num};
		});
	});
</script>

	
</body>


<script>
let offset = 0;
//댓글 목록 호출

//댓글 저장 버튼 클릭 이벤트 발생시
$(document).ready(function(){
	morelist();
	
	//댓글 저장 버튼 클릭 이벤트
    //$(#btnReplySave).click(function(){
	$(document).on('click', '#replyAddBtn', function(){
		 // 화면으로부터 입력 받은 변수값의 처리
	    var rp_content = $("#newReplyText");
	    var rp_name = $("#newReplyWriter");

	    var rp_contentVal = rp_content.val();
	    var rp_nameVal = rp_name.val();
	    
		var url = "${pageContext.request.contextPath}/admin/replyinsert";//추가
		var paramData = {"rp_content": rp_contentVal, "rp_name": rp_nameVal, "rp_bb_num":"${board.bb_num}"};		
		
		$.ajax({
			type: 'POST',
	        url: url,
	        data : paramData,
	        dataType: 'text',
			success: function(result){
			    var str ="";
			
				if(result=="regSuccess"){
					alert("댓글 등록 완료!");
				}
				
				$("#replies").html(str);
				var button = $('.btns').find('.btn').attr('id');
				if( button == undefined){
					var str ="<button id='addbtn' onclick='morelist()' class='btn btn-primary'>더보기</button>";
					$('.btns').append(str);
				}
				offset=0;
				morelist();
				
				rp_content.val(""); // 댓글 내용 초기화
	            //rp_name.val(""); // 댓글 작성자 초기화
			},
			error: function(error){
				console.log("eeeeeeeee에러 : " + error);
			}
		});
	});
	
	
});
//댓글 목록 출력 함수



$("#replies").on("click", ".replyLi button", function () {
	var reply = $(this).parent().parent();

    var rp_Num = reply.attr("data-rp_num");
    var rp_Content = reply.find(".rp_content").text();
    var rp_Name = reply.find(".rp_name").text();

    $("#rp_num").val(rp_Num);
    $("#rp_content").val(rp_Content);
    $("#rp_name").val(rp_Name);

});

$(".modalDelBtn").on("click", function () {
	var url = "${pageContext.request.contextPath}/admin/replydelete";//수정
    // 댓글 번호
    var rp_num = $(this).parent().parent().find("#rp_num").val();
	var paramData = {"rp_num" : rp_num};  //수정
    // AJAX통신 : DELETE
    $.ajax({
        type : "post",
        url : url,
        data : paramData,
        dataType : "text",
        success : function (result) {
            if (result == "delSuccess") {
                alert("댓글 삭제 완료!");
                $("#modifyModal").modal("hide"); // Modal 닫기
                $("#"+rp_num).remove();
                $(".modal-backdrop").remove();
            }
        }
    });
});

$(".modalModBtn").on("click", function () {
	var url = "${pageContext.request.contextPath}/admin/replyupdate";
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
                $("#"+rp_num).find(".rp_content").text(rp_content);
                $(".modal-backdrop").remove();
            }
        }
    });

});




function morelist(){
	var url = "${pageContext.request.contextPath}/admin/moreList";
	var paramData = {"bb_num" : "${board.bb_num}", "offset" : offset};
	var mb_name = "${user.mb_name}";
	$.ajax({
		type : 'POST',
		url : url,
		data : paramData,
		dataType : 'json',
		success : function(entity) {
			var str = "";
			if (entity.length < 1) {
				str += "<li>등록된 댓글이 없습니다.</li>";
				$('#addbtn').remove();//remove btn
			} else {
				$(entity).each(function(){
						str += "<li data-rp_num='" + this.rp_num + "' id='"+ this.rp_num+"'class='replyLi'>"
							+ "<div class='replyC'>"
							+ "<p class='rp_name' style='font-style:bold'>"
							+ this.rp_name
							+ "</p>"
							+ "<p>"
							+ this.rp_date
							+ "</p>"
							+ "</div>"
							+ "<div class='replyCC'>"
							+ "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
							+ "</div>"
							+ "<br>"
							+ "<p class='rp_content' style='font-size:20px'>"
							+ this.rp_content
							+ "</p>"
							+ "<hr>"+ "</li>" ;
							
					});//each end
			}
			$(str).appendTo("#replies");
		}, //success end
		error : function(data) {
			console.log(data);
			alert("에러가 발생했습니다.")
		}
	}); //ajax end
	offset+=5;
}
</script>
</html>
