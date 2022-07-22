<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>전체 게시글 조회</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
<%--   <link rel="stylesheet" href="${ pageContext.request.contextPath }/node_modules/jqvmap/dist/jqvmap.min.css" /> --%>
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${ pageContext.request.contextPath }/images/favicon.png" />
  <script src="${ pageContext.request.contextPath }/resource/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#addBtn').click(function() {
			location.href = '${ pageContext.request.contextPath }/board/writeForm.do';
		});
	});
	
	function checkLogin(boardNo){
		location.href = 'detail.do?no=' + boardNo;
/* 		<c:choose>
			<c:when test="${ empty user }">
				if(confirm('로그인 후 사용가능합니다\n로그인페이지로 이동할까요?')){
					location.href = '${ pageContext.request.contextPath }/login/login.do';
				}
			</c:when>
			<c:otherwise>
				location.href = 'detail.do?no=' + boardNo;
			</c:otherwise>
		</c:choose> */
	}
</script>
</head>

<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
   	<%@ include file="/jsp/include/navbar.jsp" %>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_sidebar.html -->
      <%@ include file="/jsp/include/sidebar.jsp" %>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="page-header">
            <h3 class="page-title">
              Board List
            </h3>
          </div>
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <table class="table table-striped">
                    <thead>
                      <tr>
                        <th>
                          NO
                        </th>
                        <th>
                          Title
                        </th>
                        <th>
                          Writer
                        </th>
                        <th>
                          View
                        </th>
                        <th>
                          Register Date
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${ list }" var="board" varStatus="status">
                    		<tr>
								<td>${ board.no }</td>
								<td>
									<%-- <a href="javascript:checkLogin(${ board.no })"> --%>
									<a href="${ pageContext.request.contextPath }/board/detail.do?no=${ board.no }">
										<c:out value="${ board.title }" />
									</a>
								</td>
								<td><c:out value="${ board.writer }" /></td>
								<td><c:out value="${ board.viewCnt }" /></td>
								<td><c:out value="${ board.regDate }" /></td>
							</tr>
                    	</c:forEach>
                    </tbody>
                  </table>
                  <%-- <c:if test="${ not empty user }"> --%>
					<button id="addBtn" class="btn btn-gradient-primary mr-2">New</button>
				  <%-- </c:if> --%>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2017 <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap Dash</a>. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="mdi mdi-heart text-danger"></i></span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="${ pageContext.request.contextPath }/vendors/js/vendor.bundle.base.js"></script>
  <script src="${ pageContext.request.contextPath }/vendors/js/vendor.bundle.addons.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="${ pageContext.request.contextPath }/js/off-canvas.js"></script>
  <script src="${ pageContext.request.contextPath }/js/misc.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
</body>

</html>
