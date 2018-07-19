package com.team.medical.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface AdminService {
	public void adminLoginPro(HttpServletRequest req, Model model);
}
