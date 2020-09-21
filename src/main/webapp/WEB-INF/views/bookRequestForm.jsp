<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>희망 도서 신청 페이지</title>
</head>
<style>
	table{
		width:600px;
		height:800px;
		text-align:center;
	}

	.request-input-title{
		width: 584px;
		height:30px;
	}
	.title-logo,.reason-logo{
		height:40px;
	}
	.request-button{
		border: 1px solid skyblue;
		background-color : black;
		color: #f0f0f0;
		padding: 5px;
		font-size: 25px;
   		width: 200px;
    	height: 60px;
    	border-radius: 10px;
	}
	.request-button:hover{
		color:#ef7a34;
	}
	.button-td{
		text-align:center;
	}
	.request_form{
		margin:0 auto;
	}
	.content{
		border-top:3px solid orange;
		margin-top:100px;
		padding:50px;
		position:relative;
		width: 800px;
		display: flex;
  	 	justify-content: center;
   		align-items: center;
   		flex-direction: column;
   		margin: 0 auto;
   	 	margin-top: 150px;
	}
	textarea, input{
		font-size:25px;
		font-family: unset;
		width: -webkit-fill-available;
	}
	input{
	width: -webkit-fill-available;
	}
	
	table {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
    text-align: -webkit-center;
}
table td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
<body>
	<%@ include file="include/pagelayoutHeader.jsp" %>
			<div class="content">
			<h1>희망 도서 신청</h1>
			<form action="bookRequestForm" method="POST">
				<table class="request_form">
					<tr><th>책이름 </th>
						<td><textarea name="br_name" class="request-title" cols="40" rows="3" readonly></textarea></td></tr>
					
					<tr><th>아이디 </th>
						<td><textarea name="br_id" class="request-id" cols="40" rows="3" readonly>${user.mb_email}</textarea></td></tr>
						
					<tr><th>저자명 </th>
						<td><textarea name="br_writer" class="request-authors"  cols="40" rows="1" readonly></textarea></td></tr>
						
					<tr><th>ISBN </th>
						<td><textarea name="br_bcode" class="request-isbn" cols="40" rows="1" readonly></textarea></td></tr>
						
					<tr><th>요청시간</th>
						<td class="request-date">${time}</td></tr>
						
					<tr><th colspan="2" class="title-logo">신청제목</th></tr>
					
					<tr><td colspan="2"><input type="text" value="" name="br_title" class="request-input-title"></td></tr>
					
					<tr><th colspan="2" class="reason-logo">신청이유</th></tr>
					
					<tr><td colspan="2"><textarea name="br_reason" rows="8" cols="50" placeholder="신청 이유를 적어주세요."></textarea></td></tr>
					<tr><td colspan="2" class="button-td"><input type="submit" value="신청하기" class="request-button" placeholder="신청하는 이유를 적어주세요. (500자 이내)'<br>'※ 이유가 적절하지 않을 경우 관리자가 승인거절할 수 있습니다."></input></td></tr>
				</table>
		
			</form>
			</div>

	<%@ include file="include/pagelayoutFooter.jsp" %>
	
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous">
	</script>
	<script>
		var isbn=document.location.href.split("%20")[1]; //isbn 뒤에 자름
	
		$(document).ready(function () {
			$.ajax({
				method:"GET",
				url:"https://dapi.kakao.com/v3/search/book?target=title",
				data:{query: isbn},
				headers : {Authorization:"KakaoAK ac96be09e1d7b8a94633476caf244876"}
			})
		
			.done(function(search){
					$(".request-title").append(search.documents[0].title);
					$(".request-authors").append(search.documents[0].authors);
					$(".request-isbn").append(isbn);
			})
		});
	</script>
</body>
</html>