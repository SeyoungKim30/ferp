package ferp.dao;

import java.util.List;

import vo.HOemp;
import vo.Menu;
import vo.Notice;
import vo.NoticeSch;
import vo.Store;

public interface B2_Dao {
	// 메뉴 조회
	public List<Menu> searchMenu(Menu sch);
	// 메뉴 등록
	public void insertMenu(Menu ins);
	
	
	// 매장 정보 등록
	public void insertStore(Store ins);
	// 매장 정보 수정
	public void updateStore(Store upt);
	// 해당 매장 정보 조회
	public Store detailStore(String frRegiNum);
	// 해당 매장 정보 삭제
	public void deleteStore(String frRegiNum);
	
	
	public int totCntNotice(NoticeSch sch);
	public int totCntQnA(NoticeSch sch);
	// 공지사항 조회
	public List<Notice> searchNotice(NoticeSch sch);
	// 공지사항 상세 페이지
	public Notice detailNotice(String noticeNum);
	// 조회수 증가
	public void plusCnt(String noticeNum);
	// 공지사항 등록
	public void insertNotice(Notice ins);
	// 공지사항 수정
	public void updateNotice(Notice upt);
	// 공지사항 삭제
	public void deleteNotice(String noticeNum);
	
	// 직원 콤보
	public List<HOemp> getHOemp();
	
	// 문의글 등록
	public void insertQnA(Notice ins);
	// 문의글 조회
	public List<Notice> searchQnA(NoticeSch sch);
	// 문의글 상세페이지
	public Notice detailQnA(String noticeNum);
	
}
