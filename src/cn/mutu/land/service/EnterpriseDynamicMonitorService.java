package cn.mutu.land.service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.EntDxqyydPda;

@Service
public class EnterpriseDynamicMonitorService {
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getEntLanduseChangeList(String searchKeyword) {
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
		List<EntDxqyydPda> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<EntDxqyydPda>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}
	
	
}
