<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ page session="true" %>
<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="../include/head.jsp" %>

    <title>
      Property &mdash; Free Bootstrap 5 Website Template by Untree.co
    </title>
<style type="text/css">
input[type=file]::file-selector-button {
  width: 150px;
  height: 30px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  cursor: pointer;
  &:hover {
    background: rgb(77,77,77);
    color: #fff;
  }
}
}
</style>
  </head>
  <body>
    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close">
          <span class="icofont-close js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>

	<!-- 상단에 네비게이션 -->
    <%@ include file="../include/top_menu.jsp" %>
	
	
	

    <div
      class="hero page-inner overlay"
      style="background-image: url('${contextPath}/resources/images/hero_bg_1.jpg')"
    >
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">비밀번호수정</h1>

            <nav
              aria-label="breadcrumb"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <ol class="breadcrumb text-center justify-content-center">
                <li class="breadcrumb-item"><a href="${contextPath }">Home</a></li>
                <li
                  class="breadcrumb-item active text-white-50"
                  aria-current="page"
                >
                  비밀번호수정
                </li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </div>
	
    <div class="section">
      <div class="container">
      	<!-- 여기에 내용을 작성 -->
      	<div>
      		<form action="editpassword" method="post" id="data">
      		<table class="table table-borderless" style="width: 60%; margin: auto; ">
      			<tr>
      				<th>비밀번호 : <input class="form-control" type="password" id="pw" name="pw"></th>
      			</tr>
      		</table>
      		<button style="margin-left: 65%;" class="btn btn-outline-success" type="button" id="btn">비밀번호 수정완료</button>
      	</form>
      	</div>
      </div>
    </div>
    <script>
    	$("#btn").click(function(){
    		checkPassword();
    		
    	});
    	function checkPassword() {
    		var pw = $("#pw").val();
	    	var passwordRules = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,16}$/;
	    	if(!(passwordRules.test(pw))) {
	    		alert("숫자와 영문자,특수문자 조합으로 8~16자리를 사용해야 합니다.");
	    		
	    		return false;
	    	}
	    		$("#data").submit();

    		
    	}

    	console.log(passwordRules .test(password));
    </script>

	
	<%@ include file="../include/footer.jsp" %>
    <!-- /.site-footer -->

    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
      <div class="spinner-border" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
    </div>

	<!-- 플러그인 -->
    <%@ include file="../include/plugin.jsp" %>
  </body>
</html>
