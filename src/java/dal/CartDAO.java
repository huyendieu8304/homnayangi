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
                + "      i.ingredient_name, i.[unit], i.[quantity_per_unit],\n"
                + "      i.price, i.stock_quantity, i.image_url\n"
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
                String unit = rs.getString("unit");
                float quantityPerUnit = rs.getFloat("quantity_per_unit");
                BigDecimal price = rs.getBigDecimal("price");
                int stockQuantity = rs.getInt("stock_quantity");
                String imageUrl = rs.getString("image_url");
                Ingredient i = new Ingredient(ingredientId, ingredientName, unit,
                        quantityPerUnit, price, stockQuantity, imageUrl);

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
    //SELECT COUNT(*) FROM [dbo].[Cart] WHERE [account_id] = 2
    public int countItemsInCartOfUser(int accountId) {
        String sql = "SELECT COUNT(*) FROM [dbo].[Cart] WHERE [account_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            System.out.println("Having error while retrieve number of items in user's cart");
            System.out.println(e);
        }

        return 0;
    }

    private int getQuantityOfAnIngredientInCart(int ingredientId, int accountId) {
        String sql = "SELECT [quantity] FROM [dbo].[Cart] "
                + "WHERE [account_id] = ? and [ingredient_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);
            st.setInt(2, ingredientId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            System.out.println("Having error while retrieve number of items in user's cart");
            System.out.println(e);
        }
        return 0;
    }

    public void addAnIngredientToCart(int accountId, int ingredientId, int addingQuantity) {
        int quantity = getQuantityOfAnIngredientInCart(ingredientId, accountId);

        //ingredient has NOT existed in the cart
        if (quantity == 0) {
            quantity = addingQuantity;

            String sql = "INSERT INTO [dbo].[Cart]\n"
                    + "           ([account_id]\n"
                    + "           ,[ingredient_id]\n"
                    + "           ,[quantity])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, accountId);
                st.setInt(2, ingredientId);
                st.setInt(3, quantity);
                st.executeUpdate();
            } catch (Exception e) {
                System.out.println("Having error while adding an ingredient to the cart");
                System.out.println(e);
            }

        } else { //ingredient existed in the cart
            quantity += addingQuantity;
            String sql = "UPDATE [dbo].[Cart]\n"
                    + "   SET [quantity] = ?"
                    + " WHERE [account_id] = ? and [ingredient_id] = ?";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setInt(1, quantity);
                st.setInt(2, accountId);
                st.setInt(3, ingredientId);
                st.executeUpdate();
            } catch (Exception e) {
                System.out.println("Having error while modify quantity of an ingredient in the cart");
                System.out.println(e);
            }
        }
    }
}
