package cn.mutu.land.model;

// Generated 2015-6-17 5:51:33 by Hibernate Tools 4.0.0

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class LanduseIntensityConstruct.
 * @see cn.mutu.land.model.LanduseIntensityConstruct
 * @author Hibernate Tools
 */
public class LanduseIntensityConstructHome {

	private static final Log log = LogFactory
			.getLog(LanduseIntensityConstructHome.class);

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

	public void persist(LanduseIntensityConstruct transientInstance) {
		log.debug("persisting LanduseIntensityConstruct instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(LanduseIntensityConstruct instance) {
		log.debug("attaching dirty LanduseIntensityConstruct instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(LanduseIntensityConstruct instance) {
		log.debug("attaching clean LanduseIntensityConstruct instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(LanduseIntensityConstruct persistentInstance) {
		log.debug("deleting LanduseIntensityConstruct instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public LanduseIntensityConstruct merge(
			LanduseIntensityConstruct detachedInstance) {
		log.debug("merging LanduseIntensityConstruct instance");
		try {
			LanduseIntensityConstruct result = (LanduseIntensityConstruct) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public LanduseIntensityConstruct findById(java.lang.Integer id) {
		log.debug("getting LanduseIntensityConstruct instance with id: " + id);
		try {
			LanduseIntensityConstruct instance = (LanduseIntensityConstruct) sessionFactory
					.getCurrentSession().get(
							"cn.mutu.land.model.LanduseIntensityConstruct", id);
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

	public List findByExample(LanduseIntensityConstruct instance) {
		log.debug("finding LanduseIntensityConstruct instance by example");
		try {
			List results = sessionFactory
					.getCurrentSession()
					.createCriteria(
							"cn.mutu.land.model.LanduseIntensityConstruct")
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
