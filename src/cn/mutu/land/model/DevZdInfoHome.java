package cn.mutu.land.model;

// Generated 2016-9-13 1:30:07 by Hibernate Tools 4.0.0

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class DevZdInfo.
 * @see cn.mutu.land.model.DevZdInfo
 * @author Hibernate Tools
 */
public class DevZdInfoHome {

	private static final Log log = LogFactory.getLog(DevZdInfoHome.class);

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

	public void persist(DevZdInfo transientInstance) {
		log.debug("persisting DevZdInfo instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(DevZdInfo instance) {
		log.debug("attaching dirty DevZdInfo instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(DevZdInfo instance) {
		log.debug("attaching clean DevZdInfo instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(DevZdInfo persistentInstance) {
		log.debug("deleting DevZdInfo instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public DevZdInfo merge(DevZdInfo detachedInstance) {
		log.debug("merging DevZdInfo instance");
		try {
			DevZdInfo result = (DevZdInfo) sessionFactory.getCurrentSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public DevZdInfo findById(java.lang.Integer id) {
		log.debug("getting DevZdInfo instance with id: " + id);
		try {
			DevZdInfo instance = (DevZdInfo) sessionFactory.getCurrentSession()
					.get("cn.mutu.land.model.DevZdInfo", id);
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

	public List findByExample(DevZdInfo instance) {
		log.debug("finding DevZdInfo instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("cn.mutu.land.model.DevZdInfo")
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
