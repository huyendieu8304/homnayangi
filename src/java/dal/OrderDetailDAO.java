/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Cart;
import model.OrderDetail;

/**
 *
 * @author BKC
 */
public class OrderDetailDAO extends DBContext {

    public void addOrderDetail(ArrayList<OrderDetail> orderDetails) {
        for (OrderDetail x : orderDetails) {
            String sql = "INSERT INTO [dbo].[OrderDetail]\n"
                    + "           ([order_id]\n"
                    + "           ,[ingredient_id]\n"
                    + "           ,[quantity]\n"
                    + "           ,[price])\n"
                    + "     VALUES\n"
                    + "           (?, ?, ?, ?)";
            try {
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, x.getOrderId());
                st.setInt(2, x.getIngredientId());
                st.setInt(3, x.getQuantity());
                st.setBigDecimal(4, x.getPrice());
                st.executeUpdate();
            } catch (Exception e) {
                System.out.println("Error occur while adding order detail to db");
                System.out.println(e);
            }
        }
    }
}
