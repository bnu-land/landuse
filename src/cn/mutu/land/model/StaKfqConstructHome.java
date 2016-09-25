package cn.mutu.land.model;

// Generated 2016-9-25 11:08:29 by Hibernate Tools 4.0.0

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class StaKfqConstruct.
 * @see cn.mutu.land.model.StaKfqConstruct
 * @author Hibernate Tools
 */
public class StaKfqConstructHome {

	private static final Log log = LogFactory.getLog(StaKfqConstructHome.class);

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

	public void persist(StaKfqConstruct transientInstance) {
		log.debug("persisting StaKfqConstruct instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(StaKfqConstruct instance) {
		log.debug("attaching dirty StaKfqConstruct instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(StaKfqConstruct instance) {
		log.debug("attaching clean StaKfqConstruct instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(StaKfqConstruct persistentInstance) {
		log.debug("deleting StaKfqConstruct instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public StaKfqConstruct merge(StaKfqConstruct detachedInstance) {
		log.debug("merging StaKfqConstruct instance");
		try {
			StaKfqConstruct result = (StaKfqConstruct) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public StaKfqConstruct findById(java.lang.Integer id) {
		log.debug("getting StaKfqConstruct instance with id: " + id);
		try {
			StaKfqConstruct instance = (StaKfqConstruct) sessionFactory
					.getCurrentSession().get(
							"cn.mutu.land.model.StaKfqConstruct", id);
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

	public List findByExample(StaKfqConstruct instance) {
		log.debug("finding StaKfqConstruct instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("cn.mutu.land.model.StaKfqConstruct")
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
