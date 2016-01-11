package cn.mutu.land.model;

// Generated 2016-1-11 13:47:39 by Hibernate Tools 4.0.0

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class EntQyjyd.
 * @see cn.mutu.land.model.EntQyjyd
 * @author Hibernate Tools
 */
public class EntQyjydHome {

	private static final Log log = LogFactory.getLog(EntQyjydHome.class);

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

	public void persist(EntQyjyd transientInstance) {
		log.debug("persisting EntQyjyd instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(EntQyjyd instance) {
		log.debug("attaching dirty EntQyjyd instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(EntQyjyd instance) {
		log.debug("attaching clean EntQyjyd instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(EntQyjyd persistentInstance) {
		log.debug("deleting EntQyjyd instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public EntQyjyd merge(EntQyjyd detachedInstance) {
		log.debug("merging EntQyjyd instance");
		try {
			EntQyjyd result = (EntQyjyd) sessionFactory.getCurrentSession()
					.merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public EntQyjyd findById(java.lang.Integer id) {
		log.debug("getting EntQyjyd instance with id: " + id);
		try {
			EntQyjyd instance = (EntQyjyd) sessionFactory.getCurrentSession()
					.get("cn.mutu.land.model.EntQyjyd", id);
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

	public List findByExample(EntQyjyd instance) {
		log.debug("finding EntQyjyd instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("cn.mutu.land.model.EntQyjyd")
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
