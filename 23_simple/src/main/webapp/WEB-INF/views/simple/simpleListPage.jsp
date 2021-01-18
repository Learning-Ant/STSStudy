<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(function(){
		$('button').click(function(){
			location.href='simpleInsertPage.do';
		});
	})
</script>
<title>Insert title here</title>
</head>
<body>

	<div class="col col-md-4"><button type="button" class="btn btn-primary">게시글 작성하기</button></div>
	<table class="table table-striped table-hover" style="width:500px; margin:auto;">
		<thead>
			<tr>
				<th>게시물 번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<td colspan="4">작성된 게시글이 없습니다</td>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="simpleDto" items="${list}">
					<tr>
						<td>${simpleDto.no}</td>
						<td>
							<a href="simpleViewPage.do?no=${simpleDto.no}">${simpleDto.title}</a>
						</td>
						<td>${simpleDto.writer}</td>
						<td>${simpleDto.regDate}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>

</body>
</html>