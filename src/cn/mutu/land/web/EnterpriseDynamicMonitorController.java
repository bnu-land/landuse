package cn.mutu.land.web;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mutu.land.common.Encoder;
import cn.mutu.land.service.EnterpriseDynamicMonitorService;

@Controller
public class EnterpriseDynamicMonitorController {
	private EnterpriseDynamicMonitorService entServcie;

	@Autowired
	public EnterpriseDynamicMonitorController(
			EnterpriseDynamicMonitorService entServcie) {
		this.entServcie = entServcie;
	}

	// --------------------企业用地性质变更监控--------------------------------
	@RequestMapping(value = "/get_EntLandChange")
	@ResponseBody
	public Map<String, Object> getLandKfqType(
			@RequestParam("searchKeyword") String searchKeyword)
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.entServcie.getEntLanduseChangeList(searchKeyword);
	}

	// --------------------企业集约度监控--------------------------------
	@RequestMapping(value = "/get_EntLandIntensity")
	@ResponseBody
	public Map<String, Object> getEntIntensity(
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("code") String code) throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.entServcie.getEntLandIntensity(searchKeyword, code);
	}

	// --------------------企业到期预警--------------------------------
	@RequestMapping(value = "/get_EntExpireAlert")
	@ResponseBody
	public Map<String, Object> getEntExpireAlert(
			@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("inmonths") Integer inmonths) throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.entServcie.getEntExpireAlert(searchKeyword, inmonths);
	}
	
	// --------------------企业上传信息审核--------------------------------
		@RequestMapping(value = "/set_EntUploadCheckPass")
		@ResponseBody
		public Map<String, Object> set_EntUploadCheckPass(
				@RequestParam("ids") String[] ids,
				@RequestParam("isPass") int isPass) throws SQLException {
			return this.entServcie.setEntUploadCheckPass(ids, isPass);
		}
	
	// --------------------企业上传信息审核结果--------------------------------
	@RequestMapping(value = "/set_EntUploadCheckResult")
	@ResponseBody
	public Map<String, Object> set_EntUploadCheckResult(
			@RequestParam("ids") String[] ids,
			@RequestParam("checkResult") String checkResult) throws SQLException {
		return this.entServcie.setEntUploadCheckResult(ids, checkResult);
	}
}
