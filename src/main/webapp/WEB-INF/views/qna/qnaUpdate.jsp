<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div id="updateQnAForm">
      <h2>질문</h2>
      <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" class="form-control" id="qna_userid" placeholder="작성자를 입력하세요">
      </div>
      <div class="form-group">
        <label for="title">제목</label>
        <input type="text" class="form-control" id="qna_title" placeholder="제목을 입력하세요">
      </div>
      <div class="form-group">
        <label for="content">내용</label>
        <textarea type="text" class="form-control" id="qna_content" placeholder="내용을 입력하세요"></textarea>
      </div>
      <br>
      <h2>답변</h2>
      <div class="form-group">
        <label for="title">작성자</label>
        <input type="text" class="form-control" id="reply_userid" placeholder="작성자를 입력하세요">
      </div>
      <div class="form-group">
        <label for="reply_content">내용</label>
        <textarea type="text" class="form-control" id="reply_content" placeholder="내용을 입력하세요"></textarea>
      </div>
      <br>
      <div class="text-right">
        <button class="btn btn-primary" id="updateQnA">수정</button>
        <button class="btn btn-primary">목록</button>
      </div>
    </div>
</body>

<script>
$("#updateQnA").on("click", function() {
	$.ajax({
		type : "put",
		contentType:"application/json;charset=utf-8",
		url : "${root}qna",
		data : formToJson(),
		success : function(result) {
			if (result.status) {
				alert(result.data);
			} else {
				alert("QnA 수정 실패");
			}
		},
		error : function() {
			alert("QnA 수정 실패");
		}
	});
});

function formToJson() {
	let obj = {};
	let fields = $("#updateQnAForm>.form-control");
	$.each(fields, function(idx, field) {
		obj[field.id] = field.value;
	});
	return JSON.stringify(obj);
}
</script>
</html>