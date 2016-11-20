/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.test;

import ict.db.*;

import java.io.IOException;
import java.sql.SQLException;

/**
 *
 * @author EVANFUNG
 */
public class TestDatabase {

    public static void main(String[] args) throws SQLException, IOException {
        String url = "jdbc:derby://localhost:1527/ITP4912_DB";
        String username = "APP";
        String password = "APP";
//        GiftDB db = new GiftDB(url,username,password);
//        db.createGiftTable();

//        OrderDB db = new OrderDB(url, username, password);
//        CategoryDB db = new CategoryDB(url, username, password);
//        CustomerDB db = new CustomerDB(url, username, password);
//        Category_ProductDB db = new Category_ProductDB(url, username, password); .....test to create the database by yourself, it should work.

    }
}
