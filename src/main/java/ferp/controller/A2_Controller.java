package ferp.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ferp.service.A2_Service;
import vo.ClerkFile;
import vo.DefectOrder;
import vo.Emp;
import vo.Prod_ProdOrder;
import vo.Rq_Product;
import vo.SCPage;
import vo.Store;
import vo.StoreClerk;

@Controller
public class A2_Controller {
	
	@Value("${uploadJH}")
	private String fileupload;
	
	@Autowired(required=false)
	private A2_Service service;
	
//	직원 정보 리스트 조회
	@RequestMapping("/storeClerkList.do")
	public String pg3100(@ModelAttribute("SCsch") SCPage SCsch, Model d, HttpSession session) {
		String a = String.valueOf(session.getAttribute("login"));
		int i = a.indexOf("@");
		String vo = a.substring(0, i);
		if(vo.equals("vo.Emp")) {
			Emp s = (Emp)session.getAttribute("login");
			SCsch.setFrRegiNum(s.getFrRegiNum());			
		}else {
			Store s = (Store)session.getAttribute("login");
			SCsch.setFrRegiNum(s.getFrRegiNum());
		}
		d.addAttribute("scList", service.storeClerkList(SCsch));
		d.addAttribute("clerkTot", service.clerkTot());
		return "/WEB-INF/storeclerk/A2_storeClerkListCon.jsp";
	}
	
	@PostMapping("/storeClerkListSch.do")
	public String pg3100_1(@ModelAttribute("SCsch") SCPage SCsch, Model d) {
		d.addAttribute("scList", service.storeClerkList(SCsch));
		return "pageJsonReport";
	}
//	직원 정보 등록
	@PostMapping("/insStoreclerk.do")
	public String pg3101(StoreClerk ins, Model d) {
		service.insStoreclerk(ins);
		d.addAttribute("msg", "등록완료");
		return "pageJsonReport";
	}
//	직원 정보 수정
	@PostMapping("/uptStoreClerk.do")
	public String pg3102(StoreClerk upt, Model d) {
		service.uptStoreClerk(upt);
		d.addAttribute("msg", "수정완료");
		return "pageJsonReport";
	}
//	직원 정보 삭제
	@PostMapping("/delStoreClerk.do")
	public String pg3103(@RequestParam("clerkNum") String clerkNum, Model d) {
		service.delStoreClerk(clerkNum);
		d.addAttribute("msg", "삭제완료");
		return "pageJsonReport";
	}
//	직원 급여액 조회
	@RequestMapping("/clerkPayList.do")
	public String pg3300(@ModelAttribute("SCpsch") SCPage SCpsch, Model d, HttpSession session) {
		Store s=(Store)session.getAttribute("login");
		SCpsch.setFrRegiNum(s.getFrRegiNum());
		d.addAttribute("scList", service.storeClerkPayList(SCpsch));
		return "/WEB-INF/storeclerk/A2_clerkPayCon.jsp";
	}
//	발주 신청서 리스트 조회
	@RequestMapping("/requestProd.do")
	public String pg9101() {
		return "/WEB-INF/storeclerk/A2_orderRequestCon.jsp";
	}
//	자재 리스트 조회
	@ModelAttribute("plist")
	public List<Rq_Product> pg9101_1(Rq_Product pname){
		return service.availProd(pname);
	}
//	발주 신청서 등록
	@PostMapping("/requestFrm.do")
	public String pg9101_2(Prod_ProdOrder ins, Model d) {
		service.prodOrderReq(ins);
		d.addAttribute("msg", "등록완료");
		return "pageJsonReport";
	}
//	발주 신청서 조회
	@ModelAttribute("reqlist")
	public List<Prod_ProdOrder> requestList(@ModelAttribute("rSch") Prod_ProdOrder sch, HttpSession session){
		String a = String.valueOf(session.getAttribute("login"));
		int i = a.indexOf("@");
		String vo = a.substring(0, i);
		if(vo.equals("vo.Emp")) {
			Emp s = (Emp)session.getAttribute("login");
			sch.setDemander(s.getFrRegiNum());
		}else {
			Store s = (Store)session.getAttribute("login");
			sch.setDemander(s.getFrRegiNum());
		}
		
		return service.reqList(sch);
	}
//	발주 신청서 수정
	@PostMapping("/uptReqList.do")
	public String pg9103(Prod_ProdOrder upt, Model d) {
		service.uptReqList(upt);
		d.addAttribute("msg", "수정완료");
		return "pageJsonReport";
	}
//	발주 신청서 삭제
	@PostMapping("/delReqList.do")
	public String pg9102(Prod_ProdOrder del, Model d) {
		service.delReqList(del);
		d.addAttribute("msg", "삭제완료");
		return "pageJsonReport";
	}
//	카테고리 콤보박스
	@ModelAttribute("category")
	public List<Rq_Product> cateCombo(){
		return service.cateCombo();
	}
//	직원 서류 업로드
	@PostMapping("/clerkfilemanage.do")
	public String pg3104(@RequestParam("multiFileList") List<MultipartFile> multiFileList, HttpServletRequest request, ClerkFile upl, Model d) {
		File fileCheck = new File(fileupload);
		if(!fileCheck.exists()) fileCheck.mkdirs();
		List<Map<String, String>> fileList = new ArrayList<>();
		for(int i = 0; i < multiFileList.size(); i++) {
			String originFile = multiFileList.get(i).getOriginalFilename();
			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFile);	
			fileList.add(map);
		}
		try {
			for(int i = 0; i < multiFileList.size(); i++) {
				File uploadFile = new File(fileupload+multiFileList.get(i).getOriginalFilename());
				System.out.println(uploadFile+multiFileList.get(i).getOriginalFilename());
				multiFileList.get(i).transferTo(uploadFile);
				upl.setFname(multiFileList.get(i).getOriginalFilename());
				service.clerkfileupl(upl);
			}
		} catch (IllegalStateException | IOException e) {// 만약 업로드 실패하면 파일 삭제
			for(int i = 0; i < multiFileList.size(); i++) {
				new File(fileupload + fileList.get(i).get("changeFile")).delete();
			}	
			e.printStackTrace();
		}
		return "redirect:storeClerkList.do";
	}
