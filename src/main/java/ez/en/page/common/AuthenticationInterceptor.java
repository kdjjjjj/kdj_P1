package ez.en.page.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AuthenticationInterceptor implements HandlerInterceptor {

//	Controller가 요청을 처리하기전에 호출하는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
//		클라이넌트의 부여한 세션을 가져온다
		HttpSession session = request.getSession();

		if (session.getAttribute("user") == null && session.getAttribute("admin") == null) {
//			로그인 으로 이동시키키
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
//		로그인이 되어 있으면 그냥 통과
		return true;

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
