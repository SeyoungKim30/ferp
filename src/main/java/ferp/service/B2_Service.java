package ferp.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ferp.dao.B2_Dao;
import vo.Emp;
import vo.Menu;
import vo.Notice;
import vo.NoticeSch;
import vo.Store;

@Service
public class B2_Service {
	@Autowired(required = false)
	private B2_Dao dao;
	
	// 업로드할 경로 지정
	@Value("${upload}")
	private String upload;
	
	// 메뉴 조회
	public List<Menu> searchMenu(Menu sch){
		if(sch.getMenuName()==null) sch.setMenuName("");
		
		return dao.searchMenu(sch);
	}
	
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
	
	
	// 본사 직원 등록
	public String insertEmp(Emp ins) {
		
		dao.insertEmp(ins);
		
		return ins.getEmpnum();
	}
	// 본사 직원 비밀번호 변경
	public String updateEmpPass(Emp upt) {
		dao.updateEmpPass(upt);
		
		return upt.getEmpnum();
	}
	
	
	// 공지사항 조회
	public List<Notice> searchNotice(NoticeSch sch){
		if(sch.getTitle()==null) sch.setTitle("");
		
		sch.setCount(dao.totCntNotice(sch));
		
		if(sch.getCurPage()==0) sch.setCurPage(1);
		
		if(sch.getPageSize()==0) sch.setPageSize(10);
		
		sch.setPageCount( (int)Math.ceil(sch.getCount()/(double)sch.getPageSize()) );
		
		if(sch.getCurPage()>sch.getPageCount()) sch.setCurPage(sch.getPageCount());
		
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setEnd(sch.getPageSize()*sch.getCurPage());
		sch.setBlockSize(5);
		
		int blocknum = (int)Math.ceil((double)sch.getCurPage()/sch.getBlockSize());
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock > sch.getPageCount()) endBlock = sch.getPageCount();
		sch.setEndBlock(endBlock);

		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
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
	public List<Emp> getHOemp(){
		return dao.getHOemp();
	}
	// 문의글 카테고리 콤보
	public List<String> getNoticeCategory(){
		return dao.getNoticeCategory();
	}
	
	
	// 문의글 조회
	public List<Notice> searchQnA(NoticeSch sch){
		if(sch.getTitle()==null) sch.setTitle("");
		
		sch.setCount(dao.totCntQnA(sch));
		if(sch.getCurPage()==0) sch.setCurPage(1);
		if(sch.getPageSize()==0) sch.setPageSize(10);
		sch.setPageCount( (int)Math.ceil(sch.getCount()/(double)sch.getPageSize()) );
		if(sch.getCurPage()>sch.getPageCount()) sch.setCurPage(sch.getPageCount());
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setEnd(sch.getPageSize()*sch.getCurPage());
		sch.setBlockSize(5);
		int blocknum = (int)Math.ceil((double)sch.getCurPage()/sch.getBlockSize());
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock > sch.getPageCount()) endBlock = sch.getPageCount();
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		
		return dao.searchQnA(sch);
	}
	// 문의글 상세페이지
	public Notice detailQnA(String noticeNum) {
		dao.plusCnt(noticeNum);
		
		return dao.detailQnA(noticeNum);
	}
	// 문의글 등록 & 답변
	public String insertQnA(Notice ins) {
		if( ins.getMultipartfile() != null) {
			String fname = upload(ins.getMultipartfile());
			ins.setFname(fname);
		}
		if( ins.getMultipartfile() == null ) {
			ins.setFname("");
		}
		dao.insertQnA(ins);
		
		return ins.getTitle();
	}
	// 문의글 수정
	public String updateQnA(Notice upt) {
		if( upload(upt.getMultipartfile())!=null && !upload(upt.getMultipartfile()).equals("")){
			String fname = upload(upt.getMultipartfile());
			upt.setFname(fname);
		}
		if(upt.getFname()==null) upt.setFname("");
		
		dao.updateQnA(upt);
		
		return upt.getNoticeNum();
	}
	// 문의글 삭제
	public String deleteQnA(String noticeNum) {
		dao.deleteQnA(noticeNum);
		
		return noticeNum;
	}
}

