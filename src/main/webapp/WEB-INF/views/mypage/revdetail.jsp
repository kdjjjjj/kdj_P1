<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 1px 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 14px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.button1 {
  background-color: white;
  color: black;
  border: 2px solid #555555;
}

.button1:hover {
  background-color: #555555;
  color: white;
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
            <h1 class="heading" data-aos="fade-up">예약 상세조회</h1>

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
                  Properties
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
      	<jsp:useBean id="now" class="java.util.Date" />
      	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
      		<table class="table table-hover">
      		<thead class="thead-dark">
      			<tr>
      				<th>캠핑장이름</th>
      				<th>데크</th>
      				<th>최대인원</th>
      				<th>캠핑장가격</th>
      				<c:if test="${today < revdetail2.rev_start_date }">
      				<th>예약취소</th>
      				</c:if>
      			</tr>
      			</thead>
      			<tr>
      				<td>${revdetail2.cam_name }</td>
      				<td>${revdetail2.cri_area_code }</td>
      				<td>${revdetail2.cri_max }</td>
      				<td>${revdetail2.cri_price }</td>
      				<form action="revdelete" method="post" id="sub">
      				<c:if test="${today < revdetail2.rev_start_date }">
      				<td><input class="button button1" type="button" name="check" id="box" value="예약취소"></td>
      				<td><input type="hidden" name="rev_code" value="${revdetail2.rev_code }"></td>
      				</c:if>
      				</form>
      			</tr>
      		</table>
      		<tr>
      			<th><button id="btn22" onclick="location.href='review/reviewInsert?rev_code=${revdetail2.rev_code }'">리뷰쓰기</button></th>
      		</tr>
      	</div>
      </div>
    </div>
    <script>
    	$("#box").click(function(){
    		$("#sub").submit();
    	});
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
