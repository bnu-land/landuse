package cn.mutu.land.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.exception.SQLGrammarException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.SysKfqInfo;
import cn.mutu.land.model.SystemMap;
import cn.mutu.land.model.UtilFieldnameIndex;

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
			String hql2 = " WHERE sm.mapName" + likeStr + "OR sm.mapKey"
					+ likeStr + "OR sm.mapUrl" + likeStr + "OR sm.description"
					+ likeStr;
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

	// 获取开发区类型
	@SuppressWarnings("unchecked")
	public Map<String, Object> getKfqTypeList() {
		String hql = "FROM SysKfqInfo as s WHERE s.pid = 0";

		List<SysKfqInfo> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<SysKfqInfo>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	// 由开发区pid获取开发区名称
	@SuppressWarnings("unchecked")
	public Map<String, Object> getKfqNameList(String pid) {
		if (pid.equals("")) {
			pid = "1";
		}
		String hql = "FROM SysKfqInfo AS k "
				+ "WHERE k.pid = "+pid+" AND k.isCity = 1";

		List<SysKfqInfo> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<SysKfqInfo>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}
	
	// 由开发区id获取开发区地图
		@SuppressWarnings("unchecked")
		public Map<String, Object> getKfqMapList(String kfqId) {
			if (kfqId.equals("")) {
				kfqId = "1";
			}
			String hql = "FROM SystemMap AS m WHERE m.kfqId  = "+kfqId;

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

	// 编辑
	public void updateMap(SystemMap sysMap) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(sysMap);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 删除
	public void deleteMap(String[] ids) {
		SystemMap result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			for (String id : ids) {
				result = (SystemMap) session.get(SystemMap.class,
						Integer.parseInt(id));
				session.delete(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 获取树状列表
	public Map<String, Object> getSystemManagerMapTree() {
		String sql = "SELECT (@s\\:=@s+1)AS id,f.pid,f.kfq_name,m.map_group,m.map_key,m.map_name,m.map_url,m.description"
				+ " FROM (SELECT @s\\:=0) AS ss ,sys_kfq_info f LEFT JOIN system_map m"
				+ " ON f.id = m.kfq_id AND f.enable=1" + " ORDER BY f.id";

		SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		List<Object[]> list = query.list();

		List<Map<String, Object>> userMap = new ArrayList<Map<String, Object>>();
		Map<String, Object> map1 = new TreeMap<String, Object>();
		Map<String, Object> map2 = new TreeMap<String, Object>();
		Map<String, Object> map3 = new TreeMap<String, Object>();

		for (Object[] object : list) {
			Map<String, Object> map = new TreeMap<String, Object>();

			map.put("id", ((BigInteger) object[0]).intValue());
			map.put("pid", (int) object[1]);
			map.put("kfqName", (String) object[2]);
			map.put("mapGroup", (String) object[3]);
			map.put("mapKey", (String) object[4]);
			map.put("mapName", (String) object[5]);
			map.put("mapUrl", (String) object[6]);
			map.put("description", (String) object[7]);
			userMap.add(map);
		}

		// 重新组织层级关系
		List<Map<String, Object>> jsonList = mapObjectToJSON(userMap);

		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("expanded", true);
		myMapResult.put("children", jsonList);

		// 转换为json
		// http://www.mkyong.com/java/how-do-convert-java-object-to-from-json-format-gson-api/
		// Gson gson = new Gson();
		// String jsonInString = gson.toJson(myMapResult);
		// String jsonInString = (String)JSONSerializer.toJSON(myMapResult);

		return myMapResult;
	}

	// Object to json
	public List<Map<String, Object>> mapObjectToJSON(
			List<Map<String, Object>> userMap) {
		JSONObject json = new JSONObject();
		List<Map<String, Object>> newJSON = new ArrayList<Map<String, Object>>();

		for (Map<String, Object> typeMap : userMap) {
			int pid = (int) typeMap.get("pid"); // 获取父节点的pid
			if (pid == 0) {
				int id = (int) typeMap.get("id"); // 获取父节点id
				List<Map<String, Object>> pJSON = new ArrayList<Map<String, Object>>();
				for (Map<String, Object> zoneMap : userMap) {
					int pidChild = (int) zoneMap.get("pid"); // 获取父节点
					if (pidChild == id) {
						zoneMap.put("leaf", true);
						pJSON.add(zoneMap);
					}
				}
				typeMap.put("expanded", false);
				// pMap.put("cls", "folder");
				typeMap.put("children", pJSON);
				newJSON.add(typeMap);
			}
		}
		return newJSON;
	}

	// -------------------取得地图要素图层----------------------
	// 土地利用图层
	public Map<String, Object> getFeatureLayerURLList(String[] LayerGroups) {
		String hql = "FROM SystemMap as sm";
		String hql2 = "";
		if (LayerGroups.length > 0) {
			hql2 = " WHERE sm.mapGroup like '%" + LayerGroups[0] + "%'";
		}
		if (LayerGroups.length > 1) {
			for (int i = 1; i < LayerGroups.length; i++) {
				hql2 += " AND sm.mapGroup like '%" + LayerGroups[i] + "%'";
			}
			hql2 += " ORDER BY sm.mapKey";
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

	// -------------------地图要素属性中英文对照----------------------
	// 查询
	@SuppressWarnings("unchecked")
	public Map<String, Object> getMapAttrNameIndexList(String searchKeyword) {
		String hql = "FROM UtilFieldnameIndex as tbl";

		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			String hql2 = " WHERE tbl.enName" + likeStr + "OR tbl.cnName"
					+ likeStr;
			hql = hql + hql2;
		}
		hql = hql + " ORDER BY tbl.enName";
		List<UtilFieldnameIndex> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<UtilFieldnameIndex>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	// 添加
	public void addMapAttrNameIndex(UtilFieldnameIndex nameIndex) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(nameIndex);
		} catch (SQLGrammarException s) {
			System.out.println(s);
		}
	}

	// 编辑
	public void updateMapAttrNameIndex(UtilFieldnameIndex nameIndex) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(nameIndex);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 删除
	public void deleteMapAttrNameIndex(String[] ids) {
		UtilFieldnameIndex result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			for (String id : ids) {
				result = (UtilFieldnameIndex) session.get(
						UtilFieldnameIndex.class, Integer.parseInt(id));
				session.delete(result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
