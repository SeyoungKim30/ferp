package ferp.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.B1_Dao;
import vo.OpenTimeCalender;
import vo.Orders;
import vo.QA;
import vo.QAchecklist;
import vo.Store;

@Service
public class B1_Service {

	@Autowired(required=false)
	private B1_Dao dao;
	
	/*매장정보조회*/	
	//본사:지난달전체매장매출총액
	public int lastmonthAllSales() {
		return dao.lastmonthAllSales();
	}
	//본사:매장별매출 전체조회
	public List<Orders> salesByStoreList(Orders sbsl){
		
		if(sbsl.getFrSchOrderdt()==null) {
			// 서비스에서 if문써서 자바데이트로 넣기 
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
		    Calendar cal = Calendar.getInstance();
		    cal.add(Calendar.MONTH, -1);
		    sbsl.setFrSchOrderdt(formatter.format(cal.getTime()));
		    sbsl.setToSchOrderdt(formatter.format(cal.getTime()));
		}
		return dao.salesByStoreList(sbsl);
	}
	
	//본사:특정매장정보
	public Orders storeDetailInfo(String frRegiNum){
		return dao.storeDetailInfo(frRegiNum);
	}
	//본사:특정매장정보조회JSON
	public Map<String, Object> multipleJson(Orders dlist){
		
		Map<String, Object> jsonMap = new HashMap<>();		
		//본사:특정매장매출조회JSON
		jsonMap.put("detailSales", dao.detailSalesList(dlist));
		// 본사:특정매장메뉴매출조회JSON
		jsonMap.put("detailMenu", dao.detailMenuList(dlist));
		
		return jsonMap;
	}
	
	
	
	/*매장qa점검*/
	//qa표항목전체출력
	public List<QAchecklist> qaList(){
		return dao.qaList();
	};
	//qa표항목추가등록
	public void qaListIns(String qaItem) {
		dao.qaListIns(qaItem);
	}
	//qa표항목활성.비활성화
	public void qaListUpt(QAchecklist upt) {
		dao.qaListUpt(upt); 
	}
	
	//이달qa 전매장 조회
	public List<QA> qaStoresList(QA qa){
		return dao.qaStoresList(qa);
	}
	//이달qa 특정매장-매장정보 
	public QA qaDetailStrinfo(String frRegiNum){
		return dao.qaDetailStrinfo(frRegiNum);
	}
	//이달qa 특정매장-결과표  //json으로 넘기기
	public List<QA> qaDetailList(QA qa){
		return dao.qaDetailList(qa);
	}
	//이달qa 특정매장-결과점수
	public String qaDetailScore(String frRegiNum) {
		Map<String, Integer> mapr = new HashMap<String, Integer>(); // 빈 map을 선언
		List<QA> qlist = dao.qaDetailScore(frRegiNum); //리스트로 담아놓은 dao를
		/*
		(Y, 6)  >> Y가 key가 되고 6이 value
		(N, 1)  >> N가 key가 되고 2이 value
		*/
		for(QA qa:qlist) { //map에 담고
			mapr.put(qa.getResults(), qa.getYnCnt());
		}
		// 값을 각각 사용하기
        int ycnt = mapr.get("Y")!=null?mapr.get("Y"):0;
        int ncnt = mapr.get("N")!=null?mapr.get("N"):0;
        double result = Math.round( ycnt/(ycnt+ncnt)*100 )/100.0;

        String score = "";

		if(result>=0.9) {
			score="이상없음";
		}else if(result>0.7) {
			score="경미";
		}else{
			score="심각";
		}
		return score;		
	}
	
	
	
	/*매장오픈점검*/
	//본사:전매장오픈시간조회
	public List<Store> storeOpenList(Store otl) {
		return dao.storeOpenList(otl);
	}
	//본사:매장오픈시간상세조회
	public OpenTimeCalender storeDetailOpenTime(String writer){
		return dao.storeDetailOpenTime(writer);
	}
	//본사:매장오픈시간상세조회-캘린더
	public List<OpenTimeCalender> openTimeDetailCalendar(OpenTimeCalender otcd){
		return dao.openTimeDetailCalendar(otcd);

	}
	
	
	
}
