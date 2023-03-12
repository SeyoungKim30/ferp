package ferp.dao;

import java.util.List;

import vo.OpenTimeCalender;
import vo.Orders;
import vo.QA;
import vo.QAchecklist;
import vo.Store;

public interface B1_Dao {
	
	//매장정보조회
	public int lastmonthAllSales(); //본사:지난달전체매장매출총액
	public List<Orders> salesByStoreList(Orders sbsl);	//본사:전매장매출-전체조회
	
	public Orders storeDetailInfo(String frRegiNum); //본사:매장정보상세조회
	public List<Orders> detailSalesList(Orders dinfo); //본사:매장정보상세조회-매매액
	public List<Orders> detailMenuList(Orders dinfo); //본사:매장정보상세조회-메뉴
	
	
	//QA점검
	public List<QAchecklist> qaList(); //qa표항목전체출력
	public void qaListIns(String qaItem); //qa표항목추가등록
	public void qaListUpt(QAchecklist upt); //qa표항목활성.비활성화
	
	public List<QA> qaStoresList(QA qa); //이달qa 전매장 조회
	public QA qaDetailStrinfo(String frRegiNum); //이달qa 상세조회-매장정보
	public List<QA> qaDetailList(QA qa);  //이달qa 상세조회-결과표
	public List<QA> qaDetailScore(String frRegiNum); //이달qa 상세조회-점수
	
	//담당 매장 점검
	public List<QA> inchargeStore(String empNum); //담당매장 목록
	public List<QA> inchargeStrQA(QA qa); //담당매장 목록-날짜랑 같이 출력

	

	
	//매장오픈점검
	public List<Store> storeOpenList(Store otl); //본사:전매장오픈시간-전체조회
	
	public OpenTimeCalender storeDetailOpenTime(String writer); //본사:매장오픈상세조회
	public List<OpenTimeCalender> openTimeDetailCalendar(OpenTimeCalender otcd); //본사:매장오픈상세조회-캘린더
}
