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

<title>캠핑장</title>

<style>
ul li{
	display: inline-block;
}
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

	<div class="section">
		<div class="container">
			<!-- 여기에 내용을 작성 -->
			
			<section class="content container-fluid">
				<div class="box-header">
					<h3 class="box-title">캠핑장 리스트</h3>
				</div>
								

				<table class="table">
					<tr>
						<td>캠핑장코드</td>
						<td>지역코드</td>
						<td>캠핑장명</td>
						<td>캠핑장주소</td>
						<td>등록일</td>
						<td>수정일</td>
					</tr>

		<!-- 페이징 추가 -->
					<c:forEach var="acamping" items="${list }">
						<tr>
							<td>${acamping.cam_code}</td>
							<td>${acamping.region_code}</td>
							<td><a
								href='/page/admin/scamping/detail${pageMaker.makeQuery(pageMaker.cri.page)}
								&cam_code=${acamping.cam_code }'>${acamping.cam_name}
							</a></td>
							<td>${acamping.cam_address}</td>
							<td>${acamping.cam_regdate}</td>
							<td>${acamping.cam_modifydate }</td>
						</tr>
					</c:forEach>
					
				</table>
				
		<!-- 검색기능 추가 -->
   			 
		   	<div class="search_wrap">
		        <div class="search_area">
		            <input type="text" name='keyword' id="keywordInput" value='${cri.keyword }'>
		            <button id='searchBtn'>Search</button>
		        </div>
		    </div>  
 	
			<div class="text-center">
				<input class="btn btn-dark"
					type="button" value="GO HOME" id="main" />
				<input class="btn btn-primary"
					type="button" value="REGISTER" id="register" />
			</div>
			</section>
		</div>
		
	<!-- 검색기능 추가 수정 -->
		<div class="text-center">
			<ul class="pagination">
			
				<c:if test="${pageMaker.prev && pageMaker.startPage > 0 }">
					<li class="page-item"><a class="page-link"
						href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
					<li class="page-item"
						<c:out value="${pageMaker.cri.page == idx?'class=active':'' }"/>>
						<a class="page-link" href="list${pageMaker.makeSearch(idx) }">${idx }</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<li class="page-item"><a class="page-link" href="list${pageMaker.makeSearch(pageMaker.endPage + 1) }">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
		
			<form role="moveForm" action="modifyPage" method="post">
				<input type='hidden' name='page' value="${cri.page }">
				<input type='hidden' name='perPageNum' value="${cri.perPageNum }">
				<input type='hidden' name='searchType' value="${cri.searchType }">
				<input type='hidden' name='keyword' value="${cri.keyword }">
			</form>
		
		
		<!-- 검색script -->
		<script>
		
			$(document).ready(function(){
				
				$('#searchBtn').on("click", function(event){
					
					self.location = "list" 
						+ '${pageMaker.makeQuery(1)}'
						+ "&keyword=" + encodeURIComponent($('#keywordInput').val());
				});
				
				$('#newBtn').on("click", function(evt){
				
					self.location = "register";
				});
			});
		
		</script>

		<script>
			$("#main").click(function() {
				location.href = "${contextPath }";
			});

			$("#register").click(function() {
				location.href = "${contextPath }/admin/scamping/register";
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