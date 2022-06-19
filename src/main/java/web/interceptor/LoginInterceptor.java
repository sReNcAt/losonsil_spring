package web.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		/*
		try {
			// 로그인 페이지로 이동
			if(request.getSession().getAttribute("user_id") == null
					|| request.getSession().getAttribute("name") == null){
				if(request.getServletPath().substring(1,3).equals("ko")) {
					// 키오스크 인터셉터
					response.sendRedirect(request.getContextPath() + "/ko/sc0010");
				}else {
					response.sendRedirect(request.getContextPath() + "/auth/login");
				}
				return false;
			}else {
				if(request.getServletPath().length()>2) {
					if(request.getServletPath().substring(1,3).equals("ko") && request.getSession().getAttribute("kiosk_yn") == null) {
						// 키오스크 인터셉터
						response.sendRedirect(request.getContextPath() + "/ko/sc0010");
					}
				}
			}
		} catch (Exception e) {
			try {
				response.sendRedirect(request.getContextPath() + "/auth/login");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		*/
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		super.afterConcurrentHandlingStarted(request, response, handler);
	}

}
