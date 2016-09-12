package cn.mutu.land.common;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

public class ExcelTools {
	/**
	 * 输出到excel
	 * 
	 * @throws IOException
	 */
	public static void exportEncryptedQicanToExcel(
			Map<String, List<String>> map, String outPath) throws IOException {
		// 创建Excel的工作书册 Workbook,对应到一个excel文档
		HSSFWorkbook wb = new HSSFWorkbook();

		// 创建Excel的工作sheet,对应到一个excel文档的tab
		HSSFSheet sheet = wb.createSheet("sheet1");

		// 设置excel每列宽度
		sheet.setColumnWidth(22, 4000);
		sheet.setColumnWidth(23, 4000);

		// 创建字体样式
		HSSFFont font = wb.createFont();
		font.setFontName("宋体");
		// font.setBold(false);

		for (Map.Entry<String, List<String>> entry : map.entrySet()) {
			// 获取key、value
			String key = entry.getKey();
			int index = Integer.parseInt(key); // 转换成int行
			List<String> list = entry.getValue();

			// 创建Excel的sheet的一行
			HSSFRow row = sheet.createRow(index - 1);
			row.getCell(0).setCellValue("");
			row.setHeight((short) 400);// 设定行的高度

			createCell(wb, row, 0, key, font);
			createCell(wb, row, 1, list.get(0), font);
			createCell(wb, row, 2, list.get(1), font);
			createCell(wb, row, 3, list.get(2), font);
			createCell(wb, row, 4, list.get(3), font);
			createCell(wb, row, 5, list.get(4), font);
			createCell(wb, row, 6, list.get(5), font);
			createCell(wb, row, 7, list.get(6), font);
		}

		FileOutputStream os = new FileOutputStream(outPath);
		wb.write(os);
		os.close();
	}

	/**
	 * 输出到excel
	 * 
	 * @throws IOException
	 */
	public static boolean exportEncryptedQicanToExcel2(
			Map<String,Object> map, String inputFilePath, String outPath) throws IOException {
		// 创建Excel的工作书册 Workbook,对应到一个excel文档
		FileInputStream inputStream=new FileInputStream(inputFilePath);
		HSSFWorkbook wb = new HSSFWorkbook(inputStream);

		// 创建Excel的工作sheet,对应到一个excel文档的tab
		HSSFSheet sheet = wb.getSheetAt(0);

		// 创建字体样式
		HSSFFont font = wb.createFont();
		font.setFontName("微软雅黑");
		// font.setBold(false);
		boolean hasFormula=false;//标记是否存在公式
		int last=sheet.getLastRowNum();	//最大行	
		for(int i=0;i<last;i++){
			HSSFRow row =sheet.getRow(i);
			if(row==null)break;				
			int colnum=row.getLastCellNum();//最大列
			for(int j=0;j<colnum;j++){
				HSSFCell c=row.getCell(j);
				if(c==null)continue;				
				else if(c.getCellType()==HSSFCell.CELL_TYPE_STRING)	{
					String cellvalue=c.getStringCellValue();
					String value="";
					if(map.get(cellvalue)!=null){
						value=map.get(cellvalue).toString();
						HSSFCell cell = row.createCell(j);
						cell.setCellValue(value);
						cell.setCellStyle(c.getCellStyle());
						System.out.println(i+"/"+j+"cell value:"+cellvalue+"/new value:"+cell.getStringCellValue());							
					}else{
						System.out.println(i+"/"+j+"cell value:"+cellvalue);
					}						
				}else if(!hasFormula&&c.getCellType()==HSSFCell.CELL_TYPE_FORMULA){
					hasFormula=true;
				}
			}
		}
		//重新遍历计算公式
		if(hasFormula)
		for(int i=0;i<last;i++){
			HSSFRow row =sheet.getRow(i);
			if(row==null)break;				
			int colnum=row.getLastCellNum();//最大列
			for(int j=0;j<colnum;j++){
				HSSFCell c=row.getCell(j);
				if(c==null)continue;				
				if(c.getCellType()==HSSFCell.CELL_TYPE_FORMULA){						
					c.setCellFormula(c.getCellFormula());
					System.out.println("公式"+c.getCellFormula()+"="+c.getNumericCellValue());
				}
			}
		}
		FileOutputStream os = new FileOutputStream(outPath);
		wb.write(os);
		os.close();
		return true;
	}
	
	private static void createCell(HSSFWorkbook wb, HSSFRow row, int column,
			String value, HSSFFont font) {
		HSSFCell cell = row.createCell(column);
		cell.setCellValue(value);
		// 创建单元格样式
		HSSFCellStyle style = wb.createCellStyle();
		style.setWrapText(true);
		style.setFont(font);
		cell.setCellStyle(style);
	}

