/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Ingredient;
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

    public List<OrderDetail> getOrderDetailByOrderId(String orderId) {
        ArrayList<OrderDetail> listOrderDetail = new ArrayList<>();
        String sql = "SELECT i.[ingredient_id], i.ingredient_name, i.quantity_per_unit,\n"
                + "i.[category_id], i.[subcategory_id], i.unit, i.stock_quantity, i.image_url, o.quantity, o.price\n"
                + "FROM [dbo].[OrderDetail] o JOIN [dbo].[Ingredient] i\n"
                + "	ON o.ingredient_id = i.ingredient_id\n"
                + "WHERE order_id = ?";
         try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, orderId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int quantity = rs.getInt("quantity");

                int ingredientId = rs.getInt("ingredient_id");
                String ingredientName = rs.getString("ingredient_name");
                int categoryId = rs.getInt("category_id");
                int subcategoryId = rs.getInt("subcategory_id");
                String unit = rs.getString("unit");
                float quantityPerUnit = rs.getFloat("quantity_per_unit");
                BigDecimal price = rs.getBigDecimal("price");
                int stockQuantity = rs.getInt("stock_quantity");
                String imageUrl = rs.getString("image_url");
                Ingredient i = new Ingredient(ingredientId, ingredientName,
                        categoryId, subcategoryId, unit, quantityPerUnit, price,
                        stockQuantity, imageUrl);
                
                OrderDetail o = new OrderDetail(orderId, i, quantity, price);
                listOrderDetail.add(o);
            }
        } catch (Exception e) {
            System.out.println("Having error while retrive order detail of an order");
            System.out.println(e);
        }
         return listOrderDetail;
    }
}
