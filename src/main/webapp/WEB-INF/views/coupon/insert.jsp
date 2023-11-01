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

<title>쿠폰을 추가합니다.</title>
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
								aria-current="page">쿠폰을 추가합니다.</li>
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
				<form id="insert" method="post">
				<div class="box-body">
					<div class="form-group">
						<label>쿠폰코드</label> <input type="text"
						class="form-control" id="cp_code" name="cp_code">
					</div>
					
					<div class="form-group">
						<label>쿠폰이름</label> <input type="text"
						class="form-control" id="cp_name" name="cp_name" >
					</div>
		
					<div class="form-group">
						<label>상세내용</label> <input type="text"
							name="cp_content" id="cp_content" class="form-control">
					</div>
					
					<div class="form-group">
					<label>수량</label> <input type="text"
						name="cp_amount" id="cp_amount" class="form-control">
					</div>
					
					<div class="form-group">
					<label>할인률</label> <input type="text"
						name="cp_sale" id="cp_sale" class="form-control">
					</div>
					
					<div class="form-group">
					<label>사용시작일</label> <input type="text"
						name="cp_start_date" id="cp_start_date" class="form-control">
					</div>
					
					<div class="form-group">
					<label>사용종료일</label> <input type="text"
						name="cp_end_date" id="cp_end_date" class="form-control">
					</div>
					
				</div>

				<div class="box-footer">
				<input class="btn btn-add" type="button" value="추가완료" id="add"/>
				
				</div>
				<script>
					$("#add").click(function(){
						//location.href="/page/coupon?cp_code";
						//alert("test");
						var sbm = $("#insert");
						if($("#cp_code").val() == "" || $("#cp_code").val() == null) {
							alert("쿠폰코드를 입력해주세요");
						}else if($("#cp_name").val() == "" || $("#cp_name").val() == null) {
							alert("쿠폰이름을 입력해주세요");
						}else if ($("#cp_content").val() == "" || $("#cp_content").val() == null) {
							alert("상세내용을 입력해주세요");
						}else if ($("#cp_amount").val() == "" || $("#cp_amount").val() == null) {
							alert("수량을 입력해주세요");
						}else if ($("#cp_sale").val() == "" || $("#cp_sale").val() == null) {
							alert("할인률을 입력해주세요");
						}else if ($("#cp_start_date").val() == "" || $("#cp_start_date").val() == null) {
							alert("사용시작일을 입력해주세요");
						}else if ($("#cp_end_date").val() == "" || $("#cp_end_date").val() == null){
							alert("사용종료일을 입력해주세요");
						}else {
							sbm.submit();
						}
					});
				</script>
				</form>
		
   			</section>
		</div>
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