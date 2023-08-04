package com.gogo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gogo.mapper.MainMapper;
import com.gogo.vo.RoomOptionVO;
import com.gogo.vo.RoomVO;
import com.gogo.vo.StayVO;

@Service
public class MainServiceImpl implements MainService{

	@Autowired
	MainMapper mainMapper;
	
	@Autowired
	FileuploadService fileuploadService;
	
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
			res = roomFileupload(files, stayNo, vo.getRoomNo());
		}
		return res;
	}

	@Override
	@Transactional
	public int insertStay(StayVO vo, List<MultipartFile> files) {
		
		
		  int res = mainMapper.insertStay(vo); 
		  System.out.println(vo.getStayNo());
		  System.out.println("insertStay res : " + res);
 
		  if(res>0) { 
			  String roomNo = "";
			  res = stayFileupload(files, vo.getStayNo(), roomNo); 
			  System.out.println("mainservice insertstay res : " + res);
		  }
		 
		  return res;
	}

	@Override
	public int roomFileupload(List<MultipartFile> files, String stayNo, String roomNo) {
		
		String dir = "room\\";
		int res = fileuploadService.fileupload(files, dir, stayNo, roomNo);
		
		return res;
	}
	
	@Override
	public int stayFileupload(List<MultipartFile> files, String stayNo, String roomNo) {
		//System.out.println("stayFileupload 입장!!!!!");
		String dir = "stay\\";
		int res = fileuploadService.fileupload(files, dir, stayNo, roomNo);
		
		return res;
	}
	


}
