<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
  <ul class="nav">
	  <c:if test="${ not empty user }">
	    <li class="nav-item nav-profile">
	      <a href="#" class="nav-link">
	        <div class="nav-profile-image">
	          <img src="${ pageContext.request.contextPath }/images/faces/face1.jpg" alt="profile">
	          <span class="login-status online"></span> <!--change to offline or busy as needed-->              
	        </div>
	        <div class="nav-profile-text d-flex flex-column">
	          <span class="font-weight-bold mb-2">${ user.name }</span>
	          <span class="text-secondary text-small">Project Manager</span>
	        </div>
	        <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
	      </a>
	    </li>
    </c:if>
    <li class="nav-item">
      <a class="nav-link" href="${ pageContext.request.contextPath }/index.jsp">
        <span class="menu-title">Home</span>
        <i class="mdi mdi-home menu-icon"></i>
      </a>
    </li>
    <c:if test="${ user.type eq 'S' }">
	    <li class="nav-item">
	      <a class="nav-link" href="${ pageContext.request.contextPath }/member/list.do">
	        <span class="menu-title">회원관리</span>
	        <i class="mdi mdi-contacts menu-icon"></i>
	      </a>
	    </li>
    </c:if>
    <li class="nav-item">
      <a class="nav-link" href="${ pageContext.request.contextPath }/board/list.do">
        <span class="menu-title">게시판</span>
        <i class="mdi mdi-bulletin-board menu-icon"></i>
      </a>
    </li>
    <c:if test="${ empty user }">
	    <li class="nav-item">
	      <a class="nav-link" href="${ pageContext.request.contextPath }/member/logonForm.do">
	        <span class="menu-title">회원가입</span>
	        <i class="mdi mdi-format-list-bulleted menu-icon"></i>
	      </a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="${ pageContext.request.contextPath }/login/login.do">
	        <span class="menu-title">로그인</span>
	        <i class="mdi mdi-chart-bar menu-icon"></i>
	      </a>
	    </li>
    </c:if>
  </ul>
</nav>