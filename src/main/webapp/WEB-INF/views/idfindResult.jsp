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
    <%@ include file="include/head.jsp" %>

    <title>
      아아디 찾기
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
    <%@ include file="include/top_menu.jsp" %>
	
	
	

    <div
      class="hero page-inner overlay"
      style="background-image: url('${contextPath}/resources/images/hero_bg_1.jpg')"
    >
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">아이디 찾기 결과</h1>

            <nav
              aria-label="breadcrumb"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <ol class="breadcrumb text-center justify-content-center">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li
                  class="breadcrumb-item active text-white-50"
                  aria-current="page"
                >
                  아이디 찾기 결과
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
	      	<table class="table table-borderless" style="width: 40%; margin: auto; ">
	      		<c:choose>
	      			<c:when test="${result == null }">
	      				<tr>
	      					<td>
	      					 	<h3 style="color: gray;">입력하신 정보의 <br> 아이디가 존재하지 않습니다.</h3>
	      					</tr>
	      					<tr>
	      					 	<td><input class="btn btn-outline-success" type="button" id="idfind" value="아이디 찾기"></td>
	      					 	<td><input class="btn btn-outline-success" type="button" id="back" value="홈으로">	</td>
	      					</tr>
	      					 </c:when>
	      					 <c:otherwise>
	      					 <tr>
	      						<td>
	      					 	<h3 style="color: green;">회원님의 아이디는<br>${result } 입니다.</h3>
	      					 	</td>
	      					</tr>
	      					<tr>
	      					 	<td><input class="btn btn-outline-success" type="button" id="pwfind" value="비밀번호 찾기"></td>
	      					 	<td><input class="btn btn-outline-success" type="button" id="back" value="홈으로">	</td>
	      					 </tr>
	      				 </c:otherwise>
	      			</c:choose>
	      	</table>
      	</div>
      </div>
    </div>
    
    <script type="text/javascript">
    	$("#back").click(function(){
    		location.href="${contextPath}";
    	});
		$("#pwfind").click(function(){
			location.href="${contextPath}/serachid";
		});
		$("#idfind").click(function(){
			location.href="${contextPath}/idfind";
		});
    </script>
    
	<%@ include file="include/footer.jsp" %>
    <!-- /.site-footer -->

    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
      <div class="spinner-border" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
    </div>

	<!-- 플러그인 -->
    <%@ include file="include/plugin.jsp" %>
  </body>
</html>
