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
<%@ include file="../include/head.jsp"%>

<title>쿠폰 상세조회</title>
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
					<h1 class="heading" data-aos="fade-up">매인템플렛</h1>

					<nav aria-label="breadcrumb" data-aos="fade-up"
						data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
							<li class="breadcrumb-item"><a href="${contextPath }">Home</a></li>
							<li class="breadcrumb-item active text-white-50"
								aria-current="page">쿠폰 상세조회</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
		<strong><h3>▶ ${coupon.cp_code} 대한 상세정보 </h3></strong><br>
      	<table class="table">
      		<tr>
      			<td>쿠폰코드</td>
				<td>쿠폰이름</td>
				<td>쿠폰내용</td>
				<td>수량</td>
				<td>할인율</td>
				<td>사용시작일</td>
				<td>사용마감일</td>
      		</tr>

      		<tr>
      			<td>${coupon.cp_code}</td>
				<td>${coupon.cp_name}</td>
				<td>${coupon.cp_content}</td>
				<td>${coupon.cp_amount}</td>
				<td>${coupon.cp_sale}</td>
				<td>${coupon.cp_start_date}</td>
				<td>${coupon.cp_end_date}</td>
      		</tr>
      	</table>
      	
		<div colspan="5" align="center">
			<button class="btn btn-primary">목록</button>	
		<input class="btn btn-warning" type="button" value="수정" id="writing"/>
		<input class="btn btn-danger" type="button" value="삭제" id="danger">
		</div>
    <script>
		//목록 버튼을 눌렀을 때 처리
		$(".btn-primary").click(function(){
			location.href="/page/coupon";
		});
		//수정 버튼을 눌렀을 때 처리
		$("#writing").click(function(){
			location.href="/page/update?cp_code="+"${coupon.cp_code}";
		});
		//삭제 버튼을 눌렀을 때 처리
		$("#danger").click(function(){
			location.href="/page/delete?cp_code="+"${coupon.cp_code}"; 
		});
	</script>
	
	


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