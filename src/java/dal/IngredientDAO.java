/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Ingredient;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author BKC
 */
public class IngredientDAO extends DBContext {

    public Ingredient getIngredientById(int id) {
        String sql = "SELECT [ingredient_id]\n"
                + "      ,[ingredient_name]\n"
                + "      ,[category_id]\n"
                + "      ,[subcategory_id]\n"
                + "      ,[unit]\n"
                + "      ,[quantity_per_unit]\n"
                + "      ,[price]\n"
                + "      ,[stock_quantity]\n"
                + "      ,[image_url]\n"
                + "  FROM [dbo].[Ingredient] WHERE ingredient_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int ingredientId = rs.getInt("ingredient_id");
                String ingredientName = rs.getString("ingredient_name");
                int categoryId = rs.getInt("category_id");
                int subcategoryId = rs.getInt("subcategory_id");
                String unit = rs.getString("unit");
                float quantityPerUnit = rs.getFloat("quantity_per_unit");
                float price = rs.getFloat("price");
                int stockQuantity = rs.getInt("stock_quantity");
                String imageUrl = rs.getString("image_url");

                Ingredient i = new Ingredient(ingredientId, ingredientName,
                        categoryId, subcategoryId, unit, quantityPerUnit, price, stockQuantity, imageUrl);
                return i;
            }
        } catch (Exception e) {
            System.out.println("Having error while retrieve ingredient's information");
        }

        return null;
    }

    public void addAnIngredient(Ingredient x) {
        String sql = "INSERT INTO [dbo].[Ingredient]\n"
                + "           ([ingredient_name]\n"
                + "           ,[category_id]\n"
                + "           ,[subcategory_id]\n"
                + "           ,[unit]\n"
                + "           ,[quantity_per_unit]\n"
                + "           ,[price]\n"
                + "           ,[stock_quantity]\n"
                + "           ,[image_url])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, x.getIngredientName());
            st.setInt(2, x.getCategoryId());
            st.setInt(3, x.getSubcategoryId());
            st.setString(4, x.getUnit());
            st.setFloat(5, x.getQuantityPerUnit());
            st.setFloat(6, x.getPrice());
            st.setInt(7, x.getStockQuantity());
            st.setString(8, x.getImageUrl());

            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("Having error while add a new ingredient");
        }
    }

    public void updateAnIngredientById(int id, Ingredient x) {
        String sql = "UPDATE [dbo].[Ingredient]\n"
                + "   SET [ingredient_name] = ?\n"
                + "      ,[category_id] = ?\n"
                + "      ,[subcategory_id] = ?\n"
                + "      ,[unit] = ?\n"
                + "      ,[quantity_per_unit] = ?\n"
                + "      ,[price] = ?\n"
                + "      ,[stock_quantity] = ?\n"
                + "      ,[image_url] = ?\n"
                + " WHERE ingredient_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, x.getIngredientName());
            st.setInt(2, x.getCategoryId());
            st.setInt(3, x.getSubcategoryId());
            st.setString(4, x.getUnit());
            st.setFloat(5, x.getQuantityPerUnit());
            st.setFloat(6, x.getPrice());
            st.setInt(7, x.getStockQuantity());
            st.setString(8, x.getImageUrl());
            st.setInt(9, x.getIngredientId());
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("Having error while update an ingredient");
        }
    }

    //set status to not display to the customer;
    public void deleteAnIngredientById(int id) {
        String sql = "DELETE FROM [dbo].[Ingredient]\n"
                + "      WHERE ingredient_id = ?";
    }

}
