package web.controller.auth;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import web.domain.UserVo;
import web.service.user.UserService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
 * 세션 관련 정보를 인터셉터하는 클래스는 LoginInterceptor.java를 참고하시오.
 */

@Controller
@RequestMapping("/auth")
public class AuthController {
	@Inject
	private UserService userService;

	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

	// 세션 검사
	public static boolean isValidSession(HttpServletRequest request) {
		if (request.getSession().getAttribute("user_name") != null && request.getSession().getAttribute("idx") != null) {
			return true;
		} else {
			return false;
		}
	}

	// 로그인 처리 - ajax
	@RequestMapping(value = "/login_ajax", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> loginAjaxPOST(UserVo userVo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		UserVo existUserVo = userService.read(userVo);

		// 사용자 있음
		if (existUserVo != null) {

			// 비밀번호 틀림
			if (!BCrypt.checkpw(userVo.getUser_pw(), existUserVo.getUser_pw())) {
				jsonData.put("result", "error");
				jsonData.put("message", "비밀번호가 틀렸습니다.");
			}

			// 로그인 성공
			else {
				HttpSession session = request.getSession(true);

				// 사용자 정보
				session.setAttribute("user_name", existUserVo.getUser_name());
				session.setAttribute("idx", existUserVo.getIdx());

				jsonData.put("result", "ok");
			}
		}

		// 사용자 없음
		else {
			jsonData.put("result", "error");
		}

		return jsonData;
	}
	
	// 로그아웃 처리
	@RequestMapping(value = { "/logout" }, method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loginout(ModelAndView mav, UserVo userVo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {

		// 세션 삭제
		HttpSession session = request.getSession(true);
		session.invalidate();

		rttr.addFlashAttribute("success", "로그아웃 되었습니다.");
		mav.setViewName("redirect:/");
		return mav;
	}
}