	/**
	 * 读取Excel数据内容
	 * 
	 * @param InputStream
	 * @return Map 包含单元格数据内容的Map对象
	 */
	public Map<Integer, List<Object>> readExcelContent(InputStream is) {
		Map<Integer, List<Object>> content = new HashMap<Integer, List<Object>>();
		POIFSFileSystem fs = null;
		HSSFWorkbook wb = null;
		HSSFSheet sheet = null;
		HSSFRow row = null;
		try {
			fs = new POIFSFileSystem(is);
			wb = new HSSFWorkbook(fs);
		} catch (IOException e) {
			e.printStackTrace();
		}
		sheet = wb.getSheetAt(0);
		// 得到总行数
		int rowNum = sheet.getLastRowNum();
		row = sheet.getRow(0);
		int colNum = row.getPhysicalNumberOfCells();
		// 正文内容应该从第二行开始,第一行为表头的标题
		for (int i = 1; i <= rowNum; i++) {
			row = sheet.getRow(i);
			int j = 0;
			List<Object> list = new ArrayList<Object>();
			while (j < colNum) {
				// 每个单元格的数据内容用"-"分割开，以后需要时用String类的replace()方法还原数据
				// 也可以将每个单元格的数据设置到一个javabean的属性中，此时需要新建一个javabean
				// str += getStringCellValue(row.getCell((short) j)).trim() +
				// "-";
				list.add(getCellFormatValue(row.getCell(j)).trim());
				j++;
			}
			content.put(i, list);
		}
		return content;
	}

	/**
	 * 读取Excel全部内容
	 * 
	 * @param InputStream
	 * @return Map 包含单元格数据内容的Map对象
	 */
	public Map<Integer, List<String>> readExcelAllContent(InputStream is) {
		Map<Integer, List<String>> content = new HashMap<Integer, List<String>>();
		POIFSFileSystem fs = null;
		HSSFWorkbook wb = null;
		HSSFSheet sheet = null;
		HSSFRow row = null;
		try {
			fs = new POIFSFileSystem(is);
			wb = new HSSFWorkbook(fs);
		} catch (IOException e) {
			e.printStackTrace();
		}
		sheet = wb.getSheetAt(0);
		// 得到总行数
		int rowNum = sheet.getLastRowNum();
		row = sheet.getRow(0);
		int colNum = row.getPhysicalNumberOfCells();
		// 正文内容应该从第二行开始,第一行为表头的标题
		for (int i = 0; i <= rowNum; i++) {
			row = sheet.getRow(i);
			int j = 0;
			List<String> list = new ArrayList<String>();
			while (j < colNum) {
				// 每个单元格的数据内容用"-"分割开，以后需要时用String类的replace()方法还原数据
				// 也可以将每个单元格的数据设置到一个javabean的属性中，此时需要新建一个javabean
				// str += getStringCellValue(row.getCell((short) j)).trim() +
				// "-";
				String cellStr = getCellFormatValue(row.getCell(j)).trim();
				if (j > 0) {
					list.add(cellStr);
				} else {
					list.add(cellStr);
				}

				j++;
			}
			content.put(i, list);
		}
		return content;
	}

	/**
	 * 根据HSSFCell类型设置数据
	 * 
	 * @param cell
	 * @return
	 */
	private String getCellFormatValue(HSSFCell cell) {
		String cellvalue = "";
		if (cell != null) {
			// 判断当前Cell的Type
			switch (cell.getCellType()) {
			// 如果当前Cell的Type为NUMERIC
			case HSSFCell.CELL_TYPE_NUMERIC:
			case HSSFCell.CELL_TYPE_FORMULA: {
				// 判断当前的cell是否为Date
				if (HSSFDateUtil.isCellDateFormatted(cell)) {
					// 如果是Date类型则，转化为Data格式

					// 方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
					// cellvalue = cell.getDateCellValue().toLocaleString();

					// 方法2：这样子的data格式是不带带时分秒的：2011-10-12
					Date date = cell.getDateCellValue();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					cellvalue = sdf.format(date);

				}
				// 如果是纯数字
				else {
					// 取得当前Cell的数值
					cellvalue = String.valueOf(cell.getNumericCellValue());
				}
				break;
			}
			// 如果当前Cell的Type为STRIN
			case HSSFCell.CELL_TYPE_STRING:
				// 取得当前的Cell字符串
				cellvalue = cell.getRichStringCellValue().getString();
				break;
			// 默认的Cell值
			default:
				cellvalue = " ";
			}
		} else {
			cellvalue = "";
		}
		return cellvalue;

	}


	
	public static void main(String[]args){
			String outPath="C:/Users/DELL/Desktop/testF2.xls";
//			String inputFilepath="C:/Users/DELL/Desktop/Data/200120131231G2310620003/表F.3 开发区用地审批及调整情况调查表.xls";
//			Map<String,Object> map=new TreeMap<String, Object>();
//			map.put("MKqtzhmj", 210);
//			map.put("MKqtzmj", 10);
//			map.put("MKqtzsj", 2019);
//			map.put("sptdzmj", 200);
//			map.put("kfqmc", "海林经济技术开发区");
			String inputFilepath="C:/Users/DELL/Desktop/Data/200120131231G2310620003/表F.2 开发区基本信息调查表（Ⅱ）.xls";
			Map<String,Object> map=new TreeMap<String, Object>();
			map.put("MKfqpjmj", 210);
			map.put("DKfqpjmj", 10);
			map.put("MCzrk", 2019);
			map.put("DCzrk", 200);
			map.put("MGxssze", 9);
			map.put("DGxssze", 1);			
			try {
				ExcelTools.exportEncryptedQicanToExcel2(map,inputFilepath, outPath);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
