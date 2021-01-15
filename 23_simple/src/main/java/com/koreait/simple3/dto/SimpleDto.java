package com.koreait.simple3.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class SimpleDto {
	
	private int no;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
}
