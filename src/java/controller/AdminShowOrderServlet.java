/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import model.Order;

/**
 *
 * @author BKC
 */
@WebServlet(name = "AdminShowOrderServlet", urlPatterns = {"/ShowOrder"})
public class AdminShowOrderServlet extends HttpServlet {

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
            out.println("<title>Servlet AdminShowOrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminShowOrderServlet at " + request.getContextPath() + "</h1>");
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
        OrderDAO orderdb = new OrderDAO();
        
        HttpSession session = request.getSession();
        session.setAttribute("numOfWaiting", orderdb.countOrderByStatus("waiting confirm"));
        session.setAttribute("numOfPreparing", orderdb.countOrderByStatus("preparing"));
        session.setAttribute("numOfShipping", orderdb.countOrderByStatus("shipping"));
        session.setAttribute("numOfCompleted", orderdb.countOrderByStatus("completed"));

        ArrayList<Order> orderList = (ArrayList<Order>) orderdb.getOrder(null, null, null, null, null, null, null);

        request.setAttribute("orderList", orderList);
        request.getRequestDispatcher("adminOrderManage.jsp").forward(request, response);
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

        String orderId = request.getParameter("orderId");
//        String date = request.getParameter("orderDateFrom");
        Date orderDateFrom = parseDate(request.getParameter("orderDateFrom"));
        Date orderDateTo = parseDate(request.getParameter("orderDateTo"));
        Date shipDateFrom = parseDate(request.getParameter("shipDateFrom"));
        Date shipDateTo = parseDate(request.getParameter("shipDateTo"));
        String orderStatus = request.getParameter("orderStatus");

        OrderDAO orderdb = new OrderDAO();
        ArrayList<Order> orders = (ArrayList<Order>) orderdb.getOrder(orderId, null, orderDateFrom, orderDateTo,
                                               shipDateFrom, shipDateTo, orderStatus);
        request.setAttribute("orderList", orders);
        request.getRequestDispatcher("adminOrderManage.jsp").forward(request, response);
        
    }

    private Date parseDate(String dateStr) {
        if (dateStr == null || dateStr.isEmpty()) {
            return null;
        }
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
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
