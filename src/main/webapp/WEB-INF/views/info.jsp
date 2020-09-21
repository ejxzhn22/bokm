<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>도서관 안내</title>

<style>
.top-content {
	display: flex;
	    margin-bottom: 30px;
}

.image {
	
}

.info {
	height: 220px;
}

a {
	text-decoration: none !important;
}

	#btn-top {
    position: fixed;
    right: 2%;
    bottom: 60px;
    display: none;
    z-index: 999;
    background-color: #f0f0f0;
    font-size: 20px;
    padding: 10px;
    margin-right: 0.1em;
    border-radius: 10px;
}

.intro {
	width: 626px;
	background-color: #f0f0f0;
	padding: 7px;
	padding: 35px;
    margin: 15px;
}

.content {
	border-top: 3px solid orange;
	margin-top: 100px;
	padding: 50px;
	position: relative;
	width: 900px;
}
h2{
	margin-bottom:20px;
}
</style>

<script>
	$(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('#btn-top').fadeIn();
			} else {
				$('#btn-top').fadeOut();
			}
		});

		$("#btn-top").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>

</head>
<body>
	<%@ include file="include/pagelayoutHeader.jsp"%>
	<div class="mainaa">
		<div class="side">
			<%@ include file="include/pagelayoutSide4.jsp"%>
		</div>
		<div class="content">
			<h1>도서관 안내</h1>
			<div class="top-content">
				<div class="image">
					<img src="../../resources/uploadfile/Koala.jpg"
						style="width: 320px; height: 235px;">
				</div>
				<div class="info">
					<ul style="list-style: none;">
						<li><em style="background-color: #f0f0f0; padding: 5px;">위치</em>
							인천</li>
						<br>
						<li><em style="background-color: #f0f0f0; padding: 5px;">연락처</em>
							032)000-000-0</li>
						<br>
						<li><em style="background-color: #f0f0f0; padding: 5px;">운영시간</em>
							월-금 09:00-18:00</li>
						<br>
						<li><em style="background-color: #f0f0f0; padding: 5px;">휴관일</em>
							매주 토, 일요일/ 법정 공휴일</li>
					</ul>
				</div>
			</div>
			<div>
				<h2>마음의 물꼬를 틀어가는 “김.이.문.오.조 도서관”</h2>
				<div class="intro">
					<p>소소한 일상 가까이에서 당신이 찾던 책과 사람을 잇는 김.이.문.오.조 도서관 이야기! 일상의 가까이에
						자리한 작은 도서관인 만큼 책을 통한 주민들의 참여도 눈에 띄게 늘고 있다. 또한 단순히 공부하고, 책을 대출하고
						반납하는 공간의 의미를 넘어서, 이웃들과 함께 다양한 문화 활동을 누리는 창조의 공간, 사람과 사람을 이어줘 공동체의
						꿈을 부활시키는 공간, 도서관이라는 공간 자체를 사랑하게 되어 독서가 저절로 따라오는 공간을 추구합니다.</p>
				</div>
			</div>
			<div>
				<h2>찾아오시는길</h2>
				<div id="daumRoughmapContainer1596611930628"
					class="root_daum_roughmap root_daum_roughmap_landing"></div>
				<script charset="UTF-8" class="daum_roughmap_loader_script"
					src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
				<script charset="UTF-8">
					new daum.roughmap.Lander({
						"timestamp" : "1596611930628",
						"key" : "2zj35",
						"mapWidth" : "640",
						"mapHeight" : "360"
					}).render();
				</script>
			</div>
			<a id=btn-top href="#">TOP</a>
		</div>
	</div>
	<%@ include file="include/pagelayoutFooter.jsp"%>
</body>
</html>