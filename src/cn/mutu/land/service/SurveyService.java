package cn.mutu.land.service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.SurveyData;

@Service
public class SurveyService {
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getSurveyDataManager(String searchKeyword) {
		String hql = "FROM SurveyData as sur";
		System.out.print("sql:"+hql);
		List<SurveyData> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<SurveyData>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}
	
}
