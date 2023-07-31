package com.gogo.service;

import java.io.File;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FileuploadServiceImpl implements FileuploadService{

	public int fileupload(List<MultipartFile> files, String dir) {
		int insertRes = 0;
		for(MultipartFile file : files) {
			try {
				
				UUID uuid = UUID.randomUUID();
				String saveFileName = uuid + "_" + file.getOriginalFilename();
				File sFile = new File(dir + getFolder(dir) + saveFileName);
				
				// 주어진 파일의 Mime유형
				String contentType =
						Files.probeContentType(sFile.toPath());
				
				// 이미지가 아니면 리턴 0
				if(contentType != null && contentType.startsWith("image")) {
					// file 을  sFile에 저장
					file.transferTo(sFile);
					
				} else {
					return 0;
				}
			} catch(Exception e) {
				
			}
		}
		
		return insertRes;
	}
	
	// 중복 방지용 
	// 		업로드 날짜를 폴더 이름으로 사용
	//		2023/07/18
	public String getFolder(String dir) {
		LocalDate currentDate = LocalDate.now();	                       
		String uploadPath = currentDate.toString().replace("-", File.separator) + File.separator;
															/// 마지막 구분자를 넣어주지 않으면 경로로 인식하지 못하고, 마지막 일(day)이 파일명으로 등록 됨
		log.info("currentDate : " + currentDate);
		log.info("경로 : " + uploadPath);
		
		// 폴더 생성(없으면)
		File saveDir = new File(dir + uploadPath);
		if(!saveDir.exists()) {
			if(saveDir.mkdirs()) {
				log.info("폴더 생성!!!");
			}else {
				log.info("폴더 생성 실패!!");
			}
		}
		return uploadPath;
	}
}
