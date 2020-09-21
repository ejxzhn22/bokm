<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>

<head>

<style>

.img-circle {

	width: 200px;

	height: 200px;

	border-radius: 110px;

	margin-right: -21px;

}

.img-king {

	width: 200px;

	height: 200px;

	border-radius: 35px;

}

 

.employee {

	display: flex;

	justify-content: center;

	align-items: center;

	margin-bottom: 30px;

}

 

.employee_name {

	text-align: center;

	font-size: 35px;

	padding: 10px;

	font-family: cursive;

}

 

.ratio {

	padding-top: 20px

}

 

.ratio li {

	float:left;

	position: relative;

	width: 50px;

	height: 300px;

	margin-right: 10px;

	list-style: none;

	text-align: center;

}

 

.ratio div {

	position: absolute;

	left: 0;

	bottom: 0;

	width: 100%;

	background: #4e73df;

	font-size: 0

}

 

.ratio em {

	position: absolute;

	top: -20px;

	font-size: 12px;

	font-weight: bold;

	text-align: center

}

.king{

	margin-right:50px;

}

.all_chartking{

	display:flex;

	justify-content:center;

	align-items:center;

    border-top: 3px solid slategray;

    margin-top: 25px;

	

}

.name{

	margin-left:100px;

	text-align: center;

}

 

</style>

<meta charset="UTF-8">

 

    <title>Library-admin</title>

 

    <!-- Custom fonts for this template-->

    

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

          <!-- Begin Page Content -->

          <div class="container-fluid">

            <!-- Page Heading -->

            <h1 class="h3 mb-2 text-gray-800">김.이.문.오.조 도서관 관리자모드</h1>

 

            <!-- DataTales Example -->

            <div class="card shadow mb-4">

              <div class="card-header py-3"></div>

              <div class="card-body">

                <div class="table-responsive">

                  	<div class="employee">

                  		<div class="employee1">

                  			<img src="${pageContext.request.contextPath}/resources/images/ksj.jpg" class="img-circle">

                  		<div class="employee_name">김</div>

                  		</div>

                  		<div class="employee2">

                  			<img src="${pageContext.request.contextPath}/resources/images/ljb.jpg" class="img-circle">

                  		<div class="employee_name">이</div>

                  		</div>

                  		<div class="employee3">

                  			<img src="${pageContext.request.contextPath}/resources/images/mjs.jpg" class="img-circle">

                  		<div class="employee_name">문</div>

                  		</div>

                  		<div class="employee4">

                  			<img src="${pageContext.request.contextPath}/resources/images/ody.jpg" class="img-circle">

                  		<div class="employee_name">오</div>

                  		</div>

                  		<div class="employee5">

                  			<img src="${pageContext.request.contextPath}/resources/images/jjy.jpg" class="img-circle">

                  		<div class="employee_name">조</div>

                  		</div>

                  	</div>

                  	<h2>김.이.문.오.조 도서관 배송실적</h2>

                  	<div class="all_chartking">

	                  	<ul class="ratio">

					        <li>김<div style="height:calc(${performance0}%*5);"><em>${performance0}</em></div></li>

					        <li>이<div style="height:calc(${performance3}%*5);"><em>${performance3}</em></div></li>

					        <li>문<div style="height:calc(${performance1}%*5);"><em>${performance1}</em></div></li>

					        <li>오<div style="height:calc(${performance2}%*5);"><em>${performance2}</em></div></li>

					        <li>조<div style="height:calc(${performance4}%*5);"><em>${performance4}</em></div></li>

	    				</ul>

    				<div class="king">

    					<div class="name">

    						<div class="siljeok">

	    						<c:if test="${performance0 gt performance1 && performance0 gt performance2 && performance0 gt performance3 && performance0 gt performance4}">
    						<p>👑실적왕👑</p>

	    							<p><strong>김수진</strong> ${performance0}건</p>

	    							<img src="${pageContext.request.contextPath}/resources/images/ksj.jpg" class="img-king">

	    						</c:if>

    						</div>

    						<div class="siljeok">

	    						<c:if test="${performance1 gt performance0 && performance1 gt performance2 && performance1 gt performance3 && performance1 gt performance4}">

    						<p>👑실적왕👑</p>

	    							<p><strong>문제선</strong> ${performance1}건</p> 

	    							<img src="${pageContext.request.contextPath}/resources/images/mjs.jpg" class="img-king">

	    						</c:if>

    						</div>

							<div class="siljeok">

	    						<c:if test="${performance2 gt performance1 && performance2 gt performance3 && performance2 gt performance4 && performance2 gt performance0}">

    						<p>👑실적왕👑</p>

	    							<p><strong>오동엽</strong> ${performance2}건</p>

	    							<img src="${pageContext.request.contextPath}/resources/images/ody.jpg" class="img-king">

	    						</c:if>

    						</div>

							<div class="siljeok">

	    						<c:if test="${performance3 gt performance1 && performance3 gt performance2 && performance3 gt performance0 && performance3 gt performance4}">

    						<p>👑실적왕👑</p>

	    							<p><strong>이재복</strong> ${performance3}건</p>

	    							<img src="${pageContext.request.contextPath}/resources/images/ljb.jpg" class="img-king">

	    						</c:if>

    						</div>

							<div class="siljeok">

	    						<c:if test="${performance4 gt performance1 && performance4 gt performance2 && performance4 gt performance3 && performance4 gt performance0}">

    						<p>👑실적왕👑</p>

	    							<p><strong>조준영</strong> ${performance4}건</p>

	    							<img src="${pageContext.request.contextPath}/resources/images/jjy.jpg" class="img-king">

	    						</c:if>

    						</div>

							<!--<div class="siljeok">

	    						<c:if test="${performance0 eq performance1 || performance0 eq performance2 || performance0 eq performance3 || performance0 eq performance4 || 

	    						performance1 eq performance2 || performance1 eq performance3 || performance1 eq performance4 || 

	    						performance2 eq performance3 || performance2 eq performance4 || performance3 eq performance4}">

	    							<p>실적왕을 가릴 수 없네요💦</p>

	    						</c:if>

    						</div>-->

    					</div>

    				</div>

    				</div>

    				

                </div>

              </div>

            </div>

          </div>

          <!-- /.container-fluid -->

        </div>

        <!-- End of Main Content -->

        <!-- Footer -->

	<%@include file="include/footer.jsp" %>

        <!-- End of Footer -->

      </div>

      <!-- End of Content Wrapper -->

    </div>

    <!-- End of Page Wrapper -->

 

    

    <!-- End of Page Wrapper -->

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
   <!--  <script src="https://code.jquery.com/jquery-3.5.1.js"
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="crossorigin="anonymous">
		</script> -->

</body>

</html>

