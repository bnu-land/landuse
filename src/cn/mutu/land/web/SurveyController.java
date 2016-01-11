package cn.mutu.land.web;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mutu.land.common.Encoder;
import cn.mutu.land.service.SurveyService;

@Controller
public class SurveyController {
	private SurveyService surveyServcie;

	@Autowired
	public SurveyController(SurveyService surveyServcie) {
		this.surveyServcie = surveyServcie;
	}

	// --------------------企业到期预警--------------------------------
	@RequestMapping(value = "/get_SurveyDataManager")
	@ResponseBody
	public Map<String, Object> getSurveyDataManager(
			@RequestParam("searchKeyword") String searchKeyword)
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.surveyServcie.getSurveyDataManager(searchKeyword);
	}
}
