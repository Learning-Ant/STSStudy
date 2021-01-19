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
	function fn_boardDelete(f){
		if (confirm('삭제할까요?')){
			f.action = 'boardDelete.do';
			f.submit();
		}
	}

</script>
<title>Insert title here</title>
</head>
<body>

	<div class="container mx-auto my-5">
		<form method="post">
			작성자<br/>
			<input type="text" name="writer" value="${boardDto.writer}" readonly /><br/><br/>
			제목<br/>
			<input type="text" name="title" value="${boardDto.writer}" /><br/><br/>
			내용<br/>
			<input type="text" name="content" value="${boardDto.writer}" /><br/><br/>
			첨부이미지 <br/>
			첨부파일 다운로드<br/>
			<a href="download.do?filename=${boardDto.filename}">${boardDto.filename}</a>
			<br/><br/>
			<img alt="${boardDto.filename}" src="resources/storage/${boardDto.filename}" />
			<br/>
			
			<%-- hidden --%>
			<input type="hidden" name="no" value="${boardDto.no}" />
			<input type="hidden" name="filename" value="${boardDto.filename}" />
			
			<input class="btn btn-danger" type="button" value="삭제하기" onclick="fn_boardDelete(this.form)" />
		</form>
	</div>

</body>
</html>