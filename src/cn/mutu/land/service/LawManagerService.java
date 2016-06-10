package cn.mutu.land.service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.LawRegulation;
import cn.mutu.land.model.LawTypes;

@Service
public class LawManagerService {
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getLawRegulationList(String searchKeyword) {
		String hql = "FROM LawRegulation as law";
		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			String hql2 = " WHERE law.lawType" + likeStr 
					+ "OR law.lawTitle" + likeStr
					+ "OR law.description" + likeStr
					+ "OR law.lawContent" + likeStr
					+ "OR law.lawEditor" + likeStr;
			hql += hql2;
		}		
		List<LawRegulation> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<LawRegulation>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}
	
	public void addLaw(LawRegulation law) {
		Session session = sessionFactory.getCurrentSession();
		try {
			//System.out.println("id:"+sysMap.getMapId());
			session.saveOrUpdate(law);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 编辑更新角色权限信息
	public void updateLaw(LawRegulation law) {
		Session session = sessionFactory.getCurrentSession();
		try{
		session.saveOrUpdate(law);
		}catch (Exception er){
			System.out.println(er.getMessage());
		}
	}

	// 删除角色权限信息
	public void deleteLaw(String id) {
		// System.out.println("roleId:" + roleId);
		LawRegulation result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (LawRegulation) session.get(LawRegulation.class,
					Integer.parseInt(id));
			session.delete(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 获取相关栏目的前十条法律法规
	public Map<String, Object> get10LawRegulationList(String lawType) {
		String hql = "FROM LawRegulation as law";
		if (!lawType.equals("")) {
			String likeStr = " like '%" + lawType + "%'";
			String hql2 = " WHERE law.lawType" + likeStr;
			//  +" limit 0,3"
			hql += hql2;
		}		
		List<LawRegulation> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql).setMaxResults(10);
		results = (List<LawRegulation>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	//--------------types---------------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> getLawTypesList() {
		String hql = "FROM LawTypes as lt ORDER BY lt.lawType";		
		List<LawTypes> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<LawTypes>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	public void addLawTypes(LawTypes type) {
		Session session = sessionFactory.getCurrentSession();
		try {
			//System.out.println("id:"+sysMap.getMapId());
			session.saveOrUpdate(type);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 编辑更新角色权限信息
	public void updateLawTypes(LawTypes type) {
		Session session = sessionFactory.getCurrentSession();
		try{
		session.saveOrUpdate(type);
		}catch (Exception er){
			System.out.println(er.getMessage());
		}
	}

	// 删除角色权限信息
	public void deleteLawTypes(String id) {
		// System.out.println("roleId:" + roleId);
		LawTypes result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (LawTypes) session.get(LawTypes.class,
					Integer.parseInt(id));
			session.delete(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
