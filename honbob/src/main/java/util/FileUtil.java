package util;

import java.io.File;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	
	public String fileName;

	public void fileUpload(MultipartFile file, String uploadPath) {
		if (!file.isEmpty()) {
			// 파일명 임의의숫자로 변경
			String ext = "";
			if (file.getOriginalFilename().lastIndexOf(".") > -1) { // 확장자가 있으면
				ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			}
			String fileName = new Date().getTime()+ext;
			this.fileName = fileName;
			
			// 파일저장
			System.out.println(uploadPath);
			try {
				file.transferTo(new File(uploadPath+fileName));
			} catch (Exception e) {
				System.out.println(e.toString());
			}
		}
	}
}
