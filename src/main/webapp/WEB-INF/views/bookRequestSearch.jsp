<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<script src="https://code.jquery.com/jquery-3.5.1.js"
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous">
		</script>
<title>Insert title here</title>
<style>
	
	.all-book{
		display:flex;
		margin-bottom:20px;
	}
	.info{
		font-size:25px;
	}
	.content{
		border-top:3px solid orange;
		width:900px;
		margin-top:100px;
		position:relative;
	}
	.selBox{
		font-size: 15px;
    	padding: 5px;
	}
	#bookName{
		font-size: 25px;
    	padding: 2px;
    	width: 560px;
    	border-bottom-right-radius: 30px;
    	margin-right: 10px;
	}
	#search{
		border: 1px solid skyblue;
		background-color: black;
		color: #f0f0f0;
		padding: 5px;
		font-size: 20px;
		width: 75px;
		height: 40px;
		border-radius: 10px;
	}
	#search:hover{
		color:#ef7a34;
	}
	.selectBox{
		display:flex;
		justify-content:flex-end;
		background: #f1f1f1;
    	padding: 30px;
	}
	#prevpage,#this_page,#nextpage{
	    display: inline-block;
    	margin: 0 2px;
    	padding: .3em 1em;
    	border: 1px solid #ddd;
    	vertical-align: middle;
    	color: inherit;
    	font-size: 20px;
    	background: white;
    	height: 40px;
    	cursor:pointer;
	}
	#prevpage:hover,#this_page:hover,#nextpage:hover{
		background-color: #3a5696;
   		border-color: #3a5696;
   		color:white;
	}
	.paging{
		display:flex;
		justify-content:center;
		align-items:center;
	}
	#btn-top {
	    position: fixed;
	    right: 2%;
	    bottom: 60px;
	    display: none;
	    z-index: 999;
	    background-color: #f0f0f0;
	    font-size: 20px;
	    padding: 10px;
	    margin-right: 0.1em;
	    border-radius: 10px;
	}
	#btn-top:hover{
		background-color: black;
		color:white;
	}
	.search_requestBook {
    background: #f1f1f1;
    height: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: unset;
}
</style>
</head>
<body>

		<div class="header">
			<%@ include file="include/pagelayoutHeader.jsp" %>
		</div>
		
		<div class="mainaa">
			<div class="side">
				<%@ include file="include/pagelayoutSide2.jsp" %>
			</div>
			<div class="content">
				<h1 class="h1">희망도서 신청</h1>
						<div class="search_requestBook">
						 	<input id="bookName" type="text" placeholder="우리 도서관에서 읽고싶은 책을 입력해주세요.">
							<button id="search">검색</button>
						</div>
						<div class="selectBox">
							<select name="selBox" id="selBox" class="selBox">
								<option value=10>10개씩 보기</option>
								<option value=25>25개씩 보기</option>
								<option value=50>50개씩 보기</option>
							</select>
						</div>
			<br>
						<p class="count_book">책의 개수 : <span>0</span></p>
						<h1>${msg}</h1>
						<div id="list"></div>
			<br>
					<div class="paging">
						<button id="prevpage">이전</button>
						<button id="this_page">1</button>
						<button id="nextpage">다음</button>
					</div>
						<textarea class="pagenum">1</textarea>
			</div>

		</div>
		<a id=btn-top href="#">TOP</a>
		<%@ include file="include/pagelayoutFooter.jsp" %>
		
		<script>
	  	
		$(document).ready(function(){
			$("#bookName").keydown(function(key) {
				if (key.keyCode == 13) {
					$("#search").click();
				}
			});
			$(".pagenum").hide();
			$(".paging").hide();
			$(".count_book").hide();
			/* $(".selectBox").hide(); */
			
			
			$("#search").click(function () {
				$(".paging").show();
				$(".count_book").show();
				/* $(".selectBox").show(); */
					$.ajax({
						method:"GET",
						url:"https://dapi.kakao.com/v3/search/book?target=title",
						data:{query:$("#bookName").val(), size:$("#selBox option:selected").val(), page:$(".pagenum").val()},
						headers : {Authorization:"KakaoAK ac96be09e1d7b8a94633476caf244876"}
					})
			
				.done(function(search){
					var htmls="";
					
					$("span").html("<strong>"+search.meta.total_count+"</strong>");
					$(".tototo").replaceWith("<div class='tototo'>"+search.meta.total_count+"</div>");
					for(var i=0; i<search.documents.length; i++){
						htmls += '<div class="all-book">';
						htmls += '<div class="thumbnail">';
						htmls += "<img src='"+search.documents[i].thumbnail+"' class='thumbnail'>";
						htmls += '</div>';
						htmls += '<div class="info">';
						htmls += '<strong>제목 : </strong>'+'<a href="bookRequestDetail?isbn='+search.documents[i].isbn+'">'+search.documents[i].title+"</a><br>";
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
			$("#nextpage").click(function(){ //
				var bb=Number($(".tototo").text());//전체 책 개수가져옴
				var a=Number( $(".pagenum").val())+1;
				$(".pagenum").html(a);
				$("#this_page").html($(".pagenum").html());
				$("#search").click();
				$( 'html, body' ).animate( { scrollTop : 0 }, 333 );
			});
			$("#prevpage").click(function(){
				var a=Number( $(".pagenum").val())-1;
				if(a<1){
					alert("첫 페이지입니다.");
				}
				else{
					$(".pagenum").html(a);
					$("#this_page").html($(".pagenum").html());
					$("#search").click();
				$( 'html, body' ).animate( { scrollTop : 0 }, 333 );
				}
			});
			
			$(function() {
				$(window).scroll(function() {
					if ($(this).scrollTop() > 500) {
						$('#btn-top').fadeIn();
					} else {
						$('#btn-top').fadeOut();
					}
				});

				$("#btn-top").click(function() {
					$('html, body').animate({
						scrollTop : 0
					}, 400);
					return false;
				});
			});
		</script>
</body>
</html>