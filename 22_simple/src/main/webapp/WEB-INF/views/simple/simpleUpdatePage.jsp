<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>수정 페이지입니다.</h3>
	
	<form action="simpleUpdate.do" method="post" >
		번호 : ${simpleDto.no}<br/><br/>
		제목<br/>
		<input type="text" name="title" value="${simpleDto.title}" /><br/><br/>
		내용<br/>
		<textarea rows="5" cols="50" name="content">${simpleDto.content}</textarea><br/><br/>
		
		<%-- hidden --%>
		<input type="hidden" name="no" value="${simpleDto.no}" />
		<button>수정하기</button>
		<%--
		<input type="button" value="수정하기" onclick="fn_simpleUpdate(this.form)" />
		<input type="button" value="목록으로 돌아가기" onclick="location.href=''" />
		--%>
	</form>

</body>
</html>