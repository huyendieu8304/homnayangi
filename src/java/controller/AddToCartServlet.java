/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.IngredientDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Cart;
import model.CartItem;
import model.Ingredient;

/**
 *
 * @author BKC
 */
public class AddToCartServlet extends HttpServlet {

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
            out.println("<title>Servlet AddToCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddToCartServlet at " + request.getContextPath() + "</h1>");
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
        
//        //information relate to cart
//        Cookie[] cookies = request.getCookies();
//        String txt = "";
//        //cookies existed
//        if (cookies != null) {
//            //iterate through all cookies
//            for (Cookie x : cookies) {
//                if (x.getName().equals("cart")) {
//                    txt += x.getValue();
//                    //remove the cart cookie
//                    x.setMaxAge(0);
//                    response.addCookie(x);
//                }
//            }
//        }
//
//        String quantity = request.getParameter("quantity");
//        String id = request.getParameter("id");
//        if ((id != null) && (quantity != null)) {
//            if (txt.isEmpty()) {
//                txt = id + ":" + quantity;
//            } else {
//                txt = txt + "/" + id + ":" + quantity;
//            }
//        }
//        Cookie c = new Cookie("cart", txt);
//        c.setMaxAge(2 * 24 * 60 * 60);
//        response.addCookie(c);
//
//        IngredientDAO ingredientdb = new IngredientDAO();
//        ArrayList<Ingredient> allIngredient = ingredientdb.getAllIngredients();
//        Cart cart = new Cart(txt, allIngredient);
        
//        //test
//        for (CartItem x : cart.cartItemList) {
//            System.out.println(x.getIngredient().getIngredientName());
//        }
//        
//        int cartSize = cart.getNumberOfItemInCart();

//        request.setAttribute("cartSize", cartSize);
        
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
     *
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
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
