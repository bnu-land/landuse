package cn.mutu.land.service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.mutu.land.model.NoticeColumns;
import cn.mutu.land.model.NoticeNews;

@Service
public class NoticeManageService {
	private SessionFactory sessionFactory;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getNoticeNewList(String searchKeyword) {
		System.out.println("-----get map url list--------");
		String hql = "FROM NoticeNews as nn";
		// WHERE sm.name LIKE '%b%' OR sm.key LIKE '%b%' OR sm.url LIKE '%b%' OR
		// sm.description LIKE '%b%'

		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			String hql2 = " WHERE nn.column" + likeStr + "OR nn.title" + likeStr
					+ "OR nn.author" + likeStr + "OR nn.description" + likeStr;
			hql = hql + hql2;
		}
		System.out.println(hql);
		List<NoticeNews> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<NoticeNews>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}
	
	//--------------Columns---------------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> getNoticeColumnsList() {
		System.out.println("-----get map url list--------");
		String hql = "FROM NoticeColumns as nc ORDER BY nc.group";
		System.out.println(hql);
		List<NoticeColumns> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<NoticeColumns>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	public void addNoticeColumns(NoticeColumns columns) {
		Session session = sessionFactory.getCurrentSession();
		try {
			System.out.println("add columns...");
			System.out.println("columns:"+columns.getColumn());
			//System.out.println("id:"+sysMap.getMapId());
			session.saveOrUpdate(columns);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 编辑更新角色权限信息
	public void updateNoticeColumns(NoticeColumns columns) {
		Session session = sessionFactory.getCurrentSession();
		try{
		session.saveOrUpdate(columns);
		}catch (Exception er){
			System.out.println(er.getMessage());
		}
	}

	// 删除角色权限信息
	public void deleteNoticeColumns(String columns) {
		// System.out.println("roleId:" + roleId);
		NoticeColumns result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (NoticeColumns) session.get(NoticeColumns.class,
					Integer.parseInt(columns));
			session.delete(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
