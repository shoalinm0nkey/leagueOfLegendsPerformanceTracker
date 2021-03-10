package edu.matc.test.util;


import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.*;
import java.sql.*;
import java.util.*;


public class Database {
    private final Logger logger = LogManager.getLogger(this.getClass());

    private static Database instance = new Database();

    private Properties properties;

    private Connection connection;

    private Database() {
        loadProperties();
    }

    private void loadProperties() {
        properties = new Properties();
        try {
            properties.load(this.getClass().getResourceAsStream("/database.properties"));
        } catch (IOException ie) {
            logger.error("IOException: " + ie);
            ie.printStackTrace();
        } catch (Exception e) {
            logger.error("IOException: " + e);
            e.printStackTrace();
        }
    }

    public static Database getInstance() {
        return instance;
    }

    public Connection getConnection() {
        return connection;
    }

    public void connect() throws Exception {
        if(connection != null)
            return;


        try {
            Class.forName(properties.getProperty("driver"));
        } catch (ClassNotFoundException ce) {
            throw new Exception("Database.connect... Error: MySQL Driver not found");
        }

        String url = properties.getProperty("url");
        connection = DriverManager.getConnection(url, properties.getProperty("username"), properties.getProperty("password"));
    }

    public void disconnect() {
        if(connection != null) {
            try {
                connection.close();
            } catch (SQLException sqle) {
                logger.error("SQLException error: " + sqle);
            }
        }

        connection = null;
    }

    public void runSQL(String sqlFile) {
        Statement statement = null;

        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        InputStream inputStream = classLoader.getResourceAsStream(sqlFile);
        try (BufferedReader br = new BufferedReader(new InputStreamReader(inputStream))) {
            Class.forName("com.mysql.jdbc.Driver");
            connect();
            statement = connection.createStatement();

            while (true) {
                String sql = br.readLine();
                if(sql == null) {
                    break;
                }
                statement.executeUpdate(sql);
            }
        } catch (SQLException sqle) {
            logger.error(sqle);
        } catch (Exception e) {
            logger.error(e);
        } finally {
            disconnect();
        }
    }


}

