package cn.mutu.land.model;

// Generated 2015-6-18 16:06:27 by Hibernate Tools 4.0.0

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class LanduseIntensityManager.
 * @see cn.mutu.land.model.LanduseIntensityManager
 * @author Hibernate Tools
 */
public class LanduseIntensityManagerHome {

	private static final Log log = LogFactory
			.getLog(LanduseIntensityManagerHome.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext()
					.lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException(
					"Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(LanduseIntensityManager transientInstance) {
		log.debug("persisting LanduseIntensityManager instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(LanduseIntensityManager instance) {
		log.debug("attaching dirty LanduseIntensityManager instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(LanduseIntensityManager instance) {
		log.debug("attaching clean LanduseIntensityManager instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(LanduseIntensityManager persistentInstance) {
		log.debug("deleting LanduseIntensityManager instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public LanduseIntensityManager merge(
			LanduseIntensityManager detachedInstance) {
		log.debug("merging LanduseIntensityManager instance");
		try {
			LanduseIntensityManager result = (LanduseIntensityManager) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public LanduseIntensityManager findById(java.lang.Integer id) {
		log.debug("getting LanduseIntensityManager instance with id: " + id);
		try {
			LanduseIntensityManager instance = (LanduseIntensityManager) sessionFactory
					.getCurrentSession().get(
							"cn.mutu.land.model.LanduseIntensityManager", id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(LanduseIntensityManager instance) {
		log.debug("finding LanduseIntensityManager instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"cn.mutu.land.model.LanduseIntensityManager")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
