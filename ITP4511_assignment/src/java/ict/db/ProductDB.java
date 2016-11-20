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
    
    public ProductDB(String url, String username, String password){
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
        if(!tableExist(getConnection(),"PRODUCT")){
            try {
                cnnct = getConnection();  // the connection 
                stmnt = cnnct.createStatement();  // create statement
                String sql = "create table PRODUCT ("
                        + "Id int primary key generated always as identity, "
                        + "Name  VARCHAR(30),  "
                        + "Description  VARCHAR(30), "
                        + "Price  VARCHAR(30), "
                        + "Color  VARCHAR(30), "
                        + "Size  VARCHAR(30), "
                        + "Brand  VARCHAR(30), "
                        + "Image  VARCHAR(30)) ";
                        
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
        }else{
            return;
        }
    }
    
     public boolean addProduct(String Name, String Description, String Price, String Color, String Size, String Brand, String Image) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT  INTO  PRODUCT (Name, Description, Price, Color, Size, Brand, Image) VALUES  (?,?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, Name);
            pStmnt.setString(2, Description);
            pStmnt.setString(3, Price);
            pStmnt.setString(4, Color);
            pStmnt.setString(5, Size);
            pStmnt.setString(6, Brand);
            pStmnt.setString(7, Image);
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
    
    public ArrayList <ProductBean> getAllProduct(){
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
                pb.setId(rs.getString(1));
                pb.setName(rs.getString(2));
                pb.setPrice(rs.getString(3));
                pb.setDescription(rs.getString(4));
                pb.setColor(rs.getString(5));
                pb.setSize(rs.getString(6));
                pb.setBrand(rs.getString(7));
                pb.setImage(rs.getString(8));
                
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
}
