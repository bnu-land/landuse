package cn.mutu.land.model;

// Generated 2016-6-16 22:53:54 by Hibernate Tools 4.0.0

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class LawRegulation.
 * @see cn.mutu.land.model.LawRegulation
 * @author Hibernate Tools
 */
public class LawRegulationHome {

	private static final Log log = LogFactory.getLog(LawRegulationHome.class);

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

	public void persist(LawRegulation transientInstance) {
		log.debug("persisting LawRegulation instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(LawRegulation instance) {
		log.debug("attaching dirty LawRegulation instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(LawRegulation instance) {
		log.debug("attaching clean LawRegulation instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(LawRegulation persistentInstance) {
		log.debug("deleting LawRegulation instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public LawRegulation merge(LawRegulation detachedInstance) {
		log.debug("merging LawRegulation instance");
		try {
			LawRegulation result = (LawRegulation) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public LawRegulation findById(java.lang.Integer id) {
		log.debug("getting LawRegulation instance with id: " + id);
		try {
			LawRegulation instance = (LawRegulation) sessionFactory
					.getCurrentSession().get(
							"cn.mutu.land.model.LawRegulation", id);
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

	public List findByExample(LawRegulation instance) {
		log.debug("finding LawRegulation instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("cn.mutu.land.model.LawRegulation")
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
