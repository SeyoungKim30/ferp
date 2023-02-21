package ferp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ferp.service.B_heejunService;
import vo.Menu;
import vo.Notice;
import vo.Store;

@Controller
public class B_heejunController {
	@Autowired(required = false)
	private B_heejunService service;
	
	
	// 본사 홈페이지 controller
	
	
	// 메뉴 등록 controller
	// http://localhost:7080/ferp/menuInsert.do
	@GetMapping("/menuInsert.do")
	public String menuInsert() {
		return "WEB-INF\\view\\menu_insert.jsp";
	}
	@PostMapping("/menuInsert.do")
	public String menuInsert(Menu ins, RedirectAttributes redirect) {
		if( service.insertMenu(ins) != null ) {
			redirect.addFlashAttribute("msg", "메뉴 등록 성공!");
		}
		// redirect로 본사 홈페이지로 이동
		return "";
	}
	
	// 매장정보등록 controller
	// http://localhost:7080/ferp/storeInsert.do
	@GetMapping("/storeInsert.do")
	public String storeInsert() {
		return "WEB-INF\\view\\store_insert.jsp";
	}
	@PostMapping("/storeInsert.do")
	public String storeInsert(Store ins, RedirectAttributes redirect) {
		if( service.insertStore(ins) != null ) {
			redirect.addFlashAttribute("msg", "매장정보등록 성공!!");
		}
		// redirect로 본사 홈페이지로 이동
		return "";
	}
	
	// 공지사항 조회
	
	// 공지사항 등록
	// http://localhost:7080/ferp/noticeInsert.do
	@GetMapping("/noticeInsert.do")
	public String noticeInsert() {
		return "WEB-INF\\view\\notice_insert.jsp";
	}
	@PostMapping("/noticeInsert.do")
	public String noticeInsert(Notice ins, RedirectAttributes redirect) {
		if( service.insertNotice(ins) != null ) {
			redirect.addFlashAttribute("msg", "공지사항 등록 성공!");
		}
		// redirect로 공지사항 조회 controller 호출
		return "";
	}
	// 공지사항 수정
	
	// 공지사항 삭제
}
