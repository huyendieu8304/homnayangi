/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author BKC
 */
public class SubcategoryDAO extends DBContext {

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
        }
        
        return name;
    }
}
