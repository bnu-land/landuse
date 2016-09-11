package cn.mutu.land.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openxmlformats.schemas.drawingml.x2006.spreadsheetDrawing.STEditAs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cn.mutu.land.common.DateUtil;
import cn.mutu.land.common.Encoder;
import cn.mutu.land.common.Excel2Html;
import cn.mutu.land.common.ExcelTools;
import cn.mutu.land.common.ZipCompressing;
import cn.mutu.land.model.AchievementFile;
import cn.mutu.land.model.ExcelExportion;
import cn.mutu.land.service.AchieveFileManageService;



@Controller
@RequestMapping("/achieve")
public class AchieveFileManageController {
	
	private AchieveFileManageService achieveFileManageService;

	@Autowired
	public AchieveFileManageController(AchieveFileManageService testUserService) {
		this.achieveFileManageService = testUserService;
	}
	
	/**
	 * 获取成果文件列表
	 * @param kfqname
	 * @param kfqyear
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value="/get_achievefileInfo",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> get_achievefileInfo(
			@RequestParam("kfqname") String kfqname,
			@RequestParam("kfqyear") String kfqyear)
			throws IOException {
		kfqname = Encoder.encode(kfqname);
		return this.achieveFileManageService.getFilesList(kfqname,kfqyear);
	}	
	
	/**
	 * 预览文件
	 * @param filepath
	 * @param filename
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/read_word")
	@ResponseBody
	public String read_word(@RequestParam("filepath")String filepath,
			@RequestParam("groupFilepath")String groupFilepath, 
			@RequestParam("filename")String filename,
			HttpServletRequest request){
		filepath=filepath+groupFilepath;
		//System.out.println(request.getContextPath());///studentInfo
		//System.out.println(request.getServletPath());///MyUserInfo/read_word
		//System.out.println(request.getRealPath("/"));
		if(filepath==null||filepath.equals(""))return null;
		else if(filepath.endsWith(".shp")){
			return null;
		}else {
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
	
	/**
	 * 上传文件
	 * @param files
	 * @param filepaths
	 * @param kfqname
	 * @param kfqyear
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/add_uploadfile",method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public String uploadfile(
			@RequestParam("file")CommonsMultipartFile[] files,
			@RequestParam("filepaths")String[]filepaths,
			@RequestParam("kfqname")String kfqname,
			@RequestParam("kfqyear")String kfqyear,HttpServletRequest request){
		String uploader=request.getUserPrincipal().getName();//当前登录用户名
		Map<String, Object>r=new TreeMap<String,Object>();
		System.out.println(kfqyear);
		System.out.println((kfqname));
		//时间戳
		String onlyTime=DateUtil.getOnlyId();//文件路径时间戳
		SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String savetime=df.format(new Date());//保存时间
		if(files!=null&&files.length>=0){
			System.out.println(files.length);			
			for(int i=0;i<files.length;i++){
				System.out.println(Encoder.encode(files[i].getOriginalFilename()));
				System.out.println((filepaths[i]));
				boolean s=this.achieveFileManageService.add_uploadfile(files[i],kfqname,kfqyear,uploader,savetime,onlyTime+"/"+filepaths[i]+"/");
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
	
	/**
	 * 删除文件
	 * @param id
	 * @param request
	 * @return
	 */
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
	
