package cn.mutu.land.model;

// Generated 2015-6-15 21:04:46 by Hibernate Tools 4.0.0

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class LanduseIndexMeta.
 * @see cn.mutu.land.model.LanduseIndexMeta
 * @author Hibernate Tools
 */
public class LanduseIndexMetaHome {

	private static final Log log = LogFactory
			.getLog(LanduseIndexMetaHome.class);

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

	public void persist(LanduseIndexMeta transientInstance) {
		log.debug("persisting LanduseIndexMeta instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(LanduseIndexMeta instance) {
		log.debug("attaching dirty LanduseIndexMeta instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(LanduseIndexMeta instance) {
		log.debug("attaching clean LanduseIndexMeta instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(LanduseIndexMeta persistentInstance) {
		log.debug("deleting LanduseIndexMeta instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public LanduseIndexMeta merge(LanduseIndexMeta detachedInstance) {
		log.debug("merging LanduseIndexMeta instance");
		try {
			LanduseIndexMeta result = (LanduseIndexMeta) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public LanduseIndexMeta findById(java.lang.Integer id) {
		log.debug("getting LanduseIndexMeta instance with id: " + id);
		try {
			LanduseIndexMeta instance = (LanduseIndexMeta) sessionFactory
					.getCurrentSession().get(
							"cn.mutu.land.model.LanduseIndexMeta", id);
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

	public List findByExample(LanduseIndexMeta instance) {
		log.debug("finding LanduseIndexMeta instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("cn.mutu.land.model.LanduseIndexMeta")
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
