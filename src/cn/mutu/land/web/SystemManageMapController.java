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
import cn.mutu.land.model.SystemMap;
import cn.mutu.land.model.UtilFieldnameIndex;
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
		searchKeyword = Encoder.encode(searchKeyword);
		return this.mapServcie.getSystemManagerMapList(searchKeyword);
		//
	}

	// 删除用户信息
	@RequestMapping(value = "/del_MapById")
	// ,method=RequestMethod.POST)
	@ResponseBody
	public void delUserById(@RequestParam("mapIds") String[] ids) throws IOException {
		this.mapServcie.deleteMap(ids);
	}

	// 添加用户信息
	@RequestMapping(value = "/add_Map",method=RequestMethod.POST)
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
		String[] groups = new String[LayerGroups.length];
		for(int i =0;i<LayerGroups.length;i++){
			groups[i] = Encoder.encode(LayerGroups[i]);
		}
		return this.mapServcie.getFeatureLayerURLList(groups);
		//
	}

	//--------------------地图要素属性中英文对照--------------------------------
	@RequestMapping(value = "/get_MapAttrNameIndex")
	@ResponseBody
	public Map<String, Object> handle_MapAttrNameIndex(
			@RequestParam("searchKeyword") String searchKeyword)
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.mapServcie.getMapAttrNameIndexList(searchKeyword);
	}

	// 删除
	@RequestMapping(value = "/del_MapAttrNameIndex")
	// ,method=RequestMethod.POST)
	@ResponseBody
	public void del_MapAttrNameIndex(@RequestParam("ids") String[] ids) throws IOException {
		this.mapServcie.deleteMapAttrNameIndex(ids);
	}

	// 添加
	@RequestMapping(value = "/add_MapAttrNameIndex",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> add_MapAttrNameIndex(@RequestBody UtilFieldnameIndex nameIndex)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.mapServcie.addMapAttrNameIndex(nameIndex);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// 修改
	@RequestMapping(value = "/update_MapAttrNameIndex",method=RequestMethod.POST)
	// ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update_MapAttrNameIndex(@RequestBody UtilFieldnameIndex nameIndex)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.mapServcie.updateMapAttrNameIndex(nameIndex);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}
}
