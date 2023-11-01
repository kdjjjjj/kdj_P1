<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="section sec-testimonials">
      <div class="container">
        <div class="row mb-5 align-items-center">
          <div class="col-md-6">
            <h2 class="font-weight-bold heading text-primary mb-4 mb-md-0">
              사용자 리뷰
            </h2>
          </div>
          <div class="col-md-6 text-md-end">
            <div id="testimonial-nav">
              <span class="prev" data-controls="prev">이전</span>

              <span class="next" data-controls="next">다음</span>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-4"></div>
        </div>
        <div class="testimonial-slider-wrap">
          <div class="testimonial-slider">
          
          	<c:forEach var="list" items="${rrdto}">
          	
          	
            <div class="item">
              <div class="testimonial">
                
                <div class="rate">
                <c:forEach begin="1" end="${list.r_star}">
                  <span class="icon-star text-warning"></span>
                </c:forEach>
       
                </div>
                <h3 class="h5 text-primary mb-4">${list.id }</h3>
                <blockquote>
                  <p>
                    ${list.r_content}
                  </p>
                </blockquote>
                <p class="text-black-50">리뷰작성일 : ${list.r_w_date}</p>
                <p class="text-black-50">신고수 : ${list.r_declaration}</p>
              </div>
            </div>
			</c:forEach>
			
          </div>
        </div>
      </div>
    </div>