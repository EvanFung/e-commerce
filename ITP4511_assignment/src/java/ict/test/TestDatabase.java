/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.test;

import ict.db.CustomerDB;
import java.io.IOException;
import java.sql.SQLException;

/**
 *
 * @author EVANFUNG
 */
public class TestDatabase {
    public static void main(String [] args) throws SQLException, IOException {
        String url = "jdbc:mysql://localhost:3307/ITP4912_DB?autoReconnect=true&useSSL=false";
        String username = "root";
        String password = "root";
        CustomerDB custDb = new CustomerDB(url, username, password);
        custDb.createCustTable();
    }
}
