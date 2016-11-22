/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.ProductBean;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Chris
 */
public class ProductDB {

    private String url = "";
    private String username = "";
    private String password = "";

    public ProductDB(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public Connection getConnection() throws SQLException, IOException {
        System.setProperty("jdbc.drivers", "org.apache.derby.jdbc.ClientDriver");
        return DriverManager.getConnection(url, username, password);
    }

    public void createCustTable() throws SQLException, IOException {
        Connection cnnct = null;
        Statement stmnt = null;
        if (!tableExist(getConnection(), "PRODUCT")) {
            try {
                cnnct = getConnection();  // the connection 
                stmnt = cnnct.createStatement();  // create statement
                String sql = "create table PRODUCT ("
                        + "p_id int primary key generated always as identity, "
                        + "p_name  VARCHAR(30),"
                        + "descriptions  VARCHAR(30), "
                        + "price  VARCHAR(30), "
                        + "picturePath VARCHAR(200),"
                        + "Color  VARCHAR(30), "
                        + "Size  VARCHAR(30), "
                        + "Brand  VARCHAR(30),"
                        + "cat_id int,"
                        + "designer_name VARCHAR(30),"
                        + "p_qty INT"
                        + ") ";

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
            return;
        }
    }

    public boolean addProduct(String Name, String Description, String Price, String Color, String Size, String Brand, String Image, int cat_id, String designer_name, int p_qty) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT  INTO  PRODUCT (p_name, descriptions, price, picturePath, Color, Size, Brand,cat_id,designer_name,p_qty) VALUES  (?,?,?,?,?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, Name);
            pStmnt.setString(2, Description);
            pStmnt.setString(3, Price);
            pStmnt.setString(4, Image);
            pStmnt.setString(5, Color);
            pStmnt.setString(6, Size);
            pStmnt.setString(7, Brand);
            pStmnt.setInt(8, cat_id);
            pStmnt.setString(9, designer_name);
            pStmnt.setInt(10, p_qty);
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
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
        return isSuccess;
    }

    public ArrayList<ProductBean> getProductBySearchKey(String key) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM  PRODUCT WHERE "
                    + "P_NAME LIKE ?"
                    + " OR DESCRIPTIONS LIKE ?"
                    + " OR PRICE LIKE ?"
                    + " OR COLOR LIKE ?"
                    + " OR BRAND LIKE ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, "%" + key + "%");
            pStmnt.setString(2, "%" + key + "%");
            pStmnt.setString(3, "%" + key + "%");
            pStmnt.setString(4, "%" + key + "%");
            pStmnt.setString(5, "%" + key + "%");

            //Statement s = cnnct.createStatement();
            ResultSet rs = pStmnt.executeQuery();

            ArrayList list = new ArrayList();

            while (rs.next()) {
                ProductBean pb = new ProductBean();
                pb.setP_id(rs.getInt(1));
                pb.setP_name(rs.getString(2));
                pb.setPrice(rs.getString(4));
                pb.setDescriptions(rs.getString(3));
                pb.setPicturePath(rs.getString(5));

                pb.setColor(rs.getString(6));
                pb.setSize(rs.getString(7));
                pb.setBrand(rs.getString(8));
                pb.setCat_id(rs.getInt(9));
                pb.setDesigner_name(rs.getString(10));

                list.add(pb);
            }
            System.out.print(list.size());
            pStmnt.close();
            cnnct.close();
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

    public ArrayList<ProductBean> getAllProduct() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM  PRODUCT";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //Statement s = cnnct.createStatement();
            ResultSet rs = pStmnt.executeQuery();

            ArrayList list = new ArrayList();

            while (rs.next()) {
                ProductBean pb = new ProductBean();
                pb.setP_id(rs.getInt(1));
                pb.setP_name(rs.getString(2));
                pb.setPrice(rs.getString(4));
                pb.setDescriptions(rs.getString(3));
                pb.setPicturePath(rs.getString(5));

                pb.setColor(rs.getString(6));
                pb.setSize(rs.getString(7));
                pb.setBrand(rs.getString(8));
                pb.setCat_id(rs.getInt(9));
                pb.setDesigner_name(rs.getString(10));

                list.add(pb);
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

    public int dropProductTable() {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "DROP TABLE PRODUCT";
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

    public ProductBean getProductById(int id) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM  PRODUCT WHERE P_ID = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, id);
            //Statement s = cnnct.createStatement();
            ResultSet rs = pStmnt.executeQuery();

            ProductBean pb = new ProductBean();
            while (rs.next()) {
                pb.setP_id(rs.getInt(1));
                pb.setP_name(rs.getString(2));
                pb.setPrice(rs.getString(4));
                pb.setDescriptions(rs.getString(3));
                pb.setPicturePath(rs.getString(5));

                pb.setColor(rs.getString(6));
                pb.setSize(rs.getString(7));
                pb.setBrand(rs.getString(8));
                pb.setCat_id(rs.getInt(9));
                pb.setDesigner_name(rs.getString(10));
            }
            return pb;
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
    
        public ArrayList<ProductBean> getProductByCustId(int cid) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        try {
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM  PRODUCT WHERE cat_id = ?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setInt(1, cid);
            //Statement s = cnnct.createStatement();
            ResultSet rs = pStmnt.executeQuery();
            
            ArrayList list = new ArrayList();

            while (rs.next()) {
                ProductBean pb = new ProductBean();
                pb.setP_id(rs.getInt(1));
                pb.setP_name(rs.getString(2));
                pb.setPrice(rs.getString(4));
                pb.setDescriptions(rs.getString(3));
                pb.setPicturePath(rs.getString(5));

                pb.setColor(rs.getString(6));
                pb.setSize(rs.getString(7));
                pb.setBrand(rs.getString(8));
                pb.setCat_id(rs.getInt(9));
                pb.setDesigner_name(rs.getString(10));

                list.add(pb);
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
}
