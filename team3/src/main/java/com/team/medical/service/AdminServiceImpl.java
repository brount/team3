package com.team.medical.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.team.medical.persitence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminDAO dao;
	// 관리자 로그인
	@Override
	public void adminLoginPro(HttpServletRequest req, Model model) {		
		String id =req.getParameter("id");
		String pwd = req.getParameter("pwd");
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pwd", pwd);
		int loginCnt = dao.adminLoginPro(map);
		if(loginCnt==1) {
			req.getSession().setAttribute("id", id);
		}else {
			req.getSession().setAttribute("member",null);
		}
		model.addAttribute("loginCnt",loginCnt);
		
	}
	
}
