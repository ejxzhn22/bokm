<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Library-admin</title>

<!-- Custom fonts for this template-->

</head>
<style>
	.content{
		border-top:3px solid orange;
		width:900px;
		margin-top:100px;
	}
	.borrowlist3{
		margin-top:30px;
		
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
					<h1 class="h3 mb-2 text-gray-800">게시판 관리 - 상세보기</h1>

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
											 <h1>게시글 추가</h1>
										<div class="form-group">
										<form method="post" enctype="multipart/form-data">
											  <label>작성자</label>
										      <input value = "${user.mb_name}" name = "mb_name" type="text" class="form-control" readonly><br>
											  <input value=${user.mb_email } name="mb_email" type="hidden">
										      <label>글 제목</label>
										      <input name = "bb_title" type="text" class="form-control"  placeholder="제목을 입력하세요"><br>
										      
										      <label>글 내용</label>
										      <textarea name = "bb_content" class="form-control" rows="3"></textarea>
										      
										      <label>파일</label>
										      <input name = "ufile" type="file" class="form-control"><br>
										      <button type="submit" class="btn btn-primary">등록</button>
										    </form>
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


</body>
</html>
