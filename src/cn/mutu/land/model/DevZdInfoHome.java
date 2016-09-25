package cn.mutu.land.model;

// Generated 2016-9-25 14:43:49 by Hibernate Tools 4.0.0

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class DevZdInfo.
 * @see cn.mutu.land.model.DevZdInfo
 * @author Hibernate Tools
 */

public class DevZdInfoHome {

	private static final Log log = LogFactory.getLog(DevZdInfoHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(DevZdInfo transientInstance) {
		log.debug("persisting DevZdInfo instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(DevZdInfo persistentInstance) {
		log.debug("removing DevZdInfo instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public DevZdInfo merge(DevZdInfo detachedInstance) {
		log.debug("merging DevZdInfo instance");
		try {
			DevZdInfo result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public DevZdInfo findById(Integer id) {
		log.debug("getting DevZdInfo instance with id: " + id);
		try {
			DevZdInfo instance = entityManager.find(DevZdInfo.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
