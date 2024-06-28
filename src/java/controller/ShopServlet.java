/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.CategoryDAO;
import dal.IngredientDAO;
import dal.SubcategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Cart;
import model.Category;
import model.Ingredient;
import model.Subcategory;

/**
 *
 * @author BKC
 */
public class ShopServlet extends HttpServlet {

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
            out.println("<title>Servlet ShopServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopServlet at " + request.getContextPath() + "</h1>");
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
        //get category 
        CategoryDAO catdb = new CategoryDAO();
        ArrayList<Category> catlist = catdb.getAllCategory();
        request.setAttribute("catlist", catlist);
        
        //get subcategory 
        SubcategoryDAO subcatdb = new SubcategoryDAO();
        ArrayList<Subcategory> subcatlist = subcatdb.getAllSubcategory();
        request.setAttribute("subcatlist", subcatlist);
        
        IngredientDAO ingredientdb = new IngredientDAO();

        //get index in the end of the page
        String keyword = request.getParameter("keyword");
        String categoryIdRaw = request.getParameter("categoryId");
        String subcategoryIdRaw = request.getParameter("subcategoryId");
        String priceFromRaw = request.getParameter("priceFrom");
        String priceToRaw = request.getParameter("priceTo");
        int count = ingredientdb.countIngredient(keyword, categoryIdRaw,
                subcategoryIdRaw, priceFromRaw, priceToRaw);
        int pageSize = 9;
        int endPage = count / pageSize;
        if (count % pageSize != 0) {
            endPage++;
        }
        request.setAttribute("endIndex", endPage);

        //get ingredients to display
        String indexRaw = request.getParameter("index");
        ArrayList<Ingredient> list = ingredientdb.searchIngredient(
                keyword, categoryIdRaw, subcategoryIdRaw,
                priceFromRaw, priceToRaw, indexRaw, pageSize);
        request.setAttribute("list", list);

        //display current index in the end of page
        try {
            int currentIndex;
            if (indexRaw == null) {
                currentIndex = 1;
            } else {
                currentIndex = Integer.parseInt(indexRaw);
            }
            request.setAttribute("currentIndex", currentIndex);
        } catch (Exception e) {
        }
        
        
        request.getRequestDispatcher("shop.jsp").forward(request, response);

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
