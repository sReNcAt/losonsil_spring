package web.controller.weekWork;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/weekWork")
public class weekWorkController {
	// home
	@RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mav) throws Exception {
		// 사이트 경로 표시
		String[] breadcrumbItem = {"", ""};
		mav.addObject("breadcrumbItem", breadcrumbItem);
		
		mav.setViewName("weekWork/weekWork");
		return mav; 
	}

	// 등록
	/*
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> createPOST(CustinfoVo custinfoVo, MargininfoVo margininfoVo, MultipartFile file) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
			// 거래처정보
		custinfoVo = custinfoService.create(custinfoVo);
			// 마진율 - 매출처
		if (custinfoVo.getCorrespondent_type().equals("O")) {
		}
		if (file != null) {

		return jsonData;
	}
	 */
}
