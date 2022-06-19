package web.controller.dayWork;

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
@RequestMapping("/dayWork")
public class dayWorkController {
	@Inject
	private CharacterWorkService characterWorkService;
	
	// home
	@RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mav) throws Exception {
		// 사이트 경로 표시
		String[] breadcrumbItem = {"", ""};
		mav.addObject("breadcrumbItem", breadcrumbItem);
		
		mav.setViewName("dayWork/dayWork");
		return mav; 
	}

	// 등록
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> createPOST(CharacterWorkVo characterWorkVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		String loggedInUserIdx = request.getSession().getAttribute("idx").toString();
		if(loggedInUserIdx == null || loggedInUserIdx.equals("")) {
			jsonData.put("result", "error");
			return jsonData;
		}
		
		// 거래처정보
		characterWorkVo.setCreateAt(DateTimeUtil.dateTime());
		characterWorkVo = characterWorkService.create(characterWorkVo);

		jsonData.put("data", characterWorkVo);
		jsonData.put("result", "ok");

		return jsonData;
	}
	
	// 등록
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> updatePOST(CharacterWorkVo characterWorkVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		String loggedInUserIdx = request.getSession().getAttribute("idx").toString();
		if(loggedInUserIdx == null || loggedInUserIdx.equals("")) {
			jsonData.put("result", "error");
			return jsonData;
		}
		
		// 거래처정보
		characterWorkVo.setUpdateAt(DateTimeUtil.dateTime());
		characterWorkVo = characterWorkService.update(characterWorkVo);

		jsonData.put("data", characterWorkVo);
		jsonData.put("result", "ok");

		return jsonData;
	}
	
	// 등록
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public @ResponseBody
	Map<String, Object> readGET(CharacterWorkVo characterWorkVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		String loggedInUserIdx = request.getSession().getAttribute("idx").toString();
		if(loggedInUserIdx == null || loggedInUserIdx.equals("")) {
			jsonData.put("result", "error");
			return jsonData;
		}
		
		// 거래처정보
		characterWorkVo = characterWorkService.read(characterWorkVo);

		jsonData.put("data", characterWorkVo);
		jsonData.put("result", "ok");

		return jsonData;
	}
	
	// 등록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody
	Map<String, Object> listGET(CharacterWorkVo characterWorkVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		String loggedInUserIdx = request.getSession().getAttribute("idx").toString();
		if(loggedInUserIdx == null || loggedInUserIdx.equals("")) {
			jsonData.put("result", "error");
			return jsonData;
		}
		
		// 거래처정보
		List<CharacterWorkVo> characterWorkVoList = characterWorkService.all(characterWorkVo);

		jsonData.put("data", characterWorkVoList);
		jsonData.put("result", "ok");

		return jsonData;
	}
}
