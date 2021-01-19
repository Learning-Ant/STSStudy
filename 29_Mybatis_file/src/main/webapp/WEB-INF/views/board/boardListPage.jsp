<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- JQuery -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<!-- Fontawesome-->
<script src="https://kit.fontawesome.com/2499ffc112.js" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="resources/style/common.css" />
<title>Insert title here</title>
<script type="text/javascript">
	let afterInsert = '${afterInsert}';
	if(afterInsert=='true'){
		let insertResult = '${insertResult}';
		if(insertResult>0){
			alert(insertResult+'개의 게시글을 등록했습니다.');
		}
	}
	let afterDelete = '${afterDelete}';
	if(afterDelete=='true'){
		let deleteResult = '${deleteResult}';
		if(deleteResult>0){
			alert('삭제되었습니다.');
		}
	}
	
</script>
</head>
<body>

	<div class="container mx-auto my-5">
		<a class="btn btn-primary" href="boardInsertPage.do" ><i class="fas fa-plus-circle"></i>새 글 작성하기</a>
		<table class="table table-primary table-striped table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th>이미지</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<c:if test="${empty list}">
				<tr>
					<td colspan="5">작성된 이미지가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="boardDto" items="${list}">
					<tr>
						<td>${boardDto.no}</td>
						<td><img alt="${boardDto.filename}" src="resources/storage/${boardDto.filename}"></td>
						<td><a href="boardViewPage.do?no=${boardDto.no}" >${boardDto.title}</a></td>
						<td>${boardDto.writer}</td>
						<td>${boardDto.regDate}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</body>
</html>