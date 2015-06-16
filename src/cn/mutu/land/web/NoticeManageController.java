package cn.mutu.land.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
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
import cn.mutu.land.model.NoticeColumns;
import cn.mutu.land.model.NoticeNews;
import cn.mutu.land.service.NoticeManageService;

@Controller
public class NoticeManageController {

	private NoticeManageService noticeService;

	@Autowired
	public NoticeManageController(NoticeManageService noticeService) {
		this.noticeService = noticeService;
	}

	// --------------------内容发布-------------------------
	// 查询
	@RequestMapping(value = "/get_NoticeNews")
	@ResponseBody
	public Map<String, Object> getNoticeNews(
			@RequestParam("searchKeyword") String searchKeyword)
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.noticeService.getNoticeNewList(searchKeyword);
		//
	}

	// 删除
	@RequestMapping(value = "/del_NoticeNews")
		@ResponseBody
		public void delNoticeById(@RequestParam("id") String id) throws IOException {
			this.noticeService.deleteNotice(id);
		}

	// 添加用户信息
	@RequestMapping(value = "/add_NoticeNews",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addNotice(@RequestBody NoticeNews notice)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Calendar ca = Calendar.getInstance();
	     	Date now = ca.getTime();
	     	notice.setPublishDate(now);	     	
			this.noticeService.addNotice(notice);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// 修改用户信息
	@RequestMapping(value = "/update_NoticeNews", method = RequestMethod.POST)
	// ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateNotice(@RequestBody NoticeNews notice)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.noticeService.updateNotice(notice);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}

	// -------------------------columns----------------------------
	@RequestMapping(value = "/get_NoticeColumns")
	@ResponseBody
	public Map<String, Object> getNoticeColumns() throws SQLException {		
		return this.noticeService.getNoticeColumnsList();
	}

	// 删除用户信息
	@RequestMapping(value = "/del_NoticeColumnById")
	// ,method=RequestMethod.POST)
	@ResponseBody
	public void delUserById(@RequestParam("id") String id) throws IOException {
		this.noticeService.deleteNoticeColumns(id);
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
	@RequestMapping(value = "/update_NoticeColumns", method = RequestMethod.POST)
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
