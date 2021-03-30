package edu.matc.persistence;


import edu.matc.entity.Rank;
import org.junit.jupiter.api.AfterEach;
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
        Rank rankToUpdate = dao.getById(3);
        rankToUpdate.setRankName(newRank);
        dao.saveOrUpdate(rankToUpdate);
        Rank retrievedRank = dao.getById(3);
        assertEquals(newRank, retrievedRank.getRankName());
    }

    /**
     * tests the insert method
     */
    @Test
    void insertTest() {
        Rank newRank = new Rank("Random");
        int id = dao.insert(newRank);
        assertNotEquals(0, id);
        Rank insertedRank = dao.getById(id);
        assertEquals("Random", insertedRank.getRankName());
    }

    /**
     * tests the delete method
     */
    //@Test
    //void deleteTest() {
     //   dao.delete(dao.getById(10));
     //   assertNull(dao.getById(10));
    //}

    /**
     * tests the get all method
     */
    //@Test
    //void getAllTest() {
     //   List<Rank> ranks = dao.getAll();
      //  assertEquals(8, ranks.size());

   // }

}
