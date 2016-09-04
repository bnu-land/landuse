package cn.mutu.land.service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.KfqInfomation;
import cn.mutu.land.model.TaskInfo;



@Service
public class KfqInfoManagerService {
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getKfqInfoList(String searchKeyword) {
		String hql = "FROM KfqInfomation as kfq";
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
		List<KfqInfomation> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<KfqInfomation>) query.list();
		
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}
	
}