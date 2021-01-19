package com.koreait.mybatis3.command;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;

/*
 * DownloadCommand는 sqlSession을 사용하지 않기 때문에,
 * BoardCommand를 구현하지 않아도 상관 없다.
 */

public class DownloadCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		HttpServletRequest request = (HttpServletRequest)model.asMap().get("request");
		HttpServletResponse response = (HttpServletResponse)model.asMap().get("response");
		
		// 다운로드 받을 파일명을 구합니다. 
		String filename = request.getParameter("filename");
		
		// 다운로드 받을 파일의 경로를 구한다.
		String realPath = request.getServletContext().getRealPath("resources/storage");
		
		// 업로드 할 때 원래 파일명이 변경된 상태로 업로드가 된다.
		// 다운로드 할 때는 원상복구 해주겠다. (선택작업)
		
		// 원래 파일명 : abcde.jpg
		// 업로드 파일명 : abcde_1234567.jpg
		
		// 확장자 (.jpg) : 점을 포함해서 뺍니다.
		String extension = filename.substring(filename.lastIndexOf("."));
		
		// 파일명 (abcde)
		String originalFilename = filename.substring(0, filename.lastIndexOf("_"));
		
		// 다운로드 할 파일명을 만든다.
		String downloadFilename = originalFilename + extension;
		
		// 다운로드 할 파일을 준비해 둔다.
		File file = new File(realPath, filename);
		
		// 다운로드는 파일 복사의 개념이므로
		// 바이트 기반의 입출력 스트림을 준비한다.
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		try {
			// 다운로드의 개념
			// 요청한 곳으로 파일을 복사시켜주는 "응답"의 개념
			// application/octet-stream
			response.setHeader("Content-Type", MediaType.APPLICATION_OCTET_STREAM_VALUE);
			// response.setHeader("Content-Type", "application/x-msdownload");
			response.setHeader("Content-Disposition", "attachment; filename="+new String(URLEncoder.encode(downloadFilename, "UTF-8")));
			response.setHeader("Content-Length", file.length()+"");
			
			// 입력 스트림 : 다운로드 할 파일을 읽어서,
			// 출력 스트림 : 응답한다.
			bis = new BufferedInputStream(new FileInputStream(file));
			bos = new BufferedOutputStream(response.getOutputStream());
			
			// bis로 모두 읽어서 bos로 보내면 된다.
			// FileCopyUtils 스프링 클래스를 쓰면 편리하다.
			FileCopyUtils.copy(bis, bos);
			
			// 혹시 남아있는 출력 데이터가 있다면 모두 보내 버린다.
			bos.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) { 
			e.printStackTrace();
		} finally {
			try {
				if(bos!=null) bos.close();
				if(bis!=null) bis.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
	}

}
