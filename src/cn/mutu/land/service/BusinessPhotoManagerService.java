package cn.mutu.land.service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.BusinessPhoto;



@Service
public class BusinessPhotoManagerService {
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getBusinessPhotoList(String searchKeyword) {
		String hql = "FROM BusinessPhoto as photo";
		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			String hql2 = " WHERE photo.photoTitle" + likeStr 
					+ "OR photo.uploadUser" + likeStr;
			hql += hql2;
		}		
		List<BusinessPhoto> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<BusinessPhoto>) query.list();
		Map<String, Object> myPhotoResult = new TreeMap<String, Object>();
		myPhotoResult.put("root", results);
		myPhotoResult.put("success", true);
		return myPhotoResult;
	}
	
	public void addPhotos(BusinessPhoto photo) {
		Session session = sessionFactory.getCurrentSession();
		try {
			//System.out.println("id:"+sysMap.getMapId());
			session.saveOrUpdate(photo);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}
	public void deletePhotos(String id) {
		// System.out.println("roleId:" + roleId);
		BusinessPhoto result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (BusinessPhoto) session.get(BusinessPhoto.class,
					Integer.parseInt(id));
			session.delete(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
/*
	public void addMap(BusinessMap map) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		try {
			//System.out.println("id:"+sysMap.getMapId());
			session.saveOrUpdate(map);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}*/

/*	// 编辑更新角色权限信息
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
	public Map<String, Object> updateRead(String id) {
		String hql = "UPDATE LawRegulation as law";
		if (!id.equals("")) {
			String setStr = " SET law.readCount=law.readCount+1";
			String hql2 = setStr+" WHERE law.id=" + id;
			//  +" limit 0,3"
			hql += hql2;
		}		
		
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql).setMaxResults(10);
		query.executeUpdate();

		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		
		myMapResult.put("success", true);
		return myMapResult;
	}
	//获取相关栏目的前十条法律法规
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
	}*/
}
