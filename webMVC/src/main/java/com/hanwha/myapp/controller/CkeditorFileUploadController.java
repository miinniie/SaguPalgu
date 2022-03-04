package com.hanwha.myapp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class CkeditorFileUploadController {
	SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	Date today = new Date();
	String dateForFile = format1.format(today);

	// ckeditor Upload 주소
	@RequestMapping(value="/board/imageUpload", method=RequestMethod.POST)
	public void imageUpload(HttpServletRequest request,HttpServletResponse response, 
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload)
			throws Exception{
		//랜덤 문자 생성: 중복파일이름 방지
		UUID uid = UUID.randomUUID();
		HttpSession ses = request.getSession();
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		//인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		try {
			//파일 이름 가져오기
			String fileName= upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			
			//이미지 경로 생성											이미지 파일 경로 +				저장되는 날 날짜
			String path = ses.getServletContext().getRealPath("/")+"resources\\boardImg\\";	
			String ckUploadPath = path + uid + "_" + fileName;
			
			System.out.println(path);
			File folder = new File(path);
			
			//해당 디렉토리 확인
			if(!folder.exists()) {
				try {
					folder.mkdir();//폴더생성
				}catch(Exception e) {
					e.getStackTrace();
				}
			}
			
					out=new FileOutputStream(new File(ckUploadPath));
					out.write(bytes);
					out.flush(); //outputStream에 저장된 데이터를 전송하고 초기ㅗ하
					
					printWriter = response.getWriter();
					String fileUrl = "/myapp/resources/boardImg/"+uid+"_"+fileName;// 블로그 화면에 뿌려줄때
					
					//업로드시 메시지 출력
					printWriter.print("{\"filename\" : \""+fileName+"\",\"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
					printWriter.flush();
					
				}catch(IOException e){
				e.printStackTrace();
				}finally{
					try {
					if (out != null) {out.close();}
					if (printWriter != null) {printWriter.close();}
				} catch (IOException e) {e.printStackTrace();}
			}
		return;
		}
}