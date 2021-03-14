package edu.matc.persistence;

import edu.matc.entity.Rank;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;


public class RankDao {
    private final org.apache.logging.log4j.Logger logger = LogManager.getLogger(this.getClass());
    SessionFactory sessionFactory = SFP.getSessionFactory();
    /**
     * Get rank by id
     */
    public Rank getById(int id) {
        Session session = sessionFactory.openSession();
        Rank rank = session.get(Rank.class, id);

        session.close();
        return rank;
    }

    /**
     * update rank
     * @param rank  Rank to be inserted or updated
     */
    public void saveOrUpdate(Rank rank) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.saveOrUpdate(rank);
        transaction.commit();
        session.close();
    }

    /**
     * update Rank
     * @param rank Rank to be inserted or updated
     */
    public int insert(Rank rank) {
        int id = 0;
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        id = (int)session.save(rank);
        transaction.commit();
        session.close();
        return id;
    }

    /**
     * Delete a rank
     * @param rank Rank to be deleted
     */
    public void delete(Rank rank) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(rank);
        transaction.commit();
        session.close();
    }

    /** Return a list of all books
     *
     * @return All books
     */
    public List<Rank> getAll() {

        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Rank> query = builder.createQuery(Rank.class);
        Root<Rank> root = query.from(Rank.class);
        List<Rank> ranks = session.createQuery(query).getResultList();
        session.close();

        return ranks;

    }


}
