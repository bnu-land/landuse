package cn.mutu.land.web;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mutu.land.service.UploadFileService;

@Controller
public class UploadFileController {
	
	private UploadFileService uploadService;

	@Autowired
	public UploadFileController(UploadFileService photoService) {
		this.uploadService = photoService;
	}
	/*@RequestMapping(value = "/post_file")
	@ResponseBody
	public void uploadFile(@RequestParam("file") String filename) throws IOException {
		//this.uploadService.fileUpload(request, response, filename);
	}*/


}
