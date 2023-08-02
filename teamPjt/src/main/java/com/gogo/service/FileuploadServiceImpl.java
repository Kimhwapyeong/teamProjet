package com.gogo.service;

import java.io.File;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gogo.mapper.FileuploadMapper;
import com.gogo.vo.FileuploadVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class FileuploadServiceImpl implements FileuploadService{
	
	private static final String ATTACHES_DIR = "D:\\teamProject\\teamProjetGit\\teamPjt\\src\\main\\webapp\\resources";
	
	@Autowired
	FileuploadMapper fileuploadMapper;
	
	public int fileupload(List<MultipartFile> files, String dir, String stayNo, String roomNo) {
		int insertRes = 0;
		for(MultipartFile file : files) {
			
			log.info("getoriname : " + file.getOriginalFilename());
			
			try {
				System.out.println("dir : " + dir);
				UUID uuid = UUID.randomUUID();
				String saveFileName = uuid + "_" + file.getOriginalFilename();
				File sFile = new File(ATTACHES_DIR + dir + getFolder(dir) + saveFileName);

				// file 을  sFile에 저장
				file.transferTo(sFile);
				
				FileuploadVO vo = new FileuploadVO();
				
				// 주어진 파일의 Mime유형
				String contentType =
						Files.probeContentType(sFile.toPath());
				
				// 이미지가 아니면 리턴 0
				if(contentType == null && !contentType.startsWith("image")) {
					System.out.println("이미지 아님");
					return 0;
				}
				System.out.println("sfile : " + sFile);
				vo.setFileName(file.getOriginalFilename());
				vo.setUuid(uuid.toString());
				vo.setUploadPath(getFolder(dir));
				vo.setStayNo(stayNo);
				vo.setRoomNo(roomNo);
				
				insertRes += fileuploadMapper.insert(vo);
				
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
		File saveDir = new File(ATTACHES_DIR + dir + uploadPath);
		System.out.println("fileuploadImpl getFolder saveDir : " + saveDir);
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
