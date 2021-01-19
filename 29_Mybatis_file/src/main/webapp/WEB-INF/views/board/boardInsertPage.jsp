<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
</head>
<body>

	<div class="container mx-auto my-5">
		<form action="boardInsert.do" method="post" enctype="multipart/form-data">
			<table class="table table-primary mx-auto" style="width:500px;">
				<tbody>
					<tr>
						<th>작성자</th>
						<td><input type="text" name="writer" /></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="5" cols="50" name="content"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="file" name="files" multiple /></td>
					</tr>
					<tr>
						<th colspan="2">
							<button class="btn btn-primary" >작성완료</button>
							<input class="btn btn-secondary" type="button" value="목록으로 돌아가기" onclick="location.href='boardListPage.do'" />
						</th>
					</tr>
				</tbody>
			</table>
		</form>
	
	</div>

</body>
</html>