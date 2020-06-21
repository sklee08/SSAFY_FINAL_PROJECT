

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
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
<script type="text/javascript">


$(document).ready(function(){
	$('#bt_update').click(function(){        	
    	$.ajax({
			type:'PUT',
			url:'${root}user',
			headers:{"Content-Type":"application/json"},
			data:  JSON.stringify(
				 {
    				  id: $("#form input[name=id]").val(),
    				  name: $("#form input[name=name]").val(),
    				  pw: $("#form input[name=pw]").val(),
    				  address: $("#sido option:selected").html() + " " + $("#gugun option:selected").html() +" " + $("#dong option:selected").val(),
    				  phone: $("#form input[name=phone]").val(),
    				  sido: $("#sido").val(),
					  gugun: $("#gugun").val(),
					  dong: $("#dong").val(),
			     })
			    ,
			success:function(result){   
				alert("수정 성공, 다시 로그인 하시오.");				
			},
			error:function(){
				alert("수정 실패");
			}
		});
    });
});

</script>

<title>HappyHouse |  회원정보 수정</title>
</head>
<body>
<div class="main hc-element-invisible animated hc-element-visible fadeInUpSmall" data-animation-effect="fadeInUpSmall" data-effect-delay="100">
   <div class="form-block p-30 light-gray-bg border-clear">
      <h2 class="title">회원 정보 수정</h2>

      <form class="form-horizontal" action="${root}logout" method="get" id="form">
         <div class="form-group has-feedback row">
            <label for="inputName"
               class="col-md-3 control-label text-md-right col-form-label">아이디
               <span class="text-danger small">*</span>
            </label>
            <div class="col-md-8">
               <input type="text" class="form-control" id="inputName"
                  placeholder="" readonly="readonly" name="id" value="${userinfo.id}"> <i
                  class="fa fa-pencil form-control-feedback pr-4"></i>
            </div>
         </div>
         <div class="form-group has-feedback row">
            <label for="inputLastName"
               class="col-md-3 control-label text-md-right col-form-label">비밀번호
               <span class="text-danger small">*</span>
            </label>
            <div class="col-md-8">
               <input type="text" class="form-control" id="inputLastName"
                  placeholder="영문 숫자 포함 6자리 이상" value="${userinfo.pw}" name="pw"> <i
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
                  placeholder="User Name" value="${userinfo.name}" name="name"> <i
                  class="fa fa-user form-control-feedback pr-4"></i>
            </div>
         </div>
         <div class="form-group has-feedback row">
            <label for="inputEmail"
               class="col-md-3 control-label text-md-right col-form-label">주소
               <span class="text-danger small">*</span>
            </label>
             <!-- 주소 입력 -->
	         <div class="form-inline form-group col-md-8">
				시도 : &nbsp; <select id="sido" class="form-control col-3">
					<option value="0">선택</option>
				</select> &nbsp; 
				구군 : &nbsp; <select id="gugun" class="form-control col-3">
					<option value="0">선택</option>
				</select> &nbsp; 
				읍면동 : &nbsp; <select id="dong" class="form-control col-3">
					<option value="0">선택</option>
				</select> &nbsp; 
			 </div>
            <i class="fa fa-envelope form-control-feedback pr-4"></i>
            <!-- 주소 입력 -->
<%--              <div class="col-md-8">
               <input type="text" class="form-control" id="inputEmail"
                  placeholder="주소" value="${userinfo.address}" name="address"> <i
                  class="fa fa-envelope form-control-feedback pr-4"></i>
            </div> --%>
         </div>
         <div class="form-group has-feedback row">
            <label for="inputPassword"
               class="col-md-3 control-label text-md-right col-form-label">전화번호
               <span class="text-danger small">*</span>
            </label>
            <div class="col-md-8">
               <input type="text" class="form-control" id="inputPassword"
                  placeholder="010-xxx-xxxx" value="${userinfo.phone}" name="phone"> <i
                  class="fa fa-lock form-control-feedback pr-4"></i>
            </div>
         </div>

         <div class="form-group row">
            <div class="ml-md-auto col-md-9">
               <button type="submit"
                  class="btn btn-group btn-warning btn-animated" id="bt_update">
                  수정 <i class="fa fa-check"></i>
               </button>
            </div>
         </div>
      </form>
   </div>
</div>   
</body>
<script>
$(document).ready(function(){
	$.get("${pageContext.request.contextPath}/FSelectBoxController"
		,{command:"sido"}
		,function(data, status){
			$.each(data, function(index, vo) {
				if(vo.sido_code == ${userinfo.sido}){
					$("#sido").append("<option value='"+vo.sido_code+"' selected>"+vo.sido_name+"</option>");
					$("#sido").trigger("change");
				}else{
					$("#sido").append("<option value='"+vo.sido_code+"'>"+vo.sido_name+"</option>");					
				}
			});//each
		}//function
		, "json"
	);//get
});//ready
$(document).ready(function(){
	$("#sido").change(function() {
		$.get("${pageContext.request.contextPath}/FSelectBoxController"
				,{command:"gugun", sido:$("#sido").val()}
				,function(data, status){
					$("#gugun").empty();
					$("#gugun").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						if(vo.gugun_code ==  ${userinfo.gugun}){
							$("#gugun").append("<option value='"+vo.gugun_code+"' selected>"+vo.gugun_name+"</option>");
							$("#gugun").trigger("change");
						}else{
							$("#gugun").append("<option value='"+vo.gugun_code+"'>"+vo.gugun_name+"</option>");
						}			
					});//each
				}//function
				, "json"
		);//get
	});//change
	$("#gugun").change(function() {
		$.get("${pageContext.request.contextPath}/FSelectBoxController/dong"
				,{command:"dong", gugun:$("#gugun").val()}
				,function(data, status){
					$("#dong").empty();
					$("#dong").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						if(vo.dong == "${userinfo.dong}"){
							$("#dong").append("<option value='"+vo.dong+"' selected>"+vo.dong+"</option>");
							$("#dong").trigger("change");
						}else{
							$("#dong").append("<option value='"+vo.dong+"'>"+vo.dong+"</option>");
						}			
					});//each
				}//function
				, "json"
		);//get
	});//change
});//ready
</script>
</html>