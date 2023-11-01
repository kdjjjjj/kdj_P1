<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<%@ include file="../include/head.jsp"%>

<title>캠핑장</title>
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
					<h1 class="heading" data-aos="fade-up">CAMPING</h1>

					<nav aria-label="breadcrumb" data-aos="fade-up"
						data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
							<li class="breadcrumb-item"><a href="${contextPath }">Home</a></li>
							<li class="breadcrumb-item active text-white-50"
								aria-current="page">캠핑장</li>
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
			<h3 class="box-title">캠핑장 리스ㅌ</h3>
		</div>
					
					<strong>캠핑장 테스트 중 사진은 언제 채우냐</strong><br>
					<table class="table">
						<tr>
							<td>캠핑장코드</td>
							<td>지역코드</td>
							<td>파일코드</td>
							<td>캠핑장명</td>
							<td>숨김여부</td>
							<td>등록일</td>
						</tr>

						<c:forEach var="camping" items="${list }">
							<tr>
								<td>${camping.cam_code}</td>
								<td>${camping.region_code}</td>
								<td>${camping.f_code}</td>
								<td><a href="/page/camping/detail?cam_code=${camping.cam_code}">${camping.cam_name} </a></td>
								<td>${camping.cam_hide}</td>
								<td>${camping.cam_regdate}</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="2" align="center">
							<input class="btn btn-success" type="button" value="홈으로" id="main" />
							</td>
							<td colspan="2" align="center">
							<input class="btn btn-warning" type="button" value="캠핑장추가" id="register" />
							</td>
						</tr>
					</table>
				</form>
			</div>
			<script>
				$("#main").click(function() {
					location.href = "${contextPath }";
				});
				
				$("#register").click(function(){
					location.href = "${contextPath }/camping/register";
				});

			</script>
			<script>
				var result = '${msg}';
				
				if(result == 'SUCCESS'){
					alert("처리가 완료되었습니다.")
				}
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