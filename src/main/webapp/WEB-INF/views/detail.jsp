<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.thubmailContainer img {
	width: 200px;
}

.detailContainer {
	display: flex;
	align-items: center;
}

.detailContents table td {
	vertical-align: top;
	padding: 10px 0;
	padding-left: 30px;
}

.detailContents td:last-child {
	width: 500px;
}
.review_id{
	width:150px;
	display:inline-block;
	font-weight:bold;
}
		.content{
		border-top:3px solid orange;
		margin-top:100px;
		padding:50px;
		position:relative;
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
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap.css"> 
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bootstrap/css/bootstrap-theme.min.css">

<body>
		<%@ include file="include/pagelayoutHeader.jsp" %>
	<div class="mainaa">
		<div class="side">
			<%@ include file="include/pagelayoutSide1.jsp"%>
		</div>
		<div class="content">
	<div class="detailContainer">
		<div class=thubmailContainer>
			<img src="${result.documents[0].thumbnail}">
		</div>
		<div class="detailContents">
			<table>
				<tr>
					<td>책 제목</td>
					<td>${result.documents[0].title}</td>
				</tr>
				<tr>
					<td>저자</td>
					<td>${result.documents[0].authors}</td>
				</tr>
				<tr>
					<td>설명</td>
					<td>${result.documents[0].contents}</td>
				</tr>
				<tr>
					<td>출판사</td>
					<td>${result.documents[0].publisher}</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="bookstate">
	  	<table style="text-align:center;width:100%; height:80px; margin:50px 0;">
	  		<tr style="background-color:#ddd; color:#3a5696;">
	  			<td>
	  				책번호
	  			</td>
	  			<td>
	  				대출상태
	  			</td>
	  			<td>
	  				예약
	  			</td>
	  			<td>
	  				희망신청
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>
	  				<c:if test="${book ne null }">
	  					${book.bk_id}
	  				</c:if>
	  				<c:if test="${book eq null }">
	  					없음
	  				</c:if>
	  			</td>
	  			<td>
		  			<c:if test="${book ne null }">
		  				<c:if test="${ reserlist[0] == null || reserlist[0].bd_reservation == 0 && reserlist[0].bk_state == '대출가능' || reserlist[0].bd_reservation == user.mb_id && reserlist[0].bk_state == '대출가능'}">
							<a href="/moveborrow?isbn=${result.documents[0].isbn}">대출신청</a>
						</c:if>
						<c:if test="${book.bk_state eq '대출중'}">
							${book.bk_state}
						</c:if>
					</c:if>
					<c:if test="${book eq null }">
	  					대출불가
	  				</c:if>
	  			</td>
	  			<td>
	  				<c:if test="${reserlist[0].bd_reservation == 0 && reserlist[0].bk_state == '대출중'  }">
						<a href="/reservation?isbn=${result.documents[0].isbn}&mb_id=${user.mb_id}">예약신청</a>
					</c:if>
					<c:if test="${book eq null }">
	  					예약불가
	  				</c:if>
	  			</td>
	  			<td>
	  				<c:if test="${book eq null }">
	  					<a href="/bookRequestForm?isbn=${result.documents[0].isbn}">희망도서 신청</a>
	  				</c:if>
	  				<c:if test="${book ne null }">
	  					희망도서 신청불가
	  				</c:if>
	  			</td>
	  		</tr>
	  	</table>
	  </div>
	
	<div id="reviewList">
  <div class="col-lg-12">
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">서평작성</h3>
        </div>
        <div class="box-body">
            <div class="form-group">
                <label for="newReplyText">서평 내용</label>
                <input class="form-control" id="newReplyText" name="rv_content" placeholder="서평 내용을 입력해주세요">
            </div>
            <div class="form-group">
                <label for="newReplyWriter">댓글 작성자</label>
                <input class="form-control" value="${user.mb_name}" id="newReplyWriter" name="rv_name" readonly>
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
                <h4 class="modal-title">서평 수정창</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="replyNo">서평 번호</label>
                    <input class="form-control" id="rv_id" name="rv_id" readonly>
                </div>
                <div class="form-group">
                    <label for="replyText">서평 내용</label>
                    <input class="form-control" id="rv_content" name="rv_content" placeholder="댓글 내용을 입력해주세요">
                </div>
                <div class="form-group">
                    <label for="replyWriter">서평 작성자</label>
                    <input class="form-control" id="rv_name" name="rv_name" value="${user.mb_name}" readonly>
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
		</div>
	</div>
	</div>
	<%@ include file="include/pagelayoutFooter.jsp"%>
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous"></script>
	<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script> 
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
		
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
	    var rv_content = $("#newReplyText");
	    var rv_name = $("#newReplyWriter");

	    var rv_contentVal = rv_content.val();
	    var rv_nameVal = rv_name.val();
	    
	    var isbn ="${result.documents[0].isbn}".split(" ")[1];
	
		var url = "${pageContext.request.contextPath}/review/replyinsert";//추가
		var paramData = {"rv_content": rv_contentVal, "rv_name": rv_nameVal,
				"rv_icode":isbn,"rv_mb_id":"${user.mb_id}"};		
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
				console.log("추가:"+offset);
	            
				$("#replies").html(str);
				
				var button = $('.btns').find('.btn').attr('id');
				if( button == undefined){
					var str ="<button id='addbtn' onclick='morelist()' class='btn btn-primary'>더보기</button>";
					$('.btns').append(str);
				}
				offset=0;
				morelist();
				
				rv_content.val(""); // 댓글 내용 초기화
	          // rp_name.val(""); // 댓글 작성자 초기화
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

    var rv_Id = reply.attr("data-rv_id");
    var rv_Content = reply.find(".rv_content").text();
    var rv_Name = reply.find(".rv_name").text();
    //var rv_Date = reply.find(".rv_date").text();

    $("#rv_id").val(rv_Id);
    $(".rv_content").val(rv_Content);
    $(".rv_name").val(rv_Name);
    //$(".rv_date").val(rv_Date);

});

