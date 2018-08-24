package com.team.medical.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.medical.persitence.CommonDAO;
import com.team.medical.persitence.GuestDAO;
import com.team.medical.vo.BloodVO;
import com.team.medical.vo.FoodVO;
import com.team.medical.vo.GuestVO;
import com.team.medical.vo.HealthcareVO;
import com.team.medical.vo.KcalVO;
import com.team.medical.vo.KcalorieVO;
import com.team.medical.vo.MyhealthVO;
import com.team.medical.vo.WeightVO;

@Controller
public class AndroidController {
	private Logger log = Logger.getLogger(this.getClass());

	@Autowired
	GuestDAO gudao;
	@Autowired
	CommonDAO codao;

	// 앱 로그인
	@ResponseBody // 웹에서 안드로이드로 값을 전달하기 위한 어노테이션
	@RequestMapping("androidSignIn")
	public Map<String, Object> androidSignIn(HttpServletRequest req) {
		log.info("androidSignIn()");

		// 안드로이드에서 전달한 값
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		log.info(id);
		log.info(pwd);
		Map<String, Object> in = new HashMap<String, Object>();
		in.put("id", id);
		in.put("pwd", pwd);
		int step = gudao.guestLogin(in);

		// 웹에서 전달할 값
		Map<String, Object> out = new HashMap<String, Object>();
		if (step != 0) {
			log.info("로그인 성공 : " + step);
			out.put("guestid", id);
		} else {
			log.info("로그인 실패");
			out.put("pwd", null);
		}

		return out;
	}

	// 앱 마이페이지
	@ResponseBody
	@RequestMapping("androidMyPageMain")
	public Map<String, Object> androidMyPageMain(HttpServletRequest req) {
		log.info("androidMyPageMain()");
		// 회원 정보
		String id = req.getParameter("id");

		System.out.println("id : " + id);

		GuestVO gVO = gudao.getGuestInfo(id);

		System.out.println("gVO : " + gVO);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data1", gVO.getGuestname());
		map.put("member", gVO);

		return map;
	}

