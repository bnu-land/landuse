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
	public Map<String, Object> getNoticeNewList(String searchKeyword,
			String noticeState) {
		String hql = "FROM NoticeNews as nn";
		// WHERE sm.name LIKE '%b%' OR sm.key LIKE '%b%' OR sm.url LIKE '%b%' OR
		// sm.description LIKE '%b%'
		String whereStr = " WHERE ";
		String hql2 = "";
		String hql3 = "";
		if (!searchKeyword.equals("")) {
			String likeStr = " LIKE '%" + searchKeyword + "%' ";
			hql2 = "nn.noticeColumn" + likeStr + "OR nn.noticeTitle" + likeStr
					+ "OR nn.noticeAuthor" + likeStr + "OR nn.description"
					+ likeStr;
		}
		if (!noticeState.equals("")) {
			if (!searchKeyword.equals("")) {
				hql3 += " AND ";
			}
			hql3 = "nn.noticeState = " + noticeState;
		}
		if (!searchKeyword.equals("") || !noticeState.equals("")) {
			hql = hql + whereStr + hql2 + hql3;
		}
		hql += " ORDER BY nn.publishDate DESC";
		List<NoticeNews> results = null;
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery(hql);
		results = (List<NoticeNews>) query.list();
		Map<String, Object> myMapResult = new TreeMap<String, Object>();
		myMapResult.put("root", results);
		myMapResult.put("success", true);
		return myMapResult;
	}

	public void addNotice(NoticeNews notice) {
		Session session = sessionFactory.getCurrentSession();
		try {
			// System.out.println("id:"+sysMap.getMapId());
			session.saveOrUpdate(notice);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 编辑更新角色权限信息
	public void updateNotice(NoticeNews notice) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(notice);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 移除到草稿箱
	public void noticeToDraft(NoticeNews news) {
		// System.out.println("roleId:" + roleId);
		NoticeNews result = null;
		Session session = sessionFactory.getCurrentSession();
		try {			
			news.setNoticeState(1);
			session.saveOrUpdate(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 移除到删除
	public void noticeToDelete(String id) {
		// System.out.println("roleId:" + roleId);
		NoticeNews result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (NoticeNews) session.get(NoticeNews.class,
					Integer.parseInt(id));
			result.setNoticeState(2);
			session.saveOrUpdate(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 删除
	public void deleteNotice(String id) {
		// System.out.println("roleId:" + roleId);
		NoticeNews result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (NoticeNews) session.get(NoticeNews.class,
					Integer.parseInt(id));
			session.delete(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 更新阅读次数
		public Map<String, Object> updateNoticeRead(String id) {
			String hql = "UPDATE NoticeNews as notice";
			if (!id.equals("")) {
				String setStr = " SET notice.readCount=notice.readCount+1";
				String hql2 = setStr+" WHERE notice.id=" + id;
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
	// --------------Columns---------------------------------
	@SuppressWarnings("unchecked")
	public Map<String, Object> getNoticeColumnsList() {
		String hql = "FROM NoticeColumns as nc ORDER BY nc.id";
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
			// System.out.println("id:"+sysMap.getMapId());
			session.saveOrUpdate(columns);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 编辑更新角色权限信息
	public void updateNoticeColumns(NoticeColumns columns) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.saveOrUpdate(columns);
		} catch (Exception er) {
			System.out.println(er.getMessage());
		}
	}

	// 删除角色权限信息
	public void deleteNoticeColumns(String id) {
		// System.out.println("roleId:" + roleId);
		NoticeColumns result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (NoticeColumns) session.get(NoticeColumns.class,
					Integer.parseInt(id));
			session.delete(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