$(".modalDelBtn").on("click", function () {
	var url = "${pageContext.request.contextPath}/review/replydelete";//수정
    // 댓글 번호
    var rv_id = $(this).parent().parent().find("#rv_id").val();
	var paramData = {"rv_id" : rv_id};  //수정
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
                $("#"+rv_id).remove();
                $(".modal-backdrop").remove();
            }
        }
    });
});

$(".modalModBtn").on("click", function () {
	var url = "${pageContext.request.contextPath}/review/replyupdate";
    // 댓글 선택자
    var reply = $(this).parent().parent();
    // 댓글번호
    var rv_id = reply.find("#rv_id").val();
    // 수정한 댓글내용
    var rv_content = reply.find("#rv_content").val();

	var paramData = {"rv_content" : rv_content, "rv_id" : rv_id}
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
                $("#"+rv_id).find(".rv_content").text(rv_content);
                $(".modal-backdrop").remove();
            }
        }
    });

});


function morelist(){
	var url = "${pageContext.request.contextPath}/review/moreList";
	var isbn ="${result.documents[0].isbn}".split(" ")[1];
	var paramData = {"rv_icode" : isbn, "offset" : offset};
	var mb_id = "${user.mb_id}";
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
				console.log("morelist else시작="+offset);
				$(entity).each(function(){
						
							
							str += "<li data-rv_id='" + this.rv_id + "' id='"+ this.rv_id+"'class='replyLi'>"
							+ "<p class='rv_content' style='font-size:20px'>"
							+ this.rv_content
							+ "</p>"
							+"<br>"
							+ "<div class='replyC'>"
							+ "<p class='rv_name' style='font-style:bold'>"
							+ this.rv_name
							+ "</p>"
							+ "<p>"
							+ this.rv_date
							+ "</p>"
							+ "</div>"
							+ "<div class='replyCC'>"
							if(mb_id==this.rv_mb_id){
							 str+= "<button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#modifyModal'>댓글 수정</button>"
							+ "</div>"
							+ "<hr>"+ "</li>" ;
							}
							
					});//each end
			}
			$(str).appendTo("#replies");
			
		}, //success end
		
		error : function(data) {
			console.log(data);
			alert("에러가 발생했습니다.");
		}
	}); //ajax end
	offset+=5;
	console.log("+5파트:"+offset);
}
</script>
</body>
</html>