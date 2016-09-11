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
import cn.mutu.land.model.DevInfo;
import cn.mutu.land.service.DevInfoManagerService;

@Controller
public class DevInfoManagerController {

	private DevInfoManagerService infoService;

	@Autowired
	public DevInfoManagerController(DevInfoManagerService infoService) {
		this.infoService = infoService;
	}

	// --------------------获取任务列表-------------------------
	// 查询
	@RequestMapping(value = "/get_kfqinfo")
	@ResponseBody
	public Map<String, Object> getDevInfoList(
			@RequestParam("searchKeyword") String searchKeyword)	
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.infoService.getKfqInfoList(searchKeyword);
		//
	}
	//增加
	@RequestMapping(value="/add_kfqinfo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addDevInfo(@RequestBody DevInfo devInfo)
			throws IOException {		

		Map<String, Object> result = new HashMap<String, Object>();
		try {
			devInfo.setSlsj(devInfo.getSlsj().substring(0, 7).replace("-", ""));
			System.out.println(devInfo.getSlsj());
			this.infoService.addkfq(devInfo);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			er.printStackTrace();
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;

}
	@RequestMapping(value = "/update_kfqnfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateKfqInfo(@RequestBody DevInfo devInfo)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.infoService.updateDevInfo(devInfo);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}
}
