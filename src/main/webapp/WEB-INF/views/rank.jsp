<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns='http://www.w3.org/1999/xhtml'>
<head>
<style>
body {
	font-size: 12px;
	background: #FFF;
	color: #333;
	margin: 0;
}

#content {
	margin: 20px;
	padding: 10px;
	background: #393;
}

#rank-list a {
	color: #FFF;
	text-decoration: none;
}

#rank-list a:hover {
	text-decoration: underline;
}

#rank-list {
	overflow: hidden;
	width: 160px;
	height: 20px;
	margin: 0;
}

#rank-list dt {
	display: none;
}

#rank-list dd {
	position: relative;
	margin: 0;
}

#rank-list ol {
	position: absolute;
	top: 0;
	left: 0;
	margin: 0;
	padding: 0;
	list-style-type: none;
}

#rank-list li {
	height: 20px;
	line-height: 20px;
}
</style>
<title>Real-time Rank</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"
	type="text/javascript"></script>
<c:url value="/" var="root" />
</head>
<body>
	<div id="content">
		<h3 style="color:white" >실시간 검색어</h3>
		<dl id="rank-list">
			<dt>실시간 급상승 검색어</dt>
			<dd>
				<ol>
					<li><a href="#">1 순위</a></li>
					<li><a href="#">2 순위</a></li>
					<li><a href="#">3 순위</a></li>
					<li><a href="#">4 순위</a></li>
					<li><a href="#">5 순위</a></li>
					<li><a href="#">6 순위</a></li>
					<li><a href="#">7 순위</a></li>
					<li><a href="#">8 순위</a></li>
					<li><a href="#">9 순위</a></li>
					<li><a href="#">10 순위</a></li>
				</ol>
			</dd>
		</dl>
	</div>
</body>

<script>
	function loadRankList() {
		$.ajax({
			type : "get",
			url : "${root}rank",
			success : function(result) {
				var htmlTxt = '<dt>실시간 급상승 검색어</dt><dd><ol>';
				$("#rank-list").empty();
				/* $.each(result, function(idx, item) {
					console.log(idx, item);
					htmlTxt += '<li><a href="#">' + (idx + 1) + '위: '
							+ item.keyword + ' 횟수: ' + item.cnt + '회'
							+ '</a></li>';
				}); */
				$.each(result, function(idx, item) {
					console.log(idx, item);
					htmlTxt += '<li><a href="http://localhost:8080/search?act=search&by='+item.attribute+'&keyword='+item.keyword+'">' + '<span>'+(idx + 1)+'</span>' + '위: '
							+ '<span>' + item.keyword + '</span>' + ' | 횟수: ' + '<span>' + item.cnt + '</span>'
							+ '</a></li>';
				});
				htmlTxt += '</ol></dd>';
				$("#rank-list").html(htmlTxt);
				$(function() {

					var count = $('#rank-list li').length;
					var height = $('#rank-list li').height();

					function step(index) {
						$('#rank-list ol').delay(2000).animate({
							top : -height * index,
						}, 500, function() {
							step((index + 1) % count);
						});
					}
					step(1);
				});
			},
			error : function() {
				alert("서버 이상으로 목록 조회에 실패하였습니다. 잠시후 다시 시도해주세요.");
			}
		});
	}
	loadRankList();
	/* $(function() {
		loadRankList();

		var count = $('#rank-list li').length;
		var height = $('#rank-list li').height();		

		function step(index) {
			$('#rank-list ol').delay(2000).animate({
				top : -height * index,
			}, 500, function() {
				step((index + 1) % count);
			});
		}
		step(1);
	}); */
</script>
</html>