package cn.mutu.land.common;

import java.util.Map;

public class MyPolygon {

	private MyRing[] ring;
	private  Map<String,Object>fieldValues;
	
	public MyPolygon(){
		
	}
	
	public MyPolygon(MyRing[] ring,Map<String,Object>fieldValues){
		this.ring=ring;
		this.fieldValues=fieldValues;
	}	
	
	public void findHoles(){
		if(ring==null||ring.length==0)return;
		for(int i=0;i<ring.length;i++){
			MyRing r=ring[i];
			MyPoint[]p=r.getMyPoints();
		}
	}
	
	public Map<String,Object> getFieldValues() {
		return fieldValues;
	}
	public void setFieldValues(Map<String,Object> fieldValues) {
		this.fieldValues = fieldValues;
	}
	public MyRing[] getRing() {
		return ring;
	}
	public void setRing(MyRing[] ring) {
		this.ring = ring;
	}
	
	
}
