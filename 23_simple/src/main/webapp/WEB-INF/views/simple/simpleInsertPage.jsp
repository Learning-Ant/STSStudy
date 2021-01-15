<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	let f = $('#insert-form');
	
	$(function(){
		$('#insert-btn').click(function(){
			if($('input[name=title]').val()==null||$('input[name=title]').val()==''){
				alert('제목은 필수입니다.');
				return;
			}
			f.attr('action', 'simpleInsert.do');
			f.submit();
		});
		$('#back-btn').click(function(){
			location.href='simpleListPage.do';
		});
	})
</script>
<title>Insert title here</title>
</head>
<body>

	<div class="mx-auto" style="width:50%;">
	<form id="insert-form">
		작성자<br/>
		<input type="text" name="writer" /><br/><br/>
		제목<br/>
		<input type="text" name="title" placeholder="제목은 필수입니다."/><br/><br/>
		내용<br/>
		<textarea rows="5" cols="50" name="content">내용을 입력해주세요</textarea>
		<button class="btn btn-primary" id="insert-btn">작성하기</button>
		<button class="btn btn-secondary" id="back-btn">목록으로 돌아가기</button>
	</form>
	</div>

</body>
</html>