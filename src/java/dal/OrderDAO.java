/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

//import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import model.Order;

/**
 *
 * @author BKC
 */
public class OrderDAO extends DBContext {

    public int addAnOrder(Order o) {
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
            return st.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error occur while create an order to db");
            System.out.println(e);
        }
        return -1;
    }

//    public List<Order> getOrder(String orderId,
//            Date orderDateFrom, Date orderDateTo,
//            Date shipDateFrom, Date shipDateTo, String orderStatus) {
//        List<Order> list = new ArrayList<Order>();
//        String sql = "SELECT [order_id]\n"
//                + "      ,[account_id]\n"
//                + "      ,[receiver_fullname]\n"
//                + "      ,[receiver_phone_number]\n"
//                + "      ,[receiver_email]\n"
//                + "      ,[delivery_address]\n"
//                + "      ,[order_date]\n"
//                + "      ,[ship_date]\n"
//                + "      ,[customer_note]\n"
//                + "      ,[order_status]\n"
//                + "  FROM [dbo].[Order] WHERE 1 = 1";
//        if (orderId != null && !orderId.equals("")) {
//            sql += " AND [order_id] = '" + orderId + "'";
//        }
//
////        if (accountId != null && !accountId.equals("")) {
////            try {
////                int accId = Integer.parseInt(accountId);
////                sql += " AND [account_id] = " + accId;
////            } catch (Exception e) {
////                System.out.println("error while parsing account id");
////                System.out.println(e);
////            }
////        }
//        if (orderDateFrom != null) {
//            sql += "AND [order_date] >= " + new Timestamp(orderDateFrom.getTime());
//        }
//
//        if (orderDateTo != null) {
//            sql += "AND [order_date] <= " + new Timestamp(orderDateTo.getTime());
//        }
//
//        if (shipDateFrom != null) {
//            sql += "AND [ship_date] >= " + new Timestamp(shipDateFrom.getTime());
//        }
//
//        if (shipDateTo != null) {
//            sql += "AND [ship_date] <= " + new Timestamp(shipDateTo.getTime());
//        }
//
//        if (orderStatus != null && orderStatus.equals("")) {
//            sql += "AND [order_status] = '" + orderStatus + "'";
//        }
//
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            ResultSet rs = st.executeQuery();
//            while (rs.next()) {
//                String oId = rs.getString("order_id");
//                int accId = rs.getInt("account_id");
//                String receiverFullname = rs.getString("receiver_fullname");
//                String receiverPhoneNumber = rs.getString("receiver_phone_number");
//                String receiverEmail = rs.getString("receiver_email");
//                String deliveryAddress = rs.getString("delivery_address");
//                Date orderDateRaw = rs.getDate("order_date");
//                Timestamp orderDate = new Timestamp(orderDateRaw.getTime());
//                Date shipDateRaw = rs.getDate("ship_date");
//                Timestamp shipDate = null;
//                if (shipDateRaw != null) {
//                    shipDate = new Timestamp(shipDateRaw.getTime());
//                }
//                String customerNote = rs.getString("customer_note");
//                String oStatus = rs.getString("order_status");
//
//                Order o = new Order(oId, accId, receiverFullname, receiverPhoneNumber,
//                        receiverEmail, deliveryAddress, orderDate, shipDate,
//                        customerNote, oStatus);
//
//                list.add(o);
//            }
//        } catch (Exception e) {
//            System.out.println("Error occur while retrieve order from database");
//            System.out.println(e);
//        }
//        return list;
//    }
    public List<Order> getOrder(String orderId, Integer accountId, Date orderDateFrom, Date orderDateTo,
            Date shipDateFrom, Date shipDateTo, String orderStatus) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT [order_id], [account_id], [receiver_fullname], [receiver_phone_number], "
                + "[receiver_email], [delivery_address], [order_date], [ship_date], "
                + "[customer_note], [order_status] FROM [dbo].[Order] WHERE 1 = 1";

        if (orderId != null && !orderId.isEmpty()) {
            sql += " AND [order_id] = ?";
        }

        if (accountId != null) {
            sql += " AND [account_id] = " + accountId;
        }

        if (orderDateFrom != null) {
            sql += " AND [order_date] >= ?";
        }

        if (orderDateTo != null) {
            sql += " AND [order_date] <= ?";
        }

        if (shipDateFrom != null) {
            sql += " AND [ship_date] >= ?";
        }

        if (shipDateTo != null) {
            sql += " AND [ship_date] <= ?";
        }

        if (orderStatus != null && !orderStatus.isEmpty()) {
            sql += " AND [order_status] = ?";
        }

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            int index = 1;

            if (orderId != null && !orderId.isEmpty()) {
                st.setString(index++, orderId);
            }

            if (orderDateFrom != null) {
                st.setTimestamp(index++, new Timestamp(orderDateFrom.getTime()));
            }

            if (orderDateTo != null) {
                st.setTimestamp(index++, new Timestamp(orderDateTo.getTime()));
            }

            if (shipDateFrom != null) {
                st.setTimestamp(index++, new Timestamp(shipDateFrom.getTime()));
            }

            if (shipDateTo != null) {
                st.setTimestamp(index++, new Timestamp(shipDateTo.getTime()));
            }

            if (orderStatus != null && !orderStatus.isEmpty()) {
                st.setString(index++, orderStatus);
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String oId = rs.getString("order_id");
                int accId = rs.getInt("account_id");
                String receiverFullname = rs.getString("receiver_fullname");
                String receiverPhoneNumber = rs.getString("receiver_phone_number");
                String receiverEmail = rs.getString("receiver_email");
                String deliveryAddress = rs.getString("delivery_address");
                Timestamp orderDate = rs.getTimestamp("order_date");
                Timestamp shipDate = rs.getTimestamp("ship_date");
                String customerNote = rs.getString("customer_note");
                String oStatus = rs.getString("order_status");

                Order o = new Order(oId, accId, receiverFullname, receiverPhoneNumber,
                        receiverEmail, deliveryAddress, orderDate, shipDate,
                        customerNote, oStatus);

                list.add(o);
            }
        } catch (Exception e) {
            System.out.println("Error occur while retrieve order from database");
            System.out.println(e);
        }
        return list;
    }

    public Order getOrderById(String orderId) {
        String sql = "SELECT [order_id]\n"
                + "      ,[account_id]\n"
                + "      ,[receiver_fullname]\n"
                + "      ,[receiver_phone_number]\n"
                + "      ,[receiver_email]\n"
                + "      ,[delivery_address]\n"
                + "      ,[order_date]\n"
                + "      ,[ship_date]\n"
                + "      ,[customer_note]\n"
                + "      ,[order_status]\n"
                + "  FROM [dbo].[Order] WHERE [order_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, orderId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String oId = rs.getString("order_id");
                int accId = rs.getInt("account_id");
                String receiverFullname = rs.getString("receiver_fullname");
                String receiverPhoneNumber = rs.getString("receiver_phone_number");
                String receiverEmail = rs.getString("receiver_email");
                String deliveryAddress = rs.getString("delivery_address");
                Date orderDateRaw = rs.getDate("order_date");
                Timestamp orderDate = new Timestamp(orderDateRaw.getTime());
                Date shipDateRaw = rs.getDate("ship_date");
                Timestamp shipDate = null;
                if (shipDateRaw != null) {
                    shipDate = new Timestamp(shipDateRaw.getTime());
                }
                String customerNote = rs.getString("customer_note");
                String oStatus = rs.getString("order_status");

                return new Order(oId, accId, receiverFullname, receiverPhoneNumber,
                        receiverEmail, deliveryAddress, orderDate, shipDate,
                        customerNote, oStatus);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int countOrderByStatus(String status) {
        String sql = "SELECT COUNT(*) FROM [dbo].[Order] WHERE [order_status] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Error occur while counting order from database");
            System.out.println(e);
        }
        return -1;
    }

    public void updateOrder(Order o, String orderId) {
        String sql = "UPDATE [dbo].[Order]\n"
                + "   SET [receiver_fullname] = ?\n"
                + "      ,[receiver_phone_number] = ?\n"
                + "      ,[receiver_email] = ?\n"
                + "      ,[delivery_address] = ?\n"
                + "      ,[ship_date] = ?\n"
                + "      ,[customer_note] = ?\n"
                + "      ,[order_status] = ?\n"
                + " WHERE [order_id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, o.getReceiverFullname());
            st.setString(2, o.getReceiverPhoneNumber());
            st.setString(3, o.getReceiverEmail());
            st.setString(4, o.getDeliveryAddress());

            if (o.getShipDate() != null) {
                st.setDate(5, new java.sql.Date(o.getShipDate().getTime()));
            } else {
                st.setNull(5, java.sql.Types.DATE);
            }
            st.setString(6, o.getCustomerNote());
            st.setString(7, o.getOrderStatus());
            st.setString(8, orderId);
            st.executeUpdate();
        } catch (Exception e) {
            System.out.println("error occur while updating an order in db");
            System.out.println(e);
        }

    }
}
