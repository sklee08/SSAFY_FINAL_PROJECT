<%@page import="com.ssafy.happyhouse.model.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<% 
	UserInfo ui = (UserInfo)session.getAttribute("userinfo");
	%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<body>
<c:url value="/" var="root"></c:url>
  <div id="qna">
    <div class="form-group">
      <label for="qna_userid">질문 작성자</label>
      <input type="text" class="form-control" id="qna_userid" value="${userinfo.id}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="qna_title">제목</label>
      <input type="text" class="form-control" id="qna_title" placeholder="제목을 입력하세요">
    </div>
    <div class="form-group">
      <label for="qna_content">내용</label>
      <textarea class="form-control" id="qna_content" placeholder="내용을 입력하세요"></textarea>
    </div>
    <div class="text-right">
      <button class="btn btn-primary" id="createQnA" onclick="location.href='${root}#qna'">등록</button>
      <button class="btn btn-primary" onclick="location.href='${root}main'">목록</button>
    </div>
  </div>
  
</body>

<script>
$("#createQnA").on("click", function() {
	$.ajax({
		type : "post",
		contentType:"application/json;charset=utf-8",
		url : "${root}qna",
		data : formToJson(),
		success : function(result) {
			alert(result);
		},
		error : function() {
			alert("QnA 입력 실패");
		}
	});
});

function formToJson() {
	let obj = {};
	let fields = $(".form-control");
	$.each(fields, function(idx, field) {
		obj[field.id] = field.value;
	});
	console.log(JSON.stringify(obj));
	return JSON.stringify(obj);
}
</script>
</html>