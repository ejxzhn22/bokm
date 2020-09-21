<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Library-admin</title>
  </head>
<body>
  <body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
    <!-- 사이드바 -->
    <%@include file="include/sidebar.jsp" %>
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
        <!-- 상단바 -->
        <%@include file="include/topbar.jsp" %>
<!--  메인!!!!!!!!!!!!!!!! -->
         <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">추천도서목록</h1>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
              <div class="card-header py-3"></div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align:center">
                    <thead>
                      <tr>
					<td>글 번호</td>
					<td>ISBN</td>
					<td>책 제목</td>
					<td>저자</td>
					<td>추천해제</td>
					</tr>
                    </thead>
                    <tfoot>
                      <tr>
					<td>글 번호</td>
					<td>ISBN</td>
					<td>책 제목</td>
					<td>저자</td>
					<td>추천해제</td>
					</tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="re" items="${rec}" varStatus="status">
					<tr>
					<td>${status.count}</td>
					<td>${re.bk_icode}</td>
					<td>${re.bk_name}</td>
					<td>${re.bk_writer}</td>
					<td><input type="button" value="추천해제" onClick="window.open('recBook_Popup?bk_icode=${re.bk_icode}','_blank',
					'toolbar=yes,scrollbars=yes,resizable=yes,top=200,left=500,width=400,height=520');" class="btn btn-danger"></td>
					</tr>
					</c:forEach>
                    </tbody>
                  </table>
                </div>
                <strong>※추천도서는 10개 까지만 선택 가능합니다.</strong>
              </div>
            </div>
          </div>
          <!-- /.container-fluid -->
        </div>
        <!-- Footer -->
   	 <%@include file="include/footer.jsp" %>
        <!-- End of Footer -->
      </div>
      <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            Select "Logout" below if you are ready to end your current session.
          </div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">
              Cancel
            </button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>