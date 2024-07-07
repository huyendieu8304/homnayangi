/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.IngredientDAO;
import dal.OrderDAO;
import dal.OrderDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author BKC
 */
public class UpdateOrderServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet UpdateOrderServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateOrderServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        
        OrderDAO orderdb = new OrderDAO();
        Order orderBasic = orderdb.getOrderById(orderId);
        request.setAttribute("orderBasic", orderBasic);
        
        OrderDetailDAO orderDetaildb = new OrderDetailDAO();
        ArrayList<OrderDetail> listOrderDetail = (ArrayList<OrderDetail>) orderDetaildb.getOrderDetailByOrderId(orderId);
        request.setAttribute("orderDetail", listOrderDetail);
        
        request.getRequestDispatcher("adminUpdateOrder.jsp").forward(request, response);
        
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Get parameters from the request
        String orderId = request.getParameter("orderId");
        String receiverFullname = request.getParameter("receiverFullname");
        String receiverPhoneNumber = request.getParameter("receiverPhoneNumber");
        String receiverEmail = request.getParameter("receiverEmail");
        String deliveryAddress = request.getParameter("deliveryAddress");
        String customerNote = request.getParameter("customerNote");
        String orderStatus = request.getParameter("orderStatus");
        
        OrderDetailDAO orderDetaildb = new OrderDetailDAO();
        IngredientDAO ingredientdb = new IngredientDAO();
        //the order are move from confirm to state shipping
        if (orderStatus.equals("shipping")) {
            //update stock
            
            ArrayList<OrderDetail> listOrderDetail = (ArrayList<OrderDetail>) orderDetaildb.getOrderDetailByOrderId(orderId);
            for (OrderDetail x : listOrderDetail) {
                int originalStockQuantity = x.getIngredient().getStockQuantity();
                x.getIngredient().setStockQuantity(originalStockQuantity - x.getQuantity());
                ingredientdb.updateAnIngredientById(x.getIngredientId(), x.getIngredient());
            }
        }
        
        Timestamp shipDate = null;
        
        //the order complete
        if (orderStatus.equals("completed")) {
            //get time complete
            shipDate = new Timestamp((new Date()).getTime());
        }
        
        
        if (customerNote.equals("")||customerNote == null) {
            customerNote = null;
        }
        Order o = new Order(receiverFullname, receiverPhoneNumber, receiverEmail,
                deliveryAddress, shipDate, customerNote, orderStatus);
        
        OrderDAO orderdb = new OrderDAO();
        orderdb.updateOrder(o, orderId);
        HttpSession session = request.getSession();
        session.setAttribute("numOfWaiting", orderdb.countOrderByStatus("waiting confirm"));
        session.setAttribute("numOfPreparing", orderdb.countOrderByStatus("preparing"));
        session.setAttribute("numOfShipping", orderdb.countOrderByStatus("shipping"));
        session.setAttribute("numOfCompleted", orderdb.countOrderByStatus("completed"));
        
        response.sendRedirect("ShowOrder");
    }

    
    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
