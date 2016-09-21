package utility;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class AdminLoginCheckFilter implements Filter {

	public void init(FilterConfig arg0) throws ServletException {
		//필터 안에 있는 추상 메소드인데 그냥 오버라이딩 해놔야함 -_-
		//안하면 얘도 추상 클래스 되기 때문...
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		// Filter가 요청 중간에서 request 객체를 추출합니다.
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		//request를 형변환해서 가져옴... 'ㅅ')

		// 새로운 세션을 생성하지않고 request 객체에서 기존의 세션 반환
		HttpSession session = httpRequest.getSession(false);

		// 로그인 하지 않았다고 가정
		boolean login = false;

		if (session != null) { // session 객체가 생성되어 있는지 확인 - 연결이 되어져 있나? 'ㅁ' 확인하는 것
			// 로그인을 했으면서 관리자인지 확인합니다.
			if (session.getAttribute("id") != null && session.getAttribute("grade").equals("A")) {
				login = true; // 관리자라면
			}
		}

		// 정상적으로 로그인이 되었다면 요청 페이지로 이동합니다.
		if (login) {
			chain.doFilter(request, response); // 요청 페이지로 이동 ! 
		} else {
			// 로그인이 안되었다면 로그인 페이지로 이동
			RequestDispatcher dispatcher = request.getRequestDispatcher("/member/loginForm.jsp");
			
			//이거 전에 sendredirect 같은 우리의친구임 쟤는 재응답
			//forward는 이동!
			
			dispatcher.forward(request, response);
			
			/*
			 * 
			RequestDispatcher dispatcher = request.getRequestDispatcher("/member/loginForm.jsp");
			//권한이 없으면 쟤가 적용됨
			 * 
			dispatcher.forward(request, response);
			//권한이 있을 경우 얘가 적용되는데
			 * 
			 * request객체가 다 살아있음! :>
			 * 
			 * */
		}
	}

	public void destroy() {
	}
}