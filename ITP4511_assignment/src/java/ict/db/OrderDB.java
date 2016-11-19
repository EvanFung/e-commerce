/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import java.io.*;
import java.sql.*;

/**
 *
 * @author EVANFUNG
 */
public class OrderDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public OrderDB(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public Connection getConnection() throws SQLException, IOException {
        System.setProperty("jdbc.drivers", "org.apache.derby.jdbc.ClientDriver");
        return DriverManager.getConnection(url, username, password);
    }

    public void createOrderTable() throws SQLException, IOException {
        Connection cnnct = null;
        Statement stmnt = null;
        
        if(!tableExist(getConnection(),"Order")) {
            //if the table is existed.
            
        } else {
            //if the table does not existed
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
