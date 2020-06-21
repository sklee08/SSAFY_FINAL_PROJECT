
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<script>
$(document).ready(function(){
	$('#btn').click(function(){        	
    	$.ajax({
			type:'GET',
			url:'${root}user/'+$("#form input[name=id]").val(),
			dataType:'json',
			success:function(result){ 				
				if(result.status){
					alert("조회 성공! 비밀 번호는 "+result.data.pw+" 입니다.");
				}else{
					alert("추가 실패");	
				}				
			},
			error:function(){
				alert("추가 실패");
			}
		});
    });
});

</script>

<title>HappyHouse |  비밀번호 찾기</title>
</head>
<body>
<div class="main hc-element-invisible animated hc-element-visible fadeInUpSmall" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
   <div class="form-block p-30 light-gray-bg border-clear">
      <h2 class="title">비밀번호 찾기</h2>

      <form class="form-horizontal" action="${root}logout" method="get" id="form">
         <input type="hidden" name="act" value="findpw">
         <div class="form-group has-feedback row">
            <label for="inputName"
               class="col-md-3 control-label text-md-right col-form-label">아이디
               <span class="text-danger small">*</span>
            </label>
            <div class="col-md-8">
               <input type="text" class="form-control" id="inputName"
                  placeholder="" required="" name="id"> <i
                  class="fa fa-pencil form-control-feedback pr-4"></i>
            </div>
         </div>
         
         <div class="form-group has-feedback row">
            <label for="inputUserName"
               class="col-md-3 control-label text-md-right col-form-label">이름
               <span class="text-danger small">*</span>
            </label>
            <div class="col-md-8">
               <input type="text" class="form-control" id="inputUserName"
                  placeholder="User Name" required="" name="name"> <i
                  class="fa fa-user form-control-feedback pr-4"></i>
            </div>
         </div>
         
         <div class="form-group has-feedback row">
            <label for="inputEmail"
               class="col-md-3 control-label text-md-right col-form-label">주소
               <span class="text-danger small">*</span>
            </label>
            <div class="col-md-8">
               <input type="text" class="form-control" id="inputEmail"
                  placeholder="주소" required="" name="address"> <i
                  class="fa fa-envelope form-control-feedback pr-4"></i>
            </div>
         </div>
         <div class="form-group has-feedback row">
            <label for="inputPassword"
               class="col-md-3 control-label text-md-right col-form-label">전화번호
               <span class="text-danger small">*</span>
            </label>
            <div class="col-md-8">
               <input type="text" class="form-control" id="inputPassword"
                  placeholder="010-xxx-xxxx" required="" name="phone"> <i
                  class="fa fa-lock form-control-feedback pr-4"></i>
            </div>
         </div>

         <div class="form-group row">
            <div class="ml-md-auto col-md-9">
               <button type="submit"
                  class="btn btn-group btn-warning btn-animated" id="btn">
                  찾기 <i class="fa fa-check"></i>
               </button>
            </div>
         </div>
      </form>
   </div>
</div>   
</body>
</html>