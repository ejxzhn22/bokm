<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <meta name="viewport" content="width-device-width" ,initial-scale="1">
    <title>Home</title>
	<link href="${pageContext.request.contextPath}/resources/css/home.css" rel="stylesheet">
    <script>
        $(function () {
            $(window).scroll(function () {
                if ($(this).scrollTop() > 500) {
                    $('#btn-top').fadeIn();
                } else {
                    $('#btn-top').fadeOut();
                }
            });

            $("#btn-top").click(function () {
                $('html, body').animate({
                    scrollTop: 0
                }, 400);
                return false;
            });
        });
    </script>
</head>

<body>
    <%@ include file="include/pagelayoutHeader.jsp" %>
     <div class="image" style="background: no-repeat center/100% url(resources/images/home.jpg);">
		<h2>${msg}</h2>
        <div class="search">
	        <form method="get" action="/search">
	            <input ik-auto-complete="" id="bar-search" class="bar-search" title="통합검색 검색어 입력창" name="query"
	                placeholder="도서명, 저자, 키워드 등 검색어를 입력하세요." ng-model="keyword" data-role="autocomplete" type="text"
	                autocomplete="off" role="textbox" aria-haspopup="true" style="width: 750px;" aria-disabled="false"
	                aria-readonly="false" aria-owns="keyword_listbox" aria-autocomplete="list">
	            <input type="hidden" name="page" value="1">
				<input type="hidden" name="pageNum" value="0">
	            <button type="submit" class="btn-search"><i class="fas fa-search"></i></button>
	        </form>
        </div>
	 
	   <div class="wrap-top-service">
	           <div class="top-service">
	               <div class="calendar">
                      <h3 class="calendar-title">김이문오조도서관</h3>
                      <ul class="calendar-ul">
                          <li class="calendar-li">이용안내</li>
                          <li class="calendar-li2">월~금 09:00~18:00</li>
                      </ul>
                      <ul class="calendar-ul">
                          <li class="calendar-li0">휴관일</li>
                          <li class="calenear-li2">매주 토, 일요일 / 법정공휴일</li>
                      </ul>
	               </div>
	           </div>
	       </div>
        </div>
    <section>
        
        <div class="service" style="font-size: 22px;">
            <div class="btn-service">
                 <div class="service_box">
                 <c:if test="${user ne null }">
                 	<a class="service_icon" href="/movemypage?mb_id=${user.mb_id}">
                 		<img  src="resources/images/mypage.jpg" style="height:115px; width:120px">
                 		<div>내페이지</div>
                 	</a>
                 </c:if>
                 <c:if test="${user eq null }">
                 	<a class="service_icon" href="../login">
                 		<img  src="resources/images/mypage.jpg" style="height:115px; width:120px">
                 		<div>내페이지</div>
                 	</a>
                 </c:if>
                 </div>
                <div class="service_box">
                	<a class="service_icon" href="" >
                		<img src="resources/images/search.jpg" style="height:115px; width:120px">
                		<div>도서검색</div>
                	</a>
                </div>
                <div class="service_box">
                	<a class="service_icon" href="/bookRecommend" >
                		<img   src="resources/images/book.jpg" style="height:115px; width:120px">
                		<div>추천도서</div>
                	</a>
                </div>
                <div class="service_box">
                	<a class="service_icon" href="/bookPopular" >
                		<img src="resources/images/pop.jpg" style="height:115px; width:120px">
                		<div>인기도서</div>
                	</a>
                </div>
            </div>
        </div>
        <hr>
        
 		<div class="low-service">
            <div class="notice" >
                <ul class="notice_ul">
                <h3>공지사항</h3>
                <a class="plus" href="board/boardlist?bb_bnum=notice" style="color: black;"> +더보기</a>
				<c:forEach var="notice" items="${nolist}" begin="0" end="3" step="1">
                <hr>
                <li ng-repeat="notice in noticeList" ng-init="noticeCarousel($last)">
                	<div class="notice-title">전체도서관</div>
                  <!--   <a href="board/boardlist?bb_bnum=${notice.bb_bnum}&bb_num=${notice.bb_num}"> -->
                    <a href="board/boarddetail${pageMaker1.makeSearch(pageMaker1.criteria.page)}&bb_num=${notice.bb_num}">
                        <span ng-bind-html="notice.title" style="color: black;">
                        	${notice.bb_title}
                        </span>
                    </a>
                </li>
                </c:forEach>
                <hr>
                </ul>
            </div>
            <div class="culture">
                <ul class="culture_ul">
                <h3>자주하는질문</h3>
                <a class="plus" href="board/boardlist?bb_bnum=frequestions" style="color: black;"> +더보기</a>
                <c:forEach var="fre" items="${frelist}" begin="0" end="3" step="1">
                <hr>
                <li ng-repeat="culture in cultureList" ng-init="cultureCarousel($last)">
                	<div class="culture-title">전체도서관</div>
                    <a href="board/boarddetail${pageMaker2.makeSearch(pageMaker2.criteria.page)}&bb_num=${fre.bb_num}">
                        <span ng-bind-html="culture.title" style="color: black;">
                        	${fre.bb_title}
                        </span>
                    </a>
                </li>
                </c:forEach>
                <hr>
            </ul>
            </div>
        </div>
        <hr>		
		  <!-- Wrapper for slides -->
		  <div class="photo">
		    <div class="item" >
		      <img class="photo_img" src="resources/images/1.jpg" >
		    </div>
		    <div class="item">
		      <img class="photo_img"  src="resources/images/2.jpg" >
		    </div>
		    <div class="item">
		      <img class="photo_img"  src="resources/images/4.jpg" >
		    </div>
		    <div class="item">
		      <img class="photo_img"  src="resources/images/5.jpg" >
		    </div>
		    <div class="item">
		      <img class="photo_img"  src="resources/images/6.jpg" >
		    </div>
		    <div class="item">
		      <img class="photo_img"  src="resources/images/7.jpg" >
		    </div>
		    
		  </div>
        
    </section>
    <%@ include file="include/pagelayoutFooter.jsp" %>
    <a id="btn-top" href="#">TOP</a>
	
	
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.5.1.js"></script>
	</body>
</html>
