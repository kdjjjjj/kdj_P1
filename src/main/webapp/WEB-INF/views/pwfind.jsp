<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <%@ include file="include/head.jsp" %>

    <title>
    	비밀번호 찾기
    </title>
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
    <%@ include file="include/top_menu.jsp" %>
	
	
	

    <div
      class="hero page-inner overlay"
      style="background-image: url('${contextPath}/resources/images/hero_bg_1.jpg')"
    >
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">비밀번호 찾기</h1>

            <nav
              aria-label="breadcrumb"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <ol class="breadcrumb text-center justify-content-center">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li
                  class="breadcrumb-item active text-white-50"
                  aria-current="page"
                >
                  비밀번호 찾기
                </li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </div>
	
    <div class="section">
      <div class="container">
      	<!-- 여기에 내용을 작성 -->
      	<div>
      		<form id="pwfind" method="post">
	      		<table class="table table-borderless" style="width: 50%; margin: auto; ">
	      			<tr>
	      				<td>
	      					<input class="form-control" type="text" name="name" id="name" placeholder="이름">
	      				</td>
	      			</tr>
	      			<tr>
	      				<td><input class="form-control" type="text" name="phone" id="phone" placeholder="핸드폰 번호는 - 빼고 입력해주세요"></td>
	      				<td><input class="btn btn-outline-info" type="button" value="인증하기" id="chk"></td>
	      			</tr>
	      			<tr>
	      				<td>
	      					<input class="btn btn-outline-info" style="display: none; width: 100%" type="button" id="next" value="다음" >
	      				</td>
	      			</tr>
	      		</table>
	      	</form>
      	</div>
      </div>
    </div>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#next").click(function(){
				$("#pwfind").submit();
			});
			$("#chk").click(function(){
      			var reg = new RegExp("^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$");
				var move = $("#pwfind");
      			if($("#name").val() == ""){
					alert("이름을 입력해주세요");
					$("#name").focus();
				}else if($("#phone").val() == ""){
					alert("핸드폰 번호를 입력해주세요");
					$("#phone").focus();
				}else if(!(reg.test($("#phone").val()))){
					alert("-을 뺀 올바른 핸드폰 번호를 입력해주세요");
				}else{
					var formData = {
						"name" : $("#name").val(),
						"phone" : $("#phone").val()
					};
					
					$.ajax({
						url:"${contextPath}/userDataFind",
						data:formData,
						dataType:"json",
						type:"POST",
						success:function(result){
							if(result.msg == "성공"){
								alert("인증에 성공하셨습니다. 다음버튼을 눌러주세요");
								$("#next").css("display","block");
							}else{
								alert(result.msg);
							}
						},
						error:function(result){
							alert("실패");
						}
					});
				}
			}); // 유효성 끝
		}); // 함수 끝
	</script>
	<%@ include file="include/footer.jsp" %>
    <!-- /.site-footer -->

    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
      <div class="spinner-border" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
    </div>

	<!-- 플러그인 -->
    <%@ include file="include/plugin.jsp" %>
  </body>
</html>
