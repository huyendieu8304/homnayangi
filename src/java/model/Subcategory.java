/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author BKC
 */
public class Subcategory {
    private int subcategoryId;
    private int categoryId;
    private String subcategoryName;

    public Subcategory() {
    }

    public Subcategory(int categoryId, String subcategoryName) {
        this.categoryId = categoryId;
        this.subcategoryName = subcategoryName;
    }

        
    public Subcategory(int subcategoryId, int categoryId, String subcategoryName) {
        this.subcategoryId = subcategoryId;
        this.categoryId = categoryId;
        this.subcategoryName = subcategoryName;
    }

    public int getSubcategoryId() {
        return subcategoryId;
    }

    public void setSubcategoryId(int subcategoryId) {
        this.subcategoryId = subcategoryId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getSubcategoryName() {
        return subcategoryName;
    }

    public void setSubcategoryName(String subcategoryName) {
        this.subcategoryName = subcategoryName;
    }
    
    
    
}
