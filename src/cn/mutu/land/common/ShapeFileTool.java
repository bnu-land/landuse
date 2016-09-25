package cn.mutu.land.common;

import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.soft2com.map.geom.*;
import com.soft2com.util.*;
import com.soft2com.util.shape.DBFReader;
import com.soft2com.util.shape.ShapeReader;
import com.soft2com.util.shape.ShapefileHeader;
import com.soft2com.vjavalib.vutil.VArrayList;
import com.soft2com.vjavalib.vutil.VList;

public class ShapeFileTool {

		public static  Map<String ,Object> readPoints(){
            Map<String ,Object> result=new HashMap<String, Object>();
            try{
//	        String filePath = "F:/map_web/webmapdata/data/a_region/a_region.shp";
	        String filePath = "C:/Users/DELL/Desktop/Data/shape/JBXXM.shp";
	    	//String filePath = "C:/Users/DELL/Desktop/Data/pro_china_line.shp";
	        java.io.FileInputStream fis = new java.io.FileInputStream( filePath );
	        java.io.DataInputStream dis = new java.io.DataInputStream( fis );
	        
	        ShapefileHeader header =ShapeReader.readerHeader( dis );
	        //java.io.BufferedWriter fw = new java.io.BufferedWriter(new FileWriter("f:\\cors.txt") );

	        VList list = ShapeReader.readRecord( dis );
        	
	        List<Object>l3=new ArrayList<Object>();
	        for( int i = 0; i< list.size(); i++ )        	
	        {
	        	Map<String,Object>  map=new TreeMap<String, Object>();
	        	List<Object>l2=new ArrayList<Object>();
	        	List<MyPoint[]>l=new ArrayList<MyPoint[]>();
	        	CPoint[] pts =null;
	        	if(list.get(i) instanceof CPolyLine){
	        		System.out.println("CPolyLine");
	        		CPolyLine p = (CPolyLine)list.get( i );
	        		pts = p.getPts();
	        	} else if(list.get(i) instanceof CPolygon){ 	        		
	        		CPolygon p = (CPolygon)list.get( i );
	        		System.out.println("CPolygon:"+p.toString());
	        		pts = p.getPts();
	        	}else if(list.get(i) instanceof CPoint){
	        		System.out.println("CPoint");
	        		CPoint p = (CPoint)list.get( i );
	        		pts = new CPoint [1];
	        		pts[0]=p;
	        	}
	        	System.out.println(pts.length);
	        	CPoint startP=null;
	        	int startIndex=0;
	            for( int j = 0; j < pts.length; j++ ){
	            	if(j==0){
	            		startP=pts[0];   
	            		continue;
	            	}
	            	if(pts[j].getX()==startP.getX()&&pts[j].getY()==startP.getY()){
	            		MyPoint[] t=new MyPoint[j-startIndex];
	            		int index=0;
	            		for(int n=startIndex;n<j;n++){
	            			t[index]=new MyPoint(pts[n].getX(),pts[n].getY());
	            			index++;
	            		}
	            		l.add(t);
	            		if(j==pts.length-1)break;
	            		startIndex=j+1;
	            		startP=pts[++j];
	            		System.out.println( "merge:"+j);
	            	}            	
	            }
	           
	            for(int j=0;j<l.size();j++){
	            	MyPoint[] t=l.get(j);
	            	MyRing r=new MyRing(t,j);
	            	l2.add(r);	            	
	            	for(int n=0;n<t.length;n++){
	            		MyPoint p=t[n];
	            		System.out.println("polygon"+j+":::"+ p.x + "," + p.y + "\r\n");
	            	}
	            }
	            l3.add(l2);
	        }
            result.put("data", l3);
            result.put("success", true);
	        }catch(Exception e){
	        	e.printStackTrace();
	        	result.put("success", false);
	        }
	        return result;
		}

		
	    public static Map<String,Object> getShapeRings(VList list,
	    		List<Map<String,Object>> dbfRecords,ShapefileHeader header){
	       Map<String ,Object> result=new HashMap<String, Object>();
	       List<Object>l3=new ArrayList<Object>();
	       try{
	        for( int i = 0; i< list.size(); i++ ){
	        	List<MyPoint[]>l=new ArrayList<MyPoint[]>();
	        	CPoint[] pts =null;
	        	if(list.get(i) instanceof CPolyLine){
	        		System.out.println("CPolyLine");
	        		CPolyLine p = (CPolyLine)list.get( i );
	        		pts = p.getPts();
	        	} else if(list.get(i) instanceof CPolygon){ 	        		
	        		CPolygon p = (CPolygon)list.get( i );
	        		System.out.println("CPolygon:"+p.toString());
	        		pts = p.getPts();
	        	}else if(list.get(i) instanceof CPoint){
	        		System.out.println("CPoint");
	        		CPoint p = (CPoint)list.get( i );
	        		pts = new CPoint [1];
	        		pts[0]=p;
	        	}
	        	System.out.println(pts.length);
	        	//区分出同一条记录中不同的面
	        	CPoint startP=null;
	        	int startIndex=0;
	            for( int j = 0; j < pts.length; j++ ){
	            	if(j==0){
	            		startP=pts[0];   
	            		continue;
	            	}
	            	if(pts[j].getX()==startP.getX()&&pts[j].getY()==startP.getY()){
	            		MyPoint[] t=new MyPoint[j-startIndex];
	            		int index=0;
	            		for(int n=startIndex;n<j;n++){
	            			t[index]=new MyPoint(pts[n].getX(),pts[n].getY());
	            			index++;
	            		}
	            		l.add(t);
	            		if(j==pts.length-1)break;
	            		startIndex=j+1;
	            		startP=pts[++j];
	            		System.out.println( "merge:"+j);
	            	}            	
	            }
	            
	            MyRing[]rings=new MyRing[l.size()];
	            //区分同一记录中的面是否有包含关系，包含则是洞
	            for(int j=0;j<l.size();j++){
	            	MyPoint[] t=l.get(j);
	            	rings[j]=new MyRing(t,j);            	
	            	//打印点坐标
	            	for(int n=0;n<t.length;n++){
	            		MyPoint p=t[n];
	            		System.out.println("polygon"+j+":::"+ p.getX() + "," + p.getY() + "\r\n");
	            	}
	            }
	            MyPolygon myPolygon=new MyPolygon(rings,dbfRecords.get(i));
	            l3.add(myPolygon);
	        }
	        result.put("data", l3);
	        result.put("header", header);
	        result.put("success", true);
	        }catch(Exception e){
	        	e.printStackTrace();
	        	result.put("success", false);
	        }   
	       return result;
	    }

