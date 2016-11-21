/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.db;

import ict.bean.CustomerBean;
import java.io.IOException;
import java.sql.*;

public class CustomerDB {
    private String url = "";
    private String username = "";
    private String password = "";
    
    public CustomerDB(String url, String username, String password){
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
        if(!tableExist(getConnection(),"CUSTOMER")){
            try {
                cnnct = getConnection();  // the connection 
                stmnt = cnnct.createStatement();  // create statement
                String sql = "create table CUSTOMER ("
                        + "CustId int primary key generated always as identity, "
                        + "Password  VARCHAR(30),  "
                        + "Email  VARCHAR(30), "
                        + "First_name  VARCHAR(30), "
                        + "Last_name  VARCHAR(30), "
                        + "Gender  VARCHAR(1), "
                        +"bonusPoint INT,"
                        + "Address VARCHAR(100))";
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
    
    public boolean addCustomer(String password, String email, String first_name, String last_name, String gender, String address){
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "INSERT  INTO  CUSTOMER (Email, Password, First_name, Last_name, Gender, Address)  VALUES  (?,?,?,?,?,?)";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, email);
            pStmnt.setString(2, password);
            pStmnt.setString(3, first_name);
            pStmnt.setString(4, last_name);
            pStmnt.setString(5, gender);
            pStmnt.setString(6, address);
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
    public CustomerBean queryCustByEmail(String email) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;

        CustomerBean cb = null;
        try {
            //1.  get Connection
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM  CUSTOMER WHERE Email=?";
            //2.  get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //3. update the placehoder with id
            pStmnt.setString(1, email);
            ResultSet rs = null;
            //4. execute the query and assign to the result 
            rs = pStmnt.executeQuery();
            if (rs.next()) {
                cb = new CustomerBean();
                // set the record detail to the customer bean
                cb = new CustomerBean();
                cb.setEmail(rs.getString(3));
                cb.setPassword(rs.getString(2));
                cb.setFirst_name(rs.getString(4));
                cb.setLast_name(rs.getString(5));
                cb.setGender(rs.getString(6));
                cb.setAddress(rs.getString(8));
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
        return cb;
    }
    public boolean editPassword(String email, String password) {
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isSuccess = false;
        try {
            cnnct = getConnection();
            String preQueryStatement = "UPDATE CUSTOMER SET Password=? WHERE Email=?";
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            pStmnt.setString(1, password);
            pStmnt.setString(2, email);
            //Statement s = cnnct.createStatement();
            int rowCount = pStmnt.executeUpdate();
            if (rowCount >= 1) {
                isSuccess = true;
            }
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
        return isSuccess;
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
    
    public boolean login(String username, String password){
        Connection cnnct = null;
        PreparedStatement pStmnt = null;
        boolean isTrue = false;
        try {
            //1.  get Connection
            cnnct = getConnection();
            String preQueryStatement = "SELECT * FROM  CUSTOMER WHERE EMAIL=? AND PASSWORD=?";
            //2.  get the prepare Statement
            pStmnt = cnnct.prepareStatement(preQueryStatement);
            //3. update the placehoder with id
            pStmnt.setString(1, username);
            pStmnt.setString(2, password);
            ResultSet rs = null;
            
            //4. execute the query and assign to the result 
            rs = pStmnt.executeQuery();
            
            int count = 0;

            if (rs.next()) {
                ++count;
                isTrue = true;
            }

            if (count == 0) {
                isTrue = false;
            }


            System.out.println("Total rows for the query: "+count);


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
        return isTrue;
    }
}
