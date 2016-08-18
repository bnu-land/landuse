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
import cn.mutu.land.model.BusinessMap;
import cn.mutu.land.model.LawRegulation;
import cn.mutu.land.model.LawTypes;
import cn.mutu.land.service.BusinessInfoManagerService;
import cn.mutu.land.service.BusinessMapManagerService;

@Controller
public class BusinessInfoManagerController {

	private BusinessInfoManagerService infoService;

	@Autowired
	public BusinessInfoManagerController(BusinessInfoManagerService infoService) {
		this.infoService = infoService;
	}

	// --------------------内容发布-------------------------
	// 查询
	@RequestMapping(value = "/get_infomation")
	@ResponseBody
	public Map<String, Object> getInfoList(
			@RequestParam("searchKeyword") String searchKeyword)
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.infoService.getBusinessInfoList(searchKeyword);
		//
	}
/*
	// 删除
	@RequestMapping(value = "/del_map")
		@ResponseBody
		public void delNoticeById(@RequestParam("id") String id) throws IOException {
			this.mapService.deleteMap(id);
		}

	// 添加用户信息
	@RequestMapping(value = "/add_map",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addMap(@RequestBody BusinessMap map)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {			     	
			this.mapService.addMap(map);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}
*/
	/*// 修改用户信息
	@RequestMapping(value = "/update_law", method = RequestMethod.POST)
	// ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateNotice(@RequestBody LawRegulation law)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.lawService.updateLaw(law);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}*/
	/*// 获取相应法律的前十条
			@RequestMapping(value = "/get_Top10Laws")
			@ResponseBody
			public Map<String, Object> getTop10LawsList(
					@RequestParam("lawType") String lawType)
					throws SQLException {
				lawType = Encoder.encode(lawType);
				//lawType = Decoder.decode(lawType);
				
				return this.lawService.get10LawRegulationList(lawType);
				//
			}
			// 更新阅读次数
						@RequestMapping(value = "/update_readCount")
						@ResponseBody
						public Map<String, Object> updateReadCount(
								@RequestParam("id") String id)
								throws SQLException {
							id = Encoder.encode(id);
							return this.lawService.updateRead(id);
							//
						}*/

/*	// -------------------------columns----------------------------
	@RequestMapping(value = "/get_LawTypes")
	@ResponseBody
	public Map<String, Object> getLawTypes() throws SQLException {		
		return this.lawService.getLawTypesList();
	}
*/
	/*// 删除用户信息
	@RequestMapping(value = "/del_LawTypeById")
	// ,method=RequestMethod.POST)
	@ResponseBody
	public void delUserById(@RequestParam("id") String id) throws IOException {
		this.lawService.deleteLawTypes(id);
	}*/

	/*// 添加用户信息
	@RequestMapping(value = "/add_LawType")
	@ResponseBody
	public Map<String, Object> addMap(@RequestBody LawTypes type)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.lawService.addLawTypes(type);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}*/

	/*// 修改用户信息
	@RequestMapping(value = "/update_LawType", method = RequestMethod.POST)
	// ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateMap(@RequestBody LawTypes type)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.lawService.updateLawTypes(type);			
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}*/
	/*// 修改阅读次数
		@RequestMapping(value = "/update_lawRead",method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> update_lawRead(@RequestBody String id)
				throws IOException {
			Map<String, Object> result = new HashMap<String, Object>();
			try {			     	
				this.lawService.updateRead(id);
				result.put("success", true);
				result.put("msg", ",successfully saved");
			} catch (Exception er) {
				result.put("failure", true);
				result.put("msg", ",failed saved");
			}
			return result;
		}*/
}
