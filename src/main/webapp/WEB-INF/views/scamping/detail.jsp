<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <%@ include file="../include/head.jsp" %>

    <title>
      Property &mdash; Free Bootstrap 5 Website Template by Untree.co
    </title>
  </head>
  
      
    <!-- 리뷰까지 같이 적용하려면 <body>밖에? -->
  <form role="form" method="post">

  	<input type='hidden' name='cam_code' value="${scamping.cam_code}" >
  	
  </form> 
  

  

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
    <%@ include file="../include/top_menu.jsp" %>
	
	
	
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
	</div>
	
	
	
    <div class="section">
      <div class="container">
        <div class="row text-left mb-5">
          <div class="col-12">
            <h2 class="font-weight-bold heading text-primary mb-4">About Us</h2>
          </div>
          <div class="col-lg-6">
            <p class="text-black-50">
              캠핑장 소개
            </p>
          </div>
        </div>
      </div>
    </div>
    
  

    <div class="section pt-0">
      <div class="container">
        <div class="row justify-content-between mb-5">
          <div class="col-lg-7 mb-5 mb-lg-0 order-lg-2">
            <div class="img-about dots">
              <img src="${contextPath }/resources/images/camping_bg_3.jpg" alt="Image" class="img-fluid" />
            </div>
          </div>
          <div class="col-lg-4">
            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-fire"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">
                	${camping.cam_name }
                </h3>
                <p class="text-black-50">
                  대충 캠핑장 소개글 (캠핑장 소개글 게시판 필요?)
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-home2"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">캠핑장 주소</h3>
                <p class="text-black-50">
                  ${camping.cam_address }
               
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-mobile"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">캠핑장 연락처</h3>
                <p class="text-black-50">
                  ${camping.cam_tel}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="section pt-0">
      <div class="container">
        <div class="row justify-content-between mb-5">
          <div class="col-lg-7 mb-5 mb-lg-0">
            <div class="img-about dots">
              <img src="${contextPath }/resources/images/camping_bg_2.jpg" alt="Image" class="img-fluid" style="width:500px; height:500px;" />
            </div>
          </div>
          <div class="col-lg-4">
            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-leaf"></span>
                </span>
              <div class="feature-text">
                <h3 class="heading">캠핑 테마</h3>
                <p class="text-black-50">
                  ${camping.thema_code }
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-check-square-o"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">캠핑 옵션</h3>
                <p class="text-black-50">
                  ${camping.option_code }
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-clock-o"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">뭐하지</h3>
                <p class="text-black-50">
                  머하지ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ~~~~~~~~~~~~~~~~~~
                  
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-4" data-aos="fade-up" data-aos-delay="0">
            <img src="${contextPath }/resources/images/camping06.jpg" style="width: 500px; height: 500px;" alt="Image" class="img-fluid" />
          </div>
          <div class="col-md-4 mt-lg-5" data-aos="fade-up" data-aos-delay="100">
            <img src="${contextPath }/resources/images/camping13.jpg" style="width: 500px; height: 500px; alt="Image" class="img-fluid" />
          </div>
          <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
            <img src="${contextPath }/resources/images/camping15.jpg" style="width: 500px; height: 500px; alt="Image" class="img-fluid" />
          </div>
        </div>
      </div>
    </div>
	<div class="section">
      <div class="container">
        <div class="row section-counter mt-5">
        
        <div
            class="col-6 col-sm-6 col-md-6 col-lg-3"
            data-aos="fade-up"
            data-aos-delay="500"
          >
            <div class="counter-wrap mb-5 mb-lg-0">
              <span class="number">
              	<span class="countup text-primary">
                	${count }
                </span>
               </span>
              <span class="caption text-black-50">리뷰 개수</span>
            </div>
          </div>
         
          <div
            class="col-6 col-sm-6 col-md-6 col-lg-3"
            data-aos="fade-up"
            data-aos-delay="600"
          >
            <div class="counter-wrap mb-5 mb-lg-0">
              <span class="number"
                ><span class="countup text-primary">38928</span></span
              >
              <span class="caption text-black-50">찜한 개수</span>
            </div>
          </div>
          
          <div
            class="col-6 col-sm-6 col-md-6 col-lg-3"
            data-aos="fade-up"
            data-aos-delay="700"
          >
            <div class="counter-wrap mb-5 mb-lg-0">
              <span class="number"
                ><span style="color: black; size=70%">
                	${camping.cam_start_time}
                </span></span>
              <span class="caption text-black-50">입실 시간</span>
            </div>
          </div>
         
          <div
            class="col-6 col-sm-6 col-md-6 col-lg-3"
            data-aos="fade-up"
            data-aos-delay="800"
          >
            <div class="counter-wrap mb-5 mb-lg-0">
              <span class="number"
                ><span style="color: black;">
                	${camping.cam_finish_time}
                </span></span>
              <span class="caption text-black-50">퇴실 시간</span>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 관리자용 -->
	<div class="text-center">
		<div class="box-footer">
			<!-- 예약자용 -->
			<button type="submit" class="btn btn-info">RESERVATION INFO</button>
			<button type="submit" class="btn btn-primary">GO LIST</button>
			
		
		</div>
	</div>
	 
	<form role="form" action="modifyPage" method="post">
		<input type='hidden' name='cam_code' value="${camping.cam_code }">
		<input type='hidden' name='page' value="${cri.page }">
		<input type='hidden' name='perPageNum' value="${cri.perPageNum }">
		<input type='hidden' name='searchType' value="${cri.searchType }">
		<input type='hidden' name='keyword' value="${cri.keyword }">
	</form>
	
	
   <form id="code" method="get" action="c_revinfo">
  	<input type='hidden' name='cam_code' value="${camping.cam_code}" >
   </form> 
    
	<script>
		$(document).ready(function() {

			var formObj = $("form[role='form']");

			console.log(formObj);

		

			$(".btn-primary").on("click", function() {
				formObj.attr("method", "get");
				formObj.attr("action", "/page/scamping/list");
				formObj.submit();
			});
			
		});
		
		
		
		
		$(".btn-info").click(function() {
			$("#code").submit();
			<%//location.href = "${contextPath }/scamping/c_revinfo?cam_code=${camping.cam_code}";%>
		});
		
		
	</script>
    
    
    <!-- /body -->
    
	<%@ include file="../include/review.jsp" %>
    <div class="site-footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="widget">
              <h3>Contact</h3>
              <address>43 Raymouth Rd. Baltemoer, London 3910</address>
              <ul class="list-unstyled links">
                <li><a href="tel://11234567890">+1(123)-456-7890</a></li>
                <li><a href="tel://11234567890">+1(123)-456-7890</a></li>
                <li>
                  <a href="mailto:info@mydomain.com">info@mydomain.com</a>
                </li>
              </ul>
            </div>
            <!-- /.widget -->
          </div>
          <!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <div class="widget">
              <h3>Sources</h3>
              <ul class="list-unstyled float-start links">
                <li><a href="#">About us</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Vision</a></li>
                <li><a href="#">Mission</a></li>
                <li><a href="#">Terms</a></li>
                <li><a href="#">Privacy</a></li>
              </ul>
              <ul class="list-unstyled float-start links">
                <li><a href="#">Partners</a></li>
                <li><a href="#">Business</a></li>
                <li><a href="#">Careers</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">FAQ</a></li>
                <li><a href="#">Creative</a></li>
              </ul>
            </div>
            <!-- /.widget -->
          </div>
          <!-- /.col-lg-4 -->
          <div class="col-lg-4">
            <div class="widget">
              <h3>Links</h3>
              <ul class="list-unstyled links">
                <li><a href="#">Our Vision</a></li>
                <li><a href="#">About us</a></li>
                <li><a href="#">Contact us</a></li>
              </ul>

              <ul class="list-unstyled social">
                <li>
                  <a href="#"><span class="icon-instagram"></span></a>
                </li>
                <li>
                  <a href="#"><span class="icon-twitter"></span></a>
                </li>
                <li>
                  <a href="#"><span class="icon-facebook"></span></a>
                </li>
                <li>
                  <a href="#"><span class="icon-linkedin"></span></a>
                </li>
                <li>
                  <a href="#"><span class="icon-pinterest"></span></a>
                </li>
                <li>
                  <a href="#"><span class="icon-dribbble"></span></a>
                </li>
              </ul>
            </div>
            <!-- /.widget -->
          </div>
          <!-- /.col-lg-4 -->
        </div>
        <!-- /.row -->

        <div class="row mt-5">
          <div class="col-12 text-center">
            <!-- 
              **==========
              NOTE: 
              Please don't remove this copyright link unless you buy the license here https://untree.co/license/  
              **==========
            -->

            <p>
              Copyright &copy;
              <script>
                document.write(new Date().getFullYear());
              </script>
              . All Rights Reserved. &mdash; Designed with love by
              <a href="https://untree.co">Untree.co</a>
              <!-- License information: https://untree.co/license/ -->
            </p>
            <div>
              Distributed by
              <a href="https://themewagon.com/" target="_blank">themewagon</a>
            </div>
          </div>
        </div>
      </div>
      <!-- /.container -->
    </div>
    <!-- /.site-footer -->

    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
      <div class="spinner-border" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
    </div>
	<!-- 플러그인 -->
    <%@ include file="../include/plugin.jsp" %>
  </body>
</html>
