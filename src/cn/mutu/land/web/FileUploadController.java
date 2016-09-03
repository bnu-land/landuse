package cn.mutu.land.web;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mutu.land.service.FileUploadService;

@Controller
public class FileUploadController {

	@Autowired
	private FileUploadService fileUploadService;

	// --------------------内容发布-------------------------
	// 查询
	@RequestMapping(value = "/file_upload")
	@ResponseBody
	public Map<String, Object> fileUpload(HttpServletRequest request,
			HttpServletResponse response, @RequestParam("filetype") String type)
			throws SQLException {
		return this.fileUploadService.fileUpload(request, response,type);
		//
	}
}