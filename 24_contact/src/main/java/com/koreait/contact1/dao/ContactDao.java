package com.koreait.contact1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.koreait.contact1.common.SpringJdbc;
import com.koreait.contact1.dto.ContactDto;

public class ContactDao {
	
	// DBCP를 직접 사용할 때는
	// 연결, PreparedStatement 생성, 실행, 반복, 연결 종료 등 모든 작업을
	// 반복적으로 개발자가 수행했었다.
	
	// 이 중 몇몇 작업(연결, PreparedStatement 생성 등)을 JdbcTemplate template이 처리한다.
	
	// 톰캣의 context.xml을 사용하지 않기 때문에 
	// context.lookup("java:comp/env/jdbc/oracle")를 호출할 필요가 없다.
	
	// common 패키지의 SpringJdbc.template을 불러와서 사용하면 됩니다.
	
	/*
	 * 예전에 parameter들을 해킹하려는 시도가 있었다.
	 * 그래서 스프링에서는 매개변수를 final 처리를 요구할 수 있다.
	 */
	
	// field
	private JdbcTemplate template;
	
	public ContactDao() {
		this.template = SpringJdbc.template;
		// Dao를 불러오는 곳이 command이고 command는 controller에서 불러오므로
		// SpringJdbc의 template은 static으로 처리되어있으므로 이미 만들어진 상태이다.
	}
	
	// 공통 필드는 이제 String sql 뿐이다.
	// 기존에 DBCP에서 사용했던 Connection, PreparedStatement, ResultSet은 이제 template이 담당한다.
	private String sql;
	
	/***** 1. list *****/
	public List<ContactDto> contactList(){
		sql = "SELECT * FROM CONTACT ORDER BY NO";
		List<ContactDto> list = template.query(sql, new BeanPropertyRowMapper<ContactDto>(ContactDto.class));
		// rowMapper(new BeanPropertyRowMapper) : sql과 일치하는 row를 알아서 Mapping해서 가져오는 객체
		// mappedClass : sql문으로 가져온 row들을 어떤 클래스와 mapping시킬껀지 알려주는 매개변수
		// BeanPropertyRowMapper<T> : Generic 처리가 필요하다.
		return list;
	}
	// INSERT, UPDATE, DELETE문(DML)은 모두 template.update()를 사용한다.
	
	/***** 2-1. view *****/
	public ContactDto contactView(int no) {
		sql = "SELECT * FROM CONTACT WHERE NO="+no;
		ContactDto contactDto = template.queryForObject(sql, new BeanPropertyRowMapper<ContactDto>(ContactDto.class));
		return contactDto;
	}
	
	/***** 2-2 view *****/
	public ContactDto contactView2(int no) {
		sql = "SELECT * FROM CONTACT WHERE NO=?";
		ContactDto contactDto = template.queryForObject(sql, new BeanPropertyRowMapper<ContactDto>(ContactDto.class), no);
		return contactDto;
	}
	
	/***** 3-1. insert *****/
	
	public void contactInsert1(ContactDto contactDto) {
		sql = "INSERT INTO CONTACT VALUES (CONTACT_SEQ.NEXTVAL, ?, ?, ?, ?, ?)";
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, contactDto.getName());
				ps.setString(2, contactDto.getPhone());
				ps.setString(3, contactDto.getAddress());
				ps.setString(4, contactDto.getEmail());
				ps.setString(5, contactDto.getNote());
			}
		});
	}
	public void contactInsert2(ContactDto contactDto) {
		sql = "INSERT INTO CONTACT VALUES (CONTACT_SEQ.NEXTVAL, ?, ?, ?, ?, ?)";
		template.update(sql, (ps)->{
			ps.setString(1, contactDto.getName());
			ps.setString(2, contactDto.getPhone());
			ps.setString(3, contactDto.getAddress());
			ps.setString(4, contactDto.getEmail());
			ps.setString(5, contactDto.getNote());
		});
	}
	
	/***** 3-2 insert *****/
	public void contactInsert3(String name, String phone, String address, String email, String note) {
		sql = "INSERT INTO CONTACT VALUES (CONTACT_SEQ.NEXTVAL, ?, ?, ?, ?, ?)";
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
			ps.setString(1, name);	
			ps.setString(2, phone);	
			ps.setString(3, address);	
			ps.setString(4, email);	
			ps.setString(5, note);	
			}
		});
	}
	
	/***** 3-3. insert *****/
	public void contactInsert4(ContactDto contactDto) {
		template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				sql = "INSERT INTO CONTACT VALUES (CONTACT_SEQ.NEXTVAL, ?, ?, ?, ?, ?)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, contactDto.getName());
				ps.setString(2, contactDto.getPhone());
				ps.setString(3, contactDto.getAddress());
				ps.setString(4, contactDto.getEmail());
				ps.setString(5, contactDto.getNote());
				return ps;
			}
		});
	}
	
	public void contactInsert5(ContactDto contactDto) {
		template.update((con)->{
			sql = "INSERT INTO CONTACT VALUES (CONTACT_SEQ.NEXTVAL, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, contactDto.getName());
			ps.setString(2, contactDto.getPhone());
			ps.setString(3, contactDto.getAddress());
			ps.setString(4, contactDto.getEmail());
			ps.setString(5, contactDto.getNote());
			return ps;
		});
	}
	
	/***** 4.update *****/
	
	public void contactUpdate(ContactDto contactDto) {
		sql = "UPDATE CONTACT SET NAME=?, PHONE=?, ADDRESS=?, EMAIL=?, NOTE=? WHERE NO=?";
		template.update(sql, (ps)->{
			ps.setString(1, contactDto.getName());
			ps.setString(2, contactDto.getPhone());
			ps.setString(3, contactDto.getAddress());
			ps.setString(4, contactDto.getEmail());
			ps.setString(5, contactDto.getNote());
			ps.setInt(6, contactDto.getNo());
		});
	}
	
	/***** 5. delete *****/
	// 사실 이런식으로 sql을 연결(+)해서 작성하는 건 좋지 않다.
	// 이유는 예시를 보면 알 수 있다 (SQL injection)
	/*
	 * 예시)
	 * "SELECT * FROM MEMBER WHERE ID = '"+id+"' AND PW = '" + pw + "'";
	 * 일 경우 만약 관리자의 id가 admin일 때를 생각해보자
	 * 그 때 로그인 id에 "admin' --" 를 입력하게 된다면
	 * 전달되는 쿼리문이
	 * SELECT * FROM MEMBER WHERE ID = 'admin' --' AND PW = '~~';
	 * 이 되는데 SQL에서 -- 뒷 부분은 주석처리 되어 비밀번호가 다르더라도
	 * 로그인에 성공하게 된다.
	 * 이는 mybatis의 ${}와 #{}의 차이에서도 비롯된다.
	 * #{}는 quoto가 붙어 문자 처리 되지만 ${}는 문자처리가 되지 않기때문에
	 * 위와 같은 현상이 발생할 수 있다.
	 */
	
	public void contactDelete1(int no) {
		sql = "DELETE FROM CONTACT WHERE NO="+no;
		template.update(sql);
	}
	public void contactDelete(int no) {
		sql = "DELETE FROM CONTACT WHERE NO=?";
		template.update(sql,(ps)->{
			ps.setInt(1, no);
		});
	}
	
	
	
	
}
