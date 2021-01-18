<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>

	<div style="width:60%" class="mx-auto my-5">
		<form action="contactInsert.do" method="post">
			<label>이름<br/>
			<input type="text" name="name" /></label><br/><br/>
			<label>전화<br/>
			<input type="text" name="phone" /></label><br/><br/>
			<label>주소<br/>
			<input type="text" name="address" /></label><br/><br/>
			<label>이메일<br/>
			<input type="text" name="email" /></label><br/><br/>
			<label>비고<br/>
			<input type="text" name="note" /></label><br/><br/>
			<button class="btn btn-primary">연락처 저장하기</button>
			<input class="btn btn-secondary"  type="button" value="전체연락처" onclick="location.href='contactListPage.do'" />
		</form>
	</div>

</body>
</html>