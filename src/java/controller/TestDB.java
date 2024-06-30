/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.AccountDAO;
import dal.CartDAO;
import dal.IngredientDAO;
import dal.SubcategoryDAO;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
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
    
//        ArrayList<Ingredient> list = db.searchIngredient("thịt", null, null, null, null,
//                        "1", 3);
//        for (Ingredient x : list) {
//            System.out.println(x.getIngredientId()+ " " + x.getCategoryId()+ " " + x.getIngredientName());
//        }

//        SubcategoryDAO subdb = new SubcategoryDAO();
//        ArrayList<Subcategory> list = subdb.getAllSubcategory();
//        for (Subcategory x : list) {
//            System.out.println(x.getSubcategoryName());
//            System.out.println(x.getCategoryId());
//        }

        CartDAO cartdb = new CartDAO();
//        List<Cart> cart = cartdb.getCartOfAUser(1);
//        for (Cart x : cart) {
//            System.out.println(x.getIngredient().getIngredientId());
//            System.out.println(x.getIngredient().getIngredientName());
//            System.out.println(x.getQuantity());
//        }
//        System.out.println(cartdb.countItemsInCartOfUser(2));
        
       // cartdb.addAnIngredientToCart(1, 2, 2);
//        cartdb.addAnIngredientToCart(1, 2, 1);
        cartdb.removeItemFromUserCart(1, 2);

//        AccountDAO accountdb = new AccountDAO();
//        System.out.println(accountdb.getAccount("user1", "a123456").getUsername());
    }
}
