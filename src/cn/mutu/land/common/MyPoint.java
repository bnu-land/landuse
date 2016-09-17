package cn.mutu.land.common;

public class MyPoint{
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	double x;
	double y;
	
	public MyPoint(){
		
	}
	public MyPoint(double x,double y){
		this.x=x;
		this.y=y;
	}	
}
