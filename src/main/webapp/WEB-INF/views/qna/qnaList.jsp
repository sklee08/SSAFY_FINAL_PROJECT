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
<c:url value="/" var="root"></c:url>
  <div style="width: 70%; margin: 0 auto;">
    <div id="qnaList">
    </div>
    <div class="text-right">
      <%-- <button class="btn btn-primary" onclick="location.href='${root}qnaCreate'">등록</button> --%>
      <button class="btn btn-primary" id="create">등록</button>
    </div>
  </div>
  
  <div id="qnaCreate" style="display: none; width: 70%; margin: 0 auto;">
    <div class="form-group">
      <label for="qna_userid">질문 작성자</label>
      <input type="text" class="form-control" name="qna_userid" id="qna_userid" value="${userinfo.id}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="qna_title">제목</label>
      <input type="text" class="form-control" name="qna_title" id="qna_title" placeholder="제목을 입력하세요">
    </div>
    <div class="form-group">
      <label for="qna_content">내용</label>
      <textarea class="form-control" name="qna_content" id="qna_content" placeholder="내용을 입력하세요"></textarea>
    </div>
    <div class="text-right">
      <%-- <button class="btn btn-primary" id="createQnA" onclick="location.href='${root}#qna'">등록</button> --%>
      <button class="btn btn-primary" id="createQnA">등록</button>
      <button class="btn btn-primary" id="createQnaBackList" onclick="location.href='${root}#qna'">목록</button>
    </div>
  </div>
  
  <div id="readQnAForm" style="display: none; width: 70%; margin: 0 auto;">
      <h2>질문</h2>
      <table class="table table-bordered w-50">
        <tr>
          <th>번호</th>
          <td headers="qna_no"></td>
        </tr>
        <tr>
          <th>글쓴이</th>
          <td headers="qna_userid"></td>
        </tr>
        <tr>
          <th>제목</th>
          <td headers="qna_title"></td>
        </tr>
        <tr>
          <th>날짜</th>
          <td headers="qna_datetime"></td>
        </tr>
        <tr>
          <td colspan="2" headers="qna_content"></td>
        </tr>
      </table>
      <br>
      <h2>답변</h2>
      <table class="table table-bordered w-50" id="replyTable">
        <tr>
          <th>작성자</th>
          <td headers="reply_userid"></td>
        </tr>
        <tr>
          <th>날짜</th>
          <td headers="reply_datetime"></td>
        </tr>
        <tr>
          <td colspan="2" headers="reply_content">
          </td>
        </tr>
      </table>
      <br>
      <div class="text-center">
        <button class="btn btn-primary" id="backList" onclick="location.href='${root}#qna'">목록</button>
        <button class="btn btn-primary" id="userUpdate">수정</button>
        <button class="btn btn-primary" id="update" onclick="location.href='${root}#qna'">답변 달기</button>
        <button class="btn btn-primary" id="delete" onclick="location.href='${root}#qna'">삭제</button>
      </div>
    </div>
    
    
    <div id="updateQnAForm" style="display: none; width: 70%;" class="container">
      <h2>질문</h2>
      <div class="form-group">
        <label for="writer">글 번호</label>
        <input type="text" class="form-control" name="qna_no" id="qna_no" readonly="readonly">
      </div>
      <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" class="form-control" name="qna_userid" id="qna_userid" readonly="readonly">
      </div>
      <div class="form-group">
        <label for="title">제목</label>
        <input type="text" class="form-control" name="qna_title" id="qna_title" readonly="readonly">
      </div>
      <div class="form-group">
        <label for="content">내용</label>
        <textarea type="text" class="form-control" name="qna_content" id="qna_content" readonly="readonly"></textarea>
      </div>
      <br>
      <h2>답변</h2>
      <div class="form-group">
        <label for="title">작성자</label>
        <input type="text" class="form-control" name="reply_userid" id="reply_userid" value="${userinfo.id}" readonly="readonly">
      </div>
      <div class="form-group">
        <label for="reply_content">내용</label>
        <textarea type="text" class="form-control" name="reply_content" id="reply_content" placeholder="내용을 입력하세요"></textarea>
      </div>
      <br>
      <div class="text-right">
        <button class="btn btn-primary" id="updateQnA">답변 등록</button>
        <button class="btn btn-primary" id="updateBackList" onclick="location.href='${root}#qna'">목록</button>
      </div>
    </div>
    
    
    <div id="userQnAForm" style="display: none; width: 70%;" class="container">
      <h2>질문</h2>
      <div class="form-group">
        <label for="writer">글 번호</label>
        <input type="text" class="form-control" name="qna_no" id="qna_no" readonly="readonly">
      </div>
      <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" class="form-control" name="qna_userid" id="qna_userid" readonly="readonly">
      </div>
      <div class="form-group">
        <label for="title">제목</label>
        <input type="text" class="form-control" name="qna_title" id="qna_title">
      </div>
      <div class="form-group">
        <label for="content">내용</label>
        <textarea type="text" class="form-control" name="qna_content" id="qna_content"></textarea>
      </div>
      
      <br>
      <div class="text-right">
        <button class="btn btn-primary" id="userQnA" onclick="location.href='${root}#qna'">수정</button>
        <button class="btn btn-primary" id="userBackList" onclick="location.href='${root}#qna'">목록</button>
      </div>
    </div>
  
