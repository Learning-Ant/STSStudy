<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	// 페이지 로드 이벤드
	$(function(){
		memberList();
		memberView();
		memberInsert();
		memberUpdate();
		memberDelete();
		init();
	});
	
	/***** 1. 회원 목록 *****/
	function memberList(){
		
	}
	
	/***** 2. 회원 정보 *****/
	function memberView(){
		
	}
	
	/***** 3. 회원 삽입 *****/
	function memberInsert(){
		
	}
	
	/***** 4. 회원 수정 *****/
	function memberUpdate(){
		
	}
	
	/***** 5. 회원 삭제 *****/
	function memberDelete(){
		
	}
	
	/***** 6. 초기화 *****/
	function init(){
		// id가 아닌 다른 속성이나 태그로 선택해보자.
		$('#btnInit').click(function(){
			$('input:text[name="id"]').val('');
			$('input:text[name="name"]').val('');
			$('input:radio[name="gender"][value="남"]').prop('checked', true);
			$('select[name="address"]').val('');
			memberList();
			// 마지막으로 다시 목록을 가져올 수 있도록 하면 좋다.
		});
	}
	
	
</script>
<style>
	*{
		padding: 0;
		margin: 0;
		box-sizing: border-box;
	}
	.wrap {
		display: flex;
		justify-content: center;
	}
	.left {
		width: 500px;
	}
	.right {
		width: 1000px;
	}
	table {
		border-collapse: collapse;
	}
	td, th {
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		padding: 5px 10px;
		text-align: center;
	}
	th {
		background: silver;
	}
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="wrap">
		
		<div class="left">
			<!-- 등록/수정/정보 페이지 -->
			<h3>회원 등록/수정/정보</h3>
			아이디<br/>
			<input type="text" name="id" id="id" /><br/><br/>
			이름<br/>
			<input type="text" name="name" id="name" /><br/><br/>
			성별<br/>
			<input type="radio" name="gender" value="남" id="male"/>
			<label for="male">남자</label>
			<input type="radio" name="gender" value="여" id="female"/>
			<label for="female">여자</label><br/><br/>
			주소<br/>
			<select name="address">
				<option value="">지역 선택</option>
				<option value="서울">서울</option>
				<option value="인천">인천</option>
				<option value="부산">부산</option>
				<option value="제주">제주</option>
				<option value="강원">강원</option>
			</select><br/><br/>
			<input type="button" value="등록" id="btnInsert" />
			<input type="button" value="수정" id="btnUpdate" />
			<input type="button" value="초기화" id="btnInit" />
		</div>
	
		<div class="right">
			<!-- 목록/삭제 페이지 -->
			<h3>회원 목록</h3>
			<table>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>성명</th>
						<th>성별</th>
						<th>주소</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody id="memberList">
					
				</tbody>
			</table>
			
		</div>
		
	</div>
	
	
</body>
</html>