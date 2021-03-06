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
<script type="text/javascript">
	let afterInsert = '${afterInsert}';
	if (afterInsert){
		let insertResult = '${insertResult}';
		if (insertResult>0){
			alert('삽입되었습니다.');
		} else {
			alert('실패하였습니다.');
		}
	}
	let afterDelete = '${afterDelete}';
	if (afterDelete){
		let deleteResult = '${deleteResult}';
		if (deleteResult>0){
			alert('삭제되었습니다.');
		} else {
			alert('삭제되지 않았습니다.');
		}
	}
	

</script>
<title>Insert title here</title>
</head>
<body>

	<div class="container mx-auto my-4" style="width:60%">
		<h3>게시글 목록</h3>
		전체:${totalRecord}개 개시글<br/>
	</div>
	<table class="table table-striped table-hover my-4" style="width:60%; margin:auto;">
	<caption><button type="button" class="btn btn-primary" onclick="location.href='simpleInsertPage.do'" >새글 작성하러 가기</button></caption>
		<thead>
			<tr>
				<td>순번</td>
				<td>작성자</td>
				<td>제목</td>
				<td>작성일</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="4">작성된 글이 없습니다</td>
				</tr>
			</c:if>
			<c:if test="${not empty list}">
				<c:forEach var="simpleDto" items="${list}" varStatus="k" >
					<tr>
						<td>${totalRecord-((page - 1) * recordPerPage + k.index)}</td>
						<td>${simpleDto.writer}</td>
						<td><a href="simpleViewPage.do?no=${simpleDto.no}&page=${page}">${simpleDto.title} </a> </td>
						<td>${simpleDto.regDate}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="4">${paging}</th>
			</tr>
		</tfoot>
	</table>
	
</body>
</html>