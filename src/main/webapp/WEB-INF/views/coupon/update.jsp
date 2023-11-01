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

<title>쿠폰을 수정합니다.</title>
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
								aria-current="page">쿠폰을 수정합니다.</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="container">
			<!-- 여기에 내용을 작성 -->
			    <section class="content container-fluid">
				<div class="box-header">
				</div>
				<form action="update" id="update" method="post">
				<div class="box-body">
					<div class="form-group">
						<label>쿠폰코드</label> <input type="text"
						class="form-control" name="cp_code" value="${coupon.cp_code }" readonly>
					</div>
					
					<div class="form-group">
						<label>쿠폰이름</label> <input type="text"
						class="form-control" value="${coupon.cp_name}" name="cp_name" >
					</div>
		
					<div class="form-group">
						<label>상세내용</label> <input type="text"
							name="cp_content" value="${coupon.cp_content}" class="form-control">
					</div>
					
					<div class="form-group">
					<label>수량</label> <input type="text"
						name="cp_amount" value="${coupon.cp_amount}" class="form-control">
					</div>
					
					<div class="form-group">
					<label>할인률</label> <input type="text"
						name="cp_sale" value="${coupon.cp_sale}" class="form-control">
					</div>
					
					<div class="form-group">
					<label>사용시작일</label> <input type="text"
						name="cp_start_date" value="${coupon.cp_start_date}" class="form-control">
					</div>
					
					<div class="form-group">
					<label>사용종료일</label> <input type="text"
						name="cp_end_date" value="${coupon.cp_end_date}" class="form-control">
					</div>
					
				</div>

				<div class="box-footer">
				<input class="btn btn-primary" type="button" value="수정완료" id="primary"/>
				
				</div>
				<script>
					$("#primary").click(function(){
						//location.href="/page/coupon";
						$("#update").submit();
					});
				</script>
				</form>
		
   				 </section>
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