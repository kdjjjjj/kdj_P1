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

<title>리뷰 수정하기</title>
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
								aria-current="page">리뷰수정!</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<section class="content-header">
		<h1>리뷰 수정하기!!!!!</h1>
		<ol class="breadcrumb">
			<li><a href="/"><i class="fa fa-dashboard"></i> Level</a></li>
			<li class="active">Here</li>
		</ol>
	</section>

	<!-- Main content -->
	<section >
		<form role="form" method="post" id="fform">
			<div>
				<label>캠핑장이름</label> <input type="text" name='cam_name'
					class="form-control" value="${campingName2.cam_name}" readonly="readonly" >
			</div>
			<div>
				<label>작성자</label> <input type="text" name="id" class="form-control"
					readonly="readonly" value="${selectOne2.id}">
			</div>
			<div>
				<label>작성자 닉네임</label> <input type="text" name="nick" class="form-control"
					readonly="readonly" value="${userNick2.nick}">
			</div>
			<div>
				<label>내용</label>
				<textarea class="form-control" name="r_content" rows="3"
					placeholder="내용을 입력해주세요" id="r_content">${selectOne2.r_content}</textarea>
			</div>
			<div>
				<label>별점</label>
				<input type="text" name="r_star" id="r_star" class="form-control" placeholder="별점을 입력해주세요" value="${selectOne2.r_star}">
			</div>

			<div>
				<button type="button" id="btn" class="btn btn-primary">수정 완료</button>
			</div>
		</form>
		
	</section>
	<tr>
		<td colspan="5" align="center"><input class="btn btn-success"
			type="button" value="홈으로" id="main" /></td>
	</tr>
	<script>
		$("#main").click(function() {
			location.href = "${contextPath }";
		});
		
		$("#btn").click(function() {
				if($("#r_content").val() == "") {
					alert("내용을 입력해주세요.");
					return false;
				}else if($("#r_star").val() == ""){
					alert("별점을 입력해주세요.");
					return false;
				}else{
					$("#fform").submit();
				}
				
			
		});
		
		
	</script>

	<!-- /.content -->

	<!-- 플러그인 -->
	<%@ include file="../include/plugin.jsp"%>
</body>
</html>