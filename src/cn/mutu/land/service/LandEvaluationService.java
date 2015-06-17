package cn.mutu.land.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
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

import cn.mutu.land.model.LandKfqType;
import cn.mutu.land.model.LanduseIndexMeta;
import cn.mutu.land.model.LanduseIndexWeight;

@Service
public class LandEvaluationService {
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// ------------指标现状值计算----------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> getLandKfqTypeList(String searchKeyword) {
		String hql = "FROM LandKfqType as t";
		String hql2 = "";
		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			hql2 = " WHERE t.calcName" + likeStr;			
		}
		hql2 = " ORDER BY t.calcDate DESC";
		hql = hql + hql2;
		List<LandKfqType> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<LandKfqType>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	public void addLandKfqType(LandKfqType type) {
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

	// 编辑更新角色权限信息
	public void updateLandKfqType(LandKfqType type) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(type);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 删除角色权限信息
	public void deleteLandKfqType(String[] ids) {
		// System.out.println("roleId:" + roleId);
		LandKfqType result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			for (String id : ids) {
				result = (LandKfqType) session.get(LandKfqType.class,
						Integer.parseInt(id));
				session.delete(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// ------------指标权重表----------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> getIndexWeightList(String searchKeyword,
			String markType) {
		String hql = "FROM LanduseIndexWeight as t";
		String hql2 = "";
		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			hql2 = " WHERE t.projectId" + likeStr;
		}
		if (!markType.equals("")) {
			if (hql2.equals("")) {
				hql2 = " WHERE ";
			} else {
				hql2 += " AND";
			}
			hql2 += " t.markType LIKE '%" + markType + "%'";
		}
		hql2 += " ORDER BY t.projectId desc,t.id desc";
		hql = hql + hql2;
		List<LanduseIndexWeight> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<LanduseIndexWeight>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	/**
	 * @param type
	 */
	public void addIndexWeight(LanduseIndexWeight type) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Calendar ca = Calendar.getInstance();
			Date now = ca.getTime();
			String projectId = type.getProjectId();
			if(projectId.equals("")){
				DateFormat df = new SimpleDateFormat("yyyyMMddHHmm");
				projectId = df.format(now);
				type.setProjectId(projectId);				
			}			
			session.saveOrUpdate(type);
		} catch (SQLGrammarException s) {
			System.out.println(s);
		}
	}

	// 编辑更新
	public void updateIndexWeight(LanduseIndexWeight type) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(type);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 删除
	public void deleteIndexWeight(String[] ids) {
		// System.out.println("roleId:" + roleId);
		LanduseIndexWeight result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			for (String id : ids) {
				result = (LanduseIndexWeight) session.get(
						LanduseIndexWeight.class, Integer.parseInt(id));
				session.delete(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// ------------指标权重表字段等级元数据----------------------------
		@SuppressWarnings("unchecked")
		public Map<String, Object> getIndexMetaList(String searchKeyword) {
			String hql = "FROM LanduseIndexMeta as t";
			String hql2 = "";
			if (!searchKeyword.equals("")) {
				String likeStr = " LIKE '%" + searchKeyword + "%' ";
				hql2 = " WHERE t.levelCode" + likeStr;
			}
			hql = hql + hql2;
			System.out.println(hql);
			List<LanduseIndexMeta> results = null;
			org.hibernate.Query query = sessionFactory.getCurrentSession()
					.createQuery(hql);
			results = (List<LanduseIndexMeta>) query.list();
			Map<String, Object> myMapResult = new TreeMap<String, Object>();
			myMapResult.put("root", results);
			myMapResult.put("success", true);
			return myMapResult;
		}

}
