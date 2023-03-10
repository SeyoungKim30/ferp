package ferp.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.C1_Dao;
import ferp.dao.C2_Dao;
import vo.ACStatement;
import vo.Account;
import vo.ProdOrder;
import vo.Prod_order_stock_emp_store;
import vo.Stock;
import vo.Store;

@Service
public class C1_Service {

	@Autowired
	C1_Dao dao;
	
	@Autowired
	C2_Dao daoC2;

	public List<Account> r7100SelectAccount(Account ac) {
		if(ac.getAcntNum()==null) {ac.setAcntNum("");}
		if(ac.getAcntTitle()==null) {ac.setAcntTitle("");}
		return dao.r7100SelectAccount(ac);
	}

	public int r7101insertAccount(Account ac) {
		return dao.r7101insertAccount(ac);
	}

	public int r7210insertStatement(String statementNum,String stmtDate,String frRegiNum,List<ACStatement> stmtlist) {
		int stmtcount=0;
		for (ACStatement stmt : stmtlist) {
			stmt.setStatementNum(statementNum);
			stmt.setStmtDate(stmtDate);
			stmt.setFrRegiNum(frRegiNum);
			stmtcount=+ dao.r7210insertStatement(stmt);
		}
		return stmtcount;
	}
	
	public int r7102updateAccountUsing(Account ac) {
		return dao.r7102updateAccountUsing(ac);
	}
	
	
	public List<ACStatement> r7211selectACStatement(ACStatement stmt) {
		if(stmt.getRronum()==null||stmt.getRronum().equals("")) {
			return dao.r7211selectACStatement(stmt);
		}else {
			return dao.r7211selectPrevNext(stmt);
		}
	}
	
	public int r7212updateACStatement(String statementNum,String stmtDate,String frRegiNum,List<ACStatement> stmtlist) {
		int stmtcount=0;
		for (ACStatement stmt : stmtlist) {
			stmt.setStatementNum(statementNum);
			stmt.setStmtDate(stmtDate);
			stmt.setFrRegiNum(frRegiNum);
			stmtcount=+ dao.r7212updateACStatement(stmt);
		}
		return stmtcount;
	}
	
	public List<ACStatement> r7204selectStatementList(ACStatement stmt,int howtosearch) {
		if(stmt.getStmtDate()==null||stmt.getStmtDate().equals("") ) {
			LocalDate now = LocalDate.now();
			stmt.setStmtDate(now+"");
		}
		if(stmt.getStmtDate2()==null||stmt.getStmtDate2().equals("")) {
			stmt.setStmtDate2(stmt.getStmtDate());
		}
		if(howtosearch==1) {
			return dao.r7204selectStatementList(stmt);
		}else {
			return dao.r7204selectStatementListByDate(stmt);
		}
	}
	
	public int r7213deleteACStatement(ACStatement acstmt) {
		return dao.r7213deleteACStatement(acstmt);
	}

	public List<Prod_order_stock_emp_store>r9201select(ProdOrder prodOrder){
		return dao.r9201select(prodOrder);
	}
	
	public List<Prod_order_stock_emp_store>r9201select999(ProdOrder prodOrder){
		return dao.r9201select999(prodOrder);
	}
	
	public int r9203updateOrderState(ProdOrder prodOrder) {
		if(prodOrder.getDemander().equals("9999999999")) {	//???????????? ????????? ??????, for??? ????????? dao??? ??????
			for(Prod_order_stock_emp_store poses : dao.r9201select999(prodOrder)) {
				System.out.println("?????? ?????? select?????? ???");
				if(prodOrder.getOrderStateUpdate().equals("??????")){
					Stock stock = new Stock();
					System.out.println("???????????? ?????????");
					//??????stock??? insert ???????????? ????????????
					stock.setApplyAmount(poses.getProdOrder().getAmount());
					stock.setFrRegiNum("9999999999");	//???????????? ????????? ???????????????
					stock.setProductNum(poses.getProdOrder().getProductNum());
					stock.setRemark(poses.getProdOrder().getOrderNum());
					daoC2.r8103InoutIns(stock);
				}
			}
		}else{
			for(Prod_order_stock_emp_store poses : dao.r9201select(prodOrder)) {
				Stock stock = new Stock();
				if(prodOrder.getOrderStateUpdate().equals("?????????")) {
						//??????stock??? insert ???????????? ????????? (?????????????????? ??????)
					stock.setApplyAmount(poses.getProdOrder().getAmount()*(-1));
					stock.setFrRegiNum(poses.getProdOrder().getSupplier()); //???????????? ????????? ???????????? ?????? ???????????? ?????????????????? ???????????????
					stock.setProductNum(poses.getProdOrder().getProductNum());
					stock.setRemark(poses.getProdOrder().getOrderNum());
					daoC2.r8103InoutIns(stock);
				}else if(prodOrder.getOrderStateUpdate().equals("??????")){
					//??????stock??? insert ???????????? ????????????
					stock.setApplyAmount(poses.getProdOrder().getAmount());
					stock.setFrRegiNum(poses.getProdOrder().getDemander());	//???????????? ????????? ???????????????
					stock.setProductNum(poses.getProdOrder().getProductNum());
					stock.setRemark(poses.getProdOrder().getOrderNum());
					daoC2.r8103InoutIns(stock);
				}
			}
		}
		return dao.r9203updateOrderState(prodOrder);
	}
	
