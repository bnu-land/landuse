package cn.mutu.land.model;

// Generated 2016-6-11 12:24:30 by Hibernate Tools 4.0.0

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class NoticeColumns.
 * @see cn.mutu.land.model.NoticeColumns
 * @author Hibernate Tools
 */
@Stateless
public class NoticeColumnsHome {

	private static final Log log = LogFactory.getLog(NoticeColumnsHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(NoticeColumns transientInstance) {
		log.debug("persisting NoticeColumns instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(NoticeColumns persistentInstance) {
		log.debug("removing NoticeColumns instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public NoticeColumns merge(NoticeColumns detachedInstance) {
		log.debug("merging NoticeColumns instance");
		try {
			NoticeColumns result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public NoticeColumns findById(Integer id) {
		log.debug("getting NoticeColumns instance with id: " + id);
		try {
			NoticeColumns instance = entityManager
					.find(NoticeColumns.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
