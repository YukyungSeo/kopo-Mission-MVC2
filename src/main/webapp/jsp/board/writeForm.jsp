<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
  <!-- plugin css for this page -->
  <link rel="stylesheet" href="../../node_modules/jqvmap/dist/jqvmap.min.css" />
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${ pageContext.request.contextPath }/images/favicon.png" />
  <script src="${ pageContext.request.contextPath }/resource/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#listBtn').click(function() {
			location.href = 'list.jsp';
		});
	});

	function checkForm() {
		let f = document.writeForm;

		if (f.title.value === '') {
			alert('제목을 입력하세요');
			f.title.focus();
			return false;
		}

		if (f.writer.value === '') {
			alert('작성자를 입력하세요');
			f.writer.focus();
			return false;
		}

		if (f.content.value === '') {
			alert('작성자를 입력하세요');
			f.content.focus();
			return false;
		}

		//첨부파일 확장자 체크
		if (checkExt(f.attachfile1))
			return false;

		if (checkExt(f.attachfile2))
			return false;

		return true;
	}

	function checkExt(obj) {
		let forbidName = [ 'exe', 'java', 'class', 'js', 'jsp' ];
		let fileName = obj.value;
		let ext = fileName.substring(obj.value.lastIndexOf('.') + 1);

		for (let i = 0; i < forbidName.length; i++) {
			if (forbidName[i] === ext) {
				alert('[' + ext + '] 확장자는 파일 업로드 정책에 위배됩니다');
				return true;
			}
		}
		return false;
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
                  <form action="${ pageContext.request.contextPath }/board/write.do" method="post" name="writeForm" onsubmit="return checkForm()" class="forms-sample">
                    <div class="form-group">
                      <label for="exampleInputTitle">Title</label>
                      <input type="text" name="title" class="form-control" id="exampleInputTitle">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputName">Writer</label>
                      <input type="text" name="writer" value="${ user.name }" class="form-control" id="exampleInputName1">
                    </div>
                    <div class="form-group">
                      <label for="exampleContent">Content</label>
                      <textarea class="form-control" name="content" id="exampleContent" rows="25"></textarea>
                    </div>
                    <div class="form-group">
                      <label>File upload1</label>
                      <input type="file" id="file-upload-default1" name="attachfile1" class="file-upload-default">
                      <div class="input-group col-xs-12">
                        <input type="text" id="form-control1" class="form-control file-upload-info" disabled placeholder="Upload Image">
                        <span class="input-group-append">
                          <button id="file-upload-browse1" class="file-upload-browse btn btn-gradient-primary" type="button">Upload</button>
                        </span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label>File upload2</label>
                      <input type="file" id="file-upload-default2" name="attachfile2" class="file-upload-default">
                      <div class="input-group col-xs-12">
                        <input type="text" id="form-control2" class="form-control file-upload-info" disabled placeholder="Upload Image">
                        <span class="input-group-append">
                          <button id="file-upload-browse2" class="file-upload-browse btn btn-gradient-primary" type="button">Upload</button>
                        </span>
                      </div>
                    </div>
                    <button type="submit" class="btn btn-gradient-primary mr-2">Submit</button>
                    <button type="button" onclick="location.href='list.jsp'" class="btn btn-light">Cancel</button>
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