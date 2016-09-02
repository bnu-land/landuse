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
import cn.mutu.land.model.BusinessInfo;
import cn.mutu.land.model.BusinessMap;
import cn.mutu.land.model.BusinessPhoto;
import cn.mutu.land.model.LawRegulation;
import cn.mutu.land.model.LawTypes;
import cn.mutu.land.service.BusinessInfoManagerService;
import cn.mutu.land.service.BusinessMapManagerService;
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

//	// 删除
//	@RequestMapping(value = "/del_map")
//		@ResponseBody
//		public void delNoticeById(@RequestParam("id") String id) throws IOException {
//			this.mapService.deleteMap(id);
//		}
	
	/*// 删除
		@RequestMapping(value = "/del_info")
			@ResponseBody
			public void delNoticeById(@RequestParam("businessId") String businessId) throws IOException {
				this.infoService.deleteinfo(businessId);
			}
		
//		// 删除
//				@RequestMapping(value = "/del_infos")
//					@ResponseBody
//					public void delNoticeByIds(@RequestParam("businessId") String businessId) throws IOException {
//						this.infoService.deleteinfos(businessId);
//					}

	// 添加用户信息
	@RequestMapping(value = "/add_info",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addInfo(@RequestBody BusinessInfo info)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			//System.out.print(info.getBusinessArea());
			this.infoService.addInfos(info);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			er.printStackTrace();
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}
	
	// 添加用户信息(练习)
		@RequestMapping(value = "/add_infos",method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> addInfos(@RequestBody BusinessInfo info)
				throws IOException {
			Map<String, Object> result = new HashMap<String, Object>();
			try {			     	
				this.infoService.addInfo(info);
				result.put("success", true);
				result.put("msg", ",successfully saved");
			} catch (Exception er) {
				result.put("failure", true);
				result.put("msg", ",failed saved");
			}
			return result;
		}*/
		
//		// 上传企业照片
//		@RequestMapping(value = "/add_photo",method=RequestMethod.POST)
//		@ResponseBody
//		public Map<String, Object> addphto(@RequestBody BusinessPhoto photo)
//				throws IOException {
//			Map<String, Object> result = new HashMap<String, Object>();
//			try {			     	
//				this.infoService.addphoto(photo);
//				result.put("success", true);
//				result.put("msg", ",successfully saved");
//			} catch (Exception er) {
//				result.put("failure", true);
//				result.put("msg", ",failed saved");
//			}
//			return result;
//		}

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
