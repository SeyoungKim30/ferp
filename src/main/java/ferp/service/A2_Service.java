package ferp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ferp.dao.A2_Dao;
import vo.SCPage;
import vo.StoreClerk;

@Service
public class A2_Service {
	
	@Autowired(required=false)
	private A2_Dao dao;
	
	public List<StoreClerk> storeClerkList(SCPage sch){
		if(sch.getClerkName() == null) sch.setClerkName("");
		sch.setCount(dao.totNum(sch));
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		if(sch.getPageSize()==0) {
			sch.setPageSize(5);
		}
		sch.setPageCount(
				(int)Math.ceil(
				sch.getCount()/(double)sch.getPageSize())
				);
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		sch.setBlockSize(5);
		int blocknum = (int)Math.ceil(sch.getCurPage()/
					(double)sch.getBlockSize());
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>sch.getPageCount()) {
			endBlock = sch.getPageCount();
		}
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		return dao.storeClerkList(sch);
	}
	
	public void insStoreclerk(StoreClerk ins) {
		dao.insStoreclerk(ins);
	}
	
	public void uptStoreClerk(StoreClerk upt) {
		dao.uptStoreClerk(upt);
	}
	
	public void delStoreClerk(int clerkNum) {
		dao.delStoreClerk(clerkNum);
	}
	
	public List<StoreClerk> storeClerkPayList(SCPage sch){
		if(sch.getClerkName() == null) sch.setClerkName("");
		sch.setCount(dao.totNum(sch));
		if(sch.getCurPage()==0) {
			sch.setCurPage(1);
		}
		if(sch.getPageSize()==0) {
			sch.setPageSize(10);
		}
		sch.setPageCount(
				(int)Math.ceil(
				sch.getCount()/(double)sch.getPageSize())
				);
		if(sch.getCurPage()>sch.getPageCount()) {
			sch.setCurPage(sch.getPageCount());
		}
		sch.setStart((sch.getCurPage()-1)*sch.getPageSize()+1);
		sch.setEnd(sch.getCurPage()*sch.getPageSize());
		sch.setBlockSize(5);
		int blocknum = (int)Math.ceil(sch.getCurPage()/
					(double)sch.getBlockSize());
		int endBlock = blocknum*sch.getBlockSize();
		if(endBlock>sch.getPageCount()) {
			endBlock = sch.getPageCount();
		}
		sch.setEndBlock(endBlock);
		sch.setStartBlock((blocknum-1)*sch.getBlockSize()+1);
		return dao.storeClerkPayList(sch);
	}
}
