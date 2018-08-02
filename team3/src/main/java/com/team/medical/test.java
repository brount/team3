package com.team.medical;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedReader;
import java.io.IOException;

public class test {
	
	public @ResponseBody ArrayList<String> main(String[] args) throws IOException {
		
		java.util.Date today = new java.util.Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
		
		String[] arr = {"1100000000", "2600000000"};
        
		ArrayList<String> a = new ArrayList<String>();
		
		for (String arr1 : arr) {
			
	        StringBuilder urlBuilder = new StringBuilder("http://newsky2.kma.go.kr/iros/RetrieveLifeIndexService3/getFsnLifeList"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=A2X1aQuzE9qW3%2FmSsIpe83iQVh3HdleyFy5nRQQH%2BkUucy%2BBHAq9iIZYepGkzqLATSjd2zdaiS2CNkfW1Fm61g%3D%3D"); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("-", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
	        urlBuilder.append("&" + URLEncoder.encode("areaNo","UTF-8") + "=" + URLEncoder.encode(arr1, "UTF-8")); /*지점코드*/
	        urlBuilder.append("&" + URLEncoder.encode("time","UTF-8") + "=" + URLEncoder.encode(date.format(today)+"06", "UTF-8")); /*2017년6월8일6시*/
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	            a.add(line);
	        }
	        
	        rd.close();
	        conn.disconnect();
	        
		}
		
		
		
		System.out.println(a);
		return a;
		
    }

	
}