//	직원 서류 리스트 조회
	@PostMapping("/fileListAjaxSch.do")
	public String pg3104_test2(ClerkFile sch, HttpSession session, Model d) {
		Store s = (Store)session.getAttribute("login");
		sch.setFrRegiNum(s.getFrRegiNum());
		d.addAttribute("flist", service.viewClerkFileInfo(sch));
		return "pageJsonReport";
	}
//	직원 서류 정보 수정
	@PostMapping("/uptClerkFile.do")
	public String pg3104_upt(ClerkFile upt, Model d) {
		service.clerkFileUpt(upt);
		d.addAttribute("msg", "수정완료");
		return "redirect:storeClerkList.do";
	}
//	직원 서류 정보 삭제
	@PostMapping("/delClerkFile.do")
	public String pg3104_del(ClerkFile del, Model d) {
		File file = new File(fileupload + del.getFname());
		if(file.exists()) {
			file.delete();
			service.clerkFileDel(del);
			d.addAttribute("msg", "삭제완료");			
		}else {
			d.addAttribute("msg", "파일이 존재하지 않습니다.");
		}
		return "redirect:storeClerkList.do";
	}
//	오배송/누락/자재 파손 처리 신청
	
//	오배송/누락/자재 파손 처리 신청 상태 조회
	@GetMapping("/viewDefectProd.do")
	public String pg9402(DefectOrder sch, Model d) {
		d.addAttribute("defectlist", service.viewDefectorder(sch));
		return "/WEB-INF/storeclerk/A2_defectOrderCon.jsp";
	}
}