package cn.mutu.land.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cn.mutu.land.common.DateUtil;
import cn.mutu.land.common.Encoder;
import cn.mutu.land.model.AchievementFile;
import cn.mutu.land.service.AchieveFileManageService;



@Controller
@RequestMapping("/achieve")
public class AchieveFileManageController {
	
	private AchieveFileManageService achieveFileManageService;

	@Autowired
	public AchieveFileManageController(AchieveFileManageService testUserService) {
		this.achieveFileManageService = testUserService;
	}
	
	@RequestMapping(value="/get_achievefileInfo",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> get_achievefileInfo(
			@RequestParam("kfqname") String kfqname,
			@RequestParam("kfqyear") String kfqyear)
			throws IOException {
		kfqname = Encoder.encode(kfqname);
		return this.achieveFileManageService.getFilesList(kfqname,kfqyear);
	}	
	
	@RequestMapping(value="/read_word")
	@ResponseBody
	public String read_word(@RequestParam("filepath")String filepath,
			@RequestParam("filename")String filename,
			HttpServletRequest request){
		
		//System.out.println(request.getContextPath());///studentInfo
		//System.out.println(request.getServletPath());///MyUserInfo/read_word
		//System.out.println(request.getRealPath("/"));
		if(filepath==null||filepath.equals(""))return null;
		else{
			String rootPath =request.getRealPath("/");
			 String result=this.achieveFileManageService.read_word(filename,filepath,rootPath);	
			 System.out.println(result);
			 if(result!=null){
				 System.out.println(result);
				 if(result.indexOf("office")==-1) return result;
			 	 result=result.substring(result.indexOf("office"));		 	
			 }
			 return result;
		}
	}
	
	
	@RequestMapping(value="/add_uploadfile",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public String uploadfile(
			@RequestParam("file")CommonsMultipartFile[] files,
			@RequestParam("filepaths")String[]filepaths,
			@RequestParam("kfqname")String kfqname,
			@RequestParam("kfqyear")String kfqyear,HttpServletRequest request){
		String uploader=request.getUserPrincipal().getName();//当前登录用户名
		String rootPath =request.getRealPath("/");
		Map<String, Object>r=new TreeMap<String,Object>();
		System.out.println(kfqyear);
		System.out.println((kfqname));
		//时间戳
		String onlyTime=DateUtil.getOnlyId();
		
		if(files!=null&&files.length>=0){
			System.out.println(files.length);			
			for(int i=0;i<files.length;i++){
				System.out.println(Encoder.encode(files[i].getOriginalFilename()));
				System.out.println((filepaths[i]));
				boolean s=this.achieveFileManageService.add_uploadfile(files[i],kfqname,kfqyear,uploader,onlyTime+"/"+filepaths[i]);
				r.put("success", s);
				continue;
			}
		}else {
			System.out.println("file null");
			r.put("success", false);
		}
		System.out.println(r.get("success"));
		if((boolean)r.get("success"))return "上传文件成功";
		else return "上传文件失败";
	}
	
	
	@RequestMapping(value="/delete_file")
	@ResponseBody
	public String delete_file(
			@RequestParam("id")int id,HttpServletRequest request){
		String loader=request.getUserPrincipal().getName();//当前登录用户名
		Map<String, Object>r=new TreeMap<String,Object>();
		if(id>0){
			System.out.println(id);
				boolean s=this.achieveFileManageService.delete_file(id,loader);
				r.put("success", s);
		}else {
			System.out.println("delete file null");
			r.put("success", false);
		}
		return r.get("success").toString();
	}	
	
	
	@RequestMapping("/export_file")
	@ResponseBody
	public String download(
			@RequestParam("filepath")String filepath,
			@RequestParam("filename")String fileName, 
			HttpServletRequest request,HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;fileName="
				+ fileName);//attachment
		InputStream inputStream=null;
		OutputStream os =null;
		filepath=Encoder.encode(filepath);
		fileName=Encoder.encode(fileName);
		System.out.println("download:"+filepath+fileName);
		try {
			inputStream= new FileInputStream(new File(filepath+fileName));
			os= response.getOutputStream();
			byte[] b = new byte[2048];
			int length;
			while ((length = inputStream.read(b)) > 0) {
				os.write(b, 0, length);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{			
				try {
					if(os!=null)os.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
				try {
					if(inputStream!=null)inputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}					
		}
        //  返回值要注意，要不然就出现下面这句错误！
        //java+getOutputStream() has already been called for this response
		return null;
	}
}
