/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.IngredientDAO;
import model.Ingredient;

/**
 *
 * @author BKC
 */
public class TestDB {
    public static void main(String[] args) {
        IngredientDAO db = new IngredientDAO();
        Ingredient a = db.getIngredientById(98);
        
        System.out.println(a.getIngredientName());
        System.out.println(a.getImageUrl());
        System.out.println(a.getSubcategoryId());
    }
}
