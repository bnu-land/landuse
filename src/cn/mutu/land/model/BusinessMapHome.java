package cn.mutu.land.model;

// Generated 2016-6-16 22:18:50 by Hibernate Tools 4.0.0

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class BusinessMap.
 * @see cn.mutu.land.model.BusinessMap
 * @author Hibernate Tools
 */
@Stateless
public class BusinessMapHome {

	private static final Log log = LogFactory.getLog(BusinessMapHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(BusinessMap transientInstance) {
		log.debug("persisting BusinessMap instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(BusinessMap persistentInstance) {
		log.debug("removing BusinessMap instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public BusinessMap merge(BusinessMap detachedInstance) {
		log.debug("merging BusinessMap instance");
		try {
			BusinessMap result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public BusinessMap findById(int id) {
		log.debug("getting BusinessMap instance with id: " + id);
		try {
			BusinessMap instance = entityManager.find(BusinessMap.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
