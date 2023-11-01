<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="section">
      <div class="container">
      <!-- 인기있는 종목들  -->
      
        <div class="row mb-5 align-items-center">
          <div class="col-lg-6">
            <h2 class="font-weight-bold text-primary heading">
              강력추천 캠핑장
            </h2>
          </div>
          <div class="col-lg-6 text-lg-end">
            <p>
              <a
                href="${contextPath }/camping/list"
                target="_blank"
                class="btn btn-primary text-white py-3 px-4"
                >더 많은 캠핑장 보기</a
              >
            </p>
          </div>
        </div>
		<div class="row">
          <div class="col-12">
            <div class="property-slider-wrap">
              <div class="property-slider">
              
              	<c:forEach items="${camList }" var="list">
              		<div class="property-item">
                  <a href="property-single.html" class="img">
                    <img src="/page/resources/images/${list.f_code }.jpg" alt="Image" class="img-fluid" />
                  </a>

                  <div class="property-content">
                    <div class="price mb-2"><span>${list.cam_name }</span></div>
                    <div>
                      <span class="d-block mb-2 text-black-50"
                        >${list.cam_address }</span
                      >

                      <div class="specs d-flex mb-4">
                        <span class="d-block d-flex align-items-center me-3">
                          <span class="caption">${list.cam_start_time }</span>
                        </span>
                        <span class="d-block d-flex align-items-center">
                          <span class="caption">${list.cam_finish_time }</span>
                        </span>
                      </div>

					
					
                      <a
                        href="/page/camping/detail?cam_code=${list.cam_code }"
                        class="btn btn-primary py-2 px-3"
                        > 캠핑장 보러가기</a
                      >
                    </div>
                  </div>
                </div>
              	</c:forEach>
              </div>
              <div
                id="property-nav"
                class="controls"
                tabindex="0"
                aria-label="Carousel Navigation"
              >
                <span
                  class="prev"
                  data-controls="prev"
                  aria-controls="property"
                  tabindex="-1"
                  >이전</span
                >
                <span
                  class="next"
                  data-controls="next"
                  aria-controls="property"
                  tabindex="-1"
                  >다음</span
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>