<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>                  
<meta charset="UTF-8">
<link rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
      integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
      crossorigin="anonymous" />
<style>

	.location{
		width:500px;
	}
	.table {
    	width: 1900px;
    	margin: 0 auto;
    }
    .tr_name,#ttt{
    	text-align:center;
    }
	.content{
		margin-top:100px;
		padding:50px;
		position:relative;
		width: 1550px;
	    margin: 0 auto;
	    margin-top: 80px;
	    height: inherit;
		}
	.mydelivery_top{
		display:flex;
		padding-top:20px;
	}
	.mydelivery_topline{
		width:1350px;
		border-top:3px solid #f0f0f0;
	}
	.mydelivery_title {
	  width:200px;
	  text-align:center;
	  font-size: 35px;
	  margin: 0 0 40px;
	  padding-top:20px;
	  border-top:3px solid orange;
	}
    
</style>
<title>Insert title here</title>

</head>
<body>	
<%@ include file="include/pagelayoutHeader.jsp" %>
      <div class="content">
	<div class="mydelivery_top">
		<div class="mydelivery_title">배송내역</div>
		<div class="mydelivery_topline"></div>
	</div>
		<div>
      <table class="table table-striped table-hover">
			<thead>
                 <tr class="tr_name">
					<td>신청자</td>
					<td>책 제목</td>
					<td class="location">주소</td>
					<td>주문시간</td>
					<td>배송완료시간</td>
					<td>배송상태</td>
					<td>집배원 성함</td>
				</tr>
          </thead>
                   
                    <tbody>
                    <c:forEach var="mp" items="${mypage}" varStatus="status">
					<tr>
					<td>${mp.dv_bk_id}</td>
					<td>${mp.dv_bk_name}</td>
					<td class="location">${mp.dv_location}</td>
					<td>${mp.dv_requesttime}</td>
					<td>${mp.dv_completetime}</td>
					<td id="ttt">
					<button type="button" class="btn btn-primary" onclick="window.open('mypage_deliveryPopup?dv_bcode=${mp.dv_bcode}&dv_state=${mp.dv_state}','_blank',
					'toolbar=yes,scrollbars=yes,resizable=yes,top=200,left=500,width=690,height=590');">${mp.dv_state}</button>
					</td>
					<td id="ttt">${mp.dv_deliveryman}</td>
					</tr>
					</c:forEach>
                    </tbody>
      </table>
      </div>
      </div>
	<%@ include file="include/pagelayoutFooter.jsp" %>
                  
		<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

</body>
</html>