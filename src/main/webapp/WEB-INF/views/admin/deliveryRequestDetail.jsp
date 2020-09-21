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
		table {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
	margin-bottom: 30px;
}
table th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
    width: 420px;
}
table th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
.table{
display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
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
            <h1 class="h3 mb-2 text-gray-800">배송 확인 관리</h1>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
              <div class="card-header py-3"></div>
              <div class="card-body">
                <div class="table">
                  <table>
			<tr><th><strong>ISBN</strong></th>
				<td>${detail.dv_bcode}</td></tr>
			<tr><th>책이름  </th>
				<td>${detail.dv_bk_name}</td></tr>
			
			<tr><th>신청자  </th>
				<td>${detail.dv_bk_id}</td></tr>
			<tr><th>신청자 이름 </th>
				<td>${detail.dv_user}</td></tr>
			
			<tr><th>배송 장소  </th>
				<td>${detail.dv_location}</td></tr>
			
			<tr><th>신청 시간  </th>
				<td>${detail.dv_requesttime}</td></tr>
			
			<tr><th>예상 배송 완료 시간  </th>
				<td>${detail.dv_expectedtime}</td></tr>
			
			<tr><th>집배원  </th>
				<td>
				
					<select id="selectBox">
                       <option value="문제선 기사님">문제선</option>
                       <option value="이재복 기사님">이재복</option>
                       <option value="오동엽 기사님">오동엽</option>
                       <option value="김수진 기사님">김수진</option>
                       <option value="조준영 기사님">조준영</option>
               		</select>
               		
                </td></tr>
			
		</table>
		
	<form action="deliveryRequestDetail" method="POST">
		<input type="hidden" name="dv_deliveryman" class="dv_deliveryman">
		<input type="hidden" name="dv_bcode" value="${detail.dv_bcode}">
		<input type="hidden" name="dv_bk_name" value="${detail.dv_bk_name}">
		<input type="hidden" name="dv_bk_id" value="${detail.dv_bk_id}">
		<input type="hidden" name="dv_location" value="${detail.dv_location}">


		<input type="submit" value="신청 승인" id="approve-button" class="btn btn-primary">
	</form>

		
		<script src="https://code.jquery.com/jquery-3.5.1.js"
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous">
		</script>
		<script>
		$(document).ready(function(){
			$("#approve-button").click(function(){
				$(".dv_deliveryman").val($("#selectBox option:selected").val());
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
</html></html>