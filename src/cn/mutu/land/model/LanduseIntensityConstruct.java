package cn.mutu.land.model;

// Generated 2015-6-17 5:51:33 by Hibernate Tools 4.0.0

import java.util.Date;

/**
 * LanduseIntensityConstruct generated by hbm2java
 */
public class LanduseIntensityConstruct implements java.io.Serializable {

	private Integer id;
	private String kfqName;
	private String kfqMap;
	private Date calcDate;
	private Double mainYjcczmj;
	private Double mainBuildWeight;
	private Double mainBuildIdeal;
	private Double mainConstruct;
	private Double developYjcczmj;
	private Double developBuildWeight;
	private Double developBuildIdeal;
	private Double developConstruct;
	private String description;

	public LanduseIntensityConstruct() {
	}

	public LanduseIntensityConstruct(String kfqName, String kfqMap,
			Date calcDate, Double mainYjcczmj, Double mainBuildWeight,
			Double mainBuildIdeal, Double mainConstruct, Double developYjcczmj,
			Double developBuildWeight, Double developBuildIdeal,
			Double developConstruct, String description) {
		this.kfqName = kfqName;
		this.kfqMap = kfqMap;
		this.calcDate = calcDate;
		this.mainYjcczmj = mainYjcczmj;
		this.mainBuildWeight = mainBuildWeight;
		this.mainBuildIdeal = mainBuildIdeal;
		this.mainConstruct = mainConstruct;
		this.developYjcczmj = developYjcczmj;
		this.developBuildWeight = developBuildWeight;
		this.developBuildIdeal = developBuildIdeal;
		this.developConstruct = developConstruct;
		this.description = description;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getKfqName() {
		return this.kfqName;
	}

	public void setKfqName(String kfqName) {
		this.kfqName = kfqName;
	}

	public String getKfqMap() {
		return this.kfqMap;
	}

	public void setKfqMap(String kfqMap) {
		this.kfqMap = kfqMap;
	}

	public Date getCalcDate() {
		return this.calcDate;
	}

	public void setCalcDate(Date calcDate) {
		this.calcDate = calcDate;
	}

	public Double getMainYjcczmj() {
		return this.mainYjcczmj;
	}

	public void setMainYjcczmj(Double mainYjcczmj) {
		this.mainYjcczmj = mainYjcczmj;
	}

	public Double getMainBuildWeight() {
		return this.mainBuildWeight;
	}

	public void setMainBuildWeight(Double mainBuildWeight) {
		this.mainBuildWeight = mainBuildWeight;
	}

	public Double getMainBuildIdeal() {
		return this.mainBuildIdeal;
	}

	public void setMainBuildIdeal(Double mainBuildIdeal) {
		this.mainBuildIdeal = mainBuildIdeal;
	}

	public Double getMainConstruct() {
		return this.mainConstruct;
	}

	public void setMainConstruct(Double mainConstruct) {
		this.mainConstruct = mainConstruct;
	}

	public Double getDevelopYjcczmj() {
		return this.developYjcczmj;
	}

	public void setDevelopYjcczmj(Double developYjcczmj) {
		this.developYjcczmj = developYjcczmj;
	}

	public Double getDevelopBuildWeight() {
		return this.developBuildWeight;
	}

	public void setDevelopBuildWeight(Double developBuildWeight) {
		this.developBuildWeight = developBuildWeight;
	}

	public Double getDevelopBuildIdeal() {
		return this.developBuildIdeal;
	}

	public void setDevelopBuildIdeal(Double developBuildIdeal) {
		this.developBuildIdeal = developBuildIdeal;
	}

	public Double getDevelopConstruct() {
		return this.developConstruct;
	}

	public void setDevelopConstruct(Double developConstruct) {
		this.developConstruct = developConstruct;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
