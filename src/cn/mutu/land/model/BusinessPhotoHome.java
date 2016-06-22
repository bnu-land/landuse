package cn.mutu.land.model;

<<<<<<< HEAD
// Generated 2016-6-22 17:21:40 by Hibernate Tools 4.0.0
=======
// Generated 2016-6-16 22:53:54 by Hibernate Tools 4.0.0
>>>>>>> c827f56ad6128fb79072d22195127b46b34209dc

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class BusinessPhoto.
 * @see cn.mutu.land.model.BusinessPhoto
 * @author Hibernate Tools
 */
public class BusinessPhotoHome {

	private static final Log log = LogFactory.getLog(BusinessPhotoHome.class);

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

	public void persist(BusinessPhoto transientInstance) {
		log.debug("persisting BusinessPhoto instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(BusinessPhoto instance) {
		log.debug("attaching dirty BusinessPhoto instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(BusinessPhoto instance) {
		log.debug("attaching clean BusinessPhoto instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(BusinessPhoto persistentInstance) {
		log.debug("deleting BusinessPhoto instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public BusinessPhoto merge(BusinessPhoto detachedInstance) {
		log.debug("merging BusinessPhoto instance");
		try {
			BusinessPhoto result = (BusinessPhoto) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public BusinessPhoto findById(int id) {
		log.debug("getting BusinessPhoto instance with id: " + id);
		try {
			BusinessPhoto instance = (BusinessPhoto) sessionFactory
					.getCurrentSession().get(
							"cn.mutu.land.model.BusinessPhoto", id);
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

	public List findByExample(BusinessPhoto instance) {
		log.debug("finding BusinessPhoto instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("cn.mutu.land.model.BusinessPhoto")
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
