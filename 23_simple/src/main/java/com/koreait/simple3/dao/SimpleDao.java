package com.koreait.simple3.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.koreait.simple3.dto.SimpleDto;

public class SimpleDao {

	private DataSource dataSource;
	
	public SimpleDao() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private String sql;
	
	public void close(Connection con, PreparedStatement ps, ResultSet rs) {
		try {
			if(con!=null) {con.close();}
			if(ps!=null) {ps.close();}
			if(rs!=null) {rs.close();}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<SimpleDto> simpleList() {
		List<SimpleDto> list = new ArrayList<SimpleDto>();
		try {
			con=dataSource.getConnection();
			sql="SELECT * FROM SIMPLE";
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				SimpleDto simpleDto = new SimpleDto();
				simpleDto.setNo(rs.getInt("NO"));
				simpleDto.setWriter(rs.getString("WRITER"));
				simpleDto.setTitle(rs.getString("TITLE"));
				simpleDto.setContent(rs.getString("CONTENT"));
				simpleDto.setRegDate(rs.getDate("REGDATE"));
				list.add(simpleDto);
			}
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			close(con, ps, rs);
		}
		return list;
	}
	
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
	
}
