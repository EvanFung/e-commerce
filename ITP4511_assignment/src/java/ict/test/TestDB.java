/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.test;

import ict.db.OrderDB;
import java.io.IOException;
import java.sql.SQLException;

/**
 *
 * @author fengwenhao
 */
public class TestDB {
    public static void main(String[] agrs) throws SQLException, IOException {
      String url = "jdbc:derby://localhost:1527/ITP4912_DB";
      String username = "APP";
      String password = "APP";
      OrderDB db = new OrderDB(url,username,password);
      db.createOrderTable();
      
    }
}
