package ferp.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ferp.dao.B_heejunDao;
import vo.HOemp;
import vo.Menu;
import vo.Notice;
import vo.NoticeSch;
import vo.Store;

@Service
public class B_heejunService {
	@Autowired(required = false)
	private B_heejunDao dao;
	
	// 업로드할 경로 지정
	@Value("${upload}")
	private String upload;
	
	// 메뉴등록 시 사진 업로드
	public String upload(MultipartFile multipartfile) {
		String img = multipartfile.getOriginalFilename();
		if( img!=null && !img.equals("")) {
			File imgObj = new File(upload+img);
			
			try {
				multipartfile.transferTo(imgObj);
			} catch (IllegalStateException e) {
				System.out.println("파일업로드 예외1:"+e.getMessage());
			} catch (IOException e) {
				System.out.println("파일업로드 예외2:"+e.getMessage());
			}
		}
		
		return img;
	}
	
	// 메뉴 등록
	public String insertMenu(Menu ins) {
		String img = upload(ins.getMultipartfile());
		
		ins.setImg(img);
		
		dao.insertMenu(ins);
		
		return img;
	}
	
	// 매장 정보 등록
	public String insertStore(Store ins) {
		if(ins.getEno()==0) ins.setEno(0);
		
		dao.insertStore(ins);
		
		return ins.getFrName();
	}
	// 매장 정보 수정
	public String updateStore(Store upt) {
		
		dao.updateStore(upt);
		
		return upt.getFrRepName();
	}
	// 해당 매장 정보 조회
	public Store detailStore(String frRegiNum) {
		
		return dao.detailStore(frRegiNum);
	}
	// 해당 매장 정보 삭제
	public String deleteStore(String frRegiNum) {
		dao.deleteStore(frRegiNum);
		
		return frRegiNum;
	}
	
	
	
	// 공지사항 조회
	public List<Notice> searchNotice(NoticeSch sch){
		if(sch.getTitle()==null) sch.setTitle("");
		
		return dao.searchNotice(sch);
	}
	// 공지사항 상세 페이지
	public Notice detailNotice(String noticeNum) {
		// 조회수 증가
		dao.plusCnt(noticeNum);
		
		return dao.detailNotice(noticeNum);
	}
	// 공지사항 등록
	public String insertNotice(Notice ins) {
		if( ins.getMultipartfile() != null) {
			String fname = upload(ins.getMultipartfile());
			
			ins.setFname(fname);
		}
		if( ins.getMultipartfile() == null ) {
			
			ins.setFname("");
		}
		dao.insertNotice(ins);
		
		return ins.getTitle();
		
	}
	// 공지사항 수정
	public String updateNotice(Notice upt) {
		if( upload(upt.getMultipartfile())!=null && !upload(upt.getMultipartfile()).equals("")){
			String fname = upload(upt.getMultipartfile());
			upt.setFname(fname);
		}
		
		if(upt.getFname()==null) upt.setFname("");
		
		dao.updateNotice(upt);
		
		return upt.getNoticeNum();
	}
	// 공지사항 삭제
	public String deleteNotice(String noticeNum) {
		
		dao.deleteNotice(noticeNum);
		
		return noticeNum;
	}
	
	// 직원 콤보박스
	public List<HOemp> getHOemp(){
		return dao.getHOemp();
	}
}
