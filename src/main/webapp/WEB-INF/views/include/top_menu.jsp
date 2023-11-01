<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<nav class="site-nav">
      <div class="container">
        <div class="menu-bg-wrap">
          <div class="site-navigation">
            <a href="${contextPath }/" class="logo m-0 float-start">Property</a>
            <ul
              class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end"
            >
              <c:if test="${user == null && admin == null}">
              <li><a href="${contextPath }/login">로그인</a></li>
              <li><a href="${contextPath }/signup">회원가입</a></li>
              </c:if>
              <c:if test="${user != null }">
              <li style="color: white;">${user.nick }님 환영합니다.</li>
              <li><a href="${contextPath }/logout">로그아웃</a></li>
              <li class="has-children">
              <a href="${contextPath }/edit">내 정보 수정</a>
                <ul class="dropdown">

                  <li><a href="${contextPath }/revlistPage">내 예약조회</a></li>
                  <li><a href="${contextPath }/jjimlistPage">내 찜목록</a></li>
                  <li><a href="${contextPath }/reviewlistPage">내 리뷰목록</a></li>
                  <li><a href="${contextPath }/couponlistPage">내 쿠폰함</a></li>

                </ul>
              </li>
              <li><a href="coupon_user">쿠폰목록</a></li>
              <li class="has-children">
              <a>고객센터</a>
              <ul class = "dropdown">
              	  <li><a href ="${contextPath }/onetoone/list1">1대1 문의사항</a></li>
              	  <li><a href ="${contextPath }/onetoone_reply/list2">1대1 문의사항 답변</a></li>
              </ul>
              </li>
              
              </c:if>
              
             
              <c:if test="${admin != null}">
              <li class="has-children">
              <a>고객센터</a>
              <ul class = "dropdown">
              	  <li><a href ="${contextPath }/onetoone/list1">1대1 문의사항</a></li>
              	  <li><a href ="${contextPath }/onetoone_reply/list2">1대1 문의사항 답변</a></li>
              </ul>
              </li>
               	 <li><a href="${contextPath }/logout">로그아웃</a></li>
               	 <li><a href="${contextPath }/userList">회원조회</a></li>
             	 <li><a href="${contextPath }/coupon">쿠폰</a></li>
              </c:if>
              
              <!-- sy수정 -->
              	<li>
	              	<c:if test="${admin != null}">
             		 <li><a href="${contextPath}/admin/scamping/list">캠핑장</a></li>
		             </c:if>
		             <c:if test="${admin==null }">
             		<a href="${contextPath}/scamping/list">캠핑장</a>
             		</c:if>
             	</li>
              <li><a href="${contextPath }/review/previewlistPage">리뷰</a></li>
              <li><a href ="${contextPath }/notice/list">공지사항</a></li>


            </ul>

            <a
              href="#"
              class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
              data-toggle="collapse"
              data-target="#main-navbar"
            >
              <span></span>
            </a>
          </div>
        </div>
      </div>
    </nav>