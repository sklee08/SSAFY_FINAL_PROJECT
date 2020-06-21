<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<style type="text/css">
	#container {
		width: 900px;
		padding: 20px;
		margin: 0 auto;
		text-align: center;
	}
	header {
		padding: 20px;
		margin-bottom: 20px;
	}
	aside {
		width: 400px;
		margin-bottom: 20px;
		float: right;
	}
	section {
		width: 350px;
		margin-bottom: 20px;
		float: left;
		text-align: left;
	}
	footer{
		clear: both;
	}
</style>
</head>
<body>
<div id=container>
	<header><h1>${house_detail.aptName } 상세</h1></header>
	<p><a href="${pageContext.request.contextPath}/search">뒤로 가기</a></p>
	<section>
		<table class="table table-bordered w-500 table-condensed">
		<tr>
			<td><b>주택명</b></td>
			<td>${house_detail.aptName }</td>
		</tr>
		<tr>
			<td><b>건축연도</b></td>
			<td>${house_detail.buildYear }</td>
		</tr>
		<tr>
			<td><b>법정동</b></td>
			<td>${house_detail.dong }</td>
		</tr>
		<tr>
			<td><b>지번</b></td>
			<td>${house_detail.jibun }</td>
		</tr>
		<tr>
			<td><b>위도</b></td>
			<td id="lat">${house_detail.lat }</td>
		</tr>
		<tr>
			<td><b>경도</b></td>
			<td id="lng">${house_detail.lng }</td>
		</tr>
	</table>
	</section>
	<aside>
	<b>이미지</b><br>
	<br>
	<img src="img/${house_detail.img }" width="250" height="250" onerror="this.src='img/다세대주택.jpg'"/>
	</aside>
	<footer>
<!-- here start -->
<div id="map" style="width: 70%; height: 500px; margin: auto;"></div>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBduAA_vlUGbg0iGm9TWHz7lVO2rPIWDRs&callback=initMap"></script>
<script>
	var multi = {lat: ${house_detail.lat }, lng: ${house_detail.lng }};
	var map;
	function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center: multi, zoom: 17
		});
		let houseIcon = new google.maps.MarkerImage("img/mapicon/houseIcon.png", null, null, null, new google.maps.Size(48,48));
		var marker = new google.maps.Marker({position: multi, map: map, 
			icon: houseIcon, title: '${house_detail.aptName }'});
	}
</script>
<!-- here end -->
		
	</footer>
</div>

</body>
</html>