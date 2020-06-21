<%@page import="com.ssafy.happyhouse.model.dto.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>지도</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
	<div style="display: none" id="address">
		${userinfo.sido}  ${userinfo.gugun}  ${userinfo.dong}  
	</div>
	<div class="container">
		<!-- ======= Breadcrumbs ======= -->
		<section>
		<div>
			<div class="container">
				<div class="mt-2 mb-2">
					<h2><a href="${pageContext.request.contextPath}/search">거래 정보 검색 <i class="fas fa-search"></i></a></h2>
				</div>
			</div>
		</div>
		</section>
		<!-- End Breadcrumbs -->
		<!-- section start -->
		<section id="index_section">
			<div class="card col-sm-12 mt-1" style="min-height: 700px;">
				<div class="card-body">

<!-- here start -->
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
	
	$("#sido").change(function() {
		$.get("${pageContext.request.contextPath}/FSelectBoxController"
				,{command:"gugun", sido:$("#sido").val()}
				,function(data, status){
					$("#gugun").empty();
					$("#gugun").append('<option value="0">선택</option>');
					$.each(data, function(index, vo) {
						if(vo.gugun_code == ${userinfo.gugun}){
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
	$("#dong").change(function() {
		$.get("${pageContext.request.contextPath}/FSelectBoxController/apt"
				,{command:"apt", dong:$("#dong").val()}
				,function(data, status){
					//-- 녹지대 마커 띄우기
					console.log(data[0].dong);
					$.get("${pageContext.request.contextPath}/GreenZone"
							,{dong: data[0].dong}
							,function(data, status){
								$.each(data, function(index, no) {
									addGMarker(no.lat, no.lng, no.name);
								});
								console.log(data);
							}
							, "json"
					);
					//-- 녹지대 마커 띄우기
					//-- 환경 배출원 마커 띄우기
					console.log(data[0].dong);
					$.get("${pageContext.request.contextPath}/Emission"
							,{dong: data[0].dong}
							,function(data, status){
								console.log(data);
								e_geocode(data);
							}
							, "json"
					);
					//-- 환경 배출원 마커 띄우기
					geocode(data);
				}//function
				, "json"
		);//get
	});//change
});//ready
function geocode(jsonData) {
	let idx = 0;
	$.each(jsonData, function(index, vo) {
		let tmpLat;
		let tmpLng;
		$.get("https://maps.googleapis.com/maps/api/geocode/json"
				,{	key:'AIzaSyBduAA_vlUGbg0iGm9TWHz7lVO2rPIWDRs'
					, address:vo.dong+"+"+vo.aptName+"+"+vo.jibun
				}
				, function(data, status) {
					//alert(data.results[0].geometry.location.lat);
					tmpLat = data.results[0].geometry.location.lat;
					tmpLng = data.results[0].geometry.location.lng;
					$("#lat_"+index).text(tmpLat);
					$("#lng_"+index).text(tmpLng);
					addMarker(tmpLat, tmpLng, vo.aptName, vo.dong);
					if(index == 0){
						setZoom(tmpLat, tmpLng);
					}
				}
				, "json"
		);//get
	});//each
}
function e_geocode(jsonData) {
	let idx = 0;
	$.each(jsonData, function(index, vo) {
		let tmpLat;
		let tmpLng;
		$.get("https://maps.googleapis.com/maps/api/geocode/json"
				,{	key:'AIzaSyBduAA_vlUGbg0iGm9TWHz7lVO2rPIWDRs'
					, address:vo.address
				}
				, function(data, status) {
					//alert(data.results[0].geometry.location.lat);
					tmpLat = data.results[0].geometry.location.lat;
					tmpLng = data.results[0].geometry.location.lng;
					$("#lat_"+index).text(tmpLat);
					$("#lng_"+index).text(tmpLng);
					addEMarker(tmpLat, tmpLng, vo.name, vo.bizcode);
				}
				, "json"
		);//get
		if(index > 50) return false;
	});//each
}
</script>
<div style="text-align: center;">
시도 : <select id="sido">
	<option value="0">선택</option>
</select>
구군 : <select id="gugun">
	<option value="0">선택</option>
</select>
읍면동 : <select id="dong">
	<option value="0">선택</option>
</select>
</div>
<table class="table mt-2">
<!-- 	<thead>
		<tr>
			<th>번호</th>
			<th>법정동</th>
			<th>아파트이름</th>
			<th>지번</th>
			<th>지역코드</th>
			<th>위도</th>
			<th>경도</th>
		</tr>
	</thead> -->
	<tbody>
	</tbody>
</table>
<!-- here end -->
<!-- map start -->
<div id="map" style="width: 100%; height: 600px; margin: auto;"></div>
<script src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBduAA_vlUGbg0iGm9TWHz7lVO2rPIWDRs&callback=initMap"></script>
<script>
	var multi = {lat: 37.5665734, lng: 126.978179};
	var map;
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center: multi, zoom: 12
		});
		
		var marker = new google.maps.Marker({position: multi, map: map});
	}
	function addMarker(tmpLat, tmpLng, aptName, dong) {
		var houseIcon = new google.maps.MarkerImage("img/mapicon/houseIcon.png", null, null, null, new google.maps.Size(48,48));

		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
			label: aptName,
			title: aptName,
			icon: houseIcon
		});

		var vardong = dong;
		var varAptNm = aptName;
		marker.addListener('click', function() {
			callHouseDealInfo(vardong, varAptNm);
		});
		marker.setMap(map);
	}
	// 녹지대 마커 추가 함수
	function addGMarker(tmpLat, tmpLng, name) {
		var greenIcon = new google.maps.MarkerImage("img/mapicon/greenIcon.png", null, null, null, new google.maps.Size(48,48));

		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
			title: name,
			icon: greenIcon
		});
		marker.setMap(map);
	}
	// 환경 배출원 마커 추가 함수
	function addEMarker(tmpLat, tmpLng, name, type) {
		var myIcon;
		if(type==21){
			myIcon = new google.maps.MarkerImage("img/mapicon/airIcon.png", null, null, null, new google.maps.Size(32,32));
		}else if(type==22){
			myIcon = new google.maps.MarkerImage("img/mapicon/waterIcon.png", null, null, null, new google.maps.Size(32,32));	
		}else {
			myIcon = new google.maps.MarkerImage("img/mapicon/otherIcon.png", null, null, null, new google.maps.Size(32,32));
		}
		
		var marker = new google.maps.Marker({
			position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
			title: name,
			icon: myIcon
		});
		marker.setMap(map);
	}
	function setZoom(tmpLat, tmpLng) {
		map.setZoom(15.5);
		map.setCenter(new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)));
	}
	function callHouseDealInfo(vardong, varAptNm) {
		location.href="${pageContext.request.contextPath}/search?act=detail&dong=+"+vardong+"&aptName="+varAptNm;
	}
	
</script>
<!-- map end -->

				</div>
			</div>
		</section>
		<!-- section end -->
<!-- 		<footer class="col-ms-12 bg-dark rounded mt-1"></footer> -->
	</div>
</body>
</html>
