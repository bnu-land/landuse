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
import cn.mutu.land.model.EntDxqyydPda;
import cn.mutu.land.service.DxbusInfoManagerService;

@Controller
public class DxbusInfoManagerController {

	private DxbusInfoManagerService infoService;

	@Autowired
	public DxbusInfoManagerController(DxbusInfoManagerService infoService) {
		this.infoService = infoService;
	}

	// --------------------内容发布-------------------------
	// 查询
	@RequestMapping(value = "/get_qyinfo")
	@ResponseBody
	public Map<String, Object> getLawsList(
			@RequestParam("searchKeyword") String searchKeyword)
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.infoService.getDxbusInfoList(searchKeyword);
		//
	}

	// 删除
	@RequestMapping(value = "/del_dxinfo")
		@ResponseBody
		public void delNoticeById(@RequestParam("id") String id) throws IOException {
			this.infoService.deleteinfo(id);
		}

	@RequestMapping(value = "/add_dxqyinfo",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addInfo(@RequestBody EntDxqyydPda dxqy)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			//System.out.print(info.getBusinessArea());
			this.infoService.addInfos(dxqy);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			er.printStackTrace();
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}
	
	
}
