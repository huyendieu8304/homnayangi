/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CartDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;
import java.sql.Timestamp;
import model.Account;
import model.Cart;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author BKC
 */
public class CreateOrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateOrderServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        String[] ingredientIds = request.getParameterValues("ingredientId");

        CartDAO cartdb = new CartDAO();
        ArrayList<Cart> orderCart = new ArrayList<>();
        for (String x : ingredientIds) {
            try {
                int id = Integer.parseInt(x);
                Cart c = cartdb.getCartItemsInCartOfUser(id, account.getAccountId());
                orderCart.add(c);
            } catch (Exception e) {
            }
        }
//        request.setAttribute("order", orderCart);
        //remove order trước đó
        session.removeAttribute("order");
        session.setAttribute("order", orderCart);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        String orderId = generateOrderID();
        String receiverFullname = request.getParameter("receiverFullname").trim();
        String receiverPhoneNumber = request.getParameter("receiverPhoneNumber").trim();
        String receiverEmail = request.getParameter("receiverEmail").trim();
        String deliveryAddress = request.getParameter("deliveryAddress").trim();
        String customerNote = request.getParameter("customerNote").trim();
        Date orderDate = new Date();
        // Convert java.util.Date to java.sql.Timestamp
        Timestamp timestamp = new Timestamp(orderDate.getTime());

        if (customerNote.equals("")) {
            customerNote = null;
        }

        Order o = new Order(orderId, account.getAccountId(),
                receiverFullname, receiverPhoneNumber, receiverEmail,
                deliveryAddress, timestamp, customerNote, "waiting confirm");

        OrderDAO orderdb = new OrderDAO();
        int result = orderdb.addAnOrder(o);

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        if (result != -1) {
            ArrayList<Cart> order = (ArrayList<Cart>) session.getAttribute("order");
            ArrayList<OrderDetail> orderDetails = new ArrayList<>();
            for (Cart x : order) {
                OrderDetail orderItem = new OrderDetail(orderId,
                        x.getIngredient().getIngredientId(),
                        x.getQuantity(), x.getIngredient().getPrice());
                orderDetails.add(orderItem);
            }
            OrderDetailDAO orderDetaildb = new OrderDetailDAO();
            orderDetaildb.addOrderDetail(orderDetails);

            CartDAO cartdb = new CartDAO();
            cartdb.removeItemsFromUserCart(order);

            //get user's cart size
            session.setAttribute("cartSize", cartdb.countItemsInCartOfUser(account.getAccountId()));

            try (PrintWriter out = response.getWriter()) {

                // Inform user of successful registration
                out.print("success|Đã thành công tạo đơn hàng: " + orderId + ", trong lúc chờ thông báo tiếp theo, quý khách có thể tiếp tục mua hàng");
            }
        } else {
            try (PrintWriter out = response.getWriter()) {

                // Inform user of successful registration
                out.print("error|Đã có lỗi xảy ra khi tạo đơn hàng, mời quay lại sau");
            }
        }

    }

    private String generateOrderID() {
        return UUID.randomUUID().toString();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
