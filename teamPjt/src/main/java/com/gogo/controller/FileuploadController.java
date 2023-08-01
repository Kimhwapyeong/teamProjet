package com.gogo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gogo.service.FileuploadService;

@Controller
public class FileuploadController {

	
	@Autowired
	FileuploadService fileuploadService;
	
	
}
