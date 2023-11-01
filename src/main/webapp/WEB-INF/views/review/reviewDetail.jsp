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

<title>리뷰상세보기</title>
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
								aria-current="page">리뷰상세보기</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div class="box">
		<div class="box-header">
			<h3 class="box-title">리뷰상세보기</h3>
		</div>
		<div class="box-body">
			<div class="form-group">
				<label>캠핑장 이름</label> <input type="text" name="title"
					class="form-control" value="${campingName.cam_name}"
					readonly="readonly" />
			</div>
			<div class="form-group">
			<label>작성자</label> <input type="text" name="id" class="form-control"
				value="${selectOne.id}" readonly="readonly" />
			</div>
			<div class="form-group">
			<label>작성자 닉네임</label> <input type="text" name="userNick"
				class="form-control" value="${userNick1.nick}"
				readonly="readonly" />
			</div>
			<div class="form-group">
			<label>내용</label>
			<textarea name="content" rows="5" readonly="readonly"
				class="form-control">${selectOne.r_content}</textarea>
			</div>
			<div class="form-group">
			<label>별점</label> <input type="text" name="star" class="form-control"
				value="${selectOne.r_star}" readonly="readonly" />
		</div>
		<form action="reviewUpdate" method="get" id="btn1">
			<input type="hidden" name="r_code" value="${selectOne.r_code}">
			<input type="hidden" name="rev_code" value="${selectOne.rev_code}">
		</form>
		<form action="reviewDelete" method="get" id="btn2">
			<input type="hidden" name="r_code" value="${selectOne.r_code}">
		</form>
		<form action="reviewLock" method="get" id="btn3">
			<input type="hidden" name="r_code" value="${selectOne.r_code}">
		</form> 
	</div>

	</div>
	<div class="box-footer">
		<tr>
			<td colspan="5" align="center"><input class="btn btn-success"
				type="button" value="홈으로" id="main" /></td>
			<td colspan="5" align="center"><input class="btn btn-success"
				type="button" value="리뷰 목록" id="list" /></td>

			<c:if test="${user.id == selectOne.id or admin !=null }">
				<td colspan="5" align="center"><input class="btn btn-warning"
					type="button" value="수정" id="reviewUpdate" /></td>
				<td colspan="5" align="center"><input class="btn btn-dark"
					type="button" value="삭제" id="reviewDelete" /></td>
			</c:if>
			<c:if test="${admin !=null }">
				<td colspan="5" align="center">
					<c:if test="${selectOne.r_lockpwd == 1 }">
					<input class="btn btn-danger"type="button" value="리뷰잠금해제" id="reviewLock" />
					</c:if>
				</td>
			</c:if>
			<c:if test="${admin !=null }">
				<td colspan="5" align="center">
					<c:if test="${selectOne.r_lockpwd == 0 }">
					<input class="btn btn-danger"type="button" value="리뷰잠금" id="reviewLock" />
					</c:if>
				</td>
			</c:if>
		</tr>
	</div>
	<script>
		$("#main").click(function() {
			location.href = "${contextPath }";
		});
		$("#list").click(function() {
			location.href = "previewlistPage";
		});
		$("#reviewUpdate").click(function() {
			$("#btn1").submit();
		});
		$("#reviewDelete").click(function() {
			$("#btn2").submit();
		});
		$("#reviewLock").click(function() {
			$("#btn3").submit();
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