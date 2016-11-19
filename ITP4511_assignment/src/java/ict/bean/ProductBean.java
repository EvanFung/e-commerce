/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.io.Serializable;

/**
 *
 * @author EVANFUNG
 */
public class ProductBean implements Serializable{
    //product id
    private String p_id;
    //product name
    private String p_name;
    //product descriptions
    private String descriptions;
    //product price
    private double price;
    //product picture path
    private String picturePath;
    //in which category
    private CategoryBean c_id;
    //the one who design this product
    private String designer_name;
    //customer select quantity
    private int p_qty;

    public ProductBean() {
    }

    public ProductBean(String p_id, String p_name, String descriptions, double price, String picturePath, CategoryBean c_id, String designer_name, int p_qty) {
        this.p_id = p_id;
        this.p_name = p_name;
        this.descriptions = descriptions;
        this.price = price;
        this.picturePath = picturePath;
        this.c_id = c_id;
        this.designer_name = designer_name;
        this.p_qty = p_qty;
    }

    public String getP_id() {
        return p_id;
    }

    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getDescriptions() {
        return descriptions;
    }

    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    public CategoryBean getC_id() {
        return c_id;
    }

    public void setC_id(CategoryBean c_id) {
        this.c_id = c_id;
    }

    public String getDesigner_name() {
        return designer_name;
    }

    public void setDesigner_name(String designer_name) {
        this.designer_name = designer_name;
    }

    public int getP_qty() {
        return p_qty;
    }

    public void setP_qty(int p_qty) {
        this.p_qty = p_qty;
    }
    
    
}
