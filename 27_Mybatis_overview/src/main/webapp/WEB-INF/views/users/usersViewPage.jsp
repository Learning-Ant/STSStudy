<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function fn_usersUpdate(f) {
		if(f.name.value=='${usersDto.name}'&&f.phone.value=='${usersDto.phone}'){
			alert('변경사항이 없습니다');
			f.name.focus();
			return;
		}
		
		if(confirm('수정할까요?')){
			f.action='usersUpdate.do';
			f.submit();
		}
		
	}
	
	function fn_usersDelete(f) {
		if(confirm('정말 삭제하시겠습니까?')){
			f.action='usersDelete.do';
			f.submit();
		}
	}
</script>

<title>Insert title here</title>
</head>
<body>

	<form method="post" class="mx-auto" style="width:500px;">
		이름<br/>
		<input type="text" name="name" value="${usersDto.name}"/><br/><br/>
		연락처<br/>
		<input type="text" name="phone" value="${usersDto.phone}" /><br/><br/>
		
		<input type="hidden" name="no" value="${usersDto.no}" />
		
		<input class="btn btn-primary" type="button" value="수정하기" onclick="fn_usersUpdate(this.form)" />
		<input class="btn btn-danger" type="button" value="삭제하기" onclick="fn_usersDelete(this.form)" />
		<input class="btn btn-secondary" type="button" value="목록보기" onclick="location.href='usersListPage.do'" />
	</form>

</body>
</html>