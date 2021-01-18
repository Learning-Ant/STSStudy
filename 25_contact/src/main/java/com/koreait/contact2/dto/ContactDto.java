package com.koreait.contact2.dto;

import lombok.NoArgsConstructor;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ContactDto {
	
	private int no;
	private String name;
	private String phone;
	private String address;
	private String email;
	private String note;

}
