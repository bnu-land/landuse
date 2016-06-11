package cn.mutu.land.model;

// Generated 2016-6-11 12:24:30 by Hibernate Tools 4.0.0

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class LawRegulation.
 * @see cn.mutu.land.model.LawRegulation
 * @author Hibernate Tools
 */
@Stateless
public class LawRegulationHome {

	private static final Log log = LogFactory.getLog(LawRegulationHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(LawRegulation transientInstance) {
		log.debug("persisting LawRegulation instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(LawRegulation persistentInstance) {
		log.debug("removing LawRegulation instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public LawRegulation merge(LawRegulation detachedInstance) {
		log.debug("merging LawRegulation instance");
		try {
			LawRegulation result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public LawRegulation findById(Integer id) {
		log.debug("getting LawRegulation instance with id: " + id);
		try {
			LawRegulation instance = entityManager
					.find(LawRegulation.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
