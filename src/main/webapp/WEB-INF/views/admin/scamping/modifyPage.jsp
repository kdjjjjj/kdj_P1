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
    <%@ include file="../../include/head.jsp" %>

    <title>
      Property &mdash; Free Bootstrap 5 Website Template by Untree.co
    </title>
  </head>
  
      
    <!-- 리뷰까지 같이 적용하려면 <body>밖에? -->
  <form role="form" method="post">

  	
  	
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
    <%@ include file="../../include/top_menu.jsp" %>
	
	
	
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
              캠핑장 수정
            </p>

          </div>
        </div>
      </div>
    </div>
    
    	<form role="form" action="modifyPage" method="post">
    	<input type='hidden' name='cam_code' value="${acamping.cam_code}" >
		<input type='hidden' name='page' value="${cri.page }">
		<input type='hidden' name='perPageNum' value="${cri.perPageNum }">
		<input type="hidden" name="searchType" value="${cri.searchType }">
		<input type="hidden" name="keyword" value="${cri.keyword }">
  

    <div class="section pt-0">
      <div class="container">
        <div class="row justify-content-between mb-5">
          <div class="col-lg-7 mb-5 mb-lg-0 order-lg-2">
            <div class="img-about dots">
            
				<input type="file", name="f_code" value="${acamping.f_code }" />
   
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
                	<input type="text", name="cam_name" value="${acamping.cam_name}" placeholder="캠핑장이름 입력">
                </h3>
                <p class="text-black-50">
                  지역코드 입력
                  <select name="region_code">
					<option value="region001" selected>강원도</option>
					<option value="region002">경기도</option>
					<option value="region003">경상도</option>
					<option value="region004">전라도</option>
					<option value="region005">제주도</option>
					<option value="region006">충청도</option>
					<option value="region007">서울시</option>
				</select>
				
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-home2"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">캠핑장 주소 입력</h3>
                <p class="text-black-50">
                
                 <input type="text", name="cam_address" value="${acamping.cam_address}">
               
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-mobile"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">캠핑장 연락처 입력</h3>
                <p class="text-black-50">
                  <input type="text", name="cam_tel", value="${acamping.cam_tel}">
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
            
            	<input type="file", name="f_code" value="${acamping.f_code }" />
            	
              <img src="${contextPath }/resources/images/camping_bg_2.jpg" alt="Image" class="img-fluid" style="width:500px; height:500px;" />
            </div>
          </div>
          <div class="col-lg-4">
            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-leaf"></span>
                </span>
              <div class="feature-text">
                <h3 class="heading">캠핑 테마코드 선택</h3>
                <p class="text-black-50">
                  
					<input type="checkbox" name="thema_code", value= "연인">연인 &nbsp;
					<input type="checkbox" name="thema_code", value= "가족" >가족 &nbsp;
					<input type="checkbox" name="thema_code", value= "반려동물" >반려동물 &nbsp;
					<input type="checkbox" name="thema_code", value= "당일캠핑" >당일캠핑 &nbsp;
					
					<input type="checkbox" name="thema_code", value= "산/숲" >산/숲 &nbsp;
					<input type="checkbox" name="thema_code", value= "바다" >바다 &nbsp;
					<input type="checkbox" name="thema_code", value= "계곡" >계곡 &nbsp;
					<input type="checkbox" name="thema_code", value= "강/호수" >강/호수 &nbsp;
					<input type="checkbox" name="thema_code", value= "섬" >섬 &nbsp;
					<input type="checkbox" name="thema_code", value= "도심" >도심 &nbsp;
                  
                </p>
              </div>
            </div>

            <div class="d-flex feature-h">
              <span class="wrap-icon me-3">
                <span class="icon-check-square-o"></span>
              </span>
              <div class="feature-text">
                <h3 class="heading">캠핑 옵션코드 선택</h3>
                <p class="text-black-50">
                 
                	<input type="checkbox" name="option_code", value= "매점">매점 &nbsp;
					<input type="checkbox" name="option_code", value= "샤워장 및 화장실" >샤워장 및 화장실 &nbsp;
					<input type="checkbox" name="option_code", value= "개수대" >개수대 &nbsp;
					<input type="checkbox" name="option_code", value= "차박가능" >차박가능 &nbsp;
					<input type="checkbox" name="option_code", value= "물품대여" >물품대여 &nbsp;
					<input type="checkbox" name="option_code", value= "레저시설" >레저시설 &nbsp;
					
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
          
          <input type="file", name="f_code" value="${acamping.f_code }" />
          
            <img src="${contextPath }/resources/images/camping06.jpg" style="width: 500px; height: 500px;" alt="Image" class="img-fluid" />
          </div>
          <div class="col-md-4 mt-lg-5" data-aos="fade-up" data-aos-delay="100">
          
          <input type="file", name="f_code" value="${acamping.f_code }" />
          
            <img src="${contextPath }/resources/images/camping13.jpg" style="width: 500px; height: 500px; alt="Image" class="img-fluid" />
          </div>
          <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
          
          <input type="file", name="f_code" value="${acamping.f_code }" />
          
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
              <span class="number"
                ><span class="countup text-primary">
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
          
          <div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="700">
            <div class="counter-wrap mb-5 mb-lg-0">
              <span class="number"
                ><span style="color: black; size=70%">
                	
                	<input type="text", name="cam_start_time", value="${acamping.cam_start_time}">
                	
                </span></span>
              <span class="caption text-black-50">입실 시간 입력</span>
            </div>
          </div>
         
          <div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up" data-aos-delay="800">
            
            <div class="counter-wrap mb-5 mb-lg-0">
              <span class="number"><span style="color: black;">
                	
                	<input type="text", name="cam_finish_time", value="${acamping.cam_finish_time}" >
                	
                </span></span>
              <span class="caption text-black-50">퇴실 시간 입력</span>
            </div>
           </div>
            
             <div class="section">
     			 <div class="container">	
					<input type="radio" name="cam_hide" value="0" checked>숨김해제 &nbsp;
					<input type="radio" name="cam_hide" value="1" >숨김
				</div>
				
				<div>
				등록일&nbsp;&nbsp; ${acamping.cam_regdate }</td>
				수정일&nbsp;&nbsp; <input type="text" name="cam_modifydate" value="${acamping.cam_modifydate }" >
				</div>
				
            </div>
			
			
			<div class="text-center">
				<div class="box-footer">	
					<button type="submit" class="btn btn-success">SAVE</button>
					<button type="submit" class="btn btn-warning">CANCEL</button>
				</div>
			</div>		
            
        </div>
      </div>
    </div>
      </form>
    
  
	
	<form role="form" action="modifyPage" method="post">
		<input type='hidden' name='cam_code' value="${acamping.cam_code }">
		<input type='hidden' name='page' value="${cri.page }">
		<input type='hidden' name='perPageNum' value="${cri.perPageNum }">
		<input type='hidden' name='searchType' value="${cri.searchType }">
		<input type='hidden' name='keyword' value="${cri.keyword }">
	</form>
    
	<form id="code" method="get" action="${contextPath }/admin/campingrevinfo/c_revinfo">
  		<input type='hidden' name='cam_code' value="${acamping.cam_code}" >
  		
  	
   	</form>
   	
  
   
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
    
    
    <!-- /body -->
    
	<%@ include file="../../include/review.jsp" %>
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
    <%@ include file="../../include/plugin.jsp" %>
  </body>
</html>
