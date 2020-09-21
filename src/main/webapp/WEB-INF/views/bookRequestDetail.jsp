<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous">
	
</script>
<title>Insert title here</title>
</head>
<style>
	.thumb{
		width: 380px;
		height: 500px;
		margin-right: 30px;
	}
	.all-book{
		display:flex;
	}
		.content{
		border-top:3px solid orange;
		margin-top:100px;
		padding:50px;
		position:relative;
	}	
	#bookRequest,#prev_button{
		border: 1px solid skyblue;
		background-color : black;
		color: #f0f0f0;
		padding: 5px;
		font-size: 25px;
   		width: 200px;
    	height: 60px;
    	border-radius: 10px;
	}
	#bookRequest:hover,#prev_button:hover{
		color:#ef7a34;
	}
	.info-book{
		font-size:15px;
	}
	.request_button{
		display:flex;
		justify-content:center;
		align-items:center;
		margin-top:50px;
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
}
table td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
<body>
		<div class="header">
			<%@ include file="include/pagelayoutHeader.jsp" %>
		</div>
		<div class="mainaa">
			<div class="side">
				<%@ include file="include/pagelayoutSide2.jsp" %>
			</div>
		<div class="content">
		 <h1>책 상세보기</h1>
			<p>${msg}</p>
		<div id="list"></div>
		<div class="request_button">
			<button id="bookRequest">희망도서 신청</button>
			<button id="prev_button">이전화면</button>
		</div>
		
	</div>
	</div>
		 <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous"></script>
		<script>
			var isbn=document.location.href.split("%20")[1];
			
				$(document).ready(function () {
						$.ajax({
							method:"GET",
							url:"https://dapi.kakao.com/v3/search/book?target=title",
							data:{query: isbn},
							headers : {Authorization:"KakaoAK ac96be09e1d7b8a94633476caf244876"}
						})
					
						.done(function(search){
							var htmls="";
								htmls += '<div class="all-book">';
								htmls += '<div class="thumbnail-book">';
								htmls += "<img src='"+search.documents[0].thumbnail+"' class='thumb'>";
								htmls += '</div>';
								htmls += '<table class="info-book">';
								htmls += '<tr><th>제목 : </th><td>'+search.documents[0].title+"</td></tr>";
								htmls += '<tr><th>저자 : </th><td>'+search.documents[0].authors+"</td></tr>";
								htmls += '<tr><th>출판사 : </th><td>'+search.documents[0].publisher+"</td></tr>";
								htmls += '<tr><th>대출여부 : </th><td>'+search.documents[0].status+"</td></tr>";
								htmls += '<tr><th>ISBN : </th><td>'+search.documents[0].isbn+"</td></tr>";
								htmls += '<tr><th>출판일 : </th><td>'+search.documents[0].datetime+"</td></tr>";
								htmls += '<tr><th>번역자 : </th><td>'+search.documents[0].translators+"</td></tr>";
								htmls += '<tr><th>판매가 : </th><td>'+search.documents[0].sale_price+" 원</td></tr>";
								htmls += '<tr><th>내용 : </th><td>'+search.documents[0].contents+"</td></tr>";
								htmls += '</table>';
								htmls += '</div>';
							$("#list").html(htmls);
							
							$("#bookRequest").click(function(){
								location.href="bookRequestForm?isbn="+search.documents[0].isbn;
							});
							$("#prev_button").click(function(){
								history.back();
							});
		
						})
					});
				
				</script>
	<%@ include file="include/pagelayoutFooter.jsp" %>
</body>
</html>