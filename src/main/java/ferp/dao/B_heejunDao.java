package ferp.dao;

import java.util.List;

import vo.Menu;
import vo.Notice;
import vo.NoticeSch;
import vo.Store;

public interface B_heejunDao {
	// 메뉴 등록
	public void insertMenu(Menu ins);
	
	// 매장 정보 등록
	public void insertStore(Store ins);
	
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
}
