package cn.mutu.land.model;

// Generated 2016-9-3 14:07:21 by Hibernate Tools 4.0.0

/**
 * BusInfo generated by hbm2java
 */
public class BusInfo implements java.io.Serializable {

	private Integer busId;
	private String busName;
	private String busAddress;
	private int busWorker;

	public BusInfo() {
	}

	public BusInfo(int busWorker) {
		this.busWorker = busWorker;
	}

	public BusInfo(String busName, String busAddress, int busWorker) {
		this.busName = busName;
		this.busAddress = busAddress;
		this.busWorker = busWorker;
	}

	public Integer getBusId() {
		return this.busId;
	}

	public void setBusId(Integer busId) {
		this.busId = busId;
	}

	public String getBusName() {
		return this.busName;
	}

	public void setBusName(String busName) {
		this.busName = busName;
	}

	public String getBusAddress() {
		return this.busAddress;
	}

	public void setBusAddress(String busAddress) {
		this.busAddress = busAddress;
	}

	public int getBusWorker() {
		return this.busWorker;
	}

	public void setBusWorker(int busWorker) {
		this.busWorker = busWorker;
	}

}
