package cn.mutu.land.model;

// Generated 2016-6-12 12:42:31 by Hibernate Tools 4.0.0

/**
 * SysKfqInfo generated by hbm2java
 */
public class SysKfqInfo implements java.io.Serializable {

	private Integer id;
	private int pid;
	private String kfqName;
	private byte isCity;
	private byte enable;
	private String comment;

	public SysKfqInfo() {
	}

	public SysKfqInfo(int pid, String kfqName, byte isCity, byte enable) {
		this.pid = pid;
		this.kfqName = kfqName;
		this.isCity = isCity;
		this.enable = enable;
	}

	public SysKfqInfo(int pid, String kfqName, byte isCity, byte enable,
			String comment) {
		this.pid = pid;
		this.kfqName = kfqName;
		this.isCity = isCity;
		this.enable = enable;
		this.comment = comment;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getPid() {
		return this.pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getKfqName() {
		return this.kfqName;
	}

	public void setKfqName(String kfqName) {
		this.kfqName = kfqName;
	}

	public byte getIsCity() {
		return this.isCity;
	}

	public void setIsCity(byte isCity) {
		this.isCity = isCity;
	}

	public byte getEnable() {
		return this.enable;
	}

	public void setEnable(byte enable) {
		this.enable = enable;
	}

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}
