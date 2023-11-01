<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<!DOCTYPE html>
<html lang="ko">
  <head>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>

    <title>
     관리자 로그인
    </title>
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
    <%@ include file="/WEB-INF/views/include/top_menu.jsp" %>
	
	
	

    <div
      class="hero page-inner overlay"
      style="background-image: url('${contextPath}/resources/images/hero_bg_1.jpg')"
    >
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">관리자 로그인</h1>

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
                  관리자 로그인
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
      		<form id="loginform" method="post">
	      		<table class="table table-borderless" style="width: 30%; margin: auto; ">
	      			<tr>
	      				<td>
	      					<input class="form-control" type="text" id="id" name="id" placeholder="아이디">
	      				</td>
	      			</tr>
	      			<tr>
	      				<td>
	      					<input class="form-control" type="password" id="pw" name="pw" placeholder="비밀번호">
	      				</td>
	      			</tr>
	      			<tr>
	      				<td style="color: red">
	      					${msg }
	      				</td>
	      			</tr>
	      			<tr>
	      				<td>
	      					<input style="width: 100%" class="btn btn-success" type="button" value="로그인" id="login">
	      				</td>
	      			</tr>
	      		</table>
      		</form>
      		<script type="text/javascript">
      			$("#login").click(function(){
      				if($("#id").val()== ""){
      					alert("아이디를 입력해주세요");
      				}else if($("#pw").val() == ""){
      					alert("비밀번호를 입력해주세요");
      				}else{
      					$("#loginform").submit();
      				}
      			});
      		</script>
      	</div>
      </div>
    </div>

	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <!-- /.site-footer -->

    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
      <div class="spinner-border" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
    </div>

	<!-- 플러그인 -->
    <%@ include file="/WEB-INF/views/include/plugin.jsp" %>
  </body>
</html>
