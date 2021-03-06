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
		<!-- 이메일 인증 성공하면 게시판을 이용할 수 있습니다. -->
		<form action="emailAuth.do" method="post">
			게시판 이용을 위해서는 이메일 인증을 받으셔야 합니다.<br/><br/>
			이메일 입력<input type="text" name="email" placeholder="example01@example.com" autofocus />
			<button class="btn btn-primary">인증요청하기</button> 
		</form>
		
		<!-- <a class="btn btn-primary" href="boardListPage.do">게시판으로 가기</a> -->
	</div>

</body>
</html>