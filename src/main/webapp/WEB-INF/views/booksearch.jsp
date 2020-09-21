<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.all-book{
		display:flex;
	}
	.info{
		font-size:25px;
	}
</style>
</head>
<body>
		<input id="bookName" value="" type="text" placeholder="책이름 입력">
		<button id="search">검색</button>
		<br>
		<p>책의 개수 : </p>
		<div id="list"></div>
		
		<script src="https://code.jquery.com/jquery-3.5.1.js"
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous">
		</script>
		<script>
		$(document).ready(function () {
			$("#bookName").keydown(function(key) {
				if (key.keyCode == 13) {
					$("#search").click();
				}
			});
			
			$("#search").click(function () {
				$.ajax({
					method:"GET",
					url:"https://dapi.kakao.com/v3/search/book?target=title",
					data:{query:$("#bookName").val(), size:50},
					headers : {Authorization:"KakaoAK ac96be09e1d7b8a94633476caf244876"}
				})
			
				.done(function(search){
					
					var htmls="";
					$("p").append("<strong>"+search.meta.total_count+"</strong>");
					for(var i=0; i<search.documents.length; i++){
						
						htmls += '<div class="all-book">';
						htmls += '<div class="thumbnail">';
						htmls += "<img src='"+search.documents[i].thumbnail+"'><hr>";
						htmls += '</div>';
						htmls += '<div class="info">';
						htmls += '<strong>제목 : </strong>'+'<a href="detail?isbn='+search.documents[i].isbn+'">'+search.documents[i].title+"</a><br>";
						htmls += '<strong>저자 : </strong>'+search.documents[i].authors+"<br>";
						htmls += '<strong>출판사 : </strong>'+search.documents[i].publisher+"<br>";
						htmls += '<strong>판매가능여부 : </strong>'+search.documents[i].status+"<br>";
						htmls += '<strong>isbn : </strong>'+search.documents[i].isbn+"<br>";
						htmls += '</div>';
						htmls += '</div>';
					}
					$("#list").html(htmls);
				})
			});
		});
		</script>

</body>
</html>