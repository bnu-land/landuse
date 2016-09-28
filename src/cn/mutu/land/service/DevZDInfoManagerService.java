package cn.mutu.land.service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.DevZdInfo;
import cn.mutu.land.model.ZdInfo;



@Service
public class DevZDInfoManagerService {
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getZdInfoList(String searchKeyword) {
		String hql = "FROM DevZdInfo as info";
		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			String hql2 = " WHERE info.id" + likeStr 
					+ "OR info.gysj" + likeStr
					+"OR info.dlmc" + likeStr
					+"OR info.gylx" + likeStr
					+"OR info.qs" + likeStr
					+"OR info.dldm" + likeStr;
			hql += hql2;
		}		
		List<DevZdInfo> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<DevZdInfo>) query.list();
		Map<String, Object> myInfoResult = new TreeMap<String, Object>();
		myInfoResult.put("root", results);
		myInfoResult.put("success", true);
		return myInfoResult;
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> getCheckList(int searchKeyword) {
		String hql = "FROM DevZdInfo as info";
		
			String likeStr = " LIKE " + searchKeyword ;
			String hql2 = " WHERE info.isPass" + likeStr;
			hql += hql2;
			
		List<DevZdInfo> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<DevZdInfo>) query.list();
		Map<String, Object> myInfoResult = new TreeMap<String, Object>();
		myInfoResult.put("root", results);
		myInfoResult.put("success", true);
		return myInfoResult;
	}
//	// 查询用户信息
//		@SuppressWarnings("unchecked")
//		public Map<String, Object> getZdInfoList(String searchKeyword) {
//			String hql = "FROM ZdInfo as info";
//			if (!searchKeyword.equals("")) {
//				String likeStr = " LIKE '%" + searchKeyword + "%' ";
//				String hql2 = " WHERE info.zdId" + likeStr 
//						+ "OR info.kfqmc" + likeStr
//						+"OR info.kfqdm" + likeStr;
//				hql += hql2;
//			}	
//			org.hibernate.Query query = sessionFactory.getCurrentSession()
//					.createQuery(hql);
//
//			List<Object[]> userList = query.list();
//
//			List<Map<String, Object>> userMapList = new ArrayList<Map<String, Object>>();
//			for (Object[] object : userList) {
//				Map<String, Object> map = new TreeMap<String, Object>();
//				map.put("userId", (int) object[0]);
//				map.put("userName", (String) object[1]);
//				map.put("userPwd", (String) object[2]);
//				map.put("trueName", (String) object[3]);
//				map.put("email", (String) object[4]);
//				map.put("mobileNum", (String) object[5]);
//				map.put("phoneNum", (String) object[6]);
//				map.put("deptId", (String) object[7]);
//				map.put("enabled", (Boolean) object[8]);
//				map.put("registerdate", (Date) object[9]);
//				map.put("description", (String) object[10]);
//				userMapList.add(map);
//			}
//
//			Map<String, Object> myMapResult = new TreeMap<String, Object>();
//			myMapResult.put("root", userMapList);
//			myMapResult.put("success", true);
//			return myMapResult;
//		}
	
	public void addZdInfo(DevZdInfo zdinfo) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(zdinfo);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}
	
	/*// 编辑宗地信息
		public void updateZdInfo(ZdInfo zdInfo) {
			try {
				// 使用hibernateSQL语句，执行部分修改
				String sql = "UPDATE zd_info AS zd SET zd.kfqmc = '"
						+ zdInfo.getKfqmc() + "'" + ",zd.kfqpjfw = '"
						+ zdInfo.getKfqpjfw() + "'" + ",zd.kfqpjlx = '"
						+ zdInfo.getKfqpjlx() + "'" + ",zd.tbbh = '"
						+ zdInfo.getTbbh() + "'" + ",zd.dlmc = '"
						+ zdInfo.getDlmc() + "'" + ",zd.dlmj = "
						+ zdInfo.getDlmj()  + ",zd.qs = '"
						+ zdInfo.getQs() + "'" + ",zd.gysj = '"
						+ zdInfo.getGysj() + "'" + ",zd.gylx = '"
						+ zdInfo.getGylx() + "'" + ", zd.tdzpg = '"
						+ zdInfo.getTdzpg() + "'" + ", zd.synx = '"
						+ zdInfo.getSynx() + "'" + ", zd.tdsyz = '"
						+ zdInfo.getTdsyz() + "'" + ",zd.jzmj = "
						+ zdInfo.getJzmj() + ",zd.jzjdmj = "
						+ zdInfo.getJzjdmj() + ",zd.gxlb = '"
						+ zdInfo.getGxlb() + "'" + ",zd.jdzmj = "
						+ zdInfo.getJdzmj() + ",zd.gxydmj = "
						+ zdInfo.getGxydmj() + ",zd.gxzsbl = "
						+ zdInfo.getGxzsbl() + ",zd.gxsr = "
						+ zdInfo.getGxsr() + ",zd.gxss ="
						+ zdInfo.getGxss() + ",zd.ghyt ='"
						+ zdInfo.getGhyt() + "'" + ",zd.tdxzqk ='"
						+ zdInfo.getTdxzqk() + "'" + ",zd.pzyt ='"
						+ zdInfo.getPzyt() + "'" + ",zd.rdyj ='"
						+ zdInfo.getRdyj() + "'" + ",zd.gdzctzze ="
						+ zdInfo.getGdzctzze() + ",zd.esssze ="
						+ zdInfo.getEsssze() + ",zd.qyzsr ="
						+ zdInfo.getQyzsr() + ",zd.qyssze ="
						+ zdInfo.getQyssze() + ",zd.bz ='"
						+ zdInfo.getBz() + "'";

				
				sql += " WHERE zd.id = " + zdInfo.getId();
				
				System.out.println("sql = " +sql);
				System.out.println("sql = " +zdInfo.getId());
				// session.beginTransaction();
				org.hibernate.Query query = sessionFactory.getCurrentSession()
						.createQuery(sql);
				 //org.hibernate.Query query = (Query) sessionFactory.getCurrentSession()createQuery(sql);
				SQLQuery query = sessionFactory.getCurrentSession().createSQLQuery(
					sql);
				query.executeUpdate();
				// session.getTransaction().commit();

				//sessionFactory.getCurrentSession().saveOrUpdate(zdInfo);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}*/
	// 编辑
		public void updateZdInfo(DevZdInfo zdInfo) {
			Session session = sessionFactory.getCurrentSession();
			try {
				session.saveOrUpdate(zdInfo);
			} catch (Exception er) {
				System.out.println(er.getMessage());
			}
		}
//	
//	public void addInfo(BusinessInfo info) {
//		Session session = sessionFactory.getCurrentSession();
//		try {
//			//System.out.println("id:"+sysMap.getMapId());
//			session.saveOrUpdate(info);
//		} catch (Exception er) {
//			System.out.println(er.getMessage());
//		}
//	}
//	
	public void deleteinfo(String zdId) {
		// System.out.println("roleId:" + roleId);
		DevZdInfo result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
		result = (DevZdInfo) session.get(DevZdInfo.class,
					Integer.parseInt(zdId));
			session.delete(result);
	} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
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
