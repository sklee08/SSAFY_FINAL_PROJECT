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
      <div id="readQnAForm">
      <h2>질문</h2>
      <table class="table table-bordered w-50">
        <tr>
          <th>번호</th>
          <td id="qna_no"></td>
        </tr>
        <tr>
          <th>글쓴이</th>
          <td id="qna_userid"></td>
        </tr>
        <tr>
          <th>제목</th>
          <td id="qna_title"></td>
        </tr>
        <tr>
          <th>날짜</th>
          <td id="qna_datetime"></td>
        </tr>
        <tr>
          <td colspan="2" id="qna_content"></td>
        </tr>
      </table>
      <br>
      <h2>답변</h2>
      <table class="table table-bordered w-50">
        <tr>
          <th>작성자</th>
          <td id="reply_userid"></td>
        </tr>
        <tr>
          <th>날짜</th>
          <td id="reply_datetime"></td>
        </tr>
        <tr>
          <td colspan="2" id="reply_content">
          </td>
        </tr>
      </table>
      <br>
      <div class="text-center">
        <button class="btn btn-primary">목록</button>
        <button class="btn btn-primary">수정</button>
        <button class="btn btn-primary">삭제</button>
      </div>
    </div>
</body>

<script>
function readQnA(no){
	$.ajax({
		type:'GET',
		url:'${root }qna/'+no,
		dataType:'json',
		success:function(data){
			console.log(data);
            $("#readQnAForm td[name=qna_no]").val(data.qna_no),
            $("#readQnAForm td[name=qna_userid]").val(data.qna_userid),
            $("#readQnAForm td[name=qna_title]").val(data.qna_title),
            $("#readQnAForm td[name=qna_datetime]").val(data.qna_datetime),
            $("#readQnAForm td[name=qna_content]").val(data.qna_content),
            $("#readQnAForm td[name=reply_userid]").val(data.reply_userid),
            $("#readQnAForm td[name=reply_datetime]").val(data.reply_datetime),
            $("#readQnAForm td[name=reply_content]").val(data.reply_content),
		}
    });
}

function searchParam(key) {
	  return new URLSearchParams(location.search).get(key);
};
readQnA(searchParam('no'));
</script>
</html>