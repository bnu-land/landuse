package cn.mutu.land.model;

// Generated 2015-6-16 15:49:28 by Hibernate Tools 4.0.0

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class LanduseIndexWeight.
 * @see cn.mutu.land.model.LanduseIndexWeight
 * @author Hibernate Tools
 */
public class LanduseIndexWeightHome {

	private static final Log log = LogFactory
			.getLog(LanduseIndexWeightHome.class);

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

	public void persist(LanduseIndexWeight transientInstance) {
		log.debug("persisting LanduseIndexWeight instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(LanduseIndexWeight instance) {
		log.debug("attaching dirty LanduseIndexWeight instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(LanduseIndexWeight instance) {
		log.debug("attaching clean LanduseIndexWeight instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(LanduseIndexWeight persistentInstance) {
		log.debug("deleting LanduseIndexWeight instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public LanduseIndexWeight merge(LanduseIndexWeight detachedInstance) {
		log.debug("merging LanduseIndexWeight instance");
		try {
			LanduseIndexWeight result = (LanduseIndexWeight) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public LanduseIndexWeight findById(java.lang.Integer id) {
		log.debug("getting LanduseIndexWeight instance with id: " + id);
		try {
			LanduseIndexWeight instance = (LanduseIndexWeight) sessionFactory
					.getCurrentSession().get(
							"cn.mutu.land.model.LanduseIndexWeight", id);
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

	public List findByExample(LanduseIndexWeight instance) {
		log.debug("finding LanduseIndexWeight instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("cn.mutu.land.model.LanduseIndexWeight")
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
