package cn.mutu.land.model;

// Generated 2016-8-31 13:20:47 by Hibernate Tools 4.0.0

/**
 * AchievementFile generated by hbm2java
 */
public class AchievementFile implements java.io.Serializable {

	private Integer id;
	private String filename;
	private String filepath;
	private String uploadTime;
	private String uploader;
	private boolean isDelete;
	private String filetype;
	private String filesize;
	private String kfqName;
	private String kfqYear;
	private String groupFilepath;

	public AchievementFile() {
	}

	public AchievementFile(String filename, String filepath, String uploadTime,
			String uploader, boolean isDelete, String filetype,
			String filesize, String kfqName, String kfqYear,
			String groupFilepath) {
		this.filename = filename;
		this.filepath = filepath;
		this.uploadTime = uploadTime;
		this.uploader = uploader;
		this.isDelete = isDelete;
		this.filetype = filetype;
		this.filesize = filesize;
		this.kfqName = kfqName;
		this.kfqYear = kfqYear;
		this.groupFilepath = groupFilepath;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilepath() {
		return this.filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getUploadTime() {
		return this.uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getUploader() {
		return this.uploader;
	}

	public void setUploader(String uploader) {
		this.uploader = uploader;
	}

	public boolean isIsDelete() {
		return this.isDelete;
	}

	public void setIsDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}

	public String getFiletype() {
		return this.filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

	public String getFilesize() {
		return this.filesize;
	}

	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}

	public String getKfqName() {
		return this.kfqName;
	}

	public void setKfqName(String kfqName) {
		this.kfqName = kfqName;
	}

	public String getKfqYear() {
		return this.kfqYear;
	}

	public void setKfqYear(String kfqYear) {
		this.kfqYear = kfqYear;
	}

	public String getGroupFilepath() {
		return this.groupFilepath;
	}

	public void setGroupFilepath(String groupFilepath) {
		this.groupFilepath = groupFilepath;
	}

}
