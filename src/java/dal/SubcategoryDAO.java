/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Subcategory;

/**
 *
 * @author BKC
 */
public class SubcategoryDAO extends DBContext {

    public ArrayList<Subcategory> getAllSubcategory() {
        ArrayList<Subcategory> list = new ArrayList<>();
        String sql = "SELECT [subcategory_id]\n"
                + "      ,[category_id]\n"
                + "      ,[subcategory_name]\n"
                + "  FROM [dbo].[SubCategory]";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int subcategoryId = rs.getInt("subcategory_id");
                int categoryId = rs.getInt("category_id");
                String subcategoryName = rs.getString("subcategory_name");

                Subcategory subcat = new Subcategory(subcategoryId, categoryId, subcategoryName);
                list.add(subcat);
            }
        } catch (Exception e) {
            System.out.println("error occur during retrieve subcategory using categoryId");
        }

        return list;
    }

    public ArrayList<Subcategory> getSubcategoryNameByCategoryId(int id) {
        ArrayList<Subcategory> list = new ArrayList<>();
        String sql = "SELECT [subcategory_id], [subcategory_name]\n"
                + "  FROM [dbo].[SubCategory] WHERE [category_id] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int subcategoryId = rs.getInt("subcategory_id");
                String subcategoryName = rs.getString("subcategory_name");

                Subcategory subcat = new Subcategory(subcategoryId, subcategoryName);
                list.add(subcat);
            }
        } catch (Exception e) {
            System.out.println("error occur during retrieve subcategory using categoryId");
        }

        return list;
    }

    public String getSubcategoryNameById(int id) {
        String name = "";
        String sql = "SELECT [subcategory_name]\n"
                + "  FROM [dbo].[SubCategory] WHERE [subcategory_id] = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                name = rs.getString("subcategory_name");

            }
        } catch (Exception e) {
            System.out.println("error occure during retrieve subcategory using subcategoryId");
        }

        return name;
    }
}
