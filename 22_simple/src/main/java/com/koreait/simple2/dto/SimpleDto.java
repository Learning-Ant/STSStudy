package com.koreait.simple2.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SimpleDto {
	
	private int no;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
}
