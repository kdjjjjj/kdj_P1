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

<title>리뷰 작성하기</title>
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
								aria-current="page">리뷰작성!!!!</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<section class="content-header">
		<h1>
			리뷰 글작성
		</h1>
		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- Main content -->
	<section class="content container-fluid">

		<form role="form" method="post">
			<div class="box-body">
				<div class="form-group">
					<label>캠핑장 이름</label> <input type="text" name='cam_name'
						class="form-control" value="${campingName3.cam_name}">
				</div>
				<div class="form-group">
					<label>작성자</label> <input type="text" name="id"
						class="form-control" value="${user.id}" readonly>
				</div>
				<div class="form-group">
					<label>작성자 닉네임</label> <input type="text" name="nick"
						class="form-control" value="${userNick3.nick}" readonly>
				</div>
				<div class="form-group">
					<label>리뷰글번호 (직접입력해주세요.. ex)예약번호가 rev010일경우 리뷰글번호는 r010으로 작성))</label>
					<input type="text" name='r_code' class="form-control" placeholder="리뷰글번호를 입력하세요">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" name="r_content" rows="10"
						placeholder="내용을 입력하세요"></textarea>
				</div>
				<div class="form-group">
					<label>별점</label>
					<input type="text" class="form-control" name="r_star" rows="4"
						placeholder="별점을 입력하세요 (1~5)">
				</div>
			</div>

			<div class="box-footer">
				<button type="submit" class="btn btn-primary">작성완료</button>
			</div>
		</form>
	</section>
	<tr>
		<td colspan="5" align="center"><input class="btn btn-success"
			type="button" value="홈으로" id="main" /></td>
	</tr>
	</table>
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