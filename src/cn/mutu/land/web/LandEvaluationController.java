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
import cn.mutu.land.model.LandKfqType;
import cn.mutu.land.model.LanduseIndexWeight;
import cn.mutu.land.service.LandEvaluationService;

@Controller
public class LandEvaluationController {
	private LandEvaluationService landServcie;

	@Autowired
	public LandEvaluationController(LandEvaluationService landServcie) {
		this.landServcie = landServcie;
	}

	// --------------------指标现状值计算--------------------------------
	@RequestMapping(value = "/get_landKfqType")
	@ResponseBody
	public Map<String, Object> getLandKfqType(
			@RequestParam("searchKeyword") String searchKeyword)
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.landServcie.getLandKfqTypeList(searchKeyword);
		//
	}

	// 添加
	@RequestMapping(value = "/add_landKfqType", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addLandKfqType(@RequestBody LandKfqType type)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.landServcie.addLandKfqType(type);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// 修改
	@RequestMapping(value = "/update_landKfqType", method = RequestMethod.POST)
	// ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateLandKfqType(@RequestBody LandKfqType type)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.landServcie.updateLandKfqType(type);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// 删除
	@RequestMapping(value = "/del_landKfqTypeById")
	// ,method=RequestMethod.POST)
	@ResponseBody
	public void delLandKfqType(@RequestParam("ids") String[] ids)
			throws IOException {
		this.landServcie.deleteLandKfqType(ids);
	}

	// --------------------指标权重表--------------------------------
	@RequestMapping(value = "/get_indexWeight")
	@ResponseBody
	public Map<String, Object> getIndexWeight(
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("markType") String markType)
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		markType = Encoder.encode(markType);
		return this.landServcie.getIndexWeightList(searchKeyword,markType);
		//
	}

	// 添加
	@RequestMapping(value = "/add_indexWeight")//, method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addIndexWeight(
			@RequestBody LanduseIndexWeight type) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			//System.out.print("add index weight");
			this.landServcie.addIndexWeight(type);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// 修改
	@RequestMapping(value = "/update_indexWeight", method = RequestMethod.POST)
	// ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateIndexWeight(
			@RequestBody LanduseIndexWeight type) throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.landServcie.updateIndexWeight(type);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// 删除
	@RequestMapping(value = "/del_indexWeight")
	// ,method=RequestMethod.POST)
	@ResponseBody
	public void delIndexWeight(@RequestParam("ids") String[] ids)
			throws IOException {
		this.landServcie.deleteIndexWeight(ids);
	}
	
	// --------------------指标权重表字段等级元数据--------------------------------
		@RequestMapping(value = "/get_indexMeta")
		@ResponseBody
		public Map<String, Object> getIndexMetaList(
				@RequestParam("searchKeyword") String searchKeyword)
				throws SQLException {
			searchKeyword = Encoder.encode(searchKeyword);
			return this.landServcie.getIndexMetaList(searchKeyword);
			//
		}

}
