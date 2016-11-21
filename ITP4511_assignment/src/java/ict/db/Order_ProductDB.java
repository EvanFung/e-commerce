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
public class Order_ProductDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public Order_ProductDB(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public Connection getConnection() throws SQLException, IOException {
        System.setProperty("jdbc.drivers", "org.apache.derby.jdbc.ClientDriver");
        return DriverManager.getConnection(url, username, password);
    }

    public void createOrder_ProductTable() throws SQLException, IOException {
        Connection cnnct = null;
        Statement stmnt = null;

        if (!tableExist(getConnection(), "ORDER_PRODUCT")) {
            try {
                //if the table is existed.
                cnnct = getConnection();  // the connection 
                stmnt = cnnct.createStatement();  // create statement
                String sql = "CREATE TABLE ORDER_PRODUCT ("
                        + "order_id INT NOT NULL,"
                        + "p_id INT NOT NULL,"
                        + "p_qty INT NOT NULL,"
                        + " CONSTRAINT order_product_fk_1 FOREIGN KEY (order_id) REFERENCES ORDERS (order_id),"
                        + "CONSTRAINT order_product_fk_2 FOREIGN KEY (p_id) REFERENCES PRODUCT (p_id),"
                        + " PRIMARY KEY(order_id,p_id)"
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
