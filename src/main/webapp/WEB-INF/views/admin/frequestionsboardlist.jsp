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
					<h1 class="h3 mb-2 text-gray-800">게시판 관리 - 자주하는 질문</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3"></div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0" style="text-align: center">
									<thead>
										<tr>
											<th>작성자</th>
											<th>게시글번호</th>
											<th>게시판분류</th>
											<th>제목</th>
											<th>게시일자</th>
											<th>조회수</th>
											<th>관리</th>
										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>작성자</th>
											<th>게시글번호</th>
											<th>게시판분류</th>
											<th>제목</th>
											<th>게시일자</th>
											<th>조회수</th>
											<th>관리</th>
										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="boardlist" items="${list}">
											<tr>
												<td>${boardlist.bb_name}</td>
												<td>${boardlist.bb_num}</td>
												<td>${boardlist.bb_bnum}</td>
												<td><a href="../admin/boarddetail?bb_num=${boardlist.bb_num }">${boardlist.bb_title}</a></td>
												<td>${boardlist.bb_date}</td>
												<td>${boardlist.bb_readcnt}</td>
												<td>
													<button type="button" class="btn btn-info btn-flat" id="updateBtn" onClick="location.href='boardupdate?bb_bnum=${boardlist.bb_bnum}&bb_num=${boardlist.bb_num}';">
							            				<i class="fa fa-pencil"></i> 수정
							        				</button>
													<button type="button" class="btn btn-danger btn-flat" id="deleteBtn" onClick="location.href='boarddelete?bb_bnum=${boardlist.bb_bnum}&bb_num=${boardlist.bb_num}';">
							            				<i class="fa fa-pencil"></i> 삭제
							        				</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div class="pull-right">
							        <button type="button" class="btn btn-success btn-flat" id="writeBtn" onClick="location.href='boardinsert?bb_bnum=${board.bb_bnum}';">
							            <i class="fa fa-pencil"></i> 글쓰기
							        </button>
							    </div>
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
