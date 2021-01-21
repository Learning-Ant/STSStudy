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
	
	/*
		REST[ful] : URI + HTTP Method
				URI				Method
		목록	member			GET
		보기	member/{no}		GET
		삽입	member			POST
		수정	member			PUT
		삭제	member/{no}		DELETE
		
	*/
	
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
		// URI : member, Method : GET
		$.ajax({
			url:'member',
			type:'get',
			dataType:'json',
			success:function(responseList){
				/*
					responseList = {
						"list": [
							{
								"no":1,
								"id":"user1",
								"name":"사용자1",
								"gender":"남",
								"address":"서울"
							},
							{
								"no":2,
								"id":"user2",
								"name":"사용자2",
								"gender":"여",
								"address":"제주"
							},
							...
						],
						"result": true
					
					}
				*/
				if(responseList.result){
					memberListTable(responseList.list);	// 서브 함수 호출
				} else {
					$('<tr>').html('<td colspan="7">회원정보가 없습니다.</td>')
					.appendTo($('#memberList'));
				}
			},
			error:function(){
				alert('리스트를 받아오는데 실패했습니다.');
			}
		});
	}
	
	// 서브 함수 : 회원 목록을 테이블로 만들어 주는 함수
	
	function memberListTable(list){
		$('#memberList').empty();	// 기존 목록을 제거합니다.
		$.each(list, function(idx, member){
			$('<tr>')
			.append($('<td>').html(member.no))
			.append($('<td>').html(member.id))
			.append($('<td>').html(member.name))
			.append($('<td>').html(member.gender))
			.append($('<td>').html(member.address))
			.append($('<input type="hidden" name="no" />').val(member.no))
			// .append('<input type="hidden" name="no" value="'+member.no+'" />')
			.append($('<td>').html('<input class="btn btn-primary" type="button" value="조회" id="btnView" />'))
			.append($('<td>').html('<input class="btn btn-danger" type="button" value="삭제" id="btnDelete" />'))
			.appendTo($('#memberList'));
		});
	}
	
	/***** 2. 회원 정보 *****/
	function memberView(){
		// URI : member/{no}, Method : GET
		
		// jquery의 append() 등의 method를 이용해서 생성한 버튼은
		// $('#btnView').click(function(){}); 와 같은 click 이벤트 처리가 불가능하다.
		// 이유는 append나 html로 만든 요소(태그, Element)들은 '동적 요소'라고 한다.
		// 동적 요소 : append()나 html() method로 만든요소
		// 동적 요소의 이벤트 연결(바인딩)은 on() method를 사용해야 한다.
		$('body').on('click', '#btnView',function(){
			// <input type="hidden" name="no" /> 태그의 value를 알아내야 한다.
			// 이벤트 객체 : #btnView
			// 이벤트 객체는 $(this)
			// $(this)와 같은 위치(수준 :<tr>)에 있는 hidden 찾기
			// 1. $(this)의 부모 요소 중에서(td -> tr -> tbody) <tr> 태그를 찾는다.
			//	 1) $(this).parents('tr')
			//	 2) $(this).closest('tr') : 같은 id가 많은 경우에 유용
			// 2. 거기서(<tr>)에서 find() method로 <input type="hidden" name="no" />를 찾는다.
			//	 1) $(this).parents('tr').find('input:hidden[name="no"]')
			//	 2) $(this).closest('tr').find('input:hidden[name="no"]')
			// 3. 거기서(<input type="hidden" name="no" />) 값을 가져온다.
			//	 1) $(this).parents('tr').find('input:hidden[name="no"]').val();
			//	 2) $(this).closest('tr').find('input:hidden[name="no"]').val();
			// let no = $(this).parents('tr').find('input:hidden[name="no"]').val();
			let no = $(this).closest('tr').find('input:hidden[name="no"]').val();
			
			$.ajax({
				url:'member/'+no,	// @RequestMapping(value="member/{no}")
				type:'get',			// @RequestMapping(method=RequestMethod.GET)
				dataType:'json',	// @RequestMapping(produces="application/json; charset=UTF-8")
				success:function(responseObj){
					/*
					responseObj = {
						"memberDto": {
								"no":1,
								"id":"user1",
								"name":"사용자1",
								"gender":"남",
								"address":"서울"
						},
						"result": true
					}
				*/
					let member = responseObj.memberDto;
					if(responseObj.result){
						$('#viewNo').val(member.no);
						$('input:text[name="id"]').val(member.id);
						$('input:text[name="name"]').val(member.name);
						$('input:radio[name="gender"][value="'+member.gender+'"]').prop('checked', true);
						$('select[name="address"]').val(member.address);
					} else {
						alert('회원 정보를 찾을 수 없습니다.');
					}
				},
				error:function(){
					alert('회원 정보를 불러오는 데 실패했습니다.');
				}
			});
		});
	}
	
	/***** 3. 회원 삽입 *****/
	function memberInsert(){
		// URI : member, Method : POST
		// 입력데이터 -> JSON 데이터로 만든다.
		// 만들어진 JSON 데이터를 controller로 넘겨준다.
		// POST 방식은 parameter를 본문(body)에 실어 준다. (JSON 데이터를 body에 실어 준다.) <- GET방식은 Header
		// 그래서 controller는 요청 parameter(request)를 본문에서 꺼내야 합니다. -> @RequestBody Annotation이 필요하다는 의미.
		$('#btnInsert').click(function(){
			let id = $('input:text[name="id"]').val();
			let name = $('input:text[name="name"]').val();
			let gender = $('input:radio[name="gender"]:checked').val();
			let address = $('select[name="address"]').val();
			let sendObj = {
					"id":id,
					"name":name,
					"gender":gender,
					"address":address
			};
			$.ajax({
				url:'member',
				type:'post',
				data:JSON.stringify(sendObj),	// controller로 보내는 JSON 데이터()
				contentType:'application/json',	// controller로 보내는 데이터의 타입
				dataType:'json',				// jackson이 map을 json데이터로 바꿔서 반환
				success:function(responseObj){
					/*
						responseObj = {
							"result" : 1 (성공)
							또는
							"result" : 0 (실패)
						}
					*/
					if (responseObj.result == 1){
						alert('신규 회원이 등록되었습니다.');
						memberList();
					} else {
						alert('회원 생성에 실패했습니다.');
					}
				},
				error:function(){
					alert('회원 생성에 실패했습니다.');
				}
			});
		});
	}
	
	/***** 4. 회원 수정 *****/
	function memberUpdate(){
		$('#btnUpdate').click(function(){
			let no = $('#viewNo').val();
			let id = $('input:text[name="id"]').val();
			let name = $('input:text[name="name"]').val();
			let gender = $('input:radio[name="gender"]:checked').val();
			let address = $('select[name="address"]').val();
			let sendObj = {
					"no":no,
					"id":id,
					"name":name,
					"gender":gender,
					"address":address
			};
			$.ajax({
				url:'member',
				type:'put',
				data:JSON.stringify(sendObj),
				contentType:'application/json; charset=UTF-8',
				dataType:'json',
				success:function(responseObj){
					if(responseObj.result==1){
						alert('회원 정보가 수정되었습니다.');
						memberList();
					} else {
						alert('수정에 실패했습니다.')
					}
				},
				error:function(){
					alert('수정에 실패했습니다.');
				}
			});
		});
	}
	
	/***** 5. 회원 삭제 *****/
	function memberDelete(){
		$('body').on('click', '#btnDelete', function(){
			let no = $(this).parents('tr').find('input:hidden[name="no"]').val();
			
			$.ajax({
				url:'member/'+no,
				type:'delete',
				dataType:'json',
				success:function(responseObj){
					if(responseObj.result>0){
						alert('삭제에 성공했습니다.');
						memberList();
					} else {
						alert('삭제에 실패했습니다.');
					}
				},
				error:function(){
					// alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert('삭제에 실패했습니다.');
				}
			});
		});
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
		vertical-align: center;
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
			<input type="text" name="id" /><br/><br/>
			이름<br/>
			<input type="text" name="name" /><br/><br/>
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
			
			<!-- hidden -->
			<input id="viewNo" type="hidden" name="no" value="" />
			<input class="btn btn-success" type="button" value="등록" id="btnInsert" />
			<input class="btn btn-info" type="button" value="수정" id="btnUpdate" />
			<input class="btn btn-dark" type="button" value="초기화" id="btnInit" />
		</div>
	
		<div class="right">
			<!-- 목록/삭제 페이지 -->
			<h3>회원 목록</h3>
			<table class="table table-warning table-striped table-hover">
				<thead>
					<tr>
						<th style="width:80px;">회원번호</th>
						<th>아이디</th>
						<th>성명</th>
						<th>성별</th>
						<th>주소</th>
						<th colspan="2" >비고</th>
					</tr>
				</thead>
				<tbody id="memberList">
					
				</tbody>
			</table>
			
		</div>
		
	</div>
	
	
</body>
</html>