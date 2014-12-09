/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.POJOs;

/**
 *
 * @author birui
 */
public class PostSearcher extends Post{
    float minPrice;
    float maxPrice;
    String[] types;

    public float getMinPrice() {
        return minPrice;
    }

    public float getMaxPrice() {
        return maxPrice;
    }

    public String[] getTypes() {
        return types;
    }

    public void setMinPrice(float minPrice) {
        this.minPrice = minPrice;
    }

    public void setMaxPrice(float maxPrice) {
        this.maxPrice = maxPrice;
    }

    public void setTypes(String[] types) {
        this.types = types;
    }
    
}
