package com.team.medical.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface GuestService {
	public void guestLogin(HttpServletRequest req, Model model);
}
