package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
	// 쿠키를 생성할 때에는 객체 생성, 경로, 유지기간 설정이 필요함 
	// 쿠키를 읽어올 때에는 배열로 가져옴 반복문과 조건문이 필요함 따라서 따로 클래스로 만듬 
	
	public static void makeCookie(HttpServletResponse response,
			String cName, String cValue, int cTime) {
		//쿠키 생성자에는 쿠키의 이름과 값(쿠키에 저장할 실제 데이터)을 무조건 넣어야 함 ! 
		Cookie cookie = new Cookie(cName, cValue);
		
		// 쿠키 생성후 쿠키 경로와 유지기간 설정하기 
		cookie.setPath("/");  // '/'로 설정햇다는 것은 웹 어플리케이션 전체에서 사용할 것 ! 
		cookie.setMaxAge(cTime);
		
		// 응답 헤더에 쿠키 추가하기 
		// 응답 헤더란 ? : 페이지 응답에 body위에 정보들이 있는데 그 부분을 헤더라고 한다.
		// 클라이언트가 서버에 처음 방문(요청)을 하면 쿠키가 생성되고 응답페이지를 보낼 때 
		// 쿠키를 같이 보내므로 response에 쿠키를 추가한다고 생각하면 된다 !! 
		response.addCookie(cookie);
		
	}
	
	// 쿠키이름으로 쿠키 값 가져오는 메소드
	// 클라이언트가 재방문(요청)을 할 때 쿠키를 같이 보내므로 
	// request에 있는 쿠키를 읽어온다고 생각 !
	public static String readCookie(HttpServletRequest request, String cName) {
		String cookieValue = "";
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(Cookie c : cookies) {
				String cookieName = c.getName();
				if(cookieName.equals(cName)) {
					cookieValue = c.getValue();
				}
			}
		}
		return cookieValue;
	}
	
	// 쿠키를 지울 때에는 쿠키의 값과 쿠키시간을 각각 null 과 0으로 만들면 됨 !! 
	// 위에서 작성한 makeCookie메소드를 이용해서 쿠키삭제함 
	public static void deleteCookie(HttpServletResponse response, String cName) {
		makeCookie(response, cName, "", 0);
	}
}
