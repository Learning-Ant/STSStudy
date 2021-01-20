package com.koreait.rest.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.koreait.rest.dto.PersonDto;

/*
 * @RestController
 * 1. REST 방식의 Controller입니다.
 * 2. 모든 메소드에는 자동으로 @ResponseBody가 붙는 것으로 처리
 * 	  : 모든 메소드의 반환 값은 JSP가 아니라 data 자체이다.
 */

@RestController
public class MyRestController {

	// @RequestMapping(value="getText", method=RequestMethod.GET, produces="text/plain; charset=UTF-8")
	
	@GetMapping(value="getText", produces="text/plain; charset=UTF-8")
	// 이런식으로 method 속성을 미리 정해줄 수 있다.
	// 만약 GetMapping이 먹히지 않는다면 GetMapping을 지원하지 않는 버전이라서 그렇다.
	// 버전 최신화를 해주거나 기존에 사용하던 RequestMapping을 사용한다.
	public String getText() {
		return "안녕하세요";
	}
	
	/*
	public String getJSON() {
		// 1) 우리가 연습했던 json-simple
		JSONObject obj = new JSONObject();
		obj.put("name", "제임스");
		obj.put("age", 20);
		return obj.toJSONString();
		// 2) open API -> 라이브러리를 사용하지 않는다고 가정하고 배포 따라서 JSON객체의 작성을 그대로 해준다.
		String responseBody = "{\"name\": \"제임스\", \"age\": 20}";
		return responseBody;
	}
	 */
	@GetMapping(value="getJSON", produces="application/json; charset=UTF-8")
	public PersonDto getJSON() {
		return new PersonDto("제임스", 20);
		// jacksondata bind
		// jackson 라이브러리는
		// 메소드의 반환타입과 제공해야하는 타입이 다르면
		// Bean을 자동으로 JSON으로 바꿔준다.
	}
	
	
	@GetMapping(value="getXML", produces="application/xml; charset=UTF-8")
	public PersonDto getXML() {
		return new PersonDto("앨리스", 30);
		// jackson 라이브러리가 Bean을 XML로 자동으로 변환한다.
		/*
		 * <name>앨리스</name>
		 * <age>30</age>
		 */
	}
	
	@GetMapping(value="getJSONList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public List<PersonDto> getJSONList(){
		List<PersonDto> list = new ArrayList<PersonDto>();
		for(int i = 0;i<10;i++) {
			list.add(new PersonDto("user"+(i+1), i+20));
		}
		return list;
	}
	
	@GetMapping(value="getXMLList", produces=MediaType.APPLICATION_XML_VALUE+";charset=UTF-8")
	public List<PersonDto> getXMLList(){
		List<PersonDto> list = new ArrayList<PersonDto>();
		for(int i = 0;i<10;i++) {
			list.add(new PersonDto("사용자"+(i+1), i+20));
		}
		return list;
	}
	
	@PostMapping(value="sendJSON", produces="application/json; charset=utf-8")
	public PersonDto sendJSON(@RequestBody PersonDto personDto) {
		// @requestBody
		// 전달 받은 데이터가 JSON/XML인 경우 이를 자동으로 Bean으로 전환한다.
		return personDto;
	}
	
	// REST : URI + Method(GET, POST, PUT, DELETE : 이 네가지 method로 CRUD를 구분한다.)
	// 요청 파라미터를 URI에 포함시킬 수 있습니다.
	
	// 기존 : simpleView?no=1
	// REST : simple/1
	
	// @PathVariable
	// 1. 주로 @RestConroller에서 사용된다.
	// 2. URI의 일부를 '{파라미터}'로 처리해서 
	
	@GetMapping(value="name/{name}/age/{age}", produces="application/json; charset=UTF-8")
	public PersonDto sendPath(@PathVariable String name, @PathVariable int age ) {
		// parameter가 URL(경로)에 포함되어 있는 경우 @PathVariable을 사용한다.
		// @PathVariable도 auto binding이 되는가?
		return new PersonDto(name, age);
	}
	
	@GetMapping(value="fn_getJSONByMap", produces="application/json; charset=UTF-8")
	public Map<String, Object> getJSONByMap(){
		Map<String, Object> map = new HashMap<>();
		map.put("name", "제시카");
		map.put("age", 20);
		return map;
	}
}
