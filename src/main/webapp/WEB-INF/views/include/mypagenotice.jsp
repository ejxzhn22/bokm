<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reservation.css" />
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
</head>
<body>
       <c:if test="${nlist[0] eq null}">
			<div class="myinfo_guide-list">공지 목록이 없습니다.</div>
		</c:if>
		<c:if test="${nlist[0] ne null}">
		 	<table class="table table-striped table-hover" style="text-align:center">
	          <tr>
	            <td>번호</td>
	            <td>제목</td>
	            <td>날짜</td>
	            <td>조회</td>
	            <td></td>
	          </tr>
	          <tr id="ajaxnotice">
	          </tr>
        	</table>
        </c:if>
        
		  <!-- Large modal -->
		<c:forEach var="borrowlist" items="${nlist}" varStatus="status" begin="0" end="4" step="1">
			<div class="modal fade bs-example-modal-lg${status.index}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-lg">
			    <div class="modal-content">
			      <div class="modal-header">
        			<h5 class="modal-title" id="myModalLabel">${borrowlist.bb_title}</h5>
        			<span>받은 날짜: ${borrowlist.bb_date}</span>
				  </div>
			      <div class="modal-body">
			      	${borrowlist.bb_content}
			      </div>
			      
			      <div class="modal-footer">
       				 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      			  </div>
			    </div>
			  </div>
			</div>
		</c:forEach>
		
<script>
      $(document).ready(function(){
    	  noticelist();
    	  
    	  $(document).on('click','.title', function(){
    		var id= $(this).attr('id');
    		var url = "${pageContext.request.contextPath}/noticeup";
    		var paramData = {"bb_num":id};		
    	 	console.log("aaaaaaaaaa"+id);
    	  
    	  $.ajax({
  			type: 'POST',
  	        url: url,
  	        data : paramData,
  	        dataType: 'json',
  			success: function(result){
  				var htmls = "";
  				
  				htmls += '<td id="ajaxtd${borrowlist.bb_num}">';
				htmls += '<c:if test="${borrowlist.bb_readcnt == 0}" >';
				htmls += '안읽음';
				htmls += '</c:if>';
				htmls += '<c:if test="${borrowlist.bb_readcnt != 0}">';
				htmls += '읽음';
				htmls += '</c:if>';
				htmls += '</td>';
				
				$("#ajaxtd"+id).replaceWith(htmls);
  			}
  			, error: function(error){
  				console.log("에러 : " + error);
  			}
  		  }); //ajax
      });
   	});
      
      
   // 개인공지 조회
      function noticelist(){
      	var url = "${pageContext.request.contextPath}/notice";
      	var id = ${nlist[0].bb_id};
      	if(id != null){
      		var paramData = {"mb_id": "${nlist[0].bb_id}"};
      	}else{
      		var paramData = {"mb_id": "0"};
      	}
      	
      	$.ajax({
      		type:'POST',
      		url : url,
      		data: paramData,
      		dataType: 'json',
      		success: function(result){
      			var htmls = "";
      			
   					htmls += '<c:forEach var="borrowlist" items="${nlist}" varStatus="status" begin="0" end="4" step="1">';
   					htmls += '<tr>';
   					htmls += ' <td>${borrowlist.bb_num}</td>';
   					htmls += '<td>';
   					htmls += '<a class="title" id="${borrowlist.bb_num}" href="javascript:void(0);" data-toggle="modal" data-target=".bs-example-modal-lg${status.index}" >';
   					htmls += '${borrowlist.bb_title}';
   					htmls += '</a>';
   					htmls += '</td>';
   					htmls += ' <td>${borrowlist.bb_date}</td>';
   					htmls += '<td id="ajaxtd${borrowlist.bb_num}">';
   					htmls += '<c:if test="${borrowlist.bb_readcnt == 0}">';
   					htmls += '안읽음';
   					htmls += '</c:if>';
   					htmls += '<c:if test="${borrowlist.bb_readcnt != 0}">';
   					htmls += '읽음';
   					htmls += '</c:if>';
   					htmls += '</td>';
   					htmls += '<td><a href="noticedel?bb_num=${borrowlist.bb_num}">삭제</a></td>';
   					htmls += '</tr>';
   					htmls += '</c:forEach>';
   					
      			$("#ajaxnotice").replaceWith(htmls);
    			
      		},
      		error:function(data){
      			alert("에러가 발생했습니다.");
      		}
      	}); //ajax end
      }

</script>
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>