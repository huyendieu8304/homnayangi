/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author BKC
 */
public class RemoveFromCartServlet extends HttpServlet {
   
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
            out.println("<title>Servlet RemoveFromCartServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RemoveFromCartServlet at " + request.getContextPath () + "</h1>");
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");

        String idRaw = request.getParameter("ingredientId");

        //get user's cart size
        CartDAO cartdb = new CartDAO();
        try {
            int ingredientId = Integer.parseInt(idRaw);
            
            cartdb.removeItemFromUserCart(account.getAccountId(), ingredientId);
            
        } catch (Exception e) {
            System.out.println("Having error while delete from cart (servlet)");
            System.out.println(e);
        }
        
        session.setAttribute("cartSize", cartdb.countItemsInCartOfUser(account.getAccountId()));

        // get the URL from the Referer in Header
        String referer = request.getHeader("Referer");
        String fragment = request.getParameter("previousPageFragment");

        // If there are fragment, add to URL
        if (referer != null && !referer.isEmpty()) {
            if (fragment != null && !fragment.isEmpty()) {
                referer += fragment;
            }
            response.sendRedirect(referer);
        } else {
            // if there aren't referer, redirect to home page
            response.sendRedirect("home");
        }
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
        processRequest(request, response);
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
