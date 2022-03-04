package com.hanwha.myapp;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hanwha.myapp.service.BoardService;
import com.hanwha.myapp.service.MemberService;
import com.hanwha.myapp.vo.BoardVO;
import com.hanwha.myapp.vo.MemberVO;
import com.hanwha.myapp.vo.pagingVO;


@Controller
public class HomeController {
	
	/*
	@RequestMapping("/")
	public String home() {
		
		return "home";
	}
	*/
	
	@Inject
	BoardService service;
	
	@Inject
	MemberService service2;
	
	//리스트(글목록)
	@RequestMapping("/")
	public ModelAndView boardList(pagingVO pVo, HttpSession session) {
		System.out.println("searchKey(size)="+pVo.getSearchKey()+"\nsearchWord(검색어)="+pVo.getSearchWord());
		System.out.println("type="+pVo.getType());
		System.out.println("typesize="+pVo.getTypesize());
		
		ModelAndView mav = new ModelAndView();
		//DB에서 총레코드수 구하기
		pVo.setTotalRecord(service.totalRecord(pVo));
		//해당페이지의 레코드 선택
		List<BoardVO> lst = service.boardList(pVo);
		
		mav.addObject("lst", lst);
		
		String logStatus = (String)session.getAttribute("logStatus");
		String logId = (String)session.getAttribute("logId");
		MemberVO vo = new MemberVO();
		if(logStatus != null && logStatus.equals("Y") && pVo.getSearchWord()==null) {
			vo = service2.getMember(logId);
			
			System.out.println(vo.getIcon());
			System.out.println(vo.getSize1());
		}
		if(pVo.getSearchWord()!=null && !pVo.getSearchWord().equals("")) {
			
			mav.addObject("searchWord",pVo.getSearchWord());
			vo.setIcon(pVo.getType());
			System.out.println("icon="+vo.getIcon());
			//mav.addObject("pickSize", pVo);
		}
		mav.addObject("pickSize", vo);
		mav.addObject("pVo", pVo);
		mav.setViewName("home");
		
		return mav;
	}
	
}