</body>

<script>
function loadQnAList() {
	$.ajax({
		type : "get",
		url : "${root}qna",
		success : function(result) {
			var htmlTxt = '<table class="table table-bordered table-condensed"><tr><th>제목</th><th>작성자</th><th>날짜</th></tr>';
			$("#qnaList").empty();
			$.each(result, function(idx, item) {
				 htmlTxt += '<tr>'
                 +'<td><a href="javascript:showForm('+item.qna_no+')">'+ item.qna_title +'</td>'
                 +'<td>'+ item.qna_userid +'</td>'
                 +'<td>' + item.qna_datetime + '</td></tr>';
			});
			htmlTxt+='</table>'
			$('#qnaList').html(htmlTxt);
		},
		error : function() {
			alert("서버 이상으로 목록 조회에 실패하였습니다. 잠시후 다시 시도해주세요.");
			
		}
	});
}

loadQnAList();

$(document).ready(function(){
	$('#create').click(function(){
		$('#qnaList').hide();
		$('#qnaCreate').show(500);
		$('#create').hide();
	});
	
	$('#updateBackList').click(function(){
		$('#updateQnAForm').hide();
	});
	
	$('#createQnaBackList').click(function(){
		$('#qnaCreate').hide();
		$('#qnaList').show(500);
		$('#create').show(500);
	});
	
	
	$('#delete').click(function(){
		$.ajax({
			type:'DELETE',
			url:'${root}qna/'+$('#readQnAForm td[headers=qna_no]').html(),    			
			success:function(data){
				alert("삭제 성공");
				$('#readQnAForm').hide();
				loadQnAList();
			},
			error:function(){
				alert("삭제 실패");
				
			}
		  });	
	});
	
	$('#backList').click(function(){
		$('#readQnAForm').hide();
		$('#create').show(500);
	});
	
	$('#userBackList').click(function(){
		$('#readQnAForm').hide();
		$('#create').show(500);
	});
	
	$('#update').click(function(){
		updateForm($('#readQnAForm td[headers=qna_no]').html());
	});
	
	$('#userUpdate').click(function(){
		updateUserForm($('#readQnAForm td[headers=qna_no]').html());
	});
	
	$("#updateQnA").on("click", function() {
		$.ajax({
			type : "put",
			contentType:"application/json;charset=utf-8",
			url : "${root}qna",
			data : JSON.stringify(
   				 {
   					qna_no: $("#updateQnAForm input[name=qna_no]").val(),
   				  qna_userid: $("#updateQnAForm input[name=qna_userid]").val(),
   				  qna_title: $("#updateQnAForm input[name=qna_title]").val(),
   				  qna_content: $("#updateQnAForm textarea[name=qna_content]").val(),
   				  reply_userid: $("#updateQnAForm input[name=reply_userid]").val(),
   				  reply_content: $("#updateQnAForm textarea[name=reply_content]").val()
			     })
			     ,
			success : function(result) {
				alert("답변 등록 성공");
				loadQnAList();
				$('#updateQnAForm').hide();
			},
			error : function() {
				alert("QnA 수정 실패");
			}
		});
	});
	
	$("#userQnA").on("click", function() {
		$.ajax({
			type : "put",
			contentType:"application/json;charset=utf-8",
			url : "${root}qna",
			data : JSON.stringify(
   				 {
   					qna_no: $("#userQnAForm input[name=qna_no]").val(),
   				  qna_userid: $("#userQnAForm input[name=qna_userid]").val(),
   				  qna_title: $("#userQnAForm input[name=qna_title]").val(),
   				  qna_content: $("#userQnAForm textarea[name=qna_content]").val()
			     })
			     ,
			success : function(result) {
				alert("수정 성공");
				loadQnAList();
				$('#userQnAForm').hide();
			},
			error : function() {
				alert("QnA 수정 실패");
			}
		});
	});

	
	$("#createQnA").on("click", function() {
		$.ajax({
			type : "post",
			contentType:"application/json;charset=utf-8",
			url : "${root}qna",
			data : JSON.stringify(
   				 {
   					qna_userid: $("#qnaCreate input[name=qna_userid]").val(),
   					qna_title: $("#qnaCreate input[name=qna_title]").val(),
   					qna_content: $("#qnaCreate textarea[name=qna_content]").val()
			     }),
			success : function(result) {
				alert("등록에 성공하였습니다.");
				loadQnAList();
				$('#qnaList').show(500);
				$('#qnaCreate').hide();
				$('#create').show(500);
				
			},
			error : function() {
				alert("QnA 입력 실패");
			}
		});
	});
});

