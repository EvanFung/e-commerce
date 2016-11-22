/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.test;

import ict.bean.*;
import ict.db.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

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
//        db.createOrderTable();
//        Order_ProductDB db = new Order_ProductDB(url, username, password);
//        db.createOrder_ProductTable();
//        CategoryDB db = new CategoryDB(url, username, password);
//        CustomerDB db = new CustomerDB(url, username, password);
//        CustomerBean c = db.getCustIdById(1);
//        System.out.println(c.getFirst_name());
//        Category_ProductDB db = new Category_ProductDB(url, username, password);
//        db.createCategory_ProductTable();
//          ProductDB pb = new ProductDB(url,username,password);
//          pb.createCustTable();

        //use custid to search multi products
        CustomerDB db = new CustomerDB(url, username, password);
        int custid = db.getCustIdByEmail("1@a.com");
        OrderDB odb = new OrderDB(url, username, password);
        ArrayList<OrderBean>obs = odb.queryMyOrders(custid);
        System.out.println(obs.size());
        for(OrderBean ob : obs) {
            ArrayList<ProductBean>pb = ob.getProducts();
            for(ProductBean p :pb) {
                System.out.println(p.getPicturePath());
            }
        }
    }
}
