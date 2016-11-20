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
public class GiftBean implements Serializable{
    //gift id
    private String id;
    //gift name
    private String name;
    //gifpicture Path
    private String picturePath;
    //requires amount of bonus
    private int bonus;

    public GiftBean() {
    }

    public GiftBean(String id, String name, String picturePath, int bonus) {
        this.id = id;
        this.name = name;
        this.picturePath = picturePath;
        this.bonus = bonus;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    public int getBonus() {
        return bonus;
    }

    public void setBonus(int bonus) {
        this.bonus = bonus;
    }  
}