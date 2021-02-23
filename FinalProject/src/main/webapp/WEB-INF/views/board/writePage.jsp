<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
	function fn_write(f){
		let isPossible = false;
		let test = $('input[name^=b]');
		$.each(test, function(idx, tag){
			if($(tag).val()=='' || $(tag).val()==null){
				alert('작성자와 제목은 필수입니다');
				$(tag).focus();
				isPossible = false;
				return false;
			} else {
				isPossible = true;
			}
		});
		if (isPossible){
			f.action='write';
			f.submit();
		}
	}

</script>
<title>Insert title here</title>
</head>
<body>
	
	<form method="post" >
		<table border="1">
			<tbody>
				<tr>
					<td>작성자</td>
					<td>
						<input type="text" name="bWriter" />
					</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="bTitle" />
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="10" cols="50" name="bContent"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" onclick="fn_write(this.form)">등록</button>
						<button type="button" onclick="location.href='list'" >목록</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>