	/**
	 * 单文件下载
	 * @param filepath
	 * @param fileName
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/export_file")
	@ResponseBody
	public String download(
			@RequestParam("filepath")String filepath,
			@RequestParam("filename")String fileName,
			@RequestParam("groupFilepath")String groupFilepath, 
			HttpServletRequest request,HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;fileName="
				+ fileName);//attachment
		InputStream inputStream=null;
		OutputStream os =null;
		groupFilepath=Encoder.encode(groupFilepath);
		filepath=Encoder.encode(filepath)+groupFilepath;	
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
	
	/**
	 * 成果打包导出
	 * @param kfqname
	 * @param kfqyear
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/export_file_zip")
	@ResponseBody
	public String download_zip(@RequestParam("kfqname")String kfqname,@RequestParam("kfqyear")String kfqyear,
			HttpServletRequest request,HttpServletResponse response){
	
		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");
		response.setHeader("Content-Disposition", "attachment;fileName="
				+ kfqname+kfqyear+".zip");//attachment
		
		kfqname=Encoder.encode(kfqname);		
		//压缩包文件名及response返回信息
		String zipFilename=kfqname+kfqyear+".zip";		
		System.out.println("download:"+zipFilename);
		
		//获取开发区总文件夹路径
		//获取文件数据表记录
		Map<String, Object> map=this.achieveFileManageService.getFilesList(kfqname, kfqyear);
		if(map==null) return null;
		List<AchievementFile> results =(List<AchievementFile>)map.get("root");
		System.out.println(results.size());
		if(results.size()==0)return null;
		
		//解析文件夹的时间戳及总文件夹名称
		String filepath=results.get(0).getFilepath();
		String groupFilepath=results.get(0).getGroupFilepath();
		String []t=groupFilepath.split("/");
		System.out.println(t.length);
		if(t.length<2)return null;
		String onlytime=t[0];
		String totalFoldername=t[1];//总成果文件夹名称
		
		//设置压缩包文件路径
		String zipPath=filepath+onlytime+"/"+zipFilename;
		System.out.println(zipPath);
		//判断压缩包是否存在
		File zipFile=new File(zipPath);
		if(!zipFile.exists()){
			ZipCompressing.zip(zipPath, new File(filepath+onlytime+"/"+totalFoldername));
		}
		InputStream inputStream=null;
		OutputStream os =null;
		try {
			inputStream= new FileInputStream(new File(zipPath));
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

	/**
	 * 查看可导出的表格
	 * @param kfqName
	 * @param kfqYear
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/get_exportableExcel")
	@ResponseBody
	public Map<String ,Object>get_exportableExcel(
			@RequestParam("kfqname")String kfqName,
//			@RequestParam("kfqDM")String kfqDM,
			@RequestParam("kfqyear")String kfqYear,
			HttpServletRequest request){
		kfqName=Encoder.encode(kfqName);
		return this.achieveFileManageService.get_exportableExcel(kfqName,"0",kfqYear);
//		Map<String, Object> result =new TreeMap<String, Object>();
//		List<ExcelExportion>list=new ArrayList<ExcelExportion>();
//		ExcelExportion e=new ExcelExportion("modelname","表F.1 开发区基本信息调查表（Ⅰ）","F1","宾西经济技术开发区","3237","2012");
//		list.add(e);
//		ExcelExportion e2=new ExcelExportion("modelname","表F.2 开发区基本信息调查表（Ⅱ）","F2","宾西经济技术开发区","3237","2012");
//		list.add(e2);
//		ExcelExportion e3=new ExcelExportion("modelname","表F.3 开发区用地审批及调整情况调查表","F3","宾西经济技术开发区","3237","2012");
//		list.add(e3);
//		result.put("root", list);
//		result.put("success", true);
//		return result;
	}
	
	
	/**
	 * 单个表格数据导出
	 * @param excelExportionList
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/export_excel")
	@ResponseBody	
	public String export_excel(			
			@RequestParam("modelName")String modelName,
			@RequestParam("excelSimpleName")String excelSimpleName,
			@RequestParam("kfqName")String kfqName,
			@RequestParam("excelName")String excelName,
			@RequestParam("kfqDM")String kfqDM,
			@RequestParam("kfqYear")String kfqYear,
			HttpServletRequest request,HttpServletResponse response){
		ExcelExportion e=new ExcelExportion(modelName, Encoder.encode(excelName), excelSimpleName, Encoder.encode(kfqName), kfqDM, kfqYear, true);

		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");
		String responseFile="";//返回的文件路径及名
		String rootPath =request.getRealPath("/");
		//单表格导出
		response.setHeader("Content-Disposition", "attachment;fileName="
				+ excelName);//attachment
		//文件名及response返回信息
		System.out.println("download:"+e.getExcelName());
		String outPath="D:/test_download/"+Excel2Html.getOnlyId()+".xls";
		responseFile=this.achieveFileManageService.exportExcel(e,rootPath,outPath);
		
		if(responseFile==null)return null;
		File file=new File(responseFile);
		//返回文件
		if(file.exists()){			
			InputStream inputStream=null;
			OutputStream os =null;
			try {			
				inputStream= new FileInputStream(file);
				os= response.getOutputStream();
				byte[] b = new byte[2048];
				int length;
				while ((length = inputStream.read(b)) > 0) {
					os.write(b, 0, length);
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}finally{			
					try {
						if(os!=null)os.close();
					} catch (IOException ex) {
						// TODO Auto-generated catch block
						ex.printStackTrace();
					}				
					try {
						if(inputStream!=null)inputStream.close();
					} catch (IOException ex) {
						// TODO Auto-generated catch block
						ex.printStackTrace();
					}					
			}
		}
        //  返回值要注意，要不然就出现下面这句错误！
        //java+getOutputStream() has already been called for this response
		return null;
	}

	
	/**
	 * 批量表格数据导出
	 * @param excelExportionList
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/export_excel_zip")
	@ResponseBody	
	public Map<String,String> export_excel_zip(			
			@RequestParam("modelName")String[] modelName,
			@RequestParam("excelSimpleName")String[] excelSimpleName,
			@RequestParam("kfqname")String kfqName,
			@RequestParam("excelName")String[] excelName,
			@RequestParam("kfqDM")String kfqDM,
			@RequestParam("kfqyear")String kfqYear,
			HttpServletRequest request){
		
		int lengths=modelName.length;
		ExcelExportion []excelExportionList=new ExcelExportion[lengths];
		for(int i=0;i<lengths;i++){
			excelExportionList[i]=new ExcelExportion(modelName[i], excelName[i],
					excelSimpleName[i], kfqName, kfqDM, kfqYear,true);			
		}

		String responseFile="";//返回的文件路径
		String rootPath =request.getRealPath("/");
		//多表格导出
		String zipFilename=kfqName+kfqYear+".zip";		
		//压缩包文件名及response返回信息
		System.out.println("download:"+zipFilename);
		String outPathFolder="D:/test_download/"+Excel2Html.getOnlyId();
		responseFile=this.achieveFileManageService.exportExcel(excelExportionList,rootPath,outPathFolder);			
		Map<String, String>result=new TreeMap<String,String>();
		result.put("filepath", responseFile);
		result.put("filename", zipFilename);
		return result;
	}
	
	
	/**
	 * 下载文件
	 * @param filepath
	 * @param filename
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="download_file")
	@ResponseBody
	public String downloadFile(@RequestParam("filepath")String filepath,
			@RequestParam("filename")String filename,
			HttpServletRequest request,HttpServletResponse response){
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("multipart/form-data");	
		response.setHeader("Content-Disposition", "attachment;fileName="+ filename);//attachment	
		File file=new File(Encoder.encode(filepath));
		//返回文件
		if(file.exists()){	
			InputStream inputStream=null;
			OutputStream os =null;
			try {			
				inputStream= new FileInputStream(file);
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
		}
        //  返回值要注意，要不然就出现下面这句错误！
        //java+getOutputStream() has already been called for this response
		return null;
	}
}
