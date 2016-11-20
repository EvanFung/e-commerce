/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.util.ArrayList;

/**
 *
 * @author EVANFUNG
 */
public class ShoppingCartBean {

    private ArrayList<ProductBean> products = new ArrayList<ProductBean>();

    public ShoppingCartBean() {
    }

    public ArrayList<ProductBean> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<ProductBean> products) {
        this.products = products;
    }

    public void removeProduct(String p_id) {
        for (ProductBean p : products) {
            if (p.getId().equals(p_id)) {
                products.remove(p);
            }
        }
    }

}
