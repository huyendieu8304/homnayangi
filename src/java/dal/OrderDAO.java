/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Order;

/**
 *
 * @author BKC
 */
public class OrderDAO extends DBContext {

    public void addAnOrder(Order o) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([order_id]\n"
                + "           ,[account_id]\n"
                + "           ,[receiver_fullname]\n"
                + "           ,[receiver_phone_number]\n"
                + "           ,[receiver_email]\n"
                + "           ,[delivery_address]\n"
                + "           ,[order_date]\n"
                + "           ,[customer_note]\n"
                + "           ,[order_status])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, o.getOrderId());
            st.setInt(2, o.getAccountId());
            st.setString(3, o.getReceiverFullname());
            st.setString(4, o.getReceiverPhoneNumber());
            st.setString(5, o.getReceiverEmail());
            st.setString(6, o.getDeliveryAddress());
            st.setTimestamp(7, o.getOrderDate());;
            st.setString(8, o.getCustomerNote());
            st.setString(9, o.getOrderStatus());
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error occur while create an order to db");
            System.out.println(e);
        }

    }
}