	    public static Map<String,Object> getShapeValues( String pathName, String datasetName )throws Exception{
	        String shx = new StringBuffer( pathName ).append( "\\" ).append( datasetName ).append(
	                ".shx" ).toString();
	        String shp = new StringBuffer( pathName ).append( "\\" ).append( datasetName ).append(
	                ".shp" ).toString();
	        String dbf = new StringBuffer( pathName ).append( "\\" ).append( datasetName ).append(
	                ".dbf" ).toString();
	        String prj = new StringBuffer( pathName ).append( "\\" ).append( datasetName ).append(
	                ".prj" ).toString();
	        
	        FileInputStream shpfis = new java.io.FileInputStream(shp);
	        java.io.DataInputStream shpdis = new java.io.DataInputStream(shpfis);
	        

	        java.io.FileInputStream shxfis = new java.io.FileInputStream(shx );
	        java.io.DataInputStream shxdis = new java.io.DataInputStream(
	                shxfis );
	        
	        //header
	        ShapefileHeader header= ShapeReader.readerHeader( shpdis );
	        VList shpRecords= ShapeReader.readRecord( shpdis );
	        //投影信息
	        FileInputStream prjfis = new java.io.FileInputStream(prj);
	        java.io.DataInputStream prjdis = new java.io.DataInputStream(prjfis);
	        header.setPro(ShapeReader.readerProjection(prjdis));
	        
	        
	        DBFReader dbfReader = new DBFReader(dbf );	 
            //取得字段数组
            int fieldCount = dbfReader.getFieldCount();
            VList fieldList = new VArrayList();
            for( int i = 0; i < fieldCount;i++ ){
                fieldList.add(dbfReader.getField( i ).getName());
            }
            //获取属性值
            Object[] object = null;
            VList dbfRecords = new VArrayList();
            while ( dbfReader.hasNextRecord() ){
                object = dbfReader.nextRecord();
                dbfRecords.add( object );
            }
            
            List<Map<String,Object>>recordList=new ArrayList<Map<String,Object>>();
            for(int i=0;i<dbfRecords.size();i++){
            	Map<String,Object>map=new TreeMap<String, Object>();
            	Object[]o=(Object[])dbfRecords.get(i);
            	String s="";
            	for(int j=0;j<o.length;j++){
            		s+="/"+fieldList.get(j)+":"+o[j].toString();
            		map.put(fieldList.get(j).toString(), o[j]);
            	}
            	recordList.add(map);
            	System.out.println(s);
            }
            
            return getShapeRings(shpRecords,recordList,header);
	    }

}

