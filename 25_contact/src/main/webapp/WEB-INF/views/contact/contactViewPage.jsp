<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../template/header.jsp" />

<script>

	function fn_contactUpdate(f) {
		if(f.name.value()=='${contactDto.name}'&&f.phone.value()=='${contactDto.phone}'f.address.value()=='${contactDto.address}'&&f.email.value()=='${contactDto.email}'&&f.note.value()=='${contactDto.note}'){
			alert('변경사항이없습니다.');
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

<form>
	이름<input type="text" name="name" value="${contactDto.name}" /><br/>
	연락처<input type="text" name="phone" value="${contactDto.phone}" /><br/>
	주소<input type="text" name="address" value="${contactDto.address}" /><br/>
	이메일<input type="text" name="email" value="${contactDto.email}" /><br/>
	비고<input type="text" name="note" value="${contactDto.note}" /><br/>
	<input type="button" class="btn btn-primary" value="수정하기" onclick="fn_contactUpdate(this.form)" />
	<input type="button" class="btn btn-danger" value="삭제하기" onclick="fn_contactDelete(this.form)" />
</form>

<%@ include file="../template/footer.jsp" %>