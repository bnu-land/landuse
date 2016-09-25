package cn.mutu.land.service;


import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import cn.mutu.land.common.Excel2Html;
import cn.mutu.land.common.ExcelTools;
import cn.mutu.land.common.SaveUploadFile;
import cn.mutu.land.common.Word2Html;
import cn.mutu.land.common.ZipCompressing;
import cn.mutu.land.model.AchievementFile;
import cn.mutu.land.model.EntDxqyydPda;
import cn.mutu.land.model.ExcelExportion;
import cn.mutu.land.model.ExcelTable;
import cn.mutu.land.model.DevInfo;

@Service
public class AchieveFileManageService {

	private SessionFactory sessionFactory;
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}
	
	/**
	 * 获取成果文件列表
	 * @param kfqname
	 * @param kfqyear
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> getFilesList(String kfqname,String kfqyear) {
		String hql = " FROM AchievementFile as t WHERE t.isDelete = '0'";//������model���е�TestUser��
		if (!kfqname.equals("")) {
			hql = hql +" and t.kfqName = '"+kfqname+"'";
		}
		if (!kfqyear.equals("")) {
			hql = hql +" and t.kfqYear = '"+kfqyear+"'";
		} 
		hql=hql+" and t.uploadTime = ( select max(a.uploadTime) from AchievementFile a)";
		List<AchievementFile> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<AchievementFile>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
    }	 
	
	public String read_word(String filename,String filePath,String rootPath){
		String filePathName=filePath+filename;
		if(filename.lastIndexOf(".")==-1)return null;
		String filetype=filename.substring(filename.lastIndexOf(".")).toLowerCase();
		System.out.println(filetype);
		if(filetype.endsWith(".docx"))
			return Word2Html.word2007tohtml(filePathName, rootPath+"office/word07");
		else if(filetype.endsWith(".doc"))
			return Word2Html.word2003tohtml(filePathName, rootPath+"office/word03");
		else if(filetype.endsWith(".xls")||filetype.endsWith(".xlsx"))
			return Excel2Html.excel2Html(filePathName, rootPath+"office/excel");
		else if(filetype.endsWith(".jpg")||filetype.endsWith(".png")){
			return SaveUploadFile.copyPicture(filetype,filePath+filename, rootPath+"office/pic/");
		}
		else return null;
	}
	

	public boolean add_uploadfile(CommonsMultipartFile file,String kfqName,String kfqYear,String uploader,String savetime,String groupfilepath){
		String filepath="D:/test_uploadfile2/"+kfqYear+"/";
		String filename=file.getOriginalFilename();
		boolean s=SaveUploadFile.saveFile(file, filepath+groupfilepath,filename);
		
		if(s){
			//添加记录
			AchievementFile f=new AchievementFile();
			f.setFilename(filename);			
			f.setFilesize(getFileSizeUnit(file.getSize()));
			f.setFilepath(filepath);
			f.setGroupFilepath(groupfilepath);
			if(filename.lastIndexOf(".")!=-1)
				f.setFiletype(filename.substring(filename.lastIndexOf(".")));
			else f.setFiletype("未知");
			f.setKfqName(kfqName);
			f.setKfqYear(kfqYear);
			f.setUploader(uploader);
					
			f.setUploadTime(savetime);
			Session session=this.sessionFactory.getCurrentSession();
			session.save(f);
		}
		return s;
	}
	
	
	public boolean delete_file(int id,String loader){
		Session session=this.sessionFactory.getCurrentSession();
		AchievementFile result = (AchievementFile) session.get(AchievementFile.class,id);
		System.out.println(result.getFilename());
		if(result.getUploader().equals(loader)){
			result.setIsDelete(true);
			session.saveOrUpdate(result);
			return true;			
		}else return false;

	}
	
	
	/**
	 * size 
	 * @param size 单位B
	 * @return 10MB或100KB
	 */
	private String getFileSizeUnit(long size){
		if(size>=500000)//500kb
			return new DecimalFormat("##0.00MB").format(size/1000000.0);
		else if(size>=100) return new DecimalFormat("##0.0KB").format(size/1000.0);
		else return new DecimalFormat("##0.0B").format(size);
		
	}

	
	/**
	 * 获取可以导出的表名
	 * @param kfqName
	 * @param kfqDM
	 * @param kfqYear
	 * @return
	 */
	public Map<String,Object>get_exportableExcel(String kfqName,String kfqDM,String kfqYear){
		Map<String, Object> result =new TreeMap<String, Object>();
		List<ExcelExportion>list=new ArrayList<ExcelExportion>();
		List<String> sqlList=new ArrayList<String>();
		String hql="";
		//f1/f2/f3表有效性
		hql="from DevInfo as t where 1=1 and t.kfqmc = '" +kfqName+"'";
		org.hibernate.Query query =sessionFactory.getCurrentSession().createQuery(hql);
		List<DevInfo> r = (List<DevInfo>) query.list();
		if(r.size()>0){
			ExcelExportion e=new ExcelExportion("DevInfo", ExcelTable.F1_name,
					"F1", kfqName, kfqDM, kfqYear,true);
			ExcelExportion e2=new ExcelExportion("DevInfo",ExcelTable.F2_name,
					"F2", kfqName, kfqDM, kfqYear,true);
			ExcelExportion e3=new ExcelExportion("DevInfo", ExcelTable.F3_name,
					"F3", kfqName, kfqDM, kfqYear,true);
			list.add(e);
			list.add(e2);
			list.add(e3);
		}
		
		//f4表有效性
		ExcelExportion e4=new ExcelExportion("DevInfo", ExcelTable.F4_name,
				"F4", kfqName, kfqDM, kfqYear,false);
		list.add(e4);		
		
		//加入查询结果
		System.out.println(kfqName+r.size());
		result.put("root", list);
		result.put("success", true);
		return result;
	}
	
	/**
	 * 导出单个excel文件
	 */
	public String exportExcel(ExcelExportion e,String rootPath,String outPath){		
		if(e==null)return null;
		//获取对应的表编辑字段
		String []excelFlied=getExcelFlied(e);
		if(excelFlied==null)return null;		
		
		//获取hql语句
		String hql=getExcelSql(e,excelFlied);	
		System.out.println("excel hql:"+hql);
		if(hql==null)return null;		
		
		//查询对应记录
		org.hibernate.Query query =sessionFactory.getCurrentSession().createQuery(hql);
		List<Object[]> r =  query.list();
		System.out.println(r.size());
		//结果数据放入map中
		Map<String,Object> map=new TreeMap<String, Object>();		
		for(Object[] o:r){
			for(int i=0;i<excelFlied.length;i++){
				map.put(excelFlied[i], o[i]);
			}
		}
		String inputFilePath=rootPath+"office/exportModel/"+e.getExcelName();
		
		try {
			ExcelTools.exportEncryptedQicanToExcel2(map, inputFilePath, outPath);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return outPath;
	}
	
	/**
	 * 导出多个excel文件
	 */
	public String exportExcel(ExcelExportion[] elist,String rootPath,String outPathFolder){
		int length=elist.length;
		File file=new File(outPathFolder);
		if(!file.exists())file.mkdir();
		for(int i=0;i<length;i++){
			ExcelExportion e=elist[i];
			exportExcel(e,rootPath,outPathFolder+"/"+e.getExcelName());
		}
		//判断压缩包是否存在
		File zipFile=new File(outPathFolder+".zip");
		if(!zipFile.exists()){
			ZipCompressing.zip(outPathFolder+".zip", new File(outPathFolder));
		}
		return outPathFolder+".zip";
	}
	
	
	/**
	 * 分配数据不同表的对应字段
	 * @param e
	 * @return
	 */
	private String[] getExcelFlied(ExcelExportion e){
		switch (e.getExcelSimpleName()) {
		case "F1":
			return ExcelTable.F1;
		case "F2":
			return ExcelTable.F2;
		case "F3":
			return ExcelTable.F3;
		default:
			return null;
		}
	}


	private String getExcelSql(ExcelExportion e,String[]excelFlied ){
		if(e==null)return null;
		String hql=null;
		switch (e.getModelName()) {
		case "DevInfo":
			hql="select ";
			for(String s:excelFlied ){
				hql+=s+",";
			}
			hql=hql.substring(0,hql.length()-1);
			hql+=" from DevInfo as t where 1=1 and t.kfqmc = '" +e.getKfqName()+"'";			
			break;

		default:
			break;
		}
		return hql;
	}
	
	
	
	public boolean add_uploadPhotofile(Integer id,CommonsMultipartFile file,String uploader,String savetime,String groupfilepath){
		String filepath="D:/test_uploadfile2/";
		String filename=file.getOriginalFilename();
		boolean s=SaveUploadFile.saveFile(file, filepath+groupfilepath,filename);
		
		if(s){
			//修改记录
			Session session=this.sessionFactory.getCurrentSession();
			EntDxqyydPda e=(EntDxqyydPda)session.get(EntDxqyydPda.class, id);
			e.setPhotosPath(filepath+groupfilepath);
			e.setPhotosName(filename);
			//e.setIsphoto(1);
			session.saveOrUpdate(e);
		}
		return s;
	}
	
	public boolean add_uploadShapefile(Integer id,CommonsMultipartFile file,String uploader,String savetime,String groupfilepath){
		String filepath="D:/test_uploadfile2/";
		String filename=file.getOriginalFilename();
		boolean s=SaveUploadFile.saveFile(file, filepath+groupfilepath,filename);
		
		if(s){
			//修改记录
			Session session=this.sessionFactory.getCurrentSession();
			EntDxqyydPda e=(EntDxqyydPda)session.get(EntDxqyydPda.class, id);
			e.setFilePath(filepath+groupfilepath+filename);
			//e.setIsmap(1);
			session.saveOrUpdate(e);
		}
		return s;
	}
}
