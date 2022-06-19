package web.controller.calc;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import srencat.utils.DateTimeUtil;
import web.domain.CharacterWorkVo;
import web.service.character_info.CharacterInfoService;
import web.service.character_work.CharacterWorkService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/calc")
public class calcController {
	
	@RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mav) throws Exception {
		// 사이트 경로 표시
		String[] breadcrumbItem = {"", ""};
		mav.addObject("breadcrumbItem", breadcrumbItem);
		
		mav.setViewName("calc/calc");
		return mav; 
	}

}
