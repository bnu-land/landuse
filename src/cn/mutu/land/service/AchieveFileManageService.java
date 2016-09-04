package cn.mutu.land.service;


import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
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

}
