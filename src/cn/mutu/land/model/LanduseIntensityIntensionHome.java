package cn.mutu.land.model;

// Generated 2015-6-17 9:22:50 by Hibernate Tools 4.0.0

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class LanduseIntensityIntension.
 * @see cn.mutu.land.model.LanduseIntensityIntension
 * @author Hibernate Tools
 */
public class LanduseIntensityIntensionHome {

	private static final Log log = LogFactory
			.getLog(LanduseIntensityIntensionHome.class);

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

	public void persist(LanduseIntensityIntension transientInstance) {
		log.debug("persisting LanduseIntensityIntension instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(LanduseIntensityIntension instance) {
		log.debug("attaching dirty LanduseIntensityIntension instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(LanduseIntensityIntension instance) {
		log.debug("attaching clean LanduseIntensityIntension instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(LanduseIntensityIntension persistentInstance) {
		log.debug("deleting LanduseIntensityIntension instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public LanduseIntensityIntension merge(
			LanduseIntensityIntension detachedInstance) {
		log.debug("merging LanduseIntensityIntension instance");
		try {
			LanduseIntensityIntension result = (LanduseIntensityIntension) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public LanduseIntensityIntension findById(java.lang.Integer id) {
		log.debug("getting LanduseIntensityIntension instance with id: " + id);
		try {
			LanduseIntensityIntension instance = (LanduseIntensityIntension) sessionFactory
					.getCurrentSession().get(
							"cn.mutu.land.model.LanduseIntensityIntension", id);
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

	public List findByExample(LanduseIntensityIntension instance) {
		log.debug("finding LanduseIntensityIntension instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"cn.mutu.land.model.LanduseIntensityIntension")
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
