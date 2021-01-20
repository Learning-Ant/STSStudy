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
	
	// 페이지 로드 이벤트
	$(document).ready(function(){
		$('#btn1').click(fn_getText);
		$('#btn2').click(fn_getJSON);
		$('#btn3').click(fn_getXML);
		$('#btn4').click(fn_getJSONList);
		$('#btn5').click(fn_getXMLList);
		$('#btn6').click(fn_sendJSON);
		$('#btn7').click(fn_sendPath);
		$('#btn8').click(fn_getJSONByMap);
	});
	
	// 함수
	function fn_getText(){
		$.ajax({
			url:'getText',		// RequestMapping의 value = "getText"
			type:'get',			// RequestMapping의 method = RequestMethod.GET
			dataType:'text',	// RequestMapping의 produces = "text/plain"" + ResponseBody이 있어야 ViewResolver(view.jsp)로 처리하지 않고 data로 처리한다
			success:function(responseText){
				// responseText는 응답 받은 결과입니다.
				$('#content1').append(responseText.trim());
			},
			error:function(){
				alert('실패');
			}
		});
	}
	
	function fn_getJSON(){
		$.ajax({
			url:'getJSON',
			type:'get',
			dataType:'json',
			success:function(responseObj){
				// JSON 데이터(responseObj)는 Javascript의 객체이다.
				$('#content2').append('<ul><li>이름 : '+ responseObj.name + '</li><li>나이 : '+ responseObj.age +'</li></ul>');
				// $('#content2').append('<ul><li>이름 : '+ responseObj['name'] + '</li><li>나이 : '+ responseObj['age'] +'</li></ul>');
			},
			error:function(){
				alert('실패');
			}
		});
	}
	
	function fn_getXML(){
		$.ajax({
			url:'getXML',
			type:'get',
			dataType:'xml',
			success:function(responseXML){
				// alert(responseXML);							// Object XMLDocument 출력		<name>앨리스</name><age>30</age>
				// alert($(responseXML).find('name'));			// Object object 출력			<name>앨리스</name>
				// alert($(responseXML).find('age'));			// Object object 출력			<age>30</age>
				// alert($(responseXML).find('name').text());	// 태그안의 text				앨리스
				// alert($(responseXML).find('age').text());	// 태그안의 text				30
				// alert($(responseXML).find('name').val());	// 태그의 value(없으므로 공백)	''
				$('#content3').append('<ul><li>이름 : '+$(responseXML).find('name').text()+'</li><li>'+$(responseXML).find('age').text()+'</li></ul>');
			},
			error:function(){
				alert('실패');
			}
		
		});
	}
	
	function fn_getJSONList(){
		$.ajax({
			url:'getJSONList',
			type:'get',
			dataType:'json',
			success:function(responseList){
				// java의 ArrayList는 Jackson에 의해 javascript의 배열로 넘어온다.
				// javascript에서 처리는 배열로써 하면 된다.
				/*
					responseList =
					[
						{"name":"user1", "age":20},
						{"name":"user2", "age":20},
						...
						{"name":"user10", "age":29}
					]
				*/
				
				$('#content5').empty();
				$.each(responseList, (idx, person)=>{
					$('<tr>')
					.append($('<td>').html(idx + 1))
					.append($('<td>').html(person.name))
					.append($('<td>').html(person.age))
					.appendTo($('#content5'));
				});
				
				let result ='<table class="table table-secondary table-hover">';
				result += '<thead><tr><th>이름</th><th>나이</th></tr></thead>';
				result += '<tbody>';
				// javascript for문
				for(let i=0;i<10;i++){
					result += '<tr>';
					result += '<td>'+responseList[i].name+'</td>';
					result += '<td>'+responseList[i].age+'</td>';
					result += '</tr>';
				}
				
				result += '</tbody></table>'
				$('#content4').html(result);
			},
			error:function(){
				alert('실패');
			}
		});
	}
	
	function fn_getXMLList(){
		$.ajax({
			url:'getXMLList',
			type:'get',
			dataType:'xml',
			success: function(responseList){
				/*
					responseList객체 내부를 확인하려면
					http://locaolhost:9090/rest/getXMLList 실행 후 주소를 입력
					responseList
						<item>	
							<name>사용자1</name>
							<age>20</age>
						</item>
						<item>
							<name>사용자2</name>
							<age>21</age>
						</item>
						<item>
							<name>사용자3</name>
							<age>22</age>
						</item
						...
					]
				*/
				$('#content5').empty();
				/*
				아래의 식은 인식하지 못한다.
				$.each(responseList, function(idx, person){
					$('<tr>')
					.append($('<td>').html(idx + 1))
					.append($('<td>').html(person.find('name').text()))
					.append($('<td>').html(person.find('age').text()))
					.appendTo('#content5')
				});
				*/
				// 실제로 구조를 확인해보면(http://locaolhost:9090/rest/getXMLList)
				// <list>태그 밑에 <item>태그로 각각의 객체들이 감싸져있다.
				// $(responseList).find('item') 이렇게 선택된 객체는
				// each의 callback안에서 this가 된다.
				$(responseList).find('item').each(function(idx){
					$('<tr>')
					.append($('<td>').html(idx + 1))
					.append($('<td>').html($(this).find('name').text()))
					.append($('<td>').html($(this).find('age').text()))
					.appendTo('#content5');
				});
			},
			error: function(){
				alert('실패');
			}
		});
	}
	
	function fn_sendJSON(){
		let name = $('#name').val();
		let age = $('#age').val();
		let sendObj = {
				'name':name,
				'age':age
		};	// 아직은 자바스크립트의 객체. JSON이 아니다.
		$.ajax({
			url: 'sendJSON',
			type: 'post',	// @PostMapping을 사용한다.
			data: JSON.stringify(sendObj),	// 컨트롤러로 보내는 데이터 (JSON문자열로 바꿔서 보낸다.)
			contentType: 'application/json; charset=UTF-8',	// 컨트롤러로 보내는 데이터의 타입
			dataType: 'json',				// 컨트롤러에서 받아오는 데이터의 타입 : contentType과 헷갈리지 말 것.
			success: function(responseObj){
				$('#content6').text('이름 : '+responseObj.name+'나이 : '+responseObj.age);
			},
			error: function(){
				alert('실패');
			}
		});
		
	}
	
	function fn_sendPath(){
		let name = $('#name2').val();
		let age = $('#age2').val();
		$.ajax({
			url:'name/'+name+'/age/'+age,	// @GetMapping(value="name/{name}/age/{age}")
			type:'get',
			dataType:'json',
			success:function(responseObj){
				$('#content7').text('이름 : '+responseObj.name+'나이 : '+responseObj.age);
			},
			error: function(){
				alert('실패');
			}
		});
	}
	
	function fn_getJSONByMap(){
		$.ajax({
			url: 'fn_getJSONByMap',
			type: 'get',
			dataType: 'json',
			success: function(responseObj){
				$('#content8').text('이름 : '+responseObj.name+'나이 : '+responseObj.age);
			},
			error: function(){
				alert('실패');
			}
		});
	}
