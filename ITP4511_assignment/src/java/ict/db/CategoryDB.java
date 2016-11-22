/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author EVANFUNG
 */
public class CategoryDB {
    
    private String url = "";
    private String username = "";
    private String password = "";

    public CategoryDB(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public Connection getConnection() throws SQLException, IOException {
        System.setProperty("jdbc.drivers", "org.apache.derby.jdbc.ClientDriver");
        return DriverManager.getConnection(url, username, password);
    }

    public void createCategoryTable() throws SQLException, IOException {
        Connection cnnct = null;
        Statement stmnt = null;

        if (!tableExist(getConnection(), "Category")) {
            try {
                //if the table is existed.
                cnnct = getConnection();  // the connection 
                stmnt = cnnct.createStatement();  // create statement
                String sql = "CREATE TABLE CATEGORY ("
                        + "cat_id INT NOT NULL GENERATED ALWAYS AS IDENTITY,"
                        + "cat_name VARCHAR(30) NOT NULL,"
                        + "CONSTRAINT pk_cat_id PRIMARY KEY (cat_id)"
                        + ")";

                stmnt.execute(sql);
                stmnt.close();
                cnnct.close();
            } catch (SQLException ex) {
                while (ex != null) {
                    ex.printStackTrace();
                    ex = ex.getNextException();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }

        } else {
            //if the table does not existed
            return;
        }

    }
    
        public boolean tableExist(Connection conn, String tableName) throws SQLException {
        boolean tExists = false;
        try (ResultSet rs = conn.getMetaData().getTables(null, null, tableName, null)) {
            while (rs.next()) {
                String tName = rs.getString("TABLE_NAME");
                if (tName != null && tName.equals(tableName)) {
                    tExists = true;
                    break;
                }
            }
        }
        return tExists;
    }
}
