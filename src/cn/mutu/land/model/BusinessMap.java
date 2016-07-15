package cn.mutu.land.model;

// Generated 2016-7-12 3:16:38 by Hibernate Tools 4.0.0

/**
 * BusinessMap generated by hbm2java
 */
public class BusinessMap implements java.io.Serializable {

	private Integer id;
	private String proCode;
	private String uploadUser;
	private double westCoor;
	private double westCoorw;
	private double eastCoor;
	private double eastCoorw;
	private double northCoor;
	private double northCoorw;
	private double southCoor;
	private double southCoorw;
	private int isPass;
	private String checkResult;

	public BusinessMap() {
	}

	public BusinessMap(String proCode, double westCoor, double westCoorw,
			double eastCoor, double eastCoorw, double northCoor,
			double northCoorw, double southCoor, double southCoorw, int isPass) {
		this.proCode = proCode;
		this.westCoor = westCoor;
		this.westCoorw = westCoorw;
		this.eastCoor = eastCoor;
		this.eastCoorw = eastCoorw;
		this.northCoor = northCoor;
		this.northCoorw = northCoorw;
		this.southCoor = southCoor;
		this.southCoorw = southCoorw;
		this.isPass = isPass;
	}

	public BusinessMap(String proCode, String uploadUser, double westCoor,
			double westCoorw, double eastCoor, double eastCoorw,
			double northCoor, double northCoorw, double southCoor,
			double southCoorw, int isPass, String checkResult) {
		this.proCode = proCode;
		this.uploadUser = uploadUser;
		this.westCoor = westCoor;
		this.westCoorw = westCoorw;
		this.eastCoor = eastCoor;
		this.eastCoorw = eastCoorw;
		this.northCoor = northCoor;
		this.northCoorw = northCoorw;
		this.southCoor = southCoor;
		this.southCoorw = southCoorw;
		this.isPass = isPass;
		this.checkResult = checkResult;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProCode() {
		return this.proCode;
	}

	public void setProCode(String proCode) {
		this.proCode = proCode;
	}

	public String getUploadUser() {
		return this.uploadUser;
	}

	public void setUploadUser(String uploadUser) {
		this.uploadUser = uploadUser;
	}

	public double getWestCoor() {
		return this.westCoor;
	}

	public void setWestCoor(double westCoor) {
		this.westCoor = westCoor;
	}

	public double getWestCoorw() {
		return this.westCoorw;
	}

	public void setWestCoorw(double westCoorw) {
		this.westCoorw = westCoorw;
	}

	public double getEastCoor() {
		return this.eastCoor;
	}

	public void setEastCoor(double eastCoor) {
		this.eastCoor = eastCoor;
	}

	public double getEastCoorw() {
		return this.eastCoorw;
	}

	public void setEastCoorw(double eastCoorw) {
		this.eastCoorw = eastCoorw;
	}

	public double getNorthCoor() {
		return this.northCoor;
	}

	public void setNorthCoor(double northCoor) {
		this.northCoor = northCoor;
	}

	public double getNorthCoorw() {
		return this.northCoorw;
	}

	public void setNorthCoorw(double northCoorw) {
		this.northCoorw = northCoorw;
	}

	public double getSouthCoor() {
		return this.southCoor;
	}

	public void setSouthCoor(double southCoor) {
		this.southCoor = southCoor;
	}

	public double getSouthCoorw() {
		return this.southCoorw;
	}

	public void setSouthCoorw(double southCoorw) {
		this.southCoorw = southCoorw;
	}

	public int getIsPass() {
		return this.isPass;
	}

	public void setIsPass(int isPass) {
		this.isPass = isPass;
	}

	public String getCheckResult() {
		return this.checkResult;
	}

	public void setCheckResult(String checkResult) {
		this.checkResult = checkResult;
	}

}
