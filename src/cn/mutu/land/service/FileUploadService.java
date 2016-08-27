package cn.mutu.land.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import cn.mutu.land.model.NoticeColumns;

@Service
public class FileUploadService {
	@Autowired
	private SessionFactory sessionFactory;

	// 文件上传
	public Map<String, Object> fileUpload(HttpServletRequest request,
			HttpServletResponse response) {
		response.setHeader("Access-Control-Allow-Origin", "*");
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		try {
			// 创建一个通用的多部分解析器
			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
					request.getSession().getServletContext());
			String fileName = "";
			String myFileName = "";
			// 判断 request 是否有文件上传,即多部分请求
			if (multipartResolver.isMultipart(request)) {
				// 转换成多部分request
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
				// 取得request中的所有文件名
				Iterator<String> iter = multiRequest.getFileNames();
				while (iter.hasNext()) {
					// 记录上传过程起始时的时间，用来计算上传时间
					int pre = (int) System.currentTimeMillis();
					// 取得上传文件
					MultipartFile file = multiRequest.getFile(iter.next());
					if (file != null) {
						// 取得当前上传文件的文件名称
						myFileName = file.getOriginalFilename();
						// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
						if (myFileName.trim() != "") {
							System.out.println(myFileName);
							// 重命名上传后的文件名
							fileName = new Date().getTime()
									+ myFileName.substring(
											myFileName.lastIndexOf("."),
											myFileName.lastIndexOf(""));
							// 定义上传路径
							String folderPath = request.getSession()
									.getServletContext()
									.getRealPath("/files/");
							File folder = new File(folderPath);
							if (!folder.exists()) {
								folder.mkdir();
							}
							String path = folderPath + "/" + fileName;
							try {
								File localFile = new File(path);
								file.transferTo(localFile);

							} catch (IllegalStateException | IOException e) {
								// TODO Auto-generated catch block
								throw new Exception();
							}
						}
					}

					// 记录上传该文件后的时间
					// int finaltime = (int) System.currentTimeMillis();
					// System.out.println(finaltime - pre);
				}
			}
			String filePath = "images/" + fileName;

			myMapResult.put("root", filePath);
			myMapResult.put("success", true);
		} catch (Exception ex) {
			myMapResult.put("root", false);
			myMapResult.put("success", false);
		}
		return myMapResult;
	}
}