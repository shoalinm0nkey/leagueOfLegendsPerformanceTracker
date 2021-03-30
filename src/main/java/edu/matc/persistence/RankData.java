package edu.matc.persistence;

import edu.matc.controller.Ranks;
import edu.matc.data.Database;
import edu.matc.entity.Rank;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RankData {

    private final Logger logger = LogManager.getLogger(this.getClass());

    RankDao dao;


    public List<Rank> getAllRanks() {
        List<Rank> ranks = new ArrayList<>();
        Database db = Database.getInstance();
        Connection conn = null;
        String sql = "SELECT * FROM ranks";
        logger.info("sql: " + sql);

        try {
            db.connect();
            conn = db.getConnection();
            Statement selectStatement = conn.createStatement();
            ResultSet results = selectStatement.executeQuery(sql);
            while (results.next()) {
                Rank rank = createRankFromResults(results);
                ranks.add(rank);
            }
            db.disconnect();
        } catch (SQLException sqlException) {
            logger.error("SQL Exception Error: " + sqlException);
        } catch (Exception exception) {
            System.err.println("General Error: " + exception);
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException sqlException) {
                logger.error("SQL Excepetion Error: " + sqlException);
            } catch (Exception exception) {
                logger.error("General Error: " + exception);
            }
        }
        return ranks;
    }

    private Rank createRankFromResults(ResultSet results) throws SQLException {
        Rank rank = new Rank();
        rank.setRankName(results.getString("rank_name"));
        return rank;
    }

}
