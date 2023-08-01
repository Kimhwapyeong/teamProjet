package com.gogo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface FileuploadService {

	public int fileupload(List<MultipartFile> files, String dir
						,String stayNo, String roomNo);
}
