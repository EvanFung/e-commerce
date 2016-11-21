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
    private int p_id;
    //product name
    private String p_name;
    //product descriptions
    private String descriptions;
    //product price
    private String price;
    //product picture path
    private String picturePath;
    //in which category
    private int cat_id;
    //the one who design this product
    private String designer_name;
    //customer select quantity
    private int p_qty;
    //product color
    private String color;
    private String size;
    private String brand;

    public ProductBean() {
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }



    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    public int getCat_id() {
        return cat_id;
    }

    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
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

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }
    
    
}
