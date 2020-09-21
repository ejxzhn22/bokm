<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
            <h1 class="h3 mb-2 text-gray-800">예약관리</h1>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
              <div class="card-header py-3"></div>
              <div class="card-body">
                <div class="table-responsive">
                  <table
                    class="table table-bordered"
                    id="dataTable"
                    width="100%"
                    cellspacing="0"
                    style="text-align:center"
                  >
                    <thead>
                      <tr>
                        <th>책이름</th>
                        <th>저자</th>
                        <th>출판사</th>
                        <th>예약자</th>
                        <th>예약가능일자</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tfoot>
                      <tr>
                        <th>책이름</th>
                        <th>저자</th>
                        <th>출판사</th>
                        <th>예약자</th>
                        <th>예약가능일자</th>
                        <th></th>
                      </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="borrowlist" items="${list}">
			          <tr>
			            <td>${borrowlist.bk_name}</td>
			            <td>${borrowlist.bk_writer}</td>
			           <td>${borrowlist.bk_publisher}</td>
			            <td>${borrowlist.bd_reservation}</td>
			            <td>${borrowlist.bd_real_return_date}</td>
			            <td><a href="admincancelreser?bk_id=${borrowlist.bd_reservation}&bk_name=${borrowlist.bk_name}&bk_icode= ${borrowlist.bk_icode}&bb_id=${borrowlist.bd_reservation}">강제취소</a></td>
			          </tr>
			          </c:forEach>
                    </tbody>
                  </table>
                </div>
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
    <div
      class="modal fade"
      id="logoutModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button
              class="close"
              type="button"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            Select "Logout" below if you are ready to end your current session.
          </div>
          <div class="modal-footer">
            <button
              class="btn btn-secondary"
              type="button"
              data-dismiss="modal"
            >
              Cancel
            </button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
