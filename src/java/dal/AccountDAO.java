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

    public void addAnUserAccount(Account a) {
        String sql = "INSERT INTO [dbo].[Account]\n"
                + "           ([username]\n"
                + "           ,[password]\n"
                + "           ,[role_id]\n"
                + "           ,[fullname]\n"
                + "           ,[phone_number]\n"
                + "           ,[email])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setInt(3, a.getRoleId());
            st.setString(4, a.getFullname());
            st.setString(5, a.getPhoneNumber());
            st.setString(6, a.getEmail());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error occur while add an user to db");
            System.out.println(e);
        }
    }
    
    public boolean isUsernameExist(String username){
        String sql = "SELECT * FROM [dbo].[Account] WHERE [username] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean isEmailExist(String email){
        String sql = "SELECT * FROM [dbo].[Account] WHERE [email] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
}