	public List<Prod_order_stock_emp_store>r9310selectProdOrderPayState(ProdOrder prodOrder){
		if(prodOrder.getOrderDate()==null||prodOrder.getOrderDate().equals("")) {
			prodOrder.setOrderDate(prodOrder.getOrderDateMonth());
		}
		return dao.r9310selectProdOrderPayState(prodOrder);
	}
	
	public int r9311updateProdOrderPayState(ProdOrder prodOrder,int price,int tax) {
		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String dateString=dateFormat.format(date);
		if(prodOrder.getPaymentState().equals("????????? ??????")&&!prodOrder.getDemander().equals("0000000000")) {
			//?????? ????????? ????????? ????????????
			ACStatement ast= new ACStatement();
			//????????? ?????? : ?????? ????????????(??????)
			ast.setAcntNum("11600");
			ast.setCredit(0);
			ast.setDebit(price+tax);
			ast.setFrRegiNum("9999999999");
			ast.setLineNum(0);
			ast.setRemark(prodOrder.getOrderDateMonth()+" "+prodOrder.getDemander());
			ast.setStatementNum("AT");
			ast.setStmtDate(dateString);
			ast.setStmtOpposite(prodOrder.getDemander());
			dao.r7210insertStatement(ast);
			//?????? ?????????
			ast.setAcntNum("25500");
			ast.setCredit(tax);
			ast.setLineNum(1);
			dao.r7210insertStatement(ast);
			//?????? ????????????(??????)
			ast.setAcntNum("40100");
			ast.setCredit(price);
			ast.setDebit(0);
			ast.setLineNum(2);
			dao.r7210insertStatement(ast);
			//????????? ??????????????????(??????)
			ast.setAcntNum("45500");
			ast.setCredit(0);
			ast.setDebit(price);
			ast.setFrRegiNum(prodOrder.getDemander());
			ast.setLineNum(0);
			ast.setStmtOpposite("??????");
			dao.r7210insertStatement(ast);
			//?????????????????? (??????)
			ast.setAcntNum("13500");
			ast.setDebit(tax);
			ast.setLineNum(1);
			dao.r7210insertStatement(ast);
			//?????? ???????????????
			ast.setAcntNum("25100");
			ast.setCredit(price+tax);
			ast.setDebit(0);
			ast.setLineNum(2);
			dao.r7210insertStatement(ast);
		}
		if(prodOrder.getPaymentState().equals("??????")&&!prodOrder.getDemander().equals("0000000000")) {
			//?????? ????????? ????????? ????????????
			ACStatement ast= new ACStatement();
			//??????????????? ???????????? ?????????
			ast.setAcntNum("11600");
			ast.setDebit(0);
			ast.setCredit(price+tax);
			ast.setFrRegiNum("9999999999");
			ast.setLineNum(0);
			ast.setRemark(prodOrder.getOrderDateMonth()+" "+prodOrder.getDemander());
			ast.setStatementNum("AT");
			ast.setStmtDate(dateString);
			ast.setStmtOpposite(prodOrder.getDemander());
			dao.r7210insertStatement(ast);
			//?????? ??????
			ast.setAcntNum("10300");
			ast.setDebit(price+tax);
			ast.setCredit(0);
			ast.setLineNum(1);
			dao.r7210insertStatement(ast);
			//???????????? ?????? ???????????? ?????? ??????
			ast.setAcntNum("25100");
			ast.setFrRegiNum(prodOrder.getDemander());
			ast.setLineNum(0);
			ast.setStmtOpposite("??????");
			dao.r7210insertStatement(ast);
			//?????? ??????
			ast.setAcntNum("10300");
			ast.setCredit(price+tax);
			ast.setDebit(0);
			ast.setLineNum(1);
			dao.r7210insertStatement(ast);
		}
		
		return 	dao.r9311updateProdOrderPayState(prodOrder);
	}
	
	public List<Prod_order_stock_emp_store> r9301prodOrderPayDetail(ProdOrder prodOrder){
		return dao.r9301prodOrderPayDetail(prodOrder);
	}
	
	public List<Store> selectActiveStore(){
		return dao.selectActiveStore();
	}
	public Map<String, List<?>> selectActiveDatalist(){
		 Map<String, List<?>> listsMap = new HashMap<>();
		 listsMap.put("storelist",dao.selectActiveStore());
		 listsMap.put("emplist",dao.selectActiveEmp());
		 listsMap.put("productlist",dao.selectProduct());
		 return listsMap;
				
	}
	
	
}
