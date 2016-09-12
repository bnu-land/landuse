package cn.mutu.land.model;

public class ExcelExportion {

	private String modelName;
	private String excelName;
	private String excelSimpleName;
	private String kfqName;
	private String kfqDM;
	private String kfqYear;	
	private boolean exportAble;
	
	public ExcelExportion(){
		
	}

	public ExcelExportion(String modelName,String excelName,String excelSimpleName
			,String kfqName,String kfqDM,String kfqYear,boolean exportAble){
		this.modelName=modelName;
		this.excelName=excelName;
		this.excelSimpleName=excelSimpleName;
		this.kfqName=kfqName;
		this.kfqDM=kfqDM;
		this.kfqYear=kfqYear;
		this.exportAble=exportAble;
	}
	
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	public String getExcelName() {
		return excelName;
	}
	public void setExcelName(String excelName) {
		this.excelName = excelName;
	}
	public String getExcelSimpleName() {
		return excelSimpleName;
	}
	public void setExcelSimpleName(String excelSimpleName) {
		this.excelSimpleName = excelSimpleName;
	}
	public String getKfqName() {
		return kfqName;
	}
	public void setKfqName(String kfqName) {
		this.kfqName = kfqName;
	}
	public String getKfqDM() {
		return kfqDM;
	}
	public void setKfqDM(String kfqDM) {
		this.kfqDM = kfqDM;
	}
	public String getKfqYear() {
		return kfqYear;
	}
	public void setKfqYear(String kfqYear) {
		this.kfqYear = kfqYear;
	}

	public boolean isExportAble() {
		return exportAble;
	}

	public void setExportAble(boolean exportAble) {
		this.exportAble = exportAble;
	}
}

