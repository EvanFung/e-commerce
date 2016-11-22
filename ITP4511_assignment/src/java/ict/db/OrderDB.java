/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.CustomerBean;
import ict.bean.OrderBean;
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

    public ArrayList<OrderBean> queryMyOrders(int clienID) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        ArrayList<OrderBean> obs = new ArrayList<OrderBean>();
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM orders WHERE CUSTID=?";

            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, clienID);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {

                OrderBean ob = new OrderBean();
                CustomerDB cDB = new CustomerDB(url, username, password);
                CustomerBean cb = cDB.getCustIdById(rs.getInt("CUSTID"));

                ob.setOrder_id(rs.getInt("ORDER_ID"));
                ob.setCustomer(cb);
                ob.setDeliever_add(rs.getString("DELIEVER_ADD"));
                ob.setDeliever_date(rs.getDate("DELIEVER_DATE"));
                ob.setDeliever_time(rs.getDate("ORDER_TIME"));
                ob.setOrder_option(rs.getString("ORDER_OPTION"));
                ob.setOrder_qty(rs.getInt("ORDER_QTY"));
                ob.setOrder_state(rs.getString("ORDER_STATE"));
                String preQueryStatement2 = "SELECT * FROM ORDER_PRODUCT WHERE ORDER_ID=?";
                PreparedStatement pStmnt2 = cnnct.prepareStatement(preQueryStatement2);
                pStmnt2.setString(1, rs.getString("ORDER_ID"));
                ResultSet rs2 = pStmnt2.executeQuery();
                ArrayList<ProductBean> products = new ArrayList<ProductBean>();
                ProductDB prodDB = new ProductDB(url, username, password);
                while (rs2.next()) {
                    //set productBean
                    ProductBean pb = prodDB.getProductById(rs2.getInt("p_id"));
                    pb.setP_qty(rs2.getInt("p_qty"));
                    products.add(pb);
                }
                ob.setProducts(products);
                obs.add(ob);
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return obs;
    }

    public ArrayList<OrderBean> queryOrders() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        ArrayList<OrderBean> obs = new ArrayList<OrderBean>();
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM orders";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            ResultSet rs = null;
            rs = pStmnt.executeQuery();
            while (rs.next()) {

                OrderBean ob = new OrderBean();
                ob.setOrder_id(rs.getInt("order_ID"));

                //set account detail
                CustomerDB cDB = new CustomerDB(url, username, password);
                CustomerBean cust = cDB.getCustIdById(rs.getInt("custid"));
                ob.setCustomer(cust);
                ob.setDeliever_add(rs.getString("DELIEVER_ADD"));
                ob.setDeliever_date(rs.getDate("DELIEVER_DATE"));
                ob.setDeliever_time(rs.getDate("ORDER_TIME"));
                ob.setOrder_option(rs.getString("ORDER_OPTION"));
                ob.setOrder_qty(rs.getInt("ORDER_QTY"));
                ob.setOrder_state(rs.getString("ORDER_STATE"));

                String preQueryStatement2 = "SELECT * FROM orderline WHERE order_ID=?";
                PreparedStatement pStmnt2 = cnnct.prepareStatement(preQueryStatement2);
                pStmnt2.setString(1, rs.getString("order_ID"));
                ResultSet rs2 = pStmnt2.executeQuery();
                ArrayList<ProductBean> products = new ArrayList<ProductBean>();
                ProductDB prodDB = new ProductDB(url, username, password);
                while (rs2.next()) {
                    //set productBean
                    ProductBean pb = prodDB.getProductById(rs2.getInt("p_id"));
                    pb.setP_qty(rs2.getInt("p_qty"));
                    products.add(pb);
                }
                ob.setProducts(products);
                obs.add(ob);
            }
            pStmnt.close();
            cnnct.close();
        } catch (SQLException ex) {
            while (ex != null) {
                ex.printStackTrace();
                ex = ex.getNextException();
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return obs;
    }

    //just show the order information, dont show order's product and its customer
    public ArrayList<OrderBean> getAllOrder() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM  ORDERS";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //Statement s = cnnct.createStatement();
            ResultSet rs = pStmnt.executeQuery();

            ArrayList list = new ArrayList();

            while (rs.next()) {
                OrderBean ob = new OrderBean();
                ob.setOrder_id(rs.getInt("ORDER_ID"));
                ob.setDeliever_add(rs.getString("deliever_add"));
                ob.setDeliever_date(rs.getDate("deliever_date"));
                ob.setOrder_option(rs.getString("order_option"));
                ob.setOrder_state(rs.getString("order_state"));
                ob.setDeliever_time(rs.getDate("order_time"));
                ob.setOrder_qty(rs.getInt("order_qty"));
                list.add(ob);
            }
            return list;
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
        return null;
    }

    public OrderBean getOrderByOrderId(int id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM  ORDERS WHERE ORDER_ID=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1,id);
            //Statement s = cnnct.createStatement();
            ResultSet rs = pStmnt.executeQuery();
            OrderBean ob = new OrderBean();
            while (rs.next()) {
                ob.setOrder_id(rs.getInt("ORDER_ID"));
                ob.setDeliever_add(rs.getString("deliever_add"));
                ob.setDeliever_date(rs.getDate("deliever_date"));
                ob.setOrder_option(rs.getString("order_option"));
                ob.setOrder_state(rs.getString("order_state"));
                ob.setDeliever_time(rs.getDate("order_time"));
                ob.setOrder_qty(rs.getInt("order_qty"));
            }
            return ob;
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
        return null;
    }
}
