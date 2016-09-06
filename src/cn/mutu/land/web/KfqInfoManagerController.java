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
import cn.mutu.land.model.KfqInfomation;
import cn.mutu.land.model.TaskInfo;
import cn.mutu.land.model.ZdInfo;
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
	//增加
	@RequestMapping(value="/add_kfqinfo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addkfqinfo(@RequestBody KfqInfomation kfqInfomation)
			throws IOException {		

		Map<String, Object> result = new HashMap<String, Object>();
		try {
			kfqInfomation.setSlsj(kfqInfomation.getSlsj().substring(0, 7).replace("-", ""));
			System.out.println(kfqInfomation.getSlsj());
			this.infoService.addkfq(kfqInfomation);
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
	// ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateKfqInfo(@RequestBody KfqInfomation kfqInfomation)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			//System.out.println("mapId="+zdinfo.getId());
			//String date=zdinfo.getGysj();
			//zdinfo.setGysj(date.substring(0, 10));
			this.infoService.updatekfqInfo(kfqInfomation);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}
}
