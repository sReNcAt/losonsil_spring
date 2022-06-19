package web.controller.character;

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
import web.domain.CharacterInfoVo;
import web.service.character_info.CharacterInfoService;
import web.service.user.UserService;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/character")
public class characterController {
	@Inject
	private CharacterInfoService characterInfoService;
	
	// home
	@RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mav) throws Exception {
		// 사이트 경로 표시
		String[] breadcrumbItem = {"", ""};
		mav.addObject("breadcrumbItem", breadcrumbItem);
		
		mav.setViewName("character/character");
		return mav; 
	}

	// 등록
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> createPOST(CharacterInfoVo characterInfoVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		String loggedInUserIdx = request.getSession().getAttribute("idx").toString();
		characterInfoVo.setUser_idx(loggedInUserIdx);
		if(loggedInUserIdx == null || loggedInUserIdx.equals("")) {
			jsonData.put("result", "error");
			return jsonData;
		}

		characterInfoVo.setCreateAt(DateTimeUtil.dateTime());
		// 거래처정보
		characterInfoVo = characterInfoService.create(characterInfoVo);
		jsonData.put("data", characterInfoVo);
		jsonData.put("result", "ok");
		return jsonData;
	}


	// 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> updatePOST(CharacterInfoVo characterInfoVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		String loggedInUserIdx = request.getSession().getAttribute("idx").toString();
		characterInfoVo.setUser_idx(loggedInUserIdx);
		if(loggedInUserIdx == null || loggedInUserIdx.equals("")) {
			jsonData.put("result", "error");
			return jsonData;
		}

		characterInfoVo.setUpdateAt(DateTimeUtil.dateTime());
		// 거래처정보
		characterInfoVo = characterInfoService.update(characterInfoVo);
		jsonData.put("data", characterInfoVo);
		jsonData.put("result", "ok");
		return jsonData;
	}

	// 보기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public @ResponseBody
	Map<String, Object> readGET(CharacterInfoVo characterInfoVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		String loggedInUserIdx = request.getSession().getAttribute("idx").toString();
		characterInfoVo.setUser_idx(loggedInUserIdx);
		if(loggedInUserIdx == null || loggedInUserIdx.equals("")) {
			jsonData.put("result", "error");
			return jsonData;
		}
		// 거래처정보
		characterInfoVo = characterInfoService.read(characterInfoVo);
		jsonData.put("data", characterInfoVo);
		jsonData.put("result", "ok");
		return jsonData;
	}

	// 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody
	Map<String, Object> listGET(CharacterInfoVo characterInfoVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		
		if(request.getSession().getAttribute("idx")==null) {
			jsonData.put("result", "error");
			return jsonData;
		}
		String loggedInUserIdx = request.getSession().getAttribute("idx").toString();
		characterInfoVo.setUser_idx(loggedInUserIdx);
		if(loggedInUserIdx == null || loggedInUserIdx.equals("")) {
			jsonData.put("result", "error");
			return jsonData;
		}
		// 거래처정보
		List<CharacterInfoVo> characterInfoVoList = characterInfoService.all(characterInfoVo);
		
		jsonData.put("data", characterInfoVoList);
		jsonData.put("result", "ok");

		return jsonData;
	}
}
