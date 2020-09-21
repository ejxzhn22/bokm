<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <title>Library-admin</title>
  </head>
  <style>
	.approve-button{
		text-align:center;
	}
	.all_form{
		display: flex;
    	justify-content: center;
   	 	align-items: center;
    	flex-direction: column;
	}
	.info_form{
		text-align:left;
	}
</style>
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
            <h1 class="h3 mb-2 text-gray-800">대출 승인</h1>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
              <div class="card-header py-3"></div>
              <div class="card-body">
              	<div class="content">
              	</div>
                <div class="table-responsive">

			<div class="all_form">
			<h3>본 도서 (<strong>${detail.dv_bk_name}</strong>)배송완료 처리 하시겠습니까?</h3>
			<br><br>
			<div class="info_form">
			<p>※ 대출 승인(배송 완료 처리)이 완료된 도서에 대해서는 <strong>관리자 - 대출/예약/연장관리 - 대출 관리</strong> 탭에서
			확인할 수 있습니다.</p>
			<p>※ 승인이 완료된 도서 목록은 <strong>관리자 - 배송관리 - 배송완료 목록</strong>에 저장됩니다.</p>
			<p>※ 해당 배송 기사님만 처리해주세요.</p>
			</div>
			<form action="deliveryRecognizeDetail" method="post">
				<input type="hidden" name="dv_bcode" value="${detail.dv_bcode}">
				<input type="hidden" name="dv_bk_id" value="${detail.dv_bk_id}">
			<input type="submit" value="배송완료" class="btn btn-primary">
			<input type="button" id="hold_button" value="홈" class="btn btn-info">
			</form>
			</div>
		


		
		<script src="https://code.jquery.com/jquery-3.5.1.js"
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous">
		</script>
		<script>
			$(document).ready(function(){
				$("#hold_button").click(function(){
					location.href="adminHome";
				});
			});
		</script>

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