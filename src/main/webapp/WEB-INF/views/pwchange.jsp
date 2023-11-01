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
    	main템플렛
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
      		<form id="next" action="pwchange" method="post">
    	  		<table class="table table-borderless" style="width: 50%; margin: auto; ">
    	  			<tr>
    	  				<td><input class="form-control" type="password" id="pw" name="pw" placeholder="비밀번호"></td>
    	  			</tr>
    	  			<tr>
    	  				<td>
    	  					<p style="color: gray;" id="pwregchk">비밀번호는 영문 숫자 특수기호 조합 8자리 이상자리 사이로 입력해주세요.</p>
    	  				</td>
    	  			</tr>
    	  			<tr>
    	  				<td><input class="form-control" type="password" id="pwchk" name="pwchk" placeholder="비밀번호 확인"></td>
    	  			</tr>
    	  			<tr>
    	  				<td>
    	  					<p id="pwchk2"></p>
    	  				</td>
    	  			</tr>
    	  			<tr>
    	  				<td colspan="2"><input style="width: 100%" class="btn btn-outline-info" type="button" value="비밀번호 변경하기" id="chk"></td>
    	  			</tr>
	      		</table>
      		</form>
      	</div>
      </div>
    </div>
	
	<script type="text/javascript">
		$("#pw").blur(function(){
			var pwregchk = $("#pwregchk");
			var pw = $("#pw").val();
			
			var reg = new RegExp("^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$");
			if(!(reg.test(pw))){
				pwregchk.css("color", "red");
				pwregchk.text("비밀번호는 영문 숫자 특수기호 조합 8자리 이상자리 사이로 입력해주세요.");
				$("#pw").focus();
			}else if(reg.test(pw)){
				pwregchk.css("color", "green");
				pwregchk.text("사용가능한 비밀번호 입니다.");
			}
		});
		$("#chk").click(function(){
			if($("#pw").val() != $("#pwchk").val()){
				alert("비밀번호 확인이 다릅니다.");
			}else{
				alert("비밀번호가 변경되었습니다.");
				$("#next").submit();
			}
		});
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
