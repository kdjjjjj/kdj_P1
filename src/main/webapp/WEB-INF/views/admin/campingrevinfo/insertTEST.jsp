<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="true"%>
<!-- /*
* Template Name: Property
* Template Author: Untree.co
* Template URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../../include/head.jsp"%>

<title>캠핑장 예약 정보 추가</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.search_area{
	display: inline-block;
	margin-top: 30px;
	margin-left: 260px;
}
.search_area input{
	height: 30px;
	width: 250px;
}
.search_area button{
	width: 100px;
	height: 36px;
}
  
</style>
<style>
.tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

.tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  
  /* Position the tooltip */
  position: absolute;
  z-index: 1;
  top: 100%;
  left: 50%;
  margin-left: -60px;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
}
</style>




</head>



  <form role="form" method="post">
  	<input type='hidden' name='cam_code' value="${ac_revinfo.cam_code}" >
  </form> 
  
  <div class="feature-text">
                <h3 class="heading">
                	${acamping.cam_name }
                </h3>
            
              </div>
  
<body style="text-align:center;">
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<!-- 상단에 네비게이션 -->
	<%@ include file="../../include/top_menu.jsp"%>

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

	<div class="section"></div>
	
	<div class="container">
		<!-- 여기에 내용을 작성 -->
			
	<form role="form" method="post">
			<!-- <section class="content container-fluid">
				<div class="box-header">
					<h3 class="box-title"> -->
					
		<div>${msg}</div>
			<h3>캠핑장 예약정보 추가</h3>
				<table class="table">
					<tr>
						<td>캠핑장코드 &nbsp;&nbsp; ${ac_revinfo.cam_code}" </td>
					</tr>
					<tr>
						<td>캠핑장구역 입력&nbsp;&nbsp;<input type="text", name="cri_area_code" placeholder="cri_area_code"></td>
					</tr>
					<tr>
						<td>최대인원 입력&nbsp;&nbsp;<input type="text", name="cri_max" placeholder="cri_max"></td>
					</tr>
					<tr>
						<td>가격 입력&nbsp;&nbsp;<input type="text", name="cri_price" placeholder="cri_price"></td>
					</tr>

				</table>
				
			<div class="text-center">
				<input class="btn btn-success" type="button" value="GO HOME" id="main" />
				<input class="btn btn-success" type="submit" value="등록" id="submit" />
			</div>
		</form>
		
		<script>
			$("#main").click(function() {
				location.href = "${contextPath }";
			});
			
			$("#submit").click(function() {
				location.href = "${contextPath }/admin/campingrevinfo/insert";
			});

			
		</script>
		<script>
			var result = '${msg}';

			if (result == 'SUCCESS') {
				alert("처리가 완료되었습니다.")
			}
		</script>
	</div>



	<%@ include file="../../include/footer.jsp"%>
	<!-- /.site-footer -->

	<!-- Preloader -->
	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="visually-hidden">Loading...</span>
		</div>
	</div>
<!-- 플러그인 -->
<%@ include file="../../include/plugin.jsp"%>
</body>
</html>