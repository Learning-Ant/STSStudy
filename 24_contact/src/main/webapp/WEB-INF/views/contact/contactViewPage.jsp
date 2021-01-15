<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function fn_contactUpdate(f){
		if(f.name.value=='${contactDto.name}'&&
			f.phone.value=='${contactDto.phone}'&&
			f.address.value=='${contactDto.address}'&&
			f.email.value=='${contactDto.email}'&&
			f.note.value=='${contactDto.note}') {
			alert('변경사항이 없습니다.');
			return;
		}
		f.action='contactUpdate.do';
		f.submit();
	}
	function fn_contactDelete(f){
		if(confirm('정말 삭제하시겠습니까?')){
			f.action='contactDelete.do';
			f.submit();
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>

	<div style="width:60%" class="mx-auto my-5">
		<h3>연락처 보기</h3>
		<form method="post">
			<label>이름<br/>
			<input type="text" name="name" value="${contactDto.name}"/></label><br/><br/>
			<label>전화<br/>
			<input type="text" name="phone" value="${contactDto.phone}" /></label><br/><br/>
			<label>주소<br/>
			<input type="text" name="address" value="${contactDto.address}" /></label><br/><br/>
			<label>이메일<br/>
			<input type="text" name="email" value="${contactDto.email}" /></label><br/><br/>
			<label>비고<br/>
			<input type="text" name="note" value="${contactDto.note}" /></label><br/><br/>
			
			<%-- hidden --%>
			<input type="hidden" name="no" value="${contactDto.no}" />
			
			<input class="btn btn-primary" type="button" value="수정하기" onclick="fn_contactUpdate(this.form)" />
			<input class="btn btn-danger" type="button" value="삭제하기" onclick="fn_contactDelete(this.form)" />
			<input class="btn btn-secondary"  type="button" value="전체연락처" onclick="location.href='contactListPage.do'" />
		</form>
	</div>

</body>
</html>