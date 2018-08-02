package com.team.medical;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

class WebConnection{
	String json;
	ArrayList<String> json2 = new ArrayList<String>();
	WebConnection() throws Exception{
		
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		
		String[] arr = {"1100000000", "2600000000"};
		
		for (String arr1 : arr) {
		
			String address = "http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getFsnLifeList?serviceKey=A2X1aQuzE9qW3%2FmSsIpe83iQVh3HdleyFy5nRQQH%2BkUucy%2BBHAq9iIZYepGkzqLATSjd2zdaiS2CNkfW1Fm61g%3D%3D";
			String areaNo = "&areaNo="+arr1;
			String time = "&time="+date.format(today)+"06";
			String type = "&_type=json";
			BufferedReader br;
			URL url;
			HttpURLConnection conn;
			String protocol = "GET";
	
			url = new URL(address+areaNo+time+type);
			conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod(protocol);
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	
			json = br.readLine();
			/*
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject) jsonParser.parse(json);
	        JSONObject response = (JSONObject) jsonObject.get("response");
	        JSONObject body = (JSONObject) response.get("body");
	        JSONObject items = (JSONObject) body.get("items");
	        JSONArray item = (JSONArray) items.get("item");

	        System.out.println(response);
	        */
		}
		
	}
}




