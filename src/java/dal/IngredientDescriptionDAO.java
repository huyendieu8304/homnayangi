/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.IngredientDescription;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author BKC
 */
public class IngredientDescriptionDAO extends DBContext {

    public void addAnIngredientDescription(IngredientDescription des) {
        String sql = "INSERT INTO [dbo].[IngredientDescription]\n"
                + "           ([ingredient_id]\n"
                + "           ,[heading]\n"
                + "           ,[content])\n"
                + "     VALUES\n"
                + "           (?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, des.getIngredientId());
            st.setString(2, des.getHeading());
            st.setString(3, des.getContent());
            st.executeUpdate();

        } catch (Exception e) {
            System.out.println("Having error while add a new ingredient description");
        }
    }

    public ArrayList<IngredientDescription> getIngredientDescriptionById(int id) {
        String sql = "SELECT [ingredient_id]\n"
                + "      ,[heading]\n"
                + "      ,[content]\n"
                + "  FROM [dbo].[IngredientDescription] WHERE [ingredient_id] = ?";
        ArrayList<IngredientDescription> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String heading = rs.getString("heading");
                String content = rs.getString("content");

                IngredientDescription des = new IngredientDescription(heading, content);
                list.add(des);
            }

        } catch (Exception e) {
            System.out.println("Having error while retrieve ingredient description by id");

        }

        return list;
    }
}
