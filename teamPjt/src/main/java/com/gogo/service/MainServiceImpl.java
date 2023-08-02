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
	public int insertRoom(RoomVO vo, RoomOptionVO optionVO) {
		
		int res = mainMapper.insertRoom(vo);
		System.out.println(vo.getRoomNo());
		if(res>0) {
			optionVO.setRoomNo(vo.getRoomNo());
			res = mainMapper.insertRoomOption(optionVO);
		}
		
		return res;
	}

	@Override
	public int roomFileupload(List<MultipartFile> files, String stayNo, String roomNo) {
		
		String dir = "rooom\\";
		int res = fileuploadService.fileupload(files, dir, stayNo, roomNo);
		
		return res;
	}
	


}
