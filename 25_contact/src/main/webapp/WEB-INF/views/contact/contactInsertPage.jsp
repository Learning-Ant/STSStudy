<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp" />


<form action="contactInsert.do" method="post">
	이름<br/>
	<input type="text" name="name" /><br/><br/>
	연락처<br/>
	<input type="text" name="phone" /><br/><br/>
	주소<br/>
	<input type="text" name="address" /><br/><br/>
	이메일<br/>
	<input type="text" name="email" /><br/><br/>
	비고<br/>
	<input type="text" name="note" /><br/><br/>
	<button class="btn btn-primary">전송하기</button>
</form>


<%@ include file="../template/footer.jsp" %>