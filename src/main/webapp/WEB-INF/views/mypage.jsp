<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>MyInfo</title>
<link rel="stylesheet" href="resources/css/mypage.css" />
<link
	href="${pageContext.request.contextPath}/resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/admin/css/sb-admin-2.min.css"
	rel="stylesheet" />
<!-- Custom styles for this page -->
<link
	href="${pageContext.request.contextPath}/resources/admin/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet" />
	
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="header">
	<%@ include file="include/pagelayoutHeader.jsp" %>
	</div>
	
	
	<section class="myinfo">
	<div class="myinfo_top">
		<div class="myinfo_title">마이페이지</div>
		<div class="myinfo_topline"></div>
	</div>

		<div class="myinfo_info">
			<div class="myinfo_infolist">
				<ul class="infolist-ul">
					<li class="infolist-name">${user.mb_name}</li>
					<li class="infolist-email">${user.mb_email}</li>
					<li class="infolist-pnum">${user.mb_phone}</li>
					<li class="infolist-pnum">${user.mb_address}</li>
					<li class="infolist-user">${user.mb_auth}</li>
				</ul>
			</div>
			<div class="myinfo_infolist2">
				<div class="myinfo_infolist2-ul">
					<div class="myinfo_infolist2-li">
						<div class="infolist2-bor">대출건수</div>
						<div class="infolist2-num">${bcount}</div>
					</div>
					<div class="myinfo_infolist2-li">
						<div class="infolist2-over">연체건수</div>
						<div class="infolist2-num">${arrcount}</div>
					</div>
				</div>
				<div class="myinfo_infolist2-ul">
					<div class="myinfo_infolist2-li">
						<div class="infolist2-reser">예약건수</div>
						<div class="infolist2-num">${rcount}</div>
					</div>
					<div class="myinfo_infolist2-li">
						<div class="infolist2-warn">내가쓴글</div>
						<div class="infolist2-num">${boardcount}</div>
					</div>
				</div>
			</div>
		</div>

		<div class="myinfo_notice">
			<div class="myinfo_noticelist">
				<ul class="myinfo_noticelist-ul">
					<li class="myinfo_noticelist-sen">서비스의 원활한 이용을 위해 개인연락처는 최신정보를
						유지해주시기 바랍니다.</li>
					<li class="myinfo_noticelist-sen">개인정보보호를 위해 공유 PC에서는 반드시 사용 후
						로그아웃을 확인하세요.</li>
					<li class="myinfo_noticelist-sen">개인정보보호를 위해 비밀번호를 타인과 공유하지
						마세요.</li>
					<li class="myinfo_noticelist-sen">타 사이트와는 다른 비밀번호를 사용하고, 비밀번호는
						주기적으로 변경해주세요.</li>
				</ul>
			</div>
			<div class="myinfo_noticebutton">
				<a href="infoupdate">개인정보관리</a>
			</div>
		</div>
		<div class="myinfo_quickbtn">
			<div class="myinfo_quickbtn-btn">
				<a href="myreview?mb_id=${user.mb_id}&mb_email=${user.mb_email}"><strong>나의서평 </strong>바로가기</a>
			</div>
			<div class="myinfo_quickbtn-btn">
				<a href="movemyboard?mb_id=${user.mb_id}"><strong>내가쓴글 </strong>바로가기</a>
			</div>
			<div class="myinfo_quickbtn-btn">
				<a href="movemynotice?mb_id=${user.mb_id}"><strong>개인공지 </strong>바로가기</a>
			</div>
			<div class="myinfo_quickbtn-btn">
          		<a href="mypage_delivery"><strong>배송관리 </strong>바로가기</a>
        	</div>
		</div>

		<div class="guide-title">대출현황</div>
		<div class="myinfo_guide">
			<div class="myinfo_guide-sen">연체 도서와 대출중인 도서중 반납일자가 가까운 순으로
				6권까지 보입니다.</div>
			<div class="myinfo_guide-btn">
				<a href="moveborrowlist?mb_id=${user.mb_id }">대출현황 전체보기</a>
			</div>
		</div>

		<%@include file="include/mypageborrow.jsp"%>

		<div class="guide-title">예약현황</div>
		<div class="myinfo_guide">
			<div class="myinfo_guide-sen">일정기간동안 수령되지 않은 자료는 예약 취소처리되며 서가에
				재배치됩니다.</div>
			<div class="myinfo_guide-btn">
				<a href="movereservation?mb_id=${user.mb_id }">예약현황 전체보기</a>
			</div>
		</div>

		<%@include file="include/mypagereser.jsp"%>

		<div class="guide-title">개인공지사항</div>
		<div class="myinfo_guide">
			<div class="myinfo_guide-sen">나의 도서관 에서는 최근 미확인 알림 5건만 확인하실 수
				있습니다.</div>
			<div class="myinfo_guide-btn">
				<a href="movemynotice?mb_id=${user.mb_id}">개인공지사항 전체보기</a>
				</div>
		</div>
		
		<%@include file="include/mypagenotice.jsp"%>
		
	</section>
	

	<%@ include file="include/pagelayoutFooter.jsp" %>
	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
	<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
 -->
	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="${pageContext.request.contextPath}/resources/admin/js/demo/datatables-demo.js"></script>
</body>
</html>
