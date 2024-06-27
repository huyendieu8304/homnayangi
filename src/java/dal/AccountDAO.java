/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
/**
 *
 * @author BKC
 */
public class AccountDAO extends DBContext {

    public Account getAccount(String username, String password) {
        String sql = "SELECT [account_id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "  FROM [dbo].[Account] WHERE [username] = ? AND [password] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt("account_id"), 
                                    rs.getString("username"), 
                                    rs.getString("password"), 
                                    rs.getInt("role_id"));
            }
            
        } catch (Exception e) {
        }
        
        
        return null;
    }
}
