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
<script type="text/javascript">
	function fn_mailAuthConfirm(f){
		let authKey = '${authKey}';
		let userKey = f.userKey.value;
		if(userKey!=authKey){
			alert('인증코드가 유효하지않습니다. 인증코드를 확인해 주세요');
			return;
		} else if (userKey==authKey){
			alert('인증에 성공했습니다. 게시판으로 이동합니다.');
			f.action='boardListPage.do';
			f.submit();
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>
	
	<form>
		여기에 인증코드를 입력하세요<br/>
		<input type="text" name="userKey" />
		<input class="btn btn-primary" type="button" value="인증하기" onclick="fn_mailAuthConfirm(this.form)" />
	</form>
</body>
</html>