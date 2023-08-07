package com.gogo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.gogo.mapper.FileuploadMapper;
import com.gogo.mapper.MainMapper;
import com.gogo.vo.FileuploadVO;
import com.gogo.vo.RoomOptionVO;
import com.gogo.vo.RoomVO;
import com.gogo.vo.StayVO;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainMapper mainMapper;
	
	@Autowired
	FileuploadService fileuploadService;
	
	@Autowired
	FileuploadMapper fileuploadMapper;
	
	@Override
	public int insert(StayVO vo) {
		
		return mainMapper.insert(vo);
	}

	@Override
	@Transactional
	public int insertRoom(RoomVO vo, RoomOptionVO optionVO,
					List<MultipartFile> files, String stayNo) {
		
		int res = mainMapper.insertRoom(vo);
		System.out.println(vo.getRoomNo());
		if(res>0) {
			optionVO.setRoomNo(vo.getRoomNo());
			res = mainMapper.insertRoomOption(optionVO);
		}
		if(res>0) {
			FileuploadVO fileuploadVO = new FileuploadVO();
			fileuploadVO.setRoomNo(vo.getRoomNo());
			fileuploadVO.setStayNo(stayNo);
			fileuploadVO.setMemberId("");
			String dir = "room\\";
			res = fileuploadService.fileupload(files, dir, fileuploadVO);
		}
		return res;
	}

	@Override
	@Transactional
	public int insertStay(StayVO vo, List<MultipartFile> files) {
		
		int res = mainMapper.insertStay(vo);
		System.out.println(vo.getStayNo());
		System.out.println("insertStay res : " + res);
		
		String mainPic = "";
		if (res > 0) {
			FileuploadVO fileuploadVO = new FileuploadVO();
			fileuploadVO.setStayNo(vo.getStayNo());
			fileuploadVO.setRoomNo("");
			fileuploadVO.setMemberId("");
			String dir = "stay\\";
			mainPic = fileuploadService.fileuploadStay(files, dir, fileuploadVO);
			System.out.println("mainservice insertstay res : " + res);
		}
		vo.setMainPic1(mainPic);
		mainMapper.updateStayMainPic(vo);
		return res;
	}
//	public int insertStay(StayVO vo, List<MultipartFile> files) {
//		
//		
//		  int res = mainMapper.insertStay(vo); 
//		  System.out.println(vo.getStayNo());
//		  System.out.println("insertStay res : " + res);
// 
//		  if(res>0) { 
//			  FileuploadVO fileuploadVO = new FileuploadVO();
//			  fileuploadVO.setStayNo(vo.getStayNo());
//			  fileuploadVO.setRoomNo("");
//			  fileuploadVO.setMemberId("");
//			  String dir = "stay\\";
//			  res = fileuploadService.fileupload(files, dir, fileuploadVO);
//			  System.out.println("mainservice insertstay res : " + res);
//		  }
//		 
//		  return res;
//	}

	// stay 정보 불러오기
	public void getStay(StayVO vo, Model model){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stayVO", mainMapper.getStayOne(vo));
		map.put("listPhoto", fileuploadMapper.getStayPhotoList(vo));
		
		model.addAttribute("map", map);
	}

	@Override
	@Transactional
	public int updateStay(StayVO vo, List<MultipartFile> files) {
		System.out.println(vo);
		// StayVO 정보 수정(사진 제외)
		int res = mainMapper.updateStay(vo);
		int deleteRes = 0;
		
		if(files.size() > 0) {
			// 로컬에서 사진 삭제
			List<FileuploadVO> listPhoto = fileuploadMapper.getStayPhotoList(vo);
			for(FileuploadVO photo : listPhoto) {
				deleteRes += fileuploadService.deleteStayPhoto(photo);
			}
			System.out.println("deleteRes : " + deleteRes);
			
			FileuploadVO fileuploadVO = new FileuploadVO();
			
			fileuploadVO.setStayNo(vo.getStayNo());
			// db 에서 사진 삭제
			fileuploadMapper.deleteStayPhoto(fileuploadVO);
			
			fileuploadVO.setRoomNo("");
			fileuploadVO.setMemberId("");
			String dir = "stay\\";
			
			// 수정된 사진 업로드
			int fileuploadRes = fileuploadService.fileupload(files, dir, fileuploadVO);
			System.out.println("fileuploadRes" + fileuploadRes);
		}
		return res;
	}
	
//	@Override
//	public int roomFileupload(List<MultipartFile> files, FileuploadVO vo) {
//		
//		String dir = "room\\";
//		int res = fileuploadService.fileupload(files, dir, vo);
//		
//		return res;
//	}
//	
//	@Override
//	public int stayFileupload(List<MultipartFile> files, FileuploadVO vo) {
//		//System.out.println("stayFileupload 입장!!!!!");
//		String dir = "stay\\";
//		int res = fileuploadService.fileupload(files, dir, vo);
//		
//		return res;
//	}
	


}