	// 혈압
	@ResponseBody
	@RequestMapping("androidBlood")
	public Map<String, Object> androidBlood(HttpServletRequest req) {
		log.info("androidBlood()");
		// 회원 정보
		String id = req.getParameter("id");
		System.out.println("id : " + id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("title", "min");
		HealthcareVO minvo = codao.getAndroidHealthcareInfo(map);

		map.put("title", "max");
		HealthcareVO maxvo = codao.getAndroidHealthcareInfo(map);

		Map<String, Object> map2 = new HashMap<String, Object>();

		map2.put("data1", maxvo.getCareval());
		map2.put("data2", minvo.getCareval());

		return map2;
	}

	// 혈압
	@ResponseBody
	@RequestMapping("androidBloodAdd")
	public Map<String, Object> androidBloodAdd(HttpServletRequest req) {
		log.info("androidBloodAdd()");
		// 회원 정보
		String id = req.getParameter("id");
		String max = req.getParameter("max");
		String min = req.getParameter("min");
		System.out.println("id : " + id);

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("date", strDate);
		map.put("title", "bloodmin");
		map.put("careval", min);
		int cnt = codao.addAndroidHealthcareInfo(map);

		map.put("title", "bloodmax");
		map.put("careval", max);
		cnt = codao.addAndroidHealthcareInfo(map);

		Map<String, Object> map2 = new HashMap<String, Object>();

		map2.put("data1", cnt);

		return map2;
	}

	// 혈압 목록
	@ResponseBody
	@RequestMapping("androidBloodList")
	public Map<String, Object> androidBloodList(HttpServletRequest req) {
		log.info("androidBloodList()");
		List<BloodVO> items = new ArrayList<BloodVO>();

		// 회원 정보
		String id = req.getParameter("id");
		System.out.println("id : " + id);

		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("title", "min");
		List<HealthcareVO> minvo = codao.getAndroidHealthcareList(map);

		map.put("title", "max");
		List<HealthcareVO> maxvo = codao.getAndroidHealthcareList(map);
		for (int i = 0; i < minvo.size(); i++) {
			BloodVO vo = new BloodVO();
			vo.setGuestid(id);
			vo.setReg_date(minvo.get(i).getReg_date());
			System.out.println(minvo.get(i).getReg_date() + "a" + maxvo.get(i).getCareval());
			vo.setCarevalmax(maxvo.get(i).getCareval());
			vo.setCarevalmin(minvo.get(i).getCareval());
			items.add(vo);
		}
		Map<String, Object> map2 = new HashMap<String, Object>();
		for (int i = 0; i < items.size(); i++) {
			System.out.println("itmesDate = " + items.get(i).getReg_date());
		}
		map2.put("bloodVOList", items);

		return map2;
	}

	// 혈압
	@ResponseBody
	@RequestMapping("androidWeight")
	public Map<String, Object> androidWeight(HttpServletRequest req) {
		log.info("androidWeight()");
		// 회원 정보
		String id = req.getParameter("id");
		System.out.println("id : " + id);
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("title", "weight");
		HealthcareVO minvo = codao.getAndroidHealthcareInfo(map);

		map.put("title", "fat");
		HealthcareVO maxvo = codao.getAndroidHealthcareInfo(map);

		Map<String, Object> map2 = new HashMap<String, Object>();

		map2.put("data1", maxvo.getCareval());
		map2.put("data2", minvo.getCareval());

		return map2;
	}

	// 혈압
	@ResponseBody
	@RequestMapping("androidWeightAdd")
	public Map<String, Object> androidWeightAdd(HttpServletRequest req) {
		log.info("androidWeightAdd()");
		// 회원 정보
		String id = req.getParameter("id");
		String max = req.getParameter("weight");
		String min = req.getParameter("fat");
		System.out.println("id : " + id);

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		String strDate = dateFormat.format(Calendar.getInstance().getTime());

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("date", strDate);
		map.put("title", "fat");
		map.put("careval", min);
		int cnt = codao.addAndroidHealthcareInfo(map);

		map.put("title", "weight");
		map.put("careval", max);
		cnt = codao.addAndroidHealthcareInfo(map);
		GuestVO gVO = gudao.getGuestInfo(id);
		MyhealthVO vo = gudao.myHealth(gVO.getGuestNo());
		vo.setWeight(max);
		gudao.personalMofPro(vo);
		Map<String, Object> map2 = new HashMap<String, Object>();

		map2.put("data1", cnt);

		return map2;
	}

	// 체중 , 체지방
	@ResponseBody
	@RequestMapping("androidWeightList")
	public Map<String, Object> androidWeightList(HttpServletRequest req) {
		log.info("androidWeightList()");
		List<WeightVO> items = new ArrayList<WeightVO>();

		// 회원 정보
		String id = req.getParameter("id");
		System.out.println("id : " + id);

		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("title", "weight");
		List<HealthcareVO> minvo = codao.getAndroidHealthcareList(map);

		map.put("title", "fat");
		List<HealthcareVO> maxvo = codao.getAndroidHealthcareList(map);
		for (int i = 0; i < minvo.size(); i++) {
			WeightVO vo = new WeightVO();
			vo.setGuestid(id);
			vo.setReg_date(minvo.get(i).getReg_date());

			vo.setCarevalweight(minvo.get(i).getCareval());
			vo.setCarevalfat(maxvo.get(i).getCareval());
			items.add(vo);
		}
		Map<String, Object> map2 = new HashMap<String, Object>();
		for (int i = 0; i < items.size(); i++) {
			System.out.println("itmesDate = " + items.get(i).getReg_date());
		}
		map2.put("weightVOList", items);

		return map2;
	}

	// 칼로리
	@ResponseBody
	@RequestMapping("androidKcalorieList")
	public Map<String, Object> androidKcalorieList(HttpServletRequest req) {
		log.info("androidKcalorieList()");

		// 회원 정보
		String id = req.getParameter("id");
		System.out.println("id : " + id);
		GuestVO gvo = gudao.getGuestInfo(id);
		int guestNo = gvo.getGuestNo();
		ArrayList<KcalVO> kcallist = new ArrayList<KcalVO>();
		ArrayList<KcalorieVO> kcalList = gudao.getKcalList(guestNo);

		for (int i = 0; i < kcalList.size(); i++) {
			KcalVO vo = new KcalVO();
			vo.setDay(String.valueOf(kcalList.get(i).getDay()));
			vo.setKcal(kcalList.get(i).getKcal());
			vo.setFoodname(kcalList.get(i).getFoodname());
			kcallist.add(vo);
		}
		Map<String, Object> map2 = new HashMap<String, Object>();

		map2.put("kcalorieVOList", kcallist);

		return map2;
	}

	// 오늘 음식 등록 목록
	@ResponseBody
	@RequestMapping("androidFoodAddList")
	public Map<String, Object> androidFoodAddList(HttpServletRequest req) {
		log.info("androidFoodAddList()");

		String id = req.getParameter("id");
		GuestVO gvo = gudao.getGuestInfo(id);
		int guestNo = gvo.getGuestNo();
		Date sysdate = new Date(System.currentTimeMillis());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("guestno", guestNo);
		map.put("day", sysdate);
		ArrayList<KcalorieVO> kcalList = gudao.getKcalInfo(map);
		ArrayList<KcalVO> kcallist = new ArrayList<KcalVO>();
		for (int i = 0; i < kcalList.size(); i++) {
			KcalVO vo = new KcalVO();
			vo.setDay(String.valueOf(kcalList.get(i).getDay()));
			vo.setKcal(kcalList.get(i).getKcal());
			vo.setFoodname(kcalList.get(i).getFoodname());
			kcallist.add(vo);
		}
		Map<String, Object> map2 = new HashMap<String, Object>();

		map2.put("kcalorieVOList", kcallist);

		return map2;
	}

	// 음식 검색 목록
	@ResponseBody
	@RequestMapping("androidFoodSearchList")
	public Map<String, Object> androidFoodSearchList(HttpServletRequest req) {
		log.info("androidFoodSearchList()");

		// 회원 정보
		String select = req.getParameter("foodname");
		if (select.equals("음식이름")) {
			select = null;
		}
		ArrayList<FoodVO> dtos = null;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("select", select);
		map.put("sc", null);
		int cnt = gudao.getFoodCnt(map);
		map.put("start", 1);
		map.put("end", cnt);
		dtos = gudao.getFoodList(map);

		Map<String, Object> map2 = new HashMap<String, Object>();

		map2.put("foodVOList", dtos);

		return map2;
	}

	// 음식 선택등록
	@ResponseBody
	@RequestMapping("androidFoodSearchSelect")
	public Map<String, Object> androidFoodSearchSelect(HttpServletRequest req) {
		log.info("androidFoodSearchSelect()");

		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<KcalorieVO> dtos2 = new ArrayList<KcalorieVO>();
		KcalorieVO vo = new KcalorieVO();
		String id = req.getParameter("id");
		String foodname = req.getParameter("foodname");
		String kcal = req.getParameter("kcal");
		GuestVO gvo = gudao.getGuestInfo(id);
		int guestNo = gvo.getGuestNo();
		Date sysdate = new Date(System.currentTimeMillis());
		vo.setDay(sysdate);
		vo.setGuestno(guestNo);
		vo.setFoodname(foodname);
		vo.setKcal(kcal);
		dtos2.add(vo);
		map.put("dtos2", dtos2);
		int insertcnt = gudao.todaycal(map);
		Map<String, Object> map2 = new HashMap<String, Object>();

		map2.put("data1", insertcnt);

		return map2;
	}

}
