/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.ProductBean;
import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

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

        if (!tableExist(getConnection(), "ORDER")) {
            try {
                //if the table is existed.
                cnnct = getConnection();  // the connection 
                stmnt = cnnct.createStatement();  // create statement
                String sql = "CREATE TABLE ORDERS ("
                        + "order_id INT NOT NULL GENERATED ALWAYS AS IDENTITY,"
                        + "custId INT NOT NULL,"
                        + "order_qty INT NOT NULL,"
                        + "order_time TIMESTAMP NOT NULL,"
                        + "deliever_date DATE NOT NULL,"
                        + "deliever_add VARCHAR(140) NOT NULL,"
                        + "order_state VARCHAR(30) NOT NULL,"
                        + "order_option VARCHAR(30) NOT NULL,"
                        + "CONSTRAINT pk_order_id PRIMARY KEY (order_id)"
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

    public int dropOrdersTable() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "DROP TABLE ORDERS";
            Statement s = cnnct.createStatement();
            int rs = s.executeUpdate(preQueryStatement);
            return rs;
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        } finally {
            if (pStmnt != null) {
                try {
                    pStmnt.close();
                } catch (SQLException e) {
                }
            }
            if (cnnct != null) {
                try {
                    cnnct.close();
                } catch (SQLException sqlEx) {
                }
            }
        }
        return 0;
    }

    //place order
    public boolean addOrder(int order_id, int cust_id, int order_qty, ArrayList<ProductBean> products, Date deliever_date, String deliever_add, String order_state, String order_option) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            if (products.size() > 0) {
                String preQueryStatement = "INSERT  INTO  ORDERS  VALUES  (?,?,?,?,?,?,?,?)";
                pStmnt = cnnct.prepareStatement(preQueryStatement);
                pStmnt.setInt(1, order_id);
                pStmnt.setInt(2, cust_id);
                pStmnt.setInt(3, order_qty);
                pStmnt.setTimestamp(4, new java.sql.Timestamp((new Date()).getTime()));
                pStmnt.setDate(5, new java.sql.Date(deliever_date.getTime()));
                pStmnt.setString(6, deliever_add);
                pStmnt.setString(7, order_state);
                pStmnt.setString(8, order_option);

                pStmnt.executeUpdate();

                //add record to order_product table
                for (ProductBean p : products) {
                    preQueryStatement = "INSERT INTO orderline VALUES (?,?,?)";
                    pStmnt = cnnct.prepareStatement(preQueryStatement);
                    pStmnt.setInt(1, order_id);
                    pStmnt.setInt(2, p.getP_id());
                    pStmnt.setInt(3, p.getP_qty());
                    pStmnt.executeUpdate();
                }
                pStmnt.close();
            }
            cnnct.close();
            isSuccess = true;
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return isSuccess;
    }
}
