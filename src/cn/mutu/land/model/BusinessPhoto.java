package cn.mutu.land.model;

// Generated 2016-6-16 22:18:50 by Hibernate Tools 4.0.0

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * BusinessPhoto generated by hbm2java
 */
@Entity
@Table(name = "business_photo", catalog = "landuse")
public class BusinessPhoto implements java.io.Serializable {

	private int id;
	private String proCode;
	private Date upDate;
	private String photoPath;
	private String photoTitle;
	private int isPass;
	private String other;

	public BusinessPhoto() {
	}

	public BusinessPhoto(int id, int isPass) {
		this.id = id;
		this.isPass = isPass;
	}

	public BusinessPhoto(int id, String proCode, Date upDate, String photoPath,
			String photoTitle, int isPass, String other) {
		this.id = id;
		this.proCode = proCode;
		this.upDate = upDate;
		this.photoPath = photoPath;
		this.photoTitle = photoTitle;
		this.isPass = isPass;
		this.other = other;
	}

	@Id
	@Column(name = "id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "pro_code", length = 50)
	public String getProCode() {
		return this.proCode;
	}

	public void setProCode(String proCode) {
		this.proCode = proCode;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "up_date", length = 19)
	public Date getUpDate() {
		return this.upDate;
	}

	public void setUpDate(Date upDate) {
		this.upDate = upDate;
	}

	@Column(name = "photo_path", length = 65535)
	public String getPhotoPath() {
		return this.photoPath;
	}

	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}

	@Column(name = "photo_title", length = 50)
	public String getPhotoTitle() {
		return this.photoTitle;
	}

	public void setPhotoTitle(String photoTitle) {
		this.photoTitle = photoTitle;
	}

	@Column(name = "is_pass", nullable = false)
	public int getIsPass() {
		return this.isPass;
	}

	public void setIsPass(int isPass) {
		this.isPass = isPass;
	}

	@Column(name = "other", length = 65535)
	public String getOther() {
		return this.other;
	}

	public void setOther(String other) {
		this.other = other;
	}

}
