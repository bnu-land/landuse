package cn.mutu.land.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.EntDxqyydPda;
import cn.mutu.land.model.EntExpirealert;
import cn.mutu.land.model.EntQyjyd;

@Service
public class EnterpriseDynamicMonitorService {
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

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

	@SuppressWarnings("unchecked")
	public Map<String, Object> getEntLandIntensity(String keyword,String code) {
		String hql = "FROM EntQyjyd as ent";
		if(keyword!= null && !keyword.equals("")){
			
		}else{
			
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

}
