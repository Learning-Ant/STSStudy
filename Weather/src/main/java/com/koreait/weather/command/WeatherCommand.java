package com.koreait.weather.command;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class WeatherCommand {
	public String execute() {
		String address = "http://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108";
		URL url = null;
		HttpURLConnection con = null;
		BufferedReader br = null;
		StringBuffer sb = new StringBuffer();
		try {
			url = new URL(address);

			con = (HttpURLConnection)url.openConnection();

			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line = null;
			while(true) {
				line = br.readLine();
				if (line == null) {
					break;
				}
				sb.append(line);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(br!=null) br.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}
}
