package cn.mutu.land.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.BusinessMap;
import cn.mutu.land.model.DevZdInfo;
import cn.mutu.land.model.EntDxqyydPda;
import cn.mutu.land.model.EntExpirealert;
import cn.mutu.land.model.EntQyjyd;

@Service
public class EnterpriseDynamicMonitorService {
	@Autowired
	private SessionFactory sessionFactory;

	// --------------------企业用地性质变更监控--------------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> getEntLanduseChangeList(String searchKeyword) {
		String hql = "FROM EntDxqyydPda as ent";
		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			String hql2 = " WHERE ent.lawType" + likeStr + "OR ent.lawTitle"
					+ likeStr + "OR ent.description" + likeStr
					+ "OR ent.lawContent" + likeStr + "OR ent.lawEditor"
					+ likeStr;
			hql += hql2;
		}
		System.out.print("sql:" + hql);
		List<EntDxqyydPda> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<EntDxqyydPda>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	// --------------------企业集约度监控--------------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> getEntLandIntensity(String keyword,
			String intensitcode) {
		String hql = "FROM EntQyjyd as ent";
		if (keyword != null && !keyword.equals("")) {
			hql = "FROM EntQyjyd as e WHERE e.kfqmc like '%" + keyword
					+ "%' OR e.qymc LIKE '%" + keyword + "%' OR e.hylb LIKE '%"
					+ keyword + "%'";
		} else if (intensitcode != null && !intensitcode.equals("")) {
			String rjlFrom = "0";
			String rjlTo = "1000";
			if (intensitcode.equals("1")) { // 低容积率
				rjlFrom = "0";
				rjlTo = "1";
			} else if (intensitcode.equals("2")) { // 中等容积率
				rjlFrom = "1";
				rjlTo = "2.5";
			} else if (intensitcode.equals("3")) {
				rjlFrom = "2.5";
				rjlTo = "1000";
			}
			hql = "FROM EntQyjyd as e WHERE e.rjl >= " + rjlFrom
					+ " AND e.rjl <" + rjlTo;
		}
		System.out.print("sql:" + hql);
		List<EntQyjyd> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<EntQyjyd>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	// --------------------企业到期预警--------------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> getEntExpireAlert(String keyword,
			Integer inMonths) {

		String hql = "FROM EntExpirealert as e";
		if (keyword != null && !keyword.equals("")) {
			hql = "FROM EntExpirealert as e" + " WHERE e.kfqmc LIKE '%"
					+ keyword + "%'" + " OR e.qymc  LIKE '%" + keyword + "%'"
					+ " OR e.hylb LIKE '%" + keyword + "%'";
		} else if (inMonths != null) {
			Calendar ca = Calendar.getInstance();
			Date nowDate = ca.getTime(); // 当前时间
			ca.add(ca.MONTH, inMonths);
			Date inDate = ca.getTime(); // N月以内
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			if (inMonths == 0) {
				hql = "FROM EntExpirealert as e where e.dqsj < '"
						+ sdf.format(nowDate) + "'";
			} else if (inMonths < 0) {
				hql = "FROM EntExpirealert as e where e.dqsj BETWEEN '"
						+ sdf.format(inDate) + "'  AND '" + sdf.format(nowDate)
						+ "'";
			} else if (inMonths > 0) {
				hql = "FROM EntExpirealert as e where e.dqsj BETWEEN '"
						+ sdf.format(nowDate) + "'  AND '" + sdf.format(inDate)
						+ "'";
			}
		}

		System.out.print("sql:" + hql);
		List<EntExpirealert> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<EntExpirealert>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	// --------------------企业信息审核--------------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> setEntUploadCheckPass(String[] ids, int isPass) {
		DevZdInfo result = null;
		Map<String, Object> map = new HashMap<>();
		Session session = sessionFactory.getCurrentSession();
		try {
	       System.out.println("审核状态："+isPass);
			for (String id : ids) {
				result = (DevZdInfo) session.get(DevZdInfo.class,
						Integer.parseInt(id));
				result.setIsPass(isPass);
				session.saveOrUpdate(result);
				map.put("success", true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;
	}

	// --------------------企业信息审核结果--------------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> setEntUploadCheckResult(String[] ids, String checkResult) {
		BusinessMap result = null;
		Map<String, Object> map = new HashMap<>();
		Session session = sessionFactory.getCurrentSession();
		try {
			for (String id : ids) {
				result = (BusinessMap) session.get(BusinessMap.class,
						Integer.parseInt(id));
				result.setCheckResult(checkResult);
				session.saveOrUpdate(result);
				map.put("success", true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
		}
		return map;
	}

}
