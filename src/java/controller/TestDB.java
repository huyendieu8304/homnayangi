/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.IngredientDAO;
import dal.SubcategoryDAO;
import java.util.ArrayList;
import model.Ingredient;
import model.Subcategory;

/**
 *
 * @author BKC
 */
public class TestDB {
    public static void main(String[] args) {
        IngredientDAO db = new IngredientDAO();
//        Ingredient a = db.getIngredientById(98);
//        
//        System.out.println(a.getIngredientName());
//        System.out.println(a.getImageUrl());
//        System.out.println(a.getSubcategoryId());
//        System.out.println(db.countIngredient(null, "1", null, null, null));
    
        ArrayList<Ingredient> list = db.searchIngredient("thịt", null, null, null, null,
                        "1", 3);
        for (Ingredient x : list) {
            System.out.println(x.getIngredientId()+ " " + x.getCategoryId()+ " " + x.getIngredientName());
        }

//        SubcategoryDAO subdb = new SubcategoryDAO();
//        ArrayList<Subcategory> list = subdb.getAllSubcategory();
//        for (Subcategory x : list) {
//            System.out.println(x.getSubcategoryName());
//            System.out.println(x.getCategoryId());
//        }
    }
}
