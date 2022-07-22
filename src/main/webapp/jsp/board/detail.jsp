<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Form</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${ pageContext.request.contextPath }/images/favicon.png" />
<script>
	function doAction(type) {
		switch (type) {
		case 'U':
			location.href = "${ pageContext.request.contextPath }/board/update.do?no=${ param.no }";
			break;
		case 'D':
			if (confirm('삭제하시겠습니까?')) {
				location.href = "${ pageContext.request.contextPath }/board/delete.do?no=${ param.no }";
			}
			break;
		case 'L':
			location.href = "${ pageContext.request.contextPath }/board/list.do";
			break;
		}
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
              Form
            </h3>
          </div>
          <div class="row">
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <form class="forms-sample">
                  	<div class="form-group">
                      <label for="exampleInpuNo">No</label>
                      <input type="text" value="${ board.no }" class="form-control" id="exampleInputNo" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputTitle">Title</label>
                      <input type="text" value="${ board.title }" class="form-control" id="exampleInputTitle" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputName">Writer</label>
                      <input type="text" value="${ board.writer }" class="form-control" id="exampleInputName1" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleContent">Content</label>
                      <textarea class="form-control" id="exampleContent" rows="25" readonly>${ board.content }</textarea>
                    </div>
                    <div class="form-group">
                      <label>Files</label>
                      <c:forEach items="${ fileList }" var="fileVO">
	                      <div class="input-group col-xs-12">
	                        <span class="input-group-append">
								<%-- <a href="${ pageContext.request.contextPath }/upload/${ fileVO.fileSaveName }"> --%>
								<a href="downloadFile.jsp?fileSaveName=aaa">
								${ fileVO.fileOriName }
								</a>
								(${ fileVO.fileSize })<br>
							</span>
						  </div>
					  </c:forEach>
                    </div>
                    <button type="submit" onclick="doAction('U')" class="btn btn-gradient-primary mr-2">Modify</button>
                    <button type="button" onclick="doAction('D')" class="btn btn-light">Delete</button>
                    <button type="button" onclick="doAction('L')" class="btn btn-light">Back to List</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        <%@ include file="/jsp/include/footer.jsp" %>
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
  <!-- inject:js -->
  <script src="${ pageContext.request.contextPath }/js/off-canvas.js"></script>
  <script src="${ pageContext.request.contextPath }/js/misc.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${ pageContext.request.contextPath }/js/file-upload.js"></script>
  <!-- End custom js for this page-->
</body>

</html>
