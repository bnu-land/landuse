package cn.mutu.land.service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.mutu.land.model.SystemMap;

@Service
public class SystemManageMapService {
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// ------------地图url管理----------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> getSystemManagerMapList(String searchKeyword) {
		System.out.println("-----get map url list--------");
		String hql = "FROM SystemMap as sm";
		// WHERE sm.name LIKE '%b%' OR sm.key LIKE '%b%' OR sm.url LIKE '%b%' OR
		// sm.description LIKE '%b%'

		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			String hql2 = " WHERE sm.name" + likeStr + "OR sm.key" + likeStr
					+ "OR sm.url" + likeStr + "OR sm.description" + likeStr;
			hql = hql + hql2;
		}
		System.out.println(hql);
		List<SystemMap> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<SystemMap>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	public void addMap(SystemMap sysMap) {
		Session session = sessionFactory.getCurrentSession();
		try {
			System.out.println("add map...");
			System.out.println("name:" + sysMap.getName());
			// System.out.println("id:"+sysMap.getMapId());
			session.save(sysMap);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 编辑更新角色权限信息
	public void updateMap(SystemMap sysMap) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(sysMap);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 删除角色权限信息
	public void deleteMap(String id) {
		// System.out.println("roleId:" + roleId);
		SystemMap result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (SystemMap) session.get(SystemMap.class,
					Integer.parseInt(id));
			session.delete(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// -------------------取得地图要素图层----------------------
	// 土地利用图层
	public Map<String, Object> getFeatureLayerURLList(String[] LayerGroups) {
		String hql = "FROM SystemMap as sm";
		String hql2 = "";
		if (LayerGroups.length > 0) {
			hql2 = " WHERE sm.group like '%"+LayerGroups[0]+"%'";
		}
		if(LayerGroups.length >1){
			for (int i =1;i<LayerGroups.length;i++) {
				hql2+= " AND sm.group like '%"+LayerGroups[i]+"%'";
			}
			hql2+= " ORDER BY sm.key";
		}
		hql += hql2;
			

		List<SystemMap> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<SystemMap>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	// 企业用地图层
	public Map<String, Object> getLanduseLayerURLList() {
		String hql = "FROM SystemMap as sm WHERE sm.group like '%QYYD%' ORDER BY sm.key";

		List<SystemMap> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<SystemMap>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

}
