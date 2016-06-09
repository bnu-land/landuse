package cn.mutu.land.model;

// Generated 2016-6-8 16:08:53 by Hibernate Tools 4.0.0

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class UtilFieldnameIndex.
 * @see cn.mutu.land.model.UtilFieldnameIndex
 * @author Hibernate Tools
 */
public class UtilFieldnameIndexHome {

	private static final Log log = LogFactory
			.getLog(UtilFieldnameIndexHome.class);

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

	public void persist(UtilFieldnameIndex transientInstance) {
		log.debug("persisting UtilFieldnameIndex instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(UtilFieldnameIndex instance) {
		log.debug("attaching dirty UtilFieldnameIndex instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(UtilFieldnameIndex instance) {
		log.debug("attaching clean UtilFieldnameIndex instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(UtilFieldnameIndex persistentInstance) {
		log.debug("deleting UtilFieldnameIndex instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public UtilFieldnameIndex merge(UtilFieldnameIndex detachedInstance) {
		log.debug("merging UtilFieldnameIndex instance");
		try {
			UtilFieldnameIndex result = (UtilFieldnameIndex) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public UtilFieldnameIndex findById(java.lang.Integer id) {
		log.debug("getting UtilFieldnameIndex instance with id: " + id);
		try {
			UtilFieldnameIndex instance = (UtilFieldnameIndex) sessionFactory
					.getCurrentSession().get(
							"cn.mutu.land.model.UtilFieldnameIndex", id);
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

	public List findByExample(UtilFieldnameIndex instance) {
		log.debug("finding UtilFieldnameIndex instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("cn.mutu.land.model.UtilFieldnameIndex")
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
