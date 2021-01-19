package com.koreait.mybatis3.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BoardDto {
	
	private int no;
	private String writer;
	private String title;
	private String content;
	private String filename;
	private Date regDate;
	// filename은 한 단어로 보는 것이 좋다.
	// 이 이름을 옵션?으로 쓰는 아이들이 있따.
	// 실제로 File의 속성이나 메소드 이름들도 모두 한 단어로 취급한다.
	
}
