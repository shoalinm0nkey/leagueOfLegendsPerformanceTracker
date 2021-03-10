package edu.matc.Entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * This class represents the different ranks in competitve League of Legends
 *
 * @author beckanderson
 */

@Entity(name = "Rank")
@Table(name = "ranks")
public class Rank {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name = "native", strategy = "native")
    private int id;

    @Column(columnDefinition = "rank_name")
    private String rankName;

    public Rank(int id, String rankName) {
        this.id = id;
        this.rankName = rankName;
    }

    public Rank() {

    }

    /**
     *
     * @return the id of a given rank
     */
    public int getId() {
        return id;
    }

    /**
     *
     * @return a name of a given rank
     */
    public String getRankName() {
        return rankName;
    }

    /**
     *
     * @param id is the id of a rank
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     *
     * @param rankName name of a rank
     */
    public void setRankName(String rankName) {
        this.rankName = rankName;
    }

}
