package cn.mutu.land.model;

// Generated 2016-9-24 16:08:24 by Hibernate Tools 4.0.0

/**
 * DevZdInfo generated by hbm2java
 */
public class DevZdInfo implements java.io.Serializable {

	private Integer id;
	private int mbbsm;
	private String ysdm;
	private String kfqdm;
	private String kfqmc;
	private String kfqpjfw;
	private String kfqpjlx;
	private String tbbh;
	private String dlmc;
	private String dldm;
	private double dlmj;
	private String tdxzqk;
	private String qs;
	private String gysj;
	private String gylx;
	private String gydm;
	private String tdzpg;
	private String synx;
	private String tdsyz;
	private String pzyt;
	private String pzdm;
	private String ghyt;
	private String ghdm;
	private double ghjzmj;
	private double ghjdmj;
	private double ghrjl;
	private double ghjzmd;
	private String bz;
	private String rdyj;
	private String dlmc1;
	private String dldm1;
	private double dlmj1;
	private String dlmc2;
	private String dldm2;
	private double dlmj2;
	private double jdzmj;
	private String gxlb;
	private String gxdm;
	private double gxydmj;
	private double gxzsbl;
	private double gxsr;
	private double gxss;
	private double jzmj;
	private double jzjdmj;
	private double gdzctzze;
	private double esssze;
	private double qyzsr;
	private double qyssze;
	private int shzt;
	private String tbnf;

	public DevZdInfo() {
	}

	public DevZdInfo(int mbbsm, double dlmj, double ghjzmj, double ghjdmj,
			double ghrjl, double ghjzmd, double dlmj1, double dlmj2,
			double jdzmj, double gxydmj, double gxzsbl, double gxsr,
			double gxss, double jzmj, double jzjdmj, double gdzctzze,
			double esssze, double qyzsr, double qyssze, int shzt) {
		this.mbbsm = mbbsm;
		this.dlmj = dlmj;
		this.ghjzmj = ghjzmj;
		this.ghjdmj = ghjdmj;
		this.ghrjl = ghrjl;
		this.ghjzmd = ghjzmd;
		this.dlmj1 = dlmj1;
		this.dlmj2 = dlmj2;
		this.jdzmj = jdzmj;
		this.gxydmj = gxydmj;
		this.gxzsbl = gxzsbl;
		this.gxsr = gxsr;
		this.gxss = gxss;
		this.jzmj = jzmj;
		this.jzjdmj = jzjdmj;
		this.gdzctzze = gdzctzze;
		this.esssze = esssze;
		this.qyzsr = qyzsr;
		this.qyssze = qyssze;
		this.shzt = shzt;
	}

