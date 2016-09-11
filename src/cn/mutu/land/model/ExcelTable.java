package cn.mutu.land.model;

import java.util.Map;
import java.util.TreeMap;

/**
 * 定义成果表的输出字段
 * @author dks
 * 2016.09.08
 */
public class ExcelTable {

//	public static final  String []F1={"KFQMC","KFQJB","KFQSPLX","SLSJ","SPDW","GLJG","GLJGDZ","ZDCY","SPTDZMJ","BZ"};
//	public static final String []F2={"M_KFQPJMJ","D_KFQPJMJ","KFQPJLX","M_TDKFL","D_TDKFL"
//	,"M_CZRK","D_CZRK","M_GDZCTZZE","D_GDZCTZZE","M_ESCYSSZE","D_ESCYSSZE","M_GYZSR"
//	,"D_GYZSR","M_GYSSZE","D_GYSSZE","M_GXZSR","D_GXZSR","M_GXSSZE"	,"D_GXSSZE"};
	public static final String F1_name="表F.1 开发区基本信息调查表（Ⅰ）.xls";
	public static final  String []F1={"kfqmc","kfqjb","kfqsplx","slsj","spdw","gljg","gljgdz",
		"zdcy","sptdzmj","bz"};
	
	public static final String F2_name= "表F.2 开发区基本信息调查表（Ⅱ）.xls";
	public static final String []F2={"MKfqpjmj","DKfqpjmj","kfqpjlx","MTdkfl","DTdkfl"
	,"MCzrk","DCzrk","MGdzctzze","DGdzctzze","MEscyssze","DEscyssze","MGyzsr"
	,"DGyzsr","MGyssze","DGyssze","MGxzsr","DGxzsr","MGxssze","DGxssze"};
	
	public static final String F3_name="表F.3 开发区用地审批及调整情况调查表.xls";
	public static final String []F3={"slsj","MKqtzsj","MKqtzmj","sptdzmj","MKqtzhmj"};
	
	public static final String F4_name="表F.4 开发区土地利用状况统计表（Ⅰ）——按建设状况划分.xls";
	public static final String []F4={"slsj","MKqtzsj","MKqtzmj","sptdzmj","MKqtzhmj"};
		
	//public static final String []F3={"SLSJ","M_KQTZSJ","M_KQTZMJ","SPTDZMJ","M_KQTZHMJ"};
	
	public static Map<String ,Object>getF1(DevInfo o){
		 Map<String ,Object> result=new TreeMap<String, Object>();
		 result.put("KFQMC",o.getKfqmc());
		 result.put("KFQMC",o.getKfqmc());
		 result.put("KFQMC",o.getKfqmc());
		 result.put("KFQMC",o.getKfqmc());
		 result.put("KFQMC",o.getKfqmc());
		 result.put("KFQMC",o.getKfqmc());
		 return result;
	}
}
