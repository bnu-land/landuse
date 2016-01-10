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
	public EnterpriseDynamicMonitorController(EnterpriseDynamicMonitorService entServcie) {
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
}
