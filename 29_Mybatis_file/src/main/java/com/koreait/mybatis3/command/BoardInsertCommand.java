package com.koreait.mybatis3.command;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.mybatis3.dao.BoardDao;

public class BoardInsertCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)model.asMap().get("multipartRequest");
		RedirectAttributes rttr = (RedirectAttributes)model.asMap().get("rttr");
		
		// multipartRequest에 저장된 일반 파라미터는 getParameter()를 쓴다.
		String writer = multipartRequest.getParameter("writer");
		String title = multipartRequest.getParameter("title");
		String content = multipartRequest.getParameter("content");
		
		
		// 1. multipartRequest에 저장된 첨부가 1개 일 때는 getFile()을 쓴다.
		// multipartRequest.getFile("filename"); -> parameter는 변수명(<input>태그의 name값)을 기입
		
		// 2. multipartRequest에 저장된 첨부가 2개 이상일 때는 getFiles()를 쓴다.
		// 첨부 타입이 multiple이면 첨부된 파일들은 List에 저장되어 넘어옵니다.
		// 각 첨부 파일들의 타입은 MultipartFile이다.
		/*
		 * <input type="file" name="files" multiple />
		 * List<MultipartFile> files = multipartRequest.getFiles("files");
		 */
		List<MultipartFile> files = multipartRequest.getFiles("files");
		int insertResult = 0;
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		// 첨부를 했는지 검사
		if(files != null && !files.isEmpty()) {
			
			// 첨부를 하나씩 꺼내기
			for(MultipartFile file : files) {
				
				// 꺼낸 첨부가 있는지 검사
				if (file != null && !file.isEmpty()) {
					
					// MultipartFile file에서 첨부하는 파일명을 알아낸다.
					String originalFilename = file.getOriginalFilename();
					
					// 업로드할 파일명의 중복 방지 대책을 수립한다.
					// 원래파일명_업로드시간.확장자
					// String filename = originalFilename.replace(".", "_"+System.currentTimeMillis()+".");
					// 이 방법은 모든 .들을 다 바꾸게 된다.
					
					// abcde.jpg
					// 확장자 (jpg) 구하기
					String extension = originalFilename.substring(originalFilename.lastIndexOf(".")+1);
					// 파일명 (abcde) 구하기
					String filename = originalFilename.substring(0, originalFilename.lastIndexOf("."));
					
					// 업로드 할 파일명 만들기
					String uploadFilename = filename + "_" + System.currentTimeMillis() + "." + extension;
					
					// 업로드 할 경로 구하기
					// 업로드는 resources/storage 디렉토리에 저장하기로 한다.
					// 자바 코드로 storage directory를 만들기 때문에 미리 만들어 둘 필요가 없습니다.
					String realPath = multipartRequest.getServletContext().getRealPath("resources/storage");
					
					// 업로드할 경로가 없으면 storage 디렉토리를 만든다.
					File dir = new File(realPath);
					
					if(!dir.exists()) {
						dir.mkdirs();	// 하위폴더까지 만들어주는 mkdirs를 쓰자
					}
					
					// 이제 업로드할 파일명(uploadFilename)과 경로(realPath)를 모두 알고 있다.
					File uploadFile = new File(realPath, uploadFilename);
					
					// 첨부한 파일(MultipartFile file) -> 업로드 (uploadFile) 합니다.
					try {
						file.transferTo(uploadFile);
					} catch (Exception e) {
						e.printStackTrace();
					}
					
					// 테이블에 데이터를 저장합니다.
					insertResult += boardDao.boardInsert(writer, title, content, uploadFilename);
				} // if(file != null)
			} // for( file : files)
		} else {// if(files!=null)
			insertResult += boardDao.boardInsert(writer, title, content, "첨부없음");
		}
		/*
		if (files == null || !files.isEmpty()) {
			insertResult += boardDao.boardInsert(writer, title, content, "첨부없음");
		}
		*/
		rttr.addFlashAttribute("insertResult", insertResult);
		rttr.addFlashAttribute("afterInsert", true);
		
	}

}
