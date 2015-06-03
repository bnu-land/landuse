package cn.mutu.land.model;

// Generated 2015-6-3 20:23:59 by Hibernate Tools 4.0.0

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class NoticeColumns.
 * @see cn.mutu.land.model.NoticeColumns
 * @author Hibernate Tools
 */
public class NoticeColumnsHome {

	private static final Log log = LogFactory.getLog(NoticeColumnsHome.class);

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

	public void persist(NoticeColumns transientInstance) {
		log.debug("persisting NoticeColumns instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(NoticeColumns instance) {
		log.debug("attaching dirty NoticeColumns instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(NoticeColumns instance) {
		log.debug("attaching clean NoticeColumns instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(NoticeColumns persistentInstance) {
		log.debug("deleting NoticeColumns instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public NoticeColumns merge(NoticeColumns detachedInstance) {
		log.debug("merging NoticeColumns instance");
		try {
			NoticeColumns result = (NoticeColumns) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public NoticeColumns findById(java.lang.Integer id) {
		log.debug("getting NoticeColumns instance with id: " + id);
		try {
			NoticeColumns instance = (NoticeColumns) sessionFactory
					.getCurrentSession().get(
							"cn.mutu.land.model.NoticeColumns", id);
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

	public List findByExample(NoticeColumns instance) {
		log.debug("finding NoticeColumns instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("cn.mutu.land.model.NoticeColumns")
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
