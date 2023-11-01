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
<title>Property &mdash; Free Bootstrap 5 Website Template by
	Untree.co</title>
</head>
<!-- ajax를 통한 댓글쓰기 -->
<script type="text/javascript">
	$(document).ready(function() {
		console.log("ajax test");

		replylist();

		$("#btnReplySave").on('click', function() {
			var rp_content = $("#rp_content").val();
			var id = $("#id").val();
			console.log(id);

			var url = "${contextPath}/onetoone/reply2";
			var paramData = {
				"id" : id,
				"rp_content" : rp_content,
				"o_code" : "${onetoone.o_code}"

			};//추가 데이터

			$.ajax({
				url : url,
				data : paramData,
				dataType : 'json',
				type : 'POST',
				success : function(result) {
					replylist();
					$("#rp_content").val('');
					$("#id").val('');
				},
				error : function(data) {

					alert("에러가 발생했습니다.");
				}
			});
		});
	});

	//댓글 목록 불러오기 : ajax
	function replylist() {
		var url = "${contextPath}/onetoone/replylist"
		var paramData = {
			"o_code" : "${onetoone.o_code}"
		}
		console.log(paramData);

		
				$.ajax({
					url : url,
					data : paramData,
					dataType : 'json',
					type : 'POST',

					success : function(result) {
						//alert("성공");
						var htmls = "";

						if (result.lengh < 1) {
							htmls += "<h3>등록된 댓글이 없습니다.</h3>"
						} else {
							$(result)
									.each(
											function() {
												htmls = htmls
														+ '<div class = "" id="rp_code'+this.rp_code +'">';

												htmls += '<splan class = "d-block">';
												htmls += this.rp_code + '-';
												htmls += '<strong class ="text-gray-dark">'
														+ this.id + '</strong>';
												htmls += '<span style ="padding-left:7px; font-size:9pt">';
												htmls += '<a href ="javascript:void(0)"onclick = "fn_editReply('
														+ this.rp_code
														+ ',\''
														+ this.id
														+ '\',\''
														+ this.rp_content
														+ '\')"style ="padding-right:5px">수정</a>';
												htmls += '<a href ="javascript:void(0)"onclick = "fn_deleteReply('
														+ this.rp_code
														+ ')">삭제</a>';
												htmls += '</span>';
												htmls += '</span><br>';
												htmls += this.rp_content;
												htmls += '</p>';
												htmls += '<div>';
											})//each END
						}
						$("#replylist").html(htmls);
					},
					error : function(data) {
						alert("실패");
					}
				});
	}
	// 댓글수정하기(form)
	function fn_editReply(rp_code,id,rp_content){
		var htmls = "";
		htmls = htmls + '<div class =""id="rp_code' +rp_code +'">';
		htmls +='<span class="d-block">';
		htmls +=rp_code + '-';
		htmls +='<strong class="text-gray-dark">'+ id +'</strong>';
		htmls +='<span style ="padding-left:7px; font-size:9pt">';
		htmls +='<a href ="javascript:void(0)"onclick="fn_updateReply('+rp_code +',\''+id+'\',\''+rp_content+'\')"style="padding-right:5px">저장</a>';
		htmls +='<a href ="javascript:void(0)"onclick="replylist()">취소</a>';
		htmls +='</span>';
		htmls +='</span><br>';
		htmls +='<textarea name="editmemo"id="editmemo" class="form-control"rows="3">';
		htmls += rp_content;
		htmls += '</textarea>';
		htmls +='</p>';
		htmls +='</div>';
		
		//선택한 요소를 다른것으로 바꿉니다(변경)
		$('#rp_code' + rp_code).replaceWith(htmls);
		$('#rp_code' + rp_code+ '#editmemo').focus();
	}
	
	//댓글 수정 ajax / id->editmemo변경되어 있으므로 필요없다
	function fn_updateReply(rp_code, id){
		var url = "${contextPath}/onetoone/replyupdate2"
		var editmemo =$('#editmemo').val();
		var paramData ={
				"rp_code" :rp_code,
				"id" :id,
				"rp_content" :editmemo
		};
		console.log(paramData);
		$.ajax({
					url : url,
					data : paramData,
					dataType :'json',
					type :'POST',
					success:function(result){
						console.log(result);
						replylist();
					},
					error:function(data){
						alert("에러가 발생했습니다.")
					}
		});
	}
	//댓글삭제
	function fn_deleteReply(rp_code) {
		var url ="${contextPath}/onetoone/replyDelete"
		var paramData={
				"rp_code" : rp_code
		};
		
		$.ajax({
				url : url,
				data : paramData,
				dataType :'json',
				type :'POST',
				success:function(result){
						console.log(result);
						replylist();
				},
				error:function(data) {
						alert("에러가 발생했습니다.")
				}	
		});
	}
</script>






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
					<h1 class="heading" data-aos="fade-up">상세보기</h1>

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
						<h3 class="box-title">상세보기</h3>
					</div>
					<div class="box-body">
						<div class="form-group">
							<labal>회원 아이디</labal>
							<input type="text" id = "id" name="id" class="form-control"
								value="${onetoone.id }" readonly="readonly" />
						</div>
						<div class="form-group">
							<label>제목</label> <input type="text" name="n_title"
								class="form-control" value="${onetoone.o_title}"
								readonly="readonly" />
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea name="n_content" rows="5" readonly="readonly"
								class="form-control">${onetoone.o_content}</textarea>
						</div>
						<div class="form-group">
							<label>작성일</label> <input type="text" name="o_w_date"
								class="form-control" value="${onetoone.o_w_date}"
								readonly="readonly" />
						</div>
					</div>
				</div>
		</div>

		<a href="update1?o_code=${onetoone.o_code }" role="button"
			class="btn btnoutline-info">글 수정</a> <a
			href="delete1?o_code=${onetoone.o_code }" role="button"
			class="btn btnoutline-info">글 삭제</a>
		<div class="box-body">
			<table>
				<c:choose>
					<c:when test="${admin == null }">
									관리자만 답글작성 가능
								</c:when>
					<c:otherwise>
									관리자님 환영합니다
									<tr>
							<td rowspan="2" width="80%"><textarea class="form-control"
									name="rp_content" id="rp_content" placeholder="댓글을 입력하세요"></textarea></td>
							
						</tr>
						<tr>
							<td><button type="button" id="btnReplySave">저장</button></td>

						</tr>
			</table>

		</div>
		</c:otherwise>
		</c:choose>
		<div id="replylist"></div>


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
<%@ include file="../include/plugin.jsp"%>
</body>

</html>