function updateUserForm(no){
	$('#userQnAForm').show(500);
	$('#updateQnAForm').hide();
	$('#readQnAForm').hide();
	
	$.ajax({
		type:'GET',
		url:'${root}qna/'+no,
 		dataType:'json',
		success:function(data){
			$("#userQnAForm input[name=qna_no]").val(data.qna_no);
            $("#userQnAForm input[name=qna_userid]").val(data.qna_userid);
            $("#userQnAForm input[name=qna_title]").val(data.qna_title);
            $("#userQnAForm textarea[name=qna_content]").val(data.qna_content);
		},
		error : function() {
			alert("잠시 서버 이상으로 사용자 목록 조회 실패. 잠시후 다시 시도?");
		}
		
    });
}

function updateForm(no){
	$('#updateQnAForm').show(500);	
	$('#readQnAForm').hide();
	$.ajax({
		type:'GET',
		url:'${root}qna/'+no,
 		dataType:'json',
		success:function(data){
			$("#updateQnAForm input[name=qna_no]").val(data.qna_no);
            $("#updateQnAForm input[name=qna_userid]").val(data.qna_userid);
            $("#updateQnAForm input[name=qna_title]").val(data.qna_title);
            $("#updateQnAForm textarea[name=qna_content]").val(data.qna_content);
            /* $("#updateQnAForm input[name=reply_userid]").val(data.reply_userid); */
            $("#updateQnAForm textarea[name=reply_content]").val(data.reply_content);
		},
		error : function() {
			alert("잠시 서버 이상으로 사용자 목록 조회 실패. 잠시후 다시 시도?");
		}
		
    });
}

function showForm(no){	
	$.ajax({
		type:'GET',
		url:'${root}qna/'+no,
 		dataType:'json',
		success:function(data){
            $('#readQnAForm td[headers=qna_no]').html(data.qna_no);
            $("#readQnAForm td[headers=qna_userid]").html(data.qna_userid);
            $("#readQnAForm td[headers=qna_title]").html(data.qna_title);
            $("#readQnAForm td[headers=qna_datetime]").html(data.qna_datetime);
            $("#readQnAForm td[headers=qna_content]").html(data.qna_content);
            
            if("${userinfo.id}" != data.qna_userid){
            	if(data.reply_userid == null){
            		$('#delete').hide();
                	$('#update').show(500);
                	$('#userUpdate').hide();
            	}else{
            		$('#update').hide();    
            		$('#delete').hide();
            		$('#userUpdate').hide();
            	}
        	}else{
        		$('#delete').show(500);
        		$('#update').hide();
        		$('#userUpdate').show(500);
        	}
            
            if(data.reply_userid != null){
            	$('#replyTable').show(500);
            	$("#readQnAForm td[headers=reply_userid]").html(data.reply_userid);
            	$("#readQnAForm td[headers=reply_datetime]").html(data.reply_datetime);	
            	$("#readQnAForm td[headers=reply_content]").html(data.reply_content);
            }else{
            	$('#replyTable').hide();
            }
            
		},
		error : function() {
			alert("잠시 서버 이상으로 사용자 목록 조회 실패. 잠시후 다시 시도?");
		}
		
    });
	
	$('#readQnAForm').show(500);
}

</script>
</html>