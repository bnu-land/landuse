package cn.mutu.land.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.SQLGrammarException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.LanduseIntensityConstruct;
import cn.mutu.land.model.LanduseIntensityExpansion;
import cn.mutu.land.model.LanduseIntensityIntension;

@Service
public class LanduseCalculationService {
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// ------------拓展潜力----------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> getExpansionList(String searchKeyword) {
		String hql = "FROM LanduseIntensityExpansion as t";
		String hql2 = "";
		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			hql2 = " WHERE t.kfqName" + likeStr + "AND t.kfqMap" + likeStr;
		}
		hql2 += " ORDER BY t.id DESC";
		hql = hql + hql2;
		List<LanduseIntensityExpansion> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<LanduseIntensityExpansion>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	public void addExpansion(LanduseIntensityExpansion type) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Calendar ca = Calendar.getInstance();
			Date now = ca.getTime();
			type.setCalcDate(now);
			session.saveOrUpdate(type);
		} catch (SQLGrammarException s) {
			System.out.println(s);
		}
	}

	// 编辑
	public void updateExpansion(LanduseIntensityExpansion type) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(type);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 删除
	public void deleteExpansion(String id) {
		// System.out.println("roleId:" + roleId);
		LanduseIntensityExpansion result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (LanduseIntensityExpansion) session.get(
					LanduseIntensityExpansion.class, Integer.parseInt(id));
			session.delete(result);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ------------结构潜力----------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> getConstructList(String searchKeyword) {
		String hql = "FROM LanduseIntensityConstruct as t";
		String hql2 = "";
		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			hql2 = " WHERE t.kfqName" + likeStr + "AND t.kfqMap" + likeStr;
		}
		hql2 += " ORDER BY t.id DESC";
		hql = hql + hql2;
		List<LanduseIntensityConstruct> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<LanduseIntensityConstruct>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	public void addConstruct(LanduseIntensityConstruct type) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Calendar ca = Calendar.getInstance();
			Date now = ca.getTime();
			type.setCalcDate(now);
			session.saveOrUpdate(type);
		} catch (SQLGrammarException s) {
			System.out.println(s);
		}
	}

	// 编辑
	public void updateConstruct(LanduseIntensityConstruct type) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(type);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 删除
	public void deleteConstruct(String id) {
		// System.out.println("roleId:" + roleId);
		LanduseIntensityConstruct result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (LanduseIntensityConstruct) session.get(
					LanduseIntensityConstruct.class, Integer.parseInt(id));
			session.delete(result);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ------------结构潜力----------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> getIntensionList(String searchKeyword) {
		String hql = "FROM LanduseIntensityIntension as t";
		String hql2 = "";
		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			hql2 = " WHERE t.kfqName" + likeStr + "AND t.kfqMap" + likeStr;
		}
		hql2 += " ORDER BY t.id DESC";
		hql = hql + hql2;
		List<LanduseIntensityIntension> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<LanduseIntensityIntension>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	public void addIntension(LanduseIntensityIntension type) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Calendar ca = Calendar.getInstance();
			Date now = ca.getTime();
			type.setCalcDate(now);
			session.saveOrUpdate(type);
		} catch (SQLGrammarException s) {
			System.out.println(s);
		}
	}

	// 编辑
	public void updateIntension(LanduseIntensityIntension type) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(type);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 删除
	public void deleteIntension(String id) {
		// System.out.println("roleId:" + roleId);
		LanduseIntensityIntension result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (LanduseIntensityIntension) session.get(
					LanduseIntensityIntension.class, Integer.parseInt(id));
			session.delete(result);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
