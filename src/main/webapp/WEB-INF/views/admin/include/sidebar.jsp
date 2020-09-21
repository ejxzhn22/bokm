<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
      href="${pageContext.request.contextPath}/resources/admin/vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/admin/css/sb-admin-2.min.css" rel="stylesheet" />
    <!-- Custom styles for this page -->
    <link
      href="${pageContext.request.contextPath}/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css"
      rel="stylesheet"
    />
</head>
<body>
 <ul
        class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
        id="accordionSidebar"
      >
        <!-- 사이드바 - Brand -->
        <a
          class="sidebar-brand d-flex align-items-center justify-content-center"
          href="../admin/adminHome"
        >
          <div class="sidebar-brand-icon rotate-n-15">
            <i class="fab fa-readme"></i>
          </div>
          <div class="sidebar-brand-text mx-3">Admin</div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0" />

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
          <a class="nav-link" href="index.html">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>현황</span></a
          >
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider" />

        <!-- Heading
        <div class="sidebar-heading">
          Interface
        </div> -->

        <!-- 사이드바 메뉴!!! -->
         <!-- 도서관리 -->
        <li class="nav-item">
          <a
            class="nav-link collapsed"
            href="#"
            data-toggle="collapse"
            data-target="#collapseBook"
            aria-expanded="true"
            aria-controls="collapseBook"
          >
            <i class="fas fa-book"></i>
            <span>도서관리</span>
          </a>
          <div id="collapseBook" class="collapse" aria-labelledby="headingBook" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="../../admin/allBook">도서 목록</a>
              <a class="collapse-item" href="bookRequestListManager">희망도서 관리</a>
              <a class="collapse-item" href="recBook">추천도서 관리</a>
            </div>
          </div>
        </li>

        <!-- 회원관리 -->
        <li class="nav-item">
          <a
            class="nav-link collapsed"
            href="#"
            data-toggle="collapse"
            data-target="#collapseUser"
            aria-expanded="true"
            aria-controls="collapseUser"
          >
            <i class="fas fa-user"></i>
            <span>회원관리</span>
          </a>
          <div
            id="collapseUser"
            class="collapse"
            aria-labelledby="headingUser"
            data-parent="#accordionSidebar"
          >
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="../admin/adminMemberList">회원 관리</a>
              <a class="collapse-item" href="../admin/adminDeleteMemberList">탈퇴 관리</a>
            </div>
          </div>
        </li>

        <!-- 배송관리 -->
        <li class="nav-item">
          <a
            class="nav-link collapsed"
            href="#"
            data-toggle="collapse"
            data-target="#collapseDelivery"
            aria-expanded="true"
            aria-controls="collapseDelivery"
          >
            <i class="far fa-list-alt"></i>
            <span>배송관리</span>
          </a>
                    <div
            id="collapseDelivery"
            class="collapse"
            aria-labelledby="headingDelivery"
            data-parent="#accordionSidebar"
          >
            <div class="bg-white py-2 collapse-inner rounded">
			<a class="collapse-item" href="deliveryRequest">배송현황</a>
              <a class="collapse-item" href="deliveryRequestPrev">배송신청</a>
              <a class="collapse-item" href="deliveryRequestAfter">배송완료목록</a>            </div>
          </div>
        </li>

        <!-- 게시판관리 -->
        <li class="nav-item">
          <a
            class="nav-link collapsed"
            href="#"
            data-toggle="collapse"
            data-target="#collapseBoard"
            aria-expanded="true"
            aria-controls="collapseBoard"
          >
            <i class="far fa-list-alt"></i>
            <span>게시판관리</span>
          </a>
          <div
            id="collapseBoard"
            class="collapse"
            aria-labelledby="headingBoard"
            data-parent="#accordionSidebar"
          >
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="../admin/boardlist">게시판 관리</a>
            </div>
          </div>
        </li>
        <!-- 대출예약관리 -->
        <li class="nav-item">
          <a
            class="nav-link collapsed"
            href="#"
            data-toggle="collapse"
            data-target="#collapseAnalyse"
            aria-expanded="true"
            aria-controls="collapseAnalyse"
          >
            <i class="far fa-chart-bar"></i>
            <span>대출/예약/연장관리</span>
          </a>
          <div
            id="collapseAnalyse"
            class="collapse"
            aria-labelledby="headingAnalyse"
            data-parent="#accordionSidebar"
          >
            <div class="bg-white py-2 collapse-inner rounded">
              <a class="collapse-item" href="/admin/adminBorrow">대출 관리</a>
              <a class="collapse-item" href="/admin/adminReser">예약 관리</a>
              <a class="collapse-item" href="/admin/adminArrears">연체 관리</a>
            </div>
          </div>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider d-none d-md-block" />

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
          <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>
      </ul>
<!-- Bootstrap core JavaScript-->

    <script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/admin/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/admin/js/demo/datatables-demo.js"></script>
</body>
</html>