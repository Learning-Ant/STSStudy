package com.koreait.rest.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberDto {

	private int no;
	private String id;
	private String name;
	private String gender;
	private String address;
}
