package web.controller.home;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	/*
	@Inject
	private OrdermstService ordermstService;
	*/
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// home
	@RequestMapping(value = {"/","home"}, method = RequestMethod.GET)
	public ModelAndView root(ModelAndView mav) {
		try {
			/*
			SimpleDateFormat format = new SimpleDateFormat ("yyyyMMdd");
			Date time = new Date();
			
			// 금일주문
			OrdermstVo ordermstVo = new OrdermstVo();
			ordermstVo.setSearchStartDate(DateTimeUtil.saveDate());
			ordermstVo.setSearchEndDate(DateTimeUtil.saveDate());
			List<OrdermstVo> ordermstVoList = ordermstService.all(ordermstVo);
			mav.addObject("todayOrder", ordermstVoList.size());
			*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName("home/dashboard");
		return mav;
	}

	// dashboard
	/*
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard(ModelAndView mav) {
		mav.setViewName("home/dashboard");
		return mav;
	}
	*/

	@RequestMapping(value = "/biakiss", method = RequestMethod.GET)
	public ModelAndView commingsoon(ModelAndView mav) {
		mav.setViewName("home/biakiss");
		return mav;
	}
	// commingsoon
	/*
	@RequestMapping(value = "/commingsoon", method = RequestMethod.GET)
	public ModelAndView commingsoon(ModelAndView mav) {
		mav.setViewName("etc/commingsoon");
		return mav;
	}
	*/

}
