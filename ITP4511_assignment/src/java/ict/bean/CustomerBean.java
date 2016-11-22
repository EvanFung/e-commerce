/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ict.bean;

import java.io.*;

/**
 *
 * @author Chris
 */
public class CustomerBean implements Serializable{
    private String username, password, email, first_name, last_name, gender, dob, address,role;
    private int bonusPoint;
    private int custid;
    public CustomerBean(){ 
    }
    
    public void setUsername(String username){
        this.username = username;
    }
    
    public void setPassword(String password){
        this.password = password;
    }
    
    public void setEmail(String email){
        this.email = email;
    }
    
    public void setFirst_name(String first_name){
        this.first_name = first_name;
    }
    
    public void setLast_name(String last_name){
        this.last_name = last_name;
    }
    
    public void setGender(String gender){
        this.gender = gender;
    }
    
    public void setDob(String dob){
        this.dob = dob;
    }
    
    public void setAddress(String address){
        this.address = address;
    }
    
    public String getUsername(){
        return username;
    }
    
    public String getPassword(){
        return password;
    }
    
    public String getEmail(){
        return email;
    }
    
    public String getFirst_name(){
        return first_name;
    }
    
    public String getLast_name(){
        return last_name;
    }
    
    public String getGender(){
        return gender;
    }
    
    public String getDob(){
        return dob;
    }
    
    public String getAddress(){
        return address;
    }

    public int getBonusPoint() {
        return bonusPoint;
    }

    public void setBonusPoint(int bonusPoint) {
        this.bonusPoint = bonusPoint;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public int getCustid() {
        return custid;
    }

    public void setCustid(int custid) {
        this.custid = custid;
    }
    
}
