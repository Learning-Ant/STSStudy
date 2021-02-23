<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
	if(${updateResult > 0}){
		alert('수정 성공');
	}
	function fn_update(f){
		let isPossible = false;
		let test = $('input[name^=b]');
		if(f.bTitle.value=='${boardDto.bTitle}'&&f.bContent.value=='${boardDto.bContent}'){
			alert('변경사항이 없습니다');
			return;
		}
		$.each(test, function(idx, tag){
			if($(tag).val()=='' || $(tag).val()==null){
				alert('제목은 필수입니다');
				$(tag).focus();
				isPossible = false;
				return false;
			} else {
				isPossible = true;
			}
		});
		if (isPossible){
			f.action='update';
			f.submit();
		}
	}
	function fn_delete(f){
		if(confirm('정말 삭제하시겠습니까?')){
			f.action='delete';
			f.submit();
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<form method="post">
		<table border="1">
			<tbody>
				<tr>
					<td>순번</td>
					<td>
						<input type="text" name="bIdx" value="${boardDto.bIdx}" readonly />
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${boardDto.bWriter}	</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="bTitle" value="${boardDto.bTitle}" />
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
						<textarea rows="10" cols="50" name="bContent" >${boardDto.bContent}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" onclick="fn_update(this.form)">수정</button>
						<button type="button" onclick="location.href='list'" >목록</button>
						<button type="button" onclick="fn_delete(this.form)" >삭제</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>