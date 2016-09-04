package cn.mutu.land.web;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mutu.land.common.Encoder;
import cn.mutu.land.service.KfqInfoManagerService;

@Controller
public class KfqInfoManagerController {

	private KfqInfoManagerService infoService;

	@Autowired
	public KfqInfoManagerController(KfqInfoManagerService infoService) {
		this.infoService = infoService;
	}

	// --------------------获取任务列表-------------------------
	// 查询
	@RequestMapping(value = "/get_kfqinfo")
	@ResponseBody
	public Map<String, Object> getInfoList(
			@RequestParam("searchKeyword") String searchKeyword)
			//@RequestParam("kfqpjlx") String lx,
			//@RequestParam("kfqjb") String jb)
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.infoService.getKfqInfoList(searchKeyword);
		//
	}

}
