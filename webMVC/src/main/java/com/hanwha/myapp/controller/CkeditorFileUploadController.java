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

	// ckeditor Upload �ּ�
	@RequestMapping(value="/board/imageUpload", method=RequestMethod.POST)
	public void imageUpload(HttpServletRequest request,HttpServletResponse response, 
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload)
			throws Exception{
		//���� ���� ����: �ߺ������̸� ����
		UUID uid = UUID.randomUUID();
		HttpSession ses = request.getSession();
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		//���ڵ�
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		try {
			//���� �̸� ��������
			String fileName= upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			
			//�̹��� ��� ����											�̹��� ���� ��� +				����Ǵ� �� ��¥
			String path = ses.getServletContext().getRealPath("/")+"resources\\boardImg\\";	
			String ckUploadPath = path + uid + "_" + fileName;
			
			System.out.println(path);
			File folder = new File(path);
			
			//�ش� ���丮 Ȯ��
			if(!folder.exists()) {
				try {
					folder.mkdir();//��������
				}catch(Exception e) {
					e.getStackTrace();
				}
			}
			
					out=new FileOutputStream(new File(ckUploadPath));
					out.write(bytes);
					out.flush(); //outputStream�� ����� �����͸� �����ϰ� �ʱ����
					
					printWriter = response.getWriter();
					String fileUrl = "/myapp/resources/boardImg/"+uid+"_"+fileName;// ��α� ȭ�鿡 �ѷ��ٶ�
					
					//���ε�� �޽��� ���
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