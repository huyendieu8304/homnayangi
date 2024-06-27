/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Cart;
import model.Ingredient;

/**
 *
 * @author BKC
 */
public class CartDAO extends DBContext {

    //get the cart of one user using account id
    public List<Cart> getCartOfAUser(int accountId) {
        ArrayList<Cart> userCart = new ArrayList<>();
        String sql = "SELECT i.[ingredient_id] ,[quantity],"
                + "      i.ingredient_name, i.price, i.stock_quantity,"
                + "      i.image_url\n"
                + "  FROM [dbo].[Cart] c INNER JOIN [dbo].[Ingredient] i\n"
                + "       ON c.ingredient_id = i.ingredient_id"
                + " WHERE [account_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int quantity = rs.getInt("quantity");
                
                int ingredientId = rs.getInt("ingredient_id");
                String ingredientName = rs.getString("ingredient_name");
                BigDecimal price = rs.getBigDecimal("price");
                int stockQuantity = rs.getInt("stock_quantity");
                String imageUrl = rs.getString("image_url");
                Ingredient i = new Ingredient(ingredientId, ingredientName, price, stockQuantity, imageUrl);
                
                Cart c = new Cart(accountId, i, quantity);
                userCart.add(c);
            }
        } catch (Exception e) {
            System.out.println("Having error while retrive user cart");
            System.out.println(e);
        }
        return userCart;
    }
    
    //get the number of items in user's cart
}
