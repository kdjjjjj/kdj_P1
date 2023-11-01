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
            <h1 class="heading" data-aos="fade-up">내 예약조회</h1>

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
                  내 예약목록
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
      				<th>예약코드</th>
      				<th>예약시작일</th>
      				<th>예약종료일</th>
      			</tr>
      		</thead>
      			<c:if test="${revlist == null}">
      			<tr>
      				<td colspan="4">조회된 데이터가 없습니다.</td>
      			</tr>
      			</c:if>
      			<c:forEach items="${revlist }" var="list">
      			<tr>
      				<td><a href="revdetail?rev_code=${list.rev_code }" >${list.rev_code }</a></td>
      				<td>${list.rev_start_date }</td>
      				<td>${list.rev_finish_date }</td>
      				
      			</tr>
      			</c:forEach>
      		</table>
      	</div>
      </div>
    </div>
    <div class="container" style="margin-left: 40%">
		<ul class="pagination">
			<c:if test="${pageMaker.prev && pageMaker.startPage > 0 }">
				<li class="page-item"><a class="page-link" href="revlistPage?page=${pageMaker.startPage - 1 }">&laquo;</a></li>
			</c:if>
			
			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li class="page-item"<c:out value="${pageMaker.cri.page == idx?' class=active':'' }"/>>
				<a class="page-link" href="revlistPage?page=${idx }">${idx }</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li class="page-item "><a class="page-link" href="revlistPage?page=${pageMaker.endPage + 1 }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	<div class="form-group">
		<form action="revsearch" id="search" method="post">
		<table class="table table-borderless" style="width: 15%; margin-left: 40%;">
			<tr>
				<th><input style="height: 10%" type="text" class="form-control" name="revcode" id="revcode"></th>
				<td><input type="button" id="searchBtn" value="검색"></td>
			</tr>
		</table>
		</form>
	</div>
	<script>
		$("#searchBtn").click(function(){
			if($("#revcode").val() == "") {
				alert("검색어를 입력해주세요.");
				return false;
			}
			$("#search").submit();
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