</script>
<title>Insert title here</title>
</head>
<body>

	<div class="container mx-auto my-5" >
		<a class="btn btn-primary" href="memberManagePage.do">테이블 예제로 이동하기</a><br/><br/>
		
		<input class="btn btn-primary" type="button" value="텍스트 가져오기" id="btn1"/><br/><br/>
		<div id="content1"></div>
		
		<br/>
		
		<input class="btn btn-success" type="button" value="JSON 가져오기" id="btn2" /><br/>
		<div id="content2"></div>
		
		<br/>
		
		<input class="btn btn-dark" type="button" value="XML 가져오기" id="btn3" /><br/>
		<div id="content3"></div>
		
		<br/>
		
		<input class="btn btn-dark" type="button" value="JSON List 가져오기" id="btn4" /><br/>
		<table class="table table-info">
			<thead>
				<tr>
					<th>#</th>
					<th>이름</th>
					<th>나이</th>
				</tr>
			</thead>
			<tbody id="content5">
			
			</tbody>
		</table>
		<div id="content4"></div>
		
		<br/>
		
		<input class="btn btn-white" type="button" value="XML List 가져오기" id="btn5"/><br/>
		
		<br/>
		
		<form>
			<input type="text" id="name" placeholder="이름" /><br/>
			<input type="text" id="age" placeholder="나이" /><br/>
			<button class="btn btn-warning" type="button" id="btn6">정보보내기</button>
		</form>
		<div id="content6"></div>
		
		<br/>
		
		<form>
			<input type="text" id="name2" placeholder="이름" /><br/>
			<input type="text" id="age2" placeholder="나이" /><br/>
			<button class="btn btn-warning" type="button" id="btn7">정보보내기</button>
		</form>
		<div id="content7"></div>
		
		<br/>
		
		<input class="btn btn-secondary" type="button" value="Map을 JSON으로 가져오기" id="btn8" /><br/>
		<div id="content8"></div>
		
	</div>
	
</body>
</html>