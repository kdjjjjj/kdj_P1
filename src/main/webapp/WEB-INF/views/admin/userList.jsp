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
    <%@ include file="/WEB-INF/views/include/head.jsp" %>

    <title>
    	회원조회
    </title>
<style type="text/css">
.pl{
    width: 200px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 12px 13px;
    font-family: 'Roboto';
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 16px;
}

.pl:focus{
    border: 1px solid #9B51E0;
    box-sizing: border-box;
    border-radius: 10px;
    outline: 3px solid #F8E4FF;
    border-radius: 10px;
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
    <%@ include file="/WEB-INF/views/include/top_menu.jsp" %>
	
	
	

    <div
      class="hero page-inner overlay"
      style="background-image: url('${contextPath}/resources/images/hero_bg_1.jpg')"
    >
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center mt-5">
            <h1 class="heading" data-aos="fade-up">회원전체조회</h1>

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
                  회원전체조회
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
      		<table class="table">
      			<tr>
      				<th>회원 아이디</th>
      				<th>회원 닉네임</th>
      				<th>회원 정지여부</th>
      				<th>체크박스</th>
      			</tr>
      			<c:if test="${list == null}">
      			<tr>
      				<td colspan="4">조회된 데이터가 없습니다.</td>
      			</tr>
      			</c:if>
      			<c:forEach items="${list }" var="list">
      			<tr>
      				<td>${list.id }</td>
      				<td>${list.nick }</td>
      				<c:choose>
      					<c:when test="${list.stop == 1 }">
      						<td colspan="2" style="color: red; font-weight: bold;">회원정지</td>
      					</c:when>
      					<c:when test="${list.stop == 0 }">
      						<td style="color: green; font-weight: bold;">이용가능</td>
      						<td><input type="checkbox" name="chk" value="${list.id }"></td>
      					</c:when>
      				</c:choose>
      			</tr>
      			</c:forEach>
      			<tr>
      			</tr>
      		</table>
      		<input class="btn btn-outline-danger" type="button" id="stop" value="회원정지">
      		<div class="text-center">
				<ul style="padding-left: 41%;" class="pagination">
					<c:if test="${pageMaker.prev }">
						<li class="page-item"><a class="page-link" href="userList?page=${pageMaker.startPage -1 }">&laquo;</a></li>
					</c:if>
					
					<c:forEach begin="${pageMaker.startPage }" 
						end="${pageMaker.endPage }" var="idx">
						<li class="page-item"<c:out value="${pageMaker.cri.page == idx?'class=active':'' }"/>>
							<a class="page-link" href="userList?page=${idx }">${idx }</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<li class="page-item">
							<a class="page-link" href="userList?page=${pageMaker.endPage+1 }">&raquo;</a>
						</li>
					</c:if>
				</ul>
			</div>
			<div>
				<form id="search" action="search" method="post">
					<table class="table">
						<tr>
							<td style="width: 20%">
								<select class="pl" id="selected" name="selected">
									<option value="all">전체</option>
									<option value="id">아이디</option>
									<option value="nick">닉네임</option>
								</select>
							</td>
							<td>
								<input style="width: 100%" class="form-control" type="text" name="type" id="type">
							</td>
							<td>
								<input class="btn btn-link"  type="button" id="check" value="검색">
							</td>
						</tr>
					</table>
				</form>
			</div>
      	</div>
      </div>
    </div>
	<script type="text/javascript">
		$("#stop").click(function(){
			var arr = [];
			$("input[name=chk]:checked").each(function(){
				arr.push($(this).val());
			});
			if(arr == ""){
				alert("선택된 회원이 없습니다");
			}else{
			var data = {"userList":arr}
				$.ajax({
					url:"${contextPath}/userStop",
					data:data,
					dataType:"json",
					type:"POST",
					success:function(result){
						if(result != null){
							alert(result.result);
							location.href="${contextPath}/userList";
						}
					},
					error:function(){
						alert("실패");
					}
				});
			}
		});
		$("#check").click(function(){
			var type = $("#selected option:selected").val();
			if($("#type").val() == ""){
				alert("조회할 아이디 혹은 닉네임을 입력해주세요");
			}else{
				$("#search").submit();
			}
		});
	</script>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <!-- /.site-footer -->

    <!-- Preloader -->
    <div id="overlayer"></div>
    <div class="loader">
      <div class="spinner-border" role="status">
        <span class="visually-hidden">Loading...</span>
      </div>
    </div>

	<!-- 플러그인 -->
    <%@ include file="/WEB-INF/views/include/plugin.jsp" %>
  </body>
</html>
