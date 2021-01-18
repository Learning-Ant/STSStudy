<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>

	<div class="container my-4" style="width:400px">
	
		<a href="usersInsertPage.do" class="btn btn-primary" >새 유저 등록하기</a>
		<table class="table table-striped table-hover my-4">
			<thead>
				<tr>
					<th>#</th>
					<th>이름</th>
					<th>연락처</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="3">등록된 유저가 없습니다</td>
					</tr>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach var="usersDto" items="${list}" >
						<tr>
							<td>${usersDto.no}</td>
							<td><a href="usersViewPage.do?no=${usersDto.no}">${usersDto.name}</a></td>
							<td>${usersDto.phone}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	
	</div>
	
</body>
</html>