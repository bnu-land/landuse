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

import cn.mutu.land.model.NoticeColumns;
import cn.mutu.land.service.NoticeManageService;

@Controller
public class NoticeManageController {

private NoticeManageService noticeService;
	
	@Autowired
	public NoticeManageController(NoticeManageService noticeService) {
		this.noticeService = noticeService;
	}
	
	@RequestMapping(value = "/get_NoticeNews")
	@ResponseBody
	public Map<String, Object> getNoticeNews(
			@RequestParam("searchKeyword") String searchKeyword
			)throws SQLException {
		System.out.println("------search for map url--------");
		return this.noticeService.getNoticeNewList(searchKeyword);
		//
	}
	
	//-------------------------columns----------------------------
	@RequestMapping(value = "/get_NoticeColumns")
	@ResponseBody
	public Map<String, Object> getNoticeColumns()
			throws SQLException {
		System.out.println("------search for map url--------");
		return this.noticeService.getNoticeColumnsList();
	}

	// 删除用户信息
	@RequestMapping(value = "/del_NoticeColumns")
	// ,method=RequestMethod.POST)
	@ResponseBody
	public void delUserById(@RequestParam("columns") String columns) throws IOException {
		this.noticeService.deleteNoticeColumns(columns);
	}

	// 添加用户信息
	@RequestMapping(value = "/add_NoticeColumns")
	@ResponseBody
	public Map<String, Object> addMap(@RequestBody NoticeColumns columns)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.noticeService.addNoticeColumns(columns);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// 修改用户信息
	@RequestMapping(value = "/update_NoticeColumns",method=RequestMethod.POST)
	// ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateMap(@RequestBody NoticeColumns columns)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.noticeService.updateNoticeColumns(columns);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}
}
