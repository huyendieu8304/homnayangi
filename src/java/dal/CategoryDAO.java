/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author BKC
 */
public class CategoryDAO extends DBContext {

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList<>();
        String sql = "SELECT [category_id]\n"
                + "      ,[category_name]\n"
                + "  FROM [dbo].[Category]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int categoryId = rs.getInt("category_id");
                String categoryName = rs.getString("category_name");

                Category c = new Category(categoryId, categoryName);
                list.add(c);
            }

        } catch (Exception e) {
            System.out.println("Having error while retrive all cateogries");

        }
        return list;
    }

    public String getCategoryNameById(int id) {
        String categoryName = "";
        String sql = "SELECT [category_name]\n"
                + "  FROM [dbo].[Category] WHERE category_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                categoryName = rs.getString("category_name");
            }
        } catch (Exception e) {
            System.out.println("Having error while retrive category's name by id");
        }
        
        
        return categoryName;
    }
}
