<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>회원 상세 정보</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${ pageContext.request.contextPath }/images/favicon.png" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function onAction(type){
		switch(type){
		case 'U':
			location.href="update.jsp?id=${ member.id }";
			break;
		case 'D':
			location.href="delete.jsp?id=${ member.id }";
			break;
		case 'L':
			location.href="list.jsp";
			break;
		}
	}
</script>
</head>

<body>
  <div class="container-scroller">
    <!-- partial:${ pageContext.request.contextPath }/partials/_navbar.html -->
    <%@ include file="/jsp/include/navbar.jsp" %>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:${ pageContext.request.contextPath }/partials/_sidebar.html -->
      <%@ include file="/jsp/include/sidebar.jsp" %>
      <!-- partial -->
      <div class="main-panel">        
        <div class="content-wrapper">
          <div class="page-header">
            <h3 class="page-title">
              Member Detail Info
            </h3>
          </div>
          <div class="row">
            <div class="col-md-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <form action="#" method="post" name="detailInfo" class="forms-sample">
                    <div class="form-group row">
                      <label for="exampleInputID" class="col-sm-3 col-form-label">ID</label>
                      <div class="col-sm-9">
                        <input type="text" value="${ member.id }" class="form-control" id="exampleInputID" readonly>
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputName" class="col-sm-3 col-form-label">Name</label>
                      <div class="col-sm-9">
                        <input type="text" value="<c:out value="${ member.name }" />" class="form-control" id="exampleInputName" readonly>
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputPassword" class="col-sm-3 col-form-label">Password</label>
                      <div class="col-sm-9">
                        <input type="text" value="<c:out value="${ member.password }" />" class="form-control" id="exampleInputPassword" readonly>
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputEmail" class="col-sm-3 col-form-label">Email</label>
                      <div class="col-sm-9">
                        <input type="email" value="<c:out value="${ member.emailId }@${ member.emailDomain }" />" class="form-control" id="exampleInputEmail" readonly>
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputTel" class="col-sm-3 col-form-label">Tel</label>
                      <div class="col-sm-9">
                        <input type="text" value="${ member.tel1 }-${ member.tel2 }-${ member.tel3 }" class="form-control" id="exampleInputTel" readonly>
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputAddress" class="col-sm-3 col-form-label">Address</label>
                      <div class="col-sm-9">
                        <input type="text" value="<c:out value="${ member.basicAddr } ${ member.detailAddr } ${ member.post }" />" class="form-control" id="exampleInputAddress" readonly>
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputType" class="col-sm-3 col-form-label">Type</label>
                      <div class="col-sm-9">
                        <input type="text" value="${ member.type }" class="form-control" id="exampleInputType" readonly>
                      </div>
                    </div>
                    <div class="form-group row">
                      <label for="exampleInputResgisterDate" class="col-sm-3 col-form-label">Register Date</label>
                      <div class="col-sm-9">
                        <input type="text" value="${ member.regDate }" class="form-control" id="exampleInputResgisterDate" readonly>
                      </div>
                    </div>
                    <button type="submit" class="btn btn-gradient-primary mr-2">Modify</button>
                    <button type="button" onclick="location.href='list.jsp'" class="btn btn-light">Back To List</button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:${ pageContext.request.contextPath }/partials/_footer.html -->
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
  <!-- inject:js -->
  <script src="${ pageContext.request.contextPath }/js/off-canvas.js"></script>
  <script src="${ pageContext.request.contextPath }/js/misc.js"></script>
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="${ pageContext.request.contextPath }/js/file-upload.js"></script>
  <!-- End custom js for this page-->
</body>

</html>
