<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>회원가입</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="${ pageContext.request.contextPath }/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="${ pageContext.request.contextPath }/images/favicon.png" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function (){
		$('#listBtn').click(function (){
			location.href = 'list.jsp';
		})
	})
	
	function checkForm(){
		let f = document.logonForm;
		
		if(f.id.value === ''){
			alert("아이디를 입력하세요");
			f.id.focus();
			return false;
		}
		
		if(f.name.value === ''){
			alert("이름을 입력하세요");
			f.name.focus();
			return false;
		}
		
		if(f.password.value === ''){
			alert("비밀번호를 입력하세요");
			f.password.focus();
			return false;
		}
		
		if(!f.email.value.includes('@')){
			alert("이메일 형식이 잘못되었습니다.");
			f.email.focus();
			return false;
		}
		
		let regex = /\d{3}-\d{4}-\d{4}/;
		if(!regex.test(f.tel.value)){
			alert("전화번호 형식이 잘못되었습니다.");
			f.tel.focus();
			return false;
		}
		
		return true;
	}
</script>
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth">
        <div class="row w-100">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left p-5">
              <div class="brand-logo">
                <img src="${ pageContext.request.contextPath }/images/logo.svg">
              </div>
              <h4>New here?</h4>
              <h6 class="font-weight-light">Signing up is easy. It only takes a few steps</h6>
              <form action="logon.jsp" method="post" name="logonForm" onsubmit="return checkForm()" class="pt-3">
                <div class="form-group">
                  <input type="text" name="id" class="form-control form-control-lg" id="exampleInputID1" placeholder="Username">
                </div>
                <div class="form-group">
                  <input type="text" name="name" class="form-control form-control-lg" id="exampleInputUsername1" placeholder="Username">
                </div>
                <div class="form-group">
                  <input type="password" name="password" class="form-control form-control-lg" id="exampleInputPassword1" placeholder="Password">
                </div>
                <div class="form-group">
                  <input type="text" name="email" class="form-control form-control-lg" id="exampleInputEmail1" placeholder="example@example.com">
                </div>
                <div class="form-group">
                  <input type="tel" name="tel" class="form-control form-control-lg" id="exampleInputTel1" placeholder="010-0000-0000">
                </div>
                <div class="form-group">
                  <input type="text" name="post" class="form-control form-control-lg" id="exampleInputPost1" placeholder="Post">
                  <input type="text" name="basic_addr" class="form-control form-control-lg" id="exampleInputAddr1" placeholder="Basic Address">
                  <input type="text" name="detail_addr" class="form-control form-control-lg" id="exampleInputAddr2" placeholder="Detail Address">
                </div>
                <div class="form-group">
                  <select name="type" class="form-control form-control-lg" id="exampleFormControlSelect2">
					<option value="U">User</option>
					<option value="S">Admin</option>
                  </select>
                </div>
                <div class="mt-3">
                  <input type="submit" value="SIGN UP" class="btn btn-block btn-gradient-primary btn-lg font-weight-medium auth-form-btn">
                </div>
                <div class="text-center mt-4 font-weight-light">
                  Already have an account? <a href="../login/login.jsp" class="text-primary">Login</a>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
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
</body>

</html>