	public DevZdInfo(int mbbsm, String ysdm, String kfqdm, String kfqmc,
			String kfqpjfw, String kfqpjlx, String tbbh, String dlmc,
			String dldm, double dlmj, String tdxzqk, String qs, String gysj,
			String gylx, String gydm, String tdzpg, String synx, String tdsyz,
			String pzyt, String pzdm, String ghyt, String ghdm, double ghjzmj,
			double ghjdmj, double ghrjl, double ghjzmd, String bz, String rdyj,
			String dlmc1, String dldm1, double dlmj1, String dlmc2,
			String dldm2, double dlmj2, double jdzmj, String gxlb, String gxdm,
			double gxydmj, double gxzsbl, double gxsr, double gxss,
			double jzmj, double jzjdmj, double gdzctzze, double esssze,
			double qyzsr, double qyssze, int shzt, String tbnf) {
		this.mbbsm = mbbsm;
		this.ysdm = ysdm;
		this.kfqdm = kfqdm;
		this.kfqmc = kfqmc;
		this.kfqpjfw = kfqpjfw;
		this.kfqpjlx = kfqpjlx;
		this.tbbh = tbbh;
		this.dlmc = dlmc;
		this.dldm = dldm;
		this.dlmj = dlmj;
		this.tdxzqk = tdxzqk;
		this.qs = qs;
		this.gysj = gysj;
		this.gylx = gylx;
		this.gydm = gydm;
		this.tdzpg = tdzpg;
		this.synx = synx;
		this.tdsyz = tdsyz;
		this.pzyt = pzyt;
		this.pzdm = pzdm;
		this.ghyt = ghyt;
		this.ghdm = ghdm;
		this.ghjzmj = ghjzmj;
		this.ghjdmj = ghjdmj;
		this.ghrjl = ghrjl;
		this.ghjzmd = ghjzmd;
		this.bz = bz;
		this.rdyj = rdyj;
		this.dlmc1 = dlmc1;
		this.dldm1 = dldm1;
		this.dlmj1 = dlmj1;
		this.dlmc2 = dlmc2;
		this.dldm2 = dldm2;
		this.dlmj2 = dlmj2;
		this.jdzmj = jdzmj;
		this.gxlb = gxlb;
		this.gxdm = gxdm;
		this.gxydmj = gxydmj;
		this.gxzsbl = gxzsbl;
		this.gxsr = gxsr;
		this.gxss = gxss;
		this.jzmj = jzmj;
		this.jzjdmj = jzjdmj;
		this.gdzctzze = gdzctzze;
		this.esssze = esssze;
		this.qyzsr = qyzsr;
		this.qyssze = qyssze;
		this.shzt = shzt;
		this.tbnf = tbnf;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getMbbsm() {
		return this.mbbsm;
	}

	public void setMbbsm(int mbbsm) {
		this.mbbsm = mbbsm;
	}

	public String getYsdm() {
		return this.ysdm;
	}

	public void setYsdm(String ysdm) {
		this.ysdm = ysdm;
	}

	public String getKfqdm() {
		return this.kfqdm;
	}

	public void setKfqdm(String kfqdm) {
		this.kfqdm = kfqdm;
	}

	public String getKfqmc() {
		return this.kfqmc;
	}

	public void setKfqmc(String kfqmc) {
		this.kfqmc = kfqmc;
	}

	public String getKfqpjfw() {
		return this.kfqpjfw;
	}

	public void setKfqpjfw(String kfqpjfw) {
		this.kfqpjfw = kfqpjfw;
	}

	public String getKfqpjlx() {
		return this.kfqpjlx;
	}

	public void setKfqpjlx(String kfqpjlx) {
		this.kfqpjlx = kfqpjlx;
	}

	public String getTbbh() {
		return this.tbbh;
	}

	public void setTbbh(String tbbh) {
		this.tbbh = tbbh;
	}

	public String getDlmc() {
		return this.dlmc;
	}

	public void setDlmc(String dlmc) {
		this.dlmc = dlmc;
	}

	public String getDldm() {
		return this.dldm;
	}

	public void setDldm(String dldm) {
		this.dldm = dldm;
	}

	public double getDlmj() {
		return this.dlmj;
	}

	public void setDlmj(double dlmj) {
		this.dlmj = dlmj;
	}

	public String getTdxzqk() {
		return this.tdxzqk;
	}

	public void setTdxzqk(String tdxzqk) {
		this.tdxzqk = tdxzqk;
	}

	public String getQs() {
		return this.qs;
	}

	public void setQs(String qs) {
		this.qs = qs;
	}

	public String getGysj() {
		return this.gysj;
	}

	public void setGysj(String gysj) {
		this.gysj = gysj;
	}

	public String getGylx() {
		return this.gylx;
	}

	public void setGylx(String gylx) {
		this.gylx = gylx;
	}

	public String getGydm() {
		return this.gydm;
	}

	public void setGydm(String gydm) {
		this.gydm = gydm;
	}

	public String getTdzpg() {
		return this.tdzpg;
	}

	public void setTdzpg(String tdzpg) {
		this.tdzpg = tdzpg;
	}

	public String getSynx() {
		return this.synx;
	}

	public void setSynx(String synx) {
		this.synx = synx;
	}

	public String getTdsyz() {
		return this.tdsyz;
	}

	public void setTdsyz(String tdsyz) {
		this.tdsyz = tdsyz;
	}

	public String getPzyt() {
		return this.pzyt;
	}

	public void setPzyt(String pzyt) {
		this.pzyt = pzyt;
	}

	public String getPzdm() {
		return this.pzdm;
	}

	public void setPzdm(String pzdm) {
		this.pzdm = pzdm;
	}

	public String getGhyt() {
		return this.ghyt;
	}

	public void setGhyt(String ghyt) {
		this.ghyt = ghyt;
	}

	public String getGhdm() {
		return this.ghdm;
	}

	public void setGhdm(String ghdm) {
		this.ghdm = ghdm;
	}

	public double getGhjzmj() {
		return this.ghjzmj;
	}

	public void setGhjzmj(double ghjzmj) {
		this.ghjzmj = ghjzmj;
	}

	public double getGhjdmj() {
		return this.ghjdmj;
	}

	public void setGhjdmj(double ghjdmj) {
		this.ghjdmj = ghjdmj;
	}

	public double getGhrjl() {
		return this.ghrjl;
	}

	public void setGhrjl(double ghrjl) {
		this.ghrjl = ghrjl;
	}

	public double getGhjzmd() {
		return this.ghjzmd;
	}

	public void setGhjzmd(double ghjzmd) {
		this.ghjzmd = ghjzmd;
	}

	public String getBz() {
		return this.bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getRdyj() {
		return this.rdyj;
	}

	public void setRdyj(String rdyj) {
		this.rdyj = rdyj;
	}

	public String getDlmc1() {
		return this.dlmc1;
	}

	public void setDlmc1(String dlmc1) {
		this.dlmc1 = dlmc1;
	}

	public String getDldm1() {
		return this.dldm1;
	}

	public void setDldm1(String dldm1) {
		this.dldm1 = dldm1;
	}

	public double getDlmj1() {
		return this.dlmj1;
	}

	public void setDlmj1(double dlmj1) {
		this.dlmj1 = dlmj1;
	}

	public String getDlmc2() {
		return this.dlmc2;
	}

	public void setDlmc2(String dlmc2) {
		this.dlmc2 = dlmc2;
	}

	public String getDldm2() {
		return this.dldm2;
	}

	public void setDldm2(String dldm2) {
		this.dldm2 = dldm2;
	}

	public double getDlmj2() {
		return this.dlmj2;
	}

	public void setDlmj2(double dlmj2) {
		this.dlmj2 = dlmj2;
	}

	public double getJdzmj() {
		return this.jdzmj;
	}

	public void setJdzmj(double jdzmj) {
		this.jdzmj = jdzmj;
	}

	public String getGxlb() {
		return this.gxlb;
	}

	public void setGxlb(String gxlb) {
		this.gxlb = gxlb;
	}

	public String getGxdm() {
		return this.gxdm;
	}

	public void setGxdm(String gxdm) {
		this.gxdm = gxdm;
	}

	public double getGxydmj() {
		return this.gxydmj;
	}

	public void setGxydmj(double gxydmj) {
		this.gxydmj = gxydmj;
	}

	public double getGxzsbl() {
		return this.gxzsbl;
	}

	public void setGxzsbl(double gxzsbl) {
		this.gxzsbl = gxzsbl;
	}

	public double getGxsr() {
		return this.gxsr;
	}

	public void setGxsr(double gxsr) {
		this.gxsr = gxsr;
	}

	public double getGxss() {
		return this.gxss;
	}

	public void setGxss(double gxss) {
		this.gxss = gxss;
	}

	public double getJzmj() {
		return this.jzmj;
	}

	public void setJzmj(double jzmj) {
		this.jzmj = jzmj;
	}

	public double getJzjdmj() {
		return this.jzjdmj;
	}

	public void setJzjdmj(double jzjdmj) {
		this.jzjdmj = jzjdmj;
	}

	public double getGdzctzze() {
		return this.gdzctzze;
	}

	public void setGdzctzze(double gdzctzze) {
		this.gdzctzze = gdzctzze;
	}

	public double getEsssze() {
		return this.esssze;
	}

	public void setEsssze(double esssze) {
		this.esssze = esssze;
	}

	public double getQyzsr() {
		return this.qyzsr;
	}

	public void setQyzsr(double qyzsr) {
		this.qyzsr = qyzsr;
	}

	public double getQyssze() {
		return this.qyssze;
	}

	public void setQyssze(double qyssze) {
		this.qyssze = qyssze;
	}

	public int getShzt() {
		return this.shzt;
	}

	public void setShzt(int shzt) {
		this.shzt = shzt;
	}

	public String getTbnf() {
		return this.tbnf;
	}

	public void setTbnf(String tbnf) {
		this.tbnf = tbnf;
	}

}
