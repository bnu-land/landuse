package cn.mutu.land.model;

// Generated 2015-5-31 19:03:47 by Hibernate Tools 4.0.0

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class SystemMap.
 * @see cn.mutu.land.model.SystemMap
 * @author Hibernate Tools
 */

public class SystemMapHome {

	private static final Log log = LogFactory.getLog(SystemMapHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(SystemMap transientInstance) {
		log.debug("persisting SystemMap instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(SystemMap persistentInstance) {
		log.debug("removing SystemMap instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public SystemMap merge(SystemMap detachedInstance) {
		log.debug("merging SystemMap instance");
		try {
			SystemMap result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public SystemMap findById(Long id) {
		log.debug("getting SystemMap instance with id: " + id);
		try {
			SystemMap instance = entityManager.find(SystemMap.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
