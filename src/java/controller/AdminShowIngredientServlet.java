/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.CategoryDAO;
import dal.IngredientDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import model.Category;
import model.Ingredient;

/**
 *
 * @author BKC
 */
public class AdminShowIngredientServlet extends HttpServlet {
   
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
            out.println("<title>Servlet AdminShowIngredientServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminShowIngredientServlet at " + request.getContextPath () + "</h1>");
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
        //get category 
        CategoryDAO catdb = new CategoryDAO();
        ArrayList<Category> catlist = catdb.getAllCategory();
        session.setAttribute("catlist", catlist);
               
        IngredientDAO ingredientdb = new IngredientDAO();
        ArrayList<Ingredient> ingredientList = ingredientdb.getAllIngredients();
        request.setAttribute("ingredientList", ingredientList);
        request.getRequestDispatcher("adminIngredientManage.jsp").forward(request, response);
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
        IngredientDAO ingredientdb = new IngredientDAO();
        
        String keyword = request.getParameter("keyword");
        String categoryIdRaw = request.getParameter("categoryId");
        String subcategoryIdRaw = request.getParameter("subcategoryId");
        String priceFromRaw = request.getParameter("priceFrom");
        String priceToRaw = request.getParameter("priceTo");
        

        ArrayList<Ingredient> list = ingredientdb.searchIngredient(
                keyword, categoryIdRaw, subcategoryIdRaw,
                priceFromRaw, priceToRaw);
        request.setAttribute("ingredientList", list);
        request.getRequestDispatcher("adminIngredientManage.jsp").forward(request, response);
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
