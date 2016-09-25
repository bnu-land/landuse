package cn.mutu.land.model;

// Generated 2016-9-25 21:02:31 by Hibernate Tools 4.0.0

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class EntDxqyydPda.
 * @see cn.mutu.land.model.EntDxqyydPda
 * @author Hibernate Tools
 */
public class EntDxqyydPdaHome {

	private static final Log log = LogFactory.getLog(EntDxqyydPdaHome.class);

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

	public void persist(EntDxqyydPda transientInstance) {
		log.debug("persisting EntDxqyydPda instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(EntDxqyydPda instance) {
		log.debug("attaching dirty EntDxqyydPda instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(EntDxqyydPda instance) {
		log.debug("attaching clean EntDxqyydPda instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(EntDxqyydPda persistentInstance) {
		log.debug("deleting EntDxqyydPda instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public EntDxqyydPda merge(EntDxqyydPda detachedInstance) {
		log.debug("merging EntDxqyydPda instance");
		try {
			EntDxqyydPda result = (EntDxqyydPda) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public EntDxqyydPda findById(java.lang.Integer id) {
		log.debug("getting EntDxqyydPda instance with id: " + id);
		try {
			EntDxqyydPda instance = (EntDxqyydPda) sessionFactory
					.getCurrentSession().get("cn.mutu.land.model.EntDxqyydPda",
							id);
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

	public List findByExample(EntDxqyydPda instance) {
		log.debug("finding EntDxqyydPda instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("cn.mutu.land.model.EntDxqyydPda")
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
