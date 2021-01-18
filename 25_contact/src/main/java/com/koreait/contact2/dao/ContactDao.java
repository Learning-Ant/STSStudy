package com.koreait.contact2.dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.koreait.contact2.common.SpringJdbc;
import com.koreait.contact2.dto.ContactDto;

public class ContactDao {

	private JdbcTemplate template;
	private String sql;
	
	
	public ContactDao() {
		this.template = SpringJdbc.template;
	}
	
	public List<ContactDto> contactList(){
		sql = "SELECT * FROM CONTACT";
		List<ContactDto> list = template.query(sql, new BeanPropertyRowMapper<ContactDto>(ContactDto.class));
		return list;
	}
	
	public ContactDto contactView(int no) {
		sql = "SELECT * FROM CONTACT WHERE NO=?";
		ContactDto contactDto = template.queryForObject(sql, new BeanPropertyRowMapper<ContactDto>(), no);
		return contactDto;
	}
	
	public void contactInsert(ContactDto contactDto) {
		sql = "INSERT INTO CONTACT VALUES (CONTACT_SEQ.NEXTVAL, ?, ?, ?, ?, ?)";
		template.update(sql, (ps)->{
			ps.setString(1, contactDto.getName());
			ps.setString(2, contactDto.getPhone());
			ps.setString(3, contactDto.getAddress());
			ps.setString(4, contactDto.getEmail());
			ps.setString(5, contactDto.getNote());
		});
	}
	
	public void contactUpdate(ContactDto contactDto) {
		sql ="UPDATE CONTACT SET NAME=?, PHONE=?, ADDRESS=?, EMAIL=?, NOTE=? WHERE NO=?";
		template.update(sql, (ps)->{
			ps.setString(1, contactDto.getName());
			ps.setString(2, contactDto.getPhone());
			ps.setString(3, contactDto.getAddress());
			ps.setString(4, contactDto.getEmail());
			ps.setString(5, contactDto.getNote());
			ps.setInt(6, contactDto.getNo());
		});
	}
	
	public void contactDelete(int no) {
		sql = "DELETE FROM CONTACT WHERE NO=?";
		template.update(sql, (ps)->{
			ps.setInt(1, no);
		});
	}
	
}
