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
<%@ include file="../include/plugin.jsp"%>

<title>Property &mdash; Free Bootstrap 5 Website Template by
	Untree.co</title>
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
					<h1 class="heading" data-aos="fade-up">답변상세보기</h1>

					<nav aria-label="breadcrumb" data-aos="fade-up"
						data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active text-white-50"
								aria-current="page">Properties</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="container">
			<!-- 여기에 내용을 작성 -->
			<!-- Main content -->
			<section class="content container-fluid">
				<div class="box-head with-notice"></div>
				<div class="box">
					<div class="box-head">
						<h3 class="box-title">답변상세보기</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<labal>답변번호</labal>
							<input type="text" name="rp_code" class="form-control"
								value="${onetoone_reply.rp_code }" readonly="readonly" />
						</div>
						<div class="form-group">
							<labal>글코드</labal>
							<input type="text" name="o_code" class="form-control"
								value="${onetoone_reply.o_code }" readonly="readonly" />
						</div>
						<div class="form-group">
							<labal>회원 아이디</labal>
							<input type="text" name="id" class="form-control"
								value="${onetoone_reply.id }" readonly="readonly" />
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="rp_content" rows="5" readonly="readonly"
								class="form-control">${onetoone_reply.rp_content}</textarea>
						</div>
						<div class="form-group">
							<label>작성일</label> <input type="text" name="rp_w_date"
								class="form-control" value="${onetoone_reply.rp_w_date}"
								readonly="readonly" />
						</div>
					</div>
				</div>
		</div>


		<c:choose>

			<c:when test="${admin == null }">
					관리자만 답변 가능
			</c:when>
			<c:otherwise>
					관리자님 환영합니다
				<a href="update2?rp_code=${onetoone_reply.rp_code }" role="button"
					class="btn btnoutline-info">글 수정</a>
				<a href="delete2?rp_code=${onetoone_reply.rp_code }" role="button"
					class="btn btnoutline-info">글 삭제</a>
			</c:otherwise>
		</c:choose>



		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

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

</body>
</html>
