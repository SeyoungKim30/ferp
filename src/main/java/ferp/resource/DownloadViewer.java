package ferp.resource;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadViewer extends AbstractView {

	@Value("${doc.path}")
	String path;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//저장될 파일 생성
		String downloadFileName=(String)model.get("downloadFileName");	//파일 이름만 받음
		File file=new File(path+downloadFileName);
		
		response.setContentType("application/download;charset=utf-8");
		response.setContentLengthLong((int)file.length());
		downloadFileName=URLEncoder.encode(downloadFileName, "utf-8").replaceAll("\\+"," ");
		response.setHeader("Content-Disposition", "attachment;filename=\""+downloadFileName+"\"");
		response.setHeader("Content-Transfer-Endocing", "binary");
		
		FileInputStream fis = new FileInputStream(file);
		OutputStream out = response.getOutputStream();
		FileCopyUtils.copy(fis,out);
		
		out.flush();
	}

}
