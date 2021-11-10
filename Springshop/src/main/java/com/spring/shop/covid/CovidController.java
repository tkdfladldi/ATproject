package com.spring.shop.covid;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.w3c.dom.Element;
@Controller
public class CovidController {
	
	@RequestMapping(value = "/covid", method = RequestMethod.GET)
	public String gallery(HttpServletRequest req) throws IOException {
		req.setAttribute("content", "covid/covid.jsp");
		req.setAttribute("gallerycontent", "gallery");
		
		  StringBuilder urlBuilder = new StringBuilder("http://openapi.data.go.kr/openapi/service/rest/Covid19/getCovid19InfStateJson"); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=S9rBaFio8QGz%2BFEnx2IHDcUggYJvdFMcEm%2Bc%2BPm8hhfuH%2BFRO9etq27vzdFKqrvvEHzibwKdl%2BwqGaOPyUkj1A%3D%3D&pageNo=1&numOfRows=10&startCreateDt=20200310&endCreateDt=20200315"); /*Service Key*/
	       
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
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
	        }
	        rd.close();
	        conn.disconnect();
	        System.out.println(sb.toString());
	        
				
	        
	        
			return "home";
	        
	    }
	}