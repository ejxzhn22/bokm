<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
	<title>게시판수정</title>
</head>
<!-- jQuery 3.4.1 -->
<script src="${pageContext.request.contextPath}/resources/jQuery/jquery-3.4.1.min.js"></script>
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
</style>
<body>

<div class="tot">
	<div class="nav"></div>
	<div class="section">
	<section class="boardUpdate">
		<ol class="breadcrumb">
			<c:if test="${board.bb_bnum eq 'notice'}">
		  		<td class="breadcrumb-item active" style="font-size:20px"><h1>공지사항</h1>
			</c:if>
			<c:if test="${board.bb_bnum eq 'frequestions'}">
		  		<td class="breadcrumb-item active" style="font-size:20px"><h1>자주하는 질문</h1>
			</c:if>
			<c:if test="${board.bb_bnum eq 'qna'}">
		  		<td class="breadcrumb-item active" style="font-size:20px"><h1>묻고 답하기</h1>
			</c:if>
		</ol>
		<div class="box">
			<div class="box-body">
			<div class="box-header">
				<h3 class="box-title">게시판 수정하기</h3>
			</div>
			<form method="post">
				 <div class="form-group row">
			      <label class="col-sm-2 col-form-label">게시글 번호</label>
				      <div class="col-sm-10">
				        <input type="text" name="bb_num" value="${board.bb_num}" class="readOnlyInput" readonly>
				      </div>
			     </div>
				  <div class="form-group row">
			      <label class="col-sm-2 col-form-label">제목</label>
			      <div class="col-sm-10">
			        <input type="text" name="bb_title" value="${board.bb_title}" class="readOnlyInput">
			      </div>
			     </div>

				 <div class="form-group row" >
			      <label class="col-sm-2 col-form-label">내용</label>
			      <div class="col-sm-10">
			      	<textarea class="form-control" name="bb_content" rows="3" style="width:400px; margin:0 auto;">${board.bb_content}</textarea>
			     	</div>
			     </div>

				<div class="form-group row">
			      <label class="col-sm-2 col-form-label">작성자</label>
			      <div class="col-sm-10">
			        <input type="text" readonly class="readOnlyInput" value="${board.bb_name}">
			      </div>
			    </div>
			    <div class="box-footer">
					<button type="submit" class="btn btn-primary">수정완료</button>
				</div>
					<input type="hidden" name="page" value="${criteria.page}"> 
					<input type="hidden" name="perPageNum" value="${criteria.perPageNum}">
				</form>
			</div>
		</div>
		</section>
		</div>
		</div> <!-- 내용 end -->
	<div id="replyList"></div>
</body>
</html> --%>



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
					<h1 class="h3 mb-2 text-gray-800">게시판 관리 - 수정</h1>

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3"></div>
						<div class="card-body">
							<div class="table-responsive">
								<div class="tot">
									<div class="nav"></div>
									<div class="section">
									<section class="boardUpdate">
										<ol class="breadcrumb">
											<c:if test="${board.bb_bnum eq 'notice'}">
										  		<td class="breadcrumb-item active" style="font-size:20px"><h1>공지사항</h1>
											</c:if>
											<c:if test="${board.bb_bnum eq 'frequestions'}">
										  		<td class="breadcrumb-item active" style="font-size:20px"><h1>자주하는 질문</h1>
											</c:if>
											<c:if test="${board.bb_bnum eq 'qna'}">
										  		<td class="breadcrumb-item active" style="font-size:20px"><h1>묻고 답하기</h1>
											</c:if>
										</ol>
										<div class="box">
											<div class="box-body">
											<div class="box-header">
												<h3 class="box-title">게시글 수정하기</h3>
											</div>
											<form method="post">
												 <div class="form-group row">
											      <label class="col-sm-2 col-form-label">게시글 번호</label>
												      <div class="col-sm-10">
												        <input type="text" name="bb_num" value="${board.bb_num}" class="readOnlyInput" readonly>
												      </div>
											     </div>
												  <div class="form-group row">
											      <label class="col-sm-2 col-form-label">제목</label>
											      <div class="col-sm-10">
											        <input type="text" name="bb_title" value="${board.bb_title}" class="readOnlyInput">
											      </div>
											     </div>
								
												 <div class="form-group row" >
											      <label class="col-sm-2 col-form-label">내용</label>
											      <div class="col-sm-10">
											      	<textarea class="form-control" name="bb_content" rows="3" style="margin:0 auto;">${board.bb_content}</textarea>
											     	</div>
											     </div>
								
												<div class="form-group row">
											      <label class="col-sm-2 col-form-label">작성자</label>
											      <div class="col-sm-10">
											        <input type="text" readonly class="readOnlyInput" value="${board.bb_name}">
											      </div>
											    </div>
											    <div class="box-footer">
													<button type="submit" class="btn btn-primary">수정완료</button>
												</div>
												</form>
											</div>
										</div>
										</section>
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
