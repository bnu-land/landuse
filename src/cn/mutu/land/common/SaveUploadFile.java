package cn.mutu.land.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.channels.FileChannel;

import org.apache.poi.xwpf.converter.core.FileImageExtractor;
import org.apache.poi.xwpf.converter.core.FileURIResolver;
import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class SaveUploadFile {

	private static int cacheInt = 0;
	
	private static long curL = 0;	
	
	/**
	 * 
	 * @param file
	 * @param saveFilePath 例"D:/test_uploadfile/"
	 * @return
	 */
	public static boolean saveFile(CommonsMultipartFile file,String saveFilePath,String filename){
		InputStream is=null;
		OutputStream os=null;
		boolean result=true;
		try{
			is=file.getInputStream();
			File out=new File(saveFilePath);
			if(!out.exists()) out.mkdirs();			
			os=new FileOutputStream(saveFilePath+filename);
			byte[]buffer=new byte[1024];
			int len=0;
			while ((len=is.read(buffer))>0){
				os.write(buffer,0,len);
			}
		}catch (Exception e){
			e.printStackTrace();
			result=false;
		}finally{
			try {
				if(is!=null)is.close();
				if(os!=null)os.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				result=false;
			}			
		}
		return result;
	}

	
	
	public static String copyPicture(String filePathNmae,String outfilePath){
		String resultPath=null;
		String filename=null;
		try {
			File f = new File(filePathNmae);
			if (!f.exists()) {
				System.out.println("Sorry File does not Exists!");
			} else {
				String randomName =getOnlyId();
				if (f.getName().endsWith(".jpg")){
					filename=randomName+".jpg";					
				}else if( f.getName().endsWith(".png")) {
					filename=randomName+".png";
				}else return null;	
				resultPath=outfilePath+filename;
				if(saveFile(f,outfilePath,filename))return resultPath ;
				else return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	public static boolean saveFile(File file,String saveFilePath,String filename){
		InputStream is=null;
		OutputStream os=null;
		boolean result=true;
		try{
			is=new FileInputStream(file) ;
			File out=new File(saveFilePath);
			if(!out.exists()) out.mkdirs();			
			os=new FileOutputStream(saveFilePath+filename);
			byte[]buffer=new byte[1024];
			int len=0;
			while ((len=is.read(buffer))>0){
				os.write(buffer,0,len);
			}
		}catch (Exception e){
			e.printStackTrace();
			result=false;
		}finally{
			try {
				if(is!=null)is.close();
				if(os!=null)os.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				result=false;
			}			
		}
		return result;
	}
	
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
