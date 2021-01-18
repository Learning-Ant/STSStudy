<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>

	<form action="usersInsert.do" method="post" class="mx-auto" style="width:500px;">
		이름<br/>
		<input type="text" name="name" autofocus/><br/><br/>
		연락처<br/>
		<input type="text" name="phone" /><br/><br/>
		
		<button class="btn btn-primary">작성완료</button>
		<input class="btn btn-secondary" type="button" value="목록보기" onclick="location.href='usersListPage.do'" />
	</form>
	
</body>
</html>