package ferp.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ferp.dao.B_heejunDao;
import vo.Menu;
import vo.Notice;
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
		dao.insertStore(ins);
		
		return ins.getFrName();
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
}
