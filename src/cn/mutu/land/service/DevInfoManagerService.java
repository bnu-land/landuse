package cn.mutu.land.service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.DevInfo;
import cn.mutu.land.model.StaKfq;



@Service
public class DevInfoManagerService {
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getKfqInfoList(String searchKeyword) {
		String hql = "FROM DevInfo as kfq";
		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			//String likeStr1=" LIKE '%" + jb + "%' ";
			//String likeStr2=" LIKE '%" + lx + "%' ";
			//String likeStr3=" LIKE '%" + date + "%' ";
			//String likeStr4=" LIKE '%" + searchKeyword + "%' ";
			String hql2 = " WHERE kfq.kfqmc" + likeStr 
					
					+ "OR kfq.kfqjb" + likeStr
					+ "OR kfq.kfqpjlx" + likeStr;
					//+ "OR kfq.kfqpjnf" + likeStr1;,String date
			hql += hql2;
		}		
		List<DevInfo> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<DevInfo>) query.list();
		
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getKfqInfoSelect( String kfqmc,String kfqjb,String kfqpjlx) {
		
			Session session=null;
			
			String hql="FROM DevInfo as dev where 1=1";//查询语句
				//拼接查询语句
				if(!kfqmc.equals("")){//判断第一个条件
					hql+=" and dev.kfqmc LIKE '%" + kfqmc + "%'" ;
				}
			    if(!kfqjb.equals("")){//判断第二个条件
						hql+=" and dev.kfqjb LIKE '%" + kfqjb + "%'" ;
				}
				
				if(!kfqpjlx.equals("")){//判断第三个条件
						hql+=" and dev.kfqpjlx LIKE '%" + kfqpjlx + "%'" ;
				}
				
								//执行sql语句
				System.out.println("执行sql语句hql = " + hql);
				List<DevInfo> results = null;
				org.hibernate.Query query = sessionFactory.getCurrentSession()
						.createQuery(hql);
				results = (List<DevInfo>) query.list();
				//返回结果
			   Map<String, Object> myMapResult = new TreeMap<String, Object>();
			   myMapResult.put("root", results);
			   myMapResult.put("success", true);
			   return myMapResult;
	
	}
	@SuppressWarnings("unchecked")
	public void addkfq(DevInfo devInfo) {
		Session session = sessionFactory.getCurrentSession();
		try {
			
			//System.out.println(devInfo.getSlsj()+"时间长度是："+devInfo.getSlsj().length());
			//devInfo.setSlsj(devInfo.getSlsj().substring(0,4));
			session.saveOrUpdate(devInfo);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}
	@SuppressWarnings("unchecked")
	public void statistics(StaKfq staKfq) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(staKfq);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}
	public void deleteinfo(String kfqId) {
		// System.out.println("roleId:" + roleId);
		DevInfo result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
		result = (DevInfo) session.get(DevInfo.class,
					Integer.parseInt(kfqId));
			session.delete(result);
	} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 编辑
			public void updateDevInfo(DevInfo devInfo) {
				Session session = sessionFactory.getCurrentSession();
				try {
					session.saveOrUpdate(devInfo);
				} catch (Exception er) {
					System.out.println(er.getMessage());
				}
			}
}