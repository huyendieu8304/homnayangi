/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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

    public Account getAccountInfromation(int accountId) {
        String sql = "SELECT [account_id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "      ,[fullname]\n"
                + "      ,[phone_number]\n"
                + "      ,[email]\n"
                + "  FROM [dbo].[Account] WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, accountId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Account(rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_id"),
                        rs.getString("fullname"),
                        rs.getString("phone_number"),
                        rs.getString("email"));
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

    public boolean isUsernameExist(String username) {
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

    public boolean isEmailExist(String email) {
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

    public void updateAccountInfor(Account a, int accountId) {
        String sql = "UPDATE [dbo].[Account]\n"
                + "   SET [username] = ?"
                + "      ,[password] = ?"
                + "      ,[role_id] = ?"
                + "      ,[fullname] = ?"
                + "      ,[phone_number] = ?"
                + "      ,[email] = ?"
                + " WHERE account_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setInt(3, a.getRoleId());
            st.setString(4, a.getFullname());
            st.setString(5, a.getPhoneNumber());
            st.setString(6, a.getEmail());
            st.setInt(7, accountId);

            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error occur while updating account");
            System.out.println(e);
        }
    }

    public int countAccount() {
        String sql = "select count(*) from [Account]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return -1;
    }

    public ArrayList<Account> searchAccount(String username, String phoneNumber, String roleId) {
        ArrayList<Account> list = new ArrayList<>();
        String sql = "SELECT [account_id]\n"
                + "      ,[username]\n"
                + "      ,[password]\n"
                + "      ,[role_id]\n"
                + "      ,[fullname]\n"
                + "      ,[phone_number]\n"
                + "      ,[email]\n"
                + "  FROM [dbo].[Account] WHERE 1 = 1";

        if (username != null && !username.equals("")) {
            sql += "AND [username] LIKE N'%" + username + "%'";
        }
        if (phoneNumber != null && !phoneNumber.equals("")) {
            sql += "AND [phone_number] LIKE N'%" + phoneNumber + "%'";
        }
        if (roleId != null && !roleId.equals("")) {
            try {
                int role = Integer.parseInt(roleId);
                sql += "AND [role_id] = " + role ;
            } catch (Exception e) {
            }
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt("account_id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("role_id"),
                        rs.getString("fullname"),
                        rs.getString("phone_number"),
                        rs.getString("email")));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
