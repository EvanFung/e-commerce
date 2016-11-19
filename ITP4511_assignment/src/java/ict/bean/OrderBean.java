/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author EVANFUNG
 */
public class OrderBean implements Serializable{
    //order id
    private Integer order_id;
    //an order may has one to many products.
    private ArrayList<ProductBean> products;
    //an order has one customer
    private CustomerBean customer;
    //order of total quantity
    private Integer order_qty;
    //order time
    private Date deliever_time;
    //order date
    private Date deliever_date;
    //deliever address
    private String deliever_add;
    //order state :canceled, delivered, picked-up, delay pickup date.
    private String order_state;
    //self pickup or deliever
    private String order_option;

    public OrderBean() {
    }

    public OrderBean(Integer order_id, ArrayList<ProductBean> products, CustomerBean customer, Integer order_qty, Date deliever_time, Date deliever_date, String deliever_add, String order_state, String order_option) {
        this.order_id = order_id;
        this.products = products;
        this.customer = customer;
        this.order_qty = order_qty;
        this.deliever_time = deliever_time;
        this.deliever_date = deliever_date;
        this.deliever_add = deliever_add;
        this.order_state = order_state;
        this.order_option = order_option;
    }

    public Integer getOrder_id() {
        return order_id;
    }

    public void setOrder_id(Integer order_id) {
        this.order_id = order_id;
    }

    public ArrayList<ProductBean> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<ProductBean> products) {
        this.products = products;
    }

    public CustomerBean getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerBean customer) {
        this.customer = customer;
    }

    public Integer getOrder_qty() {
        return order_qty;
    }

    public void setOrder_qty(Integer order_qty) {
        this.order_qty = order_qty;
    }

    public Date getDeliever_time() {
        return deliever_time;
    }

    public void setDeliever_time(Date deliever_time) {
        this.deliever_time = deliever_time;
    }

    public Date getDeliever_date() {
        return deliever_date;
    }

    public void setDeliever_date(Date deliever_date) {
        this.deliever_date = deliever_date;
    }

    public String getDeliever_add() {
        return deliever_add;
    }

    public void setDeliever_add(String deliever_add) {
        this.deliever_add = deliever_add;
    }

    public String getOrder_state() {
        return order_state;
    }

    public void setOrder_state(String order_state) {
        this.order_state = order_state;
    }

    public String getOrder_option() {
        return order_option;
    }

    public void setOrder_option(String order_option) {
        this.order_option = order_option;
    }
    
    
}
