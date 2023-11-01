<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<%@ include file="include/head.jsp"%>

<title>캠핑장 예약 폼</title>
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
	<%@ include file="include/top_menu.jsp"%>

	<div class="hero page-inner overlay"
		style="background-image: url('${contextPath}/resources/images/hero_bg_1.jpg')">
		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up">REGISTER</h1>

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

	<div class="section"></div>
	<div class="container">
		<!-- 여기에 내용을 작성 -->
		
	<form action="reservatoin" role="form" method="post">
		
		
		<div>${msg}</div>
			 <section class="content container-fluid">
				<div class="box-header">
					<h3 class="box-title">
					
					캠핑장 예약</h3>
				</div>
								

				<table style="text-align: center;" class="table">
					<tr>
						<td>회원ID</td>
						<td>캠핑장구역</td>
						<td>예약코드</td>
						<td>예약 시작일</td>
						<td>예약 종료일</td>
						
					</tr>

		<!-- 페이징 추가 -->
					
						<tr>
							<td style="font-size: 20px;">${user.id }</td>
							<td style="font-size: 20px;">${reservation.cri_area_code}</td>
							<td><input type="text", name="rev_code"></td>
							<td><input class="form-control" type="date", name="rev_start_date"></td>
							<td><input class="form-control" type="date", name="rev_finish_date"></td>
							
							
 						</tr>
					
				</table>
			
				<div class="text-center">
					<input class="btn btn-secondary" value="홈으로" id="main" />
					<input class="btn btn-secondary" value="목록" id="list" />
					<input class="btn btn-warning" type="reset" value="다시작성" id="reset" />
					<input class="btn btn-success" type="submit" value="등록" id="submit" />
				</div>
		</form>
			
			
		<script>
			$("#main").click(function() {
			location.href = "${contextPath }";
			});
			
			
			$("#list").click(function() {
			location.href = "${contextPath }/scamping/c_revinfo";
			});
			
			$("#submit").click(function() {
				alert("테스트");
				$("#submit").submit();
			});
			
			
			

		</script>
		
		<script>
			var result = '${msg}';

			if (result == 'SUCCESS') {
				alert("처리가 완료되었습니다.")
			}
			if (result == 'FAIL'){
				alert("예약이 실패하였습니다.")
			}
		</script>
		
		</div>


		<%@ include file="include/footer.jsp"%>
		<!-- /.site-footer -->

		<!-- Preloader -->
		<div id="overlayer"></div>
		<div class="loader">
			<div class="spinner-border" role="status">
				<span class="visually-hidden">Loading...</span>
			</div>
		</div>

		<!-- 플러그인 -->
		<%@ include file="include/plugin.jsp"%>
	</body>
</html>