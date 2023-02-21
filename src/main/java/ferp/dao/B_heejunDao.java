package ferp.dao;

import vo.Menu;
import vo.Notice;
import vo.Store;

public interface B_heejunDao {
	// 메뉴 등록
	public void insertMenu(Menu ins);
	
	// 매장 정보 등록
	public void insertStore(Store ins);
	
	// 공지사항 등록
	public void insertNotice(Notice ins);
}
