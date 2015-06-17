package cn.mutu.land.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mutu.land.common.Encoder;
import cn.mutu.land.model.LanduseIntensityConstruct;
import cn.mutu.land.model.LanduseIntensityExpansion;
import cn.mutu.land.model.LanduseIntensityIntension;
import cn.mutu.land.service.LanduseCalculationService;

@Controller
public class LanduseCalculationController {
	private LanduseCalculationService landServcie;

	@Autowired
	public LanduseCalculationController(LanduseCalculationService landServcie) {
		this.landServcie = landServcie;
	}

	// --------------------拓展潜力--------------------------------
	@RequestMapping(value = "/get_expansion")
	@ResponseBody
	public Map<String, Object> getExpansion(
			@RequestParam("searchKeyword") String searchKeyword)
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.landServcie.getExpansionList(searchKeyword);
		//
	}

	// 添加
	@RequestMapping(value = "/add_expansion", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addLandKfqType(
			@RequestBody LanduseIntensityExpansion type) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.landServcie.addExpansion(type);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// 修改
	@RequestMapping(value = "/update_expansion", method = RequestMethod.POST)
	// ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateLandKfqType(
			@RequestBody LanduseIntensityExpansion type) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.landServcie.updateExpansion(type);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// 删除
	@RequestMapping(value = "/del_expansion")
	// ,method=RequestMethod.POST)
	@ResponseBody
	public void delLandKfqType(@RequestParam("id") String id)
			throws IOException {
		this.landServcie.deleteExpansion(id);
	}

	// --------------------结构潜力--------------------------------
	@RequestMapping(value = "/get_construct")
	@ResponseBody
	public Map<String, Object> getConstruct(
			@RequestParam("searchKeyword") String searchKeyword)
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.landServcie.getConstructList(searchKeyword);
		//
	}

	// 添加
	@RequestMapping(value = "/add_construct", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addConstruct(
			@RequestBody LanduseIntensityConstruct type) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.landServcie.addConstruct(type);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// 修改
	@RequestMapping(value = "/update_construct", method = RequestMethod.POST)
	// ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateConstruct(
			@RequestBody LanduseIntensityConstruct type) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.landServcie.updateConstruct(type);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// 删除
	@RequestMapping(value = "/del_construct")
	// ,method=RequestMethod.POST)
	@ResponseBody
	public void delConstruct(@RequestParam("id") String id) throws IOException {
		this.landServcie.deleteConstruct(id);
	}

	// --------------------结构潜力--------------------------------
	@RequestMapping(value = "/get_intension")
	@ResponseBody
	public Map<String, Object> getIntension(
			@RequestParam("searchKeyword") String searchKeyword)
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.landServcie.getIntensionList(searchKeyword);
		//
	}

	// 添加
	@RequestMapping(value = "/add_intension", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addIntension(
			@RequestBody LanduseIntensityIntension type) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.landServcie.addIntension(type);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// 修改
	@RequestMapping(value = "/update_intension", method = RequestMethod.POST)
	// ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateIntension(
			@RequestBody LanduseIntensityIntension type) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.landServcie.updateIntension(type);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// 删除
	@RequestMapping(value = "/del_intension")
	// ,method=RequestMethod.POST)
	@ResponseBody
	public void delIntension(@RequestParam("id") String id) throws IOException {
		this.landServcie.deleteIntension(id);
	}

}
