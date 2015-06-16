package cn.mutu.land.service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.SQLGrammarException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		String hql = "FROM SystemMap as sm";

		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			String hql2 = " WHERE sm.mapName" + likeStr + "OR sm.mapKey" + likeStr
					+ "OR sm.mapUrl" + likeStr + "OR sm.description" + likeStr;
			hql = hql + hql2;
		}
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
			session.saveOrUpdate(sysMap);
		} catch (SQLGrammarException s) {
			System.out.println(s);
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
	public void deleteMap(String[] ids) {
		SystemMap result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			for(String id : ids){
				result = (SystemMap) session.get(SystemMap.class,
						Integer.parseInt(id));
				session.delete(result);
			}			
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
			hql2 = " WHERE sm.mapGroup like '%"+LayerGroups[0]+"%'";
		}
		if(LayerGroups.length >1){
			for (int i =1;i<LayerGroups.length;i++) {
				hql2+= " AND sm.mapGroup like '%"+LayerGroups[i]+"%'";
			}
			hql2+= " ORDER BY sm.mapKey";
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
		String hql = "FROM SystemMap as sm WHERE sm.mapGroup like '%QYYD%' ORDER BY sm.mapKey";

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
