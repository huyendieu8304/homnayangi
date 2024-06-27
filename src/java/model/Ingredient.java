/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

/**
 *
 * @author BKC
 */
public class Ingredient {

//    [ingredient_id] [int] IDENTITY(1,1) NOT NULL,
//	[ingredient_name] [nvarchar](100) NOT NULL,
//	[category_id] [int] NOT NULL,
//	[subcategory_id] [int] NULL,
//	[unit] [nvarchar](50) NOT NULL,
//	[quantity_per_unit] [float] NOT NULL,
//	[price] [float] NOT NULL,
//	[stock_quantity] [int] NOT NULL,
//	[image_url] [nvarchar](100) NOT NULL,
    private int ingredientId;
    private String ingredientName;
    private int categoryId;
    private int subcategoryId;
    private String unit;
    private float quantityPerUnit;
    private BigDecimal price;
    private int stockQuantity;
    private String imageUrl;

    public Ingredient() {
    }

    //constructor missing id 
    public Ingredient(String ingredientName, int categoryId, int subcategoryId,
            String unit, float quantityPerUnit, BigDecimal price, int stockQuantity,
            String imageUrl) {
        this.ingredientName = ingredientName;
        this.categoryId = categoryId;
        this.subcategoryId = subcategoryId;
        this.unit = unit;
        this.quantityPerUnit = quantityPerUnit;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.imageUrl = imageUrl;
    }

    //constructor for cart
    public Ingredient(int ingredientId, String ingredientName, BigDecimal price, int stockQuantity, String imageUrl) {
        this.ingredientId = ingredientId;
        this.ingredientName = ingredientName;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.imageUrl = imageUrl;
    }

    //full field constructor
    public Ingredient(int ingredientId, String ingredientName, int categoryId, int subcategoryId, String unit, float quantityPerUnit, BigDecimal price, int stockQuantity, String imageUrl) {
        this.ingredientId = ingredientId;
        this.ingredientName = ingredientName;
        this.categoryId = categoryId;
        this.subcategoryId = subcategoryId;
        this.unit = unit;
        this.quantityPerUnit = quantityPerUnit;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.imageUrl = imageUrl;
    }

    public int getIngredientId() {
        return ingredientId;
    }

    public void setIngredientId(int ingredientId) {
        this.ingredientId = ingredientId;
    }

    public String getIngredientName() {
        return ingredientName;
    }

    public void setIngredientName(String ingredientName) {
        this.ingredientName = ingredientName;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getSubcategoryId() {
        return subcategoryId;
    }

    public void setSubcategoryId(int subcategoryId) {
        this.subcategoryId = subcategoryId;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public float getQuantityPerUnit() {
        return quantityPerUnit;
    }

    public String getQuantityPerUnitFormatted() {
        DecimalFormat decimalFormat = new DecimalFormat("#.##"); // # là số tùy chọn, .## là số sau dấu thập phân tùy chọn
        return decimalFormat.format(quantityPerUnit);
    }

    public void setQuantityPerUnit(float quantityPerUnit) {
        this.quantityPerUnit = quantityPerUnit;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public String getFormattedPrice() {
        
        DecimalFormat formatter = new DecimalFormat("##,###,###.###");
        return formatter.format(price);
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

}
