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
<%@ include file="../../include/head.jsp"%>

<title>캠핑장 수정 폼</title>
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
					<h1 class="heading" data-aos="fade-up">MODIFY</h1>

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
	<div>
		
		
	<form role="form" action="modifyPage" method="post">
		<input type='hidden' name='page' value="${cri.page }">
		<input type='hidden' name='perPageNum' value="${cri.perPageNum }">
		<input type="hidden" name="searchType" value="${cri.searchType }">
		<input type="hidden" name="keyword" value="${cri.keyword }">
			
		
			 
			 <table class="table">
				<tr>  
					<td colspan="2">캠핑장 코드 입력 &nbsp;&nbsp; <input type="text", name="cam_code" value="${camping.cam_code}" readonly/></td>
				  	<td colspan="2">지역코드 선택 &nbsp;&nbsp;
				  		<select name="region_code">
				  			
							<option value="region001" selected>강원도</option>
							<option value="region002">경기도</option>
							<option value="region003">경상도</option>
							<option value="region004">전라도</option>
							<option value="region005">제주도</option>
							<option value="region006">충청도</option>
							<option value="region007">서울시</option>
						</select>
					</td> 
				</tr>
				
				<tr> <!-- 3행 생성-->
					<td colspan="4"><input type="file", name="f_code" value="${camping.f_code }" /> <!-- 3행 1열 -->
				</tr>
				<tr> <!-- 4행 1,2열(병합) -->
					<td colspan="4">캠핑장 이름 입력 &nbsp;&nbsp;<input type="text", name="cam_name" value="${camping.cam_name}" ></td>
				</tr>
				<tr> <!-- 5행 -->
					<td colspan="4">캠핑장 주소 입력 &nbsp;&nbsp;<input type="text", name="cam_address" value="${camping.cam_address}"></td>
				</tr>
				<tr> <!-- 6행 -->
					<td colspan="4">캠핑장 전화전호 입력 &nbsp;&nbsp;<input type="text", name="cam_tel", value="${camping.cam_tel}"></td>
				</tr>
				<tr> <!-- 7행 -->
					<td colspan="2"> 입실시간 &nbsp;&nbsp;<input type="text", name="cam_start_time", value="${cam.start_name}"></td>
					<td colspan="2"> 퇴실시간 &nbsp;&nbsp;<input type="text", name="cam_finish_time", value="${cam_finish_time}" ></td>
				</tr>
				<tr> <!-- 8행 -->
					<td colspan="4"> 테마코드 선택 &nbsp;&nbsp;
					<input type="checkbox" name="thema_code", value= "연인" checked>연인 &nbsp;
					<input type="checkbox" name="thema_code", value= "가족" >가족 &nbsp;
					<input type="checkbox" name="thema_code", value= "반려동물" >반려동물 &nbsp;
					<input type="checkbox" name="thema_code", value= "당일캠핑" >당일캠핑 &nbsp;
					
					<input type="checkbox" name="thema_code", value= "산/숲" >산/숲 &nbsp;
					<input type="checkbox" name="thema_code", value= "바다" >바다 &nbsp;
					<input type="checkbox" name="thema_code", value= "계곡" >계곡 &nbsp;
					<input type="checkbox" name="thema_code", value= "강/호수" >강/호수 &nbsp;
					<input type="checkbox" name="thema_code", value= "섬" >섬 &nbsp;
					<input type="checkbox" name="thema_code", value= "도심" >도심 &nbsp;
					</td>
				</tr>
				<tr> <!-- 9행 -->
					<td colspan="4"> 옵션코드 선택 &nbsp;&nbsp;
					<input type="checkbox" name="option_code", value= "매점" checked>매점 &nbsp;
					<input type="checkbox" name="option_code", value= "샤워장 및 화장실" >샤워장 및 화장실 &nbsp;
					<input type="checkbox" name="option_code", value= "개수대" >개수대 &nbsp;
					<input type="checkbox" name="option_code", value= "차박가능" >차박가능 &nbsp;
					<input type="checkbox" name="option_code", value= "물품대여" >물품대여 &nbsp;
					<input type="checkbox" name="option_code", value= "레저시설" >레저시설 &nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="4">
					<input type="radio" name="cam_hide" value="0" checked>숨김해제 &nbsp;
					<input type="radio" name="cam_hide" value="1" >숨김
					</td>
				</tr>
				<tr> <!-- 10행 -->
					<td colspan="4">등록일&nbsp;&nbsp; <input type="date" name="today" readonly></td>
				</tr>
				
					
				<tr>
					<td align="center">
					<button type="submit" class="btn btn-success">SAVE</button>
					<button type="submit" class="btn btn-warning">CANCEL</button>
				</tr>
			</table>
		</form>
	</div>
			
		
			
		<script>
		$(document).ready(function)(){
			var formObj = $("form[role='form']");
			console.log(formObj);
			
			$(".btn-success").on("click", function()){
				formObj.submit();
			});
			
			$(".btn-warning").on("click", function(){
				self.location = "/page/admin/scamping/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
						+ "&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});
			
		
		});


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