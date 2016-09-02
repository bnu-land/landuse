package cn.mutu.land.service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.BusInfo;
import cn.mutu.land.model.BusinessInfo;
import cn.mutu.land.model.BusinessMap;
import cn.mutu.land.model.BusinessPhoto;
import cn.mutu.land.model.EntDxqyydPda;



@Service
public class DxbusInfoManagerService {
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getDxbusInfoList(String searchKeyword) {
		String hql = "FROM EntDxqyydPda as businfo";
		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			String hql2 = " WHERE businfo.id" + likeStr 
					+ "OR businfo.qymc" + likeStr;
			hql += hql2;
		}		
		List<EntDxqyydPda> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<EntDxqyydPda>) query.list();
		Map<String, Object> myInfoResult = new TreeMap<String, Object>();
		myInfoResult.put("root", results);
		myInfoResult.put("success", true);
		return myInfoResult;
	}
	
	/*public void addInfos(BusinessInfo info) {
		Session session = sessionFactory.getCurrentSession();
		try {
			//System.out.println("id:"+sysMap.getMapId());
			session.saveOrUpdate(info);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}
	
	public void addInfo(BusinessInfo info) {
		Session session = sessionFactory.getCurrentSession();
		try {
			//System.out.println("id:"+sysMap.getMapId());
			session.saveOrUpdate(info);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}
	
	public void deleteinfo(String businessId) {
		// System.out.println("roleId:" + roleId);
		BusinessInfo result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (BusinessInfo) session.get(BusinessInfo.class,
					Integer.parseInt(businessId));
			session.delete(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	
	
//	public void deleteinfos(String businessId) {
//		// System.out.println("roleId:" + roleId);
//		BusinessInfo result = null;
//		Session session = sessionFactory.getCurrentSession();
//		try {
//			result = (BusinessInfo) session.get(BusinessInfo.class,
//					Integer.parseInt(businessId));
//			session.delete(result);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
//	public void addphoto(BusinessPhoto photo) {
//		Session session = sessionFactory.getCurrentSession();
//		try {
//			//System.out.println("id:"+sysMap.getMapId());
//			session.saveOrUpdate(photo);
//		} catch (Exception er) {
//			System.out.println(er.getMessage());
//		}
//	}
//	public void deleteMap(String id) {
//		// System.out.println("roleId:" + roleId);
//		BusinessMap result = null;
//		Session session = sessionFactory.getCurrentSession();
//		try {
//			result = (BusinessMap) session.get(BusinessMap.class,
//					Integer.parseInt(id));
//			session.delete(result);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	public void addMap(BusinessMap map) {
//		// TODO Auto-generated method stub
//		Session session = sessionFactory.getCurrentSession();
//		try {
//			//System.out.println("id:"+sysMap.getMapId());
//			session.saveOrUpdate(map);
//		} catch (Exception er) {
//			System.out.println(er.getMessage());
//		}
//	}
//
///*	// 编辑更新角色权限信息
//	public void updateLaw(LawRegulation law) {
//		Session session = sessionFactory.getCurrentSession();
//		try{
//		session.saveOrUpdate(law);
//		}catch (Exception er){
//			System.out.println(er.getMessage());
//		}
//	}
//
//	// 删除角色权限信息
//	public void deleteLaw(String id) {
//		// System.out.println("roleId:" + roleId);
//		LawRegulation result = null;
//		Session session = sessionFactory.getCurrentSession();
//		try {
//			result = (LawRegulation) session.get(LawRegulation.class,
//					Integer.parseInt(id));
//			session.delete(result);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	// 获取相关栏目的前十条法律法规
//	public Map<String, Object> updateRead(String id) {
//		String hql = "UPDATE LawRegulation as law";
//		if (!id.equals("")) {
//			String setStr = " SET law.readCount=law.readCount+1";
//			String hql2 = setStr+" WHERE law.id=" + id;
//			//  +" limit 0,3"
//			hql += hql2;
//		}		
//		
//		org.hibernate.Query query = sessionFactory.getCurrentSession()
//				.createQuery(hql).setMaxResults(10);
//		query.executeUpdate();
//
//		Map<String, Object> myMapResult = new TreeMap<String, Object>();
//		
//		myMapResult.put("success", true);
//		return myMapResult;
//	}
//	//获取相关栏目的前十条法律法规
//		public Map<String, Object> get10LawRegulationList(String lawType) {
//			String hql = "FROM LawRegulation as law";
//			if (!lawType.equals("")) {
//				String likeStr = " like '%" + lawType + "%'";
//				String hql2 = " WHERE law.lawType" + likeStr;
//				//  +" limit 0,3"
//				hql += hql2;
//			}		
//			List<LawRegulation> results = null;
//			org.hibernate.Query query = sessionFactory.getCurrentSession()
//					.createQuery(hql).setMaxResults(10);
//			results = (List<LawRegulation>) query.list();
//			Map<String, Object> myMapResult = new TreeMap<String, Object>();
//			myMapResult.put("root", results);
//			myMapResult.put("success", true);
//			return myMapResult;
//		}
//
//	//--------------types---------------------------------
//	@SuppressWarnings("unchecked")
//	public Map<String, Object> getLawTypesList() {
//		String hql = "FROM LawTypes as lt ORDER BY lt.lawType";		
//		List<LawTypes> results = null;
//		org.hibernate.Query query = sessionFactory.getCurrentSession()
//				.createQuery(hql);
//		results = (List<LawTypes>) query.list();
//		Map<String, Object> myMapResult = new TreeMap<String, Object>();
//		myMapResult.put("root", results);
//		myMapResult.put("success", true);
//		return myMapResult;
//	}
//
//	public void addLawTypes(LawTypes type) {
//		Session session = sessionFactory.getCurrentSession();
//		try {
//			//System.out.println("id:"+sysMap.getMapId());
//			session.saveOrUpdate(type);
//		} catch (Exception er) {
//			System.out.println(er.getMessage());
//		}
//	}
//
//	// 编辑更新角色权限信息
//	public void updateLawTypes(LawTypes type) {
//		Session session = sessionFactory.getCurrentSession();
//		try{
//		session.saveOrUpdate(type);
//		}catch (Exception er){
//			System.out.println(er.getMessage());
//		}
//	}
//
//	// 删除角色权限信息
//	public void deleteLawTypes(String id) {
//		// System.out.println("roleId:" + roleId);
//		LawTypes result = null;
//		Session session = sessionFactory.getCurrentSession();
//		try {
//			result = (LawTypes) session.get(LawTypes.class,
//					Integer.parseInt(id));
//			session.delete(result);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}*/
}
