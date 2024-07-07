/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;

/**
 *
 * @author BKC
 */
public class OrderDetail {
     private String orderId;
     private int ingredientId;
     private Ingredient ingredient;
     private int quantity;
     private BigDecimal price;

    public OrderDetail() {
    }

    public OrderDetail(String orderId, int ingredientId, int quantity, BigDecimal price) {
        this.orderId = orderId;
        this.ingredientId = ingredientId;
        this.quantity = quantity;
        this.price = price;
    }

    public OrderDetail(String orderId, Ingredient ingredient, int quantity, BigDecimal price) {
        this.orderId = orderId;
        this.ingredient = ingredient;
        this.quantity = quantity;
        this.price = price;
    }
    

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public int getIngredientId() {
        return ingredientId;
    }

    public void setIngredientId(int ingredientId) {
        this.ingredientId = ingredientId;
    }

    public Ingredient getIngredient() {
        return ingredient;
    }

    public void setIngredient(Ingredient ingredient) {
        this.ingredient = ingredient;
    }

    
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }
     
     
     
}
