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
<style>
ul li{
	display: inline-block;
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
            <h1 class="heading" data-aos="fade-up">내 쿠폰함</h1>

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
                  내 쿠폰목록
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
      		<table class="table table-hover">
      		<thead class="thead-dark">
      			<tr>
      				<th>쿠폰이름</th>
      				<th>사용여부</th>
      				<th>쿠폰발급일</th>
      				<th>쿠폰만료일</th>
      			</tr>
      			</thead>
      			<c:forEach items="${couponlist }" var="list">
      			<tr>
      				<td>${list.cp_name }</td>
      				<td>${list.use_coupon }</td>
      				<td>${list.cp_start_date }</td>
      				<td>${list.cp_end_date }</td>
      			</tr>
      			</c:forEach>
      		</table>
      	</div>
      </div>
    </div>
    <div class="container" style="margin-left: 40%">
		<ul class="pagination">
			<c:if test="${pageMaker.prev && pageMaker.startPage > 0 }">
				<li class="page-item"><a class="page-link" href="couponlistPage?page=${pageMaker.startPage - 1 }">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li class="page-item"<c:out value="${pageMaker.cri.page == idx?'class=active':'' }"/>>
				<a class="page-link" href="couponlistPage?page=${idx }">${idx }</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li class="page-item"><a class="page-link" href="couponlistPage?page=${pageMaker.endPage + 1 }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	
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
