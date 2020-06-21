<%@page import="com.ssafy.happyhouse.model.dto.UserInfo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<c:url value="/" var="root" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	<%
		UserInfo userInfo = (UserInfo)session.getAttribute("userinfo");
	%>
	<a href="${root}logout">로그아웃</a>
	<a href="${root}mvlist/<%=userInfo.getId()%>">회원정보 조회</a>
	<a href="${root}mvupdate/<%=userInfo.getId()%>">회원정보 수정</a>
	<a href="${root}logout" onclick="javascript:btn()">회원정보 삭제</a>
	<br>
</body>

<script>
	function btn(){
		$.ajax({
			type:'DELETE',
			url:'${root}user/<%=userInfo.getId()%>',    			
			success:function(data){
				alert("삭제 성공");
			},
			error:function(){
				alert("삭제 실패");
			}
		  });
	}
	

</script>
</html>