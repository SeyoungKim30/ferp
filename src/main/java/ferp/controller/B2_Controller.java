package ferp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ferp.service.B2_Service;
import vo.HOemp;
import vo.Menu;
import vo.Notice;
import vo.NoticeSch;
import vo.Store;

@Controller
public class B2_Controller {
	@Autowired(required = false)
	private B2_Service service;
	
	@ModelAttribute("empCombo")
	public List<HOemp> getHOemp(){
		return service.getHOemp();
	}
	
	// 본사 홈페이지 controller
	@RequestMapping("/mainpage.do")
	public String mainpage() {
		return "WEB-INF\\view\\mainpage.jsp";
	}
	
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
		return "redirect:/mainpage.do";
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
		// redirect로 매장정보조회페이지로 이동
		return "redirect:/mainpage.do";
	}
	// 매장 정보 수정
	// http://localhost:7080/ferp/storeUpdate.do?frRegiNum=132-1537-132
	@GetMapping("/storeUpdate.do")
	public String storeUpdate(@RequestParam String frRegiNum, Model d) {
		d.addAttribute("store", service.detailStore(frRegiNum));
		
		return "WEB-INF\\view\\store_update.jsp";
	}
	@PostMapping("/storeUpdate.do")
	public String storeUpdate(Store upt, RedirectAttributes redirect) {
		if( service.updateStore(upt) != null) {
			redirect.addFlashAttribute("updMsg", "매장 정보 수정 완료");
		}
		
		// 매장 정보 조회 페이지로 redirect
		return "";
	}
	// 매장 정보 삭제
	@RequestMapping("/storeDelete.do")
	public String storeDelete(@RequestParam String frRegiNum, RedirectAttributes redirect) {
		if( service.deleteStore(frRegiNum) != null ) {
			redirect.addFlashAttribute("delMsg", "매장 정보 삭제 완료");
		}
		// 매장 정보 조회 페이지로 redirect
		return "";
	}
	
	
	// 공지사항 조회
	// http://localhost:7080/ferp/noticeList.do
	@RequestMapping("/noticeList.do")
	public String noticeList(@ModelAttribute("sch") NoticeSch sch, Model d) {
		d.addAttribute("list", service.searchNotice(sch));
		
		return "WEB-INF\\view\\notice_list.jsp";
	}
	// 공지사항 상세 페이지로 이동
	@RequestMapping("noticeDetail.do")
	public String noticeDetail(@RequestParam String noticeNum, Model d) {
		d.addAttribute("notice", service.detailNotice(noticeNum));
		
		return "WEB-INF\\view\\notice_detail.jsp";
	}
	// 파일 다운로드
	@GetMapping("/download.do")
	public String download(@RequestParam String fname, Model d) {
		d.addAttribute("downloadFile", fname);
		
		return "downloadViewer";
	}
	// 공지사항 등록
	// http://localhost:7080/ferp/noticeInsert.do
	@GetMapping("/noticeInsert.do")
	public String noticeInsert() {
		return "WEB-INF\\view\\notice_insert.jsp";
	}
	@PostMapping("/noticeInsert.do")
	public String noticeInsert(Notice ins, RedirectAttributes redirect) {
		if( service.insertNotice(ins) != null ) {
			redirect.addFlashAttribute("insMsg", "공지사항 등록 성공");
		}
		// redirect로 공지사항 조회 controller 호출
		return "redirect:/noticeList.do";
	}
	// 공지사항 수정
	@GetMapping("/noticeUpdate.do")
	public String noticeUpdate(@RequestParam String noticeNum, Model d) {
		d.addAttribute("notice", service.detailNotice(noticeNum));
		
		return "WEB-INF\\view\\notice_update.jsp";
	}
	@PostMapping("/noticeUpdate.do")
	public String noticeUpdate(Notice upt, RedirectAttributes redirect) {
		if( service.updateNotice(upt) != null) {
			redirect.addFlashAttribute("uptMsg", "공지사항 수정 성공");
		}
		
		return "redirect:/noticeList.do";
	}
	// 공지사항 삭제
	@RequestMapping("/noticeDelete.do")
	public String noticeDelete(@RequestParam String noticeNum, RedirectAttributes redirect) {
		if( service.deleteNotice(noticeNum) != null ) {
			redirect.addFlashAttribute("delMsg", "공지사항 삭제 완료");
		}
		
		return "redirect:/noticeList.do";
	}
}