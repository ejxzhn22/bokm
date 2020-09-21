<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Library-admin</title>
<style>
.selectBox {
    margin-left: 1000px;
}
input#bookName {
    border-radius: 6px;
    font-size: 20px;
    width: 700px;
    height: 40px;
}
button#search {
    height: 40px;
    width: 120px;
    border-radius: 10px;
}
.thumbnail {
    margin-top: 28px;
}
</style>
<!-- Custom fonts for this template-->

</head>
<style>
	
	.borrowlist3{
		margin-top:30px;
		
	}
	.all-book{
	display : flex;
	margin-bottom: 30px;
	}
	.thumbnail{
	margin-right:20px;
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
				<div class="container-fluid">
					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">책 추가</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3"></div>
						<div class="card-body">
							<div class="table-responsive">
								<div class="section">
									<div class="tot">
										<div class="nav">
										</div>
										<div class="section">
										<div class="content">
				
						<div class="search_requestBook">
						 	<input id="bookName" type="text" placeholder="추가할 책 이름을 입력해주세요. ">
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
						<p class="count_book">책의 개수 : <span class="book_count">0</span></p>
						<h1>${msg}</h1>
						<div id="list"></div>
			<br>
					<div class="paging">
						<button id="prevpage" class="btn btn-info" style="color:white;">이전</button>
						<button id="this_page" class="btn btn-info" style="color:white;">1</button>
						<button id="nextpage" class="btn btn-info" style="color:white;">다음</button>
					</div>
						<textarea class="pagenum">1</textarea>
			</div>
									
										</div>
									</div>
								</div> <!-- 내용 end -->
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
					
					$(".book_count").html("<strong>"+search.meta.total_count+"</strong>");
					$(".tototo").replaceWith("<div class='tototo'>"+search.meta.total_count+"</div>");
					for(var i=0; i<search.documents.length; i++){
						htmls += '<form action="/admin/bookInsert" method="post" id="bookInsert">';
						htmls += '<div class="all-book">';
						htmls += '<div class="thumbnail">';
						htmls += "<img src='"+search.documents[i].thumbnail+"' class='thumbnail'>";
						htmls += '<input type="hidden" name="bk_image" value="'+search.documents[i].thumbnail+'">';
						htmls += '</div>';
						htmls += '<div class="info">';
						htmls += '<table>';
						htmls += '<tr><td><strong>제목 : </strong></td>'+'<td><a href="bookAddDetail?isbn='+search.documents[i].isbn+'">'+'<input type="text" name="bk_name" value="'+search.documents[i].title+'">'+"</a></td></tr>";
						htmls += '<tr><td><strong>저자 : </strong></td>'+'<td><input type="text" name="bk_writer" value="'+search.documents[i].authors+'">'+"</td></tr>";
						htmls += '<tr><td><strong>출판사 : </strong></td>'+'<td><input type="text" name="bk_publisher" value="'+search.documents[i].publisher+'">'+"</td></tr>";
						htmls += '<tr><td><strong>판매가능여부 : </strong></td>'+'<td><input type="text" name="bk_status" value="'+search.documents[i].status+'">'+"</td></tr>";
						htmls += '<tr><td><strong>isbn : </strong></td>'+'<td><input type="text" name="bk_icode" value="'+search.documents[i].isbn+'">'+"</td></tr>";
						htmls += '<input type="hidden" name="bk_introduction" value="'+search.documents[i].contents+'">'+"<br>";
						htmls += '<input type="hidden" name="bk_publicday" value="'+search.documents[i].datetime+'">'+"<br>";
						htmls += '<tr><td><button type="submit" class="btn btn-primary" style="color:white;">책추가</button></td></tr>'
						htmls += '</table>';
						htmls += '</div>';
						htmls += '</div>';
						htmls += '</form>';
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
