<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<script>
	function btn(){
		alert("삭제되었습니다.");
	}

</script>
<title>Insert title here</title>
</head>
<body>
	<h1 class="title">회원 정보 확인</h1>
	<c:url value="/" var="root" />
	<c:choose>
		<c:when test="${userinfo eq null }">
			<!-- null 인 경우 -->
			<a href="{root}mvfindpw"> 잘못된 정보입니다. 다시 입력하세요. </a>
		</c:when>
		<c:otherwise>
		
			<div class="container" align="center">
   <div class="col-lg-6" align="center">
      <form id="memberform" method="post" action="">
      <input type="hidden" name="act" id="act" value="register">
         <div class="form-group" align="left">
            <label for="name" >이름<span class="text-danger small">*</span></label>
            <input type="text" class="form-control" id="name" name="name" value="${userinfo.name}" readonly>
         </div>
         <div class="form-group" align="left">
            <label for="">아이디<span class="text-danger small">*</span></label>
            <input type="text" class="form-control" id="id" name="id" value="${userinfo.id}" readonly>
         </div>
         <div class="form-group" align="left">
            <label for="">비밀번호<span class="text-danger small">*</span></label>
            <input type="text" class="form-control" id="pw" name="pw" value="${userinfo.pw}" readonly>
         </div>
         
         <div class="form-group" align="left">
            <label for="">주소<span class="text-danger small">*</span></label>
            <input type="text" class="form-control" id="pw" name="pw" value="${userinfo.address}" readonly>
         </div>
         
         <div class="form-group" align="left">
            <label for="">전화번호<span class="text-danger small">*</span></label>
            <input type="text" class="form-control" id="pw" name="pw" value="${userinfo.phone}" readonly>
         </div>
         
         <br> <p align="center"><a href="${root}main">메인페이지</a></p>                  
      </form>
   </div>
</div>				
		<br>
		
		</c:otherwise>
	</c:choose>
	
</body>
</html>