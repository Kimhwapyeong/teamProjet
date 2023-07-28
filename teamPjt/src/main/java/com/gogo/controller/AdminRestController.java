package com.gogo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gogo.service.mypageService;
import com.gogo.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class AdminRestController {

    @Autowired
    private mypageService mypageService;

    @GetMapping("/getMember")
    public List<MemberVO> getMemberAgeGroups() {
        List<MemberVO> member =  mypageService.getMemberAgeGroups();
        log.info("===========");
        log.info("member " + member); 
        return member;
    }
}
