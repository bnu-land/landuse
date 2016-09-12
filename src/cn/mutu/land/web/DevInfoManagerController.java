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
	//delet
	// 删除
			@RequestMapping(value = "/del_kfqInfo")
				@ResponseBody
				public void delZdById(@RequestParam("id") String kfqId) throws IOException {
				System.out.print(kfqId);	
				this.infoService.deleteinfo(kfqId);
			
			}
	//增加
	@RequestMapping(value="/add_kfqInfomation")//,@RequestBody DevInfo devInfo,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addDevInfo(@RequestParam("kfqmc") String kfqmc)
			throws IOException {		

		Map<String, Object> result = new HashMap<String, Object>();
		try {
			DevInfo devInfo=new DevInfo();
			devInfo.setKfqmc(kfqmc);
			System.out.println("开发区名称："+devInfo.getKfqmc());
			//devInfo.setSlsj(devInfo.getSlsj().substring(0, 7).replace("-", ""));
			//System.out.println(devInfo.getKfqmc());
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
