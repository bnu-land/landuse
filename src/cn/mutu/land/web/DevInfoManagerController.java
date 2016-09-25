package cn.mutu.land.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.mutu.land.common.Encoder;
import cn.mutu.land.model.DevInfo;
import cn.mutu.land.model.StaKfq;
import cn.mutu.land.service.DevInfoManagerService;

@Controller
public class DevInfoManagerController {

	private DevInfoManagerService infoService;

	@Autowired
	public DevInfoManagerController(DevInfoManagerService infoService) {
		this.infoService = infoService;
	}

	// --------------------获取任务列表-------------------------
	// 查询
	@RequestMapping(value = "/get_kfqinfo")
   /* @ResponseBody
	public Map<String, Object> getDevInfoList(
			@RequestParam("searchKeyword") String searchKeyword)	
			throws SQLException {
		searchKeyword = Encoder.encode(searchKeyword);
		return this.infoService.getKfqInfoList(searchKeyword);
		//
	}*/
	@ResponseBody
	public Map<String, Object> getInfoList(
	        //@RequestParam("searchKeyword") String searchKeyword,
			@RequestParam("kfqmc") String kfqmc,
			@RequestParam("kfqjb") String kfqjb,
			@RequestParam("kfqpjlx") String kfqpjlx)
			//@RequestParam("kfqpjlx") String lx,
			//@RequestParam("kfqjb") String jb)
			throws SQLException {
		//searchKeyword = Encoder.encode(searchKeyword);
		kfqmc = Encoder.encode(kfqmc);
		kfqjb = Encoder.encode(kfqjb);
		kfqpjlx = Encoder.encode(kfqpjlx);
		System.out.println("kfqmc = " + kfqmc);
		System.out.println("kfqjb = " + kfqjb);	
		System.out.println("kfqpjlx = " + kfqpjlx);
		return this.infoService.getKfqInfoSelect(kfqmc,kfqjb,kfqpjlx);
		//
	}

