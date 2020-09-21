<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<!-- jQuery 3.4.1 -->
<script src="${pageContext.request.contextPath}/resources/jQuery/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>

<title>Library-admin</title>

<!-- Custom fonts for this template-->

</head>
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
					<h1 class="h3 mb-2 text-gray-800">게시판 관리 - 전체목록</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3"></div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0" style="text-align: center">
									<thead>
										<tr>
											
											<th>게시판 제목</th>
											<th>게시판 ID</th>
											<th>권한(쓰기/읽기)</th>
											<th>글 갯수</th>
											<th>게시물 관리</th>
											<th>ETC</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											
											<th>게시판 제목</th>
											<th>게시판 ID</th>
											<th>권한(쓰기/읽기)</th>
											<th>글 갯수</th>
											<th>게시물 관리</th>
											<th>ETC</th>
										</tr>
									</tfoot>
									<tbody>
									<tr>
										<td>공지사항</td>
										<td>notice</td>
										<td>관리자/비회원</td>
										<td>${ncount}</td>
										<td>
										<button type="button" class="btn btn-primary btn-flat" id="updateBtn" onClick="location.href='../admin/boardlist2?bb_bnum=notice';">
							            	<i class="fa fa-pencil"></i> 글보기
							        	</button>
										</td>
										<td></td>
									</tr>
									<tr>
										<td>자주하는 질문</td>
										<td>frequestions</td>
										<td>관리자/비회원</td>
										<td>${fcount }</td>
										<td>
										<button type="button" class="btn btn-primary btn-flat" id="updateBtn" onClick="location.href='../admin/boardlist2?bb_bnum=frequestions';">
							            	<i class="fa fa-pencil"></i> 글보기
							        	</button>
										</td>
										<td></td>
									</tr>
									<tr>
										<td>묻고답하기</td>
										<td>qna</td>
										<td>회원/관리자</td>
										<td>${qcount }</td>
										<td>
										<button type="button" class="btn btn-primary btn-flat" id="updateBtn" onClick="location.href='../admin/boardlist2?bb_bnum=qna';">
							            	<i class="fa fa-pencil"></i> 글보기
							        	</button>
										</td>
										<td></td>
									</tr>
										
									</tbody>
								</table>
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
