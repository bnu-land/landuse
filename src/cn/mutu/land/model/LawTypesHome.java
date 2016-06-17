package cn.mutu.land.model;

// Generated 2016-6-11 12:24:30 by Hibernate Tools 4.0.0

//import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Home object for domain model class LawTypes.
 * @see cn.mutu.land.model.LawTypes
 * @author Hibernate Tools
 */
//@Stateless
public class LawTypesHome {

	private static final Log log = LogFactory.getLog(LawTypesHome.class);

	@PersistenceContext
	private EntityManager entityManager;

	public void persist(LawTypes transientInstance) {
		log.debug("persisting LawTypes instance");
		try {
			entityManager.persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void remove(LawTypes persistentInstance) {
		log.debug("removing LawTypes instance");
		try {
			entityManager.remove(persistentInstance);
			log.debug("remove successful");
		} catch (RuntimeException re) {
			log.error("remove failed", re);
			throw re;
		}
	}

	public LawTypes merge(LawTypes detachedInstance) {
		log.debug("merging LawTypes instance");
		try {
			LawTypes result = entityManager.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public LawTypes findById(Integer id) {
		log.debug("getting LawTypes instance with id: " + id);
		try {
			LawTypes instance = entityManager.find(LawTypes.class, id);
			log.debug("get successful");
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}
}
