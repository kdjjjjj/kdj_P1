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
      Property &mdash; Free Bootstrap 5 Website Template by Untree.co
    </title>
<style type="text/css">
input[type=file]::file-selector-button {
  width: 150px;
  height: 30px;
  background: #fff;
  border: 1px solid rgb(77,77,77);
  border-radius: 10px;
  cursor: pointer;
  &:hover {
    background: rgb(77,77,77);
    color: #fff;
  }
}
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
            <h1 class="heading" data-aos="fade-up">회원가입</h1>

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
                  Properties
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
      		<form id="move" method="post" enctype="multipart/form-data">
      		<table class="table table-borderless" style="width: 60%; margin: auto; ">
      			<tr>
      				<td colspan="3">프로필사진</td>
      			</tr>
      			<tr>
      				<td><input type="file" id="profile" name="profile" accept="image/*" ></td>
      				<td><input class="btn btn-outline-info" type="button" id="thumnail" value="미리보기"></td>
      			</tr>
      			<tr id="showpro">
      				
      			</tr>
      			<tr>
      				<td><input class="form-control" type="text" id="id" name="id" placeholder="아이디"></td>
      				<td><input class="btn btn-outline-info" type="button" id="idchk" value="아이디 중복 체크"> </td>
      			</tr>
      			<tr>
      				<td><input class="form-control" type="password" id="pw" name="pw" placeholder="비밀번호"></td>
      			</tr>
      			<tr>
      				<td colspan="3" id="useridchk"></td>
      			</tr>
      			<tr>
      				<td colspan="3" id="userpwchk"></td>
      			</tr>
      			<tr>
      				<td><input class="form-control" type="text" id="name" name="name" placeholder="이름"></td>
      			</tr>
      			<tr>
      				<td><input class="form-control" type="text" id="nick" name="nick" placeholder="닉네임"></td>
      				<td><input class="btn btn-outline-info" type="button" id="nickchk" value="닉네임 중복 체크"></td>
      			</tr>
      			<tr>
      				<td><input class="form-control" type="date" id="birth" name="birth" max="${today}"></td>
      			</tr>
      			<tr>
      				<td><input class="form-control" type="text" id="phone" name="phone" placeholder="핸드폰번호"></td>
      			</tr>
      			<tr>
      				<td><input class="form-control" type="text" id="email" name="email" placeholder="이메일"></td>
      			</tr>
      			<tr>
      				<td id="usernamechk" colspan="2"></td>
      			</tr>
      			<tr>
      				<td id="usernickchk" colspan="2"></td>
      			</tr>
      			<tr>
      				<td id="userbrithchk" colspan="2"></td>
      			</tr>
      				<tr>
      				<td id="userphonechk" colspan="2"></td>
      			</tr>
      			<tr>
      				<td colspan="2"><input class="btn btn-outline-success" style="width: 100%" type="button" id="signup" value="회원가입"></td>
      			</tr>
      		</table>
      		<script type="text/javascript">
      		$(document).ready(function(){
      			
      			var date = new Date();
      			var year = date.getFullYear();
      			var month = date.getMonth()+1;
      			var day = date.getDate();
      			
      			
      			
      			console.log(year);
      			console.log(month);
      			console.log(day);
      			// 아이디 중복 체크
      			$("#idchk").click(function(){
      				var result = $("#useridchk");
  					var htmls = "";
  					result.html("");
          			var id = $("#id").val();
          			var idregex = new RegExp("^[a-z][0-9a-z]{5,11}$");
          			if(id == "" || id == null){
          				result.html("<p style='color:red;'>아이디를 입력해주세요</p>");
          			}else if(!(idregex.test(id))){
          				result.html("<p style='color:red;'>아이디는 소문자와 숫자를 조합해서 6~12자리 사이로 입력해주세요</p>");
          			}else{
          				var data = {"id":id};
          				
          				$.ajax({
              				url: "/page/idchk",
              				data: data,
              				dataType: "json",
              				type: "POST",
              				success: function(msg){
              					if(msg.chk == true){
              						htmls += "<p id='idok' style='color: green;'>사용가능한 아이디입니다</p>";
              					}else{
              						htmls += "<p style='color: red;'>중복된 아이디입니다</p>";
              					}
              					result.html(htmls);
              					
              					
              				},
              				error:function(){
              					alert("실패");
              				}
              			});
          			}
          		});// 아이디 중복 체크끝
          		
          		//비밀번호 체크
          		
          		$("#pw").blur(function(){
          			var result = $("#userpwchk");
  					var htmls = "";
  					result.html("");
          			var pw = $("#pw").val();
          			var reg = new RegExp("^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$");
          			if(!(reg.test(pw))){
          				result.html("<p  style='color:red;'>비밀번호는 영문 숫자 특수기호 조합 8자리 이상자리 사이로 입력해주세요</p>");
          			}else{
          				result.html("<p id='pwok' style='color: green;'>사용가능한 비밀번호입니다</p>")
          			}
          		});//비밀번호 체크끝
          		
          		
          		
          		// 섬네일화면 띄우기
      			$("#thumnail").click(function(){
      				
      				var formData = new FormData();
      				
      				var inputFile = $("input[name='profile']");
      				
      				
      				
      				var files = inputFile[0].files;
      				
      					if(!imgchk(files[0].name)){
      						return false;
      					}
      					formData.append("uploadFile", files[0]);
      					
      				
      				
		      			$.ajax({
		      				url: "/page/profileUpload",
		      				processData: false,
		      				contentType: false,
		      				data: formData,
		      				type: "POST",
		      				dataType: "json",
		      				success:function(result){
		      					showproFile(result);
		      				},
		      				error:function(result){
		      					alert("실패");
		      				}
		      			});
      			});
      			
      		});
      		
      		// 이미지 파일만 업로드 가능하게 하는 함수
      		
      		function imgchk(fileName){
      			var regex = new RegExp("(.*?)\.(png|jpg)");
      			
      			if(!(regex.test(fileName))){
  					alert("png, jpg타입의 파일만 프로필이미지로 사용 가능합니다.");
  					return false;
  				}
  				return true;
      		}
      		
      		//섬네일 화면 만들어서 
      		function showproFile(uploadResultArr){
      			var showpro = $("#showpro");
      			var str = "";
      			showpro.html(str);
//      			each의 경우 반복문이랑 같음
      			$(uploadResultArr).each(function(i, obj){
      				
      			var fileCallPath = encodeURIComponent("/s_"+obj.f_name);
      			str += "<td><img src='/page/showproFile?fileName=/"+fileCallPath+ "'></td>";
      			});
      			
      			showpro.append(str);
      		}
      		
      		//닉네임 중복체크
      		$("#nickchk").click(function(){
      			var result = $("#usernickchk");
					var htmls = "";
					result.html("");
      			var nick = $("#nick").val();
      			if(nick == "" || nick == null){
      				result.html("<p style='color:red;'>닉네임을 입력해주세요</p>");
      			}else{
      				var data = {"nick":nick};
      				
      				$.ajax({
          				url: "/page/nickchk",
          				data: data,
          				dataType: "json",
          				type: "POST",
          				success: function(msg){
          					if(msg.chk == true){
          						htmls += "<p id='nickok' style='color: green;'>사용가능한 닉네임입니다</p>";
          					}else{
          						htmls += "<p style='color: red;'>중복된 닉네임입니다</p>";
          					}
          					result.html(htmls);
          					
          					
          				},
          				error:function(){
          					alert("실패");
          				}
          			});
      			}
      		});// 닉네임 중복 체크끝
      		
      		//이름 작성여부체크
      		$("#name").blur(function(){
      			var result = $("#usernamechk");
				var htmls = "";
				result.html("");
				var reg = new RegExp("^[ㄱ-ㅣ가-힣]{2,4}$");
      			var name = $("#name").val();
      			if(!(reg.test(name))){
      				result.html("<p style='color:red;'>이름은 두글자이상 네글자이하 입력해주세요</p>");
      			}else{
      				result.html("<p id ='nameok' style='color: green;'></p>");
      			}
      		});//이름 작성여부체크 끝
      		
      		//생일 작성여부체크
      		$("#birth").blur(function(){
      			var result = $("#userbrithchk");
				var htmls = "";
				result.html("");
      			var birth = $("#birth").val();
      			if(birth == ""){
      				result.html("<p style='color:red;'>본인의 생년월일을 입력해주세요</p>");
      			}else if("${today}" < birth){
      				result.html("<p style='color:red;'>정확한 날짜를 입력해주세요</p>");
      			}else if("${year}-12-31" < birth){
      				result.html("<p style='color:red;'>성인만 회원가입이 가능합니다</p>");
	      		}else{
      				result.html("<p id = 'birthok' style='color:green;'></p>");
      			}
      		});//생일 작성여부체크 끝
      		
      		// 핸드폰 번호 유효성 및 작성여부 체크
      		$("#phone").blur(function(){
      			var result = $("#userphonechk");
				var htmls = "";
				result.html("");
      			var phone = $("#phone").val();
      			var reg = new RegExp("^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$");
      			if(!(reg.test(phone))){
      				result.html("<p style='color:red;'>옳바른 핸드폰번호를 입력해주세요</p>");
      			}else{
      				result.html("<p id = 'phoneok' style='color:green;'></p>");
      			}
      		});// 핸드폰 번호 유효성 및 작성여부 체크끝
      		
      		$("#signup").click(function(){
      			var move = $("#move");
      			var idchk = $("#idok");
      			var pwchk = $("#pwok");
      			var nickchk = $("#nickok");
      			var namechk = $("#nameok");
      			var birthok = $("#birthok");
      			var phonechk = $("#phoneok");
      			var inputFile2 = $("input[name='profile']");
  				var files2 = inputFile2[0].files;
  				if(files2[0] != null && !(imgchk(files2[0].name))){
  					return false;
  				}else if(idchk.val() == null){
      				alert("아이디 중복 체크를 확인해주세요");
      				$("#id").focus();
      				return false;
      			}else if(pwchk.val() == null){
      				alert("비밀번호를 확인해주세요");
      				$("#pw").focus();
      				return false;
      			}else if(namechk.val() == null){
      				alert("이름을 입력해주세요");
      				$("#name").focus();
      				return false;
      			}else if(nickchk.val() == null){
      				alert("닉네임 중복 체크를 확인해주세요");
      				$("#nick").focus();
      				return false;
      			}else if(birthok.val() == null){
      				alert("생일을 입력해주세요");
      				$("#birth").focus();
      				return false;
      			}else if(phonechk.val() == null){
      				alert("핸드폰 번호를 입력해주세요");
      				$("#phone").focus();
      				return false;
      			}else{
      				move.submit();
      			}
      		});
      		</script>
      		</form>
      		
      	</div>
      </div>
    </div>

	
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
