package com.koreait.simple2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.koreait.simple2.dto.SimpleDto;

/*
 * 이번 SimpleDao는 singleton으로 만들지 않는다.
 * 대신 SimpleDao의 생성을 Spring에게 맡기는 DI 방식을 사용하겠습니다.
 */

public class SimpleDao {
	
	private DataSource dataSource;
	
	public SimpleDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); // java component environment?
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
	public void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if(con!=null) con.close();
			if(ps!=null) ps.close();
			if(rs!=null) rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/***** 1. list *****/
	public List<SimpleDto> simpleList(){
		List<SimpleDto> list = new ArrayList<SimpleDto>();
		try {
			con=dataSource.getConnection();
			sql="SELECT * FROM SIMPLE";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				SimpleDto simpleDto = new SimpleDto(rs.getInt("NO"), rs.getString("WRITER"), rs.getString("TITLE"), rs.getString("CONTENT"), rs.getDate("REGDATE"));
				list.add(simpleDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		
		return list;
	}
	
	/***** 2. insert *****/
	public void simpleInsert(SimpleDto simpleDto) {
		try {
			con=dataSource.getConnection();
			sql="INSERT INTO SIMPLE VALUES (SIMPLE_SEQ.NEXTVAL, ?, ?, ?, SYSDATE)";
			ps=con.prepareStatement(sql);
			ps.setString(1, simpleDto.getWriter());
			ps.setString(2, simpleDto.getTitle());
			ps.setString(3, simpleDto.getContent());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
	}
	
	/***** 3. view *****/
	public SimpleDto simpleView(int no) {
		SimpleDto simpleDto = new SimpleDto();
		try {
			con=dataSource.getConnection();
			sql="SELECT * FROM SIMPLE WHERE NO=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				simpleDto.setNo(no);
				simpleDto.setWriter(rs.getString("WRITER"));
				simpleDto.setTitle(rs.getString("TITLE"));
				simpleDto.setContent(rs.getString("CONTENT"));
				simpleDto.setRegDate(rs.getDate("REGDATE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return simpleDto;
	}
	
	/***** 4. update *****/
	public void simpleUpdate(SimpleDto simpleDto) {
		try {

			con=dataSource.getConnection();
			sql="UPDATE SIMPLE SET TITLE=?, CONTENT=? WHERE NO=?";
			ps=con.prepareStatement(sql);
			ps.setString(1, simpleDto.getTitle());
			ps.setString(2, simpleDto.getContent());
			ps.setInt(3, simpleDto.getNo());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
	}
	
	/***** 5. delete *****/
	public void simpleDelete(int no) {
		try {

			con=dataSource.getConnection();
			sql="DELETE FROM SIMPLE WHERE NO=?";
			ps=con.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(con, ps, null);
		}
	}
	
}
