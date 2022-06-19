package web.controller.user;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import web.service.user.UserService;
import web.domain.UserVo;

@Controller
@RequestMapping("/user")
public class userController {
	
	@Inject
	private UserService userService;
	
	/*
	// home
	@RequestMapping(value = {"", "/", "/list"}, method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mav) throws Exception {
		// 사이트 경로 표시
		String[] breadcrumbItem = {"", ""};
		mav.addObject("breadcrumbItem", breadcrumbItem);
		
		mav.setViewName("weekWork/weekWork");
		return mav; 
	}
	*/
	
	// 등록
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> createPOST(UserVo userVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		
		UserVo tempUserVo = new UserVo();
		tempUserVo.setUser_name(userVo.getUser_name());
		tempUserVo = userService.read(tempUserVo);
		
		if(tempUserVo!=null) {
			jsonData.put("result", "error");
			return jsonData;
		}
		
		// 비밀번호 암호화
		userVo.setPassword(userVo.getUser_pw());
		String hashed = BCrypt.hashpw(userVo.getUser_pw(), BCrypt.gensalt(12));
		userVo.setUser_pw(hashed);

		// 등록
		userVo = userService.create(userVo);

		// 보기
		//userVo.setIdx(idx);
		userVo = userService.read(userVo);

		//jsonData.put("data", userVo);
		jsonData.put("result", "ok");

		return jsonData;
	}
}

