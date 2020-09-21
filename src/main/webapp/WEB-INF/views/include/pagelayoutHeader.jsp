<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width">
<title>Insert title here</title>

</head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.9.0/css/all.css"/> 
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/admin/css/sb-admin-2.min.css"
	rel="stylesheet" />
<%-- <script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.5.1.js"></script> --%>
<script src="https://code.jquery.com/jquery-3.5.1.js"
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous">
		</script>
<body>
		<div class="header">	
		<!-- 헤더 -->
		<div class="header1">
			<div class="main-icon">
			<a href="/"><img src="${pageContext.request.contextPath}/resources/images/logo1.jpg" class="logo111"></a>
			</div>
			
			<div class="header-icon">
			<div class="dot">
					<c:if test="${user==null }">
				<div>
					<a href="${pageContext.request.contextPath}/login">
						<i class="fas fa-lock"></i><strong>로그인</strong> </a>
				</div>
				<div class="joinbox">
					<a href="../join/email"><i class="fas fa-users"></i><strong>회원가입</strong></a>
				</div>
					</c:if>
					<c:if test="${user!=null}">
					<div class="namebox"><strong>${user.mb_name}</strong>님 환영합니다.</div>
					<a href="../logout"><i class="fas fa-unlock"></i><strong>로그아웃</strong> </a>
				<div class="mypagebox">
					<a href="../movemypage?mb_id=${user.mb_id}"><i class="fas fa-folder"></i><strong>마이페이지</strong></a>
				</div>
					</c:if>
				<div class="alertsbox">
				<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown no-arrow mx-1">
				<a class="nav-link dropdown-toggle" href="movemynotice?mb_id=${user.mb_id}" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
					<i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
					<c:if test="${acount ne null}">
					<span class="badge badge-danger badge-counter">${acount}</span>
					</c:if>
				</a> 
				
				
				<!-- Dropdown - Alerts -->
				<div
					class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
					aria-labelledby="alertsDropdown">
					<h6 class="dropdown-header">Alerts Center</h6>
					<c:forEach var="alertlist" items="${alist}">
					<a class="dropdown-item d-flex align-items-center" href="movemynotice?mb_id=${user.mb_id}">
						<div class="mr-3">
							<div class="icon-circle bg-primary">
								<i class="fas fa-file-alt text-white"></i>
							</div>
						</div>
						<div>
							<div class="small text-gray-500">${alertlist.bb_date}</div>
								<span class="font-weight-bold">
									${alertlist.bb_title}
								</span>
						</div>
					</a>
					</c:forEach>
					
					<a class="dropdown-item text-center small text-gray-500" href="movemynotice?mb_id=${user.mb_id}">
						Show All Alerts</a>
				</div>
			</li>
		</ul>
		</div>
			</div>
			</div>
		</div>
		<div class="all-nav-bar">
			<div class="nav-bar">
				<!-- 네비게이션 바! -->
				<ul></ul>
				<ul><a href="#" class="nav-menu">자료검색</a></ul>
				<ul><a href="#" class="nav-menu">도서관서비스</a></ul>
				<ul><a href="#" class="nav-menu">열린마당</a></ul>
				<ul><a href="#" class="nav-menu">도서관안내</a></ul>
				<ul><a href="../admin/adminHome" class="nav-menu"><i class="fas fa-bars"></i></a></ul>
			</div>

			
			
			<div class="hidden-nav-bar">
				<div class="search-menu">
					<ul class="hidden-ul">
						<li class="hidden-menu"><a href="../allBookSearch">우리책검색</a></li>
						<li class="hidden-menu"><a href="../bookRecommend">추천도서</a></li>
						<li class="hidden-menu"><a href="../bookPopular">인기도서</a></li>
					</ul>
				</div>
				<div class="service-menu">
					<ul class="hidden-ul">
						<li class="hidden-menu"><a href="../bookServiceInfo">대출/반납/예약/연장 안내</a></li>
						<li class="hidden-menu"><a href="../bookRequestInfo">희망도서 안내</a></li>
						<li class="hidden-menu"><a href="../bookRequestSearch">희망도서 신청</a></li>
						<li class="hidden-menu"><a href="../bookDeliveryList">책 배송</a></li>
					</ul>
				</div>
				<div class="bbs-menu">
					<ul class="hidden-ul">
						<li class="hidden-menu"><a href="../board/boardlist?bb_bnum=notice">공지사항</a></li>
						<li class="hidden-menu"><a href="../board/boardlist?bb_bnum=frequestions">자주 하는 질문</a></li>
						<li class="hidden-menu"><a href="../board/boardlist?bb_bnum=qna">묻고 답하기</a></li>
					</ul>
				</div>
				<div class="lib-announcement-menu">
					<ul class="hidden-ul">
						<li class="hidden-menu"><a href="../info">도서관 정보</a></li>
					</ul>
				</div>
			</div>
			
		</div>
		
		<div class="nav-bar-sub">
				<div class="nav-bar-icon">
					<!-- <a href="/"><i class="fas fa-home"></i></a>  -->
					
				</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/sb-admin-2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>


</body>
<script>
$(document).ready(function(){
	$('.hidden-nav-bar').hide();
	 $('.nav-bar').click(function(){
	        $('.hidden-nav-bar').show();
	        $('.nav-bar-sub').hide();
	 $('.all-nav-bar').mouseleave(function(){
	        $('.hidden-nav-bar').hide();
	        $('.nav-bar-sub').show();
	 });
	 });
});

//스크롤 100px이상일때 박스 상단 따라다니기 및 배경색 변경
$(window).scroll(function() {
  
	if($(this).scrollTop() > 100) {
		$(".all-nav-bar").css('position','fixed');
		$(".nav-bar").css('background','#624941');
	}
	else {
		$(".all-nav-bar").css('position','relative');
		$(".nav-bar").css('background','#624941');
	}
});
</script>
</html>