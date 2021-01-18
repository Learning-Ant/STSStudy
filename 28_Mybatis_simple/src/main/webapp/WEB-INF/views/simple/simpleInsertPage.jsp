<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		let title = $('[name=title]');
		let form = $('#insert-form');
		
		$('#insert-btn').click(function(){
			if(title.val()==null || title.val()==''){
				alert('제목은 필수입력사항입니다.');
				return;
			}
			form.attr("action", "simpleInsert.do");
			form.submit();
			
		});
		
		$('#back-btn').click(function(){
			location.href='simpleListPage.do';
		});
		
	})
</script>

</head>
<body>

	<form id="insert-form" method="post">
		작성자<br/>
		<input type="text" name="writer" /><br/><br/>
		제목<br/>
		<input type="text" name="title" /><br/><br/>
		내용<br/>
		<input type="text" name="content" /><br/><br/>
		
		<input type="button" id="insert-btn" class="btn btn-primary" value="작성하기" />
		<input type="button" id="back-btn" class="btn btn-secondary" value="목록으로 돌아가기" />
	</form>

</body>
</html>