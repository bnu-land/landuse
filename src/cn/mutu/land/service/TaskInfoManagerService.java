package cn.mutu.land.service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.TaskInfo;
import cn.mutu.land.model.UUserInfo;



@Service
public class TaskInfoManagerService {
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getTaskInfoList(String searchKeyword) {
		String hql = "FROM TaskInfo as task";
		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			String hql2 = " WHERE task.taskComment" + likeStr 
					+ "OR task.taskFinish" + likeStr;
			hql += hql2;
		}		
		List<TaskInfo> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<TaskInfo>) query.list();
		
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}
	// 添加任务信息
		@SuppressWarnings("unchecked")
		public void addTask(TaskInfo taskInfo) {
			Session session = sessionFactory.getCurrentSession();
			try {
				
				taskInfo.setTaskFinish("未完成");
				session.save(taskInfo);
			} catch (Exception er) {
				System.out.println(er.getMessage());
			}
		}
}