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

import cn.mutu.land.model.SystemMap;
import cn.mutu.land.service.SystemManageMapService;

@Controller
public class SystemManageMapController {
	private SystemManageMapService mapServcie;

	@Autowired
	public SystemManageMapController(SystemManageMapService mapServcie) {
		this.mapServcie = mapServcie;
	}

	//--------------------管理地图url--------------------------------
	@RequestMapping(value = "/get_systemManageMap")
	@ResponseBody
	public Map<String, Object> handle(
			@RequestParam("searchKeyword") String searchKeyword)
			throws SQLException {
		System.out.println("------search for map url--------");
		return this.mapServcie.getSystemManagerMapList(searchKeyword);
		//
	}

	// 删除用户信息
	@RequestMapping(value = "/del_MapById")
	// ,method=RequestMethod.POST)
	@ResponseBody
	public void delUserById(@RequestParam("id") String id) throws IOException {
		this.mapServcie.deleteMap(id);
	}

	// 添加用户信息
	@RequestMapping(value = "/add_Map")
	@ResponseBody
	public Map<String, Object> addMap(@RequestBody SystemMap map)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.mapServcie.addMap(map);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// 修改用户信息
	@RequestMapping(value = "/update_Map",method=RequestMethod.POST)
	// ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateMap(@RequestBody SystemMap sysMap)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.mapServcie.updateMap(sysMap);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}
	
	//-------------------取得地图要素图层----------------------
	//取得土地利用图层（地类图斑）
	@RequestMapping(value = "/get_FeatureLayerURLs")
	@ResponseBody
	public Map<String, Object> getFeatureLayerURLs(
			@RequestParam("LayerGroups") String[] LayerGroups
			)throws SQLException {
		System.out.println("------search for map url--------");
		return this.mapServcie.getFeatureLayerURLList(LayerGroups);
		//
	}
}
