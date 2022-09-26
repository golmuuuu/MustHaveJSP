package utils;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
	
	// 알림창 띄우고 url로 이동하는 메소드
	public static void alertLocation(String msg, String url, JspWriter out) {
		try {
			String script = ""
						+ "<script>"
						+ "		alert('" + msg + "');"
						+ "		location.href='" + url +"';"
						+ "</script>";
			//여기서 out은 JspWriter임 
			out.println(script);
		} catch (Exception e) {
		}
	}
	
	// 알림창 띄우고 이전페이지로 돌아가는 메소드 
	public static void alertBack(String msg, JspWriter out) {
		try {
			String script = ""
					+ "<script>"
					+ "		alert('"+ msg + "');"
					+ "		history.back();"
					+ "</script>";
			out.println(script);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
