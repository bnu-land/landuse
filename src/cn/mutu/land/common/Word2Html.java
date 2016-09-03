package cn.mutu.land.common;

import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.List;

import javax.imageio.ImageIO;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.model.PicturesTable;
import org.apache.poi.hwpf.usermodel.CharacterRun;
import org.apache.poi.hwpf.usermodel.Paragraph;
import org.apache.poi.hwpf.usermodel.Picture;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.hwpf.usermodel.Table;
import org.apache.poi.hwpf.usermodel.TableCell;
import org.apache.poi.hwpf.usermodel.TableIterator;
import org.apache.poi.hwpf.usermodel.TableRow;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.xmlbeans.impl.piccolo.io.FileFormatException;

import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.usermodel.Picture;
import org.apache.poi.hwpf.usermodel.PictureType;
import org.apache.poi.xwpf.converter.core.BasicURIResolver;
import org.apache.poi.xwpf.converter.core.FileImageExtractor;
import org.apache.poi.xwpf.converter.core.FileURIResolver;
import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.w3c.dom.Document;
/**
 * @Description: 利用poi将word简单的转换成html文件
 * @author 柯颖波
 * @date 2013-12-20 上午09:32:44
 * @version v1.0
 */
public class Word2Html {
	/**
	 * 回车符ASCII码
	 */
	private static final short ENTER_ASCII = 13;

	/**
	 * 空格符ASCII码
	 */
	private static final short SPACE_ASCII = 32;

	/**
	 * 水平制表符ASCII码
	 */
	private static final short TABULATION_ASCII = 9;

	private static String htmlText = "";
	private static String htmlTextTbl = "";
	private static int counter = 0;
	private static int beginPosi = 0;
	private static int endPosi = 0;
	private static int beginArray[];
	private static int endArray[];
	private static String htmlTextArray[];
	private static boolean tblExist = false;

	/**
	 * 项目路径
	 */
	private static String projectRealPath = "";
	/**
	 * 临时文件路径
	 */
	private static String tempPath = "/upfile/" + File.separator + "transferFile" + File.separator;
	/**
	 * word文档名称
	 */
	private static String wordName = "";

	
	private static int cacheInt = 0;
	
	private static long curL = 0;	
	
