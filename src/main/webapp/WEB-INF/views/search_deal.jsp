<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
</head>
<body>
	<div align="center">
		<%@ include file="/WEB-INF/views/rank.jsp"%>
	</div>

	<div class="container" align="center">

		<h1>거래 목록 조회 화면</h1>

		<form method="get" action="${pageContext.request.contextPath }/search">
			<input type="hidden" name="act" value="search"> <select
				name="by">
				<option value="dongName">동이름
				<option value="aptName">아파트이름
			</select> <input type="text" name="keyword"> <input type="submit"
				class="btn btn-primary js-scroll-trigger" value="검색">
		</form>
		<form>
			<table class="table table-bordered table-condensed" style="text-align:center">
				<tr>
					<br>
					<h4>아파트 이름을 클릭하면 상세정보 페이지로 넘어갑니다.</h4>
				</tr>
				<tr>
					<th>no</th>
					<th>동 이름</th>
					<th>아파트 이름</th>
					<th>거래금액</th>
					<th>거래종류</th>
				</tr>

				<br>
				<!-- 여기다가 houseDeals 리스트에 대한 처리
				page 번호를 넘긴다고 치면
				여기서 forEach안에서
				html 태그로 리스트
				page를 구성하고 
				int page
				size -> / 10 
			 -->
				<c:forEach begin="0" end="10" step="1" items="${houseDeals }"
					var="houseDeal">
					<tr>
						<td>${houseDeal.no }</td>
						<td>${houseDeal.dong }</td>
						<td><a
							href="${root}search?act=detail&aptName=${houseDeal.aptName}&dong=${houseDeal.dong}">
								${houseDeal.aptName }</a></td>
						<td>${houseDeal.dealAmount }</td>

						<td><c:if test="${houseDeal.type == '1'}">
					아파트 매매
					</c:if> <c:if test="${houseDeal.type == '2'}">
					연립 다세세 매매
					</c:if> <c:if test="${houseDeal.type == '3'}">
					아파트 전월세 
					</c:if> <c:if test="${houseDeal.type == '4'}">
					연립 다세세 전월세
					</c:if></td>

					</tr>
				</c:forEach>
			</table>

		</form>

		<br>
		<jsp:include page="paging.jsp">
			<jsp:param value="${paging.pageNo }" name="pageNo" />
			<jsp:param value="${paging.start }" name="start" />
			<jsp:param value="${paging.end }" name="end" />
			<jsp:param value="${paging.prev }" name="prev" />
			<jsp:param value="${paging.next }" name="next" />
			<jsp:param value="${act }" name="act" />
			<jsp:param value="${by }" name="by" />
			<jsp:param value="${keyword }" name="keyword" />
		</jsp:include>

		<br> <a href="${root}main">메인페이지</a>
	</div>
</body>
</html>