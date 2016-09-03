package cn.mutu.land.common;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
}
