package cn.mutu.land.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import cn.mutu.land.common.SaveUploadFile;
import cn.mutu.land.common.Word2Html;
import cn.mutu.land.model.AchievementFile;
import cn.mutu.land.model.URoleRight;

import java.util.Enumeration;

@Service
public class AchieveFileManageService {
	private static int cacheInt = 0;
	
	private static long curL = 0;	
	private SessionFactory sessionFactory;
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory)//ΪSessionFactory���set������Spring����Ϊ��ע��
	{
		this.sessionFactory = sessionFactory;
	}
	
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getFilesList(String kfqname,String kfqyear) {
		String hql = "FROM AchievementFile as t WHERE t.isDelete = '0'";//������model���е�TestUser��
		if (!kfqname.equals("")) {
			hql = hql +" and t.kfqName = '"+kfqname+"'";
		}
		if (!kfqyear.equals("")) {
			hql = hql +" and t.kfqYear = '"+kfqyear+"'";
		}
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
		if(filename.endsWith(".docx"))
			return Word2Html.word2007tohtml(filePathName, rootPath+"office/word07");
		else if(filename.endsWith(".doc"))
			return Word2Html.word2003tohtml(filePathName, rootPath+"office/word03");
		else if(filename.endsWith(".xls")||filename.endsWith(".xlsx"))
			return Excel2Html.excel2Html(filePathName, rootPath+"office/excel");
		else if(filename.endsWith(".jpg")||filename.endsWith(".png")){
			return SaveUploadFile.copyPicture(filePath+filename, rootPath+"office/pic/");
		}
			
		else return null;
	}
	

	public boolean add_uploadfile(CommonsMultipartFile file,String kfqName,String kfqYear,String uploader,String groupfilepath){
		
		String filepath="D:/test_uploadfile2/"+kfqYear+"/"+groupfilepath+"/";
		String filename=file.getOriginalFilename();
		boolean s=SaveUploadFile.saveFile(file, filepath,filename);
		
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
			SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			f.setUploadTime(df.format(new Date()));
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
	 * 时间戳
	 * @return
	 */
	public static synchronized String getOnlyId(){
		long curL = System.currentTimeMillis();
		if(curL>curL){
			cacheInt = 0;
		}else{
			cacheInt += 1;
		}
		return String.valueOf(curL)+String.valueOf(cacheInt);
	}
}