	public static void main(String argv[]) {
		try {
			//wordToHtml("D:\\", "test_o/二、宾西土地集约利用评价技术报告2012终.doc");
			//word2007tohtml("D:/小论文R8.docx","D:/test");
			word2003tohtml("D:/test_o/二、宾西土地集约利用评价技术报告2012终.doc","D:/test");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	
	/**
	 * 2003 word 转 html
	 * @param inFile
	 * @return
	 * @throws FileNotFoundException
	 */
	public static String word2003tohtml(String filePathName,String outfilePath)  {
		File inFile=new File(filePathName);
		
		String[] temp=filePathName.split("/");
		String filename=temp[temp.length-1];
		String resultPath=null;
		try{			
			String randomName = getOnlyId();
			//转换后html中图片src的链接
			final String baseUrl =outfilePath+"/"+randomName+"/";
			File dirF = new File(baseUrl);
			if(!dirF.exists()||!dirF.isDirectory()){
				dirF.mkdirs();
			}
			resultPath=outfilePath+"/"+randomName+".html";
			OutputStream out = new FileOutputStream(resultPath);
			
			HWPFDocument wordDocument = new HWPFDocument(new FileInputStream(inFile));
	        WordToHtmlConverter wordToHtmlConverter = new WordToHtmlConverter(DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument());  
	        wordToHtmlConverter.setPicturesManager( new PicturesManager()         
	         {  
	             public String savePicture( byte[] content,  
	                     PictureType pictureType, String suggestedName,  
	                     float widthInches, float heightInches )  
	             {  
	                 return baseUrl+suggestedName;  
	             }  
	         } );  
	        wordToHtmlConverter.processDocument(wordDocument);  
	        List<Picture> pics=wordDocument.getPicturesTable().getAllPictures();  
	        if(pics!=null){  
	            for(int i=0;i<pics.size();i++){  
	                Picture pic = (Picture)pics.get(i);  
	                try {  
	                    pic.writeImageContent(new FileOutputStream(baseUrl + pic.suggestFullFileName()));  
	                } catch (FileNotFoundException e) {  
	                    e.printStackTrace();  
	                }    
	            }  
	        }  
	        Document htmlDocument = wordToHtmlConverter.getDocument();  
	        
	        DOMSource domSource = new DOMSource(htmlDocument);  
	        StreamResult streamResult = new StreamResult(out);  
	  
	        TransformerFactory tf = TransformerFactory.newInstance();  
	        Transformer serializer = tf.newTransformer();  
	        serializer.setOutputProperty(OutputKeys.ENCODING, "utf-8");  
	        serializer.setOutputProperty(OutputKeys.INDENT, "yes");  
	        serializer.setOutputProperty(OutputKeys.METHOD, "html");  
	        serializer.transform(domSource, streamResult);  
	        out.close();  
	        //读取文件
			BufferedReader in1 = new BufferedReader(new FileReader(
					resultPath));
			String str="";
			String content="";
			int l=outfilePath.length()+2;
			while ((str = in1.readLine()) != null) {						
				content+=str.replaceAll("<img src=(.{"+(l-20)+","+(l+20)+"})word03.","<img src=\"");						
			}
			if(content.indexOf("<img")!=-1){
				System.out.println(content.substring(content.indexOf("<img")));
				FileOutputStream fos=new FileOutputStream(resultPath);
				BufferedWriter bw = null;
				bw = new BufferedWriter(new OutputStreamWriter(fos, "utf-8"));
				bw.write(content);
				in1.close();
				try {
					if (bw != null)
						bw.close();
					if (fos != null)
						fos.close();
				} catch (IOException ie) {
					ie.printStackTrace();
				}	        
			}else in1.close();
		}catch(Exception e){
			e.printStackTrace();
		}
        return resultPath;
	}  	
	
	
	/**
	 * 2007 word 转html
	 * @param filePathName 文件路径加名称
	 * @param outfilePath 输出文件路径
	 */
	public static String word2007tohtml(String filePathName,String outfilePath){
		String[] temp=filePathName.split("/");
		String filename=temp[temp.length-1];
		String resultPath=null;
		try {
			File f = new File(filePathName);
			if (!f.exists()) {
				System.out.println("Sorry File does not Exists!");
			} else {
				if (f.getName().endsWith(".docx")
						|| f.getName().endsWith(".DOCX")) {

					// 1) Load DOCX into XWPFDocument
					InputStream in = new FileInputStream(f);
					XWPFDocument document = new XWPFDocument(in);

					// 2) Prepare XHTML options (here we set the IURIResolver to
					// load images from a "word/media" folder)
					String randomName =getOnlyId();					
					File imageFolderFile = new File(outfilePath+"/"+randomName+"/");
					if(!imageFolderFile.exists())imageFolderFile.mkdir();
					
					XHTMLOptions options = XHTMLOptions.create().URIResolver(
							new FileURIResolver(imageFolderFile));
					options.setExtractor(new FileImageExtractor(imageFolderFile));
					options.setIgnoreStylesIfUnused(false);
					options.setFragment(true);

					// 3) Convert XWPFDocument to XHTML
					resultPath=outfilePath+"/"+randomName+".html";
					
					File file = new File(resultPath);
					OutputStream out = new FileOutputStream(file);
					XHTMLConverter.getInstance()
							.convert(document, out, options);
					if(out!=null)out.close();
					BufferedReader in1 = new BufferedReader(new FileReader(
							resultPath));
					String str="";
					String content="";
					int l=outfilePath.length()+2;
					while ((str = in1.readLine()) != null) {						
						content+=str.replaceAll("<img src=(.{"+(l-20)+","+(l+20)+"})word07.","<img src=\"");						
					}
					if(content.indexOf("<img")!=-1){
						System.out.println(content.substring(content.indexOf("<img")));
						FileOutputStream fos=new FileOutputStream(file);
						BufferedWriter bw = null;
						bw = new BufferedWriter(new OutputStreamWriter(fos, "utf-8"));
						in1.close();
						bw.write(content);						
						try {
							if (bw != null)
								bw.close();
							if (fos != null)
								fos.close();
						} catch (IOException ie) {
							ie.printStackTrace();
						}
					}else in1.close();
					//writeFile(str,resultPath);
					// file.delete();
				} else {
					System.out.println("Enter only MS Office 2007+ files");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultPath;
	}
	
	
	

	/**
	 * 读取每个文字样式
	 * 
	 * @param fileName
	 * @throws Exception
	 */


	private static void getWordAndStyle(String fileName) throws Exception {
		FileInputStream in = new FileInputStream(new File(fileName));
		HWPFDocument doc = new HWPFDocument(in);

		Range rangetbl = doc.getRange();// 得到文档的读取范围
		TableIterator it = new TableIterator(rangetbl);

		int num = 100;

		beginArray = new int[num];
		endArray = new int[num];
		htmlTextArray = new String[num];
		tblExist = false;

		// 取得文档中字符的总数
		int length = doc.characterLength();
		// 创建图片容器
		PicturesTable pTable = doc.getPicturesTable();
		// 创建段落容器

		htmlText = "<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><title>"
				+ doc.getSummaryInformation().getTitle()
				+ "</title></head><body><div style='margin:60px;text-align:center;'><div style='width:620px;text-align:left;line-height:24px;'>";
		// 创建临时字符串,好加以判断一串字符是否存在相同格式

		if (it.hasNext()) {
			readTable(it, rangetbl);
		}

		int cur = 0;
		String tempString = "";
		for (int i = 0; i < length - 1; i++) {
			// 整篇文章的字符通过一个个字符的来判断,range为得到文档的范围
			Range range = new Range(i, i + 1, doc);
			CharacterRun cr = range.getCharacterRun(0);
			// beginArray=new int[num];
			// endArray=new int[num];
			// htmlTextArray=new String[num];
			if (tblExist) {
				if (i == beginArray[cur]) {
					htmlText += tempString + htmlTextArray[cur];
					tempString = "";
					i = endArray[cur] - 1;
					cur++;
					continue;
				}
			}
			if (pTable.hasPicture(cr)) {
				htmlText += tempString;
				// 读写图片
				try {
					readPicture(pTable, cr);
				} catch (Exception e) {
					e.printStackTrace();
				}
				tempString = "";
			} else {

				Range range2 = new Range(i + 1, i + 2, doc);
				// 第二个字符
				CharacterRun cr2 = range2.getCharacterRun(0);
				char c = cr.text().charAt(0);
				// System.out.println(c);
				// /System.out.println(i+"::"+range.getEndOffset()+"::"+range.getStartOffset()+"::"+c);

				// 判断是否为回车符
				if (c == ENTER_ASCII) {
					tempString += "<br/>";
				}
				// 判断是否为空格符
				else if (c == SPACE_ASCII)
					tempString += " ";
				// 判断是否为水平制表符
				else if (c == TABULATION_ASCII)
					tempString += "    ";
				// 比较前后2个字符是否具有相同的格式
				boolean flag = compareCharStyle(cr, cr2);
				if (flag)
					tempString += cr.text();
				else {
					String fontStyle = "<span style=\"font-family:" + cr.getFontName() + ";font-size:"
							+ cr.getFontSize() / 2 + "pt;";

					if (cr.isBold())
						fontStyle += "font-weight:bold;";
					if (cr.isItalic())
						fontStyle += "font-style:italic;";
					if (cr.isStrikeThrough())
						fontStyle += "text-decoration:line-through;";

					int fontcolor = cr.getIco24();
					int[] rgb = new int[3];
					if (fontcolor != -1) {
						rgb[0] = (fontcolor >> 0) & 0xff; // red;
						rgb[1] = (fontcolor >> 8) & 0xff; // green
						rgb[2] = (fontcolor >> 16) & 0xff; // blue
					}
					fontStyle += "color: rgb(" + rgb[0] + "," + rgb[1] + "," + rgb[2] + ");";
					htmlText += fontStyle + "\">" + tempString + cr.text() + "</span>";
					tempString = "";
				}
			}
		}

		htmlText += tempString + "</div></div></body></html>";
		// System.out.println(htmlText);
	}

	/**
	 * 读写文档中的表格
	 * 
	 * @param pTable
	 * @param cr
	 * @throws Exception
	 */
	private static void readTable(TableIterator it, Range rangetbl) throws Exception {

		htmlTextTbl = "";
		// 迭代文档中的表格

		counter = -1;
		while (it.hasNext()) {
			tblExist = true;
			htmlTextTbl = "";
			Table tb = (Table) it.next();
			beginPosi = tb.getStartOffset();
			endPosi = tb.getEndOffset();

			// System.out.println("............"+beginPosi+"...."+endPosi);
			counter = counter + 1;
			// 迭代行，默认从0开始
			beginArray[counter] = beginPosi;
			endArray[counter] = endPosi;

			htmlTextTbl += "<table border='1' cellpadding='0' cellspacing='0' >";
			for (int i = 0; i < tb.numRows(); i++) {
				TableRow tr = tb.getRow(i);

				htmlTextTbl += "<tr align='center'>";
				// 迭代列，默认从0开始
				for (int j = 0; j < tr.numCells(); j++) {
					TableCell td = tr.getCell(j);// 取得单元格
					int cellWidth = td.getWidth();

					// 取得单元格的内容
					for (int k = 0; k < td.numParagraphs(); k++) {
						Paragraph para = td.getParagraph(k);
						CharacterRun crTemp = para.getCharacterRun(0);
						String fontStyle = "<span style=\"font-family:" + crTemp.getFontName() + ";font-size:"
								+ crTemp.getFontSize() / 2 + "pt;color:" + crTemp.getColor() + ";";

						if (crTemp.isBold())
							fontStyle += "font-weight:bold;";
						if (crTemp.isItalic())
							fontStyle += "font-style:italic;";

						String s = fontStyle + "\">" + para.text().toString().trim() + "</span>";
						if (s == "") {
							s = " ";
						}
						// System.out.println(s);
						htmlTextTbl += "<td width=" + cellWidth + ">" + s + "</td>";
						// System.out.println(i + ":" + j + ":" + cellWidth + ":" + s);
					} // end for
				} // end for
			} // end for
			htmlTextTbl += "</table>";
			htmlTextArray[counter] = htmlTextTbl;

		} // end while
	}

	/**
	 * 读写文档中的图片
	 * 
	 * @param pTable
	 * @param cr
	 * @throws Exception
	 */
	private static void readPicture(PicturesTable pTable, CharacterRun cr) throws Exception {
		// 提取图片
		Picture pic = pTable.extractPicture(cr, false);
		BufferedImage image = null;// 图片对象
		// 获取图片样式
		int picHeight = pic.getHeight() * pic.getAspectRatioY() / 100;
		int picWidth = pic.getAspectRatioX() * pic.getWidth() / 100;
		if (picWidth > 500) {
			picHeight = 500 * picHeight / picWidth;
			picWidth = 500;
		}
		String style = " style='height:" + picHeight + "px;width:" + picWidth + "px'";

		// 返回POI建议的图片文件名
		String afileName = pic.suggestFullFileName();
		//单元测试路径
		String directory = "images/" + wordName + "/";
		//项目路径
		//String directory = tempPath + "images/" + wordName + "/";
		makeDir(projectRealPath, directory);// 创建文件夹

		int picSize = cr.getFontSize();
		int myHeight = 0;

		if (afileName.indexOf(".wmf") > 0) {
			OutputStream out = new FileOutputStream(new File(projectRealPath + directory + afileName));
			out.write(pic.getContent());
			out.close();
			afileName = Wmf2Png.wmfToJpg(projectRealPath + directory + afileName);

			File file = new File(projectRealPath + directory + afileName);

			try {
				image = ImageIO.read(file);
			} catch (Exception e) {
				e.printStackTrace();
			}

			int pheight = image.getHeight();
			int pwidth = image.getWidth();
			if (pwidth > 500) {
				htmlText += "<img style='width:" + pwidth + "px;height:" + myHeight + "px'" + " src=\"" + directory
						+ afileName + "\"/>";
			} else {
				myHeight = (int) (pheight / (pwidth / (picSize * 1.0)) * 1.5);
				htmlText += "<img style='vertical-align:middle;width:" + picSize * 1.5 + "px;height:" + myHeight
						+ "px'" + " src=\"" + directory + afileName + "\"/>";
			}

		} else {
			OutputStream out = new FileOutputStream(new File(projectRealPath + directory + afileName));
			// pic.writeImageContent(out);
			out.write(pic.getContent());
			out.close();
			// 处理jpg或其他（即除png外）
			if (afileName.indexOf(".png") == -1) {
				try {
					File file = new File(projectRealPath + directory + afileName);
					image = ImageIO.read(file);
					picHeight = image.getHeight();
					picWidth = image.getWidth();
					if (picWidth > 500) {
						picHeight = 500 * picHeight / picWidth;
						picWidth = 500;
					}
					style = " style='height:" + picHeight + "px;width:" + picWidth + "px'";
				} catch (Exception e) {
					// e.printStackTrace();
				}
			}
			htmlText += "<img " + style + " src=\"" + directory + afileName + "\"/>";
		}
		if (pic.getWidth() > 450) {
			htmlText += "<br/>";
		}
	}

	private static boolean compareCharStyle(CharacterRun cr1, CharacterRun cr2) {
		boolean flag = false;
		if (cr1.isBold() == cr2.isBold() && cr1.isItalic() == cr2.isItalic()
				&& cr1.getFontName().equals(cr2.getFontName()) && cr1.getFontSize() == cr2.getFontSize()) {
			flag = true;
		}
		return flag;
	}

	/**
	 * 写文件（成功返回true，失败则返回false）
	 * 
	 * @param s
	 *            要写入的内容
	 * @param filePath
	 *            文件
	 */
	private static boolean writeFile(String s, String filePath) {
		FileOutputStream fos = null;
		BufferedWriter bw = null;
		s = s.replaceAll("EMBED", "").replaceAll("Equation.DSMT4", "");
		try {
			makeDir(projectRealPath, tempPath);// 创建文件夹
			File file = new File(filePath);
			if (file.exists()) {
				return false;
			}
			fos = new FileOutputStream(file);
			bw = new BufferedWriter(new OutputStreamWriter(fos, "utf-8"));
			bw.write(s);
			// System.out.println(filePath + "文件写入成功！");
		} catch (FileNotFoundException fnfe) {
			fnfe.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} finally {
			try {
				if (bw != null)
					bw.close();
				if (fos != null)
					fos.close();
			} catch (IOException ie) {
				ie.printStackTrace();
			}
		}
		return true;
	}

	/**
	 * 根据路径名生成多级路径
	 * 
	 * @param url
	 *            参数要以"\classes\cn\qtone\"或者"/classes/cn/qtone/"
	 */
	private static String makeDir(String root, String url) {
		String[] sub;
		url = url.replaceAll("\\/", "\\\\");
		if (url.indexOf("\\") > -1) {
			sub = url.split("\\\\");
		} else {
			return "-1";
		}

		File dir = null;
		try {
			dir = new File(root);
			for (int i = 0; i < sub.length; i++) {
				if (!dir.exists() && !sub[i].equals("")) {
					dir.mkdir();
				}
				File dir2 = new File(dir + File.separator + sub[i]);
				if (!dir2.exists()) {
					dir2.mkdir();
				}
				dir = dir2;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "-1";
		}
		return dir.toString();
	}

	/**
	 * 将word文档转化,返回转化后的文件路径
	 * 
	 * @param projectPath
	 *            项目路径
	 * @param relativeFilePath
	 *            文件相对路径
	 * @return 返回生成的htm路径（如果出错，则返回null）
	 */
	public static String wordToHtml(String projectPath, String relativeFilePath) {
		String resultPath = null;
		projectRealPath = projectPath;// 项目路径
		String filePath = "";
		// System.out.println(projectRealPath + tempPath);
		// System.out.println(makeDir(projectRealPath, tempPath));
		try {
			File file = new File(projectPath + relativeFilePath);
			if (file.exists()) {
				if (file.getName().indexOf(".doc") == -1 || file.getName().indexOf(".docx") > 0) {
					throw new FileFormatException("请确认文件格式为doc!");
				} else {
					wordName = file.getName();
					wordName = wordName.substring(0, wordName.indexOf("."));

					filePath = projectRealPath + tempPath + wordName + ".htm";
					synchronized (relativeFilePath) {// 处理线程同步问题
						File ff = new File(filePath);
						if (!ff.exists()) {// 如果不存在则进行转换
							getWordAndStyle(projectPath + relativeFilePath);
							writeFile(htmlText, filePath);
						}
					}
					resultPath = tempPath + wordName + ".htm";
				}
			} else {
				throw new FileNotFoundException("没找到相关文件！");
			}
		} catch (NullPointerException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultPath;
	}
}
