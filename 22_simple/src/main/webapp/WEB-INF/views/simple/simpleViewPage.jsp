<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
	function fn_simpleDelete(){
		if(confirm('정말 삭제하시겠습니까?')){
			$('#view-form').attr('action', 'simpleDelete.do');
			$('#view-form').submit();
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>

	<div>
		<h3>${simpleDto.no}번 게시물입니다.</h3>
		
		작성자<br/>
		${simpleDto.writer}<br/><br/>
		제목<br/>
		${simpleDto.title}<br/><br/>
		내용<br/>
		${simpleDto.content}<br/><br/>
		<form id="view-form" action="simpleUpdate.do" >
			<%-- hidden --%>
			<input type="hidden" name="no" value="${simpleDto.no}"/>
			<input type="hidden" name="no" value="${simpleDto.title}"/>
			<input type="hidden" name="no" value="${simpleDto.content}"/>
			
			<button class="btn btn-primary">수정하러 가기</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='simpleListPage.do'">목록으로 돌아가기</button>
			<button type="button" class="btn btn-danger" onclick="fn_simpleDelete()" >삭제하기</button>
			
		</form>
		
		
	</div>

</body>
</html>