package cn.mutu.land.model;

// Generated 2016-6-11 12:24:30 by Hibernate Tools 4.0.0

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class NoticeNews.
 * @see cn.mutu.land.model.NoticeNews
 * @author Hibernate Tools
 */
//@Stateless
public class NoticeNewsHome {

	private static final Log log = LogFactory.getLog(NoticeNewsHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(NoticeNews transientInstance) {
		log.debug("persisting NoticeNews instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(NoticeNews persistentInstance) {
		log.debug("removing NoticeNews instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public NoticeNews merge(NoticeNews detachedInstance) {
		log.debug("merging NoticeNews instance");
		try {
			NoticeNews result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public NoticeNews findById(Integer id) {
		log.debug("getting NoticeNews instance with id: " + id);
		try {
			NoticeNews instance = entityManager.find(NoticeNews.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
