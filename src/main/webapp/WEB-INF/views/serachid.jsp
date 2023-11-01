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
   <style type="text/css">
   a:link {
  color : green;
  font-weight: bold;
}
a:visited {
  color : green;
}
a:hover {
  color : green;
}
a:active {
  color : green;
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
      		<form action="pwfind" method="post">
	      		<table class="table table-borderless" style="width: 30%; margin: auto; ">
	      			<tr>
	      				<td><p>비밀번호를 찾고자하는 아이디를 입력해주세요.</p></td>
	      			</tr>
	      			<tr>
	      				<td>
	      					<input class="form-control" type="text" id="id" name="id" placeholder="아이디">
	      				</td>
	      			</tr>
	      			<tr>
	      				<td>
	      					<input style="width: 100%" class="btn btn-success" type="button" value="다음" id="next">
	      				</td>
	      			</tr>
	      			<tr>
	      				<td>아이디가 기억나지 않는다면? <a href="${contextPath}/idfind">아이디 찾기</a></td>
	      			</tr>
	      		</table>
      		</form>
      	</div>
      </div>
    </div>
	<script type="text/javascript">
		$("#next").click(function(){
			var id = $("#id").val();
			var paramData = {"id":id};
			if(id == ""){
				alert("아이디를 입력해주세요");
				$("#id").focus();
			}else{
				$.ajax({
					url:"${contextPath}/idchk",
					data:paramData,
					type:"POST",
					dataType:"json",
					success:function(result){
						if(result.chk == true){
							alert("입력하신 아이디는 찾을 수 없습니다.");
							$("#id").focus();
							//location.href="${contextPath}/serachid";
						}else{
							location.href="${contextPath}/pwfind";
						}
					},
					error:function(){
						alert("실패");
					}
				});
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
