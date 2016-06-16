package cn.mutu.land.model;

// Generated 2016-6-16 22:17:14 by Hibernate Tools 4.0.0

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class BusinessPhoto.
 * @see cn.mutu.land.model.BusinessPhoto
 * @author Hibernate Tools
 */
@Stateless
public class BusinessPhotoHome {

	private static final Log log = LogFactory.getLog(BusinessPhotoHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(BusinessPhoto transientInstance) {
		log.debug("persisting BusinessPhoto instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(BusinessPhoto persistentInstance) {
		log.debug("removing BusinessPhoto instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public BusinessPhoto merge(BusinessPhoto detachedInstance) {
		log.debug("merging BusinessPhoto instance");
		try {
			BusinessPhoto result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public BusinessPhoto findById(int id) {
		log.debug("getting BusinessPhoto instance with id: " + id);
		try {
			BusinessPhoto instance = entityManager
					.find(BusinessPhoto.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
