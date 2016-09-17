package cn.mutu.land.common;

import java.util.Map;

public class MyRing {

	private MyPoint[] myPoints;
	private int ringType;
	
	
	public MyRing(MyPoint[] myPoints,int ringType){
		this.ringType=ringType;
		this.myPoints=myPoints;
	}
	public MyRing(){
		
	}

	public int getRingType() {
		return ringType;
	}
	public void setRingType(int ringType) {
		this.ringType = ringType;
	}

	public MyPoint[] getMyPoints() {
		return myPoints;
	}
	public void setMyPoints(MyPoint[] myPoints) {
		this.myPoints = myPoints;
	}
}
