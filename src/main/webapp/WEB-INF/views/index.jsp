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
      Page200 캠핑장
    </title>
  </head>
<script type="text/javascript">
	$(document).ready(function(){
		if("${msg}" == "stop"){
			alert("정지당한 계정입니다.");
		}
	});
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
    <%@ include file="include/top_menu.jsp" %>
	
	
	
    <div class="hero">
      <!-- Search화면 뒤에 이미지 출력해줌 -->
      <div class="hero-slide">
        <div
          class="img overlay"
          style="background-image: url('${contextPath }/resources/images/camping_bg_3.jpg')"
        ></div>
        <div
          class="img overlay"
          style="background-image: url('${contextPath }/resources/images/camping_bg_2.jpg')"
        ></div>
        <div
          class="img overlay"
          style="background-image: url('${contextPath }/resources/images/camping_bg_1.jpg')"
        ></div>
      </div>
      <!-- Search화면 뒤에 이미지 출력해줌끝 -->
	  
	  <!-- 상단에 search -->
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center">
            <h1 class="heading" data-aos="fade-up">
              지역 또는 캠핑장명을 입력해주세요
            </h1>
            <form
              action="${contextPath }/scamping/list " class="narrow-w form-search d-flex align-items-stretch mb-3" data-aos="fade-up" data-aos-delay="200" >
              <input type="text" class="form-control px-4" placeholder="지역, 캠핑장이름"
              	name='keyword' id="keywordInput" value='${cri.keyword }' />
              <button type="submit" class="btn btn-primary">Search</button>
            </form>
            
            
          </div>
        </div>
      </div>
       <!-- 상단에 search 끝-->
       
    </div>

    
   <!-- 인기있는 캠핑장 -->
        <%@ include file="include/suggestion.jsp" %>
        
      
	<!-- 테마 -->
	<%@ include file="include/theme.jsp"%>
    


    

    <!-- footer 파일 -->
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
