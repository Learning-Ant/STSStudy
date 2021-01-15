package com.koreait.contact1.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
	@Getter
	@Setter
	getter, setter만 사용하고 싶으면 위의 annotation사용
*/
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
