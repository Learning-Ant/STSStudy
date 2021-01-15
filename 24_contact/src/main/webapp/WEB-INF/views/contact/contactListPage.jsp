<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	
	<div style="width:60%;" class="mx-auto my-5 d-grid gap-5">
		<a class="btn btn-primary col col-sm-3" href="contactInsertPage.do">신규 연락처 등록하기</a>
		<table class="table table-striped table-hover mx-auto">
			<thead>
				<tr>
					<td>번호</td>
					<td>이름</td>
					<td>전화</td>
					<td>주소</td>
					<td>이메일</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<td colspan="5">리스트가 없습니다"</td>
				</c:if>
				<c:if test="${not empty list}">
					<c:forEach var="contactDto" items="${list}" >
						<tr>
							<td>${contactDto.no}</td>
							<td><a href="contactViewPage.do?no=${contactDto.no}">${contactDto.name}</a></td>
							<td>${contactDto.phone}</td>
							<td>${contactDto.address}</td>
							<td>${contactDto.email}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>