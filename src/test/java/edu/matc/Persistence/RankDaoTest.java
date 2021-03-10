package edu.matc.Persistence;


import edu.matc.Entity.Rank;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public class RankDaoTest {

    RankDao dao;

    @BeforeEach
    void setUp() {
        dao = new RankDao();

        edu.matc.test.util.Database db = edu.matc.test.util.Database.getInstance();
        db.runSQL("cleandb");
    }
    /**
     * tests getting by id
     */
    @Test
    void getByIdTest() {
        Rank retrievedRank = dao.getById(2);
        assertEquals("bronze", retrievedRank.getRankName());
    }

    /**
     * makes sure save/update is working
     */
    @Test
    void saveOrUpdateTest() {
        String newRank = "random";
        Rank bookToUpdate = dao.getById(3);
        bookToUpdate.setRankName(newRank);
        dao.saveOrUpdate(bookToUpdate);
        Rank retrievedBook = dao.getById(3);
        assertEquals(newRank, retrievedBook.getRankName());
    }

    /**
     * tests the insert method
     */
    @Test
    void insertTest() {
        Rank newRank = new Rank();
        int id = dao.insert(newRank);
        assertNotEquals(0, id);
        Rank insertedBook = dao.getById(id);
        assertEquals("Inserted Book", insertedBook.getRankName());
    }

    /**
     * tests the delete method
     */
    @Test
    void deleteTest() {
        dao.delete(dao.getById(1));
        assertNull(dao.getById(1));
    }

    /**
     * tests the get all method
     */
    @Test
    void getAllTest() {
        List<Rank> books = dao.getAll();
        assertEquals(9, books.size());

    }

}
