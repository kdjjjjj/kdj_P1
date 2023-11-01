<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style>
ul li{
	display: inline-block;
}
</style>
<%@ include file="../include/head.jsp"%>

<title>리뷰</title>
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
	<%@ include file="../include/top_menu.jsp"%>

	<div class="hero page-inner overlay"
		style="background-image: url('${contextPath}/resources/images/hero_bg_1.jpg')">
		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up">캠핑장 리뷰</h1>

					<nav aria-label="breadcrumb" data-aos="fade-up"
						data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
							<li class="breadcrumb-item"><a href="${contextPath }">Home</a></li>
							<li class="breadcrumb-item active text-white-50"
								aria-current="page">리뷰</li>
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
				<form id="reviewform">
					<div>${msg}</div>
					<strong>캠핑장 사용후기 입니다.</strong><br>
					<table class="table">
						<tr>
							<td>리뷰글번호</td>
							<td>아이디</td>
							<td>작성날짜</td>
							<td>내용</td>
							<td>별점</td>
							<td>신고수</td>
						</tr>

						<c:forEach var="review" items="${plist }">
							<tr>
								<td>${review.r_code}</td>
								<td>${review.id}</td>
								<td>${review.r_w_date}</td>
								<c:choose>
									<c:when test="${review.r_lockpwd == 1 && admin.nick != null}">
										<td>
											<a style="color: red" href="reviewDetail?r_code=${review.r_code}&rev_code=${review.rev_code}">
												<b>이 글은 잠긴글입니다.</b>
											</a>
										</td>
									</c:when>
									<c:when test="${review.r_lockpwd == 1 }">
										<td style="color: red;"><b>이 글은 잠긴글입니다.</b></td>
									</c:when>
									<c:otherwise>
										<td><a
										href="reviewDetail?r_code=${review.r_code}&rev_code=${review.rev_code}">
										<b>${review.r_content}</b></a></td>
									</c:otherwise>
								</c:choose>
								<td>${review.r_star}</td>
								<td>${review.r_declaration}</td>
							</tr>
						</c:forEach>
					
						<tr>
							<td colspan="5" align="center"><input
								class="btn btn-success" type="button" value="홈으로" id="main" /></td>
						</tr>
					</table>
					
						<div class="container" style="margin-left: 45%" >
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="page-item"><a class="page-link" href="previewlistPage?page=${pageMaker.startPage-1 }">&laquo;</a></li>
								</c:if>
								
								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li class="page-item"
										<c:out value="${pageMaker.cri.page==idx?'class=active':'' }"/>>
										<a class="page-link"  href="previewlistPage?page=${idx}">${idx }</a>
									</li>
								</c:forEach>
								
								<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
									<li class="page-item"><a class="page-link" href="previewlistPage?page=${pageMaker.endPage+1 }">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					
					
				</form>
			</div>
			<script>
				$("#main").click(function() {
					location.href = "${contextPath }";
				});
			</script>
		</div>


		<%@ include file="../include/footer.jsp"%>
		<!-- /.site-footer -->

		<!-- Preloader -->
		<div id="overlayer"></div>
		<div class="loader">
			<div class="spinner-border" role="status">
				<span class="visually-hidden">Loading...</span>
			</div>
		</div>

		<!-- 플러그인 -->
		<%@ include file="../include/plugin.jsp"%>
</body>
</html>