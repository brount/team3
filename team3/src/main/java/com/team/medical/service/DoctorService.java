package com.team.medical.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface DoctorService {
	public void doctorLogin(HttpServletRequest req, Model model);
}