	//delet
	// 删除
			@RequestMapping(value = "/del_kfqInfo")
				@ResponseBody
				public void delZdById(@RequestParam("id") String kfqId) throws IOException {
				System.out.print(kfqId);	
				this.infoService.deleteinfo(kfqId);
			
			}
			@RequestMapping(value="/add_kfqInfoTest",method = RequestMethod.POST)
			@ResponseBody
			public Map<String,Object> addKfqInfo(@RequestBody DevInfo devInfo)
			throws IOException{
				Map<String, Object> result = new HashMap<String, Object>();
				try {
					
					this.infoService.addkfq(devInfo);
					result.put("success", true);
					result.put("msg", ",successfully saved");
				} catch (Exception er) {
					er.printStackTrace();
					result.put("failure", true);
					result.put("msg", ",failed saved");
				}
				return result;
			}
				
			
	//增加
	@RequestMapping(value="/add_kfqInfomation")//,@RequestBody DevInfo devInfo,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addDevInfo(@RequestParam("kfqmc") String kfqmc,
			//@RequestParam("id") Integer id,
			//@RequestParam("kfqdm") String kfqdm,
			//@RequestParam("kfqmc") String kfqmc;
			@RequestParam("kfqjb") String kfqjb,
	@RequestParam("kfqsplx") String kfqsplx,
	//@RequestParam("kfqmc") String kfqpjfw
	@RequestParam("slsj") String slsj,
	@RequestParam("spdw") String spdw,
	@RequestParam("gljg") String gljg,
	@RequestParam("gljgdz") String gljgdz,
	@RequestParam("zdcy") String zdcy,
	@RequestParam("sptdzmj") Double sptdzmj,
	@RequestParam("MKfqpjmj") Double MKfqpjmj,
	@RequestParam("DKfqpjmj") Double DKfqpjmj,
//	@RequestParam("kfqmc") String kfqpjlx;
	@RequestParam("MTdkfl") Double MTdkfl,
	@RequestParam("DTdkfl") Double DTdkfl,
	@RequestParam("MCzrk") Integer MCzrk,
	@RequestParam("DCzrk") Integer DCzrk,
	@RequestParam("MGdzctzze") Double MGdzctzze,
	@RequestParam("DGdzctzze") Double DGdzctzze,
	@RequestParam("MEscyssze") Double MEscyssze,
	@RequestParam("DEscyssze") Double DEscyssze,
	@RequestParam("MGyzsr") Double MGyzsr,
	@RequestParam("DGyzsr") Double DGyzsr,
	@RequestParam("MGyssze") Double MGyssze,
	@RequestParam("DGyssze") Double DGyssze,
	@RequestParam("MGxzsr") Double MGxzsr,
	@RequestParam("DGxzsr") Double DGxzsr,
	@RequestParam("MGxssze") Double MGxssze,
	@RequestParam("DGxssze") Double DGxssze
//	@RequestParam("kfqmc") String MXm;
//	@RequestParam("kfqmc") String MKqtzsj;
//	@RequestParam("kfqmc") Double MKqtzmj;
//	@RequestParam("kfqmc") Double MKqtzhmj;
//	@RequestParam("kfqmc") String bz;
	
	)
			throws IOException {		

		Map<String, Object> result = new HashMap<String, Object>();
		try {
			System.out.println("传入的设立时间参数值："+slsj);
			DevInfo devInfo=new DevInfo();
			devInfo.setKfqmc(kfqmc);
			devInfo.setKfqjb(kfqjb);
			//devInfo.setKfqdm(kfqdm);
			devInfo.setKfqsplx(kfqsplx);
			//devInfo.setKfqpjfw(kfqpjfw);
			devInfo.setSlsj(slsj);
			devInfo.setGljg(gljg);
			devInfo.setGljgdz(gljgdz);
			devInfo.setSpdw(spdw);
			devInfo.setZdcy(zdcy);
			devInfo.setSptdzmj(sptdzmj);
			devInfo.setMKfqpjmj(MKfqpjmj);
			devInfo.setDKfqpjmj(DKfqpjmj);
			devInfo.setMTdkfl(MTdkfl);
			devInfo.setDTdkfl(DTdkfl);
			devInfo.setMCzrk(MCzrk);
			devInfo.setDCzrk(DCzrk);
			devInfo.setMGdzctzze(MGdzctzze);
			devInfo.setDGdzctzze(DGdzctzze);
			devInfo.setMEscyssze(MEscyssze);
			devInfo.setDEscyssze(DEscyssze);
			devInfo.setMGyzsr(MGyzsr);
			devInfo.setDGyzsr(DGyzsr);
			devInfo.setMGyssze(MGyssze);
			devInfo.setDGyssze(DGyssze);
			devInfo.setMGxzsr(MGxzsr);
			devInfo.setDGxzsr(DGxzsr);
			devInfo.setMGxssze(MGxssze);
			devInfo.setDGxssze(DGxssze);
			System.out.println("开发区名称："+devInfo.getKfqmc());
			System.out.println("开发区级别："+devInfo.getKfqjb());
			System.out.println("开发区审批类型: " +devInfo.getKfqsplx());
			//System.out.println("开发区设立时间: "+devInfo.getSlsj());
			System.out.println("开发区审批单位："+devInfo.getSpdw());
			System.out.println("开发区管理机构："+devInfo.getGljg());
			System.out.println("开发区管理机构地址: " +devInfo.getGljgdz());
			System.out.println("开发区主导产业："+devInfo.getZdcy());
			System.out.println("开发区审批土地总面积: " +devInfo.getSptdzmj());
			System.out.println("开发区评价面积: " +devInfo.getMKfqpjmj());
			System.out.println("土地开发率: " +devInfo.getMTdkfl());
			System.out.println("常住人口: " +devInfo.getMCzrk());
			System.out.println("工业投资总额: " +devInfo.getMGdzctzze());
			System.out.println("二三产业税收总额: " +devInfo.getMEscyssze());
			System.out.println("开发区工业总收入: " +devInfo.getMGyzsr());
			System.out.println("开发区税收总额: " +devInfo.getMGyssze());
			System.out.println("开发区高新产业总收入: " +devInfo.getMGxzsr());
			System.out.println("开发区高新产业税收总额: " +devInfo.getMGxssze());
			System.out.println("开发区评价面积: " +devInfo.getDKfqpjmj());
			System.out.println("土地开发率: " +devInfo.getDTdkfl());
			System.out.println("常住人口: " +devInfo.getDCzrk());
			System.out.println("工业投资总额: " +devInfo.getDGdzctzze());
			System.out.println("二三产业税收总额: " +devInfo.getDEscyssze());
			System.out.println("开发区工业总收入: " +devInfo.getDGyzsr());
			System.out.println("开发区税收总额: " +devInfo.getDGyssze());
			System.out.println("开发区高新产业总收入: " +devInfo.getDGxzsr());
			System.out.println("开发区高新产业税收总额: " +devInfo.getDGxssze());
			this.infoService.addkfq(devInfo);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			er.printStackTrace();
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;

}
	@RequestMapping(value = "/update_kfqnfo", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateKfqInfo(@RequestBody DevInfo devInfo)
			throws IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			this.infoService.updateDevInfo(devInfo);
			result.put("success", true);
			result.put("msg", ",successfully saved");
		} catch (Exception er) {
			result.put("failure", true);
			result.put("msg", ",failed saved");
		}
		return result;
	}
	// 添加用户信息
			@RequestMapping(value = "/add_statisticInfo",method=RequestMethod.POST)
			@ResponseBody
			public Map<String, Object> addStaInfomation(@RequestBody StaKfq staKfq)
					throws IOException {
				/*System.out.println(zdinfo.getDlmc());
				System.out.println(zdinfo.getDldm());
				System.out.println(zdinfo.getDlmj());*/	
				Map<String, Object> result = new HashMap<String, Object>();
				try {
					
					
					this.infoService.statistics(staKfq);
					result.put("success", true);
					result.put("msg", ",successfully saved");
				} catch (Exception er) {
					er.printStackTrace();
					result.put("failure", true);
					result.put("msg", ",failed saved");
				}
				return result;
			}
